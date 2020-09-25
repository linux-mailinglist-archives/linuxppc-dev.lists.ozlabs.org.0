Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9BB277DC9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 04:03:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ByFYx736QzDqjR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 12:03:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ByFXM4rvkzDqdf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Sep 2020 12:01:54 +1000 (AEST)
IronPort-SDR: wccRpTb2tu8+kT9C7aIE7a1rNHJfDaE+vBF4EdfBfgbNpTSJdquyCAqlDHIMsfyMqjuTT9bG83
 BSA0phggiaqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="160667733"
X-IronPort-AV: E=Sophos;i="5.77,300,1596524400"; d="scan'208";a="160667733"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 19:01:52 -0700
IronPort-SDR: f2M2IVMxQBSQoXvPe2mqD1Fut1um0J+mqU5qVcP1o+pSWbqNWKztheTZiVl4je5FpOCX3jkkc0
 Ki3N3MA+gMxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,300,1596524400"; d="scan'208";a="455630479"
Received: from lkp-server01.sh.intel.com (HELO d1a6b931d9c6) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 24 Sep 2020 19:01:50 -0700
Received: from kbuild by d1a6b931d9c6 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kLd3W-0000Dc-7T; Fri, 25 Sep 2020 02:01:50 +0000
Date: Fri, 25 Sep 2020 10:00:59 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS ebbfeef0d8093a06ff39c60105b6650be3344cbe
Message-ID: <5f6d4f5b.dJYUj8ct3v6NhD5G%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  next
branch HEAD: ebbfeef0d8093a06ff39c60105b6650be3344cbe  powerpc/32: Declare stack_overflow_exception() prototype

elapsed time: 8839m

