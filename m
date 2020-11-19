Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0652B895F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 02:13:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc1sS4HB6zDqJf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 12:13:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc1qF15CyzDqc8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 12:11:50 +1100 (AEDT)
IronPort-SDR: yWUpkoZXhTw2LbK5Tp3m97xRWZcIgqEKW3xrZJxmlCSmSpeaVkTielIdqwZgQeOX12dsrCwP3F
 W25Vl3jmgqEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="232825337"
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; d="scan'208";a="232825337"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 17:11:48 -0800
IronPort-SDR: U1XmwYKhSz1uVnQmleL5bsPE21zCc98k8qC76Tovs9pSinmQvEH2o4VSIW1x5AhFYmmyqViEG4
 3bSTqIo47kFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; d="scan'208";a="363189014"
Received: from lkp-server01.sh.intel.com (HELO cf7a658f8e69) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 18 Nov 2020 17:11:47 -0800
Received: from kbuild by cf7a658f8e69 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kfYUE-00001k-Dp; Thu, 19 Nov 2020 01:11:46 +0000
Date: Thu, 19 Nov 2020 09:11:40 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 a1062188413df416db21b02ffe4bd60228ad6240
Message-ID: <5fb5c64c.Kh8XJu7gkZ7dj32i%lkp@intel.com>
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
branch HEAD: a1062188413df416db21b02ffe4bd60228ad6240  powerpc: fix -Wimplicit-fallthrough

elapsed time: 726m

configs tested: 155
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                         ap325rxa_defconfig
mips                  maltasmvp_eva_defconfig
mips                      pic32mzda_defconfig
powerpc                      bamboo_defconfig
powerpc                     tqm8560_defconfig
m68k                          sun3x_defconfig
arc                        nsim_700_defconfig
mips                      loongson3_defconfig
arm                           sunxi_defconfig
nios2                            alldefconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                      ppc6xx_defconfig
powerpc                     taishan_defconfig
powerpc                     skiroot_defconfig
powerpc                    adder875_defconfig
sh                ecovec24-romimage_defconfig
m68k                            mac_defconfig
sh                           sh2007_defconfig
sh                          polaris_defconfig
arm                       aspeed_g5_defconfig
arm                           stm32_defconfig
powerpc                     sbc8548_defconfig
arm                   milbeaut_m10v_defconfig
sh                   sh7724_generic_defconfig
arm                         s3c6400_defconfig
m68k                        mvme16x_defconfig
mips                        omega2p_defconfig
mips                    maltaup_xpa_defconfig
mips                       bmips_be_defconfig
s390                          debug_defconfig
mips                            e55_defconfig
sh                     sh7710voipgw_defconfig
mips                 decstation_r4k_defconfig
powerpc                      arches_defconfig
arm                          pcm027_defconfig
mips                           ip32_defconfig
mips                  cavium_octeon_defconfig
ia64                        generic_defconfig
mips                        nlm_xlr_defconfig
powerpc                     tqm8540_defconfig
mips                        bcm63xx_defconfig
powerpc                  mpc885_ads_defconfig
sh                           se7722_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                     stx_gp3_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                      pcm030_defconfig
powerpc                      ppc64e_defconfig
sh                         ecovec24_defconfig
arm                         socfpga_defconfig
sh                        edosk7760_defconfig
sh                               j2_defconfig
arm                          exynos_defconfig
xtensa                  cadence_csp_defconfig
mips                         rt305x_defconfig
sh                               alldefconfig
arm                      tct_hammer_defconfig
sh                             sh03_defconfig
nios2                         10m50_defconfig
um                           x86_64_defconfig
arm                       netwinder_defconfig
arm                         s3c2410_defconfig
mips                      bmips_stb_defconfig
i386                                defconfig
s390                             alldefconfig
arm                           h5000_defconfig
arm                        neponset_defconfig
arc                                 defconfig
riscv                    nommu_virt_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                       spear13xx_defconfig
sh                           se7705_defconfig
arm                         cm_x300_defconfig
sh                          r7780mp_defconfig
arc                              alldefconfig
powerpc                     mpc83xx_defconfig
mips                         tb0219_defconfig
microblaze                          defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
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
x86_64               randconfig-a005-20201118
x86_64               randconfig-a003-20201118
x86_64               randconfig-a004-20201118
x86_64               randconfig-a002-20201118
x86_64               randconfig-a006-20201118
x86_64               randconfig-a001-20201118
i386                 randconfig-a006-20201118
i386                 randconfig-a005-20201118
i386                 randconfig-a002-20201118
i386                 randconfig-a001-20201118
i386                 randconfig-a003-20201118
i386                 randconfig-a004-20201118
i386                 randconfig-a006-20201119
i386                 randconfig-a005-20201119
i386                 randconfig-a002-20201119
i386                 randconfig-a001-20201119
i386                 randconfig-a003-20201119
i386                 randconfig-a004-20201119
i386                 randconfig-a012-20201118
i386                 randconfig-a014-20201118
i386                 randconfig-a016-20201118
i386                 randconfig-a011-20201118
i386                 randconfig-a013-20201118
i386                 randconfig-a015-20201118
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20201118
x86_64               randconfig-a014-20201118
x86_64               randconfig-a011-20201118
x86_64               randconfig-a013-20201118
x86_64               randconfig-a016-20201118
x86_64               randconfig-a012-20201118

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
