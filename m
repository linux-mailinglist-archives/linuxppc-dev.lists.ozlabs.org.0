Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE0C19F3A8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 12:38:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wn7k6qspzDqjb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 20:38:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wn5j0TkyzDqfX
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 20:36:40 +1000 (AEST)
IronPort-SDR: RCTZfz7oVUO0MM+0GeZDwCilNiNPrC86ITZH45wZb+htfcKzW6fG02KiyoGpkUTvfol7rt2+hG
 S7XuA0R+OgKQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 03:36:37 -0700
IronPort-SDR: KmDQjl1Ly6PVlDladBsClXjsPiSRMyQ9sZdtLnc36AzjWeKQxiuYP8tid8kZCyaV3bTdG4wCs5
 l9GCycWd5YAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; 
 d="gz'50?scan'50,208,50";a="239576222"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 06 Apr 2020 03:36:34 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jLP7J-0000I2-Qr; Mon, 06 Apr 2020 18:36:33 +0800
Date: Mon, 6 Apr 2020 18:35:47 +0800
From: kbuild test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v5 09/21] powerpc: Use a datatype for instructions
Message-ID: <202004061809.GzWaddDM%lkp@intel.com>
References: <20200406080936.7180-10-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <20200406080936.7180-10-jniethe5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: kbuild-all@lists.01.org, Jordan Niethe <jniethe5@gmail.com>,
 npiggin@gmail.com, bala24@linux.ibm.com, alistair@popple.id.au,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jordan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.6]
[cannot apply to powerpc/next kvm-ppc/kvm-ppc-next scottwood/next next-20200406]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Jordan-Niethe/Initial-Prefixed-Instruction-support/20200406-165215
base:    7111951b8d4973bda27ff663f2cf18b663d15b48
config: powerpc-allnoconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=9.3.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/asm-compat.h:6,
                    from arch/powerpc/include/asm/bitops.h:42,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from arch/powerpc/kernel/setup_32.c:6:
   arch/powerpc/kernel/setup_32.c: In function 'machine_init':
>> arch/powerpc/include/asm/ppc-opcode.h:234:24: error: incompatible type for argument 2 of 'patch_instruction_site'
     234 | #define PPC_INST_NOP   0x60000000
         |                        ^~~~~~~~~~
         |                        |
         |                        int
>> arch/powerpc/kernel/setup_32.c:89:49: note: in expansion of macro 'PPC_INST_NOP'
      89 |  patch_instruction_site(&patch__memcpy_nocache, PPC_INST_NOP);
         |                                                 ^~~~~~~~~~~~
   In file included from arch/powerpc/kernel/setup_32.c:42:
   arch/powerpc/include/asm/code-patching.h:39:69: note: expected 'struct ppc_inst' but argument is of type 'int'
      39 | static inline int patch_instruction_site(s32 *site, struct ppc_inst instr)
         |                                                     ~~~~~~~~~~~~~~~~^~~~~
