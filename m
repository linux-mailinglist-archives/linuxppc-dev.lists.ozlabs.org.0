Return-Path: <linuxppc-dev+bounces-3587-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A26569DACCE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2024 19:02:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xz6jH2JSnz2xtb;
	Thu, 28 Nov 2024 05:02:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732730547;
	cv=none; b=TgdvikZGRooSuZivzF2nfhr0/SMvzixeUnBM5WLJKIrhSGl1ZCOAhLU4qr/KmY/1ioJahLznTSQ8uXo9wvRXZS2OzpkwsoOHdsHwtCIkxylUj8RTztvl+HSeNLpcGyxpZ44L4mDuG+Z3UecuhzQ9Q9PQ0SmcSoNEaOOxzIoEO5edSpbS2vi3ph07Emb4TBfAOkUqCzzxj5FDNAjJ7lfb8ztE72jhnK032ukdNW9S7jdxhWNU/7vRkJjzbzgN/oJajDO45CC6Of8eBli28MEZjk7s0I5YfDu0p2kYHWuFpogkfVbwMC7LzX/QjcgScEhj0SKTpacqOvEvQ1i8HkQLzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732730547; c=relaxed/relaxed;
	bh=WVWfcBhyGDu6LNAnl6TVLDAQdO9IooAn+DlOo5Ufopk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oAA8WoE9aLEE/6dc2J3gZII7PMUR7OI/9DxJZmgc1vBYoTBWBRwwBmoODJvDkWkcPYX6Wku3mHBYAgEEMn5cQE69BJ3zxMMcOEZUgm0/v4HrSqalj6KMTt2X9aQaD/jGV74IySWMySPVuZF3axZdUKnLI/Mq2nTHgP6Ycvck7/2nc1P3jOfLzgsjjsNKW3NILWA0NwwTk4LRkcNIiFdK0bktbgQmZIsTW8o/wquuL5s1RY8rVCQOXhkqE5c4lIzSqte3PBSM97auc0JLGPH3MHZmOZ+Hc59DdB1DAOPHmsjrNRzWGUZhfqIXxPDZscLewPdESmPffjomxzcK65jf3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=POY5yQli; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=POY5yQli;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xz6jD0tkZz2xmk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2024 05:02:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732730544; x=1764266544;
  h=date:from:to:cc:subject:message-id;
  bh=34cZND6HdSmQfLWSGjEOF0nrP5WR7phydSAP74wuMEc=;
  b=POY5yQliZxFz0Jrs6AtHU5DSSBAmd4siYzFV0mT6c2dVa/MoLEqPWCXn
   gyH6P15FuteI1hNu5YFohcAfQzrgIFdiDEVH4W2ZQ7BOFpkaV4tV5B4CA
   8ghruHL/r72DiJsEK5UCKekoSjniTuKCAIsrz6nYVT3f+fp2eC5VSRPWp
   SwC1eV9JcXNBqRBKR0IUbzUwXyrkt/DioQZVGO9wpw/Iq5Fu1uT2T2FRP
   eFZTByj3cWIyqkKrAhCrwhs/rIrHTvGplJgeAJWFsSyOpwXJmbj30DyMk
   ZAUKr4ohOraI6FacbsgiogT1+t2m9LcX56QDJqxVTrwYQS62g500QzxCa
   g==;
X-CSE-ConnectionGUID: qaJdF+3ZQPa+Ml4ef6F6NA==
X-CSE-MsgGUID: vLqErUdWRvm5eNQ4gcHKjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="58354611"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="58354611"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 10:02:19 -0800
X-CSE-ConnectionGUID: /uYdCBmBTnm+iA2NF4sZFA==
X-CSE-MsgGUID: b4HSN/s9THepsB3fyOFaaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="115296682"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Nov 2024 10:02:18 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGMMh-0008Ej-1t;
	Wed, 27 Nov 2024 18:02:15 +0000
Date: Thu, 28 Nov 2024 01:59:36 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 a85c72f04fb3d31e6542bd8039cda7e647d172ea
Message-ID: <202411280125.nSx9ikMz-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: a85c72f04fb3d31e6542bd8039cda7e647d172ea  Automatic merge of 'master' into merge (2024-11-26 21:27)

elapsed time: 725m

