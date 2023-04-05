Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B876D71AE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 02:49:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrmHd1RZxz300C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 10:49:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BAZVDz++;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BAZVDz++;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrmGk1JgYz2ypJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Apr 2023 10:48:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680655742; x=1712191742;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jtOJiArtPPfbUsaRorKrw3JNMigv2UmKSlvFRd0zsf8=;
  b=BAZVDz++ZDOB3AB5J63BMxS79jYm3Tw8m8FXoq0+fKB+sh5wG67Yh9cT
   FeN1q+wOEDgYgaRRQi38LI5CNQiMMWJzNBoV+H29TmaimsyVIJJY4+8mg
   jD3uLxjY2STcdILaT5DVBfDZtomNXHmg/uZjU8oRmnpRSsM3h1JI3VKFn
   XSld/1VjD9xk4P3rJ0qT5GGz8hkFgQaThkJ4zfEl0CdUQvtxIdz83Gfcp
   U9oQ0k7O618F0jyDt4h7imYEXwXju8pNKP76b9O3kVibSvCRs22hoiMoD
   +HQ6TUsesTUnXEvZNJuq1F9AWUOUkAap9MB5BDOgAg0hq7PKot5QcbD5o
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="339833795"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="339833795"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 17:48:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="751083463"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="751083463"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 Apr 2023 17:48:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjrKU-000Q8a-1n;
	Wed, 05 Apr 2023 00:48:50 +0000
Date: Wed, 05 Apr 2023 08:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS WITH WARNING
 639e8992872c632f27b130b403e263eae966231e
Message-ID: <642cc56c.OD4sfWpbCcGwdFD/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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
branch HEAD: 639e8992872c632f27b130b403e263eae966231e  powerpc/ci: Add smart sparse diffing

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202304042327.blhF5nCp-lkp@intel.com

Warning: (recently discovered and may have been fixed)

.github/problem-matchers/sparse.json: warning: ignored by one of the .gitignore files

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- alpha-defconfig
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- alpha-randconfig-r021-20230403
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- alpha-randconfig-r024-20230403
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- alpha-randconfig-r026-20230403
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- alpha-randconfig-r036-20230403
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- arc-allyesconfig
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- arc-buildonly-randconfig-r003-20230403
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- arc-defconfig
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- arc-randconfig-r022-20230403
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- arc-randconfig-r033-20230403
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- arc-randconfig-r043-20230403
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- arm-allmodconfig
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- arm-allyesconfig
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- arm-defconfig
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- arm-randconfig-r034-20230403
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- arm64-allyesconfig
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- arm64-defconfig
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- csky-defconfig
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- i386-allyesconfig
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- i386-debian-10.3
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- i386-defconfig
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- i386-randconfig-a011-20230403
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- i386-randconfig-a012-20230403
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files
|-- i386-randconfig-a013-20230403
|   `-- github-problem-matchers-sparse.json:warning:ignored-by-one-of-the-.gitignore-files

elapsed time: 727m

configs tested: 139
configs skipped: 8

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r015-20230403   gcc  
alpha                randconfig-r021-20230403   gcc  
alpha                randconfig-r024-20230403   gcc  
alpha                randconfig-r026-20230403   gcc  
alpha                randconfig-r036-20230403   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r003-20230403   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r011-20230403   gcc  
arc                  randconfig-r013-20230403   gcc  
arc                  randconfig-r022-20230403   gcc  
arc                  randconfig-r033-20230403   gcc  
arc                  randconfig-r043-20230403   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r034-20230403   gcc  
arm                  randconfig-r046-20230403   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r031-20230403   gcc  
hexagon              randconfig-r041-20230403   clang
hexagon              randconfig-r045-20230403   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r002-20230403   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230403   clang
i386                 randconfig-a002-20230403   clang
i386                 randconfig-a003-20230403   clang
i386                 randconfig-a004-20230403   clang
i386                 randconfig-a005-20230403   clang
i386                 randconfig-a006-20230403   clang
i386                 randconfig-a011-20230403   gcc  
i386                 randconfig-a012-20230403   gcc  
i386                 randconfig-a013-20230403   gcc  
i386                 randconfig-a014-20230403   gcc  
i386                 randconfig-a015-20230403   gcc  
i386                 randconfig-a016-20230403   gcc  
i386                 randconfig-r021-20230403   gcc  
i386                 randconfig-r022-20230403   gcc  
i386                 randconfig-r023-20230403   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r002-20230403   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r012-20230403   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r013-20230403   gcc  
loongarch            randconfig-r021-20230403   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r012-20230403   gcc  
m68k                 randconfig-r016-20230403   gcc  
m68k                 randconfig-r024-20230403   gcc  
m68k                 randconfig-r032-20230403   gcc  
microblaze   buildonly-randconfig-r006-20230403   gcc  
microblaze           randconfig-r002-20230403   gcc  
microblaze           randconfig-r004-20230403   gcc  
microblaze           randconfig-r023-20230403   gcc  
microblaze           randconfig-r031-20230403   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r034-20230403   gcc  
mips                 randconfig-r035-20230403   gcc  
mips                 randconfig-r036-20230403   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230403   gcc  
nios2                randconfig-r023-20230403   gcc  
nios2                randconfig-r033-20230403   gcc  
nios2                randconfig-r034-20230403   gcc  
openrisc     buildonly-randconfig-r006-20230403   gcc  
openrisc             randconfig-r006-20230403   gcc  
openrisc             randconfig-r011-20230403   gcc  
openrisc             randconfig-r022-20230403   gcc  
openrisc             randconfig-r035-20230403   gcc  
parisc       buildonly-randconfig-r003-20230403   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r022-20230403   gcc  
parisc               randconfig-r025-20230403   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r025-20230403   gcc  
powerpc              randconfig-r034-20230403   clang
powerpc              randconfig-r035-20230403   clang
powerpc              randconfig-r036-20230403   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r006-20230403   clang
riscv                randconfig-r031-20230403   clang
riscv                randconfig-r042-20230403   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230403   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230403   gcc  
sh           buildonly-randconfig-r005-20230403   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230403   gcc  
sparc                randconfig-r004-20230403   gcc  
sparc                randconfig-r032-20230403   gcc  
sparc64              randconfig-r001-20230403   gcc  
sparc64              randconfig-r014-20230403   gcc  
sparc64              randconfig-r024-20230403   gcc  
sparc64              randconfig-r025-20230403   gcc  
sparc64              randconfig-r026-20230403   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r005-20230403   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230403   clang
x86_64               randconfig-a002-20230403   clang
x86_64               randconfig-a003-20230403   clang
x86_64               randconfig-a004-20230403   clang
x86_64               randconfig-a005-20230403   clang
x86_64               randconfig-a006-20230403   clang
x86_64               randconfig-a011-20230403   gcc  
x86_64               randconfig-a012-20230403   gcc  
x86_64               randconfig-a013-20230403   gcc  
x86_64               randconfig-a014-20230403   gcc  
x86_64               randconfig-a015-20230403   gcc  
x86_64               randconfig-a016-20230403   gcc  
x86_64               randconfig-r005-20230403   clang
x86_64               randconfig-r014-20230403   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230403   gcc  
xtensa               randconfig-r023-20230403   gcc  
xtensa               randconfig-r026-20230403   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
