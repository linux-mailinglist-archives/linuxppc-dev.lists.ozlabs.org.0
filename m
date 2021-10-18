Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A80430D64
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 03:18:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXfCK2DG8z3bW5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 12:18:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXfBr27SDz2xt7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 12:18:08 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="208255308"
X-IronPort-AV: E=Sophos;i="5.85,380,1624345200"; d="scan'208";a="208255308"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 18:17:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,380,1624345200"; d="scan'208";a="443216153"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 17 Oct 2021 18:17:03 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mcHGw-000ApA-IL; Mon, 18 Oct 2021 01:17:02 +0000
Date: Mon, 18 Oct 2021 09:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 6c44be1b8e2d8c0161ac39d5d39ea4dff39da71c
Message-ID: <616ccb00.FWzE58xyhyRUhA6j%lkp@intel.com>
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
branch HEAD: 6c44be1b8e2d8c0161ac39d5d39ea4dff39da71c  powerpc/smp: do not decrement idle task preempt count in CPU offline

elapsed time: 2077m

configs tested: 233
configs skipped: 111

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
h8300                       h8s-sim_defconfig
arc                     haps_hs_smp_defconfig
powerpc                     tqm5200_defconfig
sh                             sh03_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                         axm55xx_defconfig
sh                          landisk_defconfig
arm                           tegra_defconfig
arm                        oxnas_v6_defconfig
arm                         orion5x_defconfig
arm                       imx_v4_v5_defconfig
arm                           corgi_defconfig
xtensa                    xip_kc705_defconfig
csky                             alldefconfig
sh                   sh7770_generic_defconfig
powerpc                      ppc40x_defconfig
sh                                  defconfig
riscv                            alldefconfig
mips                        maltaup_defconfig
arm                          collie_defconfig
sparc                               defconfig
riscv                    nommu_k210_defconfig
nios2                         10m50_defconfig
mips                          rb532_defconfig
arc                          axs103_defconfig
nds32                               defconfig
arm                      pxa255-idp_defconfig
powerpc                     stx_gp3_defconfig
mips                         cobalt_defconfig
powerpc                       ebony_defconfig
s390                             alldefconfig
sh                        dreamcast_defconfig
openrisc                 simple_smp_defconfig
powerpc                           allnoconfig
arm                           h5000_defconfig
arm                       multi_v4t_defconfig
arm                        multi_v7_defconfig
sh                        edosk7705_defconfig
sh                          sdk7786_defconfig
m68k                       bvme6000_defconfig
arm                     am200epdkit_defconfig
powerpc                      chrp32_defconfig
sh                          rsk7264_defconfig
arm                            mmp2_defconfig
m68k                         amcore_defconfig
sparc64                          alldefconfig
xtensa                  nommu_kc705_defconfig
mips                     loongson1b_defconfig
mips                           xway_defconfig
ia64                        generic_defconfig
mips                        workpad_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                      ppc6xx_defconfig
h8300                               defconfig
ia64                      gensparse_defconfig
powerpc                     tqm8541_defconfig
arm                          pxa3xx_defconfig
powerpc                 mpc8540_ads_defconfig
sh                           se7780_defconfig
arc                         haps_hs_defconfig
arm                        keystone_defconfig
arm                  colibri_pxa270_defconfig
arm                          moxart_defconfig
m68k                        m5307c3_defconfig
m68k                          sun3x_defconfig
powerpc                     sequoia_defconfig
sh                         ap325rxa_defconfig
sh                           se7751_defconfig
m68k                        m5272c3_defconfig
arm                           viper_defconfig
sparc64                             defconfig
riscv                             allnoconfig
mips                            e55_defconfig
powerpc                     kmeter1_defconfig
powerpc                          allyesconfig
powerpc                    adder875_defconfig
nds32                             allnoconfig
arm                             mxs_defconfig
ia64                          tiger_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                         hackkit_defconfig
powerpc                 mpc8560_ads_defconfig
mips                     cu1000-neo_defconfig
m68k                           sun3_defconfig
m68k                          hp300_defconfig
powerpc                   bluestone_defconfig
powerpc                    mvme5100_defconfig
arm                          ep93xx_defconfig
s390                          debug_defconfig
nios2                         3c120_defconfig
mips                malta_qemu_32r6_defconfig
arc                    vdk_hs38_smp_defconfig
arm                            hisi_defconfig
arc                           tb10x_defconfig
powerpc                    sam440ep_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                     powernv_defconfig
arc                      axs103_smp_defconfig
mips                          rm200_defconfig
x86_64                              defconfig
h8300                            allyesconfig
powerpc                    ge_imp3a_defconfig
powerpc                 linkstation_defconfig
ia64                            zx1_defconfig
sh                          lboxre2_defconfig
powerpc                      pcm030_defconfig
powerpc                   microwatt_defconfig
alpha                               defconfig
sh                            shmin_defconfig
arm                            zeus_defconfig
arm                         s5pv210_defconfig
mips                             allmodconfig
m68k                                defconfig
powerpc                     ep8248e_defconfig
sh                     magicpanelr2_defconfig
ia64                                defconfig
powerpc                     rainier_defconfig
powerpc                       holly_defconfig
mips                        nlm_xlr_defconfig
powerpc                     ksi8560_defconfig
arm                          pxa910_defconfig
riscv                               defconfig
microblaze                      mmu_defconfig
s390                       zfcpdump_defconfig
mips                     loongson2k_defconfig
mips                      malta_kvm_defconfig
arm                           stm32_defconfig
powerpc                 mpc836x_mds_defconfig
sh                          kfr2r09_defconfig
powerpc                     mpc5200_defconfig
powerpc                      arches_defconfig
powerpc                  storcenter_defconfig
arm                        cerfcube_defconfig
arm                         assabet_defconfig
arm                          pcm027_defconfig
sh                         microdev_defconfig
powerpc                     taishan_defconfig
powerpc                     mpc512x_defconfig
powerpc                 mpc834x_mds_defconfig
sh                        sh7757lcr_defconfig
powerpc                     asp8347_defconfig
sparc                       sparc64_defconfig
mips                     decstation_defconfig
powerpc                    gamecube_defconfig
mips                           ip32_defconfig
mips                            gpr_defconfig
powerpc                      ep88xc_defconfig
arm                         shannon_defconfig
arm                         cm_x300_defconfig
sh                            titan_defconfig
m68k                          multi_defconfig
mips                           gcw0_defconfig
powerpc                  iss476-smp_defconfig
sh                        edosk7760_defconfig
sh                        sh7763rdp_defconfig
arm                           u8500_defconfig
powerpc                  mpc866_ads_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                      tqm8xx_defconfig
arm                       mainstone_defconfig
sh                          r7785rp_defconfig
arm                  randconfig-c002-20211017
i386                 randconfig-c001-20211017
x86_64               randconfig-c001-20211017
ia64                             allmodconfig
ia64                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                                defconfig
parisc                           allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a006-20211016
x86_64               randconfig-a004-20211016
x86_64               randconfig-a001-20211016
x86_64               randconfig-a005-20211016
x86_64               randconfig-a002-20211016
x86_64               randconfig-a003-20211016
x86_64               randconfig-a012-20211017
x86_64               randconfig-a015-20211017
x86_64               randconfig-a016-20211017
x86_64               randconfig-a014-20211017
x86_64               randconfig-a011-20211017
x86_64               randconfig-a013-20211017
i386                 randconfig-a016-20211017
i386                 randconfig-a014-20211017
i386                 randconfig-a011-20211017
i386                 randconfig-a015-20211017
i386                 randconfig-a012-20211017
i386                 randconfig-a013-20211017
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
mips                 randconfig-c004-20211017
arm                  randconfig-c002-20211017
i386                 randconfig-c001-20211017
s390                 randconfig-c005-20211017
x86_64               randconfig-c007-20211017
powerpc              randconfig-c003-20211017
riscv                randconfig-c006-20211017
x86_64               randconfig-a006-20211017
x86_64               randconfig-a004-20211017
x86_64               randconfig-a001-20211017
x86_64               randconfig-a005-20211017
x86_64               randconfig-a002-20211017
x86_64               randconfig-a003-20211017
i386                 randconfig-a003-20211017
i386                 randconfig-a001-20211017
i386                 randconfig-a005-20211017
i386                 randconfig-a004-20211017
i386                 randconfig-a002-20211017
i386                 randconfig-a006-20211017
hexagon              randconfig-r041-20211017
hexagon              randconfig-r045-20211017

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
