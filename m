Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDBD730C77
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 03:01:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NSXu/Ult;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhPBb3mxHz3bn7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 11:01:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NSXu/Ult;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhP9g072Kz307K
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 11:00:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686790855; x=1718326855;
  h=date:from:to:cc:subject:message-id;
  bh=d7fk/7+ck68Dc74+AaiYcrA127Eb+DyAxB23JIK3ImM=;
  b=NSXu/UltHPVNFxQtmiZcOcU95IXmLTMuHb6yqscrZg322jB969fReC71
   TovIqRYXQcKeS8wJIlO0U8F2cMICMDveaJDipEbL2TGYJp6MPeIk5T2+o
   UejkPrNCLu+8tyTOHWkDxUUP3WJ1e2Kf54VcTp79Yn8a5cpRt3ovQwl+s
   VnS0+RPHdUVl2LIlAIxF1kZAgYBPqw60B4PFXWnRDESz0Di3CoiONv15j
   TBOLf66J+753GhTnu03dEiKynbh//H4roc/IJfzOt/EVZdkooBqP+Q6Fv
   a4/UR3OI6IqEFzSFdfVYCKWUAO12K7OuBW31VWzKaqkvpKhnNBEXrZt5c
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="422380598"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="422380598"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 18:00:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="1042428663"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="1042428663"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jun 2023 18:00:29 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9bLg-0001ES-1C;
	Thu, 15 Jun 2023 01:00:28 +0000
Date: Thu, 15 Jun 2023 08:58:31 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 48f2444eb4dc0f3de9146f7278e859fa6b5e568b
Message-ID: <202306150829.ch8u6YHR-lkp@intel.com>
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
branch HEAD: 48f2444eb4dc0f3de9146f7278e859fa6b5e568b  powerpc: Switch i2c drivers back to use .probe()

elapsed time: 723m

configs tested: 150
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230614   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230612   gcc  
alpha                randconfig-r005-20230612   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r025-20230612   gcc  
arc                  randconfig-r033-20230612   gcc  
arc                  randconfig-r043-20230612   gcc  
arc                  randconfig-r043-20230614   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                         nhk8815_defconfig   gcc  
arm                  randconfig-r005-20230612   gcc  
arm                  randconfig-r046-20230612   clang
arm                           sama5_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r003-20230614   clang
arm64                               defconfig   gcc  
arm64                randconfig-r012-20230614   gcc  
arm64                randconfig-r031-20230612   clang
csky         buildonly-randconfig-r001-20230614   gcc  
csky         buildonly-randconfig-r003-20230614   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r015-20230614   gcc  
csky                 randconfig-r032-20230612   gcc  
hexagon              randconfig-r035-20230612   clang
hexagon              randconfig-r036-20230612   clang
hexagon              randconfig-r041-20230612   clang
hexagon              randconfig-r045-20230612   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230614   clang
i386                 randconfig-i002-20230614   clang
i386                 randconfig-i003-20230614   clang
i386                 randconfig-i004-20230614   clang
i386                 randconfig-i005-20230614   clang
i386                 randconfig-i006-20230614   clang
i386                 randconfig-i011-20230612   gcc  
i386                 randconfig-i011-20230614   gcc  
i386                 randconfig-i012-20230612   gcc  
i386                 randconfig-i012-20230614   gcc  
i386                 randconfig-i013-20230612   gcc  
i386                 randconfig-i013-20230614   gcc  
i386                 randconfig-i014-20230612   gcc  
i386                 randconfig-i014-20230614   gcc  
i386                 randconfig-i015-20230612   gcc  
i386                 randconfig-i015-20230614   gcc  
i386                 randconfig-i016-20230612   gcc  
i386                 randconfig-i016-20230614   gcc  
i386                 randconfig-r014-20230614   gcc  
i386                 randconfig-r021-20230612   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230614   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230612   gcc  
loongarch            randconfig-r006-20230612   gcc  
loongarch            randconfig-r014-20230614   gcc  
loongarch            randconfig-r024-20230612   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                 randconfig-r003-20230612   gcc  
m68k                 randconfig-r012-20230614   gcc  
m68k                 randconfig-r013-20230614   gcc  
m68k                 randconfig-r023-20230612   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze   buildonly-randconfig-r002-20230614   gcc  
microblaze           randconfig-r004-20230612   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r004-20230614   gcc  
mips                     loongson1b_defconfig   gcc  
mips                 randconfig-r003-20230612   gcc  
mips                 randconfig-r031-20230612   gcc  
mips                 randconfig-r034-20230612   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r016-20230614   gcc  
nios2                randconfig-r022-20230612   gcc  
openrisc     buildonly-randconfig-r001-20230614   gcc  
openrisc     buildonly-randconfig-r006-20230614   gcc  
openrisc             randconfig-r016-20230614   gcc  
openrisc             randconfig-r024-20230612   gcc  
openrisc             randconfig-r034-20230612   gcc  
openrisc             randconfig-r036-20230612   gcc  
parisc                           allyesconfig   gcc  
parisc       buildonly-randconfig-r002-20230614   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r013-20230614   gcc  
parisc               randconfig-r015-20230614   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     stx_gp3_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r011-20230614   gcc  
riscv                randconfig-r023-20230612   gcc  
riscv                randconfig-r042-20230612   gcc  
riscv                randconfig-r042-20230614   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230612   clang
s390                 randconfig-r026-20230612   gcc  
s390                 randconfig-r044-20230612   gcc  
s390                 randconfig-r044-20230614   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r006-20230614   gcc  
sh                   randconfig-r001-20230612   gcc  
sh                           se7343_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r026-20230612   gcc  
sparc64              randconfig-r021-20230612   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230612   clang
x86_64               randconfig-a002-20230612   clang
x86_64               randconfig-a003-20230612   clang
x86_64               randconfig-a004-20230612   clang
x86_64               randconfig-a005-20230612   clang
x86_64               randconfig-a006-20230612   clang
x86_64               randconfig-a011-20230612   gcc  
x86_64               randconfig-a012-20230612   gcc  
x86_64               randconfig-a013-20230612   gcc  
x86_64               randconfig-a014-20230612   gcc  
x86_64               randconfig-a015-20230612   gcc  
x86_64               randconfig-a016-20230612   gcc  
x86_64               randconfig-r033-20230612   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230614   gcc  
xtensa                              defconfig   gcc  
xtensa                          iss_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
