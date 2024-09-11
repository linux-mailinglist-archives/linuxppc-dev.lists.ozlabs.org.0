Return-Path: <linuxppc-dev+bounces-1250-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE231975108
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 13:45:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3dzG3cCxz2yL5;
	Wed, 11 Sep 2024 21:44:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726055098;
	cv=none; b=ku1MiB5m4oU/hJ6PF/6ME6Ofc3rvNe3ds6CYidq9oQHsOoE3Q3Gk3mY4iVSBegZZSTaMXrq5esV65C/AFGpGlX+zSoCVx9A8aOk+Akh0oa02ZKuyvFuFxnHJqyxU6B9NkfHSx7vIiBx6jNmORJlYeNU+4pUvNPWggosDm4HV1wMy1hrOf1T3p1+CxQuw8Swfz8hb4KlZrdE/sszyobh8s/9tnCD4WzeBOPjUy/KMj8CQ3NbJhgARQkD889CNjnThxe65Ta/5m0XwrSY7uyLJ+eGkvYR+Tx9OdZbcTNPMu2Ka1MlUgaCQr1opy5AuFzxAxhA1Qty/djrEWdw/QGr0mA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726055098; c=relaxed/relaxed;
	bh=ECKdtecumWq+j9F0Ib5ynHn3vF35FFQk/7IykoLjX7E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ea9d0R5eCg6KEcAbbBT85pA43JNcFO4uIafNkny7fHThZmkvSIulymaZnBw+0QqajugrpBVRq+7k2SO/unOsF6LR1+PgiJ5jzkSRQq1CVb18VbFotYFIRR9edMUumndWQd9HsV0Ve237kDPr02ZbdIxbPcbXzEh/hQpz17rlj6aHC57eOdPSJ8kDV4IZ7uArcSGj7OvrQqJAt1q0aC4YP1UY57dm+xmV4zHJ9zvLItD3Mrf6cfU2JiWJ+isKds5X+U/Of5Uc0RF37xZ+M8zBNTb3gvdV/50on+OoBpDLwqMm2ctd1OnU0IJ4HkkGAvFRPhT8pBX+XVzcqHYcNKkwWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CZHm9FXU; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CZHm9FXU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3dzD6k3Sz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 21:44:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726055097; x=1757591097;
  h=date:from:to:cc:subject:message-id;
  bh=/dix4tLX1sGSSSb95pTvqZzmZpIlvrGY6g439pKjtjo=;
  b=CZHm9FXUGLlKu5t5pQdgtRPza3wQLnUgSmIUcTkn1bn+sLl+cxtv3WXY
   6JFEGsNmEB5VIRPze1WGl9ckTscL1FNH+wjulOI8eG6gBhDrpFddF1YK0
   kohw5w0JZzw9GW500jSpxi3dM0eDXSYLlawRLyCCjPWMzy/8kadsjwD/o
   0RkgZUPOMAQ/qqjP6QgWTvuYyU0WNz9LhlPN6lInmF2LPXwfG2CNmvJXc
   fyb34Ef6PlHcnguwcbyQykArySH1B306Ezl8UkzYxkjbfL0QxS4hdWieN
   vVLsx5a0neldhVn7fphC7aDtWiUqTtau4SKuulmyFXkMBcZO0AaVwS8r1
   g==;
X-CSE-ConnectionGUID: JjdgrjmsQJOOw+x9+V4Jvg==
X-CSE-MsgGUID: JLQvZRMcTYawTceFS8iFSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="47366154"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="47366154"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 04:44:50 -0700
X-CSE-ConnectionGUID: I023C2lwQOOwTJtWRjh/pw==
X-CSE-MsgGUID: zpf+Wn8yRaKoaEHFqXitig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="90622500"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Sep 2024 04:44:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soLmB-0003U1-0A;
	Wed, 11 Sep 2024 11:44:47 +0000
Date: Wed, 11 Sep 2024 19:44:05 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next] BUILD SUCCESS
 01d34cc93639172272c3e47edd5cf1a3ffc6dc7a
Message-ID: <202409111903.dqiIgLjz-lkp@intel.com>
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
branch HEAD: 01d34cc93639172272c3e47edd5cf1a3ffc6dc7a  powerpc: Switch back to struct platform_driver::remove()

elapsed time: 1197m

configs tested: 137
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-14.1.0
arm                              allmodconfig   clang-20
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240911   clang-18
i386         buildonly-randconfig-001-20240911   gcc-12
i386         buildonly-randconfig-002-20240911   gcc-12
i386         buildonly-randconfig-003-20240911   clang-18
i386         buildonly-randconfig-003-20240911   gcc-12
i386         buildonly-randconfig-004-20240911   gcc-12
i386         buildonly-randconfig-005-20240911   gcc-12
i386         buildonly-randconfig-006-20240911   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240911   gcc-12
i386                  randconfig-002-20240911   clang-18
i386                  randconfig-002-20240911   gcc-12
i386                  randconfig-003-20240911   clang-18
i386                  randconfig-003-20240911   gcc-12
i386                  randconfig-004-20240911   gcc-12
i386                  randconfig-005-20240911   gcc-12
i386                  randconfig-006-20240911   clang-18
i386                  randconfig-006-20240911   gcc-12
i386                  randconfig-011-20240911   gcc-12
i386                  randconfig-012-20240911   gcc-12
i386                  randconfig-013-20240911   clang-18
i386                  randconfig-013-20240911   gcc-12
i386                  randconfig-014-20240911   clang-18
i386                  randconfig-014-20240911   gcc-12
i386                  randconfig-015-20240911   gcc-12
i386                  randconfig-016-20240911   clang-18
i386                  randconfig-016-20240911   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                               defconfig   gcc-12
s390                             allmodconfig   clang-20
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   clang-20
um                               allyesconfig   gcc-12
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240911   clang-18
x86_64       buildonly-randconfig-002-20240911   clang-18
x86_64       buildonly-randconfig-003-20240911   clang-18
x86_64       buildonly-randconfig-004-20240911   clang-18
x86_64       buildonly-randconfig-005-20240911   clang-18
x86_64       buildonly-randconfig-006-20240911   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                                  kexec   gcc-12
x86_64                randconfig-001-20240911   clang-18
x86_64                randconfig-002-20240911   clang-18
x86_64                randconfig-003-20240911   clang-18
x86_64                randconfig-004-20240911   clang-18
x86_64                randconfig-005-20240911   clang-18
x86_64                randconfig-006-20240911   clang-18
x86_64                randconfig-011-20240911   clang-18
x86_64                randconfig-012-20240911   clang-18
x86_64                randconfig-013-20240911   clang-18
x86_64                randconfig-014-20240911   clang-18
x86_64                randconfig-015-20240911   clang-18
x86_64                randconfig-016-20240911   clang-18
x86_64                randconfig-071-20240911   clang-18
x86_64                randconfig-072-20240911   clang-18
x86_64                randconfig-073-20240911   clang-18
x86_64                randconfig-074-20240911   clang-18
x86_64                randconfig-075-20240911   clang-18
x86_64                randconfig-076-20240911   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

