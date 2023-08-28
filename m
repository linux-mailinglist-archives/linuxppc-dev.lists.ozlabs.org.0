Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9A278A4EC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 06:23:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GMn4RuwC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RYy9f0zJHz3bhc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 14:23:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GMn4RuwC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RYy8j0BHjz2yQ8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 14:22:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693196581; x=1724732581;
  h=date:from:to:cc:subject:message-id;
  bh=lads60Fa3uv186zG6qd5NbieGwIEp6hFTtkpxF1UFY4=;
  b=GMn4RuwCjFdzu31h5VqnDOTdT9wQKaIW5J1ibh4iU5c/qJJQNWytyv6u
   VOCdyqOkGtJR4n+HQbdNpkQ7WK6RVcsFzaT4i6F16oDaPzq3jgfZjt81C
   b0/Wg8tVxiKfnfSFQoO1yzDtAfzET85Od7xsRYthmUdczxuylmRvtZrk6
   vMLBvVrY5LukgDWQd5U7HKNE2ny7w0/t9qL/TU4vv4vjjZEd4bBzCjs0g
   9RDNifH1oqotlKKUmQzmb/uUa+fGuFZajAP6KG4TNDL7WCM7vNDOVzZfm
   Ns1WgTSWob78swmdhuGUdNBC9EtCWBZRDVK7FKCJdBAs6y281IkGxTrw5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="372408192"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="372408192"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 21:22:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="731697496"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="731697496"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 27 Aug 2023 21:22:51 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaTm6-0007UV-2N;
	Mon, 28 Aug 2023 04:22:50 +0000
Date: Mon, 28 Aug 2023 12:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD REGRESSION
 c37b6908f7b2bd24dcaaf14a180e28c9132b9c58
Message-ID: <202308281219.gEHbt3QM-lkp@intel.com>
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
branch HEAD: c37b6908f7b2bd24dcaaf14a180e28c9132b9c58  powerpc/iommu: Fix notifiers being shared by PCI and VIO buses

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202308260344.Vc4Giuk7-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308272310.O7VMTwkZ-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/powerpc/mm/init_64.c:477:45: error: 'SECTION_SIZE_BITS' undeclared (first use in this function)
arch/powerpc/xmon/xmon.c:489:12: error: stack frame size (2160) exceeds limit (2048) in 'xmon_core' [-Werror,-Wframe-larger-than]
include/linux/memory.h:23:43: error: 'SECTION_SIZE_BITS' undeclared (first use in this function)

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- powerpc64-randconfig-r021-20230827
    |-- arch-powerpc-mm-init_64.c:error:SECTION_SIZE_BITS-undeclared-(first-use-in-this-function)
    `-- include-linux-memory.h:error:SECTION_SIZE_BITS-undeclared-(first-use-in-this-function)
clang_recent_errors
`-- powerpc64-randconfig-r006-20230825
    `-- arch-powerpc-xmon-xmon.c:error:stack-frame-size-()-exceeds-limit-()-in-xmon_core-Werror-Wframe-larger-than

elapsed time: 3719m

configs tested: 185
configs skipped: 25

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r011-20230827   gcc  
alpha                randconfig-r036-20230827   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230826   gcc  
arc                   randconfig-001-20230827   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230826   gcc  
arm                   randconfig-001-20230827   clang
arm                  randconfig-r001-20230827   gcc  
arm                  randconfig-r013-20230827   clang
arm                  randconfig-r021-20230827   clang
arm                  randconfig-r024-20230827   clang
arm                  randconfig-r032-20230827   gcc  
arm                  randconfig-r033-20230827   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r014-20230827   gcc  
arm64                randconfig-r022-20230826   clang
arm64                randconfig-r023-20230826   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r031-20230827   gcc  
hexagon               randconfig-001-20230826   clang
hexagon               randconfig-002-20230826   clang
hexagon              randconfig-r034-20230827   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230827   clang
i386         buildonly-randconfig-002-20230827   clang
i386         buildonly-randconfig-003-20230827   clang
i386         buildonly-randconfig-004-20230827   clang
i386         buildonly-randconfig-005-20230827   clang
i386         buildonly-randconfig-006-20230827   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230827   clang
i386                  randconfig-011-20230827   gcc  
i386                  randconfig-012-20230827   gcc  
i386                  randconfig-013-20230827   gcc  
i386                  randconfig-014-20230827   gcc  
i386                  randconfig-015-20230827   gcc  
i386                  randconfig-016-20230827   gcc  
i386                 randconfig-r024-20230827   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230826   gcc  
loongarch             randconfig-001-20230827   gcc  
loongarch            randconfig-r003-20230827   gcc  
loongarch            randconfig-r024-20230826   gcc  
loongarch            randconfig-r025-20230827   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230827   gcc  
m68k                 randconfig-r025-20230827   gcc  
m68k                 randconfig-r026-20230827   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r022-20230827   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r015-20230827   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r006-20230827   gcc  
nios2                randconfig-r022-20230827   gcc  
nios2                randconfig-r026-20230826   gcc  
nios2                randconfig-r026-20230827   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r002-20230827   gcc  
openrisc             randconfig-r012-20230827   gcc  
openrisc             randconfig-r023-20230827   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230827   gcc  
parisc               randconfig-r011-20230827   gcc  
parisc               randconfig-r022-20230827   gcc  
parisc               randconfig-r035-20230827   gcc  
parisc               randconfig-r036-20230827   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc              randconfig-r012-20230827   gcc  
powerpc              randconfig-r014-20230827   gcc  
powerpc64            randconfig-r001-20230827   clang
powerpc64            randconfig-r006-20230827   clang
powerpc64            randconfig-r021-20230827   gcc  
powerpc64            randconfig-r033-20230827   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230826   gcc  
riscv                randconfig-r005-20230827   clang
riscv                randconfig-r013-20230827   gcc  
riscv                randconfig-r016-20230827   gcc  
riscv                randconfig-r021-20230827   gcc  
riscv                randconfig-r025-20230827   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230826   clang
s390                  randconfig-001-20230827   gcc  
s390                 randconfig-r006-20230827   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r004-20230827   gcc  
sh                   randconfig-r016-20230827   gcc  
sh                   randconfig-r023-20230827   gcc  
sh                   randconfig-r031-20230827   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r003-20230827   gcc  
sparc64              randconfig-r025-20230826   gcc  
sparc64              randconfig-r026-20230827   gcc  
sparc64              randconfig-r033-20230827   gcc  
sparc64              randconfig-r035-20230827   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230827   clang
x86_64       buildonly-randconfig-004-20230827   clang
x86_64       buildonly-randconfig-006-20230827   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-006-20230827   gcc  
x86_64                randconfig-011-20230827   clang
x86_64                randconfig-012-20230827   clang
x86_64                randconfig-013-20230827   clang
x86_64                randconfig-014-20230827   clang
x86_64                randconfig-015-20230827   clang
x86_64                randconfig-016-20230827   clang
x86_64                randconfig-071-20230827   clang
x86_64                randconfig-072-20230827   clang
x86_64                randconfig-073-20230827   clang
x86_64                randconfig-074-20230827   clang
x86_64                randconfig-075-20230827   clang
x86_64                randconfig-076-20230827   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r015-20230827   gcc  
xtensa               randconfig-r021-20230826   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
