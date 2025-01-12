Return-Path: <linuxppc-dev+bounces-5085-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47305A0A70E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jan 2025 04:12:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YW0n63rCfz30dt;
	Sun, 12 Jan 2025 14:12:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736651546;
	cv=none; b=ArTI1+q4i+GRu/VHgGqEUu2S8PWXHoosCUW4/x/P7j9ET6llwFlTbtlChYw5kcKlEenmUonlusb+RtzMWioH0JZgKJ8StYXVgvAMv4C1sVfMgm3FB7yHVLkerj8EUkDHEVi+k13w2OWHq2REsdf/roT+56s4dIEXCUtkXxnx+tCtfUXNICCdeTZf+24utFKK2h8Ywv7Dssin9TJIUVaGZ0lmu4T1ckpG+5NZlbM2sAx8MT+qzQcJqSmw12WxdHkNN228BVDQGVUhlA/wxyFS9fzflS8KOqYpBNLifZC8D+jvLYDh6gnjTHtUZxW6YYGN1Q0a1uzg0uCAkbDoL8gGug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736651546; c=relaxed/relaxed;
	bh=Lt9V5vEOmujq1p1rc1uItZ20jBST1yPcIexE/XYe0a4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JcCWIzhX7c0nrQFq7knScoqP46HJmxJgnc86Dk5fyCBFa8jbVYek8iibO6FGPGmmBA/RqNRLdBg0B6/CTcakZWG/SYJDfbnKUIOPFUPo0iNMG4y9lpm0Bck98Fd62C2bOQKxg56smsJMqGBSSjraha+wIWTdvYxqR97P1t+h7U3oLUoon0bNdQoTPI4+/dM4A6tbYOpX1kSCsrVx+j1z6F6WQRogkDcjrg+rAk5M02iQVFq9Hq/OYxWyuybhwBbX3C+GLCT8jhXuJH0nNCmL2kkqCbG9EiZEqdCvP3NK3eaaBqJ2b0BzD0pltQ5kqNKcNrS2cF36xmnwRTxlPP/cgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VbQf8hYF; dkim-atps=neutral; spf=pass (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VbQf8hYF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YW0n31GSyz30WR
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 14:12:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736651543; x=1768187543;
  h=date:from:to:cc:subject:message-id;
  bh=aeqZjsDSXsQ5FrN0i3afxMqcbOlGZDTXbsZpf9oevuk=;
  b=VbQf8hYFtkGVJHSusBiOxjWin9nAEK889cJdXdTYt+doYRLIL6Rvxp8G
   Lc/FBfO8atnWvcQVFbsz8KUyjoTegJGn029nHKXY4fVT8A/SeNZbV9bZi
   HptV41pBSq43RIHJ564mrWyccIeZ4f/d/8yT4qp3HtYyG3MUB3fYLb9di
   PuCH4eRDI2CPzTzeSOUFdJcrLL+SvMwBKgHdXFJYIZMCrfBeMMYSRboFz
   osaAC593QFRa32biMndsXyk1gU6ijmJ8EP9oSlHRNLr6NARxJF1IGzzIg
   NHlfK3PObd4P3rnx4xm6HAvSDQfR3qAmOUixyVfq3rMQhhrLZ5m95rfCS
   g==;
X-CSE-ConnectionGUID: geFXBbxQScqT4KGqaOMPZA==
X-CSE-MsgGUID: UqpfJ5phSVeU9NBncYBGOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="48324407"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="48324407"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 19:12:15 -0800
X-CSE-ConnectionGUID: /7LkVd8HQkeWCGGvYyUWdw==
X-CSE-MsgGUID: nLK48NhuSxe6FEl9qZpRjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="104663658"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jan 2025 19:12:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWoOa-000LW5-0R;
	Sun, 12 Jan 2025 03:12:12 +0000
Date: Sun, 12 Jan 2025 11:11:16 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next-test] BUILD SUCCESS
 2bf66e66d2e6feece6175ec09ec590a0a8563bdd
Message-ID: <202501121110.1rD3E8AQ-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 2bf66e66d2e6feece6175ec09ec590a0a8563bdd  selftests/powerpc: Fix argument order to timer_sub()

elapsed time: 1310m

