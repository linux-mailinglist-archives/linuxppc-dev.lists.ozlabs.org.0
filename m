Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D231176730E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 19:15:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NcZ5Bve3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RCDm35dcVz3cVF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 03:15:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NcZ5Bve3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RCDl53qslz3cND
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jul 2023 03:14:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690564466; x=1722100466;
  h=date:from:to:cc:subject:message-id;
  bh=nF418KO0FrhcHWBDH52oJFW0CnzkDBRE/wBxARisCIk=;
  b=NcZ5Bve3HhO4cYYqCT7TRDAC28xTBF67fylgMwqsIn9/4iYE7xJ3MwG/
   7lw2oXHTj4TEAZAz7HOQlN7BmpZ6EtBnGcYSOAz4aUaDZ2nYFJsk1co9c
   rePVoDwpjzFtCEsMCkyIPnWmQcVFX95dGki4oYzZAO97q7YSmsbeJg0Wg
   mqpaLojoIkDS1/xsdXL+2gRElY9yNGKduoq2cvDX4oK/ZgJnIYdh3m6LM
   Npp0S+70H6U4Fb/7/Fc4kyWuKX7JSPOvGUmpaMBlCIPoHWZC0P/EK1xeP
   kiT0YdsA0R0iORjjQLGAFHz41Bl6uIWk4InNNerU2WB3WeyWyhb+yStOE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="358669360"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="358669360"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 10:14:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="704635498"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="704635498"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 28 Jul 2023 10:14:15 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPR2c-0003Pt-1K;
	Fri, 28 Jul 2023 17:14:14 +0000
Date: Sat, 29 Jul 2023 01:12:44 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 d7b3af5a77e8d8da28f435f313e069aea5bcf172
Message-ID: <202307290139.PZruTTA2-lkp@intel.com>
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
Cc: linux-arch@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: d7b3af5a77e8d8da28f435f313e069aea5bcf172  Add linux-next specific files for 20230728

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202307080722.PsQUe5E5-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307181450.sfbuvMf5-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307251531.p8ZLFTMZ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307281617.OxcXz84j-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

../lib/gcc/loongarch64-linux/12.3.0/plugin/include/config/loongarch/loongarch-opts.h:31:10: fatal error: loongarch-def.h: No such file or directory
arch/mips/pic32/pic32mzda/config.c:22:24: error: a parameter list without types is only allowed in a function definition
arch/mips/pic32/pic32mzda/config.c:22:8: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
arch/mips/pic32/pic32mzda/config.c:41:21: error: use of undeclared identifier 'config_lock'
arch/mips/pic32/pic32mzda/config.c:41:2: error: call to undeclared function 'spin_lock_irqsave'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
arch/mips/pic32/pic32mzda/config.c:46:2: error: call to undeclared function 'spin_unlock_irqrestore'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
arch/powerpc/mm/init_64.c:201:15: error: no previous prototype for function '__vmemmap_populate' [-Werror,-Wmissing-prototypes]
drivers/regulator/max77857-regulator.c:312:16: error: initializer element is not a compile-time constant
include/asm-generic/io.h:1111:20: error: static declaration of 'ioport_map' follows non-static declaration
include/asm-generic/io.h:1121:22: error: static declaration of 'ioport_unmap' follows non-static declaration
include/asm-generic/io.h:636:15: error: redefinition of 'inb_p'
include/asm-generic/io.h:644:15: error: redefinition of 'inw_p'
include/asm-generic/io.h:652:15: error: redefinition of 'inl_p'
include/asm-generic/io.h:660:16: error: redefinition of 'outb_p'
include/asm-generic/io.h:668:16: error: redefinition of 'outw_p'
include/asm-generic/io.h:676:16: error: redefinition of 'outl_p'
include/asm-generic/io.h:689:14: error: redefinition of 'insb'
include/asm-generic/io.h:697:14: error: redefinition of 'insw'
include/asm-generic/io.h:705:14: error: redefinition of 'insl'
include/asm-generic/io.h:713:15: error: redefinition of 'outsb'
include/asm-generic/io.h:722:15: error: redefinition of 'outsw'
include/asm-generic/io.h:731:15: error: redefinition of 'outsl'

Unverified Error/Warning (likely false positive, please contact us if interested):

