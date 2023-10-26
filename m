Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A32D07D7CA7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 08:05:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f47TBnc/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGFd73wDDz3cS5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 17:04:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f47TBnc/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGFcG0spJz2xZG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 17:04:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698300254; x=1729836254;
  h=date:from:to:cc:subject:message-id;
  bh=6YlLC7yzh4g6a75w2C5n0ZY2dX4w/c+m7aqByPIJdJI=;
  b=f47TBnc/+60qJL+tf93RfXlceD6dlTEOPudZJPf5ztBRS7idIwzPlBc5
   76B88QrTjPiephw1JtPEkISxWto/JABr+8NpStpaKV9LJPZiLQmdhsIeQ
   rcYVgdAfBPrMn6gXpLGWM5/fjZxY/Qc0ICGYPlcXKMskkX7+zY4LVWD17
   lR6jcBaCXl+9Qr9EWQdDiDF58xYHHrZ/NkRL3Iigm9tyg7P7Moivq0I8J
   6c6xA9lcd6gRGvUvH+yzXJ/ZYiRLiTy3MM04E3FS++VvVhKxlVPAtOli2
   mLpsZ9SfTcQdN0QOFgyZuyq2m55CiOXvSl1iA43nBJdEEyzRd5BSO0TTz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="372511623"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="372511623"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 23:04:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="932617074"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="932617074"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 25 Oct 2023 23:04:03 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvtTM-0009WE-2B;
	Thu, 26 Oct 2023 06:04:00 +0000
Date: Thu, 26 Oct 2023 14:03:05 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 47b8def9358c5eb888e78b24b7e5b7f2e2e97b8e
Message-ID: <202310261401.8G40XwbS-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 47b8def9358c5eb888e78b24b7e5b7f2e2e97b8e  powerpc/mm: Avoid calling arch_enter/leave_lazy_mmu() in set_ptes

elapsed time: 1483m

configs tested: 200
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231025   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                                 defconfig   gcc  
arm                            mps2_defconfig   gcc  
arm                   randconfig-001-20231026   gcc  
arm                        spear6xx_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231025   gcc  
i386         buildonly-randconfig-001-20231026   gcc  
i386         buildonly-randconfig-002-20231025   gcc  
i386         buildonly-randconfig-002-20231026   gcc  
i386         buildonly-randconfig-003-20231025   gcc  
i386         buildonly-randconfig-003-20231026   gcc  
i386         buildonly-randconfig-004-20231025   gcc  
i386         buildonly-randconfig-004-20231026   gcc  
i386         buildonly-randconfig-005-20231025   gcc  
i386         buildonly-randconfig-005-20231026   gcc  
i386         buildonly-randconfig-006-20231025   gcc  
i386         buildonly-randconfig-006-20231026   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231025   gcc  
i386                  randconfig-001-20231026   gcc  
i386                  randconfig-002-20231025   gcc  
i386                  randconfig-002-20231026   gcc  
i386                  randconfig-003-20231025   gcc  
i386                  randconfig-003-20231026   gcc  
i386                  randconfig-004-20231025   gcc  
i386                  randconfig-004-20231026   gcc  
i386                  randconfig-005-20231025   gcc  
i386                  randconfig-005-20231026   gcc  
i386                  randconfig-006-20231025   gcc  
i386                  randconfig-006-20231026   gcc  
i386                  randconfig-011-20231025   gcc  
i386                  randconfig-011-20231026   gcc  
i386                  randconfig-012-20231025   gcc  
i386                  randconfig-012-20231026   gcc  
i386                  randconfig-013-20231025   gcc  
i386                  randconfig-013-20231026   gcc  
i386                  randconfig-014-20231025   gcc  
i386                  randconfig-014-20231026   gcc  
i386                  randconfig-015-20231025   gcc  
i386                  randconfig-015-20231026   gcc  
i386                  randconfig-016-20231025   gcc  
i386                  randconfig-016-20231026   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231025   gcc  
loongarch             randconfig-001-20231026   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                           jazz_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc                      pasemi_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231025   gcc  
riscv                 randconfig-001-20231026   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231025   gcc  
s390                  randconfig-001-20231026   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231025   gcc  
sparc                 randconfig-001-20231026   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231025   gcc  
x86_64       buildonly-randconfig-001-20231026   gcc  
x86_64       buildonly-randconfig-002-20231025   gcc  
x86_64       buildonly-randconfig-002-20231026   gcc  
x86_64       buildonly-randconfig-003-20231025   gcc  
x86_64       buildonly-randconfig-003-20231026   gcc  
x86_64       buildonly-randconfig-004-20231025   gcc  
x86_64       buildonly-randconfig-004-20231026   gcc  
x86_64       buildonly-randconfig-005-20231025   gcc  
x86_64       buildonly-randconfig-005-20231026   gcc  
x86_64       buildonly-randconfig-006-20231025   gcc  
x86_64       buildonly-randconfig-006-20231026   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231025   gcc  
x86_64                randconfig-001-20231026   gcc  
x86_64                randconfig-002-20231025   gcc  
x86_64                randconfig-002-20231026   gcc  
x86_64                randconfig-003-20231025   gcc  
x86_64                randconfig-003-20231026   gcc  
x86_64                randconfig-004-20231025   gcc  
x86_64                randconfig-004-20231026   gcc  
x86_64                randconfig-005-20231025   gcc  
x86_64                randconfig-005-20231026   gcc  
x86_64                randconfig-006-20231025   gcc  
x86_64                randconfig-006-20231026   gcc  
x86_64                randconfig-011-20231025   gcc  
x86_64                randconfig-012-20231025   gcc  
x86_64                randconfig-013-20231025   gcc  
x86_64                randconfig-014-20231025   gcc  
x86_64                randconfig-015-20231025   gcc  
x86_64                randconfig-016-20231025   gcc  
x86_64                randconfig-071-20231025   gcc  
x86_64                randconfig-071-20231026   gcc  
x86_64                randconfig-072-20231025   gcc  
x86_64                randconfig-072-20231026   gcc  
x86_64                randconfig-073-20231025   gcc  
x86_64                randconfig-073-20231026   gcc  
x86_64                randconfig-074-20231025   gcc  
x86_64                randconfig-074-20231026   gcc  
x86_64                randconfig-075-20231025   gcc  
x86_64                randconfig-075-20231026   gcc  
x86_64                randconfig-076-20231025   gcc  
x86_64                randconfig-076-20231026   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                              defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
