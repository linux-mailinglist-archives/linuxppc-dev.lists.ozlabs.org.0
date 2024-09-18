Return-Path: <linuxppc-dev+bounces-1429-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C6997BA79
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2024 11:58:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7vH13BGdz2xGg;
	Wed, 18 Sep 2024 19:58:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726653501;
	cv=none; b=RV8fZQLdbQfvvR4z+BU9IARw38z2SKeeO6TTzeS6tKD5Ad8WYhZAoNwus+6CbQX/bVDKWaUYN8FPDF2uVFML2alc67OLGIyEQXl+4hhWV7yO/Vzh/hiq+zQkQhX/li5RPv0U9nOavTAU7tZN7UwLdBVrL7XDxoxA9nqCkUCn8b+cjehgL6Fw9+UbROWC4LbyHGik1Id4yQ+T2IuS+kwfl73nKx19ld21XtMlLvNe7jXHHB9aixhSiqfQBD8X1yTTR0o2fQmeYDb962exdkThCtAxezn/FYPfjLSFPoYiNuymRykKJt0dGfE4AnhxU6WpqJlSIkzCuwtWDdGP01ULRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726653501; c=relaxed/relaxed;
	bh=55vUaIt05LlgPFMhvBGVR6mqn4ktrRp91c09kgVT5MY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dPAm6IZGJ+mIhGeVRbYKnfwPi7Vk3DHmYLu2vP4/kDPMRW/ys9+LmAwQ/+9VXVfCdPKWYZj9F1niYp1V9QVyJBTu0ty4toMmgYYo6nomNxlfYXwFbnAk6vpkx2DUgzq/TK+BoqS0dwY13BK9ow3bhaK6sqWEVAX0kVpR93VIdjYpqofrBx2IB33bE2I3RTmgPIeFRwHd3wC3ADXbkQrScrVe9GV/PudnzwC4DjxnsHhhHVLIsjfhlLeZG7ObaJTAsFeG3Nu2EuAqRsUB/50z28BBZEL/SgwgbtVzJuWLWQZkgj8f9vXbUrw1G2IKW6sRNsrWLIMc09XCvDmWAjDxKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EjlPXasO; dkim-atps=neutral; spf=pass (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EjlPXasO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7vGz5DCLz2xCj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 19:58:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726653501; x=1758189501;
  h=date:from:to:cc:subject:message-id;
  bh=EPYsDemfVsbVmA6R53Q4EtbeFxvupnohGPf1RJuYNPM=;
  b=EjlPXasOTAQQDyMYnIXC8nb6jYx/c6Wx1BzPm9c3r2C2DW6ol4eSCE58
   KuGYi62OIIaObFrXlJcl5qQ/a4m37IFJ5TI114ZUuIXgTRZOnGj8+z2I8
   L5sFNaWXtv+6+yZMZMHyQkVfdb+bkrWJr7cY6ZuBgWfXipfsNwP07ki5E
   OIYh9+0C9M1kk1tDRWGqCsjoobcQP93SABT7NrDMGyAJ6nkzhC3i86MNF
   agXKabidLjORUcNK4FP80MRkYNr4/1Znkjcs/mrel4X8s9CyRifFlcvlF
   oYTDr6X7GxudSjiKBtCeLQw1YNH1Ld2Ag9Jw2SwcfWBYsrpGbohzwVbcQ
   Q==;
X-CSE-ConnectionGUID: J91rn62mTNuP0Vt4s8ph2g==
X-CSE-MsgGUID: /tmhHc84TvWpvFmryeC2jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36690766"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="36690766"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 02:58:15 -0700
X-CSE-ConnectionGUID: VawYEbsPS9Kn28spQPWn2g==
X-CSE-MsgGUID: gGua8ib0TcCIrv5LGs4qSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="69106736"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2024 02:58:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqrRq-000C9M-18;
	Wed, 18 Sep 2024 09:58:10 +0000
Date: Wed, 18 Sep 2024 17:57:35 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next] BUILD SUCCESS
 39190ac7cff1fd15135fa8e658030d9646fdb5f2
Message-ID: <202409181728.OFTlkYMU-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 39190ac7cff1fd15135fa8e658030d9646fdb5f2  powerpc/atomic: Use YZ constraints for DS-form instructions

elapsed time: 1255m

configs tested: 117
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                     haps_hs_smp_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                   milbeaut_m10v_defconfig    clang-20
arm                            mps2_defconfig    clang-20
arm                        multi_v5_defconfig    clang-20
arm                        multi_v7_defconfig    clang-20
arm                       omap2plus_defconfig    clang-20
arm                          pxa910_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240918    clang-18
i386        buildonly-randconfig-002-20240918    clang-18
i386        buildonly-randconfig-003-20240918    clang-18
i386        buildonly-randconfig-004-20240918    clang-18
i386        buildonly-randconfig-005-20240918    clang-18
i386        buildonly-randconfig-006-20240918    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240918    clang-18
i386                  randconfig-002-20240918    clang-18
i386                  randconfig-003-20240918    clang-18
i386                  randconfig-004-20240918    clang-18
i386                  randconfig-005-20240918    clang-18
i386                  randconfig-006-20240918    clang-18
i386                  randconfig-011-20240918    clang-18
i386                  randconfig-012-20240918    clang-18
i386                  randconfig-013-20240918    clang-18
i386                  randconfig-014-20240918    clang-18
i386                  randconfig-015-20240918    clang-18
i386                  randconfig-016-20240918    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                         amcore_defconfig    clang-20
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                  cavium_octeon_defconfig    clang-20
mips                 decstation_r4k_defconfig    clang-20
mips                  maltasmvp_eva_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                     akebono_defconfig    clang-20
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                        cell_defconfig    clang-20
powerpc                   motionpro_defconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                           se7724_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                           rhel-8.3-bpf    clang-18
x86_64                           rhel-8.3-bpf    gcc-12
x86_64                         rhel-8.3-kunit    clang-18
x86_64                         rhel-8.3-kunit    gcc-12
x86_64                           rhel-8.3-ltp    clang-18
x86_64                           rhel-8.3-ltp    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