sh4-linux-gcc: internal compiler error: Segmentation fault signal terminated program cc1
{standard input}: Warning: end of file not at end of a line; newline inserted
{standard input}:1095: Error: pcrel too far
{standard input}:1482: Warning: end of file not at end of a line; newline inserted

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- loongarch-allmodconfig
|   `-- lib-gcc-loongarch64-linux-..-plugin-include-config-loongarch-loongarch-opts.h:fatal-error:loongarch-def.h:No-such-file-or-directory
|-- sh-allmodconfig
|   |-- sh4-linux-gcc:internal-compiler-error:Segmentation-fault-signal-terminated-program-cc1
|   |-- standard-input:Error:pcrel-too-far
|   `-- standard-input:Warning:end-of-file-not-at-end-of-a-line-newline-inserted
|-- sh-randconfig-m031-20230727
|   |-- sh4-linux-gcc:internal-compiler-error:Segmentation-fault-signal-terminated-program-cc1
|   `-- standard-input:Warning:end-of-file-not-at-end-of-a-line-newline-inserted
`-- sh-se7712_defconfig
    |-- include-asm-generic-io.h:error:redefinition-of-inb_p
    |-- include-asm-generic-io.h:error:redefinition-of-inl_p
    |-- include-asm-generic-io.h:error:redefinition-of-insb
    |-- include-asm-generic-io.h:error:redefinition-of-insl
    |-- include-asm-generic-io.h:error:redefinition-of-insw
    |-- include-asm-generic-io.h:error:redefinition-of-inw_p
    |-- include-asm-generic-io.h:error:redefinition-of-outb_p
    |-- include-asm-generic-io.h:error:redefinition-of-outl_p
    |-- include-asm-generic-io.h:error:redefinition-of-outsb
    |-- include-asm-generic-io.h:error:redefinition-of-outsl
    |-- include-asm-generic-io.h:error:redefinition-of-outsw
    |-- include-asm-generic-io.h:error:redefinition-of-outw_p
    |-- include-asm-generic-io.h:error:static-declaration-of-ioport_map-follows-non-static-declaration
    `-- include-asm-generic-io.h:error:static-declaration-of-ioport_unmap-follows-non-static-declaration
clang_recent_errors
|-- i386-buildonly-randconfig-r006-20230727
|   `-- drivers-regulator-max77857-regulator.c:error:initializer-element-is-not-a-compile-time-constant
|-- i386-randconfig-i006-20230727
|   `-- drivers-regulator-max77857-regulator.c:error:initializer-element-is-not-a-compile-time-constant
|-- mips-pic32mzda_defconfig
|   |-- arch-mips-pic32-pic32mzda-config.c:error:a-parameter-list-without-types-is-only-allowed-in-a-function-definition
|   |-- arch-mips-pic32-pic32mzda-config.c:error:call-to-undeclared-function-spin_lock_irqsave-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- arch-mips-pic32-pic32mzda-config.c:error:call-to-undeclared-function-spin_unlock_irqrestore-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- arch-mips-pic32-pic32mzda-config.c:error:type-specifier-missing-defaults-to-int-ISO-C99-and-later-do-not-support-implicit-int
|   `-- arch-mips-pic32-pic32mzda-config.c:error:use-of-undeclared-identifier-config_lock
|-- mips-randconfig-r023-20230727
|   `-- drivers-regulator-max77857-regulator.c:error:initializer-element-is-not-a-compile-time-constant
`-- powerpc-ppc64e_defconfig
    `-- arch-powerpc-mm-init_64.c:error:no-previous-prototype-for-function-__vmemmap_populate-Werror-Wmissing-prototypes

elapsed time: 728m

configs tested: 126
configs skipped: 6

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r016-20230727   gcc  
arc                  randconfig-r026-20230727   gcc  
arc                  randconfig-r043-20230728   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                  randconfig-r022-20230727   clang
arm                  randconfig-r046-20230728   gcc  
arm                        shmobile_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230728   clang
hexagon              randconfig-r045-20230728   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230727   clang
i386         buildonly-randconfig-r005-20230727   clang
i386         buildonly-randconfig-r006-20230727   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230727   clang
i386                 randconfig-i002-20230727   clang
i386                 randconfig-i003-20230727   clang
i386                 randconfig-i004-20230727   clang
i386                 randconfig-i005-20230727   clang
i386                 randconfig-i006-20230727   clang
i386                 randconfig-i011-20230727   gcc  
i386                 randconfig-i011-20230728   clang
i386                 randconfig-i012-20230727   gcc  
i386                 randconfig-i012-20230728   clang
i386                 randconfig-i013-20230727   gcc  
i386                 randconfig-i013-20230728   clang
i386                 randconfig-i014-20230727   gcc  
i386                 randconfig-i014-20230728   clang
i386                 randconfig-i015-20230727   gcc  
i386                 randconfig-i015-20230728   clang
i386                 randconfig-i016-20230727   gcc  
i386                 randconfig-i016-20230728   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230727   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230727   gcc  
microblaze           randconfig-r012-20230727   gcc  
microblaze           randconfig-r035-20230727   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                malta_qemu_32r6_defconfig   clang
mips                  maltasmvp_eva_defconfig   gcc  
mips                 randconfig-r023-20230727   clang
mips                           rs90_defconfig   clang
nios2                               defconfig   gcc  
nios2                randconfig-r025-20230727   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc                      ppc40x_defconfig   gcc  
powerpc                      ppc64e_defconfig   clang
powerpc              randconfig-r006-20230727   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230728   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r033-20230727   clang
s390                 randconfig-r044-20230728   clang
sh                               allmodconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                   randconfig-r005-20230727   gcc  
sh                           se7712_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230727   gcc  
sparc                randconfig-r013-20230727   gcc  
sparc64                          alldefconfig   gcc  
sparc64              randconfig-r014-20230727   gcc  
sparc64              randconfig-r015-20230727   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r002-20230727   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230727   clang
x86_64       buildonly-randconfig-r002-20230727   clang
x86_64       buildonly-randconfig-r003-20230727   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r034-20230727   clang
x86_64               randconfig-x001-20230727   gcc  
x86_64               randconfig-x002-20230727   gcc  
x86_64               randconfig-x003-20230727   gcc  
x86_64               randconfig-x004-20230727   gcc  
x86_64               randconfig-x005-20230727   gcc  
x86_64               randconfig-x006-20230727   gcc  
x86_64               randconfig-x011-20230728   gcc  
x86_64               randconfig-x012-20230728   gcc  
x86_64               randconfig-x013-20230728   gcc  
x86_64               randconfig-x014-20230728   gcc  
x86_64               randconfig-x015-20230728   gcc  
x86_64               randconfig-x016-20230728   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r011-20230727   gcc  
xtensa               randconfig-r021-20230727   gcc  
xtensa               randconfig-r024-20230727   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
