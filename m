Return-Path: <linuxppc-dev+bounces-12521-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 813B3B92675
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 19:23:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVqgr11l5z2yrr;
	Tue, 23 Sep 2025 03:23:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758561784;
	cv=none; b=A6h4ks+3m8RzG5KGWOAueY+Fulmi47ooKB9/TGnzYQwQCNOO7ZU4GouoY7d02txfB0yBMxEiOCY+Xm3TzTLncwq5JKkIaw5//LlU31yFvEKMyGPn6gD4SG4L2ugbMr/tHf4bTwY1Hf0WghnzENY5p60U+soiOrAnK+NUA1ERjX7qv3wkv3Uzvg9NXLFVmdr7KRRzAhX6cY43JMOsvvp17ZJdSub6EiCAp92C9MHDnzvishqs2FSnt7a/BBT38VISIcd7Y3RRKv3mBEFLz3XrXS7XeYuOHAyRqV6Bm9UYoPiwuo0/fbDcAVBmj5smbc99DX00cXu6q03nPqCWAps6mA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758561784; c=relaxed/relaxed;
	bh=z+bNt8jMSabga1AziJFbekAmB+/9uTDfWJn4Xo/tXPc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Iwa42PDW2T3Xa1vh0qvFvk8SvoAcGdsjtFcYoWrV/ZuGiUe4rV04r9+D09Dt86dcSZwSy8CPQpuX8ENJHuMavEj7ly//V3chrFkXHyK0QmjV0zW5dsKkTGJs0UjNrysQSN8R6Hijn0ksaci70HJEKv5K0Omz2FLDhsH86WWpTisFYNknGpOVfBvZlvzg7iwtF+gkmsgV8GdBzefxdVsX4pUfvIAn2lN8bqouJfUb3c/ygV9VZwkdamZgzgCiaj5NG9yiBtZ/aMlCKFkWL1w6ujrEMUNupnMeZL4JezrK5i4f31PQn/sZGHJrVqdSxhZsl7az0R8S65cNQCXk1UDorw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hmdihzSm; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hmdihzSm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVqgn05DZz2xnt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 03:22:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758561781; x=1790097781;
  h=date:from:to:cc:subject:message-id;
  bh=+r56n9p0rvZzsFEgCzbPyLKVtpy0D/sYQdSYs5V07yc=;
  b=hmdihzSmd6hbtooDsGNEK7LsUvHaVNg/iogqi57DlSecT0V7ZxxDvjT+
   tVjF1xfea0bDKvwvL/z/Vq2KJse72ww7SxupthLdkD81QLTWJTMSIrMr1
   7SrYUJhR/UtGKxebwUMuTND8Ip0miBXIzqbP+LJoQ/6uVvUOMEngC2Xgx
   dmbuBXR01gwiF+JbKXhfun+3RPvYWvLpcq0dssr6W8QhqAzVZdlC9BZPI
   4NMX44Iwmyo5CtjZpc8XhMdIv2ODce3h2xSW3TGulTTYT38pqAHxfILFT
   sylFpOfgNOkdNnst6yG71lKf+QgQ5R4l5IfXG5qURyn3eL7K1lHNJ6LZ6
   g==;
X-CSE-ConnectionGUID: WZeuIxdMQAe7Lr7L39ckCg==
X-CSE-MsgGUID: W6Ln7LlbQrqfjF/W0u8fZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="83433024"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="83433024"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 10:22:55 -0700
X-CSE-ConnectionGUID: kIJKqlIMTNSNtNTVZwfF1A==
X-CSE-MsgGUID: KDx9NdNHRxWdYbv1e5Attg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="176354396"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Sep 2025 10:22:54 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0kFX-0001uD-1x;
	Mon, 22 Sep 2025 17:22:51 +0000
Date: Tue, 23 Sep 2025 01:22:35 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 8c86d0e11e703b5ce6812d9703a7617b09cf6fbb
Message-ID: <202509230125.5YaAFU6Y-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
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
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 8c86d0e11e703b5ce6812d9703a7617b09cf6fbb  Automatic merge of 'next' into merge (2025-09-21 21:55)

elapsed time: 1459m

configs tested: 135
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                      axs103_smp_defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250922    gcc-8.5.0
arc                   randconfig-002-20250922    gcc-9.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                          moxart_defconfig    gcc-15.1.0
arm                         mv78xx0_defconfig    clang-19
arm                           omap1_defconfig    gcc-15.1.0
arm                             pxa_defconfig    gcc-15.1.0
arm                   randconfig-001-20250922    clang-22
arm                   randconfig-002-20250922    gcc-12.5.0
arm                   randconfig-003-20250922    clang-17
arm                   randconfig-004-20250922    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250922    gcc-8.5.0
arm64                 randconfig-002-20250922    gcc-15.1.0
arm64                 randconfig-003-20250922    clang-22
arm64                 randconfig-004-20250922    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250922    gcc-15.1.0
csky                  randconfig-002-20250922    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250922    clang-20
hexagon               randconfig-002-20250922    clang-19
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250922    clang-20
i386        buildonly-randconfig-002-20250922    gcc-14
i386        buildonly-randconfig-003-20250922    gcc-14
i386        buildonly-randconfig-004-20250922    gcc-14
i386        buildonly-randconfig-005-20250922    clang-20
i386        buildonly-randconfig-006-20250922    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250922    clang-22
loongarch             randconfig-002-20250922    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250922    gcc-11.5.0
nios2                 randconfig-002-20250922    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250922    gcc-8.5.0
parisc                randconfig-002-20250922    gcc-9.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                     ksi8560_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250922    clang-22
powerpc               randconfig-002-20250922    gcc-12.5.0
powerpc               randconfig-003-20250922    clang-17
powerpc64             randconfig-001-20250922    gcc-12.5.0
powerpc64             randconfig-002-20250922    clang-20
powerpc64             randconfig-003-20250922    clang-17
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                    nommu_k210_defconfig    clang-22
riscv                 randconfig-001-20250922    clang-22
riscv                 randconfig-002-20250922    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250922    gcc-8.5.0
s390                  randconfig-002-20250922    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250922    gcc-15.1.0
sh                    randconfig-002-20250922    gcc-11.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250922    gcc-15.1.0
sparc                 randconfig-002-20250922    gcc-14.3.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250922    gcc-12.5.0
sparc64               randconfig-002-20250922    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250922    gcc-14
um                    randconfig-002-20250922    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250922    clang-20
x86_64      buildonly-randconfig-002-20250922    gcc-13
x86_64      buildonly-randconfig-003-20250922    gcc-13
x86_64      buildonly-randconfig-004-20250922    clang-20
x86_64      buildonly-randconfig-005-20250922    clang-20
x86_64      buildonly-randconfig-006-20250922    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250922    gcc-9.5.0
xtensa                randconfig-002-20250922    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

