Return-Path: <linuxppc-dev+bounces-9963-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B29AEF235
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 11:01:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWcTN0pCSz2xPc;
	Tue,  1 Jul 2025 19:01:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751360488;
	cv=none; b=UdX7O9kzMDtEphm5r9sWw9/BC2UGBaucegVvN81ZAYa8dA2mo8VJEe1WZBN/PO10yEuTp6LUzLjgnplGOYbMOGwDKKlPRO1pUQXjuxQ+QuUuyYDzE6wg1BhJM8STDCHuxxUC4rbguah8s8qpWtE1iuInkgcdFRSCq3oOrmdmCPI5MGm8kvKpz815PHhWo8g9G/+nrUXidwNx/AX3MI1IlliVSZsR8NG5mMWmsI0lI+Igc4fPnQ9KHD1ujfOCZHoElKVVWwlZl6uYncJc6OoMHR4heLCJfaTxuOLNTV+2BLtFmYopZ4U0xfzYPsmY68pmKYgPE2BodC2bbafflBRDpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751360488; c=relaxed/relaxed;
	bh=yJxgGbUntkNOcE4lDNiP6hFImXKhe0xXtkpErc+HjG8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SoG0Adm7PzDX4jedcLrGuUXNAUa/VOR3wwxZor3HKxcfaG9g7qAQkMBn3pc3J0sxW9jshGOUUrC7Ho87XSaKjtxQCBVt2KdTjrM+I6Fs3OutaTOrH+2cJhf7TCJEFhaUx6rr+fZOw/BSI08nRywL30cXdjJ/ZVPsX6aQ6fa0OuxTMrBzZJjPT3cBvytAHl+QMqJYvp/PMkeabmZgn9fDLazba5jCwBkvsiADB+zrTMh7YfHjGp+eesDbfx+82nBhEfOyKs75x+abCeM9fJtD7r1VxT5QKEg1eKJtoAh5RJD5FxK2pChlTbHtsJwD2WGeaXR00vl1GQjxrKYkhInL6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MovC6f5S; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MovC6f5S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWcTK30Jzz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 19:01:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751360486; x=1782896486;
  h=date:from:to:cc:subject:message-id;
  bh=P0j0mN/4Bh82MBImG6w9H1J5Ott2Qr5YTVOxkfAAe+I=;
  b=MovC6f5S43F/11+IPYMRLsxF3lEUE3eUiK/RE6sR7JqTaHzIYeTAhfHy
   kJi7rI8RZa98qe/olpUvKcs8IfzIBQ92T27jR8NYH5L9uCdvI+iDcAy2q
   Sqr7tNoy9PTZPcyJ8SXqAqZEbM/JDXL3m38rXHnG1vM9E51pp2STs5Of1
   XER2981tU94giNeZiZw4YN2JmLlnMzVDTR+lEOvZT/gzXY0A3K9+aY5Q2
   iHjQoUFQ0lEHR0dlJCDvo4je+ttlGXSD066l/i123kKYJ0x2tOfQgB/em
   nTvDyd7/K8SB2VZEqUcUc7zyg6twwRSZxtKa3e6o81oDxyQ5szuMXMNrY
   w==;
X-CSE-ConnectionGUID: cgGSg6fHT9qo43qVKRpAtQ==
X-CSE-MsgGUID: D7+1YhIDTnuN7OnvntYqWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="71043688"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="71043688"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 02:01:21 -0700
X-CSE-ConnectionGUID: RRGMvOcnSmmY2colOgECzQ==
X-CSE-MsgGUID: eVigLmtHSGG59I9bdd/T2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="184642983"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jul 2025 02:01:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWWrc-000ZvS-33;
	Tue, 01 Jul 2025 09:01:16 +0000
Date: Tue, 01 Jul 2025 17:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 837f3b82898b077b38ea6739f4dc87e4ccfc7751
Message-ID: <202507011738.vxVEYLgN-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 837f3b82898b077b38ea6739f4dc87e4ccfc7751  Automatic merge of 'next' into merge (2025-06-30 13:19)

elapsed time: 1462m

