Return-Path: <linuxppc-dev+bounces-12262-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03519B58C22
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 05:05:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQmwd6Stmz301G;
	Tue, 16 Sep 2025 13:05:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757991905;
	cv=none; b=WNHq64o2vApkJPAN6cYnO+dtrHui03mnK2ESluUOvEKL31ZhHKFYN696JsBRCQY7lVhQH7qZbqEDJvNHTP1elG/yqOiLDyPOl6K9A8/yqHI0IAybKFL4BPGaqiPAPzkagKBN5z7BOIP1eEziUdFfPdJMWTZGr7mydzqmsXbvEWyqi7TwJTMCun9bkvNr9cF5hK71pXCbrwsxShDqn1hmED8nsaZgkbUeLW051eQULIptat3eommX1K24PYBcVA7Czl8Q5jQ9oiACC22bZ8Z/uY+s9E956IDrZLLUiTFrH5Rtm+sUXx/MzxFNfCao4p6X5cXvo+GeUNFcowMNS3Ms4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757991905; c=relaxed/relaxed;
	bh=jkPC2MnhGahNqojqXV20BrWIly9WLsr5G0t3nfQON5c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YpTUIyfSOlnSt1wTyPEWPFuUW/2ymSNOks0tpRvOQndeCC/HINOQ1KPKPnYnI7tp3cDZ7v7cqnvcb7enxolCa/ovJWYgLBopx5xY8x2jYDafpvp0sv5eSsLosMWQCHZ9H8v3quMEICeoksBhD+rz2+KtEnfXh45elrP28JWKdPRj/qRyPY0RKslOy+DYNaV6YY5YmR228tZap40iFXT+H/IpF3SlpdkWXjM/iLd6kfiRLv0hcRoWzGvd5ltBtT2lmtVuwGCV+KrhgVlYNq9bhLUEnyiwyilecPNFQGRxXdX3Vm4Q+NnLUNrCYhJOUnWDE9vSR2XzdnWkdydv1x95qA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jYK8yxtx; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jYK8yxtx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQmwb2SbGz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 13:05:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757991904; x=1789527904;
  h=date:from:to:cc:subject:message-id;
  bh=q6mkck6CKA3Nbg/iyggRiOliMtBP2ES8lfRDIhzUbic=;
  b=jYK8yxtxtA+vJbC2/amLw+2qCE3Uf/v6+P0MEoXPKS3Vd/9gFpQmqXa/
   fH1MiMK7Cxx49Yu13Rmq3tLPsLTU7SjDS5xIjgwNRPP6qCiH2D4SdT5IF
   OzEhagiUznS1uyf3j3OQpsjVL3lAQJ7SR9t2m8nE8P3AczvdwXruwCUdp
   ismwtW/SHPPweqHTDzH3g3ZorfKEAux/Ex/a8s31CfMdb3sIdp1QXuXZL
   OIyVojjupHNCEtzX0fNpY7LJRtd575NKRjhCA9gXLjl7x8twrRO3fHl01
   88aSAnu747XI05YZpyePmyGZCbCJaWbVxDCaW45PL/1X6xhndtnkm91nS
   g==;
X-CSE-ConnectionGUID: J9sRfBkjQSGH9DMaHEK/yA==
X-CSE-MsgGUID: qCi/QyVMTnOkotX0S5uDiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60180216"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60180216"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 20:05:00 -0700
X-CSE-ConnectionGUID: spMDEGD9QoOzgKFtgMUFsg==
X-CSE-MsgGUID: e65VNDg7S0CoEjfKgt9tNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; 
   d="scan'208";a="179183524"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Sep 2025 20:04:58 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyLzz-0000xv-1L;
	Tue, 16 Sep 2025 03:04:55 +0000
Date: Tue, 16 Sep 2025 11:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next-test] BUILD SUCCESS
 b137312fbf2dd1edc39acf7e8e6e8ac0a6ad72c0
Message-ID: <202509161100.PuP5MDTy-lkp@intel.com>
User-Agent: s-nail v14.9.24
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: b137312fbf2dd1edc39acf7e8e6e8ac0a6ad72c0  powerpc64/modules: replace stub allocation sentinel with an explicit counter

elapsed time: 899m

configs tested: 120
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250915    gcc-9.5.0
arc                   randconfig-002-20250915    gcc-9.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                          pxa910_defconfig    gcc-15.1.0
arm                   randconfig-001-20250915    gcc-13.4.0
arm                   randconfig-002-20250915    clang-20
arm                   randconfig-003-20250915    gcc-8.5.0
arm                   randconfig-004-20250915    gcc-11.5.0
arm                         wpcm450_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250915    clang-22
arm64                 randconfig-002-20250915    clang-22
arm64                 randconfig-003-20250915    gcc-8.5.0
arm64                 randconfig-004-20250915    gcc-11.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250915    gcc-15.1.0
csky                  randconfig-002-20250915    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250915    clang-22
hexagon               randconfig-002-20250915    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250915    clang-20
i386        buildonly-randconfig-002-20250915    gcc-14
i386        buildonly-randconfig-003-20250915    gcc-14
i386        buildonly-randconfig-004-20250915    gcc-14
i386        buildonly-randconfig-005-20250915    gcc-14
i386        buildonly-randconfig-006-20250915    gcc-14
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250915    clang-22
loongarch             randconfig-002-20250915    gcc-12.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                            q40_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          eyeq5_defconfig    gcc-15.1.0
mips                           ip32_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250915    gcc-11.5.0
nios2                 randconfig-002-20250915    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250915    gcc-9.5.0
parisc                randconfig-002-20250915    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250915    gcc-14.3.0
powerpc               randconfig-002-20250915    gcc-8.5.0
powerpc               randconfig-003-20250915    clang-22
powerpc64             randconfig-001-20250915    clang-20
powerpc64             randconfig-002-20250915    clang-22
powerpc64             randconfig-003-20250915    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250915    gcc-8.5.0
riscv                 randconfig-002-20250915    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    gcc-15.1.0
s390                  randconfig-001-20250915    clang-22
s390                  randconfig-002-20250915    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250915    gcc-15.1.0
sh                    randconfig-002-20250915    gcc-13.4.0
sh                           se7721_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250915    gcc-8.5.0
sparc                 randconfig-002-20250915    gcc-8.5.0
sparc64               randconfig-001-20250915    gcc-13.4.0
sparc64               randconfig-002-20250915    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20250915    gcc-14
um                    randconfig-002-20250915    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250915    clang-20
x86_64      buildonly-randconfig-002-20250915    gcc-12
x86_64      buildonly-randconfig-003-20250915    gcc-14
x86_64      buildonly-randconfig-004-20250915    clang-20
x86_64      buildonly-randconfig-005-20250915    clang-20
x86_64      buildonly-randconfig-006-20250915    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250915    gcc-9.5.0
xtensa                randconfig-002-20250915    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

