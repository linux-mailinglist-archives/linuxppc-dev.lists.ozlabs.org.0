Return-Path: <linuxppc-dev+bounces-10375-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3A5B0EF78
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jul 2025 12:12:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bn90y2CcVz3bby;
	Wed, 23 Jul 2025 20:12:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753265538;
	cv=none; b=GYucCdNbyyNgmTVv9eA3qPJ9lCyiVc6knrzoMnMYCdybR2S0jPh5joE/8kqQPjKn4NLInzEnxGakig3ZRZ8E8l3oa43kqILKlz4fgYFZzUypMbGWLMRU4eaQ4ouVn9NJR+NDBhum81F6hyVpu3a6OuL0O5SDa17ciqpYLXbS65QvDgkexXuKzvvYhcO5slILPf9pNFTgo/mtmj8NQ527/BEjqiO4l7bT95yT6rNa232+oZCyHH4e9wBjEh22jUtnmUN2kIb7xYPpWOaHX8x5/hEyPKQi/8nVRdawdse4flASikhPaqMmyp+AG+1sxHICnxs8roAJPfWHPpcHo5vucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753265538; c=relaxed/relaxed;
	bh=djTXMRDMtn64vNqnGUGrfjOUwFA+IT5W5C4gp/soWHE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aTxCtuUHGg5JvJ86gFuasReXlyeAb2b7MhGtXuy3RVdEvbEimpAU6zizXkCLBVwjd7lPOAVzTXeZ75UzsHbaExCizqf/GJ8YfA23J8CdsuscMyyUqyCyM2RAOFDZEZYuVLG2MD0+h8IjQxO3QtVsVcPWktYDvvJtoLIrnI+n7EA5Mdqq9H86dIwZHAOTl0pD7XLr37hX+m8dpB60EslEcyLS3YkvlfErlR+g8a7pWq7hWoT0hM6ucpVHD2Sl+vttDkskJAMLblDF2UsJszfF+7Lvg4dtuearUeWplRr40FWVAqBdlLR3hLQVEccMBkkTahonziitiUlPORWRj/s9hA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c8Yx0KPH; dkim-atps=neutral; spf=pass (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c8Yx0KPH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bn90w52DGz2xrb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 20:12:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753265537; x=1784801537;
  h=date:from:to:cc:subject:message-id;
  bh=RvKgQniBcA2D03LBAbd0QYo7FeqMgoOTob/nfyqcRDc=;
  b=c8Yx0KPHELfB/05/5Fnpkxgnp03AnwaF1b7DQXVZRdFaevVR1m7paZR2
   Ao8KDNvIuZ1GUi0tvfHqqtOB7iZEXOQ9kQWlq6LRf3A0Qz6vmN96H1NF9
   LTFoivp3ik6oeZpx1EZ0qKNlo54pIl18+GpjtZam8wXxdzGl9qkc2O2hO
   FDBjNC2P3htrtaAvl364bDPzTd5fWwGqj2GmR3yVh/5dastZEQ0XBBuQr
   heCZJNAVsDmrFNiyujjbKy26ptcUWaifGjm7K/KEyhKTDP/cD//8TKRkk
   cyna508L1cqC5+3i46KUw/5Sc+WqPqKJzqhNPt0tmIaRoxJSY7OATLjU5
   g==;
X-CSE-ConnectionGUID: wgZKk7skQuyFIlkrq3F8/g==
X-CSE-MsgGUID: a6B3C1Q/QjqWIp/8N1zMyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="65803208"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="65803208"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 03:12:14 -0700
X-CSE-ConnectionGUID: 5V6z8YZJSouG3hEHRvYxpw==
X-CSE-MsgGUID: e+K3xuxMSUql1I8Hczlmvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="159455948"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jul 2025 03:12:12 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueWSI-000JE3-0A;
	Wed, 23 Jul 2025 10:12:10 +0000
Date: Wed, 23 Jul 2025 18:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next] BUILD SUCCESS
 da30705c4621fc82d68483f114f5a395a5f472d2
Message-ID: <202507231836.fDOibx3H-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: da30705c4621fc82d68483f114f5a395a5f472d2  arch/powerpc: Remove .interp section in vmlinux

elapsed time: 1454m

