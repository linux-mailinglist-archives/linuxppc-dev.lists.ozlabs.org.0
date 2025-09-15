Return-Path: <linuxppc-dev+bounces-12217-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98300B578F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 13:49:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQNcD0ywHz3dTm;
	Mon, 15 Sep 2025 21:49:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757936972;
	cv=none; b=jqzDENfHMeT1mgadeZjAJIlN5Rsy5XGoJJa7wq5SpAeXotegns96hQBYGn45mgPrujNdS28oeVXDxziXtI+63bTO26/ZqYYaGa2r6CIqAWsUcdNhVWPu6OuUdLR5njPvGjB9JwP6DDaCRs/hHFt0e+e6Bjqgg5i956oLGeYyufw/b9hvDkuYiR9qZOrVxE2evcMrWRmLIZwBz618wJpoGNLXNjsaSu6q62e5Rt1Q8swaqphjceL/Uaay+W3KPXmlpewMC5/yRgrVhzaRsO4BQHBCfJyiNpteU7tA0tZOlgIYsEv7f+okLtlJlBo857K8ShSZMN7y+GsmZvHD1D8kiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757936972; c=relaxed/relaxed;
	bh=5hE1j227LuFctY7JI+EtaR7TcnVRLXNqgikhnlLcy7c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B0TYdQJGZwhUFY8RmzgcqOxau96nHAX2Q5W2O1m0rlZywIFXqmJJ3P+Utofyw9HwDEms/j3UgKUGm5/XyzWzWgjGEu8p8yZAqnY4SpacGIpnLSG+v+kXOZbQTyG/r8PltqYC263O4Hu/maum8es6EwmpJlhC+PGyEtQkSDOhH9lYgJXCnOJg+73iMHpLOecWYpcMeWlInWQjydW8VnMWfRLU5sqpkz2nxJ0fiM/4Z62z186YvN0ZEWkU1y01eEaSGi/IvsrDDNVn92OZwWgrfJVBe3ey7saIyZtxB3mL38CF/UKD8JPVfcxAI4blZfoc9XLSFSFZZ/Dhn3G2Ae4OFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VYYXdGPV; dkim-atps=neutral; spf=pass (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VYYXdGPV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQNc94Zyyz3dTZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 21:49:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757936969; x=1789472969;
  h=date:from:to:cc:subject:message-id;
  bh=+VDVRRUSC6NRX9CHdRFZDuyDloPkJYlRNsdlcZOQgY4=;
  b=VYYXdGPVib8ysadqb8ktaFMF5oB+Fc3t0VP5P1RwLlOsmCn3nRAXx8sV
   OfMbWhtqeuOrt8XhNt+3Gn/W6aGd/Hl7kDuE030rua9aO0MslGGrGeQTM
   6rkdk/r6L022iJ2xA4pmC1XS01nkm2od6Rlg2p8+VVdhlfw+scWkRPQ0q
   8PuALDhO2guDpN2gdUIWKu+UaGfzgar4cTSHgVcGxCjC8MPNPWs3zY1I8
   oJOdSlU0V4VdFkM0eYdXT28O48G6eGFro88SpuV3Fc1MyZOUKZqYGMXgR
   8aNR8fTMlgVoNYDyMDN05AhqsPbNjmuXTnrxmXcAETs3OOM9mLCWzO6TH
   g==;
X-CSE-ConnectionGUID: uypgL67TRqG7tccPyqgCfg==
X-CSE-MsgGUID: BYMu8G+URLyWJ+IzxJszGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60133145"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60133145"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 04:49:23 -0700
X-CSE-ConnectionGUID: EOMYCEKUTKObC97VNpp+Qg==
X-CSE-MsgGUID: ez2WvuwESliyJaBoRSdLVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="175408610"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Sep 2025 04:49:22 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uy7hw-0000B9-1A;
	Mon, 15 Sep 2025 11:49:20 +0000
Date: Mon, 15 Sep 2025 19:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 5df49b805a8e2a18138a8def7fdaae72cb86583b
Message-ID: <202509151907.oY3PH0Lx-lkp@intel.com>
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
branch HEAD: 5df49b805a8e2a18138a8def7fdaae72cb86583b  Automatic merge of 'master' into merge (2025-09-14 20:44)

elapsed time: 1447m

configs tested: 134
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
arc                   randconfig-001-20250914    gcc-9.5.0
arc                   randconfig-002-20250914    gcc-10.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-22
arm                                 defconfig    clang-22
arm                   randconfig-001-20250914    clang-22
arm                   randconfig-002-20250914    clang-19
arm                   randconfig-003-20250914    gcc-14.3.0
arm                   randconfig-004-20250914    gcc-12.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250914    gcc-9.5.0
arm64                 randconfig-002-20250914    clang-22
arm64                 randconfig-003-20250914    clang-17
arm64                 randconfig-004-20250914    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250914    gcc-15.1.0
csky                  randconfig-002-20250914    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250914    clang-22
hexagon               randconfig-002-20250914    clang-22
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250914    gcc-13
i386        buildonly-randconfig-002-20250914    gcc-14
i386        buildonly-randconfig-003-20250914    gcc-14
i386        buildonly-randconfig-004-20250914    gcc-14
i386        buildonly-randconfig-005-20250914    clang-20
i386        buildonly-randconfig-006-20250914    gcc-14
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250914    clang-22
loongarch             randconfig-002-20250914    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                         3c120_defconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250914    gcc-10.5.0
nios2                 randconfig-002-20250914    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           alldefconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250914    gcc-8.5.0
parisc                randconfig-002-20250914    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                       eiger_defconfig    clang-22
powerpc               randconfig-001-20250914    clang-22
powerpc               randconfig-002-20250914    clang-22
powerpc               randconfig-003-20250914    clang-22
powerpc                     skiroot_defconfig    clang-22
powerpc64             randconfig-001-20250914    clang-22
powerpc64             randconfig-002-20250914    clang-22
powerpc64             randconfig-003-20250914    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250914    clang-22
riscv                 randconfig-002-20250914    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250914    gcc-10.5.0
s390                  randconfig-002-20250914    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250914    gcc-15.1.0
sh                    randconfig-002-20250914    gcc-10.5.0
sh                           se7724_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250914    gcc-11.5.0
sparc                 randconfig-002-20250914    gcc-14.3.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250914    gcc-8.5.0
sparc64               randconfig-002-20250914    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250914    clang-22
um                    randconfig-002-20250914    clang-18
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250914    clang-20
x86_64      buildonly-randconfig-002-20250914    clang-20
x86_64      buildonly-randconfig-003-20250914    clang-20
x86_64      buildonly-randconfig-004-20250914    clang-20
x86_64      buildonly-randconfig-005-20250914    gcc-14
x86_64      buildonly-randconfig-006-20250914    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250914    gcc-14.3.0
xtensa                randconfig-002-20250914    gcc-8.5.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

