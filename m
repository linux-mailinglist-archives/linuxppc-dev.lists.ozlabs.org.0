Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BE948F49E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 05:00:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JbPZq0JnRz3bTg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 15:00:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WC2Iux+x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WC2Iux+x; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JbPZ90w8bz2xKR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jan 2022 14:59:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642219185; x=1673755185;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=UudpIy8KJYEJLBGbS+SdKdlIbpJdSqh4quprw6YxqGM=;
 b=WC2Iux+xL0cPk1uXmi8YCaPxIQpqr/M9M6Ep286uF06ROoeXJKrTAH8X
 Amo7C+T2P5/WYbB2hgvgjv6cIUxGJp3Dr3IKcpuArdDEAQvVOh8g0in8N
 6mHqidLIDYd4w0Tg42yawi9ZigOH7Nhe+pPwEiIvNql/S9KcvxFj/4x3k
 UXz2G3FHYxQ+kJ12V4jpub/iHuz7NuSrjGhkH2fpTdKctd30AU3EiWNei
 UJ8Hp4gm48aNj6GB/7biSRLUXRpakn1OYE8RRjj+UbIbzGOAsiQd6Rc6d
 xkNMnJSRMjYlXl2+mLbF3gwGXS8aeG8PhuEw4NAAuju+V7h1chaIoJdh4 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10227"; a="244168996"
X-IronPort-AV: E=Sophos;i="5.88,290,1635231600"; d="scan'208";a="244168996"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 19:58:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,290,1635231600"; d="scan'208";a="692451816"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 14 Jan 2022 19:58:39 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n8aD8-0009M6-R0; Sat, 15 Jan 2022 03:58:38 +0000
Date: Sat, 15 Jan 2022 11:58:20 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 64aae3ed0b303954227bf1990dff6fded6889677
Message-ID: <61e2465c.WupL8MiLDaVSMV6Z%lkp@intel.com>
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
branch HEAD: 64aae3ed0b303954227bf1990dff6fded6889677  Automatic merge of 'next' into merge (2022-01-10 14:38)

elapsed time: 7121m

configs tested: 213
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
powerpc                     tqm8541_defconfig
powerpc                      ppc40x_defconfig
m68k                        stmark2_defconfig
sh                           se7721_defconfig
sh                           se7750_defconfig
arm                          badge4_defconfig
m68k                           sun3_defconfig
powerpc                    sam440ep_defconfig
sh                           sh2007_defconfig
openrisc                  or1klitex_defconfig
sh                           se7780_defconfig
m68k                       m5475evb_defconfig
sh                ecovec24-romimage_defconfig
powerpc                     mpc83xx_defconfig
mips                      maltasmvp_defconfig
m68k                          atari_defconfig
powerpc                        warp_defconfig
arm                           tegra_defconfig
sh                              ul2_defconfig
sh                   sh7724_generic_defconfig
m68k                          hp300_defconfig
arm                         axm55xx_defconfig
um                             i386_defconfig
sparc                            alldefconfig
arm                           stm32_defconfig
arm                           sama5_defconfig
x86_64                           alldefconfig
powerpc                 mpc85xx_cds_defconfig
mips                      fuloong2e_defconfig
csky                             alldefconfig
powerpc                       ppc64_defconfig
powerpc                     taishan_defconfig
h8300                               defconfig
xtensa                  nommu_kc705_defconfig
sh                                  defconfig
powerpc                      ep88xc_defconfig
arm                        mini2440_defconfig
sh                            migor_defconfig
m68k                                defconfig
sparc64                             defconfig
sparc                            allyesconfig
arm                          simpad_defconfig
powerpc                     pq2fads_defconfig
arm                        mvebu_v7_defconfig
arm                           viper_defconfig
arm                      integrator_defconfig
xtensa                generic_kc705_defconfig
xtensa                    xip_kc705_defconfig
sh                   secureedge5410_defconfig
nds32                             allnoconfig
ia64                                defconfig
powerpc                      tqm8xx_defconfig
arm                          iop32x_defconfig
mips                         tb0226_defconfig
arm                            mps2_defconfig
arm                          lpd270_defconfig
riscv                            allmodconfig
parisc                generic-64bit_defconfig
arc                    vdk_hs38_smp_defconfig
arm                        multi_v7_defconfig
sh                          polaris_defconfig
sh                          rsk7269_defconfig
arc                      axs103_smp_defconfig
arm                        cerfcube_defconfig
sh                        dreamcast_defconfig
h8300                       h8s-sim_defconfig
sh                           se7722_defconfig
openrisc                            defconfig
sh                            shmin_defconfig
m68k                            q40_defconfig
mips                           xway_defconfig
xtensa                  audio_kc705_defconfig
sh                            titan_defconfig
arm                            zeus_defconfig
ia64                        generic_defconfig
mips                         mpc30x_defconfig
arc                          axs103_defconfig
powerpc                      pcm030_defconfig
arm                         assabet_defconfig
xtensa                       common_defconfig
arm                           h3600_defconfig
sh                        sh7785lcr_defconfig
mips                            ar7_defconfig
powerpc                       holly_defconfig
powerpc                   motionpro_defconfig
sh                          kfr2r09_defconfig
m68k                             allmodconfig
powerpc                      chrp32_defconfig
sparc                       sparc32_defconfig
h8300                            alldefconfig
sh                           se7751_defconfig
ia64                          tiger_defconfig
m68k                         apollo_defconfig
arm                       aspeed_g5_defconfig
um                               alldefconfig
arm                           u8500_defconfig
mips                             allmodconfig
microblaze                      mmu_defconfig
arm                      footbridge_defconfig
sh                     magicpanelr2_defconfig
ia64                             allmodconfig
arm                  randconfig-c002-20220111
arm                  randconfig-c002-20220113
ia64                             allyesconfig
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
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220111
arc                  randconfig-r043-20220111
s390                 randconfig-r044-20220111
riscv                randconfig-r042-20220113
arc                  randconfig-r043-20220113
s390                 randconfig-r044-20220113
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220111
x86_64                        randconfig-c007
riscv                randconfig-c006-20220111
powerpc              randconfig-c003-20220111
i386                          randconfig-c001
mips                 randconfig-c004-20220111
s390                 randconfig-c005-20220111
powerpc              randconfig-c003-20220113
mips                 randconfig-c004-20220113
s390                 randconfig-c005-20220113
riscv                randconfig-c006-20220113
arm                  randconfig-c002-20220113
arm                  colibri_pxa300_defconfig
mips                          malta_defconfig
arm                          ep93xx_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     akebono_defconfig
powerpc                     kilauea_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                        icon_defconfig
powerpc                          g5_defconfig
powerpc                      acadia_defconfig
arm                    vt8500_v6_v7_defconfig
mips                           rs90_defconfig
arm                     davinci_all_defconfig
powerpc                     pseries_defconfig
arm                       spear13xx_defconfig
mips                         tb0219_defconfig
powerpc                    socrates_defconfig
arm                         hackkit_defconfig
powerpc                   lite5200b_defconfig
riscv                             allnoconfig
arm                          ixp4xx_defconfig
riscv                          rv32_defconfig
mips                          rm200_defconfig
hexagon                          alldefconfig
powerpc                      pmac32_defconfig
mips                           ip22_defconfig
arm                        spear3xx_defconfig
arm                      pxa255-idp_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220113
hexagon              randconfig-r045-20220114
riscv                randconfig-r042-20220114
hexagon              randconfig-r041-20220114
hexagon              randconfig-r041-20220113

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
