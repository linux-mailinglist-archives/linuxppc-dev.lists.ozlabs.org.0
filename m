Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AFA3BA6B3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jul 2021 04:26:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GGwnN2j3fz3bW0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jul 2021 12:26:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GGwmh5Zwzz2yxx
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Jul 2021 12:26:12 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="272652540"
X-IronPort-AV: E=Sophos;i="5.83,320,1616482800"; d="scan'208";a="272652540"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 19:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,320,1616482800"; d="scan'208";a="642844427"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 02 Jul 2021 19:24:59 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lzVL0-000BKa-DT; Sat, 03 Jul 2021 02:24:58 +0000
Date: Sat, 03 Jul 2021 10:24:17 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 2e5df51883031f749cb1b7032e4da7d7fe267e97
Message-ID: <60dfca51.PcCoh6BzzhT98R+O%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 2e5df51883031f749cb1b7032e4da7d7fe267e97  powerpc/xive: Fix error handling when allocating an IPI

elapsed time: 724m

configs tested: 157
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     tqm5200_defconfig
powerpc                 mpc832x_mds_defconfig
ia64                        generic_defconfig
mips                         tb0226_defconfig
ia64                         bigsur_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                     rainier_defconfig
arm                  colibri_pxa270_defconfig
powerpc                        cell_defconfig
arm                        neponset_defconfig
arm                        oxnas_v6_defconfig
powerpc                   bluestone_defconfig
arm                           corgi_defconfig
powerpc                      obs600_defconfig
sh                        sh7763rdp_defconfig
powerpc                      cm5200_defconfig
arc                         haps_hs_defconfig
mips                     loongson1c_defconfig
i386                                defconfig
riscv                             allnoconfig
sh                        sh7757lcr_defconfig
arm                    vt8500_v6_v7_defconfig
m68k                            q40_defconfig
powerpc                 linkstation_defconfig
arm                          ep93xx_defconfig
mips                            gpr_defconfig
mips                       lemote2f_defconfig
arm                       omap2plus_defconfig
sh                           se7712_defconfig
arm                         vf610m4_defconfig
mips                      pistachio_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                             espt_defconfig
arm                       cns3420vb_defconfig
arm                          ixp4xx_defconfig
i386                             alldefconfig
sparc                            allyesconfig
arm                       aspeed_g5_defconfig
sh                          sdk7786_defconfig
powerpc                          g5_defconfig
powerpc                     mpc83xx_defconfig
arc                        vdk_hs38_defconfig
sh                        apsh4ad0a_defconfig
arm                         lpc32xx_defconfig
arm                         orion5x_defconfig
arm                         axm55xx_defconfig
m68k                        mvme16x_defconfig
arm                           omap1_defconfig
powerpc                     stx_gp3_defconfig
powerpc                      walnut_defconfig
mips                            ar7_defconfig
sh                            shmin_defconfig
powerpc                     skiroot_defconfig
nds32                             allnoconfig
sh                        edosk7760_defconfig
mips                           jazz_defconfig
m68k                            mac_defconfig
x86_64                            allnoconfig
arm                       spear13xx_defconfig
mips                 decstation_r4k_defconfig
mips                           ip28_defconfig
arm                         lpc18xx_defconfig
arm                        multi_v5_defconfig
arm                      integrator_defconfig
m68k                       m5208evb_defconfig
powerpc                     sbc8548_defconfig
powerpc                    gamecube_defconfig
arm                           tegra_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                            qcom_defconfig
powerpc                     kmeter1_defconfig
arm                        multi_v7_defconfig
powerpc                         ps3_defconfig
powerpc                       maple_defconfig
csky                             alldefconfig
mips                           ip22_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                     redwood_defconfig
powerpc                      pasemi_defconfig
mips                           xway_defconfig
powerpc64                        alldefconfig
openrisc                         alldefconfig
powerpc                  storcenter_defconfig
ia64                             allmodconfig
ia64                                defconfig
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
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20210702
i386                 randconfig-a006-20210702
i386                 randconfig-a001-20210702
i386                 randconfig-a003-20210702
i386                 randconfig-a005-20210702
i386                 randconfig-a002-20210702
x86_64               randconfig-a015-20210702
x86_64               randconfig-a012-20210702
x86_64               randconfig-a014-20210702
x86_64               randconfig-a011-20210702
x86_64               randconfig-a016-20210702
x86_64               randconfig-a013-20210702
i386                 randconfig-a015-20210702
i386                 randconfig-a016-20210702
i386                 randconfig-a011-20210702
i386                 randconfig-a012-20210702
i386                 randconfig-a013-20210702
i386                 randconfig-a014-20210702
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210702
x86_64               randconfig-a004-20210702
x86_64               randconfig-a005-20210702
x86_64               randconfig-a002-20210702
x86_64               randconfig-a006-20210702
x86_64               randconfig-a003-20210702
x86_64               randconfig-a001-20210702

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
