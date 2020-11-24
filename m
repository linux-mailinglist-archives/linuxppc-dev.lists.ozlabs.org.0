Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F29B2C1B66
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 03:24:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cg7C300PVzDqTj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 13:24:47 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cg77c6Y3nzDqL9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 13:21:45 +1100 (AEDT)
IronPort-SDR: d/BO/pteOoVvGoi7LfgawOPuEBQDKtQyjaxgV+Tk0k4YB7t9rAgH0KmN7FvV5qIZm3AGNfCYgR
 uM0ZgNNg0X7Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="158920865"
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; d="scan'208";a="158920865"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 18:21:42 -0800
IronPort-SDR: BLBPcT6IqXlsKo1n3lZfsGpT+Cfjj1v+7e171959053NQ2wikmsyoWyvgv6WU2vDWFEGfL+A7C
 ZOPwfedLAqqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; d="scan'208";a="546649476"
Received: from lkp-server01.sh.intel.com (HELO 1138cb5768e3) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 23 Nov 2020 18:21:41 -0800
Received: from kbuild by 1138cb5768e3 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1khNxb-0000In-UK; Tue, 24 Nov 2020 02:21:39 +0000
Date: Tue, 24 Nov 2020 10:21:32 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 c250581fcf84c34cbaf5b535512b60a5e96970f6
Message-ID: <5fbc6e2c.sSRdyb752bP83nwD%lkp@intel.com>
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
branch HEAD: c250581fcf84c34cbaf5b535512b60a5e96970f6  powerpc/vdso: Provide __kernel_clock_gettime64() on vdso32

elapsed time: 5500m

