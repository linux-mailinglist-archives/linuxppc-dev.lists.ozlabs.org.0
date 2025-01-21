Return-Path: <linuxppc-dev+bounces-5469-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ACFA1860A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 21:20:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ycz9Z33vjz30Tm;
	Wed, 22 Jan 2025 07:20:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737490850;
	cv=none; b=be28WPHCcAP1nxYfCp4QeYotXoUQKwP9bBsR2WXEbMfsrPx34FcQBVLopKCu1jZcgfuiEmrpI7WRC9yrbrG4CirjbtCoaqKcNq/bRShS8+7A0ZYxuacvHXYKTPEIEuwZUwOtOOw7vsxkzWl7jDGNawNueLhG0UMQnJSJh+RD65aZxBde+zavsWSxqkwdpZDIdtB4aTSieuyCjvxOTCuVGG/Tn81QegOufap2Dgj2YErA/y0RxycoizoK8b4sgyWU5EGGYcDGuXkaByyeXIGVNsdQgYU8eLQxBHNJGQDGgIZumJZ2yUpWY1xUXhLeeeIeSFNTuS8mmVHp1N3W0B0tjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737490850; c=relaxed/relaxed;
	bh=OejLQBO3mNr/8E7jRFE8IOS8J52OEhDFWTIA/ZTBCvw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eewT8DFDuGjEjf6WiWsPMDPn8MqyeZUwstIQa4mbN/BOK09J+lC8+BBGPQ94BJ4ySU/hbI+noRgOZsjsp8ZBBzUixp1HhHXWAOync5sNL2JbsZpYenshl13OewzxYZcfhvcDny3U1KA2vATvg4oTHdNjCK7cxsHCoPKaVTCiRpwhr4Ygj2vLJhvK+Fw9Sk4dmMqYodK5mm8kzkhr1rG2I60nkVAjrScXq2nmtw9iCVWVeE4gdVkiOJZlcGRuGZRbWpDX7YUM1AWKHgc0USIYPzF7WGeDnv/oz9KJAs1YkgdGuBN7GCogDgArNQIog78UgIbSEDLI/VqaSETM/40Iyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gq3QOgkp; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gq3QOgkp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ycz9X1C66z30HP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 07:20:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737490849; x=1769026849;
  h=date:from:to:cc:subject:message-id;
  bh=MvrSQ7j1yNwnrbtXam2td32CPUeeCtKaO/RLidCpKqA=;
  b=gq3QOgkpNJZzOWnRa9HCvvCjc00Znt4KO81QEMMjRrNBV0WJiYneRFUO
   6orkdpNhhua5C7IkiHXua/Fgv8bstrEhnEG2L6PJBdQcxeYmDf8bYDl1N
   WG0tjmwBzx3qiH25l+Fyz/5duPpWkbqImsR7mIrB90Z79F7ZLci8t+e0u
   Nau2TbKiX5A2P9AB9L+dby7Fk0CVIkRxJDgiT5tJELKVWGFuLltQaHajz
   aTPsFsf+1ZQsij3elAfCsaXLLcsMDtTC3HkwP0OU6o9e0E6YU5w/AfSY7
   YvOB0i+qEA+ZQn99DahOtA0KxvQrJofc9y2gqZRpSF5Nk026NUCZWJGBA
   Q==;
X-CSE-ConnectionGUID: L2YjMmW0ScKOcgtnewVZiw==
X-CSE-MsgGUID: qF6WYyxZRxC+dNiqTWZH7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="55338680"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="55338680"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 12:20:19 -0800
X-CSE-ConnectionGUID: te81tfMkR+GZMOspqADTHg==
X-CSE-MsgGUID: rc6xlrONQPObrRbtQZGh2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111533279"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Jan 2025 12:20:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taKjP-000Yvn-2w;
	Tue, 21 Jan 2025 20:20:15 +0000
Date: Wed, 22 Jan 2025 04:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next-test] BUILD SUCCESS
 ae908b87b6bb32c170e9baf5858f2a7553cacc06
Message-ID: <202501220409.ktyNYqyQ-lkp@intel.com>
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
branch HEAD: ae908b87b6bb32c170e9baf5858f2a7553cacc06  powerpc: increase MIN RMA size for CAS negotiation

elapsed time: 838m

configs tested: 126
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                          axs103_defconfig    gcc-13.2.0
arc                        nsimosci_defconfig    gcc-13.2.0
arc                   randconfig-001-20250121    gcc-13.2.0
arc                   randconfig-002-20250121    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                             mxs_defconfig    clang-20
arm                   randconfig-001-20250121    clang-18
arm                   randconfig-002-20250121    gcc-14.2.0
arm                   randconfig-003-20250121    gcc-14.2.0
arm                   randconfig-004-20250121    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250121    gcc-14.2.0
arm64                 randconfig-002-20250121    gcc-14.2.0
arm64                 randconfig-003-20250121    gcc-14.2.0
arm64                 randconfig-004-20250121    clang-18
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250121    gcc-14.2.0
csky                  randconfig-002-20250121    gcc-14.2.0
hexagon                          alldefconfig    clang-15
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250121    clang-19
hexagon               randconfig-002-20250121    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250121    gcc-12
i386        buildonly-randconfig-002-20250121    clang-19
i386        buildonly-randconfig-003-20250121    gcc-12
i386        buildonly-randconfig-004-20250121    gcc-12
i386        buildonly-randconfig-005-20250121    gcc-12
i386        buildonly-randconfig-006-20250121    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250121    gcc-14.2.0
loongarch             randconfig-002-20250121    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-16
mips                          ath79_defconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250121    gcc-14.2.0
nios2                 randconfig-002-20250121    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                generic-32bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250121    gcc-14.2.0
parisc                randconfig-002-20250121    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250121    clang-20
powerpc               randconfig-002-20250121    gcc-14.2.0
powerpc               randconfig-003-20250121    gcc-14.2.0
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250121    gcc-14.2.0
powerpc64             randconfig-002-20250121    clang-20
powerpc64             randconfig-003-20250121    clang-16
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250121    gcc-14.2.0
riscv                 randconfig-002-20250121    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250121    clang-15
s390                  randconfig-002-20250121    gcc-14.2.0
s390                       zfcpdump_defconfig    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250121    gcc-14.2.0
sh                    randconfig-002-20250121    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250121    gcc-14.2.0
sparc                 randconfig-002-20250121    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250121    gcc-14.2.0
sparc64               randconfig-002-20250121    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250121    clang-16
um                    randconfig-002-20250121    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250121    gcc-12
x86_64      buildonly-randconfig-002-20250121    clang-19
x86_64      buildonly-randconfig-003-20250121    gcc-12
x86_64      buildonly-randconfig-004-20250121    clang-19
x86_64      buildonly-randconfig-005-20250121    clang-19
x86_64      buildonly-randconfig-006-20250121    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250121    gcc-14.2.0
xtensa                randconfig-002-20250121    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

