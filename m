Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 093607E0EF1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Nov 2023 12:07:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UPJHZFoc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SMvvP6fWYz3ck3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Nov 2023 22:06:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UPJHZFoc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SMvtX6SDXz2yVR
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Nov 2023 22:06:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699095973; x=1730631973;
  h=date:from:to:cc:subject:message-id;
  bh=C7Y/gYhHJmqdgNqDxoiKgZfR7E0UQYC2ktAUalg9eUg=;
  b=UPJHZFoc+vpHgXDJ1C2bopqf6qBKUfyeliDgzY4OfTYhAJEB9UiyGcw2
   iakqq3A5iAYasgRW2miGczxMYgr/gk6ygOJxe3fejgYejt/QA+fsnkAGt
   cUJa36D/AEV8qQzRAaq9hLUYRJj2jPTV1qsDZPMUpoacawZMI292xP7m/
   Y+VcLl/CIYCIAjEQiehVDvFSYgo+0Lf6YTNPy00K2XqYuxzcBpu9mOBfr
   dGA/FqkF7z03uWFqqt21Df3U4ufrxA6FmbgDOZzrg8sHHvLyirslqsFLa
   0ebYgyBp2xKum+Ogv+Gtk5DgdnQ6bE+CFm7KbPyOnpg2GMlfA+3uM53xm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="453379490"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="453379490"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 04:06:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="935355046"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="935355046"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 Nov 2023 04:06:03 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzETZ-0003tu-16;
	Sat, 04 Nov 2023 11:06:01 +0000
Date: Sat, 04 Nov 2023 19:04:53 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD REGRESSION
 efdcf91a2158294ea1af97e7d592c00e7a97c5b5
Message-ID: <202311041950.Z17hmQLE-lkp@intel.com>
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
branch HEAD: efdcf91a2158294ea1af97e7d592c00e7a97c5b5  Automatic merge of 'master' into merge (2023-11-03 16:08)

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- sh-allmodconfig
|   |-- sh4-linux-gcc:internal-compiler-error:Segmentation-fault-signal-terminated-program-cc1
|   |-- standard-input:Error:expected-symbol-name
|   `-- standard-input:Error:pcrel-too-far
|-- sh-allyesconfig
|   |-- sh4-linux-gcc:internal-compiler-error:Segmentation-fault-signal-terminated-program-cc1
|   |-- standard-input:Error:expected-symbol-name
|   `-- standard-input:Error:pcrel-too-far
`-- sh-randconfig-001-20231104
    |-- sh4-linux-gcc:internal-compiler-error:Segmentation-fault-signal-terminated-program-cc1
    `-- standard-input:Error:missing-expression

elapsed time: 1749m

