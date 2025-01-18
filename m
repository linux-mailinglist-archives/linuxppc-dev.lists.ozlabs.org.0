Return-Path: <linuxppc-dev+bounces-5373-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 724B2A15B87
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2025 06:36:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZlhf6hThz301n;
	Sat, 18 Jan 2025 16:36:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737178594;
	cv=none; b=heuFVd6uhyxVLjNneh+kPBkI5K7LVokdcQVWJ/FYicHwVFz2a3k5GwaGYBjQb0PH2MTTCQwD+FrSvoqSacTbSqtTD2qKlK/UxuMS4CDH28+vCr0IucpVDuPrO/1Vg684pjkW8t8HSc2rT0x506Nri85mloJrfz4mHfRMTT4PlTYhp07gIMvqcNBY2NEKgEknX8btL3bE+FGXT7tkwAvu2ZivgqZeQL75z3sDk81J/p4FLFlgr3+I7pnpFkKb1AqRQbymdypgEAJHzm1eE+G77Lc0hsN7ntI0PsJ+kJ59BBL7IarW0Jc7+v9Nfxkkzc1S3XzgIYsq7dIGNrI9Xrg7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737178594; c=relaxed/relaxed;
	bh=6FYsjW5l2FXDZKi7yM+ZQMboy/RuMpRMiulm9NeQ4GU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YSm4eUKQ0KlgGki/1CJ0GAdfKmTxX5pGM0UNh7KTycUk6jy+pqSZfGGtgNMoEOzzvcaErlv1+Mnts1NQ5LhHtkRA/SvbFbyO2zD2NPu9QuV0aV+GZUwxJvMeB6ProOTFcwSoRoYhUF/7hZgJ0FrDmPMOYIz6ro9XFf20Wro9Imm28w4U79Ptxkh8IMQDsmw1UXmUJRQzL3R0hWou15Mf3xQToI9MK/z4x2BBw9A2AIKOsI115V/2i1eR78ikyvlgMIh/YEBUrOJHipFntcQEbCKYtTTHsLav8DkuqiFcIn6xTbIzh9qomVrGkTU5WZU/4SX1g0dOYanQyZsORv+DSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VUryxEVM; dkim-atps=neutral; spf=pass (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VUryxEVM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZlhc65xNz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 16:36:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737178593; x=1768714593;
  h=date:from:to:cc:subject:message-id;
  bh=HGX7AzuT+7+oHv2fa240m8PNl+h5K6pE30o65Wh+54M=;
  b=VUryxEVMtWm44jxNyieXlBOQp2dx50u/rQ2nUTT14++EMLebg3FaWDh7
   5zMFnFUbo7FJm4hOix5l3Z5Z1SusZlfiht/FNy/3fArawwJsNNazTD2oF
   I0f2KEMFXu9NgnnnJdOWC22anIWxOiur60fVo/OdFuJ8XTAcGf+5turX6
   nRu7//HeaK+1W0deUNyzVbfe5Nj6Kevxa74mgr0ya3YsqekgtLC6clGnR
   MMidiNFY4+0ByYtfx++W7jPVk2IKpda4VjMWGK8Y4NVOK1mwIB0o9DcOr
   U06gvzo7rM8561P7Oc0OlI81tGoW+c3aTsxDM21Wg0jpXzytPNVt/zjOi
   A==;
X-CSE-ConnectionGUID: bA9ssdCsTlKIqWzbzKeDSA==
X-CSE-MsgGUID: z16dtCFRRFiWkMvEM04LIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="36838629"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="36838629"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 21:36:26 -0800
X-CSE-ConnectionGUID: XB6JBzUzQjS5VFQHcEGCIw==
X-CSE-MsgGUID: Wr7FKnC/QPKrllHtHPHvdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="136830345"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Jan 2025 21:36:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ1VP-000U7T-10;
	Sat, 18 Jan 2025 05:36:23 +0000
Date: Sat, 18 Jan 2025 13:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next] BUILD SUCCESS
 7fee0217538ab11b9563d39822a0fc5e006ca84b
Message-ID: <202501181346.mCOy2bkg-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 7fee0217538ab11b9563d39822a0fc5e006ca84b  MAINTAINERS: powerpc: Update my status

elapsed time: 1442m

