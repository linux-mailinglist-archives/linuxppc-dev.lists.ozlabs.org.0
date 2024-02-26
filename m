Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE289866763
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 01:52:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gwhJl8ZG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjhsY2pxXz3fQR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:52:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gwhJl8ZG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tjhrp35z9z30N8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 11:51:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708908698; x=1740444698;
  h=date:from:to:cc:subject:message-id;
  bh=3veLmVdkTvU/1b2IDQFibLW/0jAe+378RNneG5Zq4nE=;
  b=gwhJl8ZGzzDtzq5+QVuRg5qngyK+przXYORDeLD6VPG+WElenfmQueEH
   OfCuHgjaQqBd3U+3w/6ZfeGRY6TecHKgAgGtBIy0cuungUlElyVsLnPHb
   6ERwyMWS8At4nUX6Vv/Z0UC/DAr8jaKaI3fKBFvG7OfnSWGvS/10F9eZi
   na34IM8AmZLgKAOL3jf4Ao3QDRTHfQEZhAnlo9W2Oxb3IZBpwhWhrBD3Z
   fJlwOkXY2YEW4l5n+Jn6FQG1WH+e1WZRVxwybtmEMoGMc42EwNM387pge
   AuTETeyV2yP0nstRAlTxzrAJS9hw0m35k1jB2CIYb1caarYFi4X3k9LlI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3296815"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3296815"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 16:51:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6410733"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 Feb 2024 16:51:31 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rePDN-0009sv-0G;
	Mon, 26 Feb 2024 00:51:29 +0000
Date: Mon, 26 Feb 2024 08:51:09 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 84d800298e66ce2f01a270151bbf3bf4d5d224fa
Message-ID: <202402260806.rS7eDBDJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 84d800298e66ce2f01a270151bbf3bf4d5d224fa  Automatic merge of 'next' into merge (2024-02-25 10:38)

elapsed time: 1442m

configs tested: 196
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240225   gcc  
arc                   randconfig-002-20240225   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          moxart_defconfig   gcc  
arm                   randconfig-001-20240225   clang
arm                   randconfig-002-20240225   gcc  
arm                   randconfig-003-20240225   clang
arm                   randconfig-004-20240225   clang
arm                         s5pv210_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240225   gcc  
arm64                 randconfig-002-20240225   clang
arm64                 randconfig-003-20240225   gcc  
arm64                 randconfig-004-20240225   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240225   gcc  
csky                  randconfig-002-20240225   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240225   clang
hexagon               randconfig-002-20240225   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240225   gcc  
i386         buildonly-randconfig-001-20240226   clang
i386         buildonly-randconfig-002-20240225   gcc  
i386         buildonly-randconfig-002-20240226   gcc  
i386         buildonly-randconfig-003-20240225   clang
i386         buildonly-randconfig-003-20240226   clang
i386         buildonly-randconfig-004-20240225   gcc  
i386         buildonly-randconfig-004-20240226   clang
i386         buildonly-randconfig-005-20240225   clang
i386         buildonly-randconfig-005-20240226   clang
i386         buildonly-randconfig-006-20240225   gcc  
i386         buildonly-randconfig-006-20240226   clang
i386                                defconfig   clang
i386                  randconfig-001-20240225   gcc  
i386                  randconfig-001-20240226   clang
i386                  randconfig-002-20240225   clang
i386                  randconfig-002-20240226   gcc  
i386                  randconfig-003-20240225   clang
i386                  randconfig-003-20240226   clang
i386                  randconfig-004-20240225   gcc  
i386                  randconfig-004-20240226   gcc  
i386                  randconfig-005-20240225   gcc  
i386                  randconfig-005-20240226   clang
i386                  randconfig-006-20240225   gcc  
i386                  randconfig-006-20240226   clang
i386                  randconfig-011-20240225   clang
i386                  randconfig-011-20240226   gcc  
i386                  randconfig-012-20240225   gcc  
i386                  randconfig-012-20240226   gcc  
i386                  randconfig-013-20240225   gcc  
i386                  randconfig-013-20240226   gcc  
i386                  randconfig-014-20240225   clang
i386                  randconfig-014-20240226   gcc  
i386                  randconfig-015-20240225   gcc  
i386                  randconfig-015-20240226   gcc  
i386                  randconfig-016-20240225   clang
i386                  randconfig-016-20240226   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240225   gcc  
loongarch             randconfig-002-20240225   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   gcc  
mips                   sb1250_swarm_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240225   gcc  
nios2                 randconfig-002-20240225   gcc  
openrisc                         alldefconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240225   gcc  
parisc                randconfig-002-20240225   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      bamboo_defconfig   clang
powerpc                 mpc8315_rdb_defconfig   clang
powerpc               randconfig-001-20240225   clang
powerpc               randconfig-002-20240225   clang
powerpc               randconfig-003-20240225   clang
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240225   gcc  
powerpc64             randconfig-002-20240225   clang
powerpc64             randconfig-003-20240225   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240225   gcc  
riscv                 randconfig-002-20240225   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240225   gcc  
s390                  randconfig-002-20240225   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                    randconfig-001-20240225   gcc  
sh                    randconfig-002-20240225   gcc  
sh                        sh7785lcr_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240225   gcc  
sparc64               randconfig-002-20240225   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240225   clang
um                    randconfig-002-20240225   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240225   clang
x86_64       buildonly-randconfig-002-20240225   clang
x86_64       buildonly-randconfig-003-20240225   clang
x86_64       buildonly-randconfig-004-20240225   gcc  
x86_64       buildonly-randconfig-005-20240225   clang
x86_64       buildonly-randconfig-006-20240225   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240225   gcc  
x86_64                randconfig-002-20240225   clang
x86_64                randconfig-003-20240225   gcc  
x86_64                randconfig-004-20240225   clang
x86_64                randconfig-005-20240225   clang
x86_64                randconfig-006-20240225   gcc  
x86_64                randconfig-011-20240225   clang
x86_64                randconfig-012-20240225   clang
x86_64                randconfig-013-20240225   gcc  
x86_64                randconfig-014-20240225   gcc  
x86_64                randconfig-015-20240225   clang
x86_64                randconfig-016-20240225   gcc  
x86_64                randconfig-071-20240225   gcc  
x86_64                randconfig-072-20240225   gcc  
x86_64                randconfig-073-20240225   clang
x86_64                randconfig-074-20240225   gcc  
x86_64                randconfig-075-20240225   clang
x86_64                randconfig-076-20240225   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240225   gcc  
xtensa                randconfig-002-20240225   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
