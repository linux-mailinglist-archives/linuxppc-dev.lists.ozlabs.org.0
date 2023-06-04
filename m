Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 459AC72175E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jun 2023 15:20:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QYy6H6RGtz3f0Q
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jun 2023 23:20:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m9Ssx4j5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m9Ssx4j5;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QYy5N5zG1z3bmP
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Jun 2023 23:19:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685884793; x=1717420793;
  h=date:from:to:cc:subject:message-id;
  bh=B24GXMr+wxOs/d/ncn1JT0P1E5adreU5pYfyEu0KzZo=;
  b=m9Ssx4j5J/OUqYSSjOtdUDlICAfeh8ubiLsJz9z8dDuCWazhKCOadGMD
   EDLQ6wczsneTUiLrhMWaHYhUChthj6PfsxN8aaaIUrmWm17f1MTirAm5p
   LLVXUoiCUPOcyeRGEOY5J0hdDcIyJ1fSFOJlkF6u8wo5vkCk4P4d/6q+8
   3PG93pviJQwM40/9akXxaNem4ONk7Tut76n0aJTLKJO2MGyN/YVvs+IbC
   GiKNCqAsDORowS1tgo6jUXX0h8lfL3EOO9oSmHPQZgbLlqK9oHgSIvp/k
   mIUldh9UObWEafdqyb4W9fR70cxg+DCNHEbbCGGKqpPCOfBm/j/mOYeCO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="442558545"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="442558545"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 06:19:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="798124377"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="798124377"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Jun 2023 06:19:38 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5ndx-0002it-2T;
	Sun, 04 Jun 2023 13:19:37 +0000
Date: Sun, 04 Jun 2023 21:19:03 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 15d4ded6d4b6f4708bf37c59b5eef06198c7c391
Message-ID: <20230604131903.dfIso%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 15d4ded6d4b6f4708bf37c59b5eef06198c7c391  powerpc: Mark powermac as orphan in MAINTAINERS

elapsed time: 741m

configs tested: 138
configs skipped: 47

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                randconfig-r035-20230604   gcc  
arc                              allyesconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                  randconfig-r006-20230604   gcc  
arc                  randconfig-r015-20230604   gcc  
arc                  randconfig-r024-20230604   gcc  
arc                  randconfig-r043-20230604   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                        mvebu_v5_defconfig   clang
arm                         orion5x_defconfig   clang
arm                          pxa168_defconfig   clang
arm                  randconfig-r002-20230604   clang
arm                  randconfig-r032-20230604   clang
arm                  randconfig-r046-20230604   gcc  
arm                         s3c6400_defconfig   gcc  
arm                          sp7021_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky         buildonly-randconfig-r005-20230604   gcc  
csky                 randconfig-r025-20230604   gcc  
hexagon      buildonly-randconfig-r001-20230604   clang
hexagon      buildonly-randconfig-r002-20230604   clang
hexagon              randconfig-r041-20230604   clang
hexagon              randconfig-r045-20230604   clang
i386         buildonly-randconfig-r004-20230604   gcc  
i386                 randconfig-i001-20230604   gcc  
i386                 randconfig-i002-20230604   gcc  
i386                 randconfig-i003-20230604   gcc  
i386                 randconfig-i004-20230604   gcc  
i386                 randconfig-i005-20230604   gcc  
i386                 randconfig-i006-20230604   gcc  
i386                 randconfig-i051-20230604   gcc  
i386                 randconfig-i052-20230604   gcc  
i386                 randconfig-i053-20230604   gcc  
i386                 randconfig-i054-20230604   gcc  
i386                 randconfig-i055-20230604   gcc  
i386                 randconfig-i056-20230604   gcc  
i386                 randconfig-i061-20230604   gcc  
i386                 randconfig-i062-20230604   gcc  
i386                 randconfig-i063-20230604   gcc  
i386                 randconfig-i064-20230604   gcc  
i386                 randconfig-i065-20230604   gcc  
i386                 randconfig-i066-20230604   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r006-20230604   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch            randconfig-r005-20230604   gcc  
loongarch            randconfig-r013-20230604   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r003-20230604   gcc  
m68k                                defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                 randconfig-r012-20230604   gcc  
m68k                 randconfig-r013-20230604   gcc  
m68k                 randconfig-r026-20230604   gcc  
m68k                           sun3_defconfig   gcc  
microblaze           randconfig-r003-20230604   gcc  
microblaze           randconfig-r026-20230604   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                            ar7_defconfig   gcc  
mips                           ip32_defconfig   gcc  
mips                     loongson2k_defconfig   clang
mips                 randconfig-r023-20230604   gcc  
nios2                randconfig-r002-20230604   gcc  
nios2                randconfig-r033-20230604   gcc  
openrisc     buildonly-randconfig-r001-20230604   gcc  
openrisc             randconfig-r036-20230604   gcc  
parisc               randconfig-r021-20230604   gcc  
parisc               randconfig-r024-20230604   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                     ksi8560_defconfig   clang
powerpc                 linkstation_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc              randconfig-r003-20230604   gcc  
powerpc              randconfig-r034-20230604   gcc  
powerpc                     tqm8541_defconfig   gcc  
powerpc                     tqm8560_defconfig   clang
riscv                randconfig-r001-20230604   gcc  
riscv                randconfig-r004-20230604   gcc  
riscv                randconfig-r011-20230604   clang
riscv                randconfig-r014-20230604   clang
riscv                randconfig-r016-20230604   clang
riscv                randconfig-r022-20230604   clang
riscv                randconfig-r031-20230604   gcc  
riscv                randconfig-r042-20230604   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r032-20230604   gcc  
s390                 randconfig-r044-20230604   clang
sh                         microdev_defconfig   gcc  
sh                   randconfig-r004-20230604   gcc  
sh                   randconfig-r011-20230604   gcc  
sh                   randconfig-r023-20230604   gcc  
sh                   randconfig-r034-20230604   gcc  
sh                   randconfig-r036-20230604   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                randconfig-r015-20230604   gcc  
sparc                randconfig-r025-20230604   gcc  
sparc                randconfig-r033-20230604   gcc  
sparc64      buildonly-randconfig-r006-20230604   gcc  
sparc64              randconfig-r005-20230604   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r003-20230604   gcc  
x86_64                              defconfig   gcc  
x86_64               randconfig-a001-20230604   gcc  
x86_64               randconfig-a002-20230604   gcc  
x86_64               randconfig-a003-20230604   gcc  
x86_64               randconfig-a004-20230604   gcc  
x86_64               randconfig-a005-20230604   gcc  
x86_64               randconfig-a006-20230604   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa               randconfig-r006-20230604   gcc  
xtensa               randconfig-r021-20230604   gcc  
xtensa               randconfig-r022-20230604   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
