Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE882D0044
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 03:19:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CpVWB5X5czDqr6
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 13:19:18 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CpVTJ15jwzDql8
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Dec 2020 13:17:36 +1100 (AEDT)
IronPort-SDR: XMOWfCgn5HpBqC7TQvzCDTFDbH0C7NcJgZn2J1vN/n/FoMZnw3mN6qU0lAdNw8RRUoq7anbJ1D
 7ZhujqR9AkGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9826"; a="160597809"
X-IronPort-AV: E=Sophos;i="5.78,396,1599548400"; d="scan'208";a="160597809"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2020 18:17:32 -0800
IronPort-SDR: iXrr30GxEwMZzUBUyda+J0NrIJmxE2v5mlLnfXZmXA7OmUmgFY/I+H3vpFkLn2gh0rsVDaRxxA
 nH4sbNXZjv0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,396,1599548400"; d="scan'208";a="331672376"
Received: from lkp-server01.sh.intel.com (HELO 47754f1311fc) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 05 Dec 2020 18:17:31 -0800
Received: from kbuild by 47754f1311fc with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kljcA-0000Wv-VB; Sun, 06 Dec 2020 02:17:30 +0000
Date: Sun, 06 Dec 2020 10:16:41 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 9acd775e4579bde0a6d937d72f9669e418aa87ad
Message-ID: <5fcc3f09.KeECAhZwerZqANKE%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  merge
branch HEAD: 9acd775e4579bde0a6d937d72f9669e418aa87ad  Automatic merge of 'master' into merge (2020-12-05 22:54)

elapsed time: 848m

configs tested: 119
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                             alldefconfig
powerpc                 mpc8272_ads_defconfig
powerpc                          g5_defconfig
powerpc                     sequoia_defconfig
powerpc                    gamecube_defconfig
powerpc                     tqm8555_defconfig
sh                           se7721_defconfig
mips                         tb0219_defconfig
sh                          rsk7269_defconfig
parisc                              defconfig
sh                        sh7785lcr_defconfig
arm                        shmobile_defconfig
um                           x86_64_defconfig
ia64                          tiger_defconfig
arm                         mv78xx0_defconfig
ia64                            zx1_defconfig
sh                 kfr2r09-romimage_defconfig
mips                       capcella_defconfig
x86_64                              defconfig
mips                       rbtx49xx_defconfig
arm                          ixp4xx_defconfig
mips                        bcm63xx_defconfig
powerpc                     tqm5200_defconfig
arc                         haps_hs_defconfig
arm                           spitz_defconfig
arm                          exynos_defconfig
arm                          prima2_defconfig
sh                            titan_defconfig
powerpc                       eiger_defconfig
arm                        trizeps4_defconfig
sh                          lboxre2_defconfig
sh                             espt_defconfig
arm                         vf610m4_defconfig
arm                        multi_v5_defconfig
arm                         nhk8815_defconfig
arm                           sama5_defconfig
powerpc                 mpc8560_ads_defconfig
ia64                        generic_defconfig
arm                           omap1_defconfig
arm                        mini2440_defconfig
s390                                defconfig
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
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20201205
i386                 randconfig-a004-20201205
i386                 randconfig-a001-20201205
i386                 randconfig-a002-20201205
i386                 randconfig-a006-20201205
i386                 randconfig-a003-20201205
i386                 randconfig-a005-20201204
i386                 randconfig-a004-20201204
i386                 randconfig-a001-20201204
i386                 randconfig-a002-20201204
i386                 randconfig-a006-20201204
i386                 randconfig-a003-20201204
x86_64               randconfig-a016-20201205
x86_64               randconfig-a012-20201205
x86_64               randconfig-a014-20201205
x86_64               randconfig-a013-20201205
x86_64               randconfig-a015-20201205
x86_64               randconfig-a011-20201205
i386                 randconfig-a014-20201205
i386                 randconfig-a013-20201205
i386                 randconfig-a011-20201205
i386                 randconfig-a015-20201205
i386                 randconfig-a012-20201205
i386                 randconfig-a016-20201205
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201205
x86_64               randconfig-a006-20201205
x86_64               randconfig-a002-20201205
x86_64               randconfig-a001-20201205
x86_64               randconfig-a005-20201205
x86_64               randconfig-a003-20201205

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
