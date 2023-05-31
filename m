Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8B7718BAA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 23:13:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWhnx5Xhsz3fGm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 07:13:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ehFsXNFX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ehFsXNFX;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWhn31Bh3z2xdt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 07:12:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685567575; x=1717103575;
  h=date:from:to:cc:subject:message-id;
  bh=OGF0VBaTrMwwiJdePMpWozagD/QTWer5umNm4MC+3bg=;
  b=ehFsXNFX/GcgHCyVCSslUzLx5fpCc0zMBMckD1OK0P/UKlv5FoZ9cQUN
   UGo9DPae4egdu4oV05hed+tqzXtqTtpEqJSYqyQYuD2/6NCfKgFALhmmk
   8Zcp5eITDWJLbktQviIXCrh+wI83x+7H6sMqtjGVwfTb5G3i3B8L6V7i3
   SWBBzPlEkwZdWPFv/2BFd2YV0ycLLJuuc+cmvEG0gpEdxr+jCnm1uZUuL
   he2vFJmLbgkAzJzdWuA2yvohRp4MIHocS6Ahrqw0oUHXH0Xtcx+KZA0TN
   WBuxlDhnoEPhHlVDW5kXJbn8L898Zs1p6Yrnmw4Wo+rHc0qf1MF+zTq2D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="383633043"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="383633043"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 14:12:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="707066609"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="707066609"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 May 2023 14:12:41 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4T7Z-0001cB-06;
	Wed, 31 May 2023 21:12:41 +0000
Date: Thu, 01 Jun 2023 05:12:29 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/cpu-smt] BUILD REGRESSION
 7bb712baeffc4640f5511feec68add6f1767413f
Message-ID: <20230531211229.3jCW4%lkp@intel.com>
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
branch HEAD: 7bb712baeffc4640f5511feec68add6f1767413f  powerpc/pseries: Honour current SMT state when DLPAR onlining CPUs

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202305312356.SfvJ8Iwh-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

kernel/cpu.c:2583:36: error: 'cpu_smt_max_threads' undeclared (first use in this function); did you mean 'cpu_smt_num_threads'?

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- parisc-defconfig
    `-- kernel-cpu.c:error:cpu_smt_max_threads-undeclared-(first-use-in-this-function)

elapsed time: 723m

configs tested: 40
configs skipped: 2

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
