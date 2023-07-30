Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7A97682C0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jul 2023 02:12:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RUsddtJQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RD1z16J0Pz30RV
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jul 2023 10:12:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RUsddtJQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (unknown [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RD1y44jHmz2xq8
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jul 2023 10:11:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690675901; x=1722211901;
  h=date:from:to:cc:subject:message-id;
  bh=D0Y4VyaM8CAcyd1FV/WJUfdP63p/MegQ2FZ8+CE89RM=;
  b=RUsddtJQ6YQL4Y64CQbA8nWzVf22+VlVq1VzIZcFbh1pHMh46gARDrkN
   chigtO497QmsfOqG0Lf7ga1zY2nR0WF5gAiND8LnwlyDANmBBYBcREV8R
   u8pME3VqwiMglJUm+z+xzk6z8krQf2uVkolswbzQQibXtcaDFOpKAKkMa
   hkwcFA5hZlDhA+QCuHgy3G/mozXOS6iEqLtpmvEOVVFmtCowQjfMRPdON
   VeXUzGFk4R+VOfEq8t8Ve2vAgI3FoXa+EBUA14imOw7k1noR98bN8dWIh
   RPQ+Ah1PQChwfAc4Sr076xV/iIhfzB1gwGRy9MdiLMJ+tfqq6mZSRQ+X2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="353707062"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="353707062"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 17:11:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="721646057"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="721646057"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 29 Jul 2023 17:11:30 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPu1x-0004Lg-1N;
	Sun, 30 Jul 2023 00:11:29 +0000
Date: Sun, 30 Jul 2023 08:10:50 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 c3cad890877f59aeeaf5a638aa7a7c0612c16fa1
Message-ID: <202307300848.zImXIRBG-lkp@intel.com>
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
branch HEAD: c3cad890877f59aeeaf5a638aa7a7c0612c16fa1  Automatic merge of 'master' into merge (2023-07-24 13:19)

elapsed time: 960m

configs tested: 153
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230728   gcc  
arc                  randconfig-r043-20230729   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r005-20230729   gcc  
arm                  randconfig-r011-20230729   clang
arm                  randconfig-r013-20230729   clang
arm                  randconfig-r021-20230729   clang
arm                  randconfig-r036-20230729   gcc  
arm                  randconfig-r046-20230728   gcc  
arm                  randconfig-r046-20230729   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r015-20230729   gcc  
arm64                randconfig-r022-20230729   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230729   gcc  
csky                 randconfig-r006-20230729   gcc  
csky                 randconfig-r011-20230729   gcc  
csky                 randconfig-r026-20230729   gcc  
hexagon              randconfig-r002-20230729   clang
hexagon              randconfig-r015-20230729   clang
hexagon              randconfig-r041-20230728   clang
hexagon              randconfig-r041-20230729   clang
hexagon              randconfig-r045-20230728   clang
hexagon              randconfig-r045-20230729   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230728   gcc  
i386         buildonly-randconfig-r004-20230729   clang
i386         buildonly-randconfig-r005-20230728   gcc  
i386         buildonly-randconfig-r005-20230729   clang
i386         buildonly-randconfig-r006-20230728   gcc  
i386         buildonly-randconfig-r006-20230729   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230728   gcc  
i386                 randconfig-i001-20230729   clang
i386                 randconfig-i002-20230728   gcc  
i386                 randconfig-i002-20230729   clang
i386                 randconfig-i003-20230728   gcc  
i386                 randconfig-i003-20230729   clang
i386                 randconfig-i004-20230728   gcc  
i386                 randconfig-i004-20230729   clang
i386                 randconfig-i005-20230728   gcc  
i386                 randconfig-i005-20230729   clang
i386                 randconfig-i006-20230728   gcc  
i386                 randconfig-i006-20230729   clang
i386                 randconfig-i011-20230728   clang
i386                 randconfig-i011-20230729   gcc  
i386                 randconfig-i012-20230728   clang
i386                 randconfig-i012-20230729   gcc  
i386                 randconfig-i013-20230728   clang
i386                 randconfig-i013-20230729   gcc  
i386                 randconfig-i014-20230728   clang
i386                 randconfig-i014-20230729   gcc  
i386                 randconfig-i015-20230728   clang
i386                 randconfig-i015-20230729   gcc  
i386                 randconfig-i016-20230728   clang
i386                 randconfig-i016-20230729   gcc  
i386                 randconfig-r012-20230729   gcc  
i386                 randconfig-r024-20230729   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r013-20230729   gcc  
loongarch            randconfig-r032-20230729   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r016-20230729   gcc  
m68k                 randconfig-r031-20230729   gcc  
m68k                 randconfig-r035-20230729   gcc  
microblaze           randconfig-r034-20230729   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r035-20230729   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230729   gcc  
nios2                randconfig-r014-20230729   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230729   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r001-20230729   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230728   clang
riscv                randconfig-r042-20230729   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r025-20230729   gcc  
s390                 randconfig-r034-20230729   clang
s390                 randconfig-r044-20230728   clang
s390                 randconfig-r044-20230729   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r012-20230729   gcc  
sh                   randconfig-r021-20230729   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230729   gcc  
sparc                randconfig-r025-20230729   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r006-20230729   gcc  
um                   randconfig-r022-20230729   clang
um                   randconfig-r023-20230729   clang
um                   randconfig-r024-20230729   clang
um                   randconfig-r032-20230729   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230728   gcc  
x86_64       buildonly-randconfig-r001-20230729   clang
x86_64       buildonly-randconfig-r002-20230728   gcc  
x86_64       buildonly-randconfig-r002-20230729   clang
x86_64       buildonly-randconfig-r003-20230728   gcc  
x86_64       buildonly-randconfig-r003-20230729   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r005-20230729   clang
x86_64               randconfig-x001-20230728   clang
x86_64               randconfig-x002-20230728   clang
x86_64               randconfig-x003-20230728   clang
x86_64               randconfig-x004-20230728   clang
x86_64               randconfig-x005-20230728   clang
x86_64               randconfig-x006-20230728   clang
x86_64               randconfig-x011-20230728   gcc  
x86_64               randconfig-x011-20230729   clang
x86_64               randconfig-x012-20230728   gcc  
x86_64               randconfig-x012-20230729   clang
x86_64               randconfig-x013-20230728   gcc  
x86_64               randconfig-x013-20230729   clang
x86_64               randconfig-x014-20230728   gcc  
x86_64               randconfig-x014-20230729   clang
x86_64               randconfig-x015-20230728   gcc  
x86_64               randconfig-x015-20230729   clang
x86_64               randconfig-x016-20230728   gcc  
x86_64               randconfig-x016-20230729   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
