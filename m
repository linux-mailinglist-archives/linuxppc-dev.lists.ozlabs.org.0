Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1696175BC93
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 04:54:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ALuNCEzP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6Z076xhRz3c2j
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 12:54:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ALuNCEzP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6Yxk42ZTz3bdG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 12:52:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689907946; x=1721443946;
  h=date:from:to:cc:subject:message-id;
  bh=e15PHXS2AY8MwgcBxSt2wrtmHTIpF1oD2BtDhmfG/cs=;
  b=ALuNCEzPcYDQZbPNqrAKPrsEZOfDkvDWmh++IKoJIhOZSQaSN1qqnmpT
   cOGajgmynV95btlvubentdrB2mDYwYbT9wZ/o56Z+FifY5P0qaJYTn8H7
   FvxGNowz/6/ZrDt9G9+UB2pr84p1iqle5N+SGnN2jMArSNHp9xGaNcJXK
   m6oRTVYyvYkSs39Zj7nSiMWycFLt6aBmP0cqdIPGTrLwx1H0IzI0y6Jco
   1k6C5RG2BIpWuBeJppk085Le6OS1zzTetR7S5O9vRc5Gin4UKJQMOT1G9
   pMqMOlxhJIi2PlC9/oPGx0v/rzroWXQsuOH7fpc+5rRwibltXRJEFYgbq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="453297211"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="453297211"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 19:52:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="848683555"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="848683555"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 20 Jul 2023 19:52:20 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMgFV-0006mx-1r;
	Fri, 21 Jul 2023 02:52:12 +0000
Date: Fri, 21 Jul 2023 10:50:18 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 b33ef67081f836e80773e2cec99592e78091bace
Message-ID: <202307211017.E8KGXdg8-lkp@intel.com>
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
branch HEAD: b33ef67081f836e80773e2cec99592e78091bace  Automatic merge of 'fixes' into merge (2023-07-20 23:24)

elapsed time: 797m

configs tested: 143
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r011-20230720   gcc  
alpha                randconfig-r022-20230720   gcc  
alpha                randconfig-r023-20230720   gcc  
alpha                randconfig-r024-20230720   gcc  
alpha                randconfig-r033-20230720   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230720   gcc  
arc                  randconfig-r016-20230720   gcc  
arc                  randconfig-r032-20230720   gcc  
arc                  randconfig-r036-20230720   gcc  
arc                  randconfig-r043-20230720   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                  randconfig-r004-20230720   clang
arm                  randconfig-r033-20230720   clang
arm                  randconfig-r046-20230720   gcc  
arm                         s3c6400_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230720   gcc  
arm64                randconfig-r016-20230720   clang
arm64                randconfig-r026-20230720   clang
csky                                defconfig   gcc  
csky                 randconfig-r011-20230720   gcc  
csky                 randconfig-r014-20230720   gcc  
csky                 randconfig-r021-20230720   gcc  
hexagon              randconfig-r013-20230720   clang
hexagon              randconfig-r041-20230720   clang
hexagon              randconfig-r045-20230720   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230720   gcc  
i386         buildonly-randconfig-r005-20230720   gcc  
i386         buildonly-randconfig-r006-20230720   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230720   gcc  
i386                 randconfig-i002-20230720   gcc  
i386                 randconfig-i003-20230720   gcc  
i386                 randconfig-i004-20230720   gcc  
i386                 randconfig-i005-20230720   gcc  
i386                 randconfig-i006-20230720   gcc  
i386                 randconfig-i011-20230720   clang
i386                 randconfig-i012-20230720   clang
i386                 randconfig-i013-20230720   clang
i386                 randconfig-i014-20230720   clang
i386                 randconfig-i015-20230720   clang
i386                 randconfig-i016-20230720   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r034-20230720   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r023-20230720   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                           mtx1_defconfig   clang
mips                 randconfig-r005-20230720   clang
mips                 randconfig-r013-20230720   gcc  
mips                 randconfig-r024-20230720   gcc  
mips                 randconfig-r025-20230720   gcc  
mips                 randconfig-r035-20230720   clang
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230720   gcc  
nios2                randconfig-r012-20230720   gcc  
openrisc                            defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230720   gcc  
parisc               randconfig-r005-20230720   gcc  
parisc               randconfig-r015-20230720   gcc  
parisc               randconfig-r031-20230720   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                        fsp2_defconfig   clang
powerpc                        icon_defconfig   clang
powerpc                      katmai_defconfig   clang
powerpc                    klondike_defconfig   gcc  
powerpc                      makalu_defconfig   gcc  
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                      ppc40x_defconfig   gcc  
powerpc              randconfig-r026-20230720   clang
powerpc                         wii_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230720   gcc  
riscv                randconfig-r032-20230720   gcc  
riscv                randconfig-r042-20230720   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r015-20230720   clang
s390                 randconfig-r031-20230720   gcc  
s390                 randconfig-r044-20230720   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r003-20230720   gcc  
sh                           se7343_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r034-20230720   gcc  
sparc64              randconfig-r001-20230720   gcc  
sparc64              randconfig-r036-20230720   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r021-20230720   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230720   gcc  
x86_64       buildonly-randconfig-r002-20230720   gcc  
x86_64       buildonly-randconfig-r003-20230720   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230720   clang
x86_64               randconfig-x002-20230720   clang
x86_64               randconfig-x003-20230720   clang
x86_64               randconfig-x004-20230720   clang
x86_64               randconfig-x005-20230720   clang
x86_64               randconfig-x006-20230720   clang
x86_64               randconfig-x011-20230720   gcc  
x86_64               randconfig-x012-20230720   gcc  
x86_64               randconfig-x013-20230720   gcc  
x86_64               randconfig-x014-20230720   gcc  
x86_64               randconfig-x015-20230720   gcc  
x86_64               randconfig-x016-20230720   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
