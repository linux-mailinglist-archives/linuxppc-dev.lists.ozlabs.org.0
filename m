Return-Path: <linuxppc-dev+bounces-787-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D57F6965635
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 06:14:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww4XQ3lCHz304N;
	Fri, 30 Aug 2024 14:13:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724991238;
	cv=none; b=VMn075zTYe1r5AfojcUF0l/SYe9E0/bNOy5jHNIheUZN4NIDvSx4H7p/7JuBGZEdsUJVDFarDRzzgBY5ZCwikwZXRUOQOXdJQsIDHxSWXDuCoZBUwbKDYlp7yYE7Vp2zc2HE40cQxqGjWvAd/RgyovBVaE66NBbyJyepgZ/1aEW3/CPCWCwgDNPcNGL8ggRM3uXdx1WCBQNGnetLUmCi2/UKV+tcNQ+YQsVdfefdk2uU/XQszCWaravPkjV3srbCHO1AX24c1jiWYjC6MPhhk5ebJM3BEnHWrx1iWG3rPd9IPBRZxvyJC/HpnPwlol4JveXdblHIcjlWCo7yEnfvhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724991238; c=relaxed/relaxed;
	bh=aI9/5AvFNgQub6330lZgam09hNehVd5Z3vktfLe2lM0=;
	h=DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-IronPort-AV:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:User-Agent; b=jDCnNwKVz0cB6aXI1T1qVP63m5DghJpyhMTQD/TdZ9sq/e3CloVFxbtNiuMXFY4VUHU2T+QizH7DOvXM/GRpDfbQkRC5zTNQGiZDRCLzkYmdEfu3xE6okS1X299k8TX5TlWT9V7vKNLDXPmi0T4oL/IGo0JAibRJzfPyhvY8Wp8xsiwKuZXGBusctNIOl+CGxWikw6Dc+rdHCrETxdNh3zEAeCJRfxOviP05gJHLhDxYhkkmFSvSUTUgnR4VTe+yg6B2zq3+mILMPXwV11uAVHuLiAk4wg7RVCLppiLFxTYQsjFdEm5kErduVpwm4nH6LWIrh6RdlALI5waY437oYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fgvgBj1/; dkim-atps=neutral; spf=pass (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fgvgBj1/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww4XN4TWxz304H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 14:13:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724991237; x=1756527237;
  h=date:from:to:cc:subject:message-id;
  bh=+ETUO+0GGNqil0fX57a79zuLCSSw7/dLpmoSQrehK+Y=;
  b=fgvgBj1/+azm9CRtXGhvdk5Xd7iSiyLM0njXE1eL6fnz8SmAEIG3jAq7
   Npkbr5BLzlNBUu+WDpHR301oTiuteFTunQD42RaTHAiLo9g7seBaLFH09
   DYI2wmvebm5kUsVuODIiq9xYSns18nlR5GqpTw8ya9NUM7GKw25G1wUOU
   DEiFGoKe9j4r75V9/wmtKPQOp8MuZ4NPW7LUusjFzTkOz9wwuxdqK91+D
   uXmzxeBFf6fPyZZTKiJLnThEb2b1Ocaef6OE1gBv6o8Adf0nlf/X6pYY4
   pL7c7k0+krF9B26jBiW0zydHaJEmsD3onA8JOlmLvo2epCLRWpDIKrBGb
   Q==;
X-CSE-ConnectionGUID: ml++/C30TeyevWSfoBy4hg==
X-CSE-MsgGUID: 7Hh4xYO8RcaNQQ/m+5+6qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23777196"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="23777196"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 21:13:51 -0700
X-CSE-ConnectionGUID: mZthqoY7ReGxQU0GEtIMGw==
X-CSE-MsgGUID: AczMMgdrQrO3LTs8ko0GDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="64519630"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Aug 2024 21:13:50 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjt19-000110-15;
	Fri, 30 Aug 2024 04:13:47 +0000
Date: Fri, 30 Aug 2024 12:13:05 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:fixes-test] BUILD SUCCESS
 f8c29fc27feb230a3383204f22aa5474042f6ed8
Message-ID: <202408301203.t5cVvqQc-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: f8c29fc27feb230a3383204f22aa5474042f6ed8  powerpc/pseries: Fix dtl_access_lock to be a rw_semaphore

elapsed time: 909m

