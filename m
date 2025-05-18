Return-Path: <linuxppc-dev+bounces-8654-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACD8ABB11B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 May 2025 19:38:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0p1j36grz2xlQ;
	Mon, 19 May 2025 03:38:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747589881;
	cv=none; b=CF5LKNRlVHMCStT8RumEd//LI0+IN0qP/yfiBputMRyJZaYpYo0opxb25iMgH0ut6VPG4y0kArQM2sdAUoauZegaO90jEs5+LtuD7IUvjUfyuR/r+GZ41wvaLaA+UKD1wNQAVP6S4R7E6qe+TkXG64rL27WpJ2XSMnSXIgyIWePuX+W9MCTevVEFxtPWazpvA3CYkEWEahW9Eo5kxE2idwrSFVt9FyG2EIpd6GOncV+a2RweEA/Ujpl1Lw309PhkyJTxcjYnL1E0uoSNea+NIsqb4qeFH50XWEDjYmUUp2d3tBnJn80i+Phw+fzL1iD8eIzayHrqd8Um57McWohBNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747589881; c=relaxed/relaxed;
	bh=hn/V+G4ICnE5mR4JDEv0Eu88Z02PrK2ak1nTmDOy6+s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iV4xBHaxK4WhiXsys2GVsgASIbp8AH8U+BOly5mNaencddXEPPO+SYpcd0zfw3i52MAQxu0RSAx20tHBR5bFxMOc/iW8/doX4e+DC28U+tD1QK5/NW/H7erIcpFtlDqy8Ar9yoKEA6O290AqADpWcDEbGNuEeRWzpxxEOs6f0LdEs4/vN5mtZw9XXjk85sPxvjsjO1tfdy9K6SsAZF/WJldTC035zIDJhf5StAjszAref1SRtgZYJRTC0VC/7g7UBTNlMZ4n1mcNqD1zJaocxnD3eC/G4XM977QOa2Ug5jzIzve9wNIKvJXH3U5dVr4tWkjQYkGA/9qlwMm3ANGBFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PoqPj7ee; dkim-atps=neutral; spf=pass (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PoqPj7ee;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b0p1f6DPyz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 May 2025 03:37:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747589879; x=1779125879;
  h=date:from:to:cc:subject:message-id;
  bh=aTSKka/XUy6l4dTlUZ1NXpFunaFmUY+/SkdsqUtgG3U=;
  b=PoqPj7ee9Xi+rapRSQ/lS3ng2Iua/0aIXpYlSHajApHte8Q4wvnwn9uK
   CWneG+MqUP0C7OBZZd6SdKg/A9LfZn01UVvZDP7BmigUqSs8J+RCyjPgj
   U6c0y/40t4i8l5DN4qam/KaOM6nmpXz1dXNdJ/8Ex4EXhcwLP+l4ybcsi
   DJkkRXCYtNGZ4reemjoQ+/brJaIiHjaPuHRb1FBr7p3uW/v5EAxw1Qgij
   Jztwq3nltKcntNdcS6ZVawFgdHnyQbKXqvDlqxwiD840qM86t0jv/qCwV
   6qnl82IxUIPvEyT9oxHRtMaGMCa4eVRCQskHBCInjpnps0md+nHcMzUiP
   Q==;
X-CSE-ConnectionGUID: jFNY5EliT8WHPqMwk3G5QA==
X-CSE-MsgGUID: S83zjI7+TIeP8rzYiJoUfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="48742741"
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="48742741"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 10:37:53 -0700
X-CSE-ConnectionGUID: Ly9w7LVtRR6x/ZR+h2aCVg==
X-CSE-MsgGUID: U/t9iqDNSmGAdTcqC/kqcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="139681113"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 May 2025 10:37:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGhxN-000KwO-1V;
	Sun, 18 May 2025 17:37:49 +0000
Date: Mon, 19 May 2025 01:37:14 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 a9d887695c86d44fd23f612549cb8dc78a3a0f22
Message-ID: <202505190104.7Y7im4no-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
branch HEAD: a9d887695c86d44fd23f612549cb8dc78a3a0f22  Automatic merge of 'next' into merge (2025-05-18 09:08)

elapsed time: 766m

configs tested: 145
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250518    gcc-14.2.0
arc                   randconfig-002-20250518    gcc-11.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                                 defconfig    clang-21
arm                   randconfig-001-20250518    gcc-10.5.0
arm                   randconfig-002-20250518    clang-21
arm                   randconfig-003-20250518    gcc-7.5.0
arm                   randconfig-004-20250518    clang-16
arm                           stm32_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250518    gcc-7.5.0
arm64                 randconfig-002-20250518    clang-21
arm64                 randconfig-003-20250518    clang-21
arm64                 randconfig-004-20250518    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250518    gcc-14.2.0
csky                  randconfig-002-20250518    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250518    clang-21
hexagon               randconfig-002-20250518    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250518    gcc-12
i386        buildonly-randconfig-002-20250518    clang-20
i386        buildonly-randconfig-003-20250518    gcc-12
i386        buildonly-randconfig-004-20250518    gcc-12
i386        buildonly-randconfig-005-20250518    gcc-12
i386        buildonly-randconfig-006-20250518    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250518    gcc-13.3.0
loongarch             randconfig-002-20250518    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       alldefconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      maltaaprp_defconfig    clang-21
mips                        omega2p_defconfig    clang-21
mips                           xway_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250518    gcc-5.5.0
nios2                 randconfig-002-20250518    gcc-13.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250518    gcc-8.5.0
parisc                randconfig-002-20250518    gcc-8.5.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                    amigaone_defconfig    gcc-14.2.0
powerpc                  mpc885_ads_defconfig    clang-21
powerpc                      pmac32_defconfig    clang-21
powerpc               randconfig-001-20250518    gcc-7.5.0
powerpc               randconfig-002-20250518    gcc-5.5.0
powerpc               randconfig-003-20250518    clang-21
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc64                        alldefconfig    clang-21
powerpc64             randconfig-001-20250518    gcc-10.5.0
powerpc64             randconfig-002-20250518    gcc-7.5.0
powerpc64             randconfig-003-20250518    gcc-7.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250518    clang-21
riscv                 randconfig-002-20250518    clang-20
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250518    gcc-7.5.0
s390                  randconfig-002-20250518    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250518    gcc-13.3.0
sh                    randconfig-002-20250518    gcc-7.5.0
sh                           se7721_defconfig    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250518    gcc-12.4.0
sparc                 randconfig-002-20250518    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250518    gcc-6.5.0
sparc64               randconfig-002-20250518    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250518    clang-19
um                    randconfig-002-20250518    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250518    gcc-12
x86_64      buildonly-randconfig-002-20250518    clang-20
x86_64      buildonly-randconfig-003-20250518    gcc-12
x86_64      buildonly-randconfig-004-20250518    gcc-12
x86_64      buildonly-randconfig-005-20250518    gcc-12
x86_64      buildonly-randconfig-006-20250518    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250518    gcc-12.4.0
xtensa                randconfig-002-20250518    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

