Return-Path: <linuxppc-dev+bounces-14290-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92467C68955
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 10:38:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9fgH3gF9z2yjm;
	Tue, 18 Nov 2025 20:38:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763458699;
	cv=none; b=miFJRsLNkBf84X4uNDBamqUnZ/BIIvLRUTOSP0PDSbPmHNYRmnBBf+SIm6x+AZ8RD0J4FhSAXfAEvPEarWEwSFMQXEGeljAS8iEgFBj2Vi9AIDVJ3vcz7bvjBECsXK9e/mcRVQrANcItCVQptobGGBN+GdriKV/hhT8gwevCyppOQrjy+KLXQeW2E/CYs+elbGcEhaPnkDmUl6MzVZDDU7n8+y7qgBXI5JwR3SvJlzy5yq0Mbc7agTzmcu7fsdg3rDu1VDOV80HVwGdHOT0M2u8Kxj51r98lafNhcl1EN/Agbk0K+1QrCoI0MPY0B63AZJGkT0jZyooruR105ZTA8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763458699; c=relaxed/relaxed;
	bh=MdcVOO6GlYZcWI6mM2dvVdAvdQA98DeiJnNrj20kPmQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VY4U8vBK2lxgRhO4QYN/WY62DIxOVavgp8nGveye8rWcl+ZuVYGgtSFnMN3aCGGByxye5/VvTEhnEd1U8Ep6gE2alMzjMntXK3Z/haHB48MmOKSO1HqYp+KujCY7HXO2TueIKEL73TLCr0hNJS/GZA5rEC3LYcTJKjwVn73nQa63t3UDUafg7S4Bq6K/XunChL6Bk1MrwsJzlyPuc9Mf5rNyFUG3jEotwaWbKRtTYwgWJ1/tJGCL6FdoyqRl6Lovk4DtuL5o30ie+FWsx7kRPRGXHX5leLHbla2vLmVhC0o2ZgdWQih/65lhNa6PYZpjBoeZOE23dm/eQG2GT1NPkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qvg8bhZn; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qvg8bhZn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9fgB1r0Gz2xnk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 20:38:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763458696; x=1794994696;
  h=date:from:to:cc:subject:message-id;
  bh=a9+0PcEq+BSLmDfLU55EaV1ZBgB5BFTW4mLGsD7op2Y=;
  b=Qvg8bhZnUjarQXeoUFm3S40sdMiJw18fr4z4Iph4XUdGmvrlxw/7qmi4
   qFYiLIZwZnJut9Yxxk6ovKL6c944cO3TxWaWFYuAIuDwrOKrEpnF7IZ6l
   4U3mkFaD7N9iY1oz03xk59GW8RylP14ZI4yvgVjo4Vnt4HwS8GGAh/VWI
   cS9aO2XVtRKH+n5+SfiadAxjZuM+A8u9rJ4+Qw1jIWhAHzVOKk6NCkM2v
   d22KWDfmZBD+eX3aGcMbpkEfeyk15t3ahWOh3gYTIWs7adW88qqITAHkt
   vwJK41go8imADGESo+fNxE4jhHqwvEiCgKHoBUS7xTneBNEZ8rLtXGB13
   w==;
X-CSE-ConnectionGUID: DQgfui6kQpCNffnKwM/URA==
X-CSE-MsgGUID: +nyQTHX9QySvyFo+lKF21g==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65179536"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65179536"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 01:38:09 -0800
X-CSE-ConnectionGUID: QWFSt8GDT36XGtb9KGFjoA==
X-CSE-MsgGUID: WcxPqJgaQlm+yhHRm3444A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="195025565"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Nov 2025 01:38:07 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLIA0-0001YV-2Y;
	Tue, 18 Nov 2025 09:38:04 +0000
Date: Tue, 18 Nov 2025 17:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 834cf7f6551839ef298916bf36df2b4824c4c7bd
Message-ID: <202511181735.TWRVePIl-lkp@intel.com>
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
branch HEAD: 834cf7f6551839ef298916bf36df2b4824c4c7bd  Automatic merge of 'next' into merge (2025-11-17 13:18)

elapsed time: 1502m

configs tested: 112
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251117    gcc-14.3.0
arc                   randconfig-002-20251117    gcc-9.5.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20251117    clang-22
arm                   randconfig-002-20251117    gcc-14.3.0
arm                   randconfig-003-20251117    gcc-12.5.0
arm                   randconfig-004-20251117    gcc-10.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251117    clang-22
arm64                 randconfig-002-20251117    gcc-15.1.0
arm64                 randconfig-003-20251117    gcc-8.5.0
arm64                 randconfig-004-20251117    gcc-9.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251117    gcc-12.5.0
csky                  randconfig-002-20251117    gcc-9.5.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251118    clang-16
hexagon               randconfig-002-20251118    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251118    clang-20
i386        buildonly-randconfig-002-20251118    clang-20
i386        buildonly-randconfig-003-20251118    clang-20
i386        buildonly-randconfig-004-20251118    clang-20
i386        buildonly-randconfig-005-20251118    gcc-13
i386        buildonly-randconfig-006-20251118    clang-20
i386                  randconfig-001-20251118    clang-20
i386                  randconfig-002-20251118    clang-20
i386                  randconfig-003-20251118    gcc-14
i386                  randconfig-004-20251118    gcc-14
i386                  randconfig-005-20251118    clang-20
i386                  randconfig-006-20251118    gcc-14
i386                  randconfig-007-20251118    gcc-14
i386                  randconfig-011-20251118    gcc-14
i386                  randconfig-012-20251118    gcc-12
i386                  randconfig-013-20251118    clang-20
i386                  randconfig-014-20251118    gcc-14
i386                  randconfig-015-20251118    gcc-14
i386                  randconfig-016-20251118    gcc-14
i386                  randconfig-017-20251118    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
microblaze                      mmu_defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                      bmips_stb_defconfig    clang-22
mips                   sb1250_swarm_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                     tqm8560_defconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251117    gcc-12.5.0
riscv                 randconfig-002-20251117    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251117    gcc-14.3.0
s390                  randconfig-002-20251117    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                        apsh4ad0a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                        edosk7760_defconfig    gcc-15.1.0
sh                             espt_defconfig    gcc-15.1.0
sh                    randconfig-001-20251117    gcc-15.1.0
sh                    randconfig-002-20251117    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251118    gcc-8.5.0
sparc                 randconfig-002-20251118    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251118    clang-22
sparc64               randconfig-002-20251118    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251118    clang-22
um                    randconfig-002-20251118    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251118    clang-20
x86_64      buildonly-randconfig-002-20251118    gcc-14
x86_64      buildonly-randconfig-003-20251118    clang-20
x86_64      buildonly-randconfig-004-20251118    clang-20
x86_64      buildonly-randconfig-005-20251118    clang-20
x86_64      buildonly-randconfig-006-20251118    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251118    clang-20
x86_64                randconfig-002-20251118    gcc-12
x86_64                randconfig-003-20251118    gcc-14
x86_64                randconfig-004-20251118    gcc-14
x86_64                randconfig-005-20251118    clang-20
x86_64                randconfig-006-20251118    clang-20
x86_64                randconfig-071-20251118    gcc-13
x86_64                randconfig-072-20251118    clang-20
x86_64                randconfig-073-20251118    gcc-14
x86_64                randconfig-074-20251118    gcc-13
x86_64                randconfig-075-20251118    gcc-14
x86_64                randconfig-076-20251118    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251118    gcc-9.5.0
xtensa                randconfig-002-20251118    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