configs tested: 177
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.1.0
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                            hsdk_defconfig    gcc-15.1.0
arc                   randconfig-001-20250630    gcc-10.5.0
arc                   randconfig-001-20250701    gcc-13.3.0
arc                   randconfig-002-20250630    gcc-12.4.0
arc                   randconfig-002-20250701    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                          collie_defconfig    gcc-15.1.0
arm                                 defconfig    clang-21
arm                   randconfig-001-20250630    clang-21
arm                   randconfig-001-20250701    clang-17
arm                   randconfig-002-20250630    gcc-12.4.0
arm                   randconfig-002-20250701    gcc-8.5.0
arm                   randconfig-003-20250630    gcc-14.3.0
arm                   randconfig-003-20250701    clang-21
arm                   randconfig-004-20250630    clang-21
arm                   randconfig-004-20250701    clang-21
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250630    gcc-9.5.0
arm64                 randconfig-001-20250701    clang-21
arm64                 randconfig-002-20250630    gcc-14.3.0
arm64                 randconfig-002-20250701    gcc-15.1.0
arm64                 randconfig-003-20250630    clang-21
arm64                 randconfig-003-20250701    clang-18
arm64                 randconfig-004-20250630    clang-21
arm64                 randconfig-004-20250701    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250630    gcc-15.1.0
csky                  randconfig-002-20250630    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250630    clang-16
hexagon               randconfig-002-20250630    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250630    clang-20
i386        buildonly-randconfig-001-20250701    gcc-12
i386        buildonly-randconfig-002-20250630    gcc-12
i386        buildonly-randconfig-002-20250701    gcc-12
i386        buildonly-randconfig-003-20250630    clang-20
i386        buildonly-randconfig-003-20250701    gcc-12
i386        buildonly-randconfig-004-20250630    gcc-12
i386        buildonly-randconfig-004-20250701    gcc-12
i386        buildonly-randconfig-005-20250630    gcc-12
i386        buildonly-randconfig-005-20250701    gcc-12
i386        buildonly-randconfig-006-20250630    clang-20
i386        buildonly-randconfig-006-20250701    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250630    gcc-15.1.0
loongarch             randconfig-002-20250630    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                            alldefconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250630    gcc-14.2.0
nios2                 randconfig-002-20250630    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250630    gcc-8.5.0
parisc                randconfig-002-20250630    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                 canyonlands_defconfig    clang-21
powerpc                      ep88xc_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250630    clang-18
powerpc               randconfig-002-20250630    clang-21
powerpc               randconfig-003-20250630    gcc-13.3.0
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250630    gcc-10.5.0
powerpc64             randconfig-002-20250630    gcc-14.3.0
powerpc64             randconfig-003-20250630    gcc-10.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                    nommu_k210_defconfig    clang-21
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250630    gcc-8.5.0
riscv                 randconfig-001-20250701    gcc-14.3.0
riscv                 randconfig-002-20250630    clang-16
riscv                 randconfig-002-20250701    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250630    gcc-8.5.0
s390                  randconfig-001-20250701    gcc-9.3.0
s390                  randconfig-002-20250630    clang-21
s390                  randconfig-002-20250701    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250630    gcc-15.1.0
sh                    randconfig-001-20250701    gcc-15.1.0
sh                    randconfig-002-20250630    gcc-15.1.0
sh                    randconfig-002-20250701    gcc-13.3.0
sh                            titan_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250630    gcc-8.5.0
sparc                 randconfig-001-20250701    gcc-10.3.0
sparc                 randconfig-002-20250630    gcc-8.5.0
sparc                 randconfig-002-20250701    gcc-15.1.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250630    gcc-8.5.0
sparc64               randconfig-001-20250701    gcc-8.5.0
sparc64               randconfig-002-20250630    gcc-8.5.0
sparc64               randconfig-002-20250701    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250630    clang-21
um                    randconfig-001-20250701    gcc-12
um                    randconfig-002-20250630    gcc-12
um                    randconfig-002-20250701    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250630    gcc-12
x86_64      buildonly-randconfig-001-20250701    gcc-12
x86_64      buildonly-randconfig-002-20250630    clang-20
x86_64      buildonly-randconfig-002-20250701    gcc-12
x86_64      buildonly-randconfig-003-20250630    clang-20
x86_64      buildonly-randconfig-003-20250701    gcc-12
x86_64      buildonly-randconfig-004-20250630    clang-20
x86_64      buildonly-randconfig-004-20250701    gcc-12
x86_64      buildonly-randconfig-005-20250630    gcc-12
x86_64      buildonly-randconfig-005-20250701    clang-20
x86_64      buildonly-randconfig-006-20250630    gcc-12
x86_64      buildonly-randconfig-006-20250701    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  nommu_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250630    gcc-13.3.0
xtensa                randconfig-001-20250701    gcc-15.1.0
xtensa                randconfig-002-20250630    gcc-8.5.0
xtensa                randconfig-002-20250701    gcc-13.3.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

