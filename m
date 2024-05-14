Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 887F68C4B01
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 03:48:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XyBtwoOe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdfQt0W2Lz3cYQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 11:48:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XyBtwoOe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdfQ74zdZz30Tj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2024 11:48:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715651297; x=1747187297;
  h=date:from:to:cc:subject:message-id;
  bh=I/R9PV8n2p1tZUQbKdO5sRkD/oEopbH2t04MFMLuNDM=;
  b=XyBtwoOen0Q5NdAdwalm4UV1CC4qUrQgvZ9DDtnbRUnOdwJ4jEmjCGz+
   A7a2dijp8b2XCu5S5XWhs0b+ynyRx7HKE+OzwAIH8Nrj9F63hGyR8xmyB
   IWSzX/5dJ+AMW1g0rgH+XjvY5A1Xo/uowA1mvkcU/pkXzTtzLqjAVwH31
   fuQXSEhPsToU6yFS+eQuHoVpdxt7bIspV/n82tvE1MhukRU6a2nSAgyFN
   +9rVN2c4IzG5ebv4oKdTULOWBPyzuFinxsCjBFkXMZbHtelIHhQW6H24I
   wP6AnMxLuUS6juqUGP1LIUOZjBR+aaQlOxi6BSz1Qu6xyjhG6fTgRUgSt
   w==;
X-CSE-ConnectionGUID: 8KAKf0tNRLKBlCyfal2dQA==
X-CSE-MsgGUID: T8ejPoj1QEKnOWYxJYH4Jw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15448866"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="15448866"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 18:48:10 -0700
X-CSE-ConnectionGUID: G378f/V3TrOKFBGUIDST6Q==
X-CSE-MsgGUID: SgjL5OCUTd6uOpSM3AyniQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="35278257"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 May 2024 18:48:08 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6hGv-000Avh-2C;
	Tue, 14 May 2024 01:48:05 +0000
Date: Tue, 14 May 2024 09:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 e789d4499abdb488dd9cabce4f95c74dac6bcbe5
Message-ID: <202405140958.KvcMsLmU-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: e789d4499abdb488dd9cabce4f95c74dac6bcbe5  Merge branch 'topic/kdump-hotplug' into next

elapsed time: 733m

configs tested: 176
configs skipped: 4

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
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20240514   gcc  
arc                   randconfig-002-20240514   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         bcm2835_defconfig   clang
arm                     davinci_all_defconfig   clang
arm                                 defconfig   clang
arm                           imxrt_defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                         mv78xx0_defconfig   clang
arm                        neponset_defconfig   gcc  
arm                   randconfig-001-20240514   clang
arm                   randconfig-002-20240514   gcc  
arm                   randconfig-003-20240514   gcc  
arm                   randconfig-004-20240514   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240514   clang
arm64                 randconfig-002-20240514   clang
arm64                 randconfig-003-20240514   gcc  
arm64                 randconfig-004-20240514   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240514   gcc  
csky                  randconfig-002-20240514   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240514   clang
hexagon               randconfig-002-20240514   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240513   clang
i386         buildonly-randconfig-002-20240513   clang
i386         buildonly-randconfig-003-20240513   gcc  
i386         buildonly-randconfig-004-20240513   clang
i386         buildonly-randconfig-005-20240513   gcc  
i386         buildonly-randconfig-006-20240513   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240513   gcc  
i386                  randconfig-002-20240513   clang
i386                  randconfig-003-20240513   gcc  
i386                  randconfig-004-20240513   clang
i386                  randconfig-005-20240513   gcc  
i386                  randconfig-006-20240513   gcc  
i386                  randconfig-011-20240513   gcc  
i386                  randconfig-012-20240513   clang
i386                  randconfig-013-20240513   clang
i386                  randconfig-014-20240513   gcc  
i386                  randconfig-015-20240513   gcc  
i386                  randconfig-016-20240513   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240514   gcc  
loongarch             randconfig-002-20240514   gcc  
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
mips                          rm200_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240514   gcc  
nios2                 randconfig-002-20240514   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20240514   gcc  
parisc                randconfig-002-20240514   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      ep88xc_defconfig   gcc  
powerpc               randconfig-001-20240514   gcc  
powerpc               randconfig-002-20240514   gcc  
powerpc               randconfig-003-20240514   clang
powerpc                     tqm8541_defconfig   clang
powerpc64             randconfig-001-20240514   clang
powerpc64             randconfig-002-20240514   clang
powerpc64             randconfig-003-20240514   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                    nommu_virt_defconfig   clang
riscv                 randconfig-001-20240514   gcc  
riscv                 randconfig-002-20240514   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240514   gcc  
s390                  randconfig-002-20240514   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240514   gcc  
sh                    randconfig-002-20240514   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240514   gcc  
sparc64               randconfig-002-20240514   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240514   clang
um                    randconfig-002-20240514   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240514   clang
x86_64       buildonly-randconfig-002-20240514   clang
x86_64       buildonly-randconfig-003-20240514   gcc  
x86_64       buildonly-randconfig-004-20240514   clang
x86_64       buildonly-randconfig-005-20240514   clang
x86_64       buildonly-randconfig-006-20240514   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240514   gcc  
x86_64                randconfig-002-20240514   gcc  
x86_64                randconfig-003-20240514   clang
x86_64                randconfig-004-20240514   clang
x86_64                randconfig-005-20240514   gcc  
x86_64                randconfig-006-20240514   gcc  
x86_64                randconfig-011-20240514   clang
x86_64                randconfig-012-20240514   gcc  
x86_64                randconfig-013-20240514   gcc  
x86_64                randconfig-014-20240514   clang
x86_64                randconfig-015-20240514   gcc  
x86_64                randconfig-016-20240514   gcc  
x86_64                randconfig-071-20240514   clang
x86_64                randconfig-072-20240514   clang
x86_64                randconfig-073-20240514   gcc  
x86_64                randconfig-074-20240514   gcc  
x86_64                randconfig-075-20240514   clang
x86_64                randconfig-076-20240514   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240514   gcc  
xtensa                randconfig-002-20240514   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