configs tested: 212
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                     haps_hs_smp_defconfig
mips                         db1xxx_defconfig
mips                      malta_kvm_defconfig
m68k                          sun3x_defconfig
s390                                defconfig
mips                  cavium_octeon_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                 xes_mpc85xx_defconfig
sh                          sdk7786_defconfig
arm                          pxa168_defconfig
arm                            zeus_defconfig
powerpc                   bluestone_defconfig
sh                         apsh4a3a_defconfig
arm                        mvebu_v7_defconfig
sh                     magicpanelr2_defconfig
arm                         nhk8815_defconfig
xtensa                generic_kc705_defconfig
arm                      tct_hammer_defconfig
arm                        vexpress_defconfig
powerpc                 canyonlands_defconfig
powerpc                     kilauea_defconfig
mips                   sb1250_swarm_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                           u8500_defconfig
powerpc                     tqm8555_defconfig
c6x                        evmc6472_defconfig
arm                         hackkit_defconfig
sh                   sh7724_generic_defconfig
powerpc                      obs600_defconfig
powerpc                     mpc512x_defconfig
arm                           h3600_defconfig
arm                        cerfcube_defconfig
sh                        sh7757lcr_defconfig
sh                          rsk7201_defconfig
arm                              alldefconfig
mips                             allyesconfig
arm                        keystone_defconfig
mips                           ip32_defconfig
arm                            u300_defconfig
arm                         palmz72_defconfig
mips                          ath25_defconfig
powerpc                      tqm8xx_defconfig
m68k                        mvme16x_defconfig
powerpc                  storcenter_defconfig
powerpc                      acadia_defconfig
mips                        vocore2_defconfig
sh                          rsk7269_defconfig
parisc                           alldefconfig
mips                      pic32mzda_defconfig
arm                            xcep_defconfig
sh                           se7343_defconfig
sh                        dreamcast_defconfig
sh                           se7724_defconfig
csky                             alldefconfig
arm                            dove_defconfig
m68k                           sun3_defconfig
sh                   rts7751r2dplus_defconfig
sh                          rsk7203_defconfig
arm                          gemini_defconfig
arm                         s5pv210_defconfig
sparc64                          alldefconfig
arm                       aspeed_g4_defconfig
arm                        shmobile_defconfig
c6x                                 defconfig
arc                              alldefconfig
arm                          ep93xx_defconfig
alpha                               defconfig
ia64                            zx1_defconfig
ia64                      gensparse_defconfig
sh                            hp6xx_defconfig
mips                           ip27_defconfig
powerpc                    mvme5100_defconfig
arm                  colibri_pxa270_defconfig
nds32                             allnoconfig
powerpc                           allnoconfig
mips                        jmr3927_defconfig
xtensa                          iss_defconfig
nds32                            alldefconfig
arm                         cm_x300_defconfig
arm                     davinci_all_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                      arches_defconfig
mips                        maltaup_defconfig
powerpc                     tqm8540_defconfig
powerpc                     akebono_defconfig
arm                        realview_defconfig
arm                      footbridge_defconfig
sh                           se7721_defconfig
powerpc                     powernv_defconfig
sh                           se7751_defconfig
mips                     loongson1b_defconfig
arm                          tango4_defconfig
xtensa                  nommu_kc705_defconfig
arm                          moxart_defconfig
sh                          sdk7780_defconfig
riscv                          rv32_defconfig
mips                     decstation_defconfig
arm                        mvebu_v5_defconfig
powerpc                      pcm030_defconfig
arm                        magician_defconfig
um                            kunit_defconfig
powerpc                     ppa8548_defconfig
mips                       lemote2f_defconfig
mips                            ar7_defconfig
sparc                       sparc64_defconfig
arc                                 defconfig
sh                          urquell_defconfig
sh                         ecovec24_defconfig
powerpc                     pq2fads_defconfig
powerpc                    socrates_defconfig
arm                           corgi_defconfig
powerpc                       ppc64_defconfig
powerpc                     taishan_defconfig
mips                           ci20_defconfig
arc                     nsimosci_hs_defconfig
xtensa                  audio_kc705_defconfig
mips                       rbtx49xx_defconfig
arm                            mps2_defconfig
c6x                        evmc6474_defconfig
arm                        spear3xx_defconfig
mips                          rb532_defconfig
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
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a006-20201120
x86_64               randconfig-a003-20201120
x86_64               randconfig-a004-20201120
x86_64               randconfig-a005-20201120
x86_64               randconfig-a001-20201120
x86_64               randconfig-a002-20201120
i386                 randconfig-a004-20201123
i386                 randconfig-a003-20201123
i386                 randconfig-a002-20201123
i386                 randconfig-a005-20201123
i386                 randconfig-a001-20201123
i386                 randconfig-a006-20201123
i386                 randconfig-a004-20201120
i386                 randconfig-a003-20201120
i386                 randconfig-a002-20201120
i386                 randconfig-a005-20201120
i386                 randconfig-a001-20201120
i386                 randconfig-a006-20201120
x86_64               randconfig-a015-20201123
x86_64               randconfig-a011-20201123
x86_64               randconfig-a014-20201123
x86_64               randconfig-a016-20201123
x86_64               randconfig-a012-20201123
x86_64               randconfig-a013-20201123
i386                 randconfig-a012-20201120
i386                 randconfig-a013-20201120
i386                 randconfig-a011-20201120
i386                 randconfig-a016-20201120
i386                 randconfig-a014-20201120
i386                 randconfig-a015-20201120
i386                 randconfig-a012-20201123
i386                 randconfig-a013-20201123
i386                 randconfig-a011-20201123
i386                 randconfig-a016-20201123
i386                 randconfig-a014-20201123
i386                 randconfig-a015-20201123
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
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
x86_64               randconfig-a006-20201123
x86_64               randconfig-a003-20201123
x86_64               randconfig-a004-20201123
x86_64               randconfig-a005-20201123
x86_64               randconfig-a002-20201123
x86_64               randconfig-a001-20201123
x86_64               randconfig-a015-20201120
x86_64               randconfig-a011-20201120
x86_64               randconfig-a014-20201120
x86_64               randconfig-a016-20201120
x86_64               randconfig-a012-20201120
x86_64               randconfig-a013-20201120

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
