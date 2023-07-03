Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC41746648
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 02:00:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RsKPK+mM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qw2x628Gbz3c1B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 10:00:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RsKPK+mM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qw2wC2LFBz309V
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 09:59:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688428779; x=1719964779;
  h=date:from:to:cc:subject:message-id;
  bh=TKe5DNoyA/dr/hHpvuqzWg2PTD5jxWxULumsZMqUpO8=;
  b=RsKPK+mM2obXo+8MkqfHRojsXBBSeRMpprbuY8/Ge7kHNhpvvK8b8iv6
   cV5WXzuw0YHdStidVtQnyQaOPeScNHVLv1DgAT47KdZwWB6tYWwsqIr3Y
   3KK55mELr8P8ZAmYEbEWA8NMIM4rafsQ3+sbhxIxVHcAEXx+PN6I0M7ER
   +WAfhwX/LLydRk/FFBz5olhP9JKA8LzWzOljMFjHFhnxq5j/EVErmvtoU
   Oofev/w+tXIkeIeGAu8G6kR5MuqV7IUpSS1fPN/uFWLnEdwaXZ9sS385k
   D2LdX9x9f3+LZjrDkyFbGGr1+NWggM6YSFo9w+iE8YiMmx6VAwCW3gDcA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="360467726"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="360467726"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 16:59:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="863213566"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="863213566"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2023 16:59:27 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGTS2-000HiL-0x;
	Mon, 03 Jul 2023 23:59:26 +0000
Date: Tue, 04 Jul 2023 07:59:16 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 abaa02fc944f2f9f2c2e1925ddaceaf35c48528c
Message-ID: <202307040713.g1jqgOhM-lkp@intel.com>
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
branch HEAD: abaa02fc944f2f9f2c2e1925ddaceaf35c48528c  powerpc: dts: turris1x.dts: Fix PCIe MEM size for pci2 node

elapsed time: 721m

configs tested: 92
configs skipped: 135

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                                 defconfig   gcc  
arm                          ep93xx_defconfig   clang
arm                         lpc32xx_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r033-20230703   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r033-20230703   gcc  
hexagon              randconfig-r041-20230703   clang
hexagon              randconfig-r045-20230703   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230703   gcc  
i386         buildonly-randconfig-r005-20230703   gcc  
i386         buildonly-randconfig-r006-20230703   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230703   gcc  
i386                 randconfig-i002-20230703   gcc  
i386                 randconfig-i003-20230703   gcc  
i386                 randconfig-i004-20230703   gcc  
i386                 randconfig-i005-20230703   gcc  
i386                 randconfig-i006-20230703   gcc  
i386                 randconfig-i011-20230703   clang
i386                 randconfig-i012-20230703   clang
i386                 randconfig-i013-20230703   clang
i386                 randconfig-i014-20230703   clang
i386                 randconfig-i015-20230703   clang
i386                 randconfig-i016-20230703   clang
i386                 randconfig-r035-20230703   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r025-20230703   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1830-neo_defconfig   clang
mips                 randconfig-r001-20230703   clang
nios2                               defconfig   gcc  
nios2                randconfig-r024-20230703   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                  mpc866_ads_defconfig   clang
powerpc              randconfig-r005-20230703   gcc  
powerpc              randconfig-r032-20230703   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230703   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r034-20230703   gcc  
s390                 randconfig-r035-20230703   gcc  
s390                 randconfig-r044-20230703   clang
sh                               allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r023-20230703   gcc  
sparc64              randconfig-r036-20230703   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                   randconfig-r021-20230703   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230703   gcc  
x86_64       buildonly-randconfig-r002-20230703   gcc  
x86_64       buildonly-randconfig-r003-20230703   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r015-20230703   clang
x86_64               randconfig-x001-20230703   clang
x86_64               randconfig-x002-20230703   clang
x86_64               randconfig-x003-20230703   clang
x86_64               randconfig-x004-20230703   clang
x86_64               randconfig-x005-20230703   clang
x86_64               randconfig-x006-20230703   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
