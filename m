Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 021FD294725
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 06:08:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGH6c5G2bzDqN2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 15:08:40 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGH4938sczDqY2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 15:06:30 +1100 (AEDT)
IronPort-SDR: zYLW0wR7LBotjVkX3/hLaY6lw2kHa1XyUQ70assfmYTD2N8s0sisYz2+CCiyGcGnex9B1uTsmo
 1JLuIb2RBMBA==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="154261154"
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; d="scan'208";a="154261154"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 21:06:26 -0700
IronPort-SDR: IYohpdW+xFjlW3Ln99JRChPT/T1vYbUQPcit85FcUIYgMDkWiW2Rp3LpQpS4/WhiBuC4riD4iU
 oSA4NBHMgrRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; d="scan'208";a="332466602"
Received: from lkp-server02.sh.intel.com (HELO fbeef087c6a9) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 20 Oct 2020 21:06:25 -0700
Received: from kbuild by fbeef087c6a9 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kV5OK-00001o-Nh; Wed, 21 Oct 2020 04:06:24 +0000
Date: Wed, 21 Oct 2020 12:05:43 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 d1781f23704707d350b8c9006e2bdf5394bf91b2
Message-ID: <5f8fb397.VopV8qi0Rd5FJmMf%lkp@intel.com>
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
branch HEAD: d1781f23704707d350b8c9006e2bdf5394bf91b2  selftests/powerpc: Make alignment handler test P9N DD2.1 vector CI load workaround

elapsed time: 930m

