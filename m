Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62433315F29
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 06:48:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Db8256QRtzDvb7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 16:48:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Db7tv4cFgzDsnf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 16:42:13 +1100 (AEDT)
IronPort-SDR: Z3oNr0DD+Voo+qf4tVgH5OqTKvD+1Vgy87CybJzQoS3WqTqmHk7DjCOF+VLRjNcvbY+x4GYM34
 w+ugRRkhLaLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="182160763"
X-IronPort-AV: E=Sophos;i="5.81,167,1610438400"; d="scan'208";a="182160763"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 21:42:10 -0800
IronPort-SDR: Y3PeShugtdioKiZAoWQTjUhOytHwOwnHiT7J82xmrYvIbZ9ZKfv/pnNezedYrB7w2NFP1ArM4m
 E3QNpcHd7KQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,167,1610438400"; d="scan'208";a="436551528"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 09 Feb 2021 21:42:08 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1l9iGO-0002hm-1g; Wed, 10 Feb 2021 05:42:08 +0000
Date: Wed, 10 Feb 2021 13:41:59 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD REGRESSION
 5811244192fc4e18c001c69300044c2acf30bd91
Message-ID: <60237227.lWSFRjTnbU2JS9+h%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 5811244192fc4e18c001c69300044c2acf30bd91  powerpc/64s: power4 nap fixup in C

Error/Warning reports:

https://lore.kernel.org/linuxppc-dev/202102100438.UVRTpNeN-lkp@intel.com
https://lore.kernel.org/linuxppc-dev/202102100601.eLtCMofO-lkp@intel.com
https://lore.kernel.org/linuxppc-dev/202102101057.KqISSfvf-lkp@intel.com

Error/Warning in current branch:

arch/powerpc/mm/book3s64/radix_tlb.c:646:6: warning: no previous prototype for function 'exit_lazy_flush_tlb' [-Wmissing-prototypes]
arch/powerpc/platforms/83xx/km83xx.c:183:19: error: 'mpc83xx_setup_pci' undeclared here (not in a function); did you mean 'mpc83xx_setup_arch'?
arch/powerpc/platforms/amigaone/setup.c:73:13: error: no previous prototype for 'amigaone_discover_phbs' [-Werror=missing-prototypes]

possible Error/Warning in current branch:

arch/powerpc/mm/book3s64/radix_tlb.c:646:6: error: no previous prototype for 'exit_lazy_flush_tlb' [-Werror=missing-prototypes]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- powerpc-cell_defconfig
|   `-- arch-powerpc-mm-book3s64-radix_tlb.c:error:no-previous-prototype-for-exit_lazy_flush_tlb
|-- powerpc-kmeter1_defconfig
|   `-- arch-powerpc-platforms-83xx-km83xx.c:error:mpc83xx_setup_pci-undeclared-here-(not-in-a-function)
|-- powerpc-pasemi_defconfig
|   `-- arch-powerpc-mm-book3s64-radix_tlb.c:error:no-previous-prototype-for-exit_lazy_flush_tlb
|-- powerpc-ppc64_defconfig
|   `-- arch-powerpc-mm-book3s64-radix_tlb.c:error:no-previous-prototype-for-exit_lazy_flush_tlb
`-- powerpc64-randconfig-r036-20210209
    `-- arch-powerpc-platforms-amigaone-setup.c:error:no-previous-prototype-for-amigaone_discover_phbs

clang_recent_errors
`-- powerpc-randconfig-r026-20210209
    `-- arch-powerpc-mm-book3s64-radix_tlb.c:warning:no-previous-prototype-for-function-exit_lazy_flush_tlb

elapsed time: 720m

configs tested: 116
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      pasemi_defconfig
arm                             mxs_defconfig
arc                              alldefconfig
mips                          ath79_defconfig
c6x                        evmc6474_defconfig
arm                          pxa3xx_defconfig
powerpc                    socrates_defconfig
xtensa                    smp_lx200_defconfig
mips                        jmr3927_defconfig
powerpc                       ppc64_defconfig
c6x                              allyesconfig
xtensa                  audio_kc705_defconfig
sh                               allmodconfig
arm                    vt8500_v6_v7_defconfig
arm                             pxa_defconfig
mips                           xway_defconfig
arm                       netwinder_defconfig
mips                            gpr_defconfig
arc                        vdk_hs38_defconfig
mips                           rs90_defconfig
powerpc                     sequoia_defconfig
powerpc                     taishan_defconfig
alpha                               defconfig
mips                      maltaaprp_defconfig
arc                              allyesconfig
m68k                       m5475evb_defconfig
arm                           stm32_defconfig
mips                          malta_defconfig
m68k                        mvme147_defconfig
arm                       cns3420vb_defconfig
alpha                            allyesconfig
sh                             shx3_defconfig
arm                          ixp4xx_defconfig
xtensa                  nommu_kc705_defconfig
arm                        mvebu_v7_defconfig
arm                         s3c2410_defconfig
powerpc                        cell_defconfig
sh                   rts7751r2dplus_defconfig
arm                         hackkit_defconfig
sh                          rsk7201_defconfig
arm                       imx_v4_v5_defconfig
arm                     am200epdkit_defconfig
microblaze                      mmu_defconfig
sh                  sh7785lcr_32bit_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210209
x86_64               randconfig-a001-20210209
x86_64               randconfig-a005-20210209
x86_64               randconfig-a004-20210209
x86_64               randconfig-a002-20210209
x86_64               randconfig-a003-20210209
i386                 randconfig-a001-20210209
i386                 randconfig-a005-20210209
i386                 randconfig-a003-20210209
i386                 randconfig-a002-20210209
i386                 randconfig-a006-20210209
i386                 randconfig-a004-20210209
i386                 randconfig-a016-20210209
i386                 randconfig-a013-20210209
i386                 randconfig-a012-20210209
i386                 randconfig-a014-20210209
i386                 randconfig-a011-20210209
i386                 randconfig-a015-20210209
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210209
x86_64               randconfig-a014-20210209
x86_64               randconfig-a015-20210209
x86_64               randconfig-a012-20210209
x86_64               randconfig-a016-20210209
x86_64               randconfig-a011-20210209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
