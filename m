Return-Path: <linuxppc-dev+bounces-10367-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 068ECB0E992
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jul 2025 06:22:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bn1FQ5CRMz30Qk;
	Wed, 23 Jul 2025 14:22:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753244554;
	cv=none; b=dAm9Doq1sKiSHzyUi+88zWyDAvu6goVWpNBKI5hklapnj5liOq+jDbWOOKlyuMLBtNUUGRTLRcfENd6vHCxTrOLqfXetx+IfAUewuB/t97zX/DSKmohObeECo3rfNla8GIIxL2D9dRioSnxoqYKn8b8wdMNe+R36/H4HGn8i46WWll2eVl/7N6IKj02m/YVap0Nu9LddTDKowIZITWuZcZvlsYt1rSate8Yr3h206jOXuscpl7HQLruSrhi5Gdt4/ms1vROPNWq6U1TVJFP5sI56QtLbIL3geZBz660h+N9z3wN4WpsRoY4A07w8F9nEWNX6lw1XiA28BWFCv1KjqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753244554; c=relaxed/relaxed;
	bh=YSf1tKWr6LNgQBaVLGGDFl1d7cN9mU9y+ZTMrbplK3A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ByRL/NWLYaqmadx3TN3wlTF/6matSF1m2cqhw0anxkbsWvGVSViy+YbPnblEezGhwwOLptgLG69bIEt3GMEYfFoFgbLxkWJ7agbv81B/6rS7UyOB97+WGc1Ky+mgHTZWATf13eaA7hDXmuBtUXLd9Y+D0N5LKLtW+I+hCGHsJop5+JgKoGNYVxbYL4xjucPzXwAnU1ySxwBo1h7p0TjXyusYA+Zj8EgMvGbja4Z0XBcPUjRcYdvADRVDGTO1lgjCEuRYuru0SbNUpI0WgmH5lHrb5diwJi0p0jtTWEEl6ry8pNZa4Iwsc/SEoLTs+zVWwLoIQbxxncbhNf0+LH8+Pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Uiqbf3U+; dkim-atps=neutral; spf=pass (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Uiqbf3U+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bn1FN2dXxz2yF0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 14:22:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753244553; x=1784780553;
  h=date:from:to:cc:subject:message-id;
  bh=iJTUXUZJ58sHuV7iRyn/nIRSxzbKSiVRBfl4PrqrGeU=;
  b=Uiqbf3U+G2aWFtV0V6+mQnaoVEpRxIwSvhpKam+PeA2O8XQj6+taHSjg
   Lg4szewBXO/AWyfM2+hQ23aGbB1kzsmuVxxstiO9QpIzdPfHmBONokLiX
   KaQeeYQrY7yrqr3UO9h3Y7wD8UJEbbF5jKcmOxhLwbld2yH9ZspZ74gyi
   KlwL9GzWoOaFt4m62wFKmXhJynej0bmutfCia5M+ogKaZ4GDSAAkXiOMx
   VbOXKychLVgNhReYModrKCcBeeh/3zixR9lDtp6HuJuBzb2YYA1k46G31
   uUr589lcBu33gfmF/AVMsQCcsuA55mdkWJMigQfXoKMQrv1I1KNJSHc2T
   w==;
X-CSE-ConnectionGUID: Th6B6Zh/TMWITrR70ZPnUw==
X-CSE-MsgGUID: Nsxdk4zFTnOGAIlN80IdlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55667386"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="55667386"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 21:22:28 -0700
X-CSE-ConnectionGUID: wlhX7yR8TRCSRP0kwz9uuA==
X-CSE-MsgGUID: fqxm/zKlSgSzfKkzyxH7tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="159076146"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Jul 2025 21:22:27 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueQzo-000IxD-2d;
	Wed, 23 Jul 2025 04:22:24 +0000
Date: Wed, 23 Jul 2025 12:22:10 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next-test] BUILD SUCCESS
 221e2869356d8bb0da59f6508aba6f52226d46a6
Message-ID: <202507231257.hKedsldl-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 221e2869356d8bb0da59f6508aba6f52226d46a6  powerpc/pseries/msi: Switch to msi_create_parent_irq_domain()

elapsed time: 1105m

configs tested: 120
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250722    gcc-10.5.0
arc                   randconfig-002-20250722    gcc-11.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                          pxa3xx_defconfig    clang-22
arm                   randconfig-001-20250722    gcc-12.5.0
arm                   randconfig-002-20250722    clang-22
arm                   randconfig-003-20250722    gcc-8.5.0
arm                   randconfig-004-20250722    clang-17
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250722    clang-22
arm64                 randconfig-002-20250722    clang-22
arm64                 randconfig-003-20250722    clang-22
arm64                 randconfig-004-20250722    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250722    gcc-11.5.0
csky                  randconfig-002-20250722    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250722    clang-20
hexagon               randconfig-002-20250722    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250722    gcc-12
i386        buildonly-randconfig-002-20250722    gcc-12
i386        buildonly-randconfig-003-20250722    clang-20
i386        buildonly-randconfig-004-20250722    gcc-12
i386        buildonly-randconfig-004-20250723    clang-20
i386        buildonly-randconfig-005-20250722    clang-20
i386        buildonly-randconfig-006-20250722    clang-20
i386                                defconfig    clang-20
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250722    gcc-15.1.0
loongarch             randconfig-002-20250722    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
mips                        qi_lb60_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250722    gcc-11.5.0
nios2                 randconfig-002-20250722    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
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
powerpc               randconfig-001-20250722    gcc-13.4.0
powerpc               randconfig-002-20250722    clang-22
powerpc               randconfig-003-20250722    gcc-14.3.0
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250722    gcc-8.5.0
powerpc64             randconfig-002-20250722    clang-22
powerpc64             randconfig-003-20250722    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250722    clang-16
riscv                 randconfig-002-20250722    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250722    clang-22
s390                  randconfig-002-20250722    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250722    gcc-15.1.0
sh                    randconfig-002-20250722    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250722    gcc-13.4.0
sparc                 randconfig-002-20250722    gcc-15.1.0
sparc                       sparc64_defconfig    gcc-15.1.0
sparc64               randconfig-001-20250722    gcc-8.5.0
sparc64               randconfig-002-20250722    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250722    gcc-12
um                    randconfig-002-20250722    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250722    gcc-12
x86_64      buildonly-randconfig-002-20250722    gcc-12
x86_64      buildonly-randconfig-003-20250722    gcc-12
x86_64      buildonly-randconfig-004-20250722    clang-20
x86_64      buildonly-randconfig-005-20250722    gcc-12
x86_64      buildonly-randconfig-006-20250722    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250722    gcc-15.1.0
xtensa                randconfig-002-20250722    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