configs tested: 223
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.1.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250111    gcc-13.2.0
arc                   randconfig-002-20250111    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-15
arm                   randconfig-001-20250111    clang-16
arm                   randconfig-002-20250111    gcc-14.2.0
arm                   randconfig-003-20250111    clang-20
arm                   randconfig-004-20250111    clang-20
arm                           sama5_defconfig    clang-15
arm                           sunxi_defconfig    gcc-14.1.0
arm                         wpcm450_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250111    gcc-14.2.0
arm64                 randconfig-002-20250111    clang-20
arm64                 randconfig-003-20250111    clang-18
arm64                 randconfig-004-20250111    clang-16
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250111    gcc-14.2.0
csky                  randconfig-001-20250112    gcc-14.2.0
csky                  randconfig-002-20250111    gcc-14.2.0
csky                  randconfig-002-20250112    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250111    clang-20
hexagon               randconfig-001-20250112    gcc-14.2.0
hexagon               randconfig-002-20250111    clang-15
hexagon               randconfig-002-20250112    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250111    gcc-12
i386        buildonly-randconfig-001-20250112    clang-19
i386        buildonly-randconfig-002-20250111    gcc-11
i386        buildonly-randconfig-002-20250112    clang-19
i386        buildonly-randconfig-003-20250111    gcc-12
i386        buildonly-randconfig-003-20250112    clang-19
i386        buildonly-randconfig-004-20250111    gcc-12
i386        buildonly-randconfig-004-20250112    clang-19
i386        buildonly-randconfig-005-20250111    gcc-12
i386        buildonly-randconfig-005-20250112    clang-19
i386        buildonly-randconfig-006-20250111    clang-19
i386        buildonly-randconfig-006-20250112    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20250112    clang-19
i386                  randconfig-002-20250112    clang-19
i386                  randconfig-003-20250112    clang-19
i386                  randconfig-004-20250112    clang-19
i386                  randconfig-005-20250112    clang-19
i386                  randconfig-006-20250112    clang-19
i386                  randconfig-007-20250112    clang-19
i386                  randconfig-011-20250112    gcc-12
i386                  randconfig-012-20250112    gcc-12
i386                  randconfig-013-20250112    gcc-12
i386                  randconfig-014-20250112    gcc-12
i386                  randconfig-015-20250112    gcc-12
i386                  randconfig-016-20250112    gcc-12
i386                  randconfig-017-20250112    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250111    gcc-14.2.0
loongarch             randconfig-001-20250112    gcc-14.2.0
loongarch             randconfig-002-20250111    gcc-14.2.0
loongarch             randconfig-002-20250112    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         apollo_defconfig    clang-15
m68k                       bvme6000_defconfig    clang-15
m68k                                defconfig    gcc-14.2.0
m68k                          hp300_defconfig    clang-15
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          eyeq6_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250111    gcc-14.2.0
nios2                 randconfig-001-20250112    gcc-14.2.0
nios2                 randconfig-002-20250111    gcc-14.2.0
nios2                 randconfig-002-20250112    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250111    gcc-14.2.0
parisc                randconfig-001-20250112    gcc-14.2.0
parisc                randconfig-002-20250111    gcc-14.2.0
parisc                randconfig-002-20250112    gcc-14.2.0
parisc64                         alldefconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                          g5_defconfig    clang-15
powerpc               randconfig-001-20250111    gcc-14.2.0
powerpc               randconfig-001-20250112    gcc-14.2.0
powerpc               randconfig-002-20250111    gcc-14.2.0
powerpc               randconfig-002-20250112    gcc-14.2.0
powerpc               randconfig-003-20250111    gcc-14.2.0
powerpc               randconfig-003-20250112    gcc-14.2.0
powerpc                     sequoia_defconfig    gcc-14.1.0
powerpc                     tqm8560_defconfig    clang-15
powerpc64             randconfig-001-20250111    gcc-14.2.0
powerpc64             randconfig-002-20250111    gcc-14.2.0
powerpc64             randconfig-002-20250112    gcc-14.2.0
powerpc64             randconfig-003-20250112    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250112    clang-20
riscv                 randconfig-001-20250112    gcc-14.2.0
riscv                 randconfig-002-20250112    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250112    clang-16
s390                  randconfig-001-20250112    gcc-14.2.0
s390                  randconfig-002-20250112    clang-18
s390                  randconfig-002-20250112    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250112    gcc-14.2.0
sh                    randconfig-002-20250112    gcc-14.2.0
sh                           se7343_defconfig    gcc-14.1.0
sh                           se7722_defconfig    gcc-14.1.0
sh                           se7750_defconfig    clang-15
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250112    gcc-14.2.0
sparc                 randconfig-002-20250112    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250112    gcc-14.2.0
sparc64               randconfig-002-20250112    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250112    clang-20
um                    randconfig-001-20250112    gcc-14.2.0
um                    randconfig-002-20250112    clang-20
um                    randconfig-002-20250112    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250111    clang-19
x86_64      buildonly-randconfig-001-20250112    gcc-12
x86_64      buildonly-randconfig-002-20250111    gcc-12
x86_64      buildonly-randconfig-002-20250112    gcc-12
x86_64      buildonly-randconfig-003-20250111    gcc-12
x86_64      buildonly-randconfig-003-20250112    gcc-12
x86_64      buildonly-randconfig-004-20250111    clang-19
x86_64      buildonly-randconfig-004-20250112    gcc-12
x86_64      buildonly-randconfig-005-20250111    gcc-12
x86_64      buildonly-randconfig-005-20250112    gcc-12
x86_64      buildonly-randconfig-006-20250111    gcc-12
x86_64      buildonly-randconfig-006-20250112    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250112    gcc-12
x86_64                randconfig-002-20250112    gcc-12
x86_64                randconfig-003-20250112    gcc-12
x86_64                randconfig-004-20250112    gcc-12
x86_64                randconfig-005-20250112    gcc-12
x86_64                randconfig-006-20250112    gcc-12
x86_64                randconfig-007-20250112    gcc-12
x86_64                randconfig-008-20250112    gcc-12
x86_64                randconfig-071-20250112    gcc-12
x86_64                randconfig-072-20250112    gcc-12
x86_64                randconfig-073-20250112    gcc-12
x86_64                randconfig-074-20250112    gcc-12
x86_64                randconfig-075-20250112    gcc-12
x86_64                randconfig-076-20250112    gcc-12
x86_64                randconfig-077-20250112    gcc-12
x86_64                randconfig-078-20250112    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250112    gcc-14.2.0
xtensa                randconfig-002-20250112    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

