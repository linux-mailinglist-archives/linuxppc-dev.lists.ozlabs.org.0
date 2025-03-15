Return-Path: <linuxppc-dev+bounces-7078-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD9DA625DA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Mar 2025 05:15:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZF7FQ1MMFz3bsY;
	Sat, 15 Mar 2025 15:15:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742012138;
	cv=none; b=gsqYHMjpcR2ZBSP2sbALo5WEtqz8JaWsM0GyXokE6tgQMZkx8OzACkfuiw3Km5mp2ZLk+FgCqXDxzFL/O4BOrbYEyyQDOwQcMUzPQOs1oTo7APEuuVrYfbv9W92/WM0iAdPrR8Yd8SFy5VSSn4KbqlNfteewgORFjbCfRR9xA9S0uRT9bZFCRAscLW8matDMNUQiC1dFn7s3P23G7Mf8QgzQWUibtDkcvN/RK/4JtUY08/deTuNb79o0KW1EUOfGHjUuWyuzflcdgJNk4pb+j2BXR4WhA71LAbtjDX2uu5Qf+h3zAIEixoGcjrXe7ZuA5CFCl3dcOXYRcw6z2UmEiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742012138; c=relaxed/relaxed;
	bh=bGxTWsAwavWgri+gESqsIa6151EVSbPA1F5PKSeuXtA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fUVXuHAnmLHZkpYR4GEpK7Jco91buTinRv0pXbf1P1c+xcEaPtbQ2WhfUjbi7nxMZGazTsQO8xl25GwIlj/oH34xhm0ybVVgYbcY8CqtbGeNfxE2rcqw9p7I3qGWivltiPnPgKj2KqY+ptR+cR/byHTM1te2QBImNZB7ixCnFi7Hoi2kA0rtPkWAiHSx5207X6i4pKYuMAIehXtpStacqH0aPWcTfYEpkaNwxV4bPV71WWzuLQoLN9DMc5kDs+M2KVKiFHRjGKtTA/GLcG5ObNirhSH5gkkk4bO1C2ll68zpzbKmeTC1K7hbmzGYfbMM4Igf9T+AQ+WMlMj2OMMRPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gbeYA6ci; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gbeYA6ci;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZF7FM3n6dz30RK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 15:15:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742012136; x=1773548136;
  h=date:from:to:cc:subject:message-id;
  bh=NYmTIJ5IzmS8M1tQVAzodDLw6H20XpWAws3jpbb2mHI=;
  b=gbeYA6ci3owVWw7DUAjXRkdP1GyYZMpQ1R1HULXzXswSJDYw1c/8aCqs
   EkRFnnaI3dW2Kl9Pb7CsyX0mC27YFF7ZC5H4l/YzPAeDkpRRvnYc2t97r
   wORZqZoMh5Ja/DXxk5+dUHbAaxR47aokOtWP1lltm67coTaaEHtSCI59d
   /3lQoFpPtRqDmuxQWwOgnWcpThv650BL3CsmRNQkus4u2/EyHuL5WCzKa
   cqjyHDB7RB7OQ1M+Nky78JiqyT/bxab5JOnVvQrOUG7PQikKYOtYTfUuZ
   Kk8oJFEk8hp2MpS8ZVoP8nMDwGwquMbu5AOzE8ih+cpw5TZmELToYZvF3
   w==;
X-CSE-ConnectionGUID: 1LmOUE5PTveR995DOXde4w==
X-CSE-MsgGUID: HvTaK5K+TPKxGfUlbEfHBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43083098"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="43083098"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 21:15:30 -0700
X-CSE-ConnectionGUID: v+2WDptIQXWGWJhREbkjPQ==
X-CSE-MsgGUID: 8xCAZxWPS/ym6dEicKl9rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="152348522"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 21:15:29 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttIvm-000B3V-1V;
	Sat, 15 Mar 2025 04:15:26 +0000
Date: Sat, 15 Mar 2025 12:14:28 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 7899b3afc74b7b34cbd161425542c2ea11618600
Message-ID: <202503151221.zVz2UNq0-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
branch HEAD: 7899b3afc74b7b34cbd161425542c2ea11618600  Automatic merge of 'next' into merge (2025-03-14 09:05)

elapsed time: 1449m

