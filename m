Return-Path: <linuxppc-dev+bounces-6108-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AE9A318BB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 23:38:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsxDf5q7nz2ygZ;
	Wed, 12 Feb 2025 09:38:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739313506;
	cv=none; b=KBljDbqwd5fZkntFAcBJfq0INLgwmUu4B++P8mf7G3zMzG8WnikFF87C/sWTPPH9azZNhHYlSfVqd74i0KZbvFiID28fJr6LlPYV9YNowqeb29TJdKa3EBlORuMz+X3C6H17poFLXgAyIYjDOsCn6ILXNnTTUdb1IEGtxoLkr3xJI0bTdkE6AnBNHb/M2vSnj7nAHbWjXk7kR6hUUg7v/k9TXtnzzUNRIJFrDKpZ/F3yjPK7f/lPfjMUoiolW58UotwmfwhMgK05E+pI40unRTWRY/Si+L8cvoS/3R5TUwZBD+lOApR504nDHdB13j/yxz7cynj5N7pnUhRc29ztdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739313506; c=relaxed/relaxed;
	bh=C+AKM5xqhKfi+RjVm7xQ79FErWdsayTSOoTs4b2lwB8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cYW2kcTXOO07ppRzcp7mEqBzRMwd5AytwxYJRlCvgAtQxDZaoF6nZZEA5TiASynvCZsW7AMCouMIkNzq1XL/HyusitBVOcz5MezP27K1tKZBtqwsgX5AJB5hjydPf5vg0kw2cO4kuhVBJhZ7ZuYszZ3aoZGh+Z/g+sxkL5GJeE/O0kxg2kQoLVwesq7fB0X7PtuFrbipf3w4sdUYGagII0k8RdBlGYoj1aoZHic5nvb3LSuFRVIhaKdcpraun5PWqtOEMGxchMme7vdSUM5YGAuJipNmBcNfTjUmfNWLP30N93t5nak9zDI7ypYcs8ygXWUsbgf7KXKGcvYWJRysXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EpBCJGKL; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EpBCJGKL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsxDc3Ldpz2ygN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 09:38:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739313504; x=1770849504;
  h=date:from:to:cc:subject:message-id;
  bh=AuDlzWpFMODFVMz4g0TpHcUOqYpQY1+8MIKlzrVsFA8=;
  b=EpBCJGKLewyqbJlznRujzMTo9Lo4+esZV9DkphXUfF5H85UeO5gDPF2A
   pPS8DUEn3+91eGpJdOiHGCwvVMaHna5Ldyv+phKZm3UJE3DzIOdv9j1zv
   FCxFmb+jTpIUSDE7fRF6CqNCTD40OTpS7ycntdtDr8UI12UZUYoWljtgm
   qdx+oDF2JkRl5krt7Tik+unxUiT/6rWWIG+8a9AKtc+EmVSh/zXaLJRdr
   6r5w9Qf5Fda2569LBzpmLizzROuGestA54g6MpvSWmMNLqptDqpp9t94M
   EpY2oWViNRamJzkiSpTjlJg+Oo+JLc0iyfN9p4dTcTiWNll/j44FlePTw
   w==;
X-CSE-ConnectionGUID: 8GQA8cl9RFu1u/rRbDCOdw==
X-CSE-MsgGUID: hSjfj9QKTaGUwWJNarzHGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39650214"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="39650214"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 14:38:16 -0800
X-CSE-ConnectionGUID: RA3pTtESQRea5tepieCDGA==
X-CSE-MsgGUID: C6tn/zdWR0qMumIuCi6g4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117264145"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Feb 2025 14:38:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thytP-0014mn-2u;
	Tue, 11 Feb 2025 22:38:11 +0000
Date: Wed, 12 Feb 2025 06:37:58 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 21b6db21f1fb239416c69d97412d63882f6e3a6e
Message-ID: <202502120644.deAxi5vK-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 21b6db21f1fb239416c69d97412d63882f6e3a6e  Automatic merge of 'master' into merge (2025-02-11 10:55)

elapsed time: 1020m

