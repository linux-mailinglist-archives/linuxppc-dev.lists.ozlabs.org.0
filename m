Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BD278F806
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 07:36:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fSnEYLjL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcRbR73mcz3bT8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 15:36:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fSnEYLjL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcRZW0xmhz2yVm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 15:35:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693546531; x=1725082531;
  h=date:from:to:cc:subject:message-id;
  bh=4BaZGfQG3SN5aCZ34xgNOCdywMDyuw5EQQxnSjenZZk=;
  b=fSnEYLjLG0RgjE2UIXpJbETPju6W7hSmwqpX/thVMY8NRSXe/qSAXwZ8
   PtTEHnTivPT3MRUjeJq4lefg7D+Egfvs+KHxYOczawO1g9HQMx4pKLEL0
   CG2oosC5FIZxr23KIsEm8l+lw7MHcMTFRtYyJxnkvXo1/1a/LNtaOHnd1
   Dkh/PlCJOYYbm9457LzdUupUMpkRcIizBz5sPuoXU/FFug4oXWOj/Bmy2
   4bwIYyktyfVXNY5GlaPjAq52Gs0vMlEWh2fdUCUs9jTXMMJUuUTtgGPUR
   0OdwTnl0HJqVVHx7FYPvswnhuun3Q5NeKMMZxdNmJX2RMJy9x9Q2nDB3V
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="373534282"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="373534282"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 22:35:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="689632287"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="689632287"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 31 Aug 2023 22:35:24 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbwoU-0000v2-0j;
	Fri, 01 Sep 2023 05:35:22 +0000
Date: Fri, 01 Sep 2023 13:34:48 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 85a616416e9e01db0bfa92f26457e92642e2236b
Message-ID: <202309011345.zLA0KA8a-lkp@intel.com>
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
branch HEAD: 85a616416e9e01db0bfa92f26457e92642e2236b  macintosh/ams: linux/platform_device.h is needed

elapsed time: 1038m