configs tested: 144
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250314    gcc-13.2.0
arc                   randconfig-001-20250315    gcc-13.2.0
arc                   randconfig-002-20250314    gcc-13.2.0
arc                   randconfig-002-20250315    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250314    clang-21
arm                   randconfig-001-20250315    gcc-14.2.0
arm                   randconfig-002-20250314    gcc-14.2.0
arm                   randconfig-002-20250315    clang-21
arm                   randconfig-003-20250314    gcc-14.2.0
arm                   randconfig-004-20250314    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250314    gcc-14.2.0
arm64                 randconfig-002-20250314    clang-21
arm64                 randconfig-003-20250314    clang-15
arm64                 randconfig-004-20250314    clang-21
csky                  randconfig-001-20250314    gcc-14.2.0
csky                  randconfig-001-20250315    gcc-14.2.0
csky                  randconfig-002-20250314    gcc-14.2.0
csky                  randconfig-002-20250315    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250314    clang-21
hexagon               randconfig-001-20250315    clang-21
hexagon               randconfig-002-20250314    clang-21
hexagon               randconfig-002-20250315    clang-17
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250314    clang-19
i386        buildonly-randconfig-001-20250315    gcc-12
i386        buildonly-randconfig-002-20250314    clang-19
i386        buildonly-randconfig-002-20250315    clang-19
i386        buildonly-randconfig-003-20250314    gcc-12
i386        buildonly-randconfig-003-20250315    clang-19
i386        buildonly-randconfig-004-20250314    gcc-12
i386        buildonly-randconfig-004-20250315    clang-19
i386        buildonly-randconfig-005-20250314    gcc-12
i386        buildonly-randconfig-005-20250315    gcc-11
i386        buildonly-randconfig-006-20250314    gcc-12
i386        buildonly-randconfig-006-20250315    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20250314    gcc-14.2.0
loongarch             randconfig-001-20250315    gcc-14.2.0
loongarch             randconfig-002-20250314    gcc-14.2.0
loongarch             randconfig-002-20250315    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         apollo_defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          rb532_defconfig    clang-17
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250314    gcc-14.2.0
nios2                 randconfig-001-20250315    gcc-14.2.0
nios2                 randconfig-002-20250314    gcc-14.2.0
nios2                 randconfig-002-20250315    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250314    gcc-14.2.0
parisc                randconfig-001-20250315    gcc-14.2.0
parisc                randconfig-002-20250314    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                  mpc885_ads_defconfig    clang-18
powerpc               randconfig-001-20250314    clang-21
powerpc               randconfig-002-20250314    gcc-14.2.0
powerpc               randconfig-003-20250314    gcc-14.2.0
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250314    gcc-14.2.0
powerpc64             randconfig-002-20250314    clang-17
powerpc64             randconfig-003-20250314    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250314    clang-19
riscv                 randconfig-001-20250315    gcc-14.2.0
riscv                 randconfig-002-20250314    gcc-14.2.0
riscv                 randconfig-002-20250315    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250314    gcc-14.2.0
s390                  randconfig-001-20250315    clang-19
s390                  randconfig-002-20250314    gcc-14.2.0
s390                  randconfig-002-20250315    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250314    gcc-14.2.0
sh                    randconfig-001-20250315    gcc-14.2.0
sh                    randconfig-002-20250314    gcc-14.2.0
sh                    randconfig-002-20250315    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250314    gcc-14.2.0
sparc                 randconfig-001-20250315    gcc-14.2.0
sparc                 randconfig-002-20250314    gcc-14.2.0
sparc                 randconfig-002-20250315    gcc-14.2.0
sparc64               randconfig-001-20250314    gcc-14.2.0
sparc64               randconfig-001-20250315    gcc-14.2.0
sparc64               randconfig-002-20250314    gcc-14.2.0
sparc64               randconfig-002-20250315    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250314    gcc-12
um                    randconfig-001-20250315    gcc-12
um                    randconfig-002-20250314    gcc-12
um                    randconfig-002-20250315    clang-18
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250314    clang-19
x86_64      buildonly-randconfig-001-20250315    gcc-12
x86_64      buildonly-randconfig-002-20250314    clang-19
x86_64      buildonly-randconfig-002-20250315    clang-19
x86_64      buildonly-randconfig-003-20250314    gcc-12
x86_64      buildonly-randconfig-003-20250315    clang-19
x86_64      buildonly-randconfig-004-20250314    clang-19
x86_64      buildonly-randconfig-004-20250315    clang-19
x86_64      buildonly-randconfig-005-20250314    gcc-12
x86_64      buildonly-randconfig-005-20250315    clang-19
x86_64      buildonly-randconfig-006-20250314    gcc-12
x86_64      buildonly-randconfig-006-20250315    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250314    gcc-14.2.0
xtensa                randconfig-001-20250315    gcc-14.2.0
xtensa                randconfig-002-20250314    gcc-14.2.0
xtensa                randconfig-002-20250315    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

