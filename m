Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2E36BC39B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 03:10:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcW1s2xTjz3f4y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 13:10:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ipVkiZCA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ipVkiZCA;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcVzv09dBz3c63
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 13:08:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678932523; x=1710468523;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ERxdJq3Te5XbNryJxBY9d1aBBIs9HzFJ/NHLk3oDH2Q=;
  b=ipVkiZCAKrKrQAjdhUIpDk85q9MEDw9sXk9/aAESZlpftWq9+CKlHNAj
   Jsrr2UDmOlreSDvVPCtCvB6JTiVGJ6Q3AViX3eoO75ZuglPGxZVchs20v
   MHcP8ef5Hn82Z14+77So3lCTe38Y3uRAqzcwnBb4LKyHoFreOQLlhXWtF
   SUwzj1sks0+h8G6RfLgZt1wekrVY7x3vdiynnDGc36VuvoIQtLrFJFe41
   tgiPKyeXjWNsWPTvACTZrMXzrZEf5tcvcIsEuNOruU5z4iir4UL33swQA
   qfckY+FrR/1UfgvBW6Kg+8xC+j8bbgtHwuh01bPqDMmtZDASoPG/ftR4X
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="337884532"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="337884532"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 19:08:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="748679016"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="748679016"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Mar 2023 19:08:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcd2O-0008Dv-09;
	Thu, 16 Mar 2023 02:08:16 +0000
Date: Thu, 16 Mar 2023 10:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 065ffaee73892e8a3629b4cfbe635697807a3c6f
Message-ID: <641279d7.zIDNLwwSg8JPZPYu%lkp@intel.com>
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
branch HEAD: 065ffaee73892e8a3629b4cfbe635697807a3c6f  Automatic merge of 'master' into merge (2023-03-14 09:54)

elapsed time: 728m

configs tested: 137
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r025-20230312   gcc  
alpha                randconfig-r026-20230313   gcc  
alpha                randconfig-r031-20230313   gcc  
alpha                randconfig-r033-20230313   gcc  
alpha                randconfig-r034-20230313   gcc  
alpha                randconfig-r036-20230313   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r001-20230312   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230312   gcc  
arc                  randconfig-r043-20230313   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r001-20230312   gcc  
arm                  randconfig-r013-20230312   clang
arm                  randconfig-r021-20230312   clang
arm                  randconfig-r046-20230312   clang
arm                  randconfig-r046-20230313   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230313   gcc  
arm64                randconfig-r012-20230315   clang
arm64                randconfig-r033-20230312   clang
arm64                randconfig-r035-20230313   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r026-20230312   gcc  
csky                 randconfig-r032-20230312   gcc  
hexagon      buildonly-randconfig-r001-20230313   clang
hexagon              randconfig-r004-20230312   clang
hexagon              randconfig-r041-20230312   clang
hexagon              randconfig-r041-20230313   clang
hexagon              randconfig-r045-20230312   clang
hexagon              randconfig-r045-20230313   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230313   gcc  
i386                 randconfig-a002-20230313   gcc  
i386                 randconfig-a003-20230313   gcc  
i386                 randconfig-a004-20230313   gcc  
i386                 randconfig-a005-20230313   gcc  
i386                 randconfig-a006-20230313   gcc  
i386                 randconfig-a011-20230313   clang
i386                 randconfig-a012-20230313   clang
i386                 randconfig-a013-20230313   clang
i386                 randconfig-a014-20230313   clang
i386                 randconfig-a015-20230313   clang
i386                 randconfig-a016-20230313   clang
i386                 randconfig-r014-20230313   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r006-20230313   gcc  
ia64                 randconfig-r015-20230315   gcc  
ia64                 randconfig-r016-20230312   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r004-20230313   gcc  
loongarch            randconfig-r013-20230313   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r011-20230312   gcc  
m68k                 randconfig-r011-20230313   gcc  
m68k                 randconfig-r012-20230312   gcc  
m68k                 randconfig-r014-20230315   gcc  
m68k                 randconfig-r025-20230313   gcc  
microblaze   buildonly-randconfig-r005-20230312   gcc  
microblaze           randconfig-r003-20230312   gcc  
microblaze           randconfig-r005-20230312   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r022-20230312   clang
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230313   gcc  
nios2                randconfig-r015-20230313   gcc  
nios2                randconfig-r016-20230313   gcc  
nios2                randconfig-r023-20230313   gcc  
nios2                randconfig-r031-20230312   gcc  
openrisc             randconfig-r012-20230313   gcc  
openrisc             randconfig-r023-20230312   gcc  
openrisc             randconfig-r032-20230313   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230312   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r013-20230315   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r004-20230312   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230313   gcc  
riscv                randconfig-r042-20230312   gcc  
riscv                randconfig-r042-20230313   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230313   gcc  
s390                 randconfig-r036-20230312   clang
s390                 randconfig-r044-20230312   gcc  
s390                 randconfig-r044-20230313   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r003-20230312   gcc  
sh                   randconfig-r021-20230313   gcc  
sparc        buildonly-randconfig-r003-20230313   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r024-20230312   gcc  
sparc                randconfig-r034-20230312   gcc  
sparc64      buildonly-randconfig-r002-20230313   gcc  
sparc64              randconfig-r015-20230312   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r005-20230313   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230313   gcc  
x86_64               randconfig-a002-20230313   gcc  
x86_64               randconfig-a003-20230313   gcc  
x86_64               randconfig-a004-20230313   gcc  
x86_64               randconfig-a005-20230313   gcc  
x86_64               randconfig-a006-20230313   gcc  
x86_64               randconfig-a011-20230313   clang
x86_64               randconfig-a012-20230313   clang
x86_64               randconfig-a013-20230313   clang
x86_64               randconfig-a014-20230313   clang
x86_64               randconfig-a015-20230313   clang
x86_64               randconfig-a016-20230313   clang
x86_64               randconfig-r022-20230313   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r002-20230312   gcc  
xtensa               randconfig-r024-20230313   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