configs tested: 162
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250722    gcc-10.5.0
arc                   randconfig-002-20250722    gcc-11.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                          gemini_defconfig    clang-20
arm                         lpc18xx_defconfig    clang-22
arm                   randconfig-001-20250722    gcc-12.5.0
arm                   randconfig-002-20250722    clang-22
arm                   randconfig-003-20250722    gcc-8.5.0
arm                   randconfig-004-20250722    clang-17
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250722    clang-22
arm64                 randconfig-002-20250722    clang-22
arm64                 randconfig-003-20250722    clang-22
arm64                 randconfig-004-20250722    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250722    gcc-11.5.0
csky                  randconfig-001-20250723    gcc-12.5.0
csky                  randconfig-002-20250722    gcc-15.1.0
csky                  randconfig-002-20250723    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250722    clang-20
hexagon               randconfig-001-20250723    clang-22
hexagon               randconfig-002-20250722    clang-18
hexagon               randconfig-002-20250723    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250722    gcc-12
i386        buildonly-randconfig-001-20250723    clang-20
i386        buildonly-randconfig-002-20250722    gcc-12
i386        buildonly-randconfig-002-20250723    clang-20
i386        buildonly-randconfig-003-20250722    clang-20
i386        buildonly-randconfig-003-20250723    clang-20
i386        buildonly-randconfig-004-20250722    gcc-12
i386        buildonly-randconfig-004-20250723    clang-20
i386        buildonly-randconfig-005-20250722    clang-20
i386        buildonly-randconfig-005-20250723    gcc-11
i386        buildonly-randconfig-006-20250722    clang-20
i386        buildonly-randconfig-006-20250723    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250722    gcc-15.1.0
loongarch             randconfig-001-20250723    gcc-15.1.0
loongarch             randconfig-002-20250722    clang-22
loongarch             randconfig-002-20250723    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        mvme16x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath79_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250722    gcc-11.5.0
nios2                 randconfig-001-20250723    gcc-8.5.0
nios2                 randconfig-002-20250722    gcc-8.5.0
nios2                 randconfig-002-20250723    gcc-11.5.0
openrisc                         alldefconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250722    gcc-8.5.0
parisc                randconfig-002-20250722    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                      katmai_defconfig    clang-22
powerpc               randconfig-001-20250722    gcc-13.4.0
powerpc               randconfig-002-20250722    clang-22
powerpc               randconfig-003-20250722    gcc-14.3.0
powerpc                     tqm8560_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250722    gcc-8.5.0
powerpc64             randconfig-002-20250722    clang-22
powerpc64             randconfig-003-20250722    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250722    clang-16
riscv                 randconfig-001-20250723    gcc-9.5.0
riscv                 randconfig-002-20250722    gcc-12.5.0
riscv                 randconfig-002-20250723    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250722    clang-22
s390                  randconfig-001-20250723    clang-22
s390                  randconfig-002-20250722    gcc-12.5.0
s390                  randconfig-002-20250723    clang-20
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250722    gcc-15.1.0
sh                    randconfig-001-20250723    gcc-12.5.0
sh                    randconfig-002-20250722    gcc-15.1.0
sh                    randconfig-002-20250723    gcc-9.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250722    gcc-13.4.0
sparc                 randconfig-001-20250723    gcc-8.5.0
sparc                 randconfig-002-20250722    gcc-15.1.0
sparc                 randconfig-002-20250723    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250722    gcc-8.5.0
sparc64               randconfig-001-20250723    gcc-12.5.0
sparc64               randconfig-002-20250722    gcc-8.5.0
sparc64               randconfig-002-20250723    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250722    gcc-12
um                    randconfig-001-20250723    gcc-12
um                    randconfig-002-20250722    gcc-12
um                    randconfig-002-20250723    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250722    gcc-12
x86_64      buildonly-randconfig-001-20250723    gcc-12
x86_64      buildonly-randconfig-002-20250722    gcc-12
x86_64      buildonly-randconfig-002-20250723    gcc-11
x86_64      buildonly-randconfig-003-20250722    gcc-12
x86_64      buildonly-randconfig-003-20250723    gcc-11
x86_64      buildonly-randconfig-004-20250722    clang-20
x86_64      buildonly-randconfig-004-20250723    clang-20
x86_64      buildonly-randconfig-005-20250722    gcc-12
x86_64      buildonly-randconfig-005-20250723    gcc-12
x86_64      buildonly-randconfig-006-20250722    gcc-12
x86_64      buildonly-randconfig-006-20250723    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250722    gcc-15.1.0
xtensa                randconfig-001-20250723    gcc-13.4.0
xtensa                randconfig-002-20250722    gcc-10.5.0
xtensa                randconfig-002-20250723    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