configs tested: 435
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                          ep93xx_defconfig
powerpc                      pcm030_defconfig
powerpc                    socrates_defconfig
powerpc                      katmai_defconfig
sh                           se7712_defconfig
arm                        mvebu_v5_defconfig
arm                        mvebu_v7_defconfig
arm                          lpd270_defconfig
sh                        sh7757lcr_defconfig
riscv                    nommu_k210_defconfig
m68k                          amiga_defconfig
powerpc                 mpc832x_mds_defconfig
ia64                             alldefconfig
riscv                          rv32_defconfig
arm                           corgi_defconfig
arm                          pcm027_defconfig
powerpc                      bamboo_defconfig
c6x                              alldefconfig
arc                          axs103_defconfig
arm                     eseries_pxa_defconfig
arm                            xcep_defconfig
powerpc                      acadia_defconfig
mips                 decstation_r4k_defconfig
arc                     nsimosci_hs_defconfig
mips                malta_kvm_guest_defconfig
mips                           gcw0_defconfig
sh                             sh03_defconfig
arm                             ezx_defconfig
mips                      pistachio_defconfig
nios2                         3c120_defconfig
powerpc                     tqm8555_defconfig
arm                          iop32x_defconfig
ia64                         bigsur_defconfig
sh                     magicpanelr2_defconfig
powerpc                    sam440ep_defconfig
sh                      rts7751r2d1_defconfig
powerpc                    klondike_defconfig
arm                       imx_v6_v7_defconfig
arm                             rpc_defconfig
c6x                              allyesconfig
arm                            u300_defconfig
powerpc                      ep88xc_defconfig
powerpc                          g5_defconfig
sh                        apsh4ad0a_defconfig
arm                         orion5x_defconfig
c6x                        evmc6474_defconfig
xtensa                  cadence_csp_defconfig
arm                         ebsa110_defconfig
sh                          rsk7264_defconfig
powerpc                 mpc8313_rdb_defconfig
ia64                          tiger_defconfig
mips                  maltasmvp_eva_defconfig
m68k                         apollo_defconfig
mips                      bmips_stb_defconfig
arm                       omap2plus_defconfig
m68k                             alldefconfig
mips                          malta_defconfig
arm                          pxa910_defconfig
mips                        vocore2_defconfig
mips                         tb0219_defconfig
m68k                          multi_defconfig
sh                ecovec24-romimage_defconfig
arm                           u8500_defconfig
powerpc                        warp_defconfig
arm                         assabet_defconfig
sh                          rsk7201_defconfig
arm                           efm32_defconfig
arm                          prima2_defconfig
sparc                       sparc64_defconfig
i386                             allyesconfig
sh                          rsk7269_defconfig
ia64                                defconfig
microblaze                    nommu_defconfig
arm                          pxa3xx_defconfig
powerpc                      mgcoge_defconfig
parisc                generic-32bit_defconfig
m68k                        m5272c3_defconfig
arm                         nhk8815_defconfig
i386                             alldefconfig
arm                        mini2440_defconfig
mips                         tb0226_defconfig
m68k                           sun3_defconfig
microblaze                          defconfig
sh                           se7750_defconfig
xtensa                         virt_defconfig
sparc                               defconfig
powerpc                         ps3_defconfig
mips                       bmips_be_defconfig
mips                        bcm47xx_defconfig
arm                          ixp4xx_defconfig
arm                    vt8500_v6_v7_defconfig
sh                          kfr2r09_defconfig
sh                           se7751_defconfig
mips                             allmodconfig
sh                     sh7710voipgw_defconfig
sh                           se7722_defconfig
arm                      tct_hammer_defconfig
powerpc                       ebony_defconfig
arm                          tango4_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      tqm8xx_defconfig
powerpc                    ge_imp3a_defconfig
mips                          rm200_defconfig
csky                                defconfig
i386                                defconfig
arm                     davinci_all_defconfig
m68k                       m5275evb_defconfig
powerpc                     tqm8548_defconfig
powerpc                 mpc834x_itx_defconfig
arm                           h5000_defconfig
arm                        multi_v5_defconfig
m68k                             allyesconfig
powerpc                     ep8248e_defconfig
sh                   secureedge5410_defconfig
powerpc                      ppc6xx_defconfig
sh                           se7619_defconfig
ia64                             allyesconfig
mips                           ip28_defconfig
m68k                       m5208evb_defconfig
s390                             allyesconfig
powerpc                      arches_defconfig
xtensa                              defconfig
arm                        spear3xx_defconfig
powerpc                  mpc866_ads_defconfig
arm                        clps711x_defconfig
powerpc                          allyesconfig
x86_64                              defconfig
ia64                            zx1_defconfig
powerpc                      obs600_defconfig
sh                           sh2007_defconfig
arm                            qcom_defconfig
sh                          r7780mp_defconfig
xtensa                    smp_lx200_defconfig
arm                             mxs_defconfig
mips                            e55_defconfig
powerpc                     ppa8548_defconfig
arm                       aspeed_g4_defconfig
arm                         axm55xx_defconfig
m68k                            q40_defconfig
openrisc                         alldefconfig
powerpc                     pseries_defconfig
sh                        sh7763rdp_defconfig
powerpc                      chrp32_defconfig
um                            kunit_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                 pnx8335_stb225_defconfig
c6x                                 defconfig
mips                           rs90_defconfig
powerpc                      ppc40x_defconfig
arm                  colibri_pxa300_defconfig
mips                      malta_kvm_defconfig
mips                            ar7_defconfig
arc                        nsim_700_defconfig
sh                            hp6xx_defconfig
arm                       mainstone_defconfig
sh                               alldefconfig
powerpc                      cm5200_defconfig
m68k                        mvme147_defconfig
powerpc                     tqm8560_defconfig
powerpc                     kmeter1_defconfig
m68k                          hp300_defconfig
sparc                            allyesconfig
sparc                       sparc32_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                   motionpro_defconfig
arm                         hackkit_defconfig
arc                     haps_hs_smp_defconfig
powerpc                 mpc8540_ads_defconfig
arm                  colibri_pxa270_defconfig
arm                       multi_v4t_defconfig
powerpc                      makalu_defconfig
sh                           se7343_defconfig
powerpc                     tqm8540_defconfig
arm                          exynos_defconfig
arm                       aspeed_g5_defconfig
mips                      loongson3_defconfig
powerpc                 mpc836x_mds_defconfig
x86_64                           allyesconfig
powerpc                        fsp2_defconfig
sh                           se7206_defconfig
arc                            hsdk_defconfig
mips                          ath79_defconfig
arm                          imote2_defconfig
arm                         at91_dt_defconfig
powerpc                     stx_gp3_defconfig
mips                        bcm63xx_defconfig
arc                           tb10x_defconfig
arm                      integrator_defconfig
powerpc                     sbc8548_defconfig
parisc                           alldefconfig
arc                             nps_defconfig
h8300                    h8300h-sim_defconfig
sh                          rsk7203_defconfig
arm                      footbridge_defconfig
m68k                       bvme6000_defconfig
sh                   rts7751r2dplus_defconfig
arm                        trizeps4_defconfig
sh                         microdev_defconfig
alpha                               defconfig
riscv                             allnoconfig
arm                       cns3420vb_defconfig
arm                         mv78xx0_defconfig
arm                          badge4_defconfig
m68k                        stmark2_defconfig
sh                           se7780_defconfig
sh                          landisk_defconfig
mips                     loongson1b_defconfig
mips                           xway_defconfig
sh                          lboxre2_defconfig
arc                 nsimosci_hs_smp_defconfig
riscv                            allmodconfig
openrisc                 simple_smp_defconfig
powerpc                     tqm8541_defconfig
arm                         s3c6400_defconfig
mips                        omega2p_defconfig
h8300                               defconfig
mips                       capcella_defconfig
mips                          rb532_defconfig
mips                        nlm_xlp_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                     tqm5200_defconfig
arc                         haps_hs_defconfig
arm                          simpad_defconfig
mips                           ci20_defconfig
powerpc               mpc834x_itxgp_defconfig
openrisc                            defconfig
arm                           sunxi_defconfig
arm                       imx_v4_v5_defconfig
arm                     am200epdkit_defconfig
powerpc                     rainier_defconfig
powerpc                        icon_defconfig
arm                        multi_v7_defconfig
arc                        nsimosci_defconfig
m68k                        mvme16x_defconfig
sparc64                          alldefconfig
arm                       versatile_defconfig
powerpc                     mpc83xx_defconfig
arm                          moxart_defconfig
powerpc                 linkstation_defconfig
mips                     decstation_defconfig
sh                        edosk7760_defconfig
powerpc                        cell_defconfig
s390                          debug_defconfig
c6x                         dsk6455_defconfig
sh                           se7721_defconfig
h8300                       h8s-sim_defconfig
sh                           se7724_defconfig
mips                  decstation_64_defconfig
m68k                          atari_defconfig
sh                          sdk7786_defconfig
arm                         palmz72_defconfig
powerpc                       eiger_defconfig
sh                          sdk7780_defconfig
powerpc                    gamecube_defconfig
h8300                            alldefconfig
sh                                  defconfig
arm                         lpc18xx_defconfig
mips                           ip27_defconfig
sh                   sh7724_generic_defconfig
sh                          polaris_defconfig
nds32                             allnoconfig
sh                        edosk7705_defconfig
arm                       netwinder_defconfig
arm                           spitz_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                      pmac32_defconfig
powerpc                     mpc5200_defconfig
s390                                defconfig
mips                          ath25_defconfig
mips                        jmr3927_defconfig
mips                       rbtx49xx_defconfig
mips                     cu1830-neo_defconfig
arc                                 defconfig
mips                      maltasmvp_defconfig
ia64                             allmodconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200924
i386                 randconfig-a006-20200924
i386                 randconfig-a003-20200924
i386                 randconfig-a004-20200924
i386                 randconfig-a005-20200924
i386                 randconfig-a001-20200924
i386                 randconfig-a002-20200921
i386                 randconfig-a006-20200921
i386                 randconfig-a003-20200921
i386                 randconfig-a004-20200921
i386                 randconfig-a005-20200921
i386                 randconfig-a001-20200921
i386                 randconfig-a002-20200923
i386                 randconfig-a006-20200923
i386                 randconfig-a003-20200923
i386                 randconfig-a004-20200923
i386                 randconfig-a005-20200923
i386                 randconfig-a001-20200923
i386                 randconfig-a004-20200917
i386                 randconfig-a006-20200917
i386                 randconfig-a003-20200917
i386                 randconfig-a001-20200917
i386                 randconfig-a002-20200917
i386                 randconfig-a005-20200917
i386                 randconfig-a004-20200918
i386                 randconfig-a001-20200918
i386                 randconfig-a003-20200918
i386                 randconfig-a006-20200918
i386                 randconfig-a002-20200918
i386                 randconfig-a005-20200918
x86_64               randconfig-a014-20200917
x86_64               randconfig-a011-20200917
x86_64               randconfig-a016-20200917
x86_64               randconfig-a012-20200917
x86_64               randconfig-a015-20200917
x86_64               randconfig-a013-20200917
x86_64               randconfig-a011-20200923
x86_64               randconfig-a013-20200923
x86_64               randconfig-a014-20200923
x86_64               randconfig-a015-20200923
x86_64               randconfig-a012-20200923
x86_64               randconfig-a016-20200923
x86_64               randconfig-a011-20200921
x86_64               randconfig-a013-20200921
x86_64               randconfig-a014-20200921
x86_64               randconfig-a015-20200921
x86_64               randconfig-a012-20200921
x86_64               randconfig-a016-20200921
x86_64               randconfig-a014-20200919
x86_64               randconfig-a011-20200919
x86_64               randconfig-a012-20200919
x86_64               randconfig-a016-20200919
x86_64               randconfig-a015-20200919
x86_64               randconfig-a013-20200919
x86_64               randconfig-a004-20200918
x86_64               randconfig-a006-20200918
x86_64               randconfig-a003-20200918
x86_64               randconfig-a002-20200918
x86_64               randconfig-a005-20200918
x86_64               randconfig-a001-20200918
i386                 randconfig-a015-20200917
i386                 randconfig-a014-20200917
i386                 randconfig-a011-20200917
i386                 randconfig-a013-20200917
i386                 randconfig-a016-20200917
i386                 randconfig-a012-20200917
i386                 randconfig-a012-20200921
i386                 randconfig-a014-20200921
i386                 randconfig-a016-20200921
i386                 randconfig-a013-20200921
i386                 randconfig-a011-20200921
i386                 randconfig-a015-20200921
i386                 randconfig-a012-20200920
i386                 randconfig-a014-20200920
i386                 randconfig-a016-20200920
i386                 randconfig-a013-20200920
i386                 randconfig-a011-20200920
i386                 randconfig-a015-20200920
i386                 randconfig-a012-20200923
i386                 randconfig-a014-20200923
i386                 randconfig-a016-20200923
i386                 randconfig-a013-20200923
i386                 randconfig-a011-20200923
i386                 randconfig-a015-20200923
i386                 randconfig-a012-20200924
i386                 randconfig-a014-20200924
i386                 randconfig-a016-20200924
i386                 randconfig-a013-20200924
i386                 randconfig-a011-20200924
i386                 randconfig-a015-20200924
i386                 randconfig-a015-20200918
i386                 randconfig-a011-20200918
i386                 randconfig-a014-20200918
i386                 randconfig-a013-20200918
i386                 randconfig-a012-20200918
i386                 randconfig-a016-20200918
x86_64               randconfig-a005-20200920
x86_64               randconfig-a003-20200920
x86_64               randconfig-a004-20200920
x86_64               randconfig-a002-20200920
x86_64               randconfig-a006-20200920
x86_64               randconfig-a001-20200920
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a005-20200923
x86_64               randconfig-a003-20200923
x86_64               randconfig-a004-20200923
x86_64               randconfig-a002-20200923
x86_64               randconfig-a006-20200923
x86_64               randconfig-a001-20200923
x86_64               randconfig-a006-20200917
x86_64               randconfig-a004-20200917
x86_64               randconfig-a003-20200917
x86_64               randconfig-a002-20200917
x86_64               randconfig-a001-20200917
x86_64               randconfig-a005-20200917
x86_64               randconfig-a005-20200921
x86_64               randconfig-a003-20200921
x86_64               randconfig-a004-20200921
x86_64               randconfig-a002-20200921
x86_64               randconfig-a006-20200921
x86_64               randconfig-a001-20200921
x86_64               randconfig-a011-20200922
x86_64               randconfig-a013-20200922
x86_64               randconfig-a014-20200922
x86_64               randconfig-a015-20200922
x86_64               randconfig-a012-20200922
x86_64               randconfig-a016-20200922
x86_64               randconfig-a011-20200920
x86_64               randconfig-a013-20200920
x86_64               randconfig-a014-20200920
x86_64               randconfig-a015-20200920
x86_64               randconfig-a012-20200920
x86_64               randconfig-a016-20200920

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
