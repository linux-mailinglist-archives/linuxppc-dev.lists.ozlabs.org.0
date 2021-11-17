Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAC3453D3B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 01:44:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv41m4Vlmz3ccB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 11:44:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv3zz2gkdz2yJF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 11:42:39 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="297277715"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="297277715"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 16:41:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="494698012"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 16 Nov 2021 16:41:29 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mn90y-00011N-9S; Wed, 17 Nov 2021 00:41:28 +0000
Date: Wed, 17 Nov 2021 08:41:03 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 1e35eba4055149c578baf0318d2f2f89ea3c44a0
Message-ID: <61944f9f.Of9LXcEEwjkjMr8f%lkp@intel.com>
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
branch HEAD: 1e35eba4055149c578baf0318d2f2f89ea3c44a0  powerpc/8xx: Fix pinned TLBs with CONFIG_STRICT_KERNEL_RWX

elapsed time: 724m

configs tested: 190
configs skipped: 104

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211116
mips                 randconfig-c004-20211116
powerpc                 mpc836x_rdk_defconfig
arm                             pxa_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                          r7785rp_defconfig
s390                             allmodconfig
microblaze                      mmu_defconfig
mips                         tb0287_defconfig
sh                   sh7724_generic_defconfig
m68k                       m5249evb_defconfig
x86_64                              defconfig
arm                        cerfcube_defconfig
powerpc                       eiger_defconfig
mips                     loongson2k_defconfig
powerpc                    socrates_defconfig
xtensa                       common_defconfig
mips                  decstation_64_defconfig
m68k                            q40_defconfig
arc                            hsdk_defconfig
arm                         s5pv210_defconfig
xtensa                          iss_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                         ps3_defconfig
sh                      rts7751r2d1_defconfig
sh                            titan_defconfig
um                             i386_defconfig
ia64                             allyesconfig
sh                            hp6xx_defconfig
powerpc                      ppc44x_defconfig
powerpc                 mpc85xx_cds_defconfig
s390                       zfcpdump_defconfig
arm                        mini2440_defconfig
microblaze                          defconfig
sh                          landisk_defconfig
arm                         at91_dt_defconfig
m68k                        m5407c3_defconfig
openrisc                            defconfig
mips                 decstation_r4k_defconfig
powerpc                     pq2fads_defconfig
powerpc                      walnut_defconfig
arm                             mxs_defconfig
mips                          ath79_defconfig
powerpc                      makalu_defconfig
mips                   sb1250_swarm_defconfig
arm                        clps711x_defconfig
arm                         socfpga_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                           rs90_defconfig
arm                          exynos_defconfig
powerpc                        cell_defconfig
arm                         axm55xx_defconfig
arm                           sama5_defconfig
mips                          rm200_defconfig
arm                           stm32_defconfig
arm                       spear13xx_defconfig
ia64                             alldefconfig
mips                          malta_defconfig
arm                       versatile_defconfig
arm                          gemini_defconfig
arm                     eseries_pxa_defconfig
arm                           u8500_defconfig
mips                         cobalt_defconfig
sh                   secureedge5410_defconfig
powerpc                      bamboo_defconfig
h8300                               defconfig
arm                       aspeed_g4_defconfig
arm                       imx_v6_v7_defconfig
powerpc                 mpc832x_mds_defconfig
s390                             alldefconfig
arm                       imx_v4_v5_defconfig
sh                         apsh4a3a_defconfig
arm                            hisi_defconfig
mips                          rb532_defconfig
ia64                                defconfig
arm                        magician_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                          collie_defconfig
powerpc                      ep88xc_defconfig
arc                           tb10x_defconfig
arm                            dove_defconfig
nios2                         3c120_defconfig
arm                       mainstone_defconfig
powerpc                         wii_defconfig
powerpc                     mpc512x_defconfig
sh                 kfr2r09-romimage_defconfig
sh                          rsk7264_defconfig
m68k                         apollo_defconfig
sh                            shmin_defconfig
h8300                            alldefconfig
mips                         rt305x_defconfig
arm                            mps2_defconfig
xtensa                  cadence_csp_defconfig
sh                         ap325rxa_defconfig
m68k                         amcore_defconfig
arm                        mvebu_v7_defconfig
sh                        dreamcast_defconfig
arm                        vexpress_defconfig
sh                          urquell_defconfig
sh                           se7751_defconfig
arm                       cns3420vb_defconfig
arm                    vt8500_v6_v7_defconfig
arc                        nsim_700_defconfig
arm                   milbeaut_m10v_defconfig
sh                   sh7770_generic_defconfig
h8300                       h8s-sim_defconfig
powerpc                    mvme5100_defconfig
arm                         lpc32xx_defconfig
sh                           se7780_defconfig
xtensa                         virt_defconfig
ia64                          tiger_defconfig
arm                  randconfig-c002-20211116
ia64                             allmodconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a015-20211116
x86_64               randconfig-a013-20211116
x86_64               randconfig-a012-20211116
x86_64               randconfig-a011-20211116
x86_64               randconfig-a016-20211116
x86_64               randconfig-a014-20211116
i386                 randconfig-a014-20211116
i386                 randconfig-a016-20211116
i386                 randconfig-a012-20211116
i386                 randconfig-a013-20211116
i386                 randconfig-a011-20211116
i386                 randconfig-a015-20211116
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211116
i386                 randconfig-c001-20211116
arm                  randconfig-c002-20211116
riscv                randconfig-c006-20211116
powerpc              randconfig-c003-20211116
s390                 randconfig-c005-20211116
mips                 randconfig-c004-20211116
x86_64               randconfig-a005-20211116
x86_64               randconfig-a003-20211116
x86_64               randconfig-a001-20211116
x86_64               randconfig-a002-20211116
x86_64               randconfig-a006-20211116
x86_64               randconfig-a004-20211116
i386                 randconfig-a006-20211116
i386                 randconfig-a003-20211116
i386                 randconfig-a005-20211116
i386                 randconfig-a001-20211116
i386                 randconfig-a004-20211116
i386                 randconfig-a002-20211116
hexagon              randconfig-r045-20211116
hexagon              randconfig-r041-20211116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
