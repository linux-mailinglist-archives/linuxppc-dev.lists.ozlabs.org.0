Return-Path: <linuxppc-dev+bounces-11237-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF35B337F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 09:37:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9N1L4Xx1z3cZ2;
	Mon, 25 Aug 2025 17:37:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756107462;
	cv=none; b=Bi+ktEOx1B88q3k4JF4s2lLUOmy3v3wrFW7k1G86mX9PhsRdcMFr7+zr9+8AfoJkG6gVIhuKUtqzRd6OE0K9w/FSqjPzqyvhAL181iXLAgrqg5qoV2+DkcO10id3V5KpI0hfSvh5UyGRbr+gk5EwdxDTbGler41RurOYXmIZ72fO1qfiQjpGyfmewRFi2aXOETvYZZUiy8VcsqdfM279BNobRZoQv/yOZ7ItZp7L9zor4hhV30qKYlWlmO4A2hCfJBmEeqe0hTBF6x3x3zrl5eH2Kp+u/A92OdVSyn4vzDm1mFdFuAzXe3de42MpYqPuQ3KAHtwG9Y4tjAV6v5tAQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756107462; c=relaxed/relaxed;
	bh=PG7TaQDUjKb54j8vroAXsG/FJ8vUaAHNgpEUJnPTLEc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lw99FolUE6P196ezQH2qosHm41F2seb8xBUy6Vw30BFmtL+YutjsOHamxZIAcR1tE1V/jgFYfAp97BxH6GdDaK5utzjqEizbBWGaWRl+MFZwSs7DQQJnuM8qa/1fjy2WaEshTTF/ELTXMqeoyjc/qZJCSVc8L/2IT1ar/lCbrAUFg8YQSKD+tbhY+LdRoJMmJHJ8gX3e0e/8PF+Is9CVtPtOJnDr2bD3cO/CaQCaCkRmhF+q+O7oN29LFKBVihgtBFWO82yduON5LAGgLJvTt6ljZCq+zjgvsmwJVHh96iRqH1lLygTS1owhVOpuUQdQdLYr5YyFUK/YbcM16Z/ePg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PBYnxRP7; dkim-atps=neutral; spf=pass (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PBYnxRP7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9N1J0J50z3cYb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 17:37:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756107460; x=1787643460;
  h=date:from:to:cc:subject:message-id;
  bh=89hHVuquhQhiqGrhDhxLBIworD+UuBNdDcw/y4opkYI=;
  b=PBYnxRP7TqOot8n4g5Ie76FzYxgyg8PNqMdLkRZ5mmi+t3FcoXEMdkba
   301FugU8crSY59kNBOLRmdSjY4Nw1NdyEwQJkmJksjdrsIWQPwE/2z08O
   K8Ze+rJ+7xPjNiOftmsUIc5Bo8RPJutv6RmlAeI8wYz0yMU7mxwpZRbc7
   jAzr9XcZsM2MECG9O5qJPNwkzZV0FdhFgGANlDdtoODcpKrMocxxTY/Tr
   qGX42oA2S4aI7P6W2B+uMwy4HuHjJeoBA4cqzb/lYKUuWjuYWuyvTX5QQ
   MZLbqMNkwRplqx6gq1dgegr0Jb+9gTxhyvMEC6skE0+bqsgTHpSIJxYSV
   A==;
X-CSE-ConnectionGUID: RtI/P2R3RFq5w8a051sgBA==
X-CSE-MsgGUID: rEGGv6JETOibnq+b9yA1jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69416840"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69416840"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 00:37:35 -0700
X-CSE-ConnectionGUID: Vogr8mMeTCCyG5nrX5gDQQ==
X-CSE-MsgGUID: xSRcH7BBQqyxt83nC7BHyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="206395257"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 Aug 2025 00:37:34 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqRlj-000NRv-2u;
	Mon, 25 Aug 2025 07:37:31 +0000
Date: Mon, 25 Aug 2025 15:37:14 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 0bc42b06664d82d3d9c4f5f54a5960b3760c7cd6
Message-ID: <202508251508.jWvvuHzz-lkp@intel.com>
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
branch HEAD: 0bc42b06664d82d3d9c4f5f54a5960b3760c7cd6  Automatic merge of 'fixes' into merge (2025-08-24 18:30)

elapsed time: 1095m

configs tested: 142
configs skipped: 6

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
arc                   randconfig-001-20250824    gcc-15.1.0
arc                   randconfig-002-20250824    gcc-10.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20250824    clang-22
arm                   randconfig-002-20250824    gcc-13.4.0
arm                   randconfig-003-20250824    clang-22
arm                   randconfig-004-20250824    clang-22
arm                        realview_defconfig    clang-16
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250824    gcc-13.4.0
arm64                 randconfig-002-20250824    gcc-11.5.0
arm64                 randconfig-003-20250824    gcc-10.5.0
arm64                 randconfig-004-20250824    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250824    gcc-10.5.0
csky                  randconfig-002-20250824    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250824    clang-22
hexagon               randconfig-002-20250824    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250824    gcc-12
i386        buildonly-randconfig-002-20250824    gcc-12
i386        buildonly-randconfig-003-20250824    gcc-12
i386        buildonly-randconfig-004-20250824    gcc-12
i386        buildonly-randconfig-005-20250824    gcc-12
i386        buildonly-randconfig-006-20250824    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250824    gcc-12.5.0
loongarch             randconfig-002-20250824    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                          multi_defconfig    gcc-15.1.0
m68k                        mvme16x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
mips                         rt305x_defconfig    clang-22
mips                   sb1250_swarm_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250824    gcc-8.5.0
nios2                 randconfig-002-20250824    gcc-9.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250824    gcc-9.5.0
parisc                randconfig-002-20250824    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                      katmai_defconfig    clang-22
powerpc               randconfig-001-20250824    gcc-9.5.0
powerpc               randconfig-002-20250824    clang-22
powerpc               randconfig-003-20250824    gcc-12.5.0
powerpc                     redwood_defconfig    clang-22
powerpc64             randconfig-001-20250824    gcc-8.5.0
powerpc64             randconfig-002-20250824    gcc-13.4.0
powerpc64             randconfig-003-20250824    gcc-12.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250824    gcc-11.5.0
riscv                 randconfig-002-20250824    gcc-9.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250824    clang-16
s390                  randconfig-002-20250824    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                        edosk7760_defconfig    gcc-15.1.0
sh                    randconfig-001-20250824    gcc-15.1.0
sh                    randconfig-002-20250824    gcc-15.1.0
sh                           se7343_defconfig    gcc-15.1.0
sh                           se7705_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250824    gcc-14.3.0
sparc                 randconfig-002-20250824    gcc-8.5.0
sparc                       sparc32_defconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250824    clang-22
sparc64               randconfig-002-20250824    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250824    gcc-12
um                    randconfig-002-20250824    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250824    gcc-12
x86_64      buildonly-randconfig-002-20250824    clang-20
x86_64      buildonly-randconfig-003-20250824    gcc-12
x86_64      buildonly-randconfig-004-20250824    clang-20
x86_64      buildonly-randconfig-005-20250824    gcc-12
x86_64      buildonly-randconfig-006-20250824    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  nommu_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250824    gcc-9.5.0
xtensa                randconfig-002-20250824    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

