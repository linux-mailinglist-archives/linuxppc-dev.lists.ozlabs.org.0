Return-Path: <linuxppc-dev+bounces-7132-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BF5A65070
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 14:14:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGb6f5wffz2ypV;
	Tue, 18 Mar 2025 00:14:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742217290;
	cv=none; b=nTTGTv9ra5r1W2Ux43803092scedNcjEP63IlIinXv6aDNOPjSTbs+e/aiF7V72sDnaS60Cl+XYLu4hYG0MY6H9oKRwOKa0WQamJE2Qa4IXJN+0trv2eRnsX4sg9jfMneyc6mxkaU7j+q/NPQoMvywJ5oarH1DDVmmV+7qG4mu4hOqA3oi2iZvTicn38uXURpu1E41visVMsFx/LPTfaGQkh7cZ6OWzaEWJEuhyuWTTGFUgigwyj66Yx4/sVxOtie5WMzKa/Z/HWfsRiwKJhbPSSqkxsUOkGJvfrr5WSya2j0j7ogf6bt3ozkxsSp2vwXByLXmGy8YPtzlxCECcqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742217290; c=relaxed/relaxed;
	bh=tNQVmsereolBeARuC5fbcOtEF1YvJbpGeA1yK5WPl0k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WGdO626w+lZEfEUZ9MzEJtV9EkvgoccbiBdBhc7tbgHzSQfBXtsilS1qhWZpUBEcfEXAoGvx6nmxvuoNi2LK+5fTLjZQ2gHElmgqkjV9kAxEw/ypTZtQ33jyi762kFCw5WlYuu/ZC4nvhCleLhEfTafc7NZBG+rW4D+rQXWBJvRf6UIJeAxLSC6cih+DS0jYqJtGiJ1b77hSOuMpNF3gUKAMG02z3QTM//RDCGLTU2cVepr5h/C2jBxmAbuwIMH8p/60fsTlzSU/vOyrctv4088/mS/Ip0vKi6FpuzwiVSR1YaUWwzlUdwk6+p4LrGgGtr1msPF2ry4vtngy9BflBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JJY5ixSE; dkim-atps=neutral; spf=pass (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JJY5ixSE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGb6c1bMMz2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 00:14:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742217288; x=1773753288;
  h=date:from:to:cc:subject:message-id;
  bh=937Ee/0be7g9smL2fP6HA6s07wJD0OMKRbCZoGmZhWs=;
  b=JJY5ixSEWHVwDiMwxoRj/1XxQtBmd6ckmxhNxazXLeXZYrvgkjMQEKHB
   y7RrLSWbMYHHnqOriUKJpFvoG0AqkivEC2ucakHoz+9+Pq4OIkfOcNhC2
   n/ijlPScuRkT/M3avdqExuQBjzEZ+V7VX+YAUbP1ORpOWhEFTkIgK7Ilm
   mRGPy8NKXs3ErAvhOHIcujOKo1gsz1E9gBm9XMwZGWgtCSJp2uc5ZSMh0
   LVj8xg4mTLrcVLx+pgWQdEUOvA1pe8W1PErtugkFYDqBm+R4apBxiNO9T
   jC4Dj2N2F18AvRxB1HMkei6+/44eFbDa3CzOM8DnWntTrqQ/p2lcNHdPC
   A==;
X-CSE-ConnectionGUID: zZ0CKA8hRmCj3DHI3ccMUg==
X-CSE-MsgGUID: 059hkKQYS0qZ5n6rVaI60w==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43335798"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="43335798"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 06:14:43 -0700
X-CSE-ConnectionGUID: c/fTeJjCR3mRsX/Gj/EvSQ==
X-CSE-MsgGUID: uI9S5w4tTyC28jonyhHBNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="121663304"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 17 Mar 2025 06:14:43 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuAIi-000ClX-0k;
	Mon, 17 Mar 2025 13:14:40 +0000
Date: Mon, 17 Mar 2025 21:13:52 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:topic/cxl] BUILD SUCCESS
 5a0fcb0ef5584caf7da3f31896e08650c532e4c1
Message-ID: <202503172143.hOQnN5cF-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/cxl
branch HEAD: 5a0fcb0ef5584caf7da3f31896e08650c532e4c1  cxl: Remove driver

elapsed time: 1448m

configs tested: 134
configs skipped: 2

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
arc                   randconfig-001-20250316    gcc-13.2.0
arc                   randconfig-002-20250316    gcc-13.2.0
arm                              alldefconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          pxa168_defconfig    clang-19
arm                   randconfig-001-20250316    clang-21
arm                   randconfig-002-20250316    gcc-14.2.0
arm                   randconfig-003-20250316    gcc-14.2.0
arm                   randconfig-004-20250316    clang-17
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250316    clang-21
arm64                 randconfig-002-20250316    clang-21
arm64                 randconfig-003-20250316    clang-20
arm64                 randconfig-004-20250316    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250316    gcc-14.2.0
csky                  randconfig-002-20250316    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250316    clang-17
hexagon               randconfig-002-20250316    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250316    clang-20
i386        buildonly-randconfig-002-20250316    clang-20
i386        buildonly-randconfig-003-20250316    gcc-12
i386        buildonly-randconfig-004-20250316    clang-20
i386        buildonly-randconfig-005-20250316    clang-20
i386        buildonly-randconfig-006-20250316    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250316    gcc-14.2.0
loongarch             randconfig-002-20250316    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                         db1xxx_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250316    gcc-14.2.0
nios2                 randconfig-002-20250316    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250316    gcc-14.2.0
parisc                randconfig-002-20250316    gcc-14.2.0
powerpc                     akebono_defconfig    clang-21
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                    gamecube_defconfig    clang-21
powerpc               randconfig-001-20250316    gcc-14.2.0
powerpc               randconfig-002-20250316    gcc-14.2.0
powerpc               randconfig-003-20250316    clang-21
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc                     tqm8541_defconfig    clang-21
powerpc64             randconfig-001-20250316    clang-16
powerpc64             randconfig-002-20250316    clang-21
powerpc64             randconfig-003-20250316    clang-19
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250316    clang-21
riscv                 randconfig-002-20250316    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250316    gcc-14.2.0
s390                  randconfig-002-20250316    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                    randconfig-001-20250316    gcc-14.2.0
sh                    randconfig-002-20250316    gcc-14.2.0
sh                           se7206_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250316    gcc-14.2.0
sparc                 randconfig-002-20250316    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250316    gcc-14.2.0
sparc64               randconfig-002-20250316    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250316    clang-21
um                    randconfig-002-20250316    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250316    gcc-12
x86_64      buildonly-randconfig-002-20250316    gcc-12
x86_64      buildonly-randconfig-003-20250316    clang-20
x86_64      buildonly-randconfig-004-20250316    clang-20
x86_64      buildonly-randconfig-005-20250316    gcc-12
x86_64      buildonly-randconfig-006-20250316    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250316    gcc-14.2.0
xtensa                randconfig-002-20250316    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