configs tested: 198
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250211    gcc-13.2.0
arc                   randconfig-002-20250211    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                         lpc32xx_defconfig    clang-21
arm                          pxa910_defconfig    clang-21
arm                   randconfig-001-20250211    gcc-14.2.0
arm                   randconfig-002-20250211    clang-21
arm                   randconfig-003-20250211    gcc-14.2.0
arm                   randconfig-004-20250211    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250211    clang-17
arm64                 randconfig-002-20250211    clang-19
arm64                 randconfig-003-20250211    gcc-14.2.0
arm64                 randconfig-004-20250211    clang-19
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250211    gcc-14.2.0
csky                  randconfig-001-20250212    clang-21
csky                  randconfig-002-20250211    gcc-14.2.0
csky                  randconfig-002-20250212    clang-21
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250212    clang-21
hexagon               randconfig-002-20250211    clang-21
hexagon               randconfig-002-20250212    clang-21
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250211    gcc-12
i386        buildonly-randconfig-001-20250212    gcc-12
i386        buildonly-randconfig-002-20250211    gcc-12
i386        buildonly-randconfig-002-20250212    gcc-12
i386        buildonly-randconfig-003-20250211    gcc-12
i386        buildonly-randconfig-003-20250212    gcc-12
i386        buildonly-randconfig-004-20250211    gcc-12
i386        buildonly-randconfig-004-20250212    gcc-12
i386        buildonly-randconfig-005-20250211    gcc-12
i386        buildonly-randconfig-005-20250212    gcc-12
i386        buildonly-randconfig-006-20250211    clang-19
i386        buildonly-randconfig-006-20250212    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250212    gcc-12
i386                  randconfig-002-20250212    gcc-12
i386                  randconfig-003-20250212    gcc-12
i386                  randconfig-004-20250212    gcc-12
i386                  randconfig-005-20250212    gcc-12
i386                  randconfig-006-20250212    gcc-12
i386                  randconfig-007-20250212    gcc-12
i386                  randconfig-011-20250212    gcc-12
i386                  randconfig-012-20250212    gcc-12
i386                  randconfig-013-20250212    gcc-12
i386                  randconfig-014-20250212    gcc-12
i386                  randconfig-015-20250212    gcc-12
i386                  randconfig-016-20250212    gcc-12
i386                  randconfig-017-20250212    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250212    clang-21
loongarch             randconfig-002-20250212    clang-21
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         db1xxx_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250212    clang-21
nios2                 randconfig-002-20250212    clang-21
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250212    clang-21
parisc                randconfig-002-20250212    clang-21
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      cm5200_defconfig    clang-21
powerpc               mpc834x_itxgp_defconfig    clang-21
powerpc                      pcm030_defconfig    clang-21
powerpc               randconfig-001-20250212    clang-21
powerpc               randconfig-002-20250212    clang-21
powerpc               randconfig-003-20250212    clang-21
powerpc                        warp_defconfig    clang-21
powerpc64             randconfig-001-20250212    clang-21
powerpc64             randconfig-002-20250212    clang-21
powerpc64             randconfig-003-20250212    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250211    gcc-14.2.0
riscv                 randconfig-001-20250212    gcc-12
riscv                 randconfig-002-20250211    clang-19
riscv                 randconfig-002-20250212    gcc-12
s390                             alldefconfig    clang-21
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250211    clang-21
s390                  randconfig-001-20250212    gcc-12
s390                  randconfig-002-20250211    gcc-14.2.0
s390                  randconfig-002-20250212    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250211    gcc-14.2.0
sh                    randconfig-001-20250212    gcc-12
sh                    randconfig-002-20250211    gcc-14.2.0
sh                    randconfig-002-20250212    gcc-12
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250211    gcc-14.2.0
sparc                 randconfig-001-20250212    gcc-12
sparc                 randconfig-002-20250211    gcc-14.2.0
sparc                 randconfig-002-20250212    gcc-12
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250211    gcc-14.2.0
sparc64               randconfig-001-20250212    gcc-12
sparc64               randconfig-002-20250211    gcc-14.2.0
sparc64               randconfig-002-20250212    gcc-12
um                               allmodconfig    clang-21
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250211    clang-17
um                    randconfig-001-20250212    gcc-12
um                    randconfig-002-20250211    clang-15
um                    randconfig-002-20250212    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250211    clang-19
x86_64      buildonly-randconfig-001-20250212    clang-19
x86_64      buildonly-randconfig-002-20250211    gcc-12
x86_64      buildonly-randconfig-002-20250212    clang-19
x86_64      buildonly-randconfig-003-20250211    clang-19
x86_64      buildonly-randconfig-003-20250212    clang-19
x86_64      buildonly-randconfig-004-20250211    gcc-11
x86_64      buildonly-randconfig-004-20250212    clang-19
x86_64      buildonly-randconfig-005-20250211    clang-19
x86_64      buildonly-randconfig-005-20250212    clang-19
x86_64      buildonly-randconfig-006-20250211    gcc-12
x86_64      buildonly-randconfig-006-20250212    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                randconfig-001-20250212    clang-19
x86_64                randconfig-002-20250212    clang-19
x86_64                randconfig-003-20250212    clang-19
x86_64                randconfig-004-20250212    clang-19
x86_64                randconfig-005-20250212    clang-19
x86_64                randconfig-006-20250212    clang-19
x86_64                randconfig-007-20250212    clang-19
x86_64                randconfig-008-20250212    clang-19
x86_64                randconfig-071-20250212    clang-19
x86_64                randconfig-072-20250212    clang-19
x86_64                randconfig-073-20250212    clang-19
x86_64                randconfig-074-20250212    clang-19
x86_64                randconfig-075-20250212    clang-19
x86_64                randconfig-076-20250212    clang-19
x86_64                randconfig-077-20250212    clang-19
x86_64                randconfig-078-20250212    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250211    gcc-14.2.0
xtensa                randconfig-001-20250212    gcc-12
xtensa                randconfig-002-20250211    gcc-14.2.0
xtensa                randconfig-002-20250212    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

