Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB0C875C89
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 03:52:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EQZNsTaM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrW0y5XtYz3vZG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 13:52:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EQZNsTaM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrW0C2Dn6z3cDk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 13:51:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709866299; x=1741402299;
  h=date:from:to:cc:subject:message-id;
  bh=tlC3k3blA6UkbWvPNkYxuOaDI0WYEP8AD8+tVKEH5wI=;
  b=EQZNsTaMRPma8EXS4T1U7DhOvyfbd5IEJn7pyMhNshmHFkaXh3l+56bg
   sAuTi3Q4NrkioAxJJylVYwDxENCoMunFXpNXnW8GFGJ3FiLSasp7UZaz0
   lj5J8nsebzYa1WxnLTzfIzY+GIvyJFpxhN38ALDDNPfQv/gHYRjsJezXI
   /QSN9zVXdXeJ2O6UInYNqPI0dOR3LYAKsuy6ubVq+niE8WEXxoA/+evj8
   h1jtI44rpXERr4HhNin34snBZlNhKoOD/8eZdeK457IGp7DXNEXzcNREX
   23xtf6rAJY2653o9mxwAYOWItDXS3IwR6y1gd6JTV27M2J1TV5pBjiHIi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15295646"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="15295646"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 18:51:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="47801229"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Mar 2024 18:51:32 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riQKX-0005wn-1s;
	Fri, 08 Mar 2024 02:51:29 +0000
Date: Fri, 08 Mar 2024 10:51:03 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 9db2235326c4b868b6e065dfa3a69011ee570848
Message-ID: <202403081059.1Taaj2cH-lkp@intel.com>
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
branch HEAD: 9db2235326c4b868b6e065dfa3a69011ee570848  powerpc/macio: Make remove callback of macio driver void returned

elapsed time: 811m

configs tested: 166
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arm                              alldefconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   gcc  
arm                                 defconfig   clang
arm                        neponset_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                        shmobile_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240307   clang
i386         buildonly-randconfig-001-20240308   clang
i386         buildonly-randconfig-002-20240307   gcc  
i386         buildonly-randconfig-002-20240308   clang
i386         buildonly-randconfig-003-20240307   clang
i386         buildonly-randconfig-003-20240308   gcc  
i386         buildonly-randconfig-004-20240307   gcc  
i386         buildonly-randconfig-004-20240308   gcc  
i386         buildonly-randconfig-005-20240307   gcc  
i386         buildonly-randconfig-005-20240308   gcc  
i386         buildonly-randconfig-006-20240307   clang
i386         buildonly-randconfig-006-20240308   clang
i386                                defconfig   clang
i386                  randconfig-001-20240307   gcc  
i386                  randconfig-001-20240308   clang
i386                  randconfig-002-20240307   gcc  
i386                  randconfig-002-20240308   clang
i386                  randconfig-003-20240307   clang
i386                  randconfig-003-20240308   clang
i386                  randconfig-004-20240307   gcc  
i386                  randconfig-004-20240308   gcc  
i386                  randconfig-005-20240307   gcc  
i386                  randconfig-005-20240308   clang
i386                  randconfig-006-20240307   clang
i386                  randconfig-006-20240308   clang
i386                  randconfig-011-20240307   clang
i386                  randconfig-011-20240308   gcc  
i386                  randconfig-012-20240307   gcc  
i386                  randconfig-012-20240308   clang
i386                  randconfig-013-20240307   clang
i386                  randconfig-013-20240308   clang
i386                  randconfig-014-20240307   clang
i386                  randconfig-014-20240308   clang
i386                  randconfig-015-20240307   clang
i386                  randconfig-015-20240308   gcc  
i386                  randconfig-016-20240307   clang
i386                  randconfig-016-20240308   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                           ip28_defconfig   gcc  
mips                     loongson1c_defconfig   gcc  
mips                   sb1250_swarm_defconfig   gcc  
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
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      ppc64e_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                     tqm8560_defconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          rsk7201_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                            titan_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-002-20240308   gcc  
x86_64       buildonly-randconfig-003-20240308   gcc  
x86_64       buildonly-randconfig-005-20240308   gcc  
x86_64       buildonly-randconfig-006-20240308   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240308   gcc  
x86_64                randconfig-005-20240308   gcc  
x86_64                randconfig-006-20240308   gcc  
x86_64                randconfig-012-20240308   gcc  
x86_64                randconfig-015-20240308   gcc  
x86_64                randconfig-016-20240308   gcc  
x86_64                randconfig-072-20240308   gcc  
x86_64                randconfig-073-20240308   gcc  
x86_64                randconfig-074-20240308   gcc  
x86_64                randconfig-075-20240308   gcc  
x86_64                randconfig-076-20240308   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                       common_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
