Return-Path: <linuxppc-dev+bounces-6364-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 826CEA3D42D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2025 10:08:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yz6qd0482z30QJ;
	Thu, 20 Feb 2025 20:08:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740042492;
	cv=none; b=Khik8q0/XE7BDzIRANTGwyu2nthZ2DVXK496kU4/2v/+L9vjDZOKsbltf7mFY2Uh5N+FTRVMDhyWOgU9BDXhnwtDFQlBXXwZw6yuS2fu7phOaD2Ur297xSQhwhDuXnD3oyM13rjeNfwhzFFT152hPtH3DPCC2HB+lx2Yn6TD1Lw53rhzhbPpR36cCAy9gnPwBcqM7Hmnm4MWkKaEcPAxh4mnFDnwh+Nj6DAIt1mUoUJcNocL7Kw06Y2k5Y7yezWVR0mXbigr/QlltJcbM+KRsOqHgndHJ2fyXNDNg6bGVuR6lEGUKcTxnQA+5xnGjQhEJiwl8A5BD9ulKK5e8WzPpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740042492; c=relaxed/relaxed;
	bh=+OGqItYPt93ufjm/4p/1UobstHtnMhZ7BgDtTODsMxM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=itsk3ag/uKP8+rYhPOq/atmQWSrMUdgqdPj4gOh4xYFWPKRloTrCaN+CJNCezkbbekrzW9FZBbK6hH27RQDKku9TwZzrOG3r15m+8gE8Yd7oR69OSN/86pDr+BN4kc8S3AwdG3mQuv+01t0DkWBjUgPXYseA2ntc3zAFG7bjR9GhHN0erLAgCo36zN2yVgBumHnyTiEEksyn0GfGk/TQHIm3emUd1U2r8ydjGPWjCsQZGiWvOwffrFM2Y1jYhXW7RLf5py9WDjj21Ngt56ePQk7SvV+pAY9SxyjfMpom3p3eMhZJ8ltExPduFQ0n1u465tep11S2PDIuuZpNJrEUaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XkEBvqBm; dkim-atps=neutral; spf=pass (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XkEBvqBm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yz6qZ4Ct8z2y92
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2025 20:08:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740042491; x=1771578491;
  h=date:from:to:cc:subject:message-id;
  bh=PzM7Fk0pTS/dsYYgR3bCVmRF5u2Fao5QJWpMvvwQ9x0=;
  b=XkEBvqBmCMEEx6N9L84B0HzRKB4fWmEI1ZJV+aITdw+cIGnOn6aAUyJF
   MDeKqRLjQWoErQWQsUbc2yA7Lyr9WRGv5dN6ANugeWC+1sljD6B9sUlih
   EEJB4H7DaWCUfagNNASIhmgrfuM8jOGaa103DhYZ9wFv71nEqVINv0mPT
   UmupiYsCZd85C3K1aLhSPpKfxEUkRbkOT2wgxHqOaPSg9co5V/DYMY297
   AnW4G3dn6jrugvKG6yjxGSAW+tbnBhYo1A8xcit6D4IJ/SL14eSxfJ2Qt
   PbuYGip9OsOfkVJMY9QBSi8iS0J23pvi6tsvehTKkIoiRuujMTJ7efQgo
   w==;
X-CSE-ConnectionGUID: w4dDmQqeSnOhm8haTxO1zg==
X-CSE-MsgGUID: SRbTRvOFSIe9VW4JYEHb5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="43642231"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="43642231"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 01:08:06 -0800
X-CSE-ConnectionGUID: G1jVAQktQ+mt65kEKTo+rQ==
X-CSE-MsgGUID: gpYZJXuLS5GN5G69pr4ysA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="119920243"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 20 Feb 2025 01:08:06 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tl2XG-00044v-24;
	Thu, 20 Feb 2025 09:07:59 +0000
Date: Thu, 20 Feb 2025 17:07:08 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:fixes-test] BUILD SUCCESS
 eff2eb592efd73f00590d578c3d6021f604df62c
Message-ID: <202502201702.vRo8eTXo-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: eff2eb592efd73f00590d578c3d6021f604df62c  cxl: Fix cross-reference in documentation and add deprecation warning

elapsed time: 1446m

configs tested: 128
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20250219    gcc-13.2.0
arc                   randconfig-002-20250219    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-21
arm                           imxrt_defconfig    clang-19
arm                        mvebu_v7_defconfig    clang-15
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250219    gcc-14.2.0
arm                   randconfig-002-20250219    clang-17
arm                   randconfig-003-20250219    clang-15
arm                   randconfig-004-20250219    gcc-14.2.0
arm                           u8500_defconfig    gcc-14.2.0
arm                       versatile_defconfig    gcc-14.2.0
arm                        vexpress_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250219    clang-21
arm64                 randconfig-002-20250219    gcc-14.2.0
arm64                 randconfig-003-20250219    gcc-14.2.0
arm64                 randconfig-004-20250219    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250219    gcc-14.2.0
csky                  randconfig-002-20250219    gcc-14.2.0
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250219    clang-14
hexagon               randconfig-002-20250219    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250219    clang-19
i386        buildonly-randconfig-002-20250219    clang-19
i386        buildonly-randconfig-003-20250219    gcc-12
i386        buildonly-randconfig-004-20250219    clang-19
i386        buildonly-randconfig-005-20250219    clang-19
i386        buildonly-randconfig-006-20250219    gcc-12
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250219    gcc-14.2.0
loongarch             randconfig-002-20250219    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250219    gcc-14.2.0
nios2                 randconfig-002-20250219    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250219    gcc-14.2.0
parisc                randconfig-002-20250219    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250219    clang-15
powerpc               randconfig-002-20250219    clang-17
powerpc               randconfig-003-20250219    gcc-14.2.0
powerpc                     tqm8555_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250219    gcc-14.2.0
powerpc64             randconfig-002-20250219    gcc-14.2.0
powerpc64             randconfig-003-20250219    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250219    clang-21
riscv                 randconfig-002-20250219    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250219    clang-18
s390                  randconfig-002-20250219    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                    randconfig-001-20250219    gcc-14.2.0
sh                    randconfig-002-20250219    gcc-14.2.0
sh                          rsk7203_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    gcc-14.2.0
sh                   sh7770_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250219    gcc-14.2.0
sparc                 randconfig-002-20250219    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250219    gcc-14.2.0
sparc64               randconfig-002-20250219    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250219    clang-21
um                    randconfig-002-20250219    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250219    gcc-12
x86_64      buildonly-randconfig-002-20250219    clang-19
x86_64      buildonly-randconfig-003-20250219    gcc-12
x86_64      buildonly-randconfig-004-20250219    clang-19
x86_64      buildonly-randconfig-005-20250219    gcc-12
x86_64      buildonly-randconfig-006-20250219    clang-19
x86_64                              defconfig    gcc-11
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250219    gcc-14.2.0
xtensa                randconfig-002-20250219    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

