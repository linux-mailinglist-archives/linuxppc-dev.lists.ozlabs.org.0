Return-Path: <linuxppc-dev+bounces-2932-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D44A9BF5F8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 20:01:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkF1M002lz3bdS;
	Thu,  7 Nov 2024 06:01:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730919702;
	cv=none; b=hzbn3lGLmzOf/SJPBeQ17jk5Fvr0ssBKqj9uetjGRk4qmNOF4M9uWWNzKXd2oT+1yIGqpTw/LjbvMGHjPeLYWrOznAD+2QIoEo325Mma0VTATjMj74p04C2qMFfq8bXpzqRVmY3ebceQJiDVfOitMRpDkh/kDZtHlOZaNE/jt1byJXk4ZUQwMmyqUWTSliTAZ/RM0Z/kaXYj+cX6JwEzFS/cinryEFn65kstDZi3MjJr1tFflvZyGr0pEdrLT7a0VLI/n1+QYmgQ41oWgE40AV4K1RwQo39BeUWUN9PNDNa3k6Fib9UYWYNLEQ3bbI7cZQLe0XjnKyXp2mjCKWRXzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730919702; c=relaxed/relaxed;
	bh=QqS4dahMpKYMOQaB7Yf1ubcj/5LFVmLqYy8QPYm3T1Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ERuS2kyvhnu/vI07qNzAOS815faWkdaWpaMAPms1iWqbVd80GLL/2UB2xj5R4q18SwHWH62emulSgCCzQnPUaOA+0SE7WRkYE6qE1c9WpD7h6PhGKetk/SISsYv0ZZJdFiXlkiN5+Yt/Ks11PZAJ9GwhLS6fyy6HTi0LazWS2mVQp4CRAD0BwqJ+ZzGB65CbgFdS/myeaK+w9QHK+4HqjQCizjcuKZkQQrdnCthP857tjzfffEDjxDuBz8YO9/w672G5HRE8PZnDwRcWpnQsrM/14Kw+XE1tJo623vw2yxjSdnyiXbQhiwiktoWULwTwJVxO3+SPx+jSMyGMl8rSPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OP3HW6wS; dkim-atps=neutral; spf=pass (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OP3HW6wS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkF1J0Mwlz3bbT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 06:01:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730919700; x=1762455700;
  h=date:from:to:cc:subject:message-id;
  bh=DwGc9spuNQ2FUEkYRj0TVtFMpbo87N6xckIfkGzDtNc=;
  b=OP3HW6wShnmy+iL+fdwkNb5tX+UoBOxK3GTvSXwf53pMpUHWXVZ8FQoe
   oif++Y/W0c5rIXXCOh+6i4JWqQ24ThlQozm1YUVn3KTu2AgaxuE4R5FNj
   TOHscRMHyxxRNey0/8nHIt2FHVzEE7bPwSLwWSvNERKCJqZF9gELUDJeB
   47Ni6LCWIuwRzksByrEg9UWoSnOsgfB5+uu0+KlvfYyD5s9ElMcntQYRA
   6E0Ews8+jXia6a3ae1gAvFF085FXDfXiQaYNGqK1rD5EdEMtUZyDO5Xyk
   RjVEfBZc2eRRqkJyKGGQgF3QrMsHK9cQIhKkyOY0IGXy5xwkkWGzTzowW
   g==;
X-CSE-ConnectionGUID: 01lENcjeQoqYWgaCMFcvjA==
X-CSE-MsgGUID: gUen/oIXQxmIL8+kba7NfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="18363558"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="18363558"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 11:01:34 -0800
X-CSE-ConnectionGUID: KwyL77hASzalTuqpnsi+rA==
X-CSE-MsgGUID: NQF2Zl5xQpCvAK+t2hMj1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="89238564"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Nov 2024 11:01:32 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8lHW-000pJw-2T;
	Wed, 06 Nov 2024 19:01:30 +0000
Date: Thu, 07 Nov 2024 03:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:fixes-test] BUILD SUCCESS
 a373830f96db288a3eb43a8692b6bcd0bd88dfe1
Message-ID: <202411070327.Bu2HCOY9-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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
branch HEAD: a373830f96db288a3eb43a8692b6bcd0bd88dfe1  KVM: PPC: Book3S HV: Mask off LPCR_MER for a vCPU before running it to avoid spurious interrupts

elapsed time: 725m

