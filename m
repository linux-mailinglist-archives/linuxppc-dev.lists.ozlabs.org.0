Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E496EA247
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Apr 2023 05:17:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2fp84vLyz3fVG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Apr 2023 13:17:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PCgJw4Mm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PCgJw4Mm;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2fnF4j2Bz3c6x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Apr 2023 13:16:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682046977; x=1713582977;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=C5hCjxWf8sGHWJEWp314pUHEHAWptfKJ6MGkr+WL9v8=;
  b=PCgJw4Mmp8OazKCxTkcU33zfYH76TEKnc+eHQc6zvlDfijT1dGdMq+a/
   oML1aalntY/1SQid+42kyTt5EaMme4qJoK2RhT/1U6aVb9/sQ9ctnfMSX
   hC7AZZEVAlJ0lT7xgM5lnxW2IevyrRN7k9AJTKXOSoMPYdSEQL6iyAO0w
   93YU4kR+3eUeC037nLI6lg+vQSSKBnUijH8tlqW0xbkTUporfSiuCd8/f
   Zm/nIP2KyIFWRJgD73j6THUF5ANT9034IjCwerxJ4gu6RlPpw6YgRMnqW
   6JHP2AbiNVtBsRzqj3TM+qXebrxEaNpJImiY+ymdJBWF/xbBJMs7wVULI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="326231667"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="326231667"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 20:16:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="692140839"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="692140839"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Apr 2023 20:16:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pphFh-000gGj-05;
	Fri, 21 Apr 2023 03:16:01 +0000
Date: Fri, 21 Apr 2023 11:15:29 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 5741d7d2a179be6418fbd85442d92b026477f5b8
Message-ID: <6441ffd1.9hbD2ENo4ZzWt7JD%lkp@intel.com>
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
branch HEAD: 5741d7d2a179be6418fbd85442d92b026477f5b8  Automatic merge of 'next' into merge (2023-04-21 00:06)

elapsed time: 726m

configs tested: 167
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230417   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230416   gcc  
alpha                randconfig-r036-20230420   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r006-20230416   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r025-20230419   gcc  
arc                  randconfig-r043-20230416   gcc  
arc                  randconfig-r043-20230417   gcc  
arc                  randconfig-r043-20230418   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r013-20230417   gcc  
arm                  randconfig-r021-20230416   clang
arm                  randconfig-r046-20230416   clang
arm                  randconfig-r046-20230417   gcc  
arm                  randconfig-r046-20230418   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230416   clang
arm64                randconfig-r016-20230416   gcc  
arm64                randconfig-r023-20230419   clang
arm64                randconfig-r026-20230419   clang
arm64                randconfig-r034-20230419   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r013-20230420   gcc  
csky                 randconfig-r036-20230417   gcc  
hexagon      buildonly-randconfig-r003-20230417   clang
hexagon              randconfig-r012-20230420   clang
hexagon              randconfig-r032-20230417   clang
hexagon              randconfig-r033-20230417   clang
hexagon              randconfig-r035-20230417   clang
hexagon              randconfig-r041-20230416   clang
hexagon              randconfig-r041-20230417   clang
hexagon              randconfig-r041-20230418   clang
hexagon              randconfig-r045-20230416   clang
hexagon              randconfig-r045-20230417   clang
hexagon              randconfig-r045-20230418   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230417   gcc  
i386                 randconfig-a002-20230417   gcc  
i386                 randconfig-a003-20230417   gcc  
i386                 randconfig-a004-20230417   gcc  
i386                 randconfig-a005-20230417   gcc  
i386                 randconfig-a006-20230417   gcc  
i386                 randconfig-a011-20230417   clang
i386                 randconfig-a012-20230417   clang
i386                 randconfig-a013-20230417   clang
i386                 randconfig-a014-20230417   clang
i386                 randconfig-a015-20230417   clang
i386                 randconfig-a016-20230417   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r002-20230417   gcc  
ia64         buildonly-randconfig-r005-20230416   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r002-20230417   gcc  
ia64                 randconfig-r012-20230416   gcc  
ia64                 randconfig-r031-20230419   gcc  
ia64                 randconfig-r036-20230416   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r006-20230418   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r011-20230420   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r005-20230418   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r011-20230417   gcc  
m68k                 randconfig-r013-20230416   gcc  
microblaze   buildonly-randconfig-r003-20230418   gcc  
microblaze           randconfig-r001-20230417   gcc  
microblaze           randconfig-r006-20230417   gcc  
microblaze           randconfig-r014-20230417   gcc  
microblaze           randconfig-r016-20230417   gcc  
microblaze           randconfig-r023-20230420   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r001-20230416   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r014-20230420   gcc  
nios2                randconfig-r026-20230420   gcc  
openrisc     buildonly-randconfig-r006-20230417   gcc  
openrisc             randconfig-r033-20230419   gcc  
openrisc             randconfig-r033-20230420   gcc  
parisc       buildonly-randconfig-r004-20230416   gcc  
parisc       buildonly-randconfig-r004-20230417   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r026-20230416   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r001-20230417   clang
powerpc              randconfig-r002-20230416   clang
powerpc              randconfig-r003-20230416   clang
powerpc              randconfig-r005-20230417   gcc  
powerpc              randconfig-r015-20230420   gcc  
powerpc              randconfig-r023-20230416   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r015-20230417   clang
riscv                randconfig-r021-20230420   gcc  
riscv                randconfig-r042-20230416   gcc  
riscv                randconfig-r042-20230417   clang
riscv                randconfig-r042-20230418   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r022-20230416   gcc  
s390                 randconfig-r035-20230416   clang
s390                 randconfig-r044-20230416   gcc  
s390                 randconfig-r044-20230417   clang
s390                 randconfig-r044-20230418   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r003-20230416   gcc  
sh                   randconfig-r016-20230420   gcc  
sparc        buildonly-randconfig-r001-20230416   gcc  
sparc        buildonly-randconfig-r002-20230418   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230417   gcc  
sparc                randconfig-r031-20230416   gcc  
sparc                randconfig-r034-20230420   gcc  
sparc64      buildonly-randconfig-r002-20230416   gcc  
sparc64              randconfig-r003-20230417   gcc  
sparc64              randconfig-r005-20230416   gcc  
sparc64              randconfig-r011-20230416   gcc  
sparc64              randconfig-r024-20230416   gcc  
sparc64              randconfig-r031-20230420   gcc  
sparc64              randconfig-r034-20230417   gcc  
sparc64              randconfig-r035-20230419   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230417   gcc  
x86_64               randconfig-a002-20230417   gcc  
x86_64               randconfig-a003-20230417   gcc  
x86_64               randconfig-a004-20230417   gcc  
x86_64               randconfig-a005-20230417   gcc  
x86_64               randconfig-a006-20230417   gcc  
x86_64               randconfig-a011-20230417   clang
x86_64               randconfig-a012-20230417   clang
x86_64               randconfig-a013-20230417   clang
x86_64               randconfig-a014-20230417   clang
x86_64               randconfig-a015-20230417   clang
x86_64               randconfig-a016-20230417   clang
x86_64               randconfig-r031-20230417   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-syz   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230418   gcc  
xtensa               randconfig-r014-20230416   gcc  
xtensa               randconfig-r022-20230419   gcc  
xtensa               randconfig-r024-20230420   gcc  
xtensa               randconfig-r032-20230416   gcc  
xtensa               randconfig-r034-20230416   gcc  
xtensa               randconfig-r036-20230419   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
