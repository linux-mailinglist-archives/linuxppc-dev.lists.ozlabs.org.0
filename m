Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0803FEE6E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 15:10:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0h9c3w7zz2yww
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 23:10:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0h976LdZz2xWg
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 23:09:46 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="217246848"
X-IronPort-AV: E=Sophos;i="5.84,372,1620716400"; d="scan'208";a="217246848"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 06:08:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,372,1620716400"; d="scan'208";a="461647131"
Received: from lkp-server01.sh.intel.com (HELO 4fbc2b3ce5aa) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 02 Sep 2021 06:08:42 -0700
Received: from kbuild by 4fbc2b3ce5aa with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mLmSP-0008yv-IB; Thu, 02 Sep 2021 13:08:41 +0000
Date: Thu, 02 Sep 2021 21:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS e432fe97f3e5de325b40021e505cce53877586c5
Message-ID: <6130ccaf.lIP1oUDCaoyBdsG9%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: e432fe97f3e5de325b40021e505cce53877586c5  powerpc/bug: Cast to unsigned long before passing to inline asm

elapsed time: 1390m

configs tested: 152
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210831
powerpc                 mpc8540_ads_defconfig
sh                          sdk7786_defconfig
arm                            xcep_defconfig
arm                          ep93xx_defconfig
arm                         cm_x300_defconfig
powerpc                     sequoia_defconfig
mips                            e55_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                 linkstation_defconfig
sparc64                             defconfig
arm                           corgi_defconfig
mips                           jazz_defconfig
powerpc                      acadia_defconfig
arm                          moxart_defconfig
sh                        edosk7760_defconfig
riscv                            alldefconfig
arm                          pxa168_defconfig
sh                        edosk7705_defconfig
mips                   sb1250_swarm_defconfig
powerpc                      tqm8xx_defconfig
xtensa                generic_kc705_defconfig
x86_64                           alldefconfig
riscv             nommu_k210_sdcard_defconfig
sh                        sh7785lcr_defconfig
powerpc                 mpc836x_rdk_defconfig
sh                      rts7751r2d1_defconfig
powerpc                     kmeter1_defconfig
mips                         cobalt_defconfig
arm                        trizeps4_defconfig
sh                          rsk7269_defconfig
mips                     decstation_defconfig
arm                           spitz_defconfig
powerpc                     tqm8540_defconfig
arm                            mps2_defconfig
sh                           se7750_defconfig
arm                       aspeed_g5_defconfig
sparc64                          alldefconfig
sh                           sh2007_defconfig
arm                     davinci_all_defconfig
powerpc                     tqm5200_defconfig
riscv                    nommu_virt_defconfig
arm                           h5000_defconfig
arc                              alldefconfig
sh                              ul2_defconfig
powerpc64                           defconfig
sh                           se7712_defconfig
powerpc                      bamboo_defconfig
ia64                             alldefconfig
powerpc                 mpc837x_rdb_defconfig
alpha                               defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
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
x86_64               randconfig-a005-20210831
x86_64               randconfig-a001-20210831
x86_64               randconfig-a003-20210831
x86_64               randconfig-a002-20210831
x86_64               randconfig-a004-20210831
x86_64               randconfig-a006-20210831
i386                 randconfig-a005-20210831
i386                 randconfig-a002-20210831
i386                 randconfig-a003-20210831
i386                 randconfig-a006-20210831
i386                 randconfig-a001-20210831
i386                 randconfig-a004-20210831
x86_64               randconfig-a016-20210901
x86_64               randconfig-a011-20210901
x86_64               randconfig-a012-20210901
x86_64               randconfig-a015-20210901
x86_64               randconfig-a014-20210901
x86_64               randconfig-a013-20210901
arc                  randconfig-r043-20210831
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
i386                 randconfig-c001-20210831
s390                 randconfig-c005-20210831
riscv                randconfig-c006-20210831
powerpc              randconfig-c003-20210831
mips                 randconfig-c004-20210831
arm                  randconfig-c002-20210831
x86_64               randconfig-c007-20210831
s390                 randconfig-c005-20210901
mips                 randconfig-c004-20210901
x86_64               randconfig-c007-20210901
powerpc              randconfig-c003-20210901
i386                 randconfig-c001-20210901
arm                  randconfig-c002-20210901
riscv                randconfig-c006-20210901
x86_64               randconfig-a014-20210831
x86_64               randconfig-a015-20210831
x86_64               randconfig-a013-20210831
x86_64               randconfig-a016-20210831
x86_64               randconfig-a012-20210831
x86_64               randconfig-a011-20210831
i386                 randconfig-a016-20210831
i386                 randconfig-a011-20210831
i386                 randconfig-a015-20210831
i386                 randconfig-a014-20210831
i386                 randconfig-a012-20210831
i386                 randconfig-a013-20210831
s390                 randconfig-r044-20210831
hexagon              randconfig-r041-20210831
hexagon              randconfig-r045-20210831
riscv                randconfig-r042-20210831
hexagon              randconfig-r045-20210901
hexagon              randconfig-r041-20210901

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
