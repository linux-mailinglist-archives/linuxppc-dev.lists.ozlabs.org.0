Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 232557E5F4D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 21:39:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y4718RXG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQcQH0SP0z3cTN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 07:39:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y4718RXG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQcPP2h1yz3c56
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 07:38:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699475929; x=1731011929;
  h=date:from:to:cc:subject:message-id;
  bh=T9T9y16utYLFSgf4og6lhGRvo4S0o6WQDuJcCY3w3P4=;
  b=Y4718RXGV9LIscLPToafGHBGvxVCv3b546p7DFj67tsUHt3OUIi7aukP
   d+5n8MP8thtkrbT9QREjhJ7b9nPoFJXjmbTTeXD5Oueq/YafhqpgGgH0j
   nP1YSdHHsS4B8ETUyPWH0iprxH8PFAVUatOEJJqJpVCrTyVIjHJeOdMXK
   DjXwUN9u45eiSati/UVA0xgSaMWKExL0fVc1qxZgaEdDZ2y1KRTx/ro7I
   Jva03tKpPfNWom5lk5QABfnrKRq04LR+hzUCQk7wATJNRJnYOB6wAbflb
   Aephm9ub9mfr0Upc48pFxpGBbKI4qWl4A9Jq+K5v9Y/EXIEVlzD2l9a2S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="456349700"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="456349700"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 12:38:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="936625671"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="936625671"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Nov 2023 12:38:41 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0pJv-0008Am-1K;
	Wed, 08 Nov 2023 20:38:39 +0000
Date: Thu, 09 Nov 2023 04:38:16 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD REGRESSION
 11121f9bdf3d1f7a04a87381df18587b9fe8f908
Message-ID: <202311090408.FMZEwgT7-lkp@intel.com>
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
branch HEAD: 11121f9bdf3d1f7a04a87381df18587b9fe8f908  Automatic merge of 'master' into merge (2023-11-07 22:10)

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- sh-allmodconfig
|   |-- sh4-linux-gcc:internal-compiler-error:Segmentation-fault-signal-terminated-program-cc1
|   |-- standard-input:Error:expected-symbol-name
|   `-- standard-input:Error:pcrel-too-far
`-- sh-allyesconfig
    |-- sh4-linux-gcc:internal-compiler-error:Segmentation-fault-signal-terminated-program-cc1
    |-- standard-input:Error:expected-symbol-name
    `-- standard-input:Error:pcrel-too-far

elapsed time: 1916m

configs tested: 159
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231108   gcc  
arc                   randconfig-002-20231108   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231108   gcc  
arm                   randconfig-002-20231108   gcc  
arm                   randconfig-003-20231108   gcc  
arm                   randconfig-004-20231108   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231108   gcc  
arm64                 randconfig-002-20231108   gcc  
arm64                 randconfig-003-20231108   gcc  
arm64                 randconfig-004-20231108   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231108   gcc  
csky                  randconfig-002-20231108   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231108   gcc  
i386         buildonly-randconfig-002-20231108   gcc  
i386         buildonly-randconfig-003-20231108   gcc  
i386         buildonly-randconfig-004-20231108   gcc  
i386         buildonly-randconfig-005-20231108   gcc  
i386         buildonly-randconfig-006-20231108   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231108   gcc  
i386                  randconfig-002-20231108   gcc  
i386                  randconfig-003-20231108   gcc  
i386                  randconfig-004-20231108   gcc  
i386                  randconfig-005-20231108   gcc  
i386                  randconfig-006-20231108   gcc  
i386                  randconfig-011-20231108   gcc  
i386                  randconfig-012-20231108   gcc  
i386                  randconfig-013-20231108   gcc  
i386                  randconfig-014-20231108   gcc  
i386                  randconfig-015-20231108   gcc  
i386                  randconfig-016-20231108   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231108   gcc  
loongarch             randconfig-002-20231108   gcc  
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
nios2                 randconfig-001-20231108   gcc  
nios2                 randconfig-002-20231108   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231108   gcc  
parisc                randconfig-002-20231108   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc               randconfig-001-20231108   gcc  
powerpc               randconfig-002-20231108   gcc  
powerpc               randconfig-003-20231108   gcc  
powerpc64             randconfig-001-20231108   gcc  
powerpc64             randconfig-002-20231108   gcc  
powerpc64             randconfig-003-20231108   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231108   gcc  
riscv                 randconfig-002-20231108   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231108   gcc  
s390                  randconfig-002-20231108   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231108   gcc  
sh                    randconfig-002-20231108   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231108   gcc  
sparc                 randconfig-002-20231108   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231108   gcc  
sparc64               randconfig-002-20231108   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231108   gcc  
um                    randconfig-002-20231108   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231108   gcc  
x86_64       buildonly-randconfig-002-20231108   gcc  
x86_64       buildonly-randconfig-003-20231108   gcc  
x86_64       buildonly-randconfig-004-20231108   gcc  
x86_64       buildonly-randconfig-005-20231108   gcc  
x86_64       buildonly-randconfig-006-20231108   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231108   gcc  
x86_64                randconfig-002-20231108   gcc  
x86_64                randconfig-003-20231108   gcc  
x86_64                randconfig-004-20231108   gcc  
x86_64                randconfig-005-20231108   gcc  
x86_64                randconfig-006-20231108   gcc  
x86_64                randconfig-011-20231108   gcc  
x86_64                randconfig-012-20231108   gcc  
x86_64                randconfig-013-20231108   gcc  
x86_64                randconfig-014-20231108   gcc  
x86_64                randconfig-015-20231108   gcc  
x86_64                randconfig-016-20231108   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                randconfig-001-20231108   gcc  
xtensa                randconfig-002-20231108   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
