Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D24018AAE98
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 14:36:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eigKD7kV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLYzm4VYwz3cfx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 22:36:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eigKD7kV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLYz25mqZz3cTZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 22:35:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713530159; x=1745066159;
  h=date:from:to:cc:subject:message-id;
  bh=uvIwHF4U2cxEYzCSqE1TElD59/RXIRNDGfTaL5os1QQ=;
  b=eigKD7kVI65TIEtn8FNNe4uJ1Y3ijwazuAMqgzWMoxnvBPP5aYWLrEpv
   88q3ucpkMF9wI3YcrRmB+AiRN/XMtKL0TWtAqzRI+kdM9shjVvW3VJikR
   S4dMJLmFP0uM6lcl6wuRG+vi9okkp+a868xo5xSr1xSwig0QM8Y1yLkmu
   L7MvhQCvoDeqcJFdNkNadIxTk0QhlgeMyIHGp6BRzi7ErO3OAtTHFh4NT
   4afjRdxZ4xK259KAJuITCkVfNtzuveFzaGGS3ERPiERjjKiK+bGHhabqE
   eqFW1ap7A6o591tDFJBYgsuGbAS85sWdpFO6F+4RsYQhcIAPOqFCw+bi6
   A==;
X-CSE-ConnectionGUID: aNEN4lhhSCeqG7aMJKlOiQ==
X-CSE-MsgGUID: oL6AsBUwQueOUtrxkeTXzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9349520"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9349520"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 05:35:53 -0700
X-CSE-ConnectionGUID: usKRuGe6RXeoccXmoYvQbg==
X-CSE-MsgGUID: q2XEflRaQkWfjZAh4GGvXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23382802"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 19 Apr 2024 05:35:52 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxnT4-000A2T-0h;
	Fri, 19 Apr 2024 12:35:50 +0000
Date: Fri, 19 Apr 2024 20:35:14 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD REGRESSION
 3cfdbc2274139bbcc09a44f8aa18d08c0abfd51e
Message-ID: <202404192010.LYtOCtFD-lkp@intel.com>
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

tree/branch: https://github.com/linuxppc/linux next-test
branch HEAD: 3cfdbc2274139bbcc09a44f8aa18d08c0abfd51e  powerpc: drop port I/O helpers for CONFIG_HAS_IOPORT=n

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202404190958.9QODkytX-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202404191016.zZs7aptf-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/powerpc/include/asm/io.h:695:13: error: implicit declaration of function 'inb'; did you mean '_insb'? [-Werror=implicit-function-declaration]
arch/powerpc/include/asm/io.h:698:14: error: implicit declaration of function 'outb'; did you mean '_outsb'? [-Werror=implicit-function-declaration]
arch/powerpc/kernel/udbg_16550.c:167:9: error: call to undeclared function 'inb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
arch/powerpc/kernel/udbg_16550.c:172:2: error: call to undeclared function 'outb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/tty/serial/8250/8250_early.c:50:10: error: call to undeclared function 'inb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/tty/serial/8250/8250_early.c:74:3: error: call to undeclared function 'outb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/tty/serial/8250/8250_port.c:344:2: error: call to undeclared function 'outb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/tty/serial/8250/8250_port.c:345:9: error: call to undeclared function 'inb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- powerpc-ppa8548_defconfig
    |-- arch-powerpc-include-asm-io.h:error:implicit-declaration-of-function-inb
    `-- arch-powerpc-include-asm-io.h:error:implicit-declaration-of-function-outb
clang_recent_errors
`-- powerpc-sequoia_defconfig
    |-- arch-powerpc-kernel-udbg_16550.c:error:call-to-undeclared-function-inb-ISO-C99-and-later-do-not-support-implicit-function-declarations
    |-- arch-powerpc-kernel-udbg_16550.c:error:call-to-undeclared-function-outb-ISO-C99-and-later-do-not-support-implicit-function-declarations
    |-- drivers-tty-serial-8250_early.c:error:call-to-undeclared-function-inb-ISO-C99-and-later-do-not-support-implicit-function-declarations
    |-- drivers-tty-serial-8250_early.c:error:call-to-undeclared-function-outb-ISO-C99-and-later-do-not-support-implicit-function-declarations
    |-- drivers-tty-serial-8250_port.c:error:call-to-undeclared-function-inb-ISO-C99-and-later-do-not-support-implicit-function-declarations
    `-- drivers-tty-serial-8250_port.c:error:call-to-undeclared-function-outb-ISO-C99-and-later-do-not-support-implicit-function-declarations

elapsed time: 1403m

configs tested: 173
configs skipped: 5

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240419   gcc  
arc                   randconfig-002-20240419   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          ixp4xx_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20240419   gcc  
arm                   randconfig-002-20240419   clang
arm                   randconfig-003-20240419   gcc  
arm                   randconfig-004-20240419   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240419   clang
arm64                 randconfig-002-20240419   clang
arm64                 randconfig-003-20240419   clang
arm64                 randconfig-004-20240419   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240419   gcc  
csky                  randconfig-002-20240419   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240419   clang
hexagon               randconfig-002-20240419   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240419   clang
i386         buildonly-randconfig-002-20240419   gcc  
i386         buildonly-randconfig-003-20240419   gcc  
i386         buildonly-randconfig-004-20240419   gcc  
i386         buildonly-randconfig-005-20240419   gcc  
i386         buildonly-randconfig-006-20240419   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240419   clang
i386                  randconfig-002-20240419   clang
i386                  randconfig-003-20240419   clang
i386                  randconfig-004-20240419   gcc  
i386                  randconfig-005-20240419   clang
i386                  randconfig-006-20240419   clang
i386                  randconfig-011-20240419   gcc  
i386                  randconfig-012-20240419   clang
i386                  randconfig-013-20240419   gcc  
i386                  randconfig-014-20240419   clang
i386                  randconfig-015-20240419   gcc  
i386                  randconfig-016-20240419   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240419   gcc  
loongarch             randconfig-002-20240419   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                     loongson1c_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240419   gcc  
nios2                 randconfig-002-20240419   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240419   gcc  
parisc                randconfig-002-20240419   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 mpc8313_rdb_defconfig   gcc  
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                    mvme5100_defconfig   gcc  
powerpc                     ppa8548_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20240419   gcc  
powerpc               randconfig-002-20240419   gcc  
powerpc               randconfig-003-20240419   gcc  
powerpc64             randconfig-001-20240419   gcc  
powerpc64             randconfig-002-20240419   gcc  
powerpc64             randconfig-003-20240419   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240419   clang
riscv                 randconfig-002-20240419   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240419   clang
s390                  randconfig-002-20240419   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                    randconfig-001-20240419   gcc  
sh                    randconfig-002-20240419   gcc  
sh                           se7724_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240419   gcc  
sparc64               randconfig-002-20240419   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240419   gcc  
um                    randconfig-002-20240419   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240419   clang
x86_64       buildonly-randconfig-003-20240419   clang
x86_64       buildonly-randconfig-004-20240419   clang
x86_64       buildonly-randconfig-005-20240419   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   clang
x86_64                randconfig-002-20240419   clang
x86_64                randconfig-005-20240419   clang
x86_64                randconfig-011-20240419   clang
x86_64                randconfig-012-20240419   clang
x86_64                randconfig-013-20240419   clang
x86_64                randconfig-014-20240419   clang
x86_64                randconfig-071-20240419   clang
x86_64                randconfig-073-20240419   clang
x86_64                randconfig-074-20240419   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240419   gcc  
xtensa                randconfig-002-20240419   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
