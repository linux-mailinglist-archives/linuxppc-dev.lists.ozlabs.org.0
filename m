Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 740686EFEB4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Apr 2023 02:57:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q6HQh1r9dz3fBL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Apr 2023 10:57:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=awOd5/7S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=awOd5/7S;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q6HPr1pp2z3bnP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Apr 2023 10:57:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682557024; x=1714093024;
  h=date:from:to:cc:subject:message-id;
  bh=oz15V8X+500mqKhfuq1a5Zq3BYjr8bPKW/v1231nNVg=;
  b=awOd5/7SMxLzHSD1+rV6YWICxoxLhEw89zqNRD8uxbAbQ+BykP58VnWN
   YEdMHHrHyRmKQ+oT4Aaw4LhFdT2irBrDR9GUnz0fKrAjwd26sNkeuZ/wt
   1pPj/s4Z+TJpqQlVQ76A1d0/5dWapQ7/NlxfBW9JVD3b3quczV/xvvcW6
   WBmChdJn1h5ozSBBBvivOSwCjlNshXtLMgD8RKFcsCxsUajawu5tFxkI2
   YYcJEbO0gUQ0vVtiM5ejiRWCTRtNgJru53YCcZS8tV1a8BbMBh9BJLItG
   IRYtsCXMUAxdxUSD2yuIA+QT2ltihQ1kiNy/lt1y76P03ljyWiKdQOuZn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="412607217"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="412607217"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 17:56:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="696852495"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="696852495"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 26 Apr 2023 17:56:57 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prpwP-0000cQ-0k;
	Thu, 27 Apr 2023 00:56:57 +0000
Date: Thu, 27 Apr 2023 08:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 169f8997968ab620d750d9a45e15c5288d498356
Message-ID: <20230427005641.l3DRU%lkp@intel.com>
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
branch HEAD: 169f8997968ab620d750d9a45e15c5288d498356  powerpc/64s: Disable pcrel code model on Clang

elapsed time: 726m

configs tested: 101
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230426   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r036-20230426   gcc  
arc                  randconfig-r043-20230426   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r031-20230426   gcc  
arm                  randconfig-r046-20230426   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r011-20230426   gcc  
csky         buildonly-randconfig-r004-20230426   gcc  
csky         buildonly-randconfig-r005-20230426   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230426   clang
hexagon              randconfig-r045-20230426   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r001-20230426   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r016-20230426   gcc  
ia64                 randconfig-r022-20230426   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r025-20230426   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r006-20230426   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r023-20230426   gcc  
microblaze           randconfig-r033-20230426   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r014-20230426   clang
nios2                               defconfig   gcc  
openrisc             randconfig-r001-20230426   gcc  
openrisc             randconfig-r006-20230426   gcc  
openrisc             randconfig-r035-20230426   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r012-20230426   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r024-20230426   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r003-20230426   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230426   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230426   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r004-20230426   gcc  
sh                   randconfig-r034-20230426   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r013-20230426   gcc  
sparc64              randconfig-r015-20230426   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r003-20230426   gcc  
xtensa               randconfig-r005-20230426   gcc  
xtensa               randconfig-r026-20230426   gcc  
xtensa               randconfig-r032-20230426   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
