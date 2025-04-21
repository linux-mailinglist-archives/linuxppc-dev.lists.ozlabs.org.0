Return-Path: <linuxppc-dev+bounces-7867-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 346F6A9552C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Apr 2025 19:22:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhBxh4XZJz2yS7;
	Tue, 22 Apr 2025 03:22:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745256120;
	cv=none; b=eILXqWYawKUGbp23kL/H+6SBl7PEc+30qCDK8Xv6BiFktIumP9+2UXWgeZGzZraXz74/qVTh/OHaxKMF5LMW475Tl5/mqbnJuTjOHFFPeHU/EioCfu/gWRtQN0wYA96HHskupTaYIMHOcGSDHwjz0vNRNPc9UpyzxBjGf3Fi+sN/NDshtgEZwQFVZHDR0zi0rOw0C1MkHHLh869dd0eJSeMMysubsf5V6nBYxasWxSoxs1S0PMTmi3h6XTXesbfrvIU8Vzt8BuRiOwxDscaWLcJQyvje74QNP/63H12GMmyLwFWT+NyuqE2H7bOzmyMmoCFwJ0LOO6otTL1Zww5HgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745256120; c=relaxed/relaxed;
	bh=rSSPtzhn0oVNpJ0vpj0s+FFQxLJOIDCDQbs07EY2NnQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FdJK93b56alrdVO0cNPwIMt2zN7Vh+BH2sOzBrY4djrxhNsLAPaXLkIGY3T3Y1N3FUVZQo99VNUbAsLphYMmhJGAyFh1b7wxa1JUaNmK3fs9n8q335nP2+uNmPR5x/j4EaxuGOSJaT3hcFRBL5lowqBlhzgDr11F+EulfoRHUDWlzhrc6zxWLaGXDaF9BHE0Wzolfko+LRF9s31OHu2iE42nmWmXSL3UMPT+mSGd+wGYncwtu9PZuxtesUKJ2KDv3F0tVv7pGHpSdxuDOqFDEz+O6kzcbsJ0/eBKbtiz5ZbSntgul3j0+abi3ycnGYSqoWmGBol9eytNv3tSrOfgfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fSV23X6Y; dkim-atps=neutral; spf=pass (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fSV23X6Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhBxf14VDz2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 03:21:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745256119; x=1776792119;
  h=date:from:to:cc:subject:message-id;
  bh=ReN9ehfLtqyrBzYIg95/KqWGp98MTjbURnn8JQ7+E0Q=;
  b=fSV23X6YHvEfnnXjPgRHINRXtWQdQoMmJcU0H5vWNoTMqTIsGhRS0ZPx
   AJ+K/Wf16Es3rcTMC21RciuY16SdDVh9aggfHsFpoFEvoCjX1IkUQLywe
   ZuQTyHoEKUwbMBL/s5pONxSKsnec+Nrmgn6diPaPHm2QoS9Owr7KyyYBN
   +OQK5ufQAxdOGIJzczwq1XgVMtfio6Iy182EwU8Yw5+t2QIhRHuI+H/yn
   0CIlmebORy3G+Em+1wm+gRzxw3AZL2Dp6ehyf4/XntQybBx8kK6RBlTh3
   X9rpjMshYOEkPL4y7SKNr6kf8Agx/rYBH5RPthFGt1Z3OQPsPuwJ8KofP
   Q==;
X-CSE-ConnectionGUID: aFeXaigJQNCKBZYT3QvFaw==
X-CSE-MsgGUID: 100/lsnQQ7KVs3d4jpm9AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="58169855"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="58169855"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 10:21:47 -0700
X-CSE-ConnectionGUID: V6mOYLTXStG2tMjPoftTJw==
X-CSE-MsgGUID: 8IzmcLeBT0anxm+PX+T1eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="154959922"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Apr 2025 10:21:46 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6uq0-0000GN-03;
	Mon, 21 Apr 2025 17:21:44 +0000
Date: Tue, 22 Apr 2025 01:21:42 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 a34964eace718ce03010a3e8d29eb5a872a461e6
Message-ID: <202504220132.6szktk8d-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: a34964eace718ce03010a3e8d29eb5a872a461e6  Automatic merge of 'fixes' into merge (2025-04-20 21:51)

elapsed time: 1444m

configs tested: 145
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                      axs103_smp_defconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250421    gcc-11.5.0
arc                   randconfig-002-20250421    gcc-13.3.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-21
arm                            hisi_defconfig    gcc-14.2.0
arm                          moxart_defconfig    gcc-14.2.0
arm                        mvebu_v7_defconfig    clang-21
arm                   randconfig-001-20250421    clang-21
arm                   randconfig-002-20250421    gcc-10.5.0
arm                   randconfig-003-20250421    gcc-6.5.0
arm                   randconfig-004-20250421    gcc-6.5.0
arm                         s5pv210_defconfig    gcc-14.2.0
arm                           u8500_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250421    gcc-5.5.0
arm64                 randconfig-002-20250421    gcc-7.5.0
arm64                 randconfig-003-20250421    gcc-9.5.0
arm64                 randconfig-004-20250421    clang-16
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250421    gcc-14.2.0
csky                  randconfig-002-20250421    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250421    clang-16
hexagon               randconfig-002-20250421    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250421    clang-20
i386        buildonly-randconfig-002-20250421    clang-20
i386        buildonly-randconfig-003-20250421    clang-20
i386        buildonly-randconfig-004-20250421    gcc-12
i386        buildonly-randconfig-005-20250421    gcc-12
i386        buildonly-randconfig-006-20250421    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20250421    gcc-14.2.0
loongarch             randconfig-002-20250421    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                  cavium_octeon_defconfig    gcc-14.2.0
mips                            gpr_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250421    gcc-9.3.0
nios2                 randconfig-002-20250421    gcc-13.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           alldefconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250421    gcc-6.5.0
parisc                randconfig-002-20250421    gcc-8.5.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                 mpc836x_rdk_defconfig    clang-21
powerpc               randconfig-001-20250421    clang-21
powerpc               randconfig-002-20250421    clang-21
powerpc               randconfig-003-20250421    clang-21
powerpc                     redwood_defconfig    clang-21
powerpc64             randconfig-001-20250421    gcc-10.5.0
powerpc64             randconfig-002-20250421    clang-21
powerpc64             randconfig-003-20250421    gcc-7.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                    nommu_k210_defconfig    clang-21
riscv                 randconfig-001-20250421    gcc-14.2.0
riscv                 randconfig-002-20250421    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250421    clang-21
s390                  randconfig-002-20250421    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250421    gcc-11.5.0
sh                    randconfig-002-20250421    gcc-7.5.0
sh                          rsk7201_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250421    gcc-10.3.0
sparc                 randconfig-002-20250421    gcc-8.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250421    gcc-12.4.0
sparc64               randconfig-002-20250421    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250421    gcc-12
um                    randconfig-002-20250421    clang-16
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250421    gcc-12
x86_64      buildonly-randconfig-002-20250421    clang-20
x86_64      buildonly-randconfig-003-20250421    gcc-12
x86_64      buildonly-randconfig-004-20250421    gcc-12
x86_64      buildonly-randconfig-005-20250421    gcc-12
x86_64      buildonly-randconfig-006-20250421    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250421    gcc-6.5.0
xtensa                randconfig-002-20250421    gcc-6.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

