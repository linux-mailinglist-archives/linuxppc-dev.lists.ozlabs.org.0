Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A6E78E5EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 07:48:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UI8xvLa2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbqvQ1s4lz3bxZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 15:48:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UI8xvLa2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbqtT5wp8z2yh2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 15:47:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693460833; x=1724996833;
  h=date:from:to:cc:subject:message-id;
  bh=08MniM72BAKwXnew8kj07+FiajjXooIRwknumxNeC3A=;
  b=UI8xvLa21/SiHHznrk891f6G7YDwxgyakttQd4sVi83uDLCLbcCvBSgY
   ryLXwmymC7kVN0Okb2ir3ndQkbauou2JSeVY5qDp9g9Jh6IoST/SMLUgJ
   R9BHe1EHRzumtwNNT8PaXTmWPO2USzfu3yjOPepNj7fUF8OiZi85ktlKw
   0x/t/9WC+kuNNjrjp8vmoKi+BVmY3basPzu5JX6vnaxYul6xfOM5tx3Y2
   e0j2Xj2aqDj8AlNFd/MXU25DkJGWkVEE0mcSIJr265fp4PqGPC7Kcxca8
   jV8l9VxaMxumLyW1b0vgGf/VZUpOoiKQO1qPMLILyWwfxQeDtZpfovcIr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="356136762"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="356136762"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 22:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="739346776"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="739346776"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Aug 2023 22:47:04 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbaWG-000AjV-0k;
	Thu, 31 Aug 2023 05:47:04 +0000
Date: Thu, 31 Aug 2023 13:46:16 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 54ab446adbe66e7b3bf489afbba93ce402d67884
Message-ID: <202308311314.urtxqUVq-lkp@intel.com>
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
branch HEAD: 54ab446adbe66e7b3bf489afbba93ce402d67884  powerpc/ci: Enable DEBUG_ATOMIC_SLEEP for pmac32

elapsed time: 2347m

configs tested: 178
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230829   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230829   gcc  
arc                  randconfig-r003-20230829   gcc  
arc                  randconfig-r014-20230829   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                   randconfig-001-20230829   clang
arm                        shmobile_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230829   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230829   gcc  
csky                 randconfig-r011-20230829   gcc  
hexagon               randconfig-001-20230829   clang
hexagon               randconfig-002-20230829   clang
hexagon              randconfig-r021-20230829   clang
hexagon              randconfig-r022-20230829   clang
hexagon              randconfig-r023-20230829   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230830   clang
i386         buildonly-randconfig-002-20230830   clang
i386         buildonly-randconfig-003-20230830   clang
i386         buildonly-randconfig-004-20230830   clang
i386         buildonly-randconfig-005-20230830   clang
i386         buildonly-randconfig-006-20230830   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230829   clang
i386                  randconfig-002-20230829   clang
i386                  randconfig-003-20230829   clang
i386                  randconfig-004-20230829   clang
i386                  randconfig-005-20230829   clang
i386                  randconfig-006-20230829   clang
i386                  randconfig-011-20230829   gcc  
i386                  randconfig-012-20230829   gcc  
i386                  randconfig-013-20230829   gcc  
i386                  randconfig-014-20230829   gcc  
i386                  randconfig-015-20230829   gcc  
i386                  randconfig-016-20230829   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230829   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                            ar7_defconfig   gcc  
mips                        vocore2_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r024-20230829   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r006-20230829   gcc  
openrisc             randconfig-r012-20230829   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                  mpc885_ads_defconfig   clang
powerpc                      ppc40x_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc              randconfig-r004-20230829   clang
powerpc              randconfig-r015-20230829   gcc  
powerpc                     redwood_defconfig   gcc  
powerpc                     skiroot_defconfig   clang
powerpc                     taishan_defconfig   gcc  
powerpc64            randconfig-r016-20230829   gcc  
powerpc64            randconfig-r034-20230829   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230829   clang
riscv                randconfig-r035-20230829   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230829   gcc  
s390                 randconfig-r032-20230829   clang
s390                 randconfig-r033-20230829   clang
s390                 randconfig-r036-20230829   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r031-20230829   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r025-20230829   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230829   clang
x86_64       buildonly-randconfig-002-20230829   clang
x86_64       buildonly-randconfig-003-20230829   clang
x86_64       buildonly-randconfig-004-20230829   clang
x86_64       buildonly-randconfig-005-20230829   clang
x86_64       buildonly-randconfig-006-20230829   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230829   gcc  
x86_64                randconfig-002-20230829   gcc  
x86_64                randconfig-003-20230829   gcc  
x86_64                randconfig-004-20230829   gcc  
x86_64                randconfig-005-20230829   gcc  
x86_64                randconfig-006-20230829   gcc  
x86_64                randconfig-011-20230829   clang
x86_64                randconfig-012-20230829   clang
x86_64                randconfig-013-20230829   clang
x86_64                randconfig-014-20230829   clang
x86_64                randconfig-015-20230829   clang
x86_64                randconfig-016-20230829   clang
x86_64                randconfig-071-20230829   clang
x86_64                randconfig-072-20230829   clang
x86_64                randconfig-073-20230829   clang
x86_64                randconfig-074-20230829   clang
x86_64                randconfig-075-20230829   clang
x86_64                randconfig-076-20230829   clang
x86_64               randconfig-r005-20230829   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r026-20230829   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
