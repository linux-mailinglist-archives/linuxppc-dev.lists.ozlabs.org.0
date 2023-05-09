Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EF96FBEE1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 07:49:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFnL63Xp6z3fM6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 15:49:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jp720ulL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jp720ulL;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFnKG315Pz3bnV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 15:49:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683611346; x=1715147346;
  h=date:from:to:cc:subject:message-id;
  bh=ZQCbA40J094c22LA9lua1fYuVplCuSzZ0Y0W8vvuslk=;
  b=Jp720ulLBw5vQJMUyg/HbUzA61a+l7/2mgbrfaN7lIJsyGMDopbletwo
   H0lxNUx35npsHC8CQzhFYjsaERT1WtveHIiSSbILOU6QVDXbcFjo3hlNg
   mcnw+hlV5vhAfsn6AlNjGit87pGReOhRzyooQ8t+/gdamDeJTZFTZcSJr
   Bf+HbdhL6rgbXq62HlkiCpB2LiQPGGMGBmG7DPCoVdagoQxW70WPP0Xg9
   g9zwCrH5QQQr/FXOoJsP1S1K5vOe5juGNohKNucP7trYXs4l0mwcasRW3
   ChiImsFkjbLhqvhb8hYfthe1KWeKp81eZmI6iHQcKqZCn3c4mNCztgh6Y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="347276522"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="347276522"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 22:49:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="729342920"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="729342920"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 May 2023 22:49:03 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwGDe-0001nV-2J;
	Tue, 09 May 2023 05:49:02 +0000
Date: Tue, 09 May 2023 13:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 547124f858ea52b2f7e58e8c0d39170a9fa66b4b
Message-ID: <20230509054840.9h_HS%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 547124f858ea52b2f7e58e8c0d39170a9fa66b4b  powerpc/ci: Fix build of ppc64le allyesconfig

elapsed time: 732m

configs tested: 130
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r004-20230508   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r026-20230507   gcc  
arc                  randconfig-r043-20230507   gcc  
arc                  randconfig-r043-20230508   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r005-20230507   clang
arm                  randconfig-r014-20230508   clang
arm                  randconfig-r036-20230507   clang
arm                  randconfig-r046-20230507   gcc  
arm                  randconfig-r046-20230508   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230508   clang
arm64                               defconfig   gcc  
arm64                randconfig-r011-20230507   clang
csky         buildonly-randconfig-r001-20230508   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230507   gcc  
hexagon      buildonly-randconfig-r006-20230508   clang
hexagon              randconfig-r006-20230507   clang
hexagon              randconfig-r041-20230507   clang
hexagon              randconfig-r041-20230508   clang
hexagon              randconfig-r045-20230507   clang
hexagon              randconfig-r045-20230508   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r005-20230508   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230508   clang
i386                 randconfig-a002-20230508   clang
i386                 randconfig-a003-20230508   clang
i386                 randconfig-a004-20230508   clang
i386                 randconfig-a005-20230508   clang
i386                 randconfig-a006-20230508   clang
i386                 randconfig-a011-20230508   gcc  
i386                 randconfig-a012-20230508   gcc  
i386                 randconfig-a013-20230508   gcc  
i386                 randconfig-a014-20230508   gcc  
i386                 randconfig-a015-20230508   gcc  
i386                 randconfig-a016-20230508   gcc  
i386                 randconfig-r002-20230508   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r003-20230507   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r001-20230508   gcc  
ia64                 randconfig-r034-20230507   gcc  
ia64                 randconfig-r036-20230508   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r022-20230508   gcc  
loongarch            randconfig-r023-20230507   gcc  
loongarch            randconfig-r025-20230508   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r006-20230507   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r016-20230507   gcc  
microblaze           randconfig-r004-20230508   gcc  
microblaze           randconfig-r011-20230508   gcc  
microblaze           randconfig-r022-20230507   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r034-20230508   gcc  
mips                 randconfig-r035-20230507   clang
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230507   gcc  
nios2                randconfig-r014-20230507   gcc  
nios2                randconfig-r021-20230507   gcc  
openrisc     buildonly-randconfig-r002-20230507   gcc  
openrisc             randconfig-r001-20230507   gcc  
openrisc             randconfig-r013-20230507   gcc  
openrisc             randconfig-r015-20230507   gcc  
openrisc             randconfig-r021-20230508   gcc  
openrisc             randconfig-r023-20230508   gcc  
openrisc             randconfig-r032-20230507   gcc  
parisc       buildonly-randconfig-r004-20230507   gcc  
parisc       buildonly-randconfig-r005-20230507   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r012-20230508   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r005-20230508   clang
powerpc              randconfig-r006-20230508   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r024-20230507   clang
riscv                randconfig-r042-20230507   clang
riscv                randconfig-r042-20230508   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230508   clang
s390                 randconfig-r044-20230507   clang
s390                 randconfig-r044-20230508   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r013-20230508   gcc  
sh                   randconfig-r025-20230507   gcc  
sh                   randconfig-r026-20230508   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r035-20230508   gcc  
sparc64              randconfig-r033-20230507   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r003-20230508   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230508   clang
x86_64               randconfig-a002-20230508   clang
x86_64               randconfig-a003-20230508   clang
x86_64               randconfig-a004-20230508   clang
x86_64               randconfig-a005-20230508   clang
x86_64               randconfig-a006-20230508   clang
x86_64               randconfig-a011-20230508   gcc  
x86_64               randconfig-a012-20230508   gcc  
x86_64               randconfig-a013-20230508   gcc  
x86_64               randconfig-a014-20230508   gcc  
x86_64               randconfig-a015-20230508   gcc  
x86_64               randconfig-a016-20230508   gcc  
x86_64               randconfig-r033-20230508   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