>> arch/powerpc/kernel/setup_32.c:91:48: error: passing argument 1 of 'branch_target' from incompatible pointer type [-Werror=incompatible-pointer-types]
      91 |  create_cond_branch(&insn, addr, branch_target(addr), 0x820000);
         |                                                ^~~~
         |                                                |
         |                                                unsigned int *
   In file included from arch/powerpc/kernel/setup_32.c:42:
   arch/powerpc/include/asm/code-patching.h:63:52: note: expected 'const struct ppc_inst *' but argument is of type 'unsigned int *'
      63 | unsigned long branch_target(const struct ppc_inst *instr);
         |                             ~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   arch/powerpc/kernel/setup_32.c:91:28: error: passing argument 2 of 'create_cond_branch' from incompatible pointer type [-Werror=incompatible-pointer-types]
      91 |  create_cond_branch(&insn, addr, branch_target(addr), 0x820000);
         |                            ^~~~
         |                            |
         |                            unsigned int *
   In file included from arch/powerpc/kernel/setup_32.c:42:
   arch/powerpc/include/asm/code-patching.h:28:71: note: expected 'const struct ppc_inst *' but argument is of type 'unsigned int *'
      28 | int create_cond_branch(struct ppc_inst *instr, const struct ppc_inst *addr,
         |                                                ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/powerpc/kernel/setup_32.c:92:20: error: passing argument 1 of 'patch_instruction' from incompatible pointer type [-Werror=incompatible-pointer-types]
      92 |  patch_instruction(addr, insn); /* replace b by bne cr0 */
         |                    ^~~~
         |                    |
         |                    unsigned int *
   In file included from arch/powerpc/kernel/setup_32.c:42:
   arch/powerpc/include/asm/code-patching.h:31:40: note: expected 'struct ppc_inst *' but argument is of type 'unsigned int *'
      31 | int patch_instruction(struct ppc_inst *addr, struct ppc_inst instr);
         |                       ~~~~~~~~~~~~~~~~~^~~~
   cc1: all warnings being treated as errors

vim +/patch_instruction_site +234 arch/powerpc/include/asm/ppc-opcode.h

9123c5ed45a583 Hongtao Jia          2013-04-28  193  
16c57b3620d77e Kumar Gala           2009-02-10  194  /* sorted alphabetically */
95213959aefc94 Anshuman Khandual    2013-04-22  195  #define PPC_INST_BHRBE			0x7c00025c
95213959aefc94 Anshuman Khandual    2013-04-22  196  #define PPC_INST_CLRBHRB		0x7c00035c
07d2a628bc0008 Nicholas Piggin      2017-06-09  197  #define PPC_INST_COPY			0x7c20060c
8a649045e75a4b Chris Smart          2016-04-26  198  #define PPC_INST_CP_ABORT		0x7c00068c
e66ca3db5917f4 Matt Brown           2017-08-04  199  #define PPC_INST_DARN			0x7c0005e6
16c57b3620d77e Kumar Gala           2009-02-10  200  #define PPC_INST_DCBA			0x7c0005ec
16c57b3620d77e Kumar Gala           2009-02-10  201  #define PPC_INST_DCBA_MASK		0xfc0007fe
16c57b3620d77e Kumar Gala           2009-02-10  202  #define PPC_INST_DCBAL			0x7c2005ec
16c57b3620d77e Kumar Gala           2009-02-10  203  #define PPC_INST_DCBZL			0x7c2007ec
1afc149def25ac Tony Breeds          2012-10-02  204  #define PPC_INST_ICBT			0x7c00002c
edc424f8cd84bb Dan Streetman        2015-05-07  205  #define PPC_INST_ICSWX			0x7c00032d
edc424f8cd84bb Dan Streetman        2015-05-07  206  #define PPC_INST_ICSWEPX		0x7c00076d
16c57b3620d77e Kumar Gala           2009-02-10  207  #define PPC_INST_ISEL			0x7c00001e
16c57b3620d77e Kumar Gala           2009-02-10  208  #define PPC_INST_ISEL_MASK		0xfc00003e
864b9e6fd76489 Anton Blanchard      2010-02-10  209  #define PPC_INST_LDARX			0x7c0000a8
156d0e290e969c Naveen N. Rao        2016-06-22  210  #define PPC_INST_STDCX			0x7c0001ad
350779a29f11f8 Paul Mackerras       2017-08-30  211  #define PPC_INST_LQARX			0x7c000228
350779a29f11f8 Paul Mackerras       2017-08-30  212  #define PPC_INST_STQCX			0x7c00016d
16c57b3620d77e Kumar Gala           2009-02-10  213  #define PPC_INST_LSWI			0x7c0004aa
16c57b3620d77e Kumar Gala           2009-02-10  214  #define PPC_INST_LSWX			0x7c00042a
d6ccb1f55ddf51 Kumar Gala           2010-03-10  215  #define PPC_INST_LWARX			0x7c000028
156d0e290e969c Naveen N. Rao        2016-06-22  216  #define PPC_INST_STWCX			0x7c00012d
16c57b3620d77e Kumar Gala           2009-02-10  217  #define PPC_INST_LWSYNC			0x7c2004ac
9863c28a2af90a James Yang           2013-07-03  218  #define PPC_INST_SYNC			0x7c0004ac
9863c28a2af90a James Yang           2013-07-03  219  #define PPC_INST_SYNC_MASK		0xfc0007fe
ddc6cd0d70a6f9 Christophe Leroy     2016-05-17  220  #define PPC_INST_ISYNC			0x4c00012c
dfb432cb960bfc Michael Neuling      2009-04-29  221  #define PPC_INST_LXVD2X			0x7c000698
16c57b3620d77e Kumar Gala           2009-02-10  222  #define PPC_INST_MCRXR			0x7c000400
16c57b3620d77e Kumar Gala           2009-02-10  223  #define PPC_INST_MCRXR_MASK		0xfc0007fe
16c57b3620d77e Kumar Gala           2009-02-10  224  #define PPC_INST_MFSPR_PVR		0x7c1f42a6
178f358208ceb8 Anton Blanchard      2017-01-19  225  #define PPC_INST_MFSPR_PVR_MASK		0xfc1ffffe
e16c8765533a15 Andy Fleming         2011-12-08  226  #define PPC_INST_MFTMR			0x7c0002dc
16c57b3620d77e Kumar Gala           2009-02-10  227  #define PPC_INST_MSGSND			0x7c00019c
755563bc79c764 Paul Mackerras       2015-03-19  228  #define PPC_INST_MSGCLR			0x7c0001dc
6b3edefefa6752 Nicholas Piggin      2017-04-13  229  #define PPC_INST_MSGSYNC		0x7c0006ec
42d02b81f265b7 Ian Munsie           2012-11-14  230  #define PPC_INST_MSGSNDP		0x7c00011c
a9af97aa0a12c3 Nicholas Piggin      2017-06-13  231  #define PPC_INST_MSGCLRP		0x7c00015c
4bb3c7a0208fc1 Paul Mackerras       2018-03-21  232  #define PPC_INST_MTMSRD			0x7c000164
e16c8765533a15 Andy Fleming         2011-12-08  233  #define PPC_INST_MTTMR			0x7c0003dc
16c57b3620d77e Kumar Gala           2009-02-10 @234  #define PPC_INST_NOP			0x60000000
07d2a628bc0008 Nicholas Piggin      2017-06-09  235  #define PPC_INST_PASTE			0x7c20070d
16c57b3620d77e Kumar Gala           2009-02-10  236  #define PPC_INST_POPCNTB		0x7c0000f4
16c57b3620d77e Kumar Gala           2009-02-10  237  #define PPC_INST_POPCNTB_MASK		0xfc0007fe
b5f9b6665b70b4 Anton Blanchard      2010-12-07  238  #define PPC_INST_POPCNTD		0x7c0003f4
b5f9b6665b70b4 Anton Blanchard      2010-12-07  239  #define PPC_INST_POPCNTW		0x7c0002f4
4bb3c7a0208fc1 Paul Mackerras       2018-03-21  240  #define PPC_INST_RFEBB			0x4c000124
16c57b3620d77e Kumar Gala           2009-02-10  241  #define PPC_INST_RFCI			0x4c000066
16c57b3620d77e Kumar Gala           2009-02-10  242  #define PPC_INST_RFDI			0x4c00004e
4bb3c7a0208fc1 Paul Mackerras       2018-03-21  243  #define PPC_INST_RFID			0x4c000024
16c57b3620d77e Kumar Gala           2009-02-10  244  #define PPC_INST_RFMCI			0x4c00004c
cd99ddbea250ee Christophe Leroy     2018-01-12  245  #define PPC_INST_MFSPR			0x7c0002a6
efcac6589a277c Alexey Kardashevskiy 2011-03-02  246  #define PPC_INST_MFSPR_DSCR		0x7c1102a6
178f358208ceb8 Anton Blanchard      2017-01-19  247  #define PPC_INST_MFSPR_DSCR_MASK	0xfc1ffffe
efcac6589a277c Alexey Kardashevskiy 2011-03-02  248  #define PPC_INST_MTSPR_DSCR		0x7c1103a6
178f358208ceb8 Anton Blanchard      2017-01-19  249  #define PPC_INST_MTSPR_DSCR_MASK	0xfc1ffffe
73d2fb758e678c Anton Blanchard      2013-05-01  250  #define PPC_INST_MFSPR_DSCR_USER	0x7c0302a6
178f358208ceb8 Anton Blanchard      2017-01-19  251  #define PPC_INST_MFSPR_DSCR_USER_MASK	0xfc1ffffe
73d2fb758e678c Anton Blanchard      2013-05-01  252  #define PPC_INST_MTSPR_DSCR_USER	0x7c0303a6
178f358208ceb8 Anton Blanchard      2017-01-19  253  #define PPC_INST_MTSPR_DSCR_USER_MASK	0xfc1ffffe
6dd7a82cc54ebd Anton Blanchard      2016-07-01  254  #define PPC_INST_MFVSRD			0x7c000066
6dd7a82cc54ebd Anton Blanchard      2016-07-01  255  #define PPC_INST_MTVSRD			0x7c000166
d16952a629129c Christophe Leroy     2018-11-09  256  #define PPC_INST_SC			0x44000002
697d3899dcb4bc Paul Mackerras       2011-12-12  257  #define PPC_INST_SLBFEE			0x7c0007a7
09cf5bcb0c9355 Aneesh Kumar K.V     2016-07-13  258  #define PPC_INST_SLBIA			0x7c0003e4
16c57b3620d77e Kumar Gala           2009-02-10  259  

:::::: The code at line 234 was first introduced by commit
:::::: 16c57b3620d77e0bc981da5ef32beae730512684 powerpc: Unify opcode definitions and support

:::::: TO: Kumar Gala <galak@kernel.crashing.org>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--ReaqsoxgOBHFXBhH
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--ReaqsoxgOBHFXBhH--
