Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F21B691EEDE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 08:23:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zs6Hm8T+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCtBw62C2z3cVW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 16:23:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zs6Hm8T+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCtBB5rJ8z30PD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 16:22:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719901363; x=1751437363;
  h=date:from:to:cc:subject:message-id;
  bh=9D0eWBcg6ng+1qxeKjBncnLyjO4fPg/Cv/XzCldMIrE=;
  b=Zs6Hm8T+SKNUpn7+uZ1UsxwDqRAPXOkhO7n/qInvOZTxHtRJkvfm4Rct
   f5at7WCL00SGbxOMwQid24mwt46mk2HP8RR9yEPr+Y0IOlVEKvBcaR+7j
   k66g5CMzjbkTD0FGHqNzqWK60dn6uuyffhaovpi7QZ8HMzT42MF02ckM1
   iebAONqEdu69E1B5JggbkNz7tmRQmugKc/rBoc3wD5+s2HzBuObBdCvKS
   KmshVHh5BpdzMcG6U+wTN6r0IMX4JDPlWSrRJp2MwYnpEET6bYkia9FzV
   sRXWsAnB9gCh9NoJrP1EDX5wEGps6PmMtBSAUqsmGlisGfGg7NUur201t
   g==;
X-CSE-ConnectionGUID: eDps+er7TCW4E8xA5ccT2A==
X-CSE-MsgGUID: bY9fwQiqTC2j3ByVNNyaLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="20866957"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="20866957"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 23:22:37 -0700
X-CSE-ConnectionGUID: 3dWHdbAVSOGE40iEZ81jZQ==
X-CSE-MsgGUID: QkVgaICsSeimEn1Jxfdebw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="45679331"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2024 23:22:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOWuQ-000Nns-0Q;
	Tue, 02 Jul 2024 06:22:34 +0000
Date: Tue, 02 Jul 2024 14:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 21a741eb75f80397e5f7d3739e24d7d75e619011
Message-ID: <202407021442.8ujH9DF0-lkp@intel.com>
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
branch HEAD: 21a741eb75f80397e5f7d3739e24d7d75e619011  powerpc/pseries: Fix scv instruction crash with kexec

elapsed time: 1104m

configs tested: 128
configs skipped: 104

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240702   gcc-13.2.0
arc                   randconfig-002-20240702   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                   randconfig-001-20240702   gcc-13.2.0
arm                   randconfig-002-20240702   gcc-13.2.0
arm                   randconfig-003-20240702   gcc-13.2.0
arm                   randconfig-004-20240702   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240702   gcc-13.2.0
arm64                 randconfig-002-20240702   gcc-13.2.0
arm64                 randconfig-003-20240702   gcc-13.2.0
arm64                 randconfig-004-20240702   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240702   gcc-13.2.0
csky                  randconfig-002-20240702   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240702   gcc-13
i386         buildonly-randconfig-002-20240702   gcc-13
i386         buildonly-randconfig-003-20240702   gcc-13
i386         buildonly-randconfig-004-20240702   gcc-13
i386         buildonly-randconfig-005-20240702   gcc-13
i386         buildonly-randconfig-006-20240702   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240702   gcc-13
i386                  randconfig-002-20240702   gcc-13
i386                  randconfig-003-20240702   gcc-13
i386                  randconfig-004-20240702   gcc-13
i386                  randconfig-005-20240702   gcc-13
i386                  randconfig-006-20240702   gcc-13
i386                  randconfig-011-20240702   gcc-13
i386                  randconfig-012-20240702   gcc-13
i386                  randconfig-013-20240702   gcc-13
i386                  randconfig-014-20240702   gcc-13
i386                  randconfig-015-20240702   gcc-13
i386                  randconfig-016-20240702   gcc-13
loongarch                        allmodconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240702   gcc-13.2.0
loongarch             randconfig-002-20240702   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240702   gcc-13.2.0
nios2                 randconfig-002-20240702   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                randconfig-001-20240702   gcc-13.2.0
parisc                randconfig-002-20240702   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   gcc-13.2.0
powerpc               randconfig-001-20240702   gcc-13.2.0
powerpc               randconfig-002-20240702   gcc-13.2.0
powerpc               randconfig-003-20240702   gcc-13.2.0
powerpc64             randconfig-001-20240702   gcc-13.2.0
powerpc64             randconfig-002-20240702   gcc-13.2.0
powerpc64             randconfig-003-20240702   gcc-13.2.0
riscv                            allmodconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   gcc-13.2.0
riscv                 randconfig-001-20240702   gcc-13.2.0
riscv                 randconfig-002-20240702   gcc-13.2.0
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                  randconfig-001-20240702   gcc-13.2.0
s390                  randconfig-002-20240702   gcc-13.2.0
sh                    randconfig-001-20240702   gcc-13.2.0
sh                    randconfig-002-20240702   gcc-13.2.0
sparc64               randconfig-001-20240702   gcc-13.2.0
sparc64               randconfig-002-20240702   gcc-13.2.0
um                               allmodconfig   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                               allyesconfig   gcc-13.2.0
um                    randconfig-001-20240702   gcc-13.2.0
um                    randconfig-002-20240702   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240702   gcc-8
x86_64       buildonly-randconfig-002-20240702   gcc-8
x86_64       buildonly-randconfig-003-20240702   gcc-8
x86_64       buildonly-randconfig-004-20240702   gcc-8
x86_64       buildonly-randconfig-005-20240702   gcc-8
x86_64       buildonly-randconfig-006-20240702   gcc-8
x86_64                              defconfig   clang-18
x86_64                                  kexec   clang-18
x86_64                randconfig-001-20240702   gcc-8
x86_64                randconfig-002-20240702   gcc-8
x86_64                randconfig-003-20240702   gcc-8
x86_64                randconfig-004-20240702   gcc-8
x86_64                randconfig-005-20240702   gcc-8
x86_64                randconfig-006-20240702   gcc-8
x86_64                randconfig-011-20240702   gcc-8
x86_64                randconfig-012-20240702   gcc-8
x86_64                randconfig-013-20240702   gcc-8
x86_64                randconfig-014-20240702   gcc-8
x86_64                randconfig-015-20240702   gcc-8
x86_64                randconfig-016-20240702   gcc-8
x86_64                randconfig-071-20240702   gcc-8
x86_64                randconfig-072-20240702   gcc-8
x86_64                randconfig-073-20240702   gcc-8
x86_64                randconfig-074-20240702   gcc-8
x86_64                randconfig-075-20240702   gcc-8
x86_64                randconfig-076-20240702   gcc-8
x86_64                           rhel-8.3-bpf   clang-18
x86_64                          rhel-8.3-func   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                randconfig-001-20240702   gcc-13.2.0
xtensa                randconfig-002-20240702   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
