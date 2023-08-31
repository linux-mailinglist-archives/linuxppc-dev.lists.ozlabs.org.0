Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE2778E60B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 07:58:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FPJq0I1E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rbr6v3k9Rz3bxZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 15:57:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FPJq0I1E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rbr620rNrz300g
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 15:57:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693461434; x=1724997434;
  h=date:from:to:cc:subject:message-id;
  bh=rd12n6opmg48ZnsE8i9qGrAPKrN/MwV5kypG6gyea+c=;
  b=FPJq0I1E4/XSFBf+f9lpnWzsIkuGqfzusNCNdg3GGXDlJKGtOq3d9K2t
   LHjvZoHmKYU0c/JNbIAa+Vhc0zyg2sJq3WMgRakzcpmRHxNqW5rX00Xzz
   kAiRwNiE/llLAFbMtQi4QChAVaE56jhYMllp6dbLOJyVVUtej/sTOAWPZ
   004Kak1IOdCquFUCBY+RHy2WhKOuuhecrDfSZKMAVYBibgn7OeSI/jTAk
   lateFBm3jrT3c2IJGNRCOYYOYqi6SfSDmO+qqMj3rfC2TiIoPo5LQGyhi
   FXG1gCOnNwh3aXwdMHvzpbvmG9wYYFIGkMId1xR69gi74FSqP0iLQ/S6V
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="373224149"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="373224149"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 22:57:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="809429592"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="809429592"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 30 Aug 2023 22:57:07 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbafz-000AsI-2v;
	Thu, 31 Aug 2023 05:57:07 +0000
Date: Thu, 31 Aug 2023 13:56:54 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 90bae4d99beb1f31d8bde7c438a36e8875ae6090
Message-ID: <202308311351.wEFrcn42-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 90bae4d99beb1f31d8bde7c438a36e8875ae6090  powerpc/xmon: Reapply "Relax frame size for clang"

elapsed time: 2357m

configs tested: 191
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r011-20230829   gcc  
alpha                randconfig-r036-20230829   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230829   gcc  
arc                  randconfig-r014-20230829   gcc  
arc                  randconfig-r016-20230829   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230829   clang
arm                  randconfig-r016-20230829   clang
arm                  randconfig-r035-20230829   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230829   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230829   gcc  
csky                 randconfig-r005-20230829   gcc  
csky                 randconfig-r021-20230829   gcc  
csky                 randconfig-r035-20230829   gcc  
hexagon               randconfig-001-20230829   clang
hexagon               randconfig-002-20230829   clang
hexagon              randconfig-r002-20230829   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230829   clang
i386         buildonly-randconfig-001-20230830   clang
i386         buildonly-randconfig-002-20230829   clang
i386         buildonly-randconfig-002-20230830   clang
i386         buildonly-randconfig-003-20230829   clang
i386         buildonly-randconfig-003-20230830   clang
i386         buildonly-randconfig-004-20230829   clang
i386         buildonly-randconfig-004-20230830   clang
i386         buildonly-randconfig-005-20230829   clang
i386         buildonly-randconfig-005-20230830   clang
i386         buildonly-randconfig-006-20230829   clang
i386         buildonly-randconfig-006-20230830   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230830   clang
i386                  randconfig-002-20230830   clang
i386                  randconfig-003-20230830   clang
i386                  randconfig-004-20230830   clang
i386                  randconfig-005-20230830   clang
i386                  randconfig-006-20230830   clang
i386                  randconfig-011-20230829   gcc  
i386                  randconfig-012-20230829   gcc  
i386                  randconfig-013-20230829   gcc  
i386                  randconfig-014-20230829   gcc  
i386                  randconfig-015-20230829   gcc  
i386                  randconfig-016-20230829   gcc  
i386                 randconfig-r011-20230829   gcc  
i386                 randconfig-r034-20230829   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230829   gcc  
loongarch            randconfig-r003-20230829   gcc  
loongarch            randconfig-r034-20230829   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r013-20230829   gcc  
microblaze           randconfig-r015-20230829   gcc  
microblaze           randconfig-r024-20230829   gcc  
microblaze           randconfig-r026-20230829   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r031-20230829   gcc  
mips                 randconfig-r033-20230829   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r032-20230829   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r021-20230829   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc              randconfig-r006-20230829   clang
powerpc              randconfig-r012-20230829   gcc  
powerpc64            randconfig-r014-20230829   gcc  
powerpc64            randconfig-r022-20230829   gcc  
powerpc64            randconfig-r025-20230829   gcc  
powerpc64            randconfig-r033-20230829   clang
powerpc64            randconfig-r036-20230829   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230829   clang
riscv                randconfig-r006-20230829   clang
riscv                randconfig-r022-20230829   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230829   gcc  
s390                 randconfig-r025-20230829   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r023-20230829   gcc  
sh                   randconfig-r032-20230829   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230829   gcc  
sparc                randconfig-r002-20230829   gcc  
sparc                randconfig-r013-20230829   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r001-20230829   gcc  
sparc64              randconfig-r003-20230829   gcc  
sparc64              randconfig-r005-20230829   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r012-20230829   clang
um                   randconfig-r015-20230829   clang
um                   randconfig-r023-20230829   clang
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
x86_64                randconfig-011-20230830   clang
x86_64                randconfig-012-20230830   clang
x86_64                randconfig-013-20230830   clang
x86_64                randconfig-014-20230830   clang
x86_64                randconfig-015-20230830   clang
x86_64                randconfig-016-20230830   clang
x86_64                randconfig-071-20230830   clang
x86_64                randconfig-072-20230830   clang
x86_64                randconfig-073-20230830   clang
x86_64                randconfig-074-20230830   clang
x86_64                randconfig-075-20230830   clang
x86_64                randconfig-076-20230830   clang
x86_64               randconfig-r026-20230829   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r024-20230829   gcc  
xtensa               randconfig-r031-20230829   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
