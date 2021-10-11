Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CB442848B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 03:21:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSLbt6y2Gz2yQ3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 12:21:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSLbR1MCHz2y8R
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 12:21:02 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10133"; a="207585598"
X-IronPort-AV: E=Sophos;i="5.85,363,1624345200"; d="scan'208";a="207585598"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2021 18:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,363,1624345200"; d="scan'208";a="562018577"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Oct 2021 18:19:57 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mZjyu-0001jF-SD; Mon, 11 Oct 2021 01:19:56 +0000
Date: Mon, 11 Oct 2021 09:19:16 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS ece9c55cc2f2c408240cd5627ea46926e9d4e5eb
Message-ID: <61639114.qBnnahvZRt7CIA2y%lkp@intel.com>
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
branch HEAD: ece9c55cc2f2c408240cd5627ea46926e9d4e5eb  Automatic merge of 'master' into merge (2021-10-10 22:52)

elapsed time: 723m

configs tested: 208
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211010
mips                 randconfig-c004-20211010
powerpc                    ge_imp3a_defconfig
m68k                       m5249evb_defconfig
arm                           viper_defconfig
openrisc                 simple_smp_defconfig
arm                       omap2plus_defconfig
m68k                       m5475evb_defconfig
sh                               allmodconfig
powerpc                   lite5200b_defconfig
arm                          imote2_defconfig
powerpc                   motionpro_defconfig
mips                         tb0219_defconfig
ia64                          tiger_defconfig
arm                   milbeaut_m10v_defconfig
mips                          rb532_defconfig
s390                       zfcpdump_defconfig
mips                     loongson2k_defconfig
mips                        maltaup_defconfig
sh                        apsh4ad0a_defconfig
powerpc                      ppc40x_defconfig
arm                            xcep_defconfig
arm                          badge4_defconfig
mips                      maltasmvp_defconfig
mips                         cobalt_defconfig
sh                           se7780_defconfig
arm                         cm_x300_defconfig
sh                      rts7751r2d1_defconfig
powerpc                     ep8248e_defconfig
powerpc                     ksi8560_defconfig
mips                           ip28_defconfig
arm                         bcm2835_defconfig
powerpc                     rainier_defconfig
arm                          exynos_defconfig
arm                          simpad_defconfig
arm                       imx_v4_v5_defconfig
powerpc                     redwood_defconfig
sparc64                             defconfig
powerpc                         wii_defconfig
ia64                         bigsur_defconfig
mips                        bcm63xx_defconfig
arm                            pleb_defconfig
arm                        mvebu_v7_defconfig
m68k                          multi_defconfig
mips                   sb1250_swarm_defconfig
powerpc64                           defconfig
powerpc                    mvme5100_defconfig
powerpc                        warp_defconfig
xtensa                              defconfig
openrisc                    or1ksim_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                 mpc836x_mds_defconfig
nios2                            alldefconfig
powerpc                    adder875_defconfig
sh                           se7343_defconfig
h8300                               defconfig
sh                          lboxre2_defconfig
powerpc                    sam440ep_defconfig
powerpc                    amigaone_defconfig
sh                         apsh4a3a_defconfig
sh                               j2_defconfig
powerpc                       eiger_defconfig
arm                         axm55xx_defconfig
arm                           sama7_defconfig
arm                          iop32x_defconfig
powerpc                         ps3_defconfig
riscv                    nommu_k210_defconfig
nds32                               defconfig
h8300                            alldefconfig
powerpc                  iss476-smp_defconfig
mips                         rt305x_defconfig
arm                         lpc18xx_defconfig
powerpc                          g5_defconfig
m68k                         amcore_defconfig
m68k                       bvme6000_defconfig
ia64                      gensparse_defconfig
arm                             pxa_defconfig
sh                           se7206_defconfig
sh                           se7724_defconfig
arm                        oxnas_v6_defconfig
arm                        realview_defconfig
powerpc                     sequoia_defconfig
sparc                       sparc32_defconfig
arm                         orion5x_defconfig
arm                  colibri_pxa300_defconfig
powerpc                      acadia_defconfig
xtensa                          iss_defconfig
arm                          pxa910_defconfig
h8300                       h8s-sim_defconfig
sh                           se7750_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                  decstation_64_defconfig
sh                             shx3_defconfig
powerpc                      mgcoge_defconfig
mips                          malta_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                        cell_defconfig
arc                          axs103_defconfig
m68k                        mvme16x_defconfig
arm                       cns3420vb_defconfig
arm                            hisi_defconfig
arc                           tb10x_defconfig
arm                         vf610m4_defconfig
sh                             espt_defconfig
s390                             alldefconfig
arm                      integrator_defconfig
sh                         ap325rxa_defconfig
arm                          pcm027_defconfig
arm                  colibri_pxa270_defconfig
um                                  defconfig
arm                  randconfig-c002-20211010
x86_64               randconfig-c001-20211010
arm                  randconfig-c002-20211011
i386                 randconfig-c001-20211011
x86_64               randconfig-c001-20211011
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
s390                             allmodconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20211010
x86_64               randconfig-a006-20211010
x86_64               randconfig-a001-20211010
x86_64               randconfig-a005-20211010
x86_64               randconfig-a002-20211010
x86_64               randconfig-a003-20211010
i386                 randconfig-a001-20211010
i386                 randconfig-a003-20211010
i386                 randconfig-a004-20211010
i386                 randconfig-a005-20211010
i386                 randconfig-a002-20211010
i386                 randconfig-a006-20211010
x86_64               randconfig-a015-20211011
x86_64               randconfig-a012-20211011
x86_64               randconfig-a016-20211011
x86_64               randconfig-a014-20211011
x86_64               randconfig-a013-20211011
x86_64               randconfig-a011-20211011
arc                  randconfig-r043-20211010
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
arm                  randconfig-c002-20211010
mips                 randconfig-c004-20211010
i386                 randconfig-c001-20211010
s390                 randconfig-c005-20211010
x86_64               randconfig-c007-20211010
powerpc              randconfig-c003-20211010
riscv                randconfig-c006-20211010
x86_64               randconfig-a015-20211010
x86_64               randconfig-a012-20211010
x86_64               randconfig-a016-20211010
x86_64               randconfig-a014-20211010
x86_64               randconfig-a013-20211010
x86_64               randconfig-a011-20211010
i386                 randconfig-a016-20211010
i386                 randconfig-a014-20211010
i386                 randconfig-a011-20211010
i386                 randconfig-a015-20211010
i386                 randconfig-a012-20211010
i386                 randconfig-a013-20211010
x86_64               randconfig-a004-20211011
x86_64               randconfig-a006-20211011
x86_64               randconfig-a001-20211011
x86_64               randconfig-a005-20211011
x86_64               randconfig-a002-20211011
x86_64               randconfig-a003-20211011
hexagon              randconfig-r041-20211010
s390                 randconfig-r044-20211010
riscv                randconfig-r042-20211010
hexagon              randconfig-r045-20211010

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
