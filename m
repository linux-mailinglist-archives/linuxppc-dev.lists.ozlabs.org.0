Return-Path: <linuxppc-dev+bounces-15011-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EEACDE6D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Dec 2025 08:32:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dcy3z6rrGz2xg9;
	Fri, 26 Dec 2025 18:31:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766734319;
	cv=none; b=OP2AXwQZmIitPIZcCSE9H2p5RLd74ZE9ljgiJny9UwbOJ6nthgI6uzdxVj8DhAEWoIUMKd2mxa4rB59UIERdchJYaPsZqE34ARfIslrjAtFkVFCQw5QdnaPJgsqfcDwtgCWkQKYmKIAg7Wlkb9t6/GAAemlhLwgmQ171pYwuhf8Z2TiilZR9vEbuB7jhzwg0O0eojGnfs8/hzFHuigk01Sz2OxpQ2TvFGPR+yNw9DwF9izxUKA42wbs7bWuKi27iTsJfk6aitpleL4/++XjKb9DOtbe1fSgrpEJPwMnTMsSUdCQjfPnDBmNT8rEkzCO0GuMxJYWXxIw89Tj7wffu2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766734319; c=relaxed/relaxed;
	bh=3Tz7r4iRp8ZETJEuAGED2jtTh8zjv/NwUqsSqAwp+44=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jAm3OTeaLwxfpRuy561tRpaR6oKdLAbb2gDL/plj06ltamdbf3+vT0XVPQ4Ac50yR+FUf8WkoYsAHWkRYjPwPGwTS302hD4u3LO8Mn5yhz4IdQ5K+2A+1IUmlV9WXuj+N3+V2dUtvWJmygQov6VCJV93nF00rrwydBUV+Q0VC7pnqRoeDbzzsCxyS4VQuFAn7374jmKFuc6mPTOz2MpP5y/Zl/rMa6ZRPxcdYmcZgLFsFxb/PrqRFPVp4rnZntOhM7DfSXEMjS92j85r42JXj5eo2h2wa0EKIPG3Wpy42D832lrRYTrIdq553W2AdWVtcMvDpdNVOdR4b03zOiDHbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hbfWGSba; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hbfWGSba;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dcy3w3Y4nz2xSX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Dec 2025 18:31:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766734317; x=1798270317;
  h=date:from:to:cc:subject:message-id;
  bh=j6lyyJD+Uu+0EnTK0d//8+nZpvZd44Ab+I04ECpPky8=;
  b=hbfWGSbaHRnIFiXkaWJNEx/Ueuyec6JuTNG1MDASFWsd5kV8IA1Fwtk/
   +D5ZVj1+ewdMyNpdXAHoHKXoW5CId930TI3mOO8z/W4Ojx5dYudEBEXXr
   br8+B3mldgT9SZvQivAgiKmXs8T/8gU0Bqq2ek2jEnXF9OMxkCRf6IMI5
   B6U+oxR1zhWktZlziTnLRkh1W8nCmodKTn7OKq2z5xYsbWVpMHNhHT0x8
   pH6yZkjdXsUBzw2Z4T4kW6G5adNQbjPFJMUjeLdqP5St2G1XxE6j42P7R
   c/DBlXsM+eSTV7MCnz5vWW3aVAU72dGbN+AwnBRU/67sMYi/QgdM556w/
   w==;
X-CSE-ConnectionGUID: 2IS773X7Qr6eJ3GC98ooIQ==
X-CSE-MsgGUID: 3gj7rgnYSLe/TjBPRnDGEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68434538"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68434538"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 23:31:50 -0800
X-CSE-ConnectionGUID: 4KErmIzoS0WD1D087oFGYw==
X-CSE-MsgGUID: XV3T6+NPTISVGI69YfMWIg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 25 Dec 2025 23:31:49 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZ2ID-000000004q5-2HzQ;
	Fri, 26 Dec 2025 07:31:46 +0000
Date: Fri, 26 Dec 2025 15:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 7170d5dcd3d84398d2a88cc29264ca5198ff5c4a
Message-ID: <202512261516.pzB7o4hD-lkp@intel.com>
User-Agent: s-nail v14.9.25
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 7170d5dcd3d84398d2a88cc29264ca5198ff5c4a  Automatic merge of 'fixes' into merge (2025-12-25 15:23)

elapsed time: 1281m

