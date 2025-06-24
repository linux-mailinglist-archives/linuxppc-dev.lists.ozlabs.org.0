Return-Path: <linuxppc-dev+bounces-9670-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA84BAE5CBD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jun 2025 08:24:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRFKq1PVpz2xk5;
	Tue, 24 Jun 2025 16:24:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750746287;
	cv=none; b=kXZrwfNRdXQ0UJzgNeXryafWuKT5nCgJJ1LgWYvSdyPML0+vTHd1kgDKoqZuZAES0kvPyRMWewzqiWQW8FP6Xr9ql4fMfrLr+ozUT3/fGeOslMaBXtGaxiVktJdvTY0FwnJpPAsqmG3JDV6oO3CI95Teet5z377D1MCsPZQqH+f8JQrGxdETPqC7JMcd1fmyCRZxII91BcpZo3AoeGfQtTvDOBymCg90TItqVytodlJgxsnZJf6OuoPiG3GK6k2996DSURcUMW8xVx1hMhEeztGwan9TsFLkeBAPwwbEqQc4sRNCcCAfCyIs7A4rAkK4Ye5MCZIo4L0sl9+x7PH4ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750746287; c=relaxed/relaxed;
	bh=t2D4jeT9kUeOV+zdl9qqZPrGlBVCsUbM4rkdl3fmfYc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lWBfowdPJGb1PwA3+hmVq9uaXAdDvW7R7shW+hKDjj+IyTIw5aX/fGKYg5ckUC1MQ4jXq7cWlFu2HUm31G3T4sC8DI5yjWZLrYfqqp7mz1qKxKijqEkoRQQelvTyhFYUGeHQDglG77hS+IcY0sdx8w161K9g1/od98INGe9yf+TiNboWH40XCxvoBMg9N3chmvnEg8Ex9qtMqFcbGnWVwVoP5+8+YEMh5U8EEvWWQdGCDd16mD9okwoc9ISVUe5kAS67Vsu6uv4SPdIIdf6kDqiYBMGyVMPn2yE+MlSEBqkjDEXgiPcB2NoEMZftypC21edQiabFDJj6W0/mWu+H9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KJSqApLJ; dkim-atps=neutral; spf=pass (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KJSqApLJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRFKm2x6Yz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 16:24:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750746284; x=1782282284;
  h=date:from:to:cc:subject:message-id;
  bh=oD32iO9MVzSTvAHD7n/nHa0pGDWPcFESsvNRivcmQe4=;
  b=KJSqApLJoVYo1mm5gGSwv/L09tb+KsjS61ZQmULd5ZVye/vecE1Lq2Wa
   ip70SH/E/WmBNVVjJTnh3d9isfyAEZ5j0HdCzoUe7HqQ5f+7oGPbCDUXT
   MTwlD4hclAUiU92c+IiNFETVyJ20AYeE/sghR5lAiQHb17uDZWqN0S93b
   CjPCGdwNYjkxjfiwS7bo8gpD1A+L+zz55IVfmcHEv6SIypdhs7aXC5+0a
   NUMqS0hQEzVFM5oaOiL7P3ZOwuKCmpr75fndYvOij3We7n7i39LFC3e80
   qKr7nYPIfjHiogXYiVqPoZ8vJguVgbaa6QdNN5N4Rl5FYcVBH5hkNuryM
   A==;
X-CSE-ConnectionGUID: 3djGcihYQc+5g7WXgty5Mw==
X-CSE-MsgGUID: 8gzXXqmdRJCQSJq1HNSUMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63665620"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="63665620"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 23:24:39 -0700
X-CSE-ConnectionGUID: y09L5B5wSi2xW6oDiO472w==
X-CSE-MsgGUID: MumER1QIQjKhtE1q0cbGiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="152525956"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jun 2025 23:24:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTx5A-000RnM-1S;
	Tue, 24 Jun 2025 06:24:36 +0000
Date: Tue, 24 Jun 2025 14:24:16 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next-test] BUILD SUCCESS
 cf183c1730f2634245da35e9b5d53381b787d112
Message-ID: <202506241406.g2TFLxjD-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: cf183c1730f2634245da35e9b5d53381b787d112  powerpc: floppy: Add missing checks after DMA map

elapsed time: 1020m

configs tested: 75
configs skipped: 70

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20250624    gcc-8.5.0
arc                   randconfig-002-20250624    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                   randconfig-001-20250624    gcc-8.5.0
arm                   randconfig-002-20250624    gcc-8.5.0
arm                   randconfig-003-20250624    gcc-8.5.0
arm                   randconfig-004-20250624    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250624    gcc-8.5.0
arm64                 randconfig-002-20250624    gcc-8.5.0
arm64                 randconfig-003-20250624    gcc-8.5.0
arm64                 randconfig-004-20250624    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
hexagon                           allnoconfig    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250624    gcc-12
i386        buildonly-randconfig-002-20250624    gcc-12
i386        buildonly-randconfig-003-20250624    gcc-12
i386        buildonly-randconfig-004-20250624    gcc-12
i386        buildonly-randconfig-005-20250624    gcc-12
i386        buildonly-randconfig-006-20250624    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-15.1.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                                allnoconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250624    clang-20
x86_64      buildonly-randconfig-002-20250624    clang-20
x86_64      buildonly-randconfig-003-20250624    clang-20
x86_64      buildonly-randconfig-004-20250624    clang-20
x86_64      buildonly-randconfig-005-20250624    clang-20
x86_64      buildonly-randconfig-006-20250624    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

