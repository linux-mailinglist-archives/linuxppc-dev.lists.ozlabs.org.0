Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A23D76837B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jul 2023 04:41:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DF40+Dtb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RD5Gk3MFlz3cRJ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jul 2023 12:41:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DF40+Dtb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (unknown [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RD5Fl2Frnz2yVG
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jul 2023 12:40:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690684828; x=1722220828;
  h=date:from:to:cc:subject:message-id;
  bh=+QLj0kTA9FLDVgLsUacK38u945LwgZo2SpvlrV197mw=;
  b=DF40+DtbKNk+Tvx/qcdFlY+Mre/Xju0cez6+ENTkiS73rMNofDu8oEgj
   XAeDN871/fim94E2uy5f+G0mOFjCxh+TcsYFZar13Oshet8cH3zmueZYC
   AX8v9EXm+PnhYL3/f491Dw4sXJuVeZMRFX1zdy0TEEqr9bX74lSBwHZcu
   9/1XQk9yQLKfIPJHiVeg0kcVwUFB1xWkPloLPyP74Ya4n/NSDvkVT+BnY
   FBkHP+R8rOq9kwEbNRjaBgfnOMrzKkxHa39zBQbdeRcBMbkquDP76tLaR
   c2Pt0nEzQczPpLp/U9H761OXk6aoq6lP8zbuXrr9fLwwnfbtTI1Z5IQgM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="372437187"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="372437187"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 19:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="731181932"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="731181932"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 29 Jul 2023 19:40:17 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPwLx-0004OZ-0R;
	Sun, 30 Jul 2023 02:40:17 +0000
Date: Sun, 30 Jul 2023 10:40:09 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/cpu-smt] BUILD SUCCESS
 265bb41db415b7132568585ee55a124dd0dbde14
Message-ID: <202307301008.ocyxGHCT-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/cpu-smt
branch HEAD: 265bb41db415b7132568585ee55a124dd0dbde14  powerpc/pseries: Honour current SMT state when DLPAR onlining CPUs

elapsed time: 871m

configs tested: 118
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r024-20230729   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230729   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                          pxa168_defconfig   clang
arm                  randconfig-r046-20230729   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230728   gcc  
csky                                defconfig   gcc  
hexagon                             defconfig   clang
hexagon              randconfig-r006-20230728   clang
hexagon              randconfig-r041-20230729   clang
hexagon              randconfig-r045-20230729   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230729   clang
i386         buildonly-randconfig-r005-20230729   clang
i386         buildonly-randconfig-r006-20230729   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230729   clang
i386                 randconfig-i002-20230729   clang
i386                 randconfig-i003-20230729   clang
i386                 randconfig-i004-20230729   clang
i386                 randconfig-i005-20230729   clang
i386                 randconfig-i006-20230729   clang
i386                 randconfig-i011-20230729   gcc  
i386                 randconfig-i012-20230729   gcc  
i386                 randconfig-i013-20230729   gcc  
i386                 randconfig-i014-20230729   gcc  
i386                 randconfig-i015-20230729   gcc  
i386                 randconfig-i016-20230729   gcc  
i386                 randconfig-r031-20230729   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r011-20230729   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r035-20230729   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   clang
mips                      maltaaprp_defconfig   clang
mips                           mtx1_defconfig   clang
nios2                               defconfig   gcc  
nios2                randconfig-r016-20230729   gcc  
nios2                randconfig-r021-20230729   gcc  
nios2                randconfig-r022-20230729   gcc  
openrisc             randconfig-r026-20230729   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r015-20230729   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc              randconfig-r025-20230729   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230728   gcc  
riscv                randconfig-r042-20230729   gcc  
riscv                          rv32_defconfig   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r036-20230729   clang
s390                 randconfig-r044-20230729   gcc  
sh                               allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230728   gcc  
sparc                randconfig-r003-20230728   gcc  
sparc64              randconfig-r013-20230729   gcc  
sparc64              randconfig-r023-20230729   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r012-20230729   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230729   clang
x86_64       buildonly-randconfig-r002-20230729   clang
x86_64       buildonly-randconfig-r003-20230729   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230729   gcc  
x86_64               randconfig-x002-20230729   gcc  
x86_64               randconfig-x003-20230729   gcc  
x86_64               randconfig-x004-20230729   gcc  
x86_64               randconfig-x005-20230729   gcc  
x86_64               randconfig-x006-20230729   gcc  
x86_64               randconfig-x011-20230728   gcc  
x86_64               randconfig-x012-20230728   gcc  
x86_64               randconfig-x013-20230728   gcc  
x86_64               randconfig-x014-20230728   gcc  
x86_64               randconfig-x015-20230728   gcc  
x86_64               randconfig-x016-20230728   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r002-20230728   gcc  
xtensa               randconfig-r034-20230729   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