configs tested: 291
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251225    gcc-11.5.0
arc                   randconfig-001-20251226    gcc-8.5.0
arc                   randconfig-002-20251225    gcc-11.5.0
arc                   randconfig-002-20251226    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.1.0
arm                          ep93xx_defconfig    clang-22
arm                      footbridge_defconfig    clang-17
arm                       netwinder_defconfig    gcc-14
arm                   randconfig-001-20251225    clang-22
arm                   randconfig-001-20251226    gcc-8.5.0
arm                   randconfig-002-20251225    gcc-12.5.0
arm                   randconfig-002-20251226    gcc-8.5.0
arm                   randconfig-003-20251225    clang-22
arm                   randconfig-003-20251226    gcc-8.5.0
arm                   randconfig-004-20251225    clang-22
arm                   randconfig-004-20251226    gcc-8.5.0
arm                        spear3xx_defconfig    gcc-14
arm                        vexpress_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251225    clang-18
arm64                 randconfig-001-20251226    gcc-12.5.0
arm64                 randconfig-002-20251225    gcc-12.5.0
arm64                 randconfig-002-20251226    gcc-12.5.0
arm64                 randconfig-003-20251225    clang-22
arm64                 randconfig-003-20251226    gcc-12.5.0
arm64                 randconfig-004-20251225    clang-22
arm64                 randconfig-004-20251226    gcc-12.5.0
csky                             alldefconfig    gcc-14
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251225    gcc-15.1.0
csky                  randconfig-001-20251226    gcc-12.5.0
csky                  randconfig-002-20251225    gcc-11.5.0
csky                  randconfig-002-20251226    gcc-12.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251225    clang-22
hexagon               randconfig-001-20251226    gcc-15.1.0
hexagon               randconfig-002-20251225    clang-22
hexagon               randconfig-002-20251226    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251225    clang-20
i386        buildonly-randconfig-001-20251226    clang-20
i386        buildonly-randconfig-002-20251225    clang-20
i386        buildonly-randconfig-002-20251226    clang-20
i386        buildonly-randconfig-003-20251225    gcc-14
i386        buildonly-randconfig-003-20251226    clang-20
i386        buildonly-randconfig-004-20251225    clang-20
i386        buildonly-randconfig-004-20251226    clang-20
i386        buildonly-randconfig-005-20251225    clang-20
i386        buildonly-randconfig-005-20251226    clang-20
i386        buildonly-randconfig-006-20251225    gcc-14
i386        buildonly-randconfig-006-20251226    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251225    gcc-14
i386                  randconfig-001-20251226    clang-20
i386                  randconfig-002-20251225    clang-20
i386                  randconfig-002-20251226    clang-20
i386                  randconfig-003-20251225    clang-20
i386                  randconfig-003-20251226    clang-20
i386                  randconfig-004-20251225    clang-20
i386                  randconfig-004-20251226    clang-20
i386                  randconfig-005-20251225    clang-20
i386                  randconfig-005-20251226    clang-20
i386                  randconfig-006-20251225    clang-20
i386                  randconfig-006-20251226    clang-20
i386                  randconfig-007-20251225    clang-20
i386                  randconfig-007-20251226    clang-20
i386                  randconfig-011-20251225    clang-20
i386                  randconfig-012-20251225    gcc-14
i386                  randconfig-013-20251225    gcc-14
i386                  randconfig-014-20251225    clang-20
i386                  randconfig-015-20251225    gcc-14
i386                  randconfig-016-20251225    clang-20
i386                  randconfig-017-20251225    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251225    clang-22
loongarch             randconfig-001-20251226    gcc-15.1.0
loongarch             randconfig-002-20251225    gcc-15.1.0
loongarch             randconfig-002-20251226    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-14
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
microblaze                      mmu_defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251225    gcc-9.5.0
nios2                 randconfig-001-20251226    gcc-15.1.0
nios2                 randconfig-002-20251225    gcc-11.5.0
nios2                 randconfig-002-20251226    gcc-15.1.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251225    gcc-12.5.0
parisc                randconfig-001-20251226    clang-17
parisc                randconfig-002-20251225    gcc-14.3.0
parisc                randconfig-002-20251226    clang-17
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                        icon_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251225    clang-22
powerpc               randconfig-001-20251226    clang-17
powerpc               randconfig-002-20251225    clang-22
powerpc               randconfig-002-20251226    clang-17
powerpc64             randconfig-001-20251225    gcc-8.5.0
powerpc64             randconfig-001-20251226    clang-17
powerpc64             randconfig-002-20251225    gcc-13.4.0
powerpc64             randconfig-002-20251226    clang-17
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251225    clang-22
riscv                 randconfig-001-20251226    gcc-8.5.0
riscv                 randconfig-002-20251225    gcc-11.5.0
riscv                 randconfig-002-20251226    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251225    gcc-14.3.0
s390                  randconfig-001-20251226    gcc-8.5.0
s390                  randconfig-002-20251225    clang-19
s390                  randconfig-002-20251226    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                          kfr2r09_defconfig    gcc-15.1.0
sh                    randconfig-001-20251225    gcc-15.1.0
sh                    randconfig-001-20251226    gcc-8.5.0
sh                    randconfig-002-20251225    gcc-9.5.0
sh                    randconfig-002-20251226    gcc-8.5.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251225    gcc-8.5.0
sparc                 randconfig-001-20251226    clang-22
sparc                 randconfig-002-20251225    gcc-8.5.0
sparc                 randconfig-002-20251226    clang-22
sparc                       sparc64_defconfig    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251225    gcc-9.5.0
sparc64               randconfig-001-20251226    clang-22
sparc64               randconfig-002-20251225    clang-20
sparc64               randconfig-002-20251226    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251225    gcc-13
um                    randconfig-001-20251226    clang-22
um                    randconfig-002-20251225    gcc-14
um                    randconfig-002-20251226    clang-22
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251225    clang-20
x86_64      buildonly-randconfig-001-20251226    gcc-14
x86_64      buildonly-randconfig-002-20251225    clang-20
x86_64      buildonly-randconfig-002-20251226    gcc-14
x86_64      buildonly-randconfig-003-20251225    gcc-14
x86_64      buildonly-randconfig-003-20251226    gcc-14
x86_64      buildonly-randconfig-004-20251225    clang-20
x86_64      buildonly-randconfig-004-20251226    gcc-14
x86_64      buildonly-randconfig-005-20251225    gcc-14
x86_64      buildonly-randconfig-005-20251226    gcc-14
x86_64      buildonly-randconfig-006-20251225    clang-20
x86_64      buildonly-randconfig-006-20251226    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251225    gcc-12
x86_64                randconfig-001-20251226    gcc-14
x86_64                randconfig-002-20251225    clang-20
x86_64                randconfig-002-20251226    gcc-14
x86_64                randconfig-003-20251225    gcc-12
x86_64                randconfig-003-20251226    gcc-14
x86_64                randconfig-004-20251225    clang-20
x86_64                randconfig-004-20251226    gcc-14
x86_64                randconfig-005-20251225    gcc-14
x86_64                randconfig-005-20251226    gcc-14
x86_64                randconfig-006-20251225    gcc-14
x86_64                randconfig-006-20251226    gcc-14
x86_64                randconfig-011-20251225    gcc-13
x86_64                randconfig-011-20251226    clang-20
x86_64                randconfig-012-20251225    gcc-14
x86_64                randconfig-012-20251226    clang-20
x86_64                randconfig-013-20251225    clang-20
x86_64                randconfig-013-20251226    clang-20
x86_64                randconfig-014-20251225    clang-20
x86_64                randconfig-014-20251226    clang-20
x86_64                randconfig-015-20251225    gcc-14
x86_64                randconfig-015-20251226    clang-20
x86_64                randconfig-016-20251225    clang-20
x86_64                randconfig-016-20251226    clang-20
x86_64                randconfig-071-20251225    clang-20
x86_64                randconfig-071-20251226    gcc-12
x86_64                randconfig-072-20251225    clang-20
x86_64                randconfig-072-20251226    gcc-12
x86_64                randconfig-073-20251225    gcc-14
x86_64                randconfig-073-20251226    gcc-12
x86_64                randconfig-074-20251225    clang-20
x86_64                randconfig-074-20251226    gcc-12
x86_64                randconfig-075-20251225    gcc-14
x86_64                randconfig-075-20251226    gcc-12
x86_64                randconfig-076-20251225    gcc-14
x86_64                randconfig-076-20251226    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251225    gcc-8.5.0
xtensa                randconfig-001-20251226    clang-22
xtensa                randconfig-002-20251225    gcc-10.5.0
xtensa                randconfig-002-20251226    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