configs tested: 231
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231103   gcc  
arc                   randconfig-001-20231104   gcc  
arc                   randconfig-002-20231103   gcc  
arc                   randconfig-002-20231104   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                            mps2_defconfig   gcc  
arm                   randconfig-001-20231103   gcc  
arm                   randconfig-001-20231104   gcc  
arm                   randconfig-002-20231103   gcc  
arm                   randconfig-002-20231104   gcc  
arm                   randconfig-003-20231103   gcc  
arm                   randconfig-003-20231104   gcc  
arm                   randconfig-004-20231103   gcc  
arm                   randconfig-004-20231104   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231103   gcc  
arm64                 randconfig-001-20231104   gcc  
arm64                 randconfig-002-20231103   gcc  
arm64                 randconfig-002-20231104   gcc  
arm64                 randconfig-003-20231103   gcc  
arm64                 randconfig-003-20231104   gcc  
arm64                 randconfig-004-20231103   gcc  
arm64                 randconfig-004-20231104   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231103   gcc  
csky                  randconfig-001-20231104   gcc  
csky                  randconfig-002-20231103   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231103   gcc  
i386         buildonly-randconfig-001-20231104   gcc  
i386         buildonly-randconfig-002-20231103   gcc  
i386         buildonly-randconfig-002-20231104   gcc  
i386         buildonly-randconfig-003-20231103   gcc  
i386         buildonly-randconfig-003-20231104   gcc  
i386         buildonly-randconfig-004-20231103   gcc  
i386         buildonly-randconfig-004-20231104   gcc  
i386         buildonly-randconfig-005-20231103   gcc  
i386         buildonly-randconfig-005-20231104   gcc  
i386         buildonly-randconfig-006-20231103   gcc  
i386         buildonly-randconfig-006-20231104   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231104   gcc  
i386                  randconfig-002-20231104   gcc  
i386                  randconfig-003-20231104   gcc  
i386                  randconfig-004-20231104   gcc  
i386                  randconfig-005-20231104   gcc  
i386                  randconfig-006-20231104   gcc  
i386                  randconfig-011-20231103   gcc  
i386                  randconfig-011-20231104   gcc  
i386                  randconfig-012-20231103   gcc  
i386                  randconfig-012-20231104   gcc  
i386                  randconfig-013-20231103   gcc  
i386                  randconfig-013-20231104   gcc  
i386                  randconfig-014-20231103   gcc  
i386                  randconfig-014-20231104   gcc  
i386                  randconfig-015-20231103   gcc  
i386                  randconfig-015-20231104   gcc  
i386                  randconfig-016-20231103   gcc  
i386                  randconfig-016-20231104   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231103   gcc  
loongarch             randconfig-001-20231104   gcc  
loongarch             randconfig-002-20231103   gcc  
loongarch             randconfig-002-20231104   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231103   gcc  
nios2                 randconfig-001-20231104   gcc  
nios2                 randconfig-002-20231103   gcc  
nios2                 randconfig-002-20231104   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231103   gcc  
parisc                randconfig-001-20231104   gcc  
parisc                randconfig-002-20231103   gcc  
parisc                randconfig-002-20231104   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc                      mgcoge_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc               randconfig-001-20231103   gcc  
powerpc               randconfig-001-20231104   gcc  
powerpc               randconfig-002-20231103   gcc  
powerpc               randconfig-002-20231104   gcc  
powerpc               randconfig-003-20231103   gcc  
powerpc               randconfig-003-20231104   gcc  
powerpc64             randconfig-001-20231103   gcc  
powerpc64             randconfig-001-20231104   gcc  
powerpc64             randconfig-002-20231103   gcc  
powerpc64             randconfig-002-20231104   gcc  
powerpc64             randconfig-003-20231103   gcc  
powerpc64             randconfig-003-20231104   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231103   gcc  
riscv                 randconfig-001-20231104   gcc  
riscv                 randconfig-002-20231103   gcc  
riscv                 randconfig-002-20231104   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231103   gcc  
s390                  randconfig-001-20231104   gcc  
s390                  randconfig-002-20231103   gcc  
s390                  randconfig-002-20231104   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231104   gcc  
sh                    randconfig-002-20231104   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231104   gcc  
sparc                 randconfig-002-20231104   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231104   gcc  
sparc64               randconfig-002-20231104   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231104   gcc  
um                    randconfig-002-20231104   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231103   gcc  
x86_64       buildonly-randconfig-001-20231104   gcc  
x86_64       buildonly-randconfig-002-20231103   gcc  
x86_64       buildonly-randconfig-002-20231104   gcc  
x86_64       buildonly-randconfig-003-20231103   gcc  
x86_64       buildonly-randconfig-003-20231104   gcc  
x86_64       buildonly-randconfig-004-20231103   gcc  
x86_64       buildonly-randconfig-004-20231104   gcc  
x86_64       buildonly-randconfig-005-20231103   gcc  
x86_64       buildonly-randconfig-005-20231104   gcc  
x86_64       buildonly-randconfig-006-20231103   gcc  
x86_64       buildonly-randconfig-006-20231104   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231104   gcc  
x86_64                randconfig-002-20231104   gcc  
x86_64                randconfig-003-20231104   gcc  
x86_64                randconfig-004-20231104   gcc  
x86_64                randconfig-005-20231104   gcc  
x86_64                randconfig-006-20231103   gcc  
x86_64                randconfig-006-20231104   gcc  
x86_64                randconfig-011-20231103   gcc  
x86_64                randconfig-011-20231104   gcc  
x86_64                randconfig-012-20231103   gcc  
x86_64                randconfig-012-20231104   gcc  
x86_64                randconfig-013-20231103   gcc  
x86_64                randconfig-013-20231104   gcc  
x86_64                randconfig-014-20231103   gcc  
x86_64                randconfig-014-20231104   gcc  
x86_64                randconfig-015-20231103   gcc  
x86_64                randconfig-015-20231104   gcc  
x86_64                randconfig-016-20231103   gcc  
x86_64                randconfig-016-20231104   gcc  
x86_64                randconfig-071-20231103   gcc  
x86_64                randconfig-071-20231104   gcc  
x86_64                randconfig-072-20231103   gcc  
x86_64                randconfig-072-20231104   gcc  
x86_64                randconfig-073-20231103   gcc  
x86_64                randconfig-073-20231104   gcc  
x86_64                randconfig-074-20231103   gcc  
x86_64                randconfig-074-20231104   gcc  
x86_64                randconfig-075-20231103   gcc  
x86_64                randconfig-075-20231104   gcc  
x86_64                randconfig-076-20231103   gcc  
x86_64                randconfig-076-20231104   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20231104   gcc  
xtensa                randconfig-002-20231104   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
