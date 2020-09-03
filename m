Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B87C25C99C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 21:40:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjB4Q0FXFzDrF8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 05:40:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjB2X1xzZzDrCX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 05:39:14 +1000 (AEST)
IronPort-SDR: GGzjcs+l2F2LFXrnFfILW3jrvs8fTX/YtVW+7GsU4N9FY3CFqJBsTmdFu6AMtPGab98864W0le
 nUhbK7xgmdmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="145383431"
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="145383431"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 12:39:12 -0700
IronPort-SDR: RizKV95nDMCgGrq75UyWJEn9TZhp5vcGeVP5J1nUNi+WVM+icfopNa2CkvMjrBDDbAhd3sy8xK
 5Vjt3q1xMVzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="478176855"
Received: from lkp-server01.sh.intel.com (HELO f1af165c0d27) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 03 Sep 2020 12:39:07 -0700
Received: from kbuild by f1af165c0d27 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kDv4c-0000EJ-KI; Thu, 03 Sep 2020 19:39:06 +0000
Date: Fri, 04 Sep 2020 03:39:02 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 c3ea77ab83a1cd36cca6a54206657a4aeb98c49c
Message-ID: <5f514656.LfNjZM76OwKS8ef3%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  next-test
branch HEAD: c3ea77ab83a1cd36cca6a54206657a4aeb98c49c  powerpc: Warn about use of smt_snooze_delay

elapsed time: 799m

configs tested: 168
configs skipped: 16

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                         ps3_defconfig
arm                             mxs_defconfig
powerpc                      ppc6xx_defconfig
sh                           se7206_defconfig
mips                     loongson1b_defconfig
sh                          lboxre2_defconfig
mips                         rt305x_defconfig
nios2                            alldefconfig
sh                          polaris_defconfig
arm                          gemini_defconfig
arc                        nsim_700_defconfig
arm                              zx_defconfig
microblaze                          defconfig
mips                        vocore2_defconfig
mips                      maltasmvp_defconfig
powerpc                      ppc44x_defconfig
arm                           spitz_defconfig
xtensa                       common_defconfig
xtensa                           alldefconfig
mips                            e55_defconfig
m68k                            q40_defconfig
m68k                       m5475evb_defconfig
mips                 pnx8335_stb225_defconfig
arm                          badge4_defconfig
arm                            zeus_defconfig
um                             i386_defconfig
mips                         mpc30x_defconfig
c6x                        evmc6474_defconfig
arm                      jornada720_defconfig
m68k                       m5249evb_defconfig
x86_64                           alldefconfig
mips                   sb1250_swarm_defconfig
arm                       imx_v4_v5_defconfig
sh                           se7712_defconfig
mips                          rb532_defconfig
sh                            hp6xx_defconfig
arm                           h5000_defconfig
arm                           sunxi_defconfig
sh                           se7721_defconfig
powerpc                             defconfig
arm                      tct_hammer_defconfig
arm                        mini2440_defconfig
powerpc                          allmodconfig
arm                        shmobile_defconfig
nds32                             allnoconfig
arm                           omap1_defconfig
mips                  decstation_64_defconfig
arc                      axs103_smp_defconfig
arc                              alldefconfig
powerpc                      tqm8xx_defconfig
mips                           gcw0_defconfig
arm                          moxart_defconfig
powerpc                    adder875_defconfig
mips                           ip28_defconfig
openrisc                         alldefconfig
arm                          iop32x_defconfig
sh                        sh7785lcr_defconfig
i386                             allyesconfig
sh                   sh7770_generic_defconfig
mips                      loongson3_defconfig
arm                     eseries_pxa_defconfig
arm                           sama5_defconfig
sparc64                             defconfig
powerpc                      pmac32_defconfig
sh                         microdev_defconfig
mips                          malta_defconfig
powerpc                  mpc866_ads_defconfig
arm                       netwinder_defconfig
mips                        workpad_defconfig
c6x                        evmc6457_defconfig
mips                          rm200_defconfig
h8300                            alldefconfig
arc                              allyesconfig
sh                           se7724_defconfig
arm                         mv78xx0_defconfig
microblaze                      mmu_defconfig
riscv                          rv32_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20200903
x86_64               randconfig-a006-20200903
x86_64               randconfig-a003-20200903
x86_64               randconfig-a005-20200903
x86_64               randconfig-a001-20200903
x86_64               randconfig-a002-20200903
i386                 randconfig-a004-20200902
i386                 randconfig-a005-20200902
i386                 randconfig-a006-20200902
i386                 randconfig-a002-20200902
i386                 randconfig-a001-20200902
i386                 randconfig-a003-20200902
i386                 randconfig-a004-20200903
i386                 randconfig-a005-20200903
i386                 randconfig-a006-20200903
i386                 randconfig-a002-20200903
i386                 randconfig-a001-20200903
i386                 randconfig-a003-20200903
x86_64               randconfig-a013-20200902
x86_64               randconfig-a016-20200902
x86_64               randconfig-a011-20200902
x86_64               randconfig-a012-20200902
x86_64               randconfig-a015-20200902
x86_64               randconfig-a014-20200902
i386                 randconfig-a016-20200902
i386                 randconfig-a015-20200902
i386                 randconfig-a011-20200902
i386                 randconfig-a013-20200902
i386                 randconfig-a014-20200902
i386                 randconfig-a012-20200902
i386                 randconfig-a016-20200903
i386                 randconfig-a015-20200903
i386                 randconfig-a011-20200903
i386                 randconfig-a013-20200903
i386                 randconfig-a014-20200903
i386                 randconfig-a012-20200903
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20200902
x86_64               randconfig-a006-20200902
x86_64               randconfig-a003-20200902
x86_64               randconfig-a005-20200902
x86_64               randconfig-a001-20200902
x86_64               randconfig-a002-20200902
x86_64               randconfig-a013-20200903
x86_64               randconfig-a016-20200903
x86_64               randconfig-a011-20200903
x86_64               randconfig-a012-20200903
x86_64               randconfig-a015-20200903
x86_64               randconfig-a014-20200903

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
