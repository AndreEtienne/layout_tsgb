let fs = require('fs'),
    path = require('path'),
    args = process.argv.slice(2),
    filetypes = args[1],
    dir = args[0],
    files;

files = fs.readdirSync(dir);

files.filter(function(file) {
  let exts = path.basename(file).split('.');
  let allowedFiletypes = filetypes.split(',');
  return exts.length === 3 && (allowedFiletypes.indexOf(path.extname(file).slice(1)) > -1);
}).forEach(function(file) {

  let replaceExt = path.basename(file).split('.')[1] + '.';
  let filePath = path.join(dir, file),
      newFilePath = path.join(dir, file.replace(replaceExt, ''));

  fs.renameSync(filePath, newFilePath);
});