configs tested: 144
configs skipped: 19

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                   randconfig-001-20241127    gcc-14.2.0
arc                   randconfig-002-20241127    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                       omap2plus_defconfig    gcc-14.2.0
arm                   randconfig-001-20241127    gcc-14.2.0
arm                   randconfig-002-20241127    gcc-14.2.0
arm                   randconfig-003-20241127    gcc-14.2.0
arm                   randconfig-004-20241127    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241127    gcc-14.2.0
arm64                 randconfig-002-20241127    gcc-14.2.0
arm64                 randconfig-003-20241127    gcc-14.2.0
arm64                 randconfig-004-20241127    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241127    gcc-14.2.0
csky                  randconfig-002-20241127    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241127    gcc-14.2.0
hexagon               randconfig-002-20241127    gcc-14.2.0
i386        buildonly-randconfig-001-20241127    clang-19
i386        buildonly-randconfig-002-20241127    clang-19
i386        buildonly-randconfig-003-20241127    clang-19
i386        buildonly-randconfig-004-20241127    clang-19
i386        buildonly-randconfig-005-20241127    clang-19
i386        buildonly-randconfig-006-20241127    clang-19
i386                  randconfig-001-20241127    clang-19
i386                  randconfig-002-20241127    clang-19
i386                  randconfig-003-20241127    clang-19
i386                  randconfig-004-20241127    clang-19
i386                  randconfig-005-20241127    clang-19
i386                  randconfig-006-20241127    clang-19
i386                  randconfig-011-20241127    clang-19
i386                  randconfig-012-20241127    clang-19
i386                  randconfig-013-20241127    clang-19
i386                  randconfig-014-20241127    clang-19
i386                  randconfig-015-20241127    clang-19
i386                  randconfig-016-20241127    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241127    gcc-14.2.0
loongarch             randconfig-002-20241127    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    clang-16
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                           mtx1_defconfig    clang-16
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241127    gcc-14.2.0
nios2                 randconfig-002-20241127    gcc-14.2.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241127    gcc-14.2.0
parisc                randconfig-002-20241127    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                     mpc5200_defconfig    gcc-14.2.0
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241127    gcc-14.2.0
powerpc               randconfig-002-20241127    gcc-14.2.0
powerpc               randconfig-003-20241127    gcc-14.2.0
powerpc                     tqm8548_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241127    gcc-14.2.0
powerpc64             randconfig-002-20241127    gcc-14.2.0
powerpc64             randconfig-003-20241127    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                 randconfig-001-20241127    gcc-14.2.0
riscv                 randconfig-002-20241127    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241127    gcc-14.2.0
s390                  randconfig-002-20241127    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20241127    gcc-14.2.0
sh                    randconfig-002-20241127    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64               randconfig-001-20241127    gcc-14.2.0
sparc64               randconfig-002-20241127    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                    randconfig-001-20241127    gcc-14.2.0
um                    randconfig-002-20241127    gcc-14.2.0
x86_64      buildonly-randconfig-001-20241127    clang-19
x86_64      buildonly-randconfig-002-20241127    clang-19
x86_64      buildonly-randconfig-003-20241127    clang-19
x86_64      buildonly-randconfig-004-20241127    clang-19
x86_64      buildonly-randconfig-005-20241127    clang-19
x86_64      buildonly-randconfig-006-20241127    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241127    clang-19
x86_64                randconfig-002-20241127    clang-19
x86_64                randconfig-003-20241127    clang-19
x86_64                randconfig-004-20241127    clang-19
x86_64                randconfig-005-20241127    clang-19
x86_64                randconfig-006-20241127    clang-19
x86_64                randconfig-011-20241127    clang-19
x86_64                randconfig-012-20241127    clang-19
x86_64                randconfig-013-20241127    clang-19
x86_64                randconfig-014-20241127    clang-19
x86_64                randconfig-015-20241127    clang-19
x86_64                randconfig-016-20241127    clang-19
x86_64                randconfig-071-20241127    clang-19
x86_64                randconfig-072-20241127    clang-19
x86_64                randconfig-073-20241127    clang-19
x86_64                randconfig-074-20241127    clang-19
x86_64                randconfig-075-20241127    clang-19
x86_64                randconfig-076-20241127    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241127    gcc-14.2.0
xtensa                randconfig-002-20241127    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