configs tested: 185
configs skipped: 109

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                          axs101_defconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                   randconfig-001-20241106    gcc-14.2.0
arc                   randconfig-002-20241106    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                         axm55xx_defconfig    gcc-14.2.0
arm                        clps711x_defconfig    clang-20
arm                          ixp4xx_defconfig    clang-20
arm                   randconfig-001-20241106    gcc-14.2.0
arm                   randconfig-002-20241106    gcc-14.2.0
arm                   randconfig-003-20241106    gcc-14.2.0
arm                   randconfig-004-20241106    gcc-14.2.0
arm                           sama5_defconfig    gcc-14.2.0
arm                        shmobile_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241106    gcc-14.2.0
arm64                 randconfig-002-20241106    gcc-14.2.0
arm64                 randconfig-003-20241106    gcc-14.2.0
arm64                 randconfig-004-20241106    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241106    gcc-14.2.0
csky                  randconfig-002-20241106    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241106    gcc-14.2.0
hexagon               randconfig-002-20241106    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241106    gcc-12
i386        buildonly-randconfig-002-20241106    gcc-12
i386        buildonly-randconfig-003-20241106    gcc-12
i386        buildonly-randconfig-004-20241106    gcc-12
i386        buildonly-randconfig-005-20241106    gcc-12
i386        buildonly-randconfig-006-20241106    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241106    gcc-12
i386                  randconfig-002-20241106    gcc-12
i386                  randconfig-003-20241106    gcc-12
i386                  randconfig-004-20241106    gcc-12
i386                  randconfig-005-20241106    gcc-12
i386                  randconfig-006-20241106    gcc-12
i386                  randconfig-011-20241106    gcc-12
i386                  randconfig-012-20241106    gcc-12
i386                  randconfig-013-20241106    gcc-12
i386                  randconfig-014-20241106    gcc-12
i386                  randconfig-015-20241106    gcc-12
i386                  randconfig-016-20241106    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241106    gcc-14.2.0
loongarch             randconfig-002-20241106    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    clang-20
m68k                        mvme147_defconfig    clang-20
m68k                        mvme16x_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                            gpr_defconfig    gcc-14.2.0
mips                        maltaup_defconfig    clang-20
mips                        vocore2_defconfig    gcc-14.2.0
nios2                         10m50_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241106    gcc-14.2.0
nios2                 randconfig-002-20241106    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.2.0
openrisc                       virt_defconfig    clang-20
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241106    gcc-14.2.0
parisc                randconfig-002-20241106    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    gcc-14.2.0
powerpc                        cell_defconfig    gcc-14.2.0
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                        fsp2_defconfig    clang-20
powerpc                       holly_defconfig    clang-20
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241106    gcc-14.2.0
powerpc               randconfig-002-20241106    gcc-14.2.0
powerpc               randconfig-003-20241106    gcc-14.2.0
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc                      tqm8xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241106    gcc-14.2.0
powerpc64             randconfig-002-20241106    gcc-14.2.0
powerpc64             randconfig-003-20241106    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv             nommu_k210_sdcard_defconfig    clang-20
riscv                    nommu_virt_defconfig    gcc-14.2.0
riscv                 randconfig-001-20241106    gcc-14.2.0
riscv                 randconfig-002-20241106    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241106    gcc-14.2.0
s390                  randconfig-002-20241106    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20241106    gcc-14.2.0
sh                    randconfig-002-20241106    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241106    gcc-14.2.0
sparc64               randconfig-002-20241106    gcc-14.2.0
um                               alldefconfig    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241106    gcc-14.2.0
um                    randconfig-002-20241106    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241106    gcc-11
x86_64      buildonly-randconfig-002-20241106    gcc-11
x86_64      buildonly-randconfig-003-20241106    gcc-11
x86_64      buildonly-randconfig-004-20241106    gcc-11
x86_64      buildonly-randconfig-005-20241106    gcc-11
x86_64      buildonly-randconfig-006-20241106    gcc-11
x86_64                              defconfig    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241106    gcc-11
x86_64                randconfig-002-20241106    gcc-11
x86_64                randconfig-003-20241106    gcc-11
x86_64                randconfig-004-20241106    gcc-11
x86_64                randconfig-005-20241106    gcc-11
x86_64                randconfig-006-20241106    gcc-11
x86_64                randconfig-011-20241106    gcc-11
x86_64                randconfig-012-20241106    gcc-11
x86_64                randconfig-013-20241106    gcc-11
x86_64                randconfig-014-20241106    gcc-11
x86_64                randconfig-015-20241106    gcc-11
x86_64                randconfig-016-20241106    gcc-11
x86_64                randconfig-071-20241106    gcc-11
x86_64                randconfig-072-20241106    gcc-11
x86_64                randconfig-073-20241106    gcc-11
x86_64                randconfig-074-20241106    gcc-11
x86_64                randconfig-075-20241106    gcc-11
x86_64                randconfig-076-20241106    gcc-11
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                       common_defconfig    clang-20
xtensa                randconfig-001-20241106    gcc-14.2.0
xtensa                randconfig-002-20241106    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

