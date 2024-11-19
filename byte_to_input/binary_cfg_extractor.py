import os
from binary_extractor.analysis.graph import CFGGraph
from binary_extractor.platforms.ETH.cfg import EthereumCFG
from shutil import copyfile
import sys
def main():
    fileList1 = os.listdir("bytecode_labelled/timestamp/")
    fileList = []
    for file_name in fileList1:
        if '.txt' in file_name:
            fileList.append(file_name)

    currentpath = os.getcwd()

    for file_name in fileList:
        f = open('bytecode_labelled/timestamp/' + file_name, 'r')

        # global bytecode_hex
        bytecode_hex = f.read()
        f.close()

        # create the CFG
        cfg = EthereumCFG(bytecode_hex)

        # generic visualization api
        graph = CFGGraph(cfg)
        graph.view()

        print(file_name + " is done!")

        os.chdir(currentpath)
        cfgList = os.listdir("binary_cfg_code/timestamp/")
        cfgList.sort(key=lambda x: int(''.join(filter(str.isdigit, x))))


        if (str(file_name)[0:-4] + '.' + 'txt') not in cfgList:
            copyfile('graph.cfg.gv',
                     'binary_cfg_code/timestamp/' + str(file_name)[0:-4] + '.' + 'txt')
            os.chdir("binary_cfg_code/timestamp/")
            print(str(file_name)[0:-4])

        os.chdir(currentpath)


if __name__ == '__main__':
    main()