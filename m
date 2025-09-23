Return-Path: <linuxppc-dev+bounces-12529-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E474B93CE1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Sep 2025 03:14:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cW2842CFHz3cYG;
	Tue, 23 Sep 2025 11:14:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758590084;
	cv=none; b=DpWjxvUffdbgYtKGLF4CQxYdNgDbkicZmhw4PY/jqLh/7+NvUp+U/mqfcduDImLq+OZG1zGOlmbFQrzmFrGJ9x/pWKZhN24UoFsB5hPwRdXs7NIARg4/Uik13t4TAVaLzfGKv9SAAEB6KfdtDVvsWqt4Ym78t75mI2qdM9mgVNGYlaFZ2mgDnL8vK8wQF3rW1Awoie1RKO2FqL9qg3eLTEuPJy6nBENAFoWivFW6BjU3u11lxYL5bzeulpzg/NV8sNnLwoAhj9dsRirAh7datHYa3eBaoxHGbKVSSX8cugubYBe16QRdXuFa+J9CNv3vvakfyFYh/4mz4Qb3YMnp4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758590084; c=relaxed/relaxed;
	bh=qe9PHpKMvV9SV5p029jZHG98sWJCwSQ82ZBVZ8CyfJA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SbpzYiuw84K18p/QaUzEmg63hsUQy1ITw9mn9gwbBLcPmzI00BgnipcX0DKKYwZVhwNk3iJ4SUQ5DS37Id4uxTXjvBgbgo0kYhX43Pm4BmKTt9lRsyvNvYOt6285O8IsT4/tlMR7eJU4tuntm4mec4msMWNP8QhpOu3o3zHhtzhQaZTpKYeDjOOHshjreBVsC4EOwjb0MtYadPXd3HjA4fc95NXXggR/CsaZbz2Z6CE3fZTaT/t8/0bA7nD5PjWtjJlLL+7N+EYMSJhPlnshLFglCVA6EFYmIJMpWwBePQ3oa4b3DrKY5L2gvMHWt0mrGyjDWFp+CeTA1kOAd1yS5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eSl1+JFi; dkim-atps=neutral; spf=pass (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eSl1+JFi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cW2816y2yz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 11:14:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758590082; x=1790126082;
  h=date:from:to:cc:subject:message-id;
  bh=qzReNKjb8Bd8myx0tQlMEgM3EzbV4kRilqqPPkuXkSQ=;
  b=eSl1+JFibahs5MErMJrcFI1piIV1eH4LTYeAJAmPa1/s/oh6fLP/whWA
   05cAFGeMqKGwnfpUa4bg+C5ntxP4mpprnbIoOLhnO7MhGGiv/ctLESnir
   TQ2DT7PaSWFUQFawN80SJ3VhMxP7veEgBowMC4OxTyqs7B3DeAENo8Eg1
   dLjC1tRj0kFXPHRJl+4WzKQg8yBtsua4k9PUp+CsWHj1ZmyLzn8wF1LzB
   CuE7jriMSuWcFJK6ceSnLubpS+UUOhD5pHqaT5Kyp9MRpE5u2i1cxvwei
   IXTftDjnPhAdOjDh2wP9yrF2mDS9xaLX0pbb7WWolnkkhY1yCbkzpo8ve
   g==;
X-CSE-ConnectionGUID: 8Y57WlHgRC6DmQS6uiHnLQ==
X-CSE-MsgGUID: KhK3iJQaT8ui21mvHF6ycg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63490997"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="63490997"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 18:14:37 -0700
X-CSE-ConnectionGUID: S6vkQ7Z3SymIu/ghZ6UI9Q==
X-CSE-MsgGUID: whKCtO+SR/ufdzP+kUCq6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="177000113"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Sep 2025 18:14:36 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0rc2-0002cD-02;
	Tue, 23 Sep 2025 01:14:34 +0000
Date: Tue, 23 Sep 2025 09:13:58 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next-test] BUILD SUCCESS
 4a774b39e68fac7d6c7c9cffeb6a4ea4b6dc8b41
Message-ID: <202509230948.YGNqlmd0-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
branch HEAD: 4a774b39e68fac7d6c7c9cffeb6a4ea4b6dc8b41  powerpc/perf/vpa-dtl: Add documentation for VPA dispatch trace log PMU

elapsed time: 892m

configs tested: 139
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250922    gcc-8.5.0
arc                   randconfig-002-20250922    gcc-9.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
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
i386                             alldefconfig    gcc-14
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250922    clang-20
i386        buildonly-randconfig-001-20250923    gcc-14
i386        buildonly-randconfig-002-20250922    gcc-14
i386        buildonly-randconfig-002-20250923    clang-20
i386        buildonly-randconfig-003-20250922    gcc-14
i386        buildonly-randconfig-003-20250923    clang-20
i386        buildonly-randconfig-004-20250922    gcc-14
i386        buildonly-randconfig-004-20250923    gcc-14
i386        buildonly-randconfig-005-20250922    clang-20
i386        buildonly-randconfig-005-20250923    clang-20
i386        buildonly-randconfig-006-20250922    clang-20
i386        buildonly-randconfig-006-20250923    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250922    clang-22
loongarch             randconfig-002-20250922    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5249evb_defconfig    gcc-15.1.0
m68k                           virt_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                         10m50_defconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250922    gcc-11.5.0
nios2                 randconfig-002-20250922    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250922    gcc-8.5.0
parisc                randconfig-002-20250922    gcc-9.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                 canyonlands_defconfig    clang-22
powerpc               randconfig-001-20250922    clang-22
powerpc               randconfig-002-20250922    gcc-12.5.0
powerpc               randconfig-003-20250922    clang-17
powerpc64             randconfig-002-20250922    clang-20
powerpc64             randconfig-003-20250922    clang-17
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250922    clang-22
riscv                 randconfig-002-20250922    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250922    gcc-8.5.0
s390                  randconfig-001-20250923    gcc-8.5.0
s390                  randconfig-002-20250922    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250922    gcc-15.1.0
sh                    randconfig-002-20250922    gcc-11.5.0
sh                           se7780_defconfig    gcc-15.1.0
sh                          urquell_defconfig    gcc-15.1.0
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

