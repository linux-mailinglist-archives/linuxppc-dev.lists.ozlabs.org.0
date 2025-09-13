Return-Path: <linuxppc-dev+bounces-12141-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B71B55E86
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 07:04:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNzjw0mNzz2yrN;
	Sat, 13 Sep 2025 15:04:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757739875;
	cv=none; b=FQyMIMqhjQSI02ZwQO+gzGPeiN/IM1L96PyNOWv+i2+23/mbgZFqEhp1S6NG3gqbdPDXrlSrtRD7G5+FQQh4WJr1R1uliIjyFKnpXfJZflaCCdJ0OtWT6r1XlzNdfP++KhLRwCHEosLdma+xgiYeAxNzl3wuoVOK06U8RIn1NJVuLoJZ6klOIIzvTdpY9D0WYbCkoE0t9tklf9KFjNO4iFD5cgaBjjRPeGugTS8/tagFk8ndIpzIhYoJWW6rp/7xKS0+bktF05fOBiFrmRmk4aaQIavkvD0hrG4d+9H4OMzWyjqGM8D8PFVd0gwlZiI98funDmbDsnoWKVDOebqAwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757739875; c=relaxed/relaxed;
	bh=t3KEUd9Y4/EUm6FeB6FCflckGTzNtzFYAfrdt8Pl/fg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cZlOWCHOkHD5HLZXUzM5tRnAoA25w9WNZcQOG5O+zorj0H6tTWFI70ZlF6PKoDsNj46nvNCrQsCflSQBr23wzdn8D3QnOibitc+cbnpcPcc6m7Ep9vdG5OOqJSGXlvNeYDLGGyxthWVIXoT31u67MEQug1f/ZO7VnZlkSsIpZvZd6NwlD3DJAPmjeHtKUih8LXlhbS2WSGNAYcgQYuPvgOkuJ4oqzvJ3x26Nx6ykGSxwinc+QJL+TjOzc+d4farXaKgOLbNpFuMTnKXU0Wh93klIvy65is6HxBGBScOsu3sFyoPYkMiK/VtHR2xjzeo7nl7m3bI12p/tK60oQ48BQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hoi6geOP; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hoi6geOP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNzjs5PTRz2xnr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 15:04:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757739874; x=1789275874;
  h=date:from:to:cc:subject:message-id;
  bh=TZvfY4/BWbsRG3NmUdAyUrC6bS92dWaKrmPszbA4ZxM=;
  b=hoi6geOP4C7BI7TGjPyAh0bLPLRG48C7EojHJ7qoPnzfe80TeW3fUmNw
   gQASw4FCe8AHY0AM9b0NSw+zN/1+KdYookXu8aIrzZ/fxY8ndkBsU5wAg
   3KDZdZBIgrW6hKplkc4QsrcKwULAWT1yNoVf+2XTfDRKXUDi3jbZl3rSM
   7i7+mKWN8UJLJ+0eCTOm1bPGzm2WBF1O1+8WVaoKDyOwP/aUybYq5ueIH
   uymJ5VKoXJEltZI3Di7vT6RFoQ26HzgO3NVTtq0j2/vcA+DESh9Pjgn3v
   PH3Z2WNYNPAARDfVRGW6u/sLs1OqzI2xgW7yTvgBdRkF65/A49XDJSJf9
   g==;
X-CSE-ConnectionGUID: n/Vi0HnmSZWIsm0+/B+HkQ==
X-CSE-MsgGUID: SAcSRhfBTgWf0sfrbXztFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="77692579"
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="77692579"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 22:04:29 -0700
X-CSE-ConnectionGUID: g2X61R4ARRaUBsJEjXx6Fw==
X-CSE-MsgGUID: KIsvLQVLT4KXYNpFwqbmWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="174541475"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 12 Sep 2025 22:04:28 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxIQz-0001My-2S;
	Sat, 13 Sep 2025 05:04:25 +0000
Date: Sat, 13 Sep 2025 13:03:49 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 ee89a44e586888e6a221c905869ce5502039ea38
Message-ID: <202509131339.LfpgFc8N-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: ee89a44e586888e6a221c905869ce5502039ea38  Automatic merge of 'next' into merge (2025-09-12 09:09)

elapsed time: 1447m

configs tested: 137
configs skipped: 4

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
arc                     nsimosci_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20250912    gcc-10.5.0
arc                   randconfig-001-20250913    gcc-10.5.0
arc                   randconfig-002-20250912    gcc-12.5.0
arc                   randconfig-002-20250913    gcc-11.5.0
arc                        vdk_hs38_defconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250912    clang-22
arm                   randconfig-001-20250913    clang-20
arm                   randconfig-002-20250912    gcc-14.3.0
arm                   randconfig-002-20250913    clang-22
arm                   randconfig-003-20250912    clang-22
arm                   randconfig-003-20250913    clang-22
arm                   randconfig-004-20250912    gcc-10.5.0
arm                   randconfig-004-20250913    gcc-14.3.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250912    clang-20
arm64                 randconfig-001-20250913    clang-22
arm64                 randconfig-002-20250912    clang-16
arm64                 randconfig-002-20250913    gcc-14.3.0
arm64                 randconfig-003-20250912    clang-22
arm64                 randconfig-003-20250913    clang-22
arm64                 randconfig-004-20250912    clang-19
arm64                 randconfig-004-20250913    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250912    gcc-15.1.0
csky                  randconfig-001-20250913    gcc-11.5.0
csky                  randconfig-002-20250912    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250912    clang-22
hexagon               randconfig-002-20250912    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20250912    gcc-14
i386        buildonly-randconfig-002-20250912    clang-20
i386        buildonly-randconfig-003-20250912    gcc-13
i386        buildonly-randconfig-004-20250912    clang-20
i386        buildonly-randconfig-005-20250912    gcc-14
i386        buildonly-randconfig-006-20250912    clang-20
i386                                defconfig    clang-20
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250912    gcc-15.1.0
loongarch             randconfig-002-20250912    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       bvme6000_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                     loongson1b_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250912    gcc-11.5.0
nios2                 randconfig-002-20250912    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250912    gcc-14.3.0
parisc                randconfig-002-20250912    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                      pasemi_defconfig    clang-22
powerpc               randconfig-001-20250912    gcc-8.5.0
powerpc               randconfig-002-20250912    clang-22
powerpc               randconfig-003-20250912    clang-17
powerpc64             randconfig-001-20250912    gcc-12.5.0
powerpc64             randconfig-002-20250912    clang-22
powerpc64             randconfig-003-20250912    clang-19
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250912    clang-16
riscv                 randconfig-002-20250912    gcc-9.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250912    gcc-10.5.0
s390                  randconfig-002-20250912    gcc-10.5.0
s390                  randconfig-002-20250913    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250912    gcc-15.1.0
sh                    randconfig-002-20250912    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250912    gcc-8.5.0
sparc                 randconfig-002-20250912    gcc-13.4.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250912    gcc-8.5.0
sparc64               randconfig-002-20250912    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250912    clang-22
um                    randconfig-002-20250912    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250912    gcc-14
x86_64      buildonly-randconfig-002-20250912    gcc-14
x86_64      buildonly-randconfig-003-20250912    clang-20
x86_64      buildonly-randconfig-004-20250912    clang-20
x86_64      buildonly-randconfig-005-20250912    clang-20
x86_64      buildonly-randconfig-006-20250912    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250912    gcc-9.5.0
xtensa                randconfig-002-20250912    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

