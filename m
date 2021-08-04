Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5F23DFB63
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 08:20:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfhSX1tnnz3cX6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 16:20:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfhS73Gvcz302d
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 16:20:17 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="274911250"
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; d="scan'208";a="274911250"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 23:19:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; d="scan'208";a="502852708"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 03 Aug 2021 23:19:12 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mBAFD-000Ede-Ro; Wed, 04 Aug 2021 06:19:11 +0000
Date: Wed, 04 Aug 2021 14:18:48 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 c09f799bf0fdc0eeb44db87df07a7a9632c3420c
Message-ID: <610a3148.Z0k1lHEWD6GxLeBw%lkp@intel.com>
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
branch HEAD: c09f799bf0fdc0eeb44db87df07a7a9632c3420c  pseries/drmem: update LMBs after LPM

elapsed time: 1007m

configs tested: 100
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210803
powerpc                     tqm8541_defconfig
nios2                         3c120_defconfig
arm                            pleb_defconfig
powerpc                     pseries_defconfig
arm                        trizeps4_defconfig
arm                          imote2_defconfig
powerpc                   bluestone_defconfig
mips                          rm200_defconfig
powerpc                      ppc64e_defconfig
powerpc                      ppc6xx_defconfig
sh                     sh7710voipgw_defconfig
powerpc                           allnoconfig
powerpc                 mpc8540_ads_defconfig
powerpc                       ebony_defconfig
powerpc                      bamboo_defconfig
powerpc                     kilauea_defconfig
mips                        bcm63xx_defconfig
powerpc                 mpc8315_rdb_defconfig
xtensa                generic_kc705_defconfig
mips                           ip27_defconfig
powerpc64                           defconfig
arm                           sama5_defconfig
sh                          sdk7786_defconfig
arc                    vdk_hs38_smp_defconfig
x86_64                            allnoconfig
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
x86_64               randconfig-a002-20210803
x86_64               randconfig-a004-20210803
x86_64               randconfig-a006-20210803
x86_64               randconfig-a003-20210803
x86_64               randconfig-a001-20210803
x86_64               randconfig-a005-20210803
i386                 randconfig-a004-20210802
i386                 randconfig-a005-20210802
i386                 randconfig-a002-20210802
i386                 randconfig-a006-20210802
i386                 randconfig-a001-20210802
i386                 randconfig-a003-20210802
i386                 randconfig-a012-20210803
i386                 randconfig-a011-20210803
i386                 randconfig-a015-20210803
i386                 randconfig-a013-20210803
i386                 randconfig-a014-20210803
i386                 randconfig-a016-20210803
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20210803
x86_64               randconfig-a016-20210803
x86_64               randconfig-a013-20210803
x86_64               randconfig-a011-20210803
x86_64               randconfig-a014-20210803
x86_64               randconfig-a015-20210803

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
