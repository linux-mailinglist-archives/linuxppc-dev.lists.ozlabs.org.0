Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F15025C9A1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 21:42:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjB6V1vZrzDrBH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 05:42:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjB2X1QznzDrCW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 05:39:12 +1000 (AEST)
IronPort-SDR: H3SsZwwTLzBAXAJiDbF+ZoBNpK5gh93Ilmfk3eDxOI1ZU8nEsRq4/KVogpyjo3L5NIzydJk7L9
 NLu+a1C4CtVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="221857712"
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="221857712"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 12:39:08 -0700
IronPort-SDR: /Gta/a8vAJ/0sduVyD5jSca/5k9+vMR/+29poTfw3m1XbR2giAA52lbQwxHoZnSvShal26ta7L
 YWKFf4HrkaBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="298157210"
Received: from lkp-server01.sh.intel.com (HELO f1af165c0d27) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 03 Sep 2020 12:39:07 -0700
Received: from kbuild by f1af165c0d27 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kDv4c-0000EL-Kx; Thu, 03 Sep 2020 19:39:06 +0000
Date: Fri, 04 Sep 2020 03:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 4c62285439f80f8996c38e0bda79b1125a192365
Message-ID: <5f514651.n0rSjbHzaLVMwT7g%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  fixes-test
branch HEAD: 4c62285439f80f8996c38e0bda79b1125a192365  Revert "powerpc/build: vdso linker warning for orphan sections"

elapsed time: 800m

configs tested: 162
configs skipped: 19

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
mips                         rt305x_defconfig
nios2                            alldefconfig
sh                          polaris_defconfig
arm                          gemini_defconfig
arc                        nsim_700_defconfig
arm                       cns3420vb_defconfig
arm                         vf610m4_defconfig
ia64                         bigsur_defconfig
xtensa                           alldefconfig
arm                              zx_defconfig
microblaze                          defconfig
mips                        vocore2_defconfig
mips                      maltasmvp_defconfig
powerpc                      ppc44x_defconfig
arm                           spitz_defconfig
xtensa                       common_defconfig
mips                            e55_defconfig
m68k                            q40_defconfig
m68k                       m5475evb_defconfig
arm                          badge4_defconfig
arm                            zeus_defconfig
um                             i386_defconfig
mips                         mpc30x_defconfig
c6x                        evmc6474_defconfig
arm                      jornada720_defconfig
arm                           h5000_defconfig
arm                           sunxi_defconfig
sh                           se7721_defconfig
arm                        shmobile_defconfig
nds32                             allnoconfig
arm                           omap1_defconfig
mips                  decstation_64_defconfig
arc                      axs103_smp_defconfig
mips                          rb532_defconfig
arc                              alldefconfig
sh                      rts7751r2d1_defconfig
arm                        mvebu_v5_defconfig
arm                         nhk8815_defconfig
mips                           ip28_defconfig
openrisc                         alldefconfig
arm                          iop32x_defconfig
sh                        sh7785lcr_defconfig
powerpc                      tqm8xx_defconfig
c6x                              alldefconfig
sh                            hp6xx_defconfig
sh                         ecovec24_defconfig
arm                          collie_defconfig
m68k                          multi_defconfig
sparc                            allyesconfig
sh                         microdev_defconfig
mips                          malta_defconfig
mips                        workpad_defconfig
c6x                        evmc6457_defconfig
mips                          rm200_defconfig
h8300                            alldefconfig
mips                            gpr_defconfig
sh                   sh7724_generic_defconfig
mips                           mtx1_defconfig
arm                           stm32_defconfig
arm                            hisi_defconfig
microblaze                    nommu_defconfig
sh                          lboxre2_defconfig
powerpc                  mpc885_ads_defconfig
mips                      pic32mzda_defconfig
mips                       capcella_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
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
i386                 randconfig-a016-20200903
i386                 randconfig-a015-20200903
i386                 randconfig-a011-20200903
i386                 randconfig-a013-20200903
i386                 randconfig-a014-20200903
i386                 randconfig-a012-20200903
i386                 randconfig-a016-20200902
i386                 randconfig-a015-20200902
i386                 randconfig-a011-20200902
i386                 randconfig-a013-20200902
i386                 randconfig-a014-20200902
i386                 randconfig-a012-20200902
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
