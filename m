Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88950733D63
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 03:06:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=URajpnOu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjdCf3QSGz3c51
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 11:06:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=URajpnOu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qjd9l4tw2z30JF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 11:05:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686963915; x=1718499915;
  h=date:from:to:cc:subject:message-id;
  bh=8g48wXXtqQ9ojLzFuRThLZXsw5s5/+c930lRhaRcgNs=;
  b=URajpnOub+XiJxDQ2F9/TMK8ADM+JGMxX/AkA9wVfANa7RdgYyoHZSye
   IaCUqlWGqX+ZGjNFR4A0VnwI3SzAPcFZnKdvfFT1Daj3xWh0FsZ2gPmHz
   TsMAVMl332kEp16oBSRXKMOooeS+sbdTRa4DxzBWmYPZ6E6WAm26tz5PZ
   SG5Ke5WjanhNy2xLUHdSgFdx9SZaGkVB5ouviLwNIdf4Dnch+CuYea0ew
   Vas6Wms6Q9zZd7jeshuDTGKUVkhE/Ig4ZmRYAQdG8sjrPaf05Bi4A57JU
   gTZXKwh1anlRjo4LAnKekLlCghryeSmns63beupho5v/sbGpYbKsnf48n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="356837840"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="356837840"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 18:05:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="783126304"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="783126304"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 16 Jun 2023 18:05:02 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAKNC-00021B-0u;
	Sat, 17 Jun 2023 01:05:02 +0000
Date: Sat, 17 Jun 2023 09:04:14 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 7a313166d7dd0b366f8a47e15cd3c40910494cb6
Message-ID: <202306170912.w1flP58r-lkp@intel.com>
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
branch HEAD: 7a313166d7dd0b366f8a47e15cd3c40910494cb6  powerpc: update ppc_save_regs to save current r1 in pt_regs

elapsed time: 724m

configs tested: 132
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230616   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r016-20230616   gcc  
arc                  randconfig-r025-20230616   gcc  
arc                  randconfig-r031-20230616   gcc  
arc                  randconfig-r043-20230616   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r003-20230616   gcc  
arm                  randconfig-r011-20230616   clang
arm                  randconfig-r033-20230616   gcc  
arm                  randconfig-r046-20230616   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230616   clang
arm64                randconfig-r032-20230616   clang
arm64                randconfig-r036-20230616   clang
csky                                defconfig   gcc  
csky                 randconfig-r012-20230616   gcc  
csky                 randconfig-r022-20230616   gcc  
csky                 randconfig-r026-20230616   gcc  
csky                 randconfig-r034-20230616   gcc  
hexagon              randconfig-r041-20230616   clang
hexagon              randconfig-r045-20230616   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230616   clang
i386         buildonly-randconfig-r005-20230616   clang
i386         buildonly-randconfig-r006-20230616   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230616   clang
i386                 randconfig-i002-20230616   clang
i386                 randconfig-i003-20230616   clang
i386                 randconfig-i004-20230616   clang
i386                 randconfig-i005-20230616   clang
i386                 randconfig-i006-20230616   clang
i386                 randconfig-i011-20230616   gcc  
i386                 randconfig-i012-20230616   gcc  
i386                 randconfig-i013-20230616   gcc  
i386                 randconfig-i014-20230616   gcc  
i386                 randconfig-i015-20230616   gcc  
i386                 randconfig-i016-20230616   gcc  
i386                 randconfig-r002-20230616   clang
i386                 randconfig-r004-20230616   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r005-20230616   gcc  
loongarch            randconfig-r013-20230616   gcc  
loongarch            randconfig-r031-20230616   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r035-20230616   gcc  
microblaze           randconfig-r011-20230616   gcc  
microblaze           randconfig-r021-20230616   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r024-20230616   clang
nios2                               defconfig   gcc  
nios2                randconfig-r013-20230616   gcc  
openrisc             randconfig-r006-20230616   gcc  
openrisc             randconfig-r014-20230616   gcc  
openrisc             randconfig-r025-20230616   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230616   gcc  
parisc               randconfig-r023-20230616   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r002-20230616   clang
powerpc              randconfig-r036-20230616   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r035-20230616   clang
riscv                randconfig-r042-20230616   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r006-20230616   clang
s390                 randconfig-r012-20230616   gcc  
s390                 randconfig-r021-20230616   gcc  
s390                 randconfig-r044-20230616   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r003-20230616   gcc  
sh                   randconfig-r004-20230616   gcc  
sh                   randconfig-r006-20230616   gcc  
sh                   randconfig-r015-20230616   gcc  
sh                   randconfig-r024-20230616   gcc  
sh                   randconfig-r032-20230616   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r005-20230616   gcc  
sparc                randconfig-r022-20230616   gcc  
sparc                randconfig-r026-20230616   gcc  
sparc                randconfig-r033-20230616   gcc  
sparc64              randconfig-r015-20230616   gcc  
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230616   clang
x86_64       buildonly-randconfig-r002-20230616   clang
x86_64       buildonly-randconfig-r003-20230616   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230616   clang
x86_64               randconfig-a002-20230616   clang
x86_64               randconfig-a003-20230616   clang
x86_64               randconfig-a004-20230616   clang
x86_64               randconfig-a005-20230616   clang
x86_64               randconfig-a006-20230616   clang
x86_64               randconfig-a011-20230616   gcc  
x86_64               randconfig-a012-20230616   gcc  
x86_64               randconfig-a013-20230616   gcc  
x86_64               randconfig-a014-20230616   gcc  
x86_64               randconfig-a015-20230616   gcc  
x86_64               randconfig-a016-20230616   gcc  
x86_64               randconfig-r003-20230616   clang
x86_64               randconfig-r004-20230616   clang
x86_64               randconfig-r005-20230616   clang
x86_64               randconfig-r034-20230616   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
