Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB116AAD96
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 01:08:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PThqs2QwTz3f3C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 11:08:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RJn1z7c+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RJn1z7c+;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PThpv70jRz3bTs
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Mar 2023 11:07:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677974840; x=1709510840;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bZk+WBeeov1gWAbv4kYx+RLjTYgMggGGs+J9+ufRlb8=;
  b=RJn1z7c+3rGjmg0lWy4pWKVSaon5CbEiq0Uc1BRznaeT6jOKLxbJfLjK
   SkON5pJQSUwuadn8e3DDPL9nhZjHLrjPVf9Sia3l8B7C+1Ia+W3sIAGg0
   0hd+9Foy4KIObANQIKVAcBm4RqQU3LV+g1DdMoR03o9vYQxN3xdX6QdLK
   fOXxfjvuRAdgz19P9HZBxo7S+RaCZHeb1NzGe9jamjZAa3vzXzr3+Hdik
   AptAinYiCmCGf2SZtVlslc95m1e/SiWp3hG2xkxE9yi56wVUwFSoKvR1W
   9KuuiOJYDgwXpAKJJKYWX0PFE1OnVcH8P/ELk2UdxRWLw73bXGEbtxxBG
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="421600401"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="421600401"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 16:07:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="818900921"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="818900921"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2023 16:07:09 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYbu9-0002Qo-0Z;
	Sun, 05 Mar 2023 00:07:09 +0000
Date: Sun, 05 Mar 2023 08:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 422fbcbf91303706823bc3babceb1df1a42112bf
Message-ID: <6403dd18.1iEGFePeVVwKgzhr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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
branch HEAD: 422fbcbf91303706823bc3babceb1df1a42112bf  Automatic merge of 'fixes' into merge (2023-03-04 21:31)

elapsed time: 794m

configs tested: 149
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230304   gcc  
alpha                randconfig-r006-20230302   gcc  
alpha                randconfig-r006-20230304   gcc  
alpha                randconfig-r012-20230302   gcc  
alpha                randconfig-r036-20230302   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r023-20230304   gcc  
arc                  randconfig-r043-20230302   gcc  
arc                  randconfig-r043-20230303   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r004-20230302   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r002-20230304   clang
arm                  randconfig-r005-20230304   clang
arm                  randconfig-r006-20230302   clang
arm                  randconfig-r025-20230304   gcc  
arm                  randconfig-r031-20230302   clang
arm                  randconfig-r032-20230302   clang
arm                  randconfig-r046-20230302   gcc  
arm                  randconfig-r046-20230303   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230302   gcc  
arm64                randconfig-r022-20230302   clang
arm64                randconfig-r034-20230302   gcc  
csky         buildonly-randconfig-r002-20230302   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230302   gcc  
csky                 randconfig-r015-20230302   gcc  
csky                 randconfig-r022-20230302   gcc  
hexagon              randconfig-r012-20230302   clang
hexagon              randconfig-r021-20230302   clang
hexagon              randconfig-r041-20230302   clang
hexagon              randconfig-r041-20230303   clang
hexagon              randconfig-r045-20230302   clang
hexagon              randconfig-r045-20230303   clang
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
ia64                                defconfig   gcc  
ia64                 randconfig-r014-20230302   gcc  
ia64                 randconfig-r022-20230304   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230304   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r004-20230302   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r004-20230302   gcc  
m68k                 randconfig-r005-20230304   gcc  
m68k                 randconfig-r035-20230302   gcc  
microblaze   buildonly-randconfig-r001-20230302   gcc  
microblaze   buildonly-randconfig-r003-20230302   gcc  
microblaze           randconfig-r026-20230302   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r005-20230302   clang
mips                 randconfig-r001-20230302   clang
mips                 randconfig-r011-20230302   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r016-20230302   gcc  
nios2                randconfig-r026-20230304   gcc  
openrisc             randconfig-r001-20230304   gcc  
openrisc             randconfig-r003-20230302   gcc  
openrisc             randconfig-r025-20230302   gcc  
openrisc             randconfig-r032-20230302   gcc  
openrisc             randconfig-r033-20230302   gcc  
parisc       buildonly-randconfig-r003-20230302   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230302   gcc  
parisc               randconfig-r014-20230302   gcc  
parisc               randconfig-r015-20230302   gcc  
parisc               randconfig-r021-20230304   gcc  
parisc               randconfig-r024-20230302   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r031-20230302   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230302   clang
riscv                randconfig-r042-20230303   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230302   clang
s390                                defconfig   gcc  
s390                 randconfig-r002-20230304   gcc  
s390                 randconfig-r024-20230304   clang
s390                 randconfig-r044-20230302   clang
s390                 randconfig-r044-20230303   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r006-20230302   gcc  
sh                   randconfig-r001-20230304   gcc  
sh                   randconfig-r002-20230302   gcc  
sh                   randconfig-r003-20230302   gcc  
sh                   randconfig-r013-20230302   gcc  
sh                   randconfig-r021-20230302   gcc  
sh                   randconfig-r023-20230302   gcc  
sh                   randconfig-r025-20230302   gcc  
sh                   randconfig-r036-20230302   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230302   gcc  
sparc                randconfig-r004-20230304   gcc  
sparc                randconfig-r024-20230302   gcc  
sparc64              randconfig-r003-20230304   gcc  
sparc64              randconfig-r006-20230304   gcc  
sparc64              randconfig-r011-20230302   gcc  
sparc64              randconfig-r013-20230302   gcc  
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
xtensa       buildonly-randconfig-r005-20230302   gcc  
xtensa               randconfig-r026-20230302   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
