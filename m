Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B933ADE5A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 14:39:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7C0T0D6sz3c6n
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 22:39:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7Bzq3JVSz2xZh
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jun 2021 22:39:02 +1000 (AEST)
IronPort-SDR: Glr8ucA0My/3dXOZjrFpp3R/qUyoWlmSN1u9mAvTkcqKT4Ic9r49zr+A4zK5pdAzjsViYG8fFv
 2iAf3sxNbeig==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="187096531"
X-IronPort-AV: E=Sophos;i="5.83,287,1616482800"; d="scan'208";a="187096531"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2021 05:38:56 -0700
IronPort-SDR: WPungafP6JKcwkceijNsWgupZd7y3BNoAk/DyUqWaXy/AxxQbr9K8w7+j5MJFmUCsrXMVdx65X
 35uyXXiJo5KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,287,1616482800"; d="scan'208";a="451903926"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 20 Jun 2021 05:38:55 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1luwj0-000472-Jl; Sun, 20 Jun 2021 12:38:54 +0000
Date: Sun, 20 Jun 2021 20:38:39 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 7f030e9d57b8ff6025bde4162f42378e6081126a
Message-ID: <60cf36cf.nCgQhisZuZgisEzT%lkp@intel.com>
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
branch HEAD: 7f030e9d57b8ff6025bde4162f42378e6081126a  Automatic merge of 'fixes' into merge (2021-06-20 09:27)

elapsed time: 723m

configs tested: 114
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
sh                           se7206_defconfig
sh                         apsh4a3a_defconfig
sparc                       sparc64_defconfig
arm                         mv78xx0_defconfig
sh                            migor_defconfig
powerpc                     akebono_defconfig
powerpc                    klondike_defconfig
arm                        neponset_defconfig
powerpc                        icon_defconfig
powerpc                 mpc834x_itx_defconfig
arm                         at91_dt_defconfig
x86_64                            allnoconfig
sh                              ul2_defconfig
arm                           sunxi_defconfig
arm                          imote2_defconfig
mips                     loongson2k_defconfig
mips                malta_qemu_32r6_defconfig
sh                   secureedge5410_defconfig
powerpc                        cell_defconfig
powerpc                       maple_defconfig
arm                           stm32_defconfig
mips                           rs90_defconfig
arm                         assabet_defconfig
arm                     davinci_all_defconfig
arc                         haps_hs_defconfig
arm                        mvebu_v5_defconfig
sparc64                          alldefconfig
sh                  sh7785lcr_32bit_defconfig
arm                         shannon_defconfig
powerpc                     tqm8548_defconfig
sh                          landisk_defconfig
powerpc                      ppc6xx_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc8540_ads_defconfig
parisc                generic-64bit_defconfig
m68k                         amcore_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
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
x86_64               randconfig-a016-20210620
x86_64               randconfig-a015-20210620
x86_64               randconfig-a014-20210620
x86_64               randconfig-a012-20210620
x86_64               randconfig-a013-20210620
x86_64               randconfig-a011-20210620
i386                 randconfig-a011-20210620
i386                 randconfig-a014-20210620
i386                 randconfig-a013-20210620
i386                 randconfig-a015-20210620
i386                 randconfig-a012-20210620
i386                 randconfig-a016-20210620
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210620
x86_64               randconfig-a005-20210620
x86_64               randconfig-a004-20210620
x86_64               randconfig-a006-20210620
x86_64               randconfig-a002-20210620
x86_64               randconfig-a001-20210620
x86_64               randconfig-a003-20210620

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
