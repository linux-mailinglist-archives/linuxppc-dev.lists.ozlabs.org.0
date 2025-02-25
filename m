Return-Path: <linuxppc-dev+bounces-6444-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD0FA43260
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 02:20:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z20CQ0RxLz2yMh;
	Tue, 25 Feb 2025 12:20:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740446417;
	cv=none; b=C4LZt3SibVjy9UsqWZJqUf37jxvHVXG+S5QAXJj0p09nZ7yBwHpPRuR64pb/LfwWL5ABz6apQmwDYbHKj3p9BgzXWk9KeUWuLJYIyL3YSN4bwmbGgaQZhjf6FEFIV600gFaDK5RhJueGlCrrVCUMs56h98x56GT+7Ir+mucQsFDiRlvHVkAfMAx+DvAxpXiTxeeelLKH31eblLFd0vdUNEDswhlu9Mpts9PGgRLMll2nonyEqfxg8l8xxCoCoe9zvLfj3zsWS97LxQT24b6x85VxyTywQrVfyV+CzxGJJVszpBKJeGCdDoOnmk7VyjS/ZlR2ZYVf0jFgtnBedKaBoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740446417; c=relaxed/relaxed;
	bh=7LbeDaaotSqCUGbjY+vak5Xu6JH+ywm6Leg7KpwBhM4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cqJZ3HoqgNW2i5xhhXBfYbIb8i+XGg4fD9dFJxr2+sYiRuzkWFPhjjHKqa+xco9QlziC+EAnrMMn9eA/tRPbCcaV7wvg6o2x8r61qXkNsWAmqc0ycXdgElJ4AGjwRWE8pg6baCY0BO/aPGL3aOKIu133IJNbvqcZNAfcVnD+JbKY2wD/2AbBLJuzhb+Jczfbc9RAWCv4QPVpTHO4sNyDhcq3Dp6ARo9Fd1Xw0xOhbvFPVruAKrUpsMefhjVTyQrmYiVE+GpXI2AKAngppHwWxhILazL8WTps/HSf3TIWpTGnghUd0I7INhC7EpO/6qC8orLbLw2tTouIsjUDniJVxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mEXEOs7a; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mEXEOs7a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z20CM51N6z2yGm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 12:20:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740446416; x=1771982416;
  h=date:from:to:cc:subject:message-id;
  bh=Q74tvCwrIGEeDrS3+mCZEDD2tHeBH8KgulRADDZZsxY=;
  b=mEXEOs7aYVY96S8ERgqL14TFNTMOkfog3eoSdwIaRG5LF67hXAwcCsNP
   Jt4m+I4SxE0/B824BObdEChK4k0UQAXFHE2wCXoPbvNhyFRXytSYnDGHc
   wXDqQlmSEPrsxYLNLvdbWy73NQkyLquOe6Ls0z+16l9K5exXialrCMmYh
   1OKEpxK/A1ks1kTrzDT37OSsF1IGVLNy6K4jkPEQs2T1dbwaIv4TCqQ+s
   0wiAmcvk19rouCi6u389NtnLqQ/yky6Hgf1rR86uTr1sMeH3gZXdO5PpK
   /Av+OXxOs4llrHGRFQIopv2pIw15i2MVyvHOIaZcCm8KPt2bowydbNu55
   g==;
X-CSE-ConnectionGUID: b9Y1eu/oTS2q8DyxYYfUzA==
X-CSE-MsgGUID: uiBNv/XfTdW/YRJIgFTkpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51862159"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="51862159"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 17:20:11 -0800
X-CSE-ConnectionGUID: JKXVVe5eTYCZugmOSC9WWw==
X-CSE-MsgGUID: nLBVGCmTQX6aW4z36PsvGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="116858667"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 Feb 2025 17:20:10 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmjcG-0009YN-1X;
	Tue, 25 Feb 2025 01:20:08 +0000
Date: Tue, 25 Feb 2025 09:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next-test] BUILD SUCCESS
 65acbd1285f7fe8c8b82cb90e4db923db5b9fe03
Message-ID: <202502250932.RdaAcc4A-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 65acbd1285f7fe8c8b82cb90e4db923db5b9fe03  arch/powerpc: Remove unused function icp_native_cause_ipi_rm()

elapsed time: 1078m

configs tested: 137
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250224    gcc-13.2.0
arc                   randconfig-001-20250225    gcc-13.2.0
arc                   randconfig-002-20250224    gcc-13.2.0
arc                   randconfig-002-20250225    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         bcm2835_defconfig    clang-16
arm                   randconfig-001-20250224    gcc-14.2.0
arm                   randconfig-001-20250225    gcc-14.2.0
arm                   randconfig-002-20250224    gcc-14.2.0
arm                   randconfig-002-20250225    gcc-14.2.0
arm                   randconfig-003-20250224    gcc-14.2.0
arm                   randconfig-003-20250225    gcc-14.2.0
arm                   randconfig-004-20250224    gcc-14.2.0
arm                   randconfig-004-20250225    clang-15
arm                          sp7021_defconfig    gcc-14.2.0
arm                        spear3xx_defconfig    clang-16
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250224    gcc-14.2.0
arm64                 randconfig-001-20250225    clang-19
arm64                 randconfig-002-20250224    clang-21
arm64                 randconfig-002-20250225    clang-17
arm64                 randconfig-003-20250224    gcc-14.2.0
arm64                 randconfig-003-20250225    clang-15
arm64                 randconfig-004-20250224    gcc-14.2.0
arm64                 randconfig-004-20250225    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250224    gcc-14.2.0
csky                  randconfig-002-20250224    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250224    clang-21
hexagon               randconfig-002-20250224    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250224    clang-19
i386        buildonly-randconfig-002-20250224    gcc-12
i386        buildonly-randconfig-003-20250224    clang-19
i386        buildonly-randconfig-004-20250224    gcc-12
i386        buildonly-randconfig-005-20250224    clang-19
i386        buildonly-randconfig-006-20250224    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250224    gcc-14.2.0
loongarch             randconfig-002-20250224    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250224    gcc-14.2.0
nios2                 randconfig-002-20250224    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250224    gcc-14.2.0
parisc                randconfig-002-20250224    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250224    gcc-14.2.0
powerpc               randconfig-002-20250224    gcc-14.2.0
powerpc               randconfig-003-20250224    gcc-14.2.0
powerpc                     tqm8541_defconfig    clang-15
powerpc64             randconfig-002-20250224    clang-18
powerpc64             randconfig-003-20250224    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250224    gcc-14.2.0
riscv                 randconfig-002-20250224    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250224    gcc-14.2.0
s390                  randconfig-002-20250224    clang-17
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250224    gcc-14.2.0
sh                    randconfig-002-20250224    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sh                           se7750_defconfig    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250224    gcc-14.2.0
sparc                 randconfig-002-20250224    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250224    gcc-14.2.0
sparc64               randconfig-002-20250224    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250224    gcc-12
um                    randconfig-002-20250224    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250224    gcc-11
x86_64      buildonly-randconfig-002-20250224    gcc-12
x86_64      buildonly-randconfig-003-20250224    clang-19
x86_64      buildonly-randconfig-004-20250224    gcc-12
x86_64      buildonly-randconfig-005-20250224    clang-19
x86_64      buildonly-randconfig-006-20250224    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250224    gcc-14.2.0
xtensa                randconfig-002-20250224    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

