Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD609923D70
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 14:16:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DdrlVlRv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD21t4b9lz3fvy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 22:16:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DdrlVlRv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD21B32Q6z3fmX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 22:15:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719922527; x=1751458527;
  h=date:from:to:cc:subject:message-id;
  bh=3QrvNJ3799WBAdLsNk7R3y5d0ax8/f6LoHwnAzK8q4s=;
  b=DdrlVlRvYWoUUF5cdUFOpbi96IgvyH7/Z18Alq9h3JauxN26GOyOo3ra
   dgnPxNrhdmYDCMXlNOXhNm/8QfDvosAUXX3Bz5jk2EEYvrZ4NRufkTQq0
   PlGvHrDC4CTGYbOds0hVrCqXnrJyz/lDfsjKJJiccCckYMuF7OkvN5hVF
   EWMvHfpltd15F8Gm3aZGPfM7Rm2/NyBvwV2m6CmXiH0Org5PKym+H6QhT
   peTmDxAlxiLhABjDRopSmThOXX4lRT8ntar0yjWOyQhRHIzSW7fclUVLZ
   iT4uz+8SYQ9Qw35Xb4vvqj3LBsaCSo18lr7+cbuNec82i2AqoP8fKTODI
   A==;
X-CSE-ConnectionGUID: Nn4xWYmdTeqwwOQznVc+8g==
X-CSE-MsgGUID: tERcu7FHTbCvc8nVMlEeQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="27692870"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="27692870"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 05:15:22 -0700
X-CSE-ConnectionGUID: P/ruYM09Q8qdRAOdYzvihA==
X-CSE-MsgGUID: baHwJiqSSxStTLJi3vBoEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="50835245"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Jul 2024 05:15:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOcPm-000O9G-0L;
	Tue, 02 Jul 2024 12:15:18 +0000
Date: Tue, 02 Jul 2024 20:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 c34444c6ca37844c93506314d2b824de443654eb
Message-ID: <202407022024.XY6g89b1-lkp@intel.com>
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
branch HEAD: c34444c6ca37844c93506314d2b824de443654eb  powerpc/ci: Use Fedora 40 for all builds

elapsed time: 1456m