configs tested: 229
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230901   gcc  
alpha                randconfig-r012-20230901   gcc  
alpha                randconfig-r014-20230901   gcc  
alpha                randconfig-r032-20230901   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230831   gcc  
arc                   randconfig-001-20230901   gcc  
arc                  randconfig-r002-20230901   gcc  
arc                  randconfig-r004-20230831   gcc  
arc                  randconfig-r011-20230831   gcc  
arc                  randconfig-r015-20230831   gcc  
arc                  randconfig-r023-20230831   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230831   gcc  
arm                   randconfig-001-20230901   clang
arm                  randconfig-r033-20230831   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230901   clang
arm64                randconfig-r011-20230901   gcc  
arm64                randconfig-r013-20230901   gcc  
arm64                randconfig-r015-20230901   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon               randconfig-001-20230831   clang
hexagon               randconfig-001-20230901   clang
hexagon               randconfig-002-20230831   clang
hexagon               randconfig-002-20230901   clang
hexagon              randconfig-r005-20230901   clang
hexagon              randconfig-r013-20230831   clang
hexagon              randconfig-r036-20230901   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230831   gcc  
i386         buildonly-randconfig-002-20230831   gcc  
i386         buildonly-randconfig-003-20230831   gcc  
i386         buildonly-randconfig-004-20230831   gcc  
i386         buildonly-randconfig-005-20230831   gcc  
i386         buildonly-randconfig-006-20230831   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230831   gcc  
i386                  randconfig-002-20230831   gcc  
i386                  randconfig-003-20230831   gcc  
i386                  randconfig-004-20230831   gcc  
i386                  randconfig-005-20230831   gcc  
i386                  randconfig-006-20230831   gcc  
i386                  randconfig-011-20230831   clang
i386                  randconfig-011-20230901   gcc  
i386                  randconfig-012-20230831   clang
i386                  randconfig-012-20230901   gcc  
i386                  randconfig-013-20230831   clang
i386                  randconfig-013-20230901   gcc  
i386                  randconfig-014-20230831   clang
i386                  randconfig-014-20230901   gcc  
i386                  randconfig-015-20230831   clang
i386                  randconfig-016-20230831   clang
i386                 randconfig-r003-20230831   gcc  
i386                 randconfig-r012-20230831   clang
i386                 randconfig-r013-20230831   clang
i386                 randconfig-r022-20230831   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230831   gcc  
loongarch            randconfig-r003-20230901   gcc  
loongarch            randconfig-r012-20230901   gcc  
loongarch            randconfig-r035-20230901   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r015-20230901   gcc  
m68k                 randconfig-r032-20230831   gcc  
m68k                 randconfig-r033-20230831   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r003-20230831   gcc  
microblaze           randconfig-r006-20230831   gcc  
microblaze           randconfig-r014-20230831   gcc  
microblaze           randconfig-r021-20230901   gcc  
microblaze           randconfig-r025-20230901   gcc  
microblaze           randconfig-r031-20230831   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r004-20230901   gcc  
mips                 randconfig-r035-20230831   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r016-20230901   gcc  
nios2                randconfig-r021-20230831   gcc  
nios2                randconfig-r022-20230831   gcc  
nios2                randconfig-r022-20230901   gcc  
nios2                randconfig-r034-20230901   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r003-20230901   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230901   gcc  
parisc               randconfig-r004-20230901   gcc  
parisc               randconfig-r016-20230901   gcc  
parisc               randconfig-r025-20230831   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc              randconfig-r001-20230831   gcc  
powerpc              randconfig-r002-20230831   gcc  
powerpc              randconfig-r005-20230831   gcc  
powerpc              randconfig-r005-20230901   clang
powerpc              randconfig-r016-20230831   clang
powerpc64            randconfig-r023-20230901   gcc  
powerpc64            randconfig-r033-20230901   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230831   gcc  
riscv                 randconfig-001-20230901   clang
riscv                randconfig-r005-20230831   gcc  
riscv                randconfig-r006-20230831   gcc  
riscv                randconfig-r006-20230901   clang
riscv                randconfig-r011-20230901   gcc  
riscv                randconfig-r016-20230831   clang
riscv                randconfig-r026-20230901   gcc  
riscv                randconfig-r031-20230831   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230831   clang
s390                  randconfig-001-20230901   gcc  
s390                 randconfig-r002-20230831   gcc  
s390                 randconfig-r012-20230831   clang
s390                 randconfig-r024-20230831   clang
s390                 randconfig-r031-20230901   clang
s390                 randconfig-r036-20230831   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r014-20230901   gcc  
sh                   randconfig-r035-20230831   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230831   gcc  
sparc                randconfig-r023-20230831   gcc  
sparc                randconfig-r024-20230901   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r006-20230901   gcc  
sparc64              randconfig-r014-20230831   gcc  
sparc64              randconfig-r024-20230831   gcc  
sparc64              randconfig-r034-20230831   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r001-20230831   clang
um                   randconfig-r004-20230831   clang
um                   randconfig-r021-20230831   gcc  
um                   randconfig-r034-20230831   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230831   gcc  
x86_64       buildonly-randconfig-002-20230831   gcc  
x86_64       buildonly-randconfig-003-20230831   gcc  
x86_64       buildonly-randconfig-004-20230831   gcc  
x86_64       buildonly-randconfig-005-20230831   gcc  
x86_64       buildonly-randconfig-006-20230831   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230831   clang
x86_64                randconfig-002-20230831   clang
x86_64                randconfig-003-20230831   clang
x86_64                randconfig-004-20230831   clang
x86_64                randconfig-005-20230831   clang
x86_64                randconfig-006-20230831   clang
x86_64                randconfig-011-20230831   gcc  
x86_64                randconfig-012-20230831   gcc  
x86_64                randconfig-013-20230831   gcc  
x86_64                randconfig-014-20230831   gcc  
x86_64                randconfig-015-20230831   gcc  
x86_64                randconfig-016-20230831   gcc  
x86_64                randconfig-071-20230831   gcc  
x86_64                randconfig-072-20230831   gcc  
x86_64                randconfig-073-20230831   gcc  
x86_64                randconfig-074-20230831   gcc  
x86_64                randconfig-075-20230831   gcc  
x86_64                randconfig-076-20230831   gcc  
x86_64               randconfig-r015-20230831   clang
x86_64               randconfig-r026-20230831   clang
x86_64               randconfig-r032-20230831   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r013-20230901   gcc  
xtensa               randconfig-r025-20230831   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
