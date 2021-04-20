Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0D8365093
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 04:52:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPSs012Z3z30Cs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 12:52:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPSrd5YPBz2xYd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 12:51:57 +1000 (AEST)
IronPort-SDR: cDZYKBMb6Sa95A+Ha4kb/35jiD+ZQolMDd2R/8GCfqQrWJpEczBrtCCGNvmWFwTq4eBafC4+j6
 vWlnwi00kMtA==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="192245714"
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; d="scan'208";a="192245714"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 19:51:54 -0700
IronPort-SDR: tMweSuuIxySRFVJwa9KBTxQahiN+7V7LGIABnaR1GyGCHpQ4gR3VjXrqMk/HJRTmWpnSvYaVV1
 Zb/UjzMb6miA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; d="scan'208";a="452353114"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Apr 2021 19:51:53 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lYgUS-00024A-Dg; Tue, 20 Apr 2021 02:51:52 +0000
Date: Tue, 20 Apr 2021 10:51:09 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 40f5c8e99b3f2f53db08055f415af2aac416360e
Message-ID: <607e419d.eYrxuBQkJq5YC6Ar%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 40f5c8e99b3f2f53db08055f415af2aac416360e  Automatic merge of 'master' into merge (2021-04-19 12:37)

elapsed time: 1430m

configs tested: 131
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
powerpc                      chrp32_defconfig
powerpc                      ppc6xx_defconfig
arm                        mini2440_defconfig
arm                         lpc32xx_defconfig
mips                         tb0226_defconfig
arm                        mvebu_v5_defconfig
arm                        realview_defconfig
powerpc                     pseries_defconfig
arm                      pxa255-idp_defconfig
arm                       versatile_defconfig
arm                       multi_v4t_defconfig
powerpc                   motionpro_defconfig
sh                         ap325rxa_defconfig
nds32                             allnoconfig
mips                      pic32mzda_defconfig
arm64                            alldefconfig
powerpc                        fsp2_defconfig
sh                        dreamcast_defconfig
powerpc                     ppa8548_defconfig
xtensa                  cadence_csp_defconfig
sh                           se7750_defconfig
sh                         apsh4a3a_defconfig
sparc                       sparc32_defconfig
um                               alldefconfig
m68k                        m5272c3_defconfig
mips                           gcw0_defconfig
arm                         assabet_defconfig
powerpc                     pq2fads_defconfig
m68k                       m5475evb_defconfig
arc                      axs103_smp_defconfig
mips                      malta_kvm_defconfig
riscv                            alldefconfig
powerpc                 mpc85xx_cds_defconfig
ia64                                defconfig
sparc                               defconfig
powerpc                      ppc64e_defconfig
powerpc                         wii_defconfig
mips                            e55_defconfig
mips                         tb0287_defconfig
powerpc                     powernv_defconfig
m68k                        m5407c3_defconfig
arm                         lubbock_defconfig
powerpc                       ppc64_defconfig
m68k                         amcore_defconfig
mips                        jmr3927_defconfig
mips                       capcella_defconfig
powerpc                        warp_defconfig
mips                        bcm47xx_defconfig
alpha                            allyesconfig
sh                           se7751_defconfig
m68k                       m5275evb_defconfig
sh                        sh7785lcr_defconfig
powerpc                        icon_defconfig
arm                          gemini_defconfig
arm                          exynos_defconfig
powerpc                     kmeter1_defconfig
powerpc                 mpc834x_mds_defconfig
riscv                          rv32_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210419
x86_64               randconfig-a001-20210419
x86_64               randconfig-a005-20210419
x86_64               randconfig-a002-20210419
x86_64               randconfig-a006-20210419
x86_64               randconfig-a004-20210419
i386                 randconfig-a003-20210419
i386                 randconfig-a001-20210419
i386                 randconfig-a006-20210419
i386                 randconfig-a005-20210419
i386                 randconfig-a004-20210419
i386                 randconfig-a002-20210419
i386                 randconfig-a015-20210419
i386                 randconfig-a013-20210419
i386                 randconfig-a014-20210419
i386                 randconfig-a016-20210419
i386                 randconfig-a012-20210419
i386                 randconfig-a011-20210419
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20210419
x86_64               randconfig-a015-20210419
x86_64               randconfig-a013-20210419
x86_64               randconfig-a011-20210419
x86_64               randconfig-a012-20210419
x86_64               randconfig-a016-20210419

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