configs tested: 189
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240702   gcc-13.2.0
arc                   randconfig-002-20240702   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                       omap2plus_defconfig   gcc-13.2.0
arm                   randconfig-001-20240702   gcc-13.2.0
arm                   randconfig-002-20240702   gcc-13.2.0
arm                   randconfig-003-20240702   gcc-13.2.0
arm                   randconfig-004-20240702   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240702   gcc-13.2.0
arm64                 randconfig-002-20240702   clang-19
arm64                 randconfig-002-20240702   gcc-13.2.0
arm64                 randconfig-003-20240702   gcc-13.2.0
arm64                 randconfig-004-20240702   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240702   gcc-13.2.0
csky                  randconfig-002-20240702   gcc-13.2.0
hexagon                           allnoconfig   clang-19
hexagon               randconfig-001-20240702   clang-19
hexagon               randconfig-002-20240702   clang-19
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240702   gcc-13
i386         buildonly-randconfig-002-20240702   gcc-10
i386         buildonly-randconfig-002-20240702   gcc-13
i386         buildonly-randconfig-003-20240702   gcc-13
i386         buildonly-randconfig-004-20240702   clang-18
i386         buildonly-randconfig-004-20240702   gcc-13
i386         buildonly-randconfig-005-20240702   gcc-10
i386         buildonly-randconfig-005-20240702   gcc-13
i386         buildonly-randconfig-006-20240702   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240702   gcc-10
i386                  randconfig-001-20240702   gcc-13
i386                  randconfig-002-20240702   gcc-12
i386                  randconfig-002-20240702   gcc-13
i386                  randconfig-003-20240702   gcc-13
i386                  randconfig-004-20240702   gcc-13
i386                  randconfig-005-20240702   gcc-10
i386                  randconfig-005-20240702   gcc-13
i386                  randconfig-006-20240702   clang-18
i386                  randconfig-006-20240702   gcc-13
i386                  randconfig-011-20240702   gcc-13
i386                  randconfig-011-20240702   gcc-9
i386                  randconfig-012-20240702   clang-18
i386                  randconfig-012-20240702   gcc-13
i386                  randconfig-013-20240702   gcc-11
i386                  randconfig-013-20240702   gcc-13
i386                  randconfig-014-20240702   clang-18
i386                  randconfig-014-20240702   gcc-13
i386                  randconfig-015-20240702   clang-18
i386                  randconfig-015-20240702   gcc-13
i386                  randconfig-016-20240702   clang-18
i386                  randconfig-016-20240702   gcc-13
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240702   gcc-13.2.0
loongarch             randconfig-002-20240702   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                          amiga_defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                          hp300_defconfig   gcc-13.2.0
m68k                          multi_defconfig   gcc-13.2.0
m68k                        mvme147_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                         cobalt_defconfig   gcc-13.2.0
mips                      maltaaprp_defconfig   gcc-13.2.0
mips                        maltaup_defconfig   gcc-13.2.0
mips                       rbtx49xx_defconfig   gcc-13.2.0
mips                          rm200_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240702   gcc-13.2.0
nios2                 randconfig-002-20240702   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240702   gcc-13.2.0
parisc                randconfig-002-20240702   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   gcc-13.2.0
powerpc                      arches_defconfig   gcc-13.2.0
powerpc                      pcm030_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240702   gcc-13.2.0
powerpc               randconfig-002-20240702   clang-16
powerpc               randconfig-002-20240702   gcc-13.2.0
powerpc               randconfig-003-20240702   gcc-13.2.0
powerpc                 xes_mpc85xx_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240702   clang-19
powerpc64             randconfig-001-20240702   gcc-13.2.0
powerpc64             randconfig-002-20240702   gcc-13.2.0
powerpc64             randconfig-003-20240702   gcc-13.2.0
riscv                            allmodconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
riscv                 randconfig-001-20240702   gcc-13.2.0
riscv                 randconfig-002-20240702   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                             allyesconfig   clang-19
s390                                defconfig   gcc-13.2.0
s390                  randconfig-001-20240702   clang-19
s390                  randconfig-001-20240702   gcc-13.2.0
s390                  randconfig-002-20240702   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                            hp6xx_defconfig   gcc-13.2.0
sh                          landisk_defconfig   gcc-13.2.0
sh                    randconfig-001-20240702   gcc-13.2.0
sh                    randconfig-002-20240702   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240702   gcc-13.2.0
sparc64               randconfig-002-20240702   gcc-13.2.0
um                               allmodconfig   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                               allyesconfig   gcc-13.2.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240702   gcc-13.2.0
um                    randconfig-002-20240702   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240702   gcc-8
x86_64       buildonly-randconfig-002-20240702   gcc-8
x86_64       buildonly-randconfig-003-20240702   gcc-8
x86_64       buildonly-randconfig-004-20240702   gcc-8
x86_64       buildonly-randconfig-005-20240702   gcc-8
x86_64       buildonly-randconfig-006-20240702   gcc-8
x86_64                              defconfig   clang-18
x86_64                                  kexec   clang-18
x86_64                randconfig-001-20240702   gcc-8
x86_64                randconfig-002-20240702   gcc-8
x86_64                randconfig-003-20240702   gcc-8
x86_64                randconfig-004-20240702   gcc-8
x86_64                randconfig-005-20240702   gcc-8
x86_64                randconfig-006-20240702   gcc-8
x86_64                randconfig-011-20240702   gcc-8
x86_64                randconfig-012-20240702   gcc-8
x86_64                randconfig-013-20240702   gcc-8
x86_64                randconfig-014-20240702   gcc-8
x86_64                randconfig-015-20240702   gcc-8
x86_64                randconfig-016-20240702   gcc-8
x86_64                randconfig-071-20240702   gcc-8
x86_64                randconfig-072-20240702   gcc-8
x86_64                randconfig-073-20240702   gcc-8
x86_64                randconfig-074-20240702   gcc-8
x86_64                randconfig-075-20240702   gcc-8
x86_64                randconfig-076-20240702   gcc-8
x86_64                           rhel-8.3-bpf   clang-18
x86_64                          rhel-8.3-func   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240702   gcc-13.2.0
xtensa                randconfig-002-20240702   gcc-13.2.0
xtensa                         virt_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
