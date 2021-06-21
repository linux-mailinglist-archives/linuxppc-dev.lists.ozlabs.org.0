Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5423AE1FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 05:49:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7b9p3R5Kz3bwv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 13:49:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7b9R4s2vz2yX6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 13:48:35 +1000 (AEST)
IronPort-SDR: 4sefVFQvF8200uM4Hsl4KzHSp5QT/bEduzEVAPcxG8uTfatYNnFnxT4N7qQ0DBycW8RCr+Dv2+
 uCv5rAqlt4IA==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="193905937"
X-IronPort-AV: E=Sophos;i="5.83,288,1616482800"; d="scan'208";a="193905937"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2021 20:48:29 -0700
IronPort-SDR: H2x2ylp4cY0MSOTVJqoq8U+mCevM+5YNmiIJ5SHHL5iVvfTR3ZEKK2fQx8qNDux18HEJx9n18p
 ww4KB56GBypw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,288,1616482800"; d="scan'208";a="405835514"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 20 Jun 2021 20:48:27 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lvAvD-0004Qq-87; Mon, 21 Jun 2021 03:48:27 +0000
Date: Mon, 21 Jun 2021 11:48:13 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 41075908e941f30636a607e841c08d7941966e1b
Message-ID: <60d00bfd.AYRLTdnaaGQVyOQg%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 41075908e941f30636a607e841c08d7941966e1b  powerpc: Enable KFENCE on BOOK3S/64

elapsed time: 723m

configs tested: 132
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      chrp32_defconfig
arm                          lpd270_defconfig
riscv                          rv32_defconfig
powerpc                      makalu_defconfig
m68k                                defconfig
mips                     loongson2k_defconfig
powerpc                    amigaone_defconfig
powerpc                     asp8347_defconfig
powerpc                     sbc8548_defconfig
powerpc                     tqm8560_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                     mpc5200_defconfig
h8300                            allyesconfig
sh                           se7724_defconfig
m68k                         amcore_defconfig
m68k                        mvme147_defconfig
mips                        qi_lb60_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                             allyesconfig
powerpc                        warp_defconfig
powerpc                     mpc83xx_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                            zeus_defconfig
sh                             sh03_defconfig
powerpc                      ppc64e_defconfig
powerpc                mpc7448_hpc2_defconfig
ia64                         bigsur_defconfig
sh                     sh7710voipgw_defconfig
sh                             espt_defconfig
powerpc                        fsp2_defconfig
arc                            hsdk_defconfig
csky                                defconfig
powerpc                     kilauea_defconfig
arm                     eseries_pxa_defconfig
arm                      tct_hammer_defconfig
sparc64                             defconfig
riscv                               defconfig
nios2                            alldefconfig
powerpc                 mpc8540_ads_defconfig
xtensa                    smp_lx200_defconfig
arm                         lpc32xx_defconfig
powerpc                     stx_gp3_defconfig
sh                          rsk7203_defconfig
arm                       aspeed_g5_defconfig
powerpc                 mpc8560_ads_defconfig
arm                        mvebu_v7_defconfig
sh                 kfr2r09-romimage_defconfig
m68k                       m5475evb_defconfig
sh                          r7780mp_defconfig
powerpc                      arches_defconfig
arm                            dove_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
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
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210620
i386                 randconfig-a002-20210620
i386                 randconfig-a003-20210620
i386                 randconfig-a006-20210620
i386                 randconfig-a005-20210620
i386                 randconfig-a004-20210620
x86_64               randconfig-a012-20210620
x86_64               randconfig-a016-20210620
x86_64               randconfig-a015-20210620
x86_64               randconfig-a014-20210620
x86_64               randconfig-a013-20210620
x86_64               randconfig-a011-20210620
i386                 randconfig-a011-20210620
i386                 randconfig-a014-20210620
i386                 randconfig-a013-20210620
i386                 randconfig-a015-20210620
i386                 randconfig-a012-20210620
i386                 randconfig-a016-20210620
x86_64               randconfig-a002-20210621
x86_64               randconfig-a001-20210621
x86_64               randconfig-a005-20210621
x86_64               randconfig-a003-20210621
x86_64               randconfig-a004-20210621
x86_64               randconfig-a006-20210621
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210620
x86_64               randconfig-b001-20210621
x86_64               randconfig-a002-20210620
x86_64               randconfig-a001-20210620
x86_64               randconfig-a005-20210620
x86_64               randconfig-a003-20210620
x86_64               randconfig-a004-20210620
x86_64               randconfig-a006-20210620

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
