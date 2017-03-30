/*jshint node:true*/
"use strict";

module.exports = function(grunt) {
  grunt.loadNpmTasks('grunt-xmllint');

  grunt.initConfig({

    xmllint: {
      stylesheets: {
        dir: 'xsl',
        options: {
          suffixes: [ 'xsl' ],
        },
      },
    },

  });

  grunt.registerTask('test', [ 'xmllint' ]);
  grunt.registerTask('default', [ 'test' ]);
}

