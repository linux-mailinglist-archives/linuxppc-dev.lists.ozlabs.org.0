Return-Path: <linuxppc-dev+bounces-9677-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 935BAAE66AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jun 2025 15:37:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRQx46pzTz2yFP;
	Tue, 24 Jun 2025 23:37:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750772248;
	cv=none; b=jtZoHn+SfuIDUvDiki4pMoiUX4BR0b9OTEOvRbIzRjeHpzSINCZC76nJ/QXpl+ntHqBT1z+ab6Oi+r3jq1+gB6ioJdbQvxrV0kNHgYukAlPZV56BXF2YEKWGAYnMp5LEm/Zwduhk9iDDevGTExAYE5in2n9Racg2X37J79EQZMcHOhaDIObVQEiGvaeiU6Llw8573379y3te6xV9t2CgYtUC6jr2r+TTDQCU+2JGlBVCIWBDvFz/bYxdW8MgDM+5NHAX/76USK7E1EMer6kZE3uYYROWOs6FnKqJyZ878NXN7ILSMi6LdNbwa+VD/aXJ5+cNAM+MyHfNGumyeXdyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750772248; c=relaxed/relaxed;
	bh=s7QF3IUXOqFIVMNTqcJVQw/vKjHjgKukIISnPvi/QTk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CTQjEmPJsWhJjB0TAT90YTyqyTknX374zj9nf106vzdY2dQBfWkRktgZabLd4+10m63FPib8GNJD+lJeABjZIYhMFp5wA8XjGG+jigoZCUYMF6mP7V0HFjqgZcazMb3SUpIu8OIcAAKxZdNI/AFjp2CtBGyG7RPte2w0I9qwlJiiqSqTAd2/cATFDDT74SmNza0yYBJZq9N0yEE2EcQVk52Y3O74jfGDrPLUYExcye6pTSmfPUURHq7yMw3YaAm0EGzVt/16UfPNcbBKC/ULtX6RXFBVF5plBBAZ/tVC8gLUoaHEC2zfFv8JIND9Dm8IUmTsvmx0WLceslJGtjLdEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EPK+xWlG; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EPK+xWlG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRQx23nmWz2xk5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 23:37:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750772246; x=1782308246;
  h=date:from:to:cc:subject:message-id;
  bh=EvrrBufjsy3BRPO644C2vJhTh4Kupwq6jFLdn6MPcNs=;
  b=EPK+xWlGYY7WX/I76rrtcbUx6tBgdCh5c4/KhjoqjEg4ZSXZ5ewY7UUA
   YIv/QY341rnDn/TAot9+ybhJ9Jj93mJUDue9EFm0kmAJcrXeplDjmL2Ya
   5xsjH4ryUpgW0L64hzhTWlCumFix7bQ9ik/TMx6tOCqIYoithGP0g0hPN
   E52RMVDU+al0dJk22SvQ0syBRjryu1ehjEHJiWOF6B3hA7qy6q8GpMayW
   Hz6aKI0CFWHv8RC+iMxDJASJrgkOiszJuzsb2zU94/k7VzaZD72Do8fI9
   SY9djEpMfnI1BKdTf9SxPNXldZzcFx45K66KfALeBtjx4BUhGkgTaX4C5
   g==;
X-CSE-ConnectionGUID: 4r+A41TCTCmlUpnkbaIQVw==
X-CSE-MsgGUID: hBj0tX/tSOGFRuxpkoe4fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="78432265"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="78432265"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 06:37:22 -0700
X-CSE-ConnectionGUID: iGyJJp+qRTOBtDZQI3dqiA==
X-CSE-MsgGUID: sMiSKTudSHqNJqyqntXnjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="152215511"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Jun 2025 06:37:22 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU3pw-000SAk-0J;
	Tue, 24 Jun 2025 13:37:20 +0000
Date: Tue, 24 Jun 2025 21:37:03 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 c8e9cecda99751688799297fd00694d73bfd3197
Message-ID: <202506242151.JFp3wEKq-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: c8e9cecda99751688799297fd00694d73bfd3197  Automatic merge of 'next' into merge (2025-06-23 18:21)

elapsed time: 1453m

configs tested: 62
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250624    gcc-12.4.0
arc                   randconfig-002-20250624    gcc-8.5.0
arm                               allnoconfig    clang-21
arm                   randconfig-001-20250624    gcc-13.3.0
arm                   randconfig-002-20250624    gcc-8.5.0
arm                   randconfig-003-20250624    gcc-12.4.0
arm                   randconfig-004-20250624    clang-17
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250624    clang-21
arm64                 randconfig-002-20250624    gcc-10.5.0
arm64                 randconfig-003-20250624    clang-21
arm64                 randconfig-004-20250624    clang-21
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250624    clang-20
i386        buildonly-randconfig-002-20250624    gcc-12
i386        buildonly-randconfig-003-20250624    clang-20
i386        buildonly-randconfig-004-20250624    clang-20
i386        buildonly-randconfig-005-20250624    clang-20
i386        buildonly-randconfig-006-20250624    gcc-12
i386                                defconfig    clang-20
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250624    clang-20
x86_64      buildonly-randconfig-002-20250624    gcc-12
x86_64      buildonly-randconfig-003-20250624    clang-20
x86_64      buildonly-randconfig-004-20250624    clang-20
x86_64      buildonly-randconfig-005-20250624    clang-20
x86_64      buildonly-randconfig-006-20250624    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