configs tested: 212
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                   bluestone_defconfig
sh                          rsk7203_defconfig
arc                 nsimosci_hs_smp_defconfig
sparc                            alldefconfig
m68k                          sun3x_defconfig
arm                         palmz72_defconfig
ia64                                defconfig
sh                        edosk7760_defconfig
arm                        realview_defconfig
i386                                defconfig
mips                       rbtx49xx_defconfig
arm                  colibri_pxa300_defconfig
sh                           se7722_defconfig
sh                          kfr2r09_defconfig
mips                  maltasmvp_eva_defconfig
m68k                         apollo_defconfig
arm                       aspeed_g5_defconfig
alpha                            alldefconfig
m68k                         amcore_defconfig
mips                            e55_defconfig
sh                        sh7757lcr_defconfig
arm                         ebsa110_defconfig
powerpc                      obs600_defconfig
sh                             sh03_defconfig
riscv                            allyesconfig
powerpc                       maple_defconfig
um                           x86_64_defconfig
sh                            titan_defconfig
mips                          rb532_defconfig
sh                          lboxre2_defconfig
arm                         hackkit_defconfig
um                             i386_defconfig
openrisc                 simple_smp_defconfig
h8300                            allyesconfig
powerpc                    sam440ep_defconfig
powerpc                    klondike_defconfig
sh                ecovec24-romimage_defconfig
arm                       spear13xx_defconfig
ia64                             allmodconfig
m68k                        mvme16x_defconfig
mips                      loongson3_defconfig
mips                         tb0219_defconfig
powerpc                          g5_defconfig
m68k                        mvme147_defconfig
arm                  colibri_pxa270_defconfig
mips                  decstation_64_defconfig
mips                malta_kvm_guest_defconfig
mips                        workpad_defconfig
sh                         ecovec24_defconfig
xtensa                  nommu_kc705_defconfig
arc                        vdk_hs38_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                    maltaup_xpa_defconfig
mips                      pistachio_defconfig
mips                 decstation_r4k_defconfig
sh                     magicpanelr2_defconfig
mips                     loongson1c_defconfig
mips                       capcella_defconfig
arc                              alldefconfig
powerpc                      ppc40x_defconfig
mips                           ci20_defconfig
nios2                               defconfig
powerpc                      pcm030_defconfig
csky                                defconfig
powerpc64                        alldefconfig
mips                       lemote2f_defconfig
powerpc                 mpc836x_rdk_defconfig
s390                          debug_defconfig
powerpc                       ppc64_defconfig
sh                            shmin_defconfig
arm                           viper_defconfig
powerpc                  iss476-smp_defconfig
powerpc                   motionpro_defconfig
sh                          sdk7786_defconfig
arm                          ep93xx_defconfig
sh                              ul2_defconfig
sh                         ap325rxa_defconfig
arm                         at91_dt_defconfig
arm                   milbeaut_m10v_defconfig
mips                         mpc30x_defconfig
mips                          ath79_defconfig
s390                       zfcpdump_defconfig
arm                        clps711x_defconfig
sh                   sh7724_generic_defconfig
m68k                        m5307c3_defconfig
arc                           tb10x_defconfig
mips                         tb0287_defconfig
sh                          r7785rp_defconfig
powerpc                     stx_gp3_defconfig
mips                      maltasmvp_defconfig
arm                    vt8500_v6_v7_defconfig
sh                          landisk_defconfig
arm                            dove_defconfig
arm                             pxa_defconfig
powerpc                     tqm8540_defconfig
powerpc                      pmac32_defconfig
powerpc                 mpc834x_itx_defconfig
sparc64                             defconfig
powerpc                     taishan_defconfig
sh                  sh7785lcr_32bit_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
powerpc                 mpc832x_rdb_defconfig
mips                          rm200_defconfig
parisc                generic-64bit_defconfig
arm                            mps2_defconfig
sh                          urquell_defconfig
arm                           stm32_defconfig
powerpc                 canyonlands_defconfig
arm                       omap2plus_defconfig
powerpc                      acadia_defconfig
h8300                     edosk2674_defconfig
x86_64                              defconfig
powerpc                 mpc836x_mds_defconfig
arc                          axs103_defconfig
xtensa                         virt_defconfig
arm                     eseries_pxa_defconfig
arm                         assabet_defconfig
sh                            migor_defconfig
ia64                             alldefconfig
openrisc                            defconfig
mips                          malta_defconfig
xtensa                    xip_kc705_defconfig
m68k                          amiga_defconfig
arc                     nsimosci_hs_defconfig
arm                       aspeed_g4_defconfig
arm                          moxart_defconfig
powerpc                     rainier_defconfig
arm                          badge4_defconfig
m68k                          multi_defconfig
arm                           corgi_defconfig
parisc                              defconfig
ia64                        generic_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                      maltaaprp_defconfig
mips                         rt305x_defconfig
m68k                       m5249evb_defconfig
xtensa                          iss_defconfig
mips                        nlm_xlr_defconfig
sh                          polaris_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                       imx_v6_v7_defconfig
riscv                               defconfig
powerpc                  mpc866_ads_defconfig
arm                          pxa3xx_defconfig
nios2                            alldefconfig
powerpc                 mpc8560_ads_defconfig
arm                            zeus_defconfig
xtensa                  cadence_csp_defconfig
arc                              allyesconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20201020
i386                 randconfig-a005-20201020
i386                 randconfig-a003-20201020
i386                 randconfig-a001-20201020
i386                 randconfig-a006-20201020
i386                 randconfig-a004-20201020
x86_64               randconfig-a011-20201020
x86_64               randconfig-a013-20201020
x86_64               randconfig-a016-20201020
x86_64               randconfig-a015-20201020
x86_64               randconfig-a012-20201020
x86_64               randconfig-a014-20201020
i386                 randconfig-a016-20201020
i386                 randconfig-a014-20201020
i386                 randconfig-a015-20201020
i386                 randconfig-a013-20201020
i386                 randconfig-a012-20201020
i386                 randconfig-a011-20201020
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20201020
x86_64               randconfig-a002-20201020
x86_64               randconfig-a003-20201020
x86_64               randconfig-a006-20201020
x86_64               randconfig-a005-20201020
x86_64               randconfig-a004-20201020

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
