Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B44E674318E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 02:21:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kzRWahBu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsbZq0Mglz3bjc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 10:21:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kzRWahBu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsbYs4lDjz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 10:20:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688084417; x=1719620417;
  h=date:from:to:cc:subject:message-id;
  bh=YDAvb72aVVOfX7zrO/xwKfabpUCGTcF3lc81cT+mrEM=;
  b=kzRWahBuVdqcWCG4VteOyNtJSv9Ie9/rlV9F0mVfrYuHdz2q4/jiSmtg
   yRknTSPcfgw+JsXKHtcozPjjNY2+fFgtm2FjHZJZsMYvLxMf61lBY+Rk5
   aT8+K5h0ujjZ9UaEI/31SYeanIUcLUdrQY789aSOmvxX5HVs2mssIFdpT
   ydwtiKogJc0TEYlHFyKyPHUknDIe+bJxZJ17/GxmqZGATsdUQUaAfAogL
   khxoklkDNqE2GbXxgg49yAmn1U+Sd7QoQMVeWF3rRXJQvBRHXv6YTKqtV
   uIXNIEjA+mYrBe68TQBbOUsvEOmDye6m4QP5a5EBVaaiIultIKIz1ls/3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="364846681"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="364846681"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 17:20:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="841662079"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="841662079"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Jun 2023 17:20:05 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qF1ro-000EXa-2d;
	Fri, 30 Jun 2023 00:20:04 +0000
Date: Fri, 30 Jun 2023 08:19:30 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/cpu-smt] BUILD REGRESSION
 80d018310a08fc4246e5fd367707beeecbd920b0
Message-ID: <202306300826.UAQm3E5v-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/cpu-smt
branch HEAD: 80d018310a08fc4246e5fd367707beeecbd920b0  powerpc/pseries: Honour current SMT state when DLPAR onlining CPUs

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202305312356.SfvJ8Iwh-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

kernel/cpu.c:2606:36: error: 'cpu_smt_max_threads' undeclared (first use in this function); did you mean 'cpu_smt_num_threads'?

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm-allmodconfig
|   `-- kernel-cpu.c:error:cpu_smt_max_threads-undeclared-(first-use-in-this-function)
|-- arm-allyesconfig
|   `-- kernel-cpu.c:error:cpu_smt_max_threads-undeclared-(first-use-in-this-function)
|-- arm-defconfig
|   `-- kernel-cpu.c:error:cpu_smt_max_threads-undeclared-(first-use-in-this-function)
|-- arm64-allyesconfig
|   `-- kernel-cpu.c:error:cpu_smt_max_threads-undeclared-(first-use-in-this-function)
|-- arm64-defconfig
|   `-- kernel-cpu.c:error:cpu_smt_max_threads-undeclared-(first-use-in-this-function)
|-- mips-allmodconfig
|   `-- kernel-cpu.c:error:cpu_smt_max_threads-undeclared-(first-use-in-this-function)
|-- mips-allyesconfig
|   `-- kernel-cpu.c:error:cpu_smt_max_threads-undeclared-(first-use-in-this-function)
|-- parisc-allyesconfig
|   `-- kernel-cpu.c:error:cpu_smt_max_threads-undeclared-(first-use-in-this-function)
|-- parisc-defconfig
|   `-- kernel-cpu.c:error:cpu_smt_max_threads-undeclared-(first-use-in-this-function)
|-- parisc64-defconfig
|   `-- kernel-cpu.c:error:cpu_smt_max_threads-undeclared-(first-use-in-this-function)
|-- riscv-allmodconfig
|   `-- kernel-cpu.c:error:cpu_smt_max_threads-undeclared-(first-use-in-this-function)
|-- riscv-allyesconfig
|   `-- kernel-cpu.c:error:cpu_smt_max_threads-undeclared-(first-use-in-this-function)
|-- riscv-defconfig
|   `-- kernel-cpu.c:error:cpu_smt_max_threads-undeclared-(first-use-in-this-function)
|-- riscv-rv32_defconfig
|   `-- kernel-cpu.c:error:cpu_smt_max_threads-undeclared-(first-use-in-this-function)
|-- s390-allmodconfig
|   `-- kernel-cpu.c:error:cpu_smt_max_threads-undeclared-(first-use-in-this-function)
|-- s390-allyesconfig
|   `-- kernel-cpu.c:error:cpu_smt_max_threads-undeclared-(first-use-in-this-function)
|-- s390-defconfig
|   `-- kernel-cpu.c:error:cpu_smt_max_threads-undeclared-(first-use-in-this-function)
`-- sparc-allyesconfig
    `-- kernel-cpu.c:error:cpu_smt_max_threads-undeclared-(first-use-in-this-function)

elapsed time: 723m

configs tested: 104
configs skipped: 7

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r035-20230629   gcc  
arc                  randconfig-r043-20230629   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r006-20230629   clang
arm                  randconfig-r024-20230629   gcc  
arm                  randconfig-r046-20230629   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r014-20230629   clang
hexagon              randconfig-r041-20230629   clang
hexagon              randconfig-r045-20230629   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230629   gcc  
i386         buildonly-randconfig-r005-20230629   gcc  
i386         buildonly-randconfig-r006-20230629   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230629   gcc  
i386                 randconfig-i002-20230629   gcc  
i386                 randconfig-i003-20230629   gcc  
i386                 randconfig-i004-20230629   gcc  
i386                 randconfig-i005-20230629   gcc  
i386                 randconfig-i006-20230629   gcc  
i386                 randconfig-i011-20230629   clang
i386                 randconfig-i012-20230629   clang
i386                 randconfig-i013-20230629   clang
i386                 randconfig-i014-20230629   clang
i386                 randconfig-i015-20230629   clang
i386                 randconfig-i016-20230629   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r005-20230629   gcc  
loongarch            randconfig-r034-20230629   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r015-20230629   gcc  
m68k                 randconfig-r025-20230629   gcc  
microblaze           randconfig-r023-20230629   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r031-20230629   gcc  
openrisc             randconfig-r022-20230629   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r011-20230629   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r033-20230629   gcc  
riscv                randconfig-r042-20230629   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230629   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r003-20230629   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r026-20230629   gcc  
sparc64              randconfig-r012-20230629   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r001-20230629   clang
um                   randconfig-r036-20230629   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230629   gcc  
x86_64       buildonly-randconfig-r002-20230629   gcc  
x86_64       buildonly-randconfig-r003-20230629   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r002-20230629   gcc  
x86_64               randconfig-x001-20230629   clang
x86_64               randconfig-x002-20230629   clang
x86_64               randconfig-x003-20230629   clang
x86_64               randconfig-x004-20230629   clang
x86_64               randconfig-x005-20230629   clang
x86_64               randconfig-x006-20230629   clang
x86_64               randconfig-x011-20230629   gcc  
x86_64               randconfig-x012-20230629   gcc  
x86_64               randconfig-x013-20230629   gcc  
x86_64               randconfig-x014-20230629   gcc  
x86_64               randconfig-x015-20230629   gcc  
x86_64               randconfig-x016-20230629   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
