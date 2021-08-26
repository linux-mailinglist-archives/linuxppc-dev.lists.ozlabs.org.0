Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5537F3F80EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 05:28:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gw7bC1c4Wz301j
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 13:28:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gw7Zl4twPz2xsJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 13:27:41 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="281372457"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="281372457"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:26:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="686785192"
Received: from lkp-server01.sh.intel.com (HELO 4fbc2b3ce5aa) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 25 Aug 2021 20:26:36 -0700
Received: from kbuild by 4fbc2b3ce5aa with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mJ62G-0000if-88; Thu, 26 Aug 2021 03:26:36 +0000
Date: Thu, 26 Aug 2021 11:25:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/ppc-kvm] BUILD SUCCESS
 0c8fb653d487d2873f5eefdcaf4cecff4e103828
Message-ID: <612709ae.ze8ji54r+uLWmtOW%lkp@intel.com>
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
branch HEAD: 0c8fb653d487d2873f5eefdcaf4cecff4e103828  powerpc/64s: Remove WORT SPR from POWER9/10

elapsed time: 736m

configs tested: 130
configs skipped: 86

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210825
sh                          rsk7269_defconfig
powerpc                      cm5200_defconfig
arm                           u8500_defconfig
powerpc                     mpc512x_defconfig
powerpc                       ebony_defconfig
arm                           sama5_defconfig
m68k                          amiga_defconfig
m68k                          sun3x_defconfig
xtensa                       common_defconfig
h8300                               defconfig
powerpc                     ep8248e_defconfig
powerpc                      katmai_defconfig
xtensa                  audio_kc705_defconfig
powerpc                    gamecube_defconfig
mips                      maltasmvp_defconfig
powerpc                   microwatt_defconfig
arm                         assabet_defconfig
sh                           se7343_defconfig
powerpc                 canyonlands_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                      ep88xc_defconfig
alpha                            alldefconfig
sh                          r7780mp_defconfig
powerpc                     tqm5200_defconfig
arm                           tegra_defconfig
arm                         axm55xx_defconfig
mips                         tb0219_defconfig
arm                          moxart_defconfig
mips                     decstation_defconfig
powerpc                 mpc8560_ads_defconfig
sh                            migor_defconfig
sh                               j2_defconfig
powerpc                      arches_defconfig
arc                            hsdk_defconfig
mips                         tb0226_defconfig
arm                        neponset_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                     ksi8560_defconfig
riscv                          rv32_defconfig
arm                             pxa_defconfig
powerpc                     tqm8540_defconfig
microblaze                      mmu_defconfig
powerpc                 mpc834x_itx_defconfig
mips                     loongson2k_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                     tqm8548_defconfig
ia64                             allyesconfig
arm                       netwinder_defconfig
arm                          imote2_defconfig
sh                      rts7751r2d1_defconfig
powerpc                     tqm8541_defconfig
sh                   sh7770_generic_defconfig
arm                       imx_v4_v5_defconfig
sh                          sdk7786_defconfig
powerpc                        icon_defconfig
m68k                          multi_defconfig
ia64                             allmodconfig
ia64                                defconfig
x86_64                            allnoconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a014-20210825
x86_64               randconfig-a015-20210825
x86_64               randconfig-a016-20210825
x86_64               randconfig-a013-20210825
x86_64               randconfig-a012-20210825
x86_64               randconfig-a011-20210825
i386                 randconfig-a011-20210825
i386                 randconfig-a016-20210825
i386                 randconfig-a012-20210825
i386                 randconfig-a014-20210825
i386                 randconfig-a013-20210825
i386                 randconfig-a015-20210825
arc                  randconfig-r043-20210825
riscv                randconfig-r042-20210825
s390                 randconfig-r044-20210825
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig

clang tested configs:
x86_64               randconfig-a005-20210825
x86_64               randconfig-a001-20210825
x86_64               randconfig-a006-20210825
x86_64               randconfig-a003-20210825
x86_64               randconfig-a004-20210825
x86_64               randconfig-a002-20210825
i386                 randconfig-a006-20210825
i386                 randconfig-a001-20210825
i386                 randconfig-a002-20210825
i386                 randconfig-a005-20210825
i386                 randconfig-a004-20210825
i386                 randconfig-a003-20210825

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
