Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB67C7D1BE9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Oct 2023 11:07:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OFuRoHs5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SCFwW5phBz3vX0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Oct 2023 20:07:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OFuRoHs5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SCFvb6t7Kz3dC5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Oct 2023 20:07:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697879228; x=1729415228;
  h=date:from:to:cc:subject:message-id;
  bh=73ajBYuhKdXFzIe4KsGsq9+MSUTUrDI4WH/jpzb2/VM=;
  b=OFuRoHs5i74LrTafxpT+FZ6TrmZXZL4uEQeF5u1DbXAv9rIZe70mUYRj
   E3A6+0c0JZo8xPuF8grtSnUtDIP9mXTngEM0kpMxQpdDJQc8m6a7Jx6LQ
   2hwHjbvWqcbFBWauGx2dBs+mgdr0shgtB3bk1beKgUGHrNu04VKIHj5+4
   Purzij/y2cq/ySQCIBHzOW7RbRk2hOCLI0IceE13gPHPgDXQUG7nk7SG8
   PmX0BRlahgVIwan7HPIMHk5NOypgo6DKOB/G1hGZxDq/xKKDD5rqS9zgU
   18KphqsWFZWtCqBQ9QwD5xYHvdrdOzAo6Jt0IYP2EkQMRDBYgERX8OPwS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="8179726"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="8179726"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 02:07:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="5326820"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Oct 2023 02:05:47 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qu7wf-0004fK-0L;
	Sat, 21 Oct 2023 09:06:57 +0000
Date: Sat, 21 Oct 2023 17:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 a22423ea7c8aa93beb6f325d0b07580880509c04
Message-ID: <202310211714.hoHPZpwP-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: a22423ea7c8aa93beb6f325d0b07580880509c04  powerpc/perf: Fix disabling BHRB and instruction sampling

elapsed time: 2637m

configs tested: 151
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231020   gcc  
arc                   randconfig-001-20231021   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20231021   gcc  
arm64                            alldefconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231021   gcc  
i386         buildonly-randconfig-002-20231021   gcc  
i386         buildonly-randconfig-003-20231021   gcc  
i386         buildonly-randconfig-004-20231021   gcc  
i386         buildonly-randconfig-005-20231021   gcc  
i386         buildonly-randconfig-006-20231021   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231021   gcc  
i386                  randconfig-002-20231021   gcc  
i386                  randconfig-003-20231021   gcc  
i386                  randconfig-004-20231021   gcc  
i386                  randconfig-005-20231021   gcc  
i386                  randconfig-006-20231021   gcc  
i386                  randconfig-011-20231021   gcc  
i386                  randconfig-012-20231021   gcc  
i386                  randconfig-013-20231021   gcc  
i386                  randconfig-014-20231021   gcc  
i386                  randconfig-015-20231021   gcc  
i386                  randconfig-016-20231021   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231020   gcc  
loongarch             randconfig-001-20231021   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                     stx_gp3_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231021   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231021   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231021   gcc  
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
x86_64       buildonly-randconfig-001-20231021   gcc  
x86_64       buildonly-randconfig-002-20231021   gcc  
x86_64       buildonly-randconfig-003-20231021   gcc  
x86_64       buildonly-randconfig-004-20231021   gcc  
x86_64       buildonly-randconfig-005-20231021   gcc  
x86_64       buildonly-randconfig-006-20231021   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231021   gcc  
x86_64                randconfig-002-20231021   gcc  
x86_64                randconfig-003-20231021   gcc  
x86_64                randconfig-004-20231021   gcc  
x86_64                randconfig-005-20231021   gcc  
x86_64                randconfig-006-20231021   gcc  
x86_64                randconfig-011-20231021   gcc  
x86_64                randconfig-012-20231021   gcc  
x86_64                randconfig-013-20231021   gcc  
x86_64                randconfig-014-20231021   gcc  
x86_64                randconfig-015-20231021   gcc  
x86_64                randconfig-016-20231021   gcc  
x86_64                randconfig-071-20231021   gcc  
x86_64                randconfig-072-20231021   gcc  
x86_64                randconfig-073-20231021   gcc  
x86_64                randconfig-074-20231021   gcc  
x86_64                randconfig-075-20231021   gcc  
x86_64                randconfig-076-20231021   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
