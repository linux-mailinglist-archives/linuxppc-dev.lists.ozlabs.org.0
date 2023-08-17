Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8A577F66F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 14:29:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=avzzHqPN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRPTN4chlz3cN7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 22:29:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=avzzHqPN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRPRY4cn4z2xq8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 22:28:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692275290; x=1723811290;
  h=date:from:to:cc:subject:message-id;
  bh=kEwm0w3fWqB4ipY3kUWN+oNm/WWD2BcOaeEkMT7o6mk=;
  b=avzzHqPNGty+HnPXWN4uF0tAmlV28i1GuG9kBKPMP0iSX1vU8ocGkGZG
   6CcqAk78jnihxhh+PPIk2JerfRykvvDD29VoTZMUx5nEM84hzM8n3wGxd
   MZjWBc70Ulysk6g2iioK7socMfwoDSjcmbhR3aSp51ttm3Ze20gZOB46j
   hT2Ck0ft2H8fO8cM2+ZoPdb0VzyqpSgtBNiZ6H3uCMJo4eeeiECgQkqHk
   owdyUYXeDpI0Bhw5bZ8vqzhlacP2rwpg3uWk3ZivMZJ/bWF1stwOWng6i
   bbeIJXEcshIWBi//IsUhNfF7zQmUnHlJN44Rrd/w69VQYRYb8dYdNnLbB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375558986"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="375558986"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 05:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="824624688"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="824624688"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Aug 2023 05:28:01 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWc6W-00017v-0K;
	Thu, 17 Aug 2023 12:27:57 +0000
Date: Thu, 17 Aug 2023 20:27:44 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 9a32584bc108c8fe4d02fa33b16caf686e4a788a
Message-ID: <202308172040.ifhyp2LL-lkp@intel.com>
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
branch HEAD: 9a32584bc108c8fe4d02fa33b16caf686e4a788a  powerpc/ptrace: Split gpr32_set_common

elapsed time: 731m

configs tested: 104
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r022-20230817   gcc  
arc                  randconfig-r034-20230817   gcc  
arc                  randconfig-r043-20230817   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r001-20230817   gcc  
arm                  randconfig-r046-20230817   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r024-20230817   gcc  
arm64                randconfig-r032-20230817   clang
csky                                defconfig   gcc  
csky                 randconfig-r004-20230817   gcc  
csky                 randconfig-r035-20230817   gcc  
hexagon              randconfig-r041-20230817   clang
hexagon              randconfig-r045-20230817   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230817   clang
i386         buildonly-randconfig-r005-20230817   clang
i386         buildonly-randconfig-r006-20230817   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230817   clang
i386                 randconfig-i002-20230817   clang
i386                 randconfig-i003-20230817   clang
i386                 randconfig-i004-20230817   clang
i386                 randconfig-i005-20230817   clang
i386                 randconfig-i006-20230817   clang
i386                 randconfig-i011-20230817   gcc  
i386                 randconfig-i012-20230817   gcc  
i386                 randconfig-i013-20230817   gcc  
i386                 randconfig-i014-20230817   gcc  
i386                 randconfig-i015-20230817   gcc  
i386                 randconfig-i016-20230817   gcc  
i386                 randconfig-r002-20230817   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r021-20230817   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r005-20230817   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r016-20230817   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r015-20230817   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r012-20230817   gcc  
riscv                randconfig-r013-20230817   gcc  
riscv                randconfig-r042-20230817   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230817   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r031-20230817   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r026-20230817   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r011-20230817   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230817   clang
x86_64       buildonly-randconfig-r002-20230817   clang
x86_64       buildonly-randconfig-r003-20230817   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r003-20230817   clang
x86_64               randconfig-r014-20230817   gcc  
x86_64               randconfig-x001-20230817   gcc  
x86_64               randconfig-x002-20230817   gcc  
x86_64               randconfig-x003-20230817   gcc  
x86_64               randconfig-x004-20230817   gcc  
x86_64               randconfig-x005-20230817   gcc  
x86_64               randconfig-x006-20230817   gcc  
x86_64               randconfig-x011-20230817   clang
x86_64               randconfig-x012-20230817   clang
x86_64               randconfig-x013-20230817   clang
x86_64               randconfig-x014-20230817   clang
x86_64               randconfig-x015-20230817   clang
x86_64               randconfig-x016-20230817   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