configs tested: 138
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                        nsimosci_defconfig    gcc-13.2.0
arc                   randconfig-001-20250117    gcc-13.2.0
arc                   randconfig-002-20250117    gcc-13.2.0
arc                    vdk_hs38_smp_defconfig    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         lpc32xx_defconfig    clang-20
arm                          moxart_defconfig    gcc-14.2.0
arm                          pxa3xx_defconfig    clang-20
arm                   randconfig-001-20250117    clang-18
arm                   randconfig-002-20250117    gcc-14.2.0
arm                   randconfig-003-20250117    gcc-14.2.0
arm                   randconfig-004-20250117    clang-16
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250117    gcc-14.2.0
arm64                 randconfig-002-20250117    clang-18
arm64                 randconfig-003-20250117    clang-20
arm64                 randconfig-004-20250117    gcc-14.2.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250117    gcc-14.2.0
csky                  randconfig-001-20250118    gcc-14.2.0
csky                  randconfig-002-20250117    gcc-14.2.0
csky                  randconfig-002-20250118    gcc-14.2.0
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250117    clang-20
hexagon               randconfig-001-20250118    clang-20
hexagon               randconfig-002-20250117    clang-20
hexagon               randconfig-002-20250118    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250117    clang-19
i386        buildonly-randconfig-001-20250118    gcc-12
i386        buildonly-randconfig-002-20250117    clang-19
i386        buildonly-randconfig-002-20250118    clang-19
i386        buildonly-randconfig-003-20250117    gcc-12
i386        buildonly-randconfig-003-20250118    clang-19
i386        buildonly-randconfig-004-20250117    gcc-12
i386        buildonly-randconfig-004-20250118    gcc-11
i386        buildonly-randconfig-005-20250117    clang-19
i386        buildonly-randconfig-005-20250118    clang-19
i386        buildonly-randconfig-006-20250117    gcc-11
i386        buildonly-randconfig-006-20250118    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250117    gcc-14.2.0
loongarch             randconfig-001-20250118    gcc-14.2.0
loongarch             randconfig-002-20250117    gcc-14.2.0
loongarch             randconfig-002-20250118    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250117    gcc-14.2.0
nios2                 randconfig-001-20250118    gcc-14.2.0
nios2                 randconfig-002-20250117    gcc-14.2.0
nios2                 randconfig-002-20250118    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250117    gcc-14.2.0
parisc                randconfig-001-20250118    gcc-14.2.0
parisc                randconfig-002-20250117    gcc-14.2.0
parisc                randconfig-002-20250118    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                       eiger_defconfig    clang-17
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250117    gcc-14.2.0
powerpc               randconfig-001-20250118    clang-15
powerpc               randconfig-002-20250117    gcc-14.2.0
powerpc               randconfig-002-20250118    clang-20
powerpc               randconfig-003-20250117    gcc-14.2.0
powerpc               randconfig-003-20250118    clang-20
powerpc                     stx_gp3_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250117    clang-16
powerpc64             randconfig-001-20250118    clang-17
powerpc64             randconfig-002-20250117    clang-20
powerpc64             randconfig-002-20250118    clang-19
powerpc64             randconfig-003-20250117    gcc-14.2.0
powerpc64             randconfig-003-20250118    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250117    gcc-14.2.0
riscv                 randconfig-002-20250117    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250117    gcc-14.2.0
s390                  randconfig-002-20250117    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250117    gcc-14.2.0
sh                    randconfig-002-20250117    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250117    gcc-14.2.0
sparc                 randconfig-002-20250117    gcc-14.2.0
sparc64               randconfig-001-20250117    gcc-14.2.0
sparc64               randconfig-002-20250117    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20250117    clang-20
um                    randconfig-002-20250117    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250117    gcc-12
x86_64      buildonly-randconfig-001-20250118    clang-19
x86_64      buildonly-randconfig-002-20250117    gcc-12
x86_64      buildonly-randconfig-002-20250118    gcc-12
x86_64      buildonly-randconfig-003-20250117    gcc-12
x86_64      buildonly-randconfig-003-20250118    clang-19
x86_64      buildonly-randconfig-004-20250117    gcc-12
x86_64      buildonly-randconfig-004-20250118    gcc-12
x86_64      buildonly-randconfig-005-20250117    gcc-12
x86_64      buildonly-randconfig-005-20250118    clang-19
x86_64      buildonly-randconfig-006-20250117    clang-19
x86_64      buildonly-randconfig-006-20250118    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250117    gcc-14.2.0
xtensa                randconfig-002-20250117    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

