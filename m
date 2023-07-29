Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E006B7681BE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 22:13:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cMw/d9W/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RCwfp64Dzz3cTb
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jul 2023 06:13:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cMw/d9W/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RCwcy6t4gz2xVR
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jul 2023 06:11:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690661491; x=1722197491;
  h=date:from:to:cc:subject:message-id;
  bh=Wg02hIpw+9AzurQ2ARXCq68NIw7itJkKwarA+gKPOG4=;
  b=cMw/d9W/WuMPqiGt8G2qwTAojIzojjJ7E8snaD17lGiMa1iVl688W1QR
   y9Fblbipxd2lIOUta8RWoYV6PKQddExV4uTEzc/bO3RobvqmROs3cjDnP
   iYdhzJ78EJsrlJC81xK5LTO4SRn0QpB+YdACZRVceQlXXxoTriobOFulK
   4LUplStxxzzCG5FTLpLF03J12e/DY9SmX44UyuhFvFGFDyDwuGd/jkh/X
   nfd4PCDrcSq40leyN2350PIRvjh9cClvZh2IY8ixDaChRLhh8POvFp8mN
   I+BVygV2GOeP/KdJtANN9IThRGCGela+iFp4CJNmH7fpfH0TW5HlP4Q5h
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="358819789"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="358819789"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 13:11:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="721616214"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="721616214"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 29 Jul 2023 13:11:18 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPqHV-0004HZ-30;
	Sat, 29 Jul 2023 20:11:17 +0000
Date: Sun, 30 Jul 2023 04:11:03 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 d6582c259cbf4d8ba894e7243f31f26e7c6ff387
Message-ID: <202307300401.IrJuCso6-lkp@intel.com>
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
branch HEAD: d6582c259cbf4d8ba894e7243f31f26e7c6ff387  powerpc: address missing-prototypes warnings

elapsed time: 720m

configs tested: 115
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r012-20230729   gcc  
alpha                randconfig-r022-20230729   gcc  
alpha                randconfig-r025-20230729   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230728   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                          pxa168_defconfig   clang
arm                  randconfig-r046-20230728   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r011-20230729   gcc  
hexagon                             defconfig   clang
hexagon              randconfig-r031-20230728   clang
hexagon              randconfig-r035-20230728   clang
hexagon              randconfig-r041-20230728   clang
hexagon              randconfig-r045-20230728   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230728   gcc  
i386         buildonly-randconfig-r005-20230728   gcc  
i386         buildonly-randconfig-r006-20230728   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230728   gcc  
i386                 randconfig-i002-20230728   gcc  
i386                 randconfig-i003-20230728   gcc  
i386                 randconfig-i004-20230728   gcc  
i386                 randconfig-i005-20230728   gcc  
i386                 randconfig-i006-20230728   gcc  
i386                 randconfig-i011-20230728   clang
i386                 randconfig-i012-20230728   clang
i386                 randconfig-i013-20230728   clang
i386                 randconfig-i014-20230728   clang
i386                 randconfig-i015-20230728   clang
i386                 randconfig-i016-20230728   clang
i386                 randconfig-r014-20230729   gcc  
i386                 randconfig-r021-20230729   gcc  
i386                 randconfig-r023-20230729   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r013-20230729   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r034-20230728   gcc  
m68k                 randconfig-r036-20230728   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   clang
mips                      maltaaprp_defconfig   clang
mips                           mtx1_defconfig   clang
mips                 randconfig-r006-20230728   clang
mips                 randconfig-r015-20230729   clang
mips                 randconfig-r026-20230729   clang
nios2                               defconfig   gcc  
openrisc             randconfig-r024-20230729   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r033-20230728   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                   lite5200b_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230728   clang
riscv                          rv32_defconfig   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230728   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r002-20230728   gcc  
sh                   randconfig-r003-20230728   gcc  
sh                   randconfig-r005-20230728   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r001-20230728   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r004-20230728   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230728   gcc  
x86_64       buildonly-randconfig-r002-20230728   gcc  
x86_64       buildonly-randconfig-r003-20230728   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r032-20230728   gcc  
x86_64               randconfig-x001-20230728   clang
x86_64               randconfig-x002-20230728   clang
x86_64               randconfig-x003-20230728   clang
x86_64               randconfig-x004-20230728   clang
x86_64               randconfig-x005-20230728   clang
x86_64               randconfig-x006-20230728   clang
x86_64               randconfig-x011-20230728   gcc  
x86_64               randconfig-x012-20230728   gcc  
x86_64               randconfig-x013-20230728   gcc  
x86_64               randconfig-x014-20230728   gcc  
x86_64               randconfig-x015-20230728   gcc  
x86_64               randconfig-x016-20230728   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
