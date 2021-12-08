Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CF746CAD0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 03:22:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J81CD5vMJz3cX0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 13:22:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J81BM4Lq2z2yNW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 13:21:26 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="224609188"
X-IronPort-AV: E=Sophos;i="5.87,296,1631602800"; d="scan'208";a="224609188"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 18:20:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,296,1631602800"; d="scan'208";a="543046244"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 07 Dec 2021 18:20:21 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mumZB-000NFu-2k; Wed, 08 Dec 2021 02:20:21 +0000
Date: Wed, 08 Dec 2021 10:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/ppc-kvm] BUILD SUCCESS
 792020907b11c6f9246c21977cab3bad985ae4b6
Message-ID: <61b01651.HoPBeXxLpnrr3jaS%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
branch HEAD: 792020907b11c6f9246c21977cab3bad985ae4b6  KVM: PPC: Book3S: Suppress failed alloc warning in H_COPY_TOFROM_GUEST

elapsed time: 6508m

configs tested: 441
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                 randconfig-c004-20211203
i386                 randconfig-c001-20211203
i386                 randconfig-c001-20211206
i386                 randconfig-c001-20211207
arm                         shannon_defconfig
powerpc                     pq2fads_defconfig
powerpc                    gamecube_defconfig
powerpc                      ppc40x_defconfig
arm                      integrator_defconfig
arm                         axm55xx_defconfig
sh                         microdev_defconfig
mips                     loongson1c_defconfig
s390                             allmodconfig
sh                     sh7710voipgw_defconfig
powerpc                  iss476-smp_defconfig
xtensa                generic_kc705_defconfig
nds32                               defconfig
mips                      pic32mzda_defconfig
arm64                            alldefconfig
powerpc                          g5_defconfig
m68k                             alldefconfig
arc                           tb10x_defconfig
arm                           tegra_defconfig
powerpc                 mpc837x_rdb_defconfig
csky                                defconfig
sh                           se7750_defconfig
powerpc                      chrp32_defconfig
sh                          urquell_defconfig
sh                           se7751_defconfig
um                             i386_defconfig
mips                            gpr_defconfig
powerpc                    adder875_defconfig
m68k                       m5208evb_defconfig
powerpc                      arches_defconfig
s390                             allyesconfig
powerpc                 mpc8540_ads_defconfig
mips                      fuloong2e_defconfig
sh                        edosk7760_defconfig
powerpc                     tqm8555_defconfig
openrisc                    or1ksim_defconfig
powerpc                     powernv_defconfig
m68k                          amiga_defconfig
powerpc                        fsp2_defconfig
ia64                            zx1_defconfig
m68k                             allyesconfig
arc                          axs101_defconfig
m68k                        m5407c3_defconfig
mips                        maltaup_defconfig
sparc                       sparc64_defconfig
mips                        vocore2_defconfig
arm                        clps711x_defconfig
arc                              allyesconfig
sh                            hp6xx_defconfig
mips                          ath79_defconfig
arm                     eseries_pxa_defconfig
arm                         bcm2835_defconfig
m68k                        m5307c3_defconfig
arm                           sama5_defconfig
sh                              ul2_defconfig
mips                        workpad_defconfig
m68k                         apollo_defconfig
m68k                          atari_defconfig
arm                       multi_v4t_defconfig
xtensa                  nommu_kc705_defconfig
h8300                            allyesconfig
h8300                     edosk2674_defconfig
mips                           rs90_defconfig
mips                      maltasmvp_defconfig
nds32                            alldefconfig
powerpc                     redwood_defconfig
sh                          sdk7786_defconfig
arm                           h5000_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                     ppa8548_defconfig
powerpc                  mpc866_ads_defconfig
sh                          kfr2r09_defconfig
mips                           mtx1_defconfig
nios2                               defconfig
sparc                            allyesconfig
powerpc                    klondike_defconfig
arm                             rpc_defconfig
sh                           se7619_defconfig
powerpc                     kmeter1_defconfig
mips                      malta_kvm_defconfig
riscv                    nommu_virt_defconfig
powerpc                     taishan_defconfig
arm                          iop32x_defconfig
arm                         mv78xx0_defconfig
arc                     nsimosci_hs_defconfig
mips                         tb0287_defconfig
sh                                  defconfig
powerpc                    mvme5100_defconfig
sh                            shmin_defconfig
mips                        bcm63xx_defconfig
mips                     cu1830-neo_defconfig
powerpc                 mpc834x_itx_defconfig
sh                          rsk7269_defconfig
mips                        jmr3927_defconfig
arc                        nsim_700_defconfig
arm                         s5pv210_defconfig
arm                             mxs_defconfig
powerpc                     tqm8560_defconfig
powerpc                         ps3_defconfig
arm                        keystone_defconfig
ia64                      gensparse_defconfig
arm                            mps2_defconfig
sh                           se7705_defconfig
mips                           xway_defconfig
powerpc                      cm5200_defconfig
sparc64                             defconfig
powerpc                         wii_defconfig
um                           x86_64_defconfig
arm                            xcep_defconfig
powerpc                       holly_defconfig
arm                  colibri_pxa300_defconfig
i386                             alldefconfig
mips                        qi_lb60_defconfig
mips                         tb0226_defconfig
powerpc                     tqm8541_defconfig
arm                          ep93xx_defconfig
m68k                            mac_defconfig
arm                          badge4_defconfig
sh                           se7724_defconfig
mips                             allmodconfig
sh                        sh7785lcr_defconfig
powerpc64                           defconfig
arm                           stm32_defconfig
arm                         palmz72_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                       bmips_be_defconfig
arm                           sunxi_defconfig
xtensa                  cadence_csp_defconfig
arm                           h3600_defconfig
arm                          simpad_defconfig
powerpc                 linkstation_defconfig
powerpc                     asp8347_defconfig
mips                    maltaup_xpa_defconfig
mips                            e55_defconfig
powerpc                     akebono_defconfig
mips                          malta_defconfig
i386                                defconfig
arm                           viper_defconfig
riscv                    nommu_k210_defconfig
powerpc                        cell_defconfig
arc                         haps_hs_defconfig
sh                           se7712_defconfig
arm                         assabet_defconfig
powerpc                       eiger_defconfig
sh                        apsh4ad0a_defconfig
arm                         lpc32xx_defconfig
h8300                    h8300h-sim_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                   motionpro_defconfig
parisc                           alldefconfig
mips                      loongson3_defconfig
mips                           ip22_defconfig
arm                        shmobile_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                          gemini_defconfig
powerpc                     mpc83xx_defconfig
powerpc                      katmai_defconfig
arm                        neponset_defconfig
powerpc                     kilauea_defconfig
arm                       imx_v4_v5_defconfig
mips                         tb0219_defconfig
arm                           sama7_defconfig
arm                           omap1_defconfig
arm                      pxa255-idp_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                         at91_dt_defconfig
mips                         rt305x_defconfig
sh                            migor_defconfig
arm                       spear13xx_defconfig
arm                            zeus_defconfig
sh                               alldefconfig
arm                         vf610m4_defconfig
arm                        multi_v7_defconfig
sh                             espt_defconfig
arm                      footbridge_defconfig
powerpc                      acadia_defconfig
sh                           se7721_defconfig
powerpc                 canyonlands_defconfig
arm                      jornada720_defconfig
sparc                            alldefconfig
powerpc                     stx_gp3_defconfig
arm                        mvebu_v7_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                         ecovec24_defconfig
arm                         orion5x_defconfig
sh                           se7780_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                          lpd270_defconfig
arm                        oxnas_v6_defconfig
powerpc                 mpc836x_mds_defconfig
alpha                            alldefconfig
powerpc                      ppc64e_defconfig
m68k                       bvme6000_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                   microwatt_defconfig
arm                          pxa910_defconfig
sh                          r7785rp_defconfig
arm                        vexpress_defconfig
i386                             allyesconfig
mips                         db1xxx_defconfig
arc                            hsdk_defconfig
s390                                defconfig
arm                       omap2plus_defconfig
arc                          axs103_defconfig
arm                         lubbock_defconfig
mips                         mpc30x_defconfig
arc                      axs103_smp_defconfig
powerpc                     ep8248e_defconfig
parisc                generic-64bit_defconfig
microblaze                          defconfig
powerpc                 mpc8272_ads_defconfig
xtensa                       common_defconfig
h8300                       h8s-sim_defconfig
openrisc                  or1klitex_defconfig
m68k                       m5249evb_defconfig
m68k                       m5275evb_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                           corgi_defconfig
sh                   sh7724_generic_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                      tqm8xx_defconfig
sparc64                          alldefconfig
sh                         ap325rxa_defconfig
arm                         socfpga_defconfig
mips                          rm200_defconfig
h8300                               defconfig
s390                       zfcpdump_defconfig
openrisc                         alldefconfig
mips                          ath25_defconfig
sh                        sh7757lcr_defconfig
sh                           se7206_defconfig
m68k                        mvme16x_defconfig
sh                      rts7751r2d1_defconfig
arc                                 defconfig
ia64                        generic_defconfig
powerpc                     tqm8548_defconfig
h8300                            alldefconfig
mips                     cu1000-neo_defconfig
powerpc                      pmac32_defconfig
arm                          pcm027_defconfig
m68k                          sun3x_defconfig
m68k                        m5272c3_defconfig
arm                        mvebu_v5_defconfig
sparc                       sparc32_defconfig
arm                       cns3420vb_defconfig
arc                        nsimosci_defconfig
mips                     decstation_defconfig
arm                        cerfcube_defconfig
arm                  colibri_pxa270_defconfig
arm                             ezx_defconfig
arm                            qcom_defconfig
sh                           se7722_defconfig
arm                          moxart_defconfig
m68k                            q40_defconfig
nds32                             allnoconfig
nios2                            allyesconfig
mips                         bigsur_defconfig
riscv                          rv32_defconfig
arm                         cm_x300_defconfig
powerpc                    amigaone_defconfig
m68k                           sun3_defconfig
sh                 kfr2r09-romimage_defconfig
sparc                               defconfig
mips                       rbtx49xx_defconfig
powerpc                      ep88xc_defconfig
powerpc                      pasemi_defconfig
powerpc                 mpc8560_ads_defconfig
arm                       aspeed_g4_defconfig
powerpc                        warp_defconfig
sh                         apsh4a3a_defconfig
sh                           sh2007_defconfig
microblaze                      mmu_defconfig
arm                        spear6xx_defconfig
arc                              alldefconfig
powerpc                        icon_defconfig
powerpc                 xes_mpc85xx_defconfig
arc                     haps_hs_smp_defconfig
powerpc                     mpc512x_defconfig
arm                  randconfig-c002-20211207
arm                  randconfig-c002-20211203
arm                  randconfig-c002-20211205
arm                  randconfig-c002-20211204
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211203
x86_64               randconfig-a005-20211203
x86_64               randconfig-a001-20211203
x86_64               randconfig-a002-20211203
x86_64               randconfig-a004-20211203
x86_64               randconfig-a003-20211203
x86_64               randconfig-a006-20211207
x86_64               randconfig-a005-20211207
x86_64               randconfig-a001-20211207
x86_64               randconfig-a002-20211207
x86_64               randconfig-a004-20211207
x86_64               randconfig-a003-20211207
i386                 randconfig-a001-20211203
i386                 randconfig-a005-20211203
i386                 randconfig-a002-20211203
i386                 randconfig-a003-20211203
i386                 randconfig-a006-20211203
i386                 randconfig-a004-20211203
i386                 randconfig-a001-20211207
i386                 randconfig-a005-20211207
i386                 randconfig-a002-20211207
i386                 randconfig-a003-20211207
i386                 randconfig-a006-20211207
i386                 randconfig-a004-20211207
i386                 randconfig-a001-20211205
i386                 randconfig-a005-20211205
i386                 randconfig-a003-20211205
i386                 randconfig-a002-20211205
i386                 randconfig-a006-20211205
i386                 randconfig-a004-20211205
x86_64               randconfig-a016-20211208
x86_64               randconfig-a011-20211208
x86_64               randconfig-a013-20211208
x86_64               randconfig-a012-20211208
x86_64               randconfig-a015-20211208
x86_64               randconfig-a014-20211208
x86_64               randconfig-a016-20211206
x86_64               randconfig-a011-20211206
x86_64               randconfig-a013-20211206
x86_64               randconfig-a014-20211206
x86_64               randconfig-a012-20211206
x86_64               randconfig-a015-20211206
i386                 randconfig-a013-20211204
i386                 randconfig-a016-20211204
i386                 randconfig-a011-20211204
i386                 randconfig-a014-20211204
i386                 randconfig-a012-20211204
i386                 randconfig-a015-20211204
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211206
arm                  randconfig-c002-20211206
riscv                randconfig-c006-20211206
mips                 randconfig-c004-20211206
i386                 randconfig-c001-20211206
powerpc              randconfig-c003-20211206
s390                 randconfig-c005-20211206
x86_64               randconfig-c007-20211207
arm                  randconfig-c002-20211207
riscv                randconfig-c006-20211207
mips                 randconfig-c004-20211207
i386                 randconfig-c001-20211207
powerpc              randconfig-c003-20211207
s390                 randconfig-c005-20211207
arm                  randconfig-c002-20211203
x86_64               randconfig-c007-20211203
riscv                randconfig-c006-20211203
mips                 randconfig-c004-20211203
i386                 randconfig-c001-20211203
powerpc              randconfig-c003-20211203
s390                 randconfig-c005-20211203
x86_64               randconfig-c007-20211205
arm                  randconfig-c002-20211205
riscv                randconfig-c006-20211205
mips                 randconfig-c004-20211205
i386                 randconfig-c001-20211205
powerpc              randconfig-c003-20211205
s390                 randconfig-c005-20211205
i386                 randconfig-a001-20211206
i386                 randconfig-a005-20211206
i386                 randconfig-a002-20211206
i386                 randconfig-a003-20211206
i386                 randconfig-a006-20211206
i386                 randconfig-a004-20211206
x86_64               randconfig-a016-20211207
x86_64               randconfig-a011-20211207
x86_64               randconfig-a013-20211207
x86_64               randconfig-a014-20211207
x86_64               randconfig-a015-20211207
x86_64               randconfig-a012-20211207
x86_64               randconfig-a016-20211203
x86_64               randconfig-a011-20211203
x86_64               randconfig-a013-20211203
x86_64               randconfig-a014-20211203
x86_64               randconfig-a015-20211203
x86_64               randconfig-a012-20211203
i386                 randconfig-a016-20211203
i386                 randconfig-a013-20211203
i386                 randconfig-a011-20211203
i386                 randconfig-a014-20211203
i386                 randconfig-a012-20211203
i386                 randconfig-a015-20211203
i386                 randconfig-a013-20211205
i386                 randconfig-a016-20211205
i386                 randconfig-a011-20211205
i386                 randconfig-a014-20211205
i386                 randconfig-a012-20211205
i386                 randconfig-a015-20211205
i386                 randconfig-a016-20211207
i386                 randconfig-a013-20211207
i386                 randconfig-a011-20211207
i386                 randconfig-a014-20211207
i386                 randconfig-a012-20211207
i386                 randconfig-a015-20211207
x86_64               randconfig-a006-20211204
x86_64               randconfig-a005-20211204
x86_64               randconfig-a001-20211204
x86_64               randconfig-a002-20211204
x86_64               randconfig-a004-20211204
x86_64               randconfig-a003-20211204
hexagon              randconfig-r045-20211203
s390                 randconfig-r044-20211203
hexagon              randconfig-r041-20211203
riscv                randconfig-r042-20211203
hexagon              randconfig-r045-20211207
s390                 randconfig-r044-20211207
riscv                randconfig-r042-20211207
hexagon              randconfig-r041-20211207
hexagon              randconfig-r045-20211204
hexagon              randconfig-r041-20211204
hexagon              randconfig-r045-20211206
hexagon              randconfig-r041-20211206

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
