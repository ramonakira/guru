import riot from 'rollup-plugin-riot'
import buble from 'rollup-plugin-buble'
import cjs from 'rollup-plugin-commonjs'
import globals from 'rollup-plugin-node-globals'
import resolve from 'rollup-plugin-node-resolve'
import progress from 'rollup-plugin-progress';
import filesize from 'rollup-plugin-filesize'
import uglify from 'rollup-plugin-uglify';
import conditional from "rollup-plugin-conditional";
import builtins from 'rollup-plugin-node-builtins';

const isProduction = process.env.BUILD_TARGET === "PROD";


const plugins = [
    builtins(),
    riot(),
    buble(),
    cjs({
        exclude: 'node_modules/process-es6/**',
        include: []
    }),
    globals(),
    resolve({
        browser: true,
        main: true
    }),
    progress(),
    conditional(isProduction, [
        uglify(),
        filesize()
    ])
];

export default [ {
  input: 'src/entry.js',
  output: {
    file: isProduction ? 'dist/guru.min.js' : 'dist/guru.js',
    format: 'iife',
  },
  plugins
}]