configs tested: 167
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                                 defconfig   gcc-14.1.0
arc                   randconfig-001-20240830   gcc-14.1.0
arc                   randconfig-002-20240830   gcc-14.1.0
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm                   milbeaut_m10v_defconfig   gcc-14.1.0
arm                        multi_v7_defconfig   gcc-14.1.0
arm                   randconfig-001-20240830   gcc-14.1.0
arm                   randconfig-002-20240830   gcc-14.1.0
arm                   randconfig-003-20240830   gcc-14.1.0
arm                   randconfig-004-20240830   gcc-14.1.0
arm                           tegra_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240830   gcc-14.1.0
arm64                 randconfig-002-20240830   gcc-14.1.0
arm64                 randconfig-003-20240830   gcc-14.1.0
arm64                 randconfig-004-20240830   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240830   gcc-14.1.0
csky                  randconfig-002-20240830   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
hexagon               randconfig-001-20240830   gcc-14.1.0
hexagon               randconfig-002-20240830   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240830   gcc-12
i386         buildonly-randconfig-002-20240830   gcc-12
i386         buildonly-randconfig-003-20240830   gcc-12
i386         buildonly-randconfig-004-20240830   gcc-12
i386         buildonly-randconfig-005-20240830   gcc-12
i386         buildonly-randconfig-006-20240830   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240830   gcc-12
i386                  randconfig-002-20240830   gcc-12
i386                  randconfig-003-20240830   gcc-12
i386                  randconfig-004-20240830   gcc-12
i386                  randconfig-005-20240830   gcc-12
i386                  randconfig-006-20240830   gcc-12
i386                  randconfig-011-20240830   gcc-12
i386                  randconfig-012-20240830   gcc-12
i386                  randconfig-013-20240830   gcc-12
i386                  randconfig-014-20240830   gcc-12
i386                  randconfig-015-20240830   gcc-12
i386                  randconfig-016-20240830   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
loongarch             randconfig-001-20240830   gcc-14.1.0
loongarch             randconfig-002-20240830   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
m68k                          hp300_defconfig   gcc-14.1.0
m68k                       m5275evb_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                      fuloong2e_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
nios2                 randconfig-001-20240830   gcc-14.1.0
nios2                 randconfig-002-20240830   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc                randconfig-001-20240830   gcc-14.1.0
parisc                randconfig-002-20240830   gcc-14.1.0
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      bamboo_defconfig   gcc-14.1.0
powerpc                   bluestone_defconfig   gcc-14.1.0
powerpc                 mpc836x_rdk_defconfig   gcc-14.1.0
powerpc                      pmac32_defconfig   gcc-14.1.0
powerpc                       ppc64_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240830   gcc-14.1.0
powerpc               randconfig-002-20240830   gcc-14.1.0
powerpc                     tqm5200_defconfig   gcc-14.1.0
powerpc64                        alldefconfig   gcc-14.1.0
powerpc64             randconfig-001-20240830   gcc-14.1.0
powerpc64             randconfig-002-20240830   gcc-14.1.0
powerpc64             randconfig-003-20240830   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                               defconfig   gcc-12
riscv                 randconfig-001-20240830   gcc-14.1.0
riscv                 randconfig-002-20240830   gcc-14.1.0
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240830   gcc-14.1.0
s390                  randconfig-002-20240830   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                    randconfig-001-20240830   gcc-14.1.0
sh                    randconfig-002-20240830   gcc-14.1.0
sh                             shx3_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
sparc64               randconfig-001-20240830   gcc-14.1.0
sparc64               randconfig-002-20240830   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240830   gcc-14.1.0
um                    randconfig-002-20240830   gcc-14.1.0
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240830   clang-18
x86_64       buildonly-randconfig-002-20240830   clang-18
x86_64       buildonly-randconfig-003-20240830   clang-18
x86_64       buildonly-randconfig-004-20240830   clang-18
x86_64       buildonly-randconfig-005-20240830   clang-18
x86_64       buildonly-randconfig-006-20240830   clang-18
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240830   clang-18
x86_64                randconfig-002-20240830   clang-18
x86_64                randconfig-003-20240830   clang-18
x86_64                randconfig-004-20240830   clang-18
x86_64                randconfig-005-20240830   clang-18
x86_64                randconfig-006-20240830   clang-18
x86_64                randconfig-011-20240830   clang-18
x86_64                randconfig-012-20240830   clang-18
x86_64                randconfig-013-20240830   clang-18
x86_64                randconfig-014-20240830   clang-18
x86_64                randconfig-015-20240830   clang-18
x86_64                randconfig-016-20240830   clang-18
x86_64                randconfig-071-20240830   clang-18
x86_64                randconfig-072-20240830   clang-18
x86_64                randconfig-073-20240830   clang-18
x86_64                randconfig-074-20240830   clang-18
x86_64                randconfig-075-20240830   clang-18
x86_64                randconfig-076-20240830   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                          iss_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240830   gcc-14.1.0
xtensa                randconfig-002-20240830   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

