Return-Path: <linuxppc-dev+bounces-6402-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFE9A4195A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 10:40:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1bMW081Cz3011;
	Mon, 24 Feb 2025 20:40:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740390054;
	cv=none; b=cPgRC9Xa5QWSrHcsGCMoTqt0cVglfkNXhbUb9GgK7Ogyyw7LznucLDyJRz3up2xmk4RC8dG9ZdpCvPH79lvSD8nPeEjbpzDqPWYcpg6jcd7VcRiyvQ1SDSAyNP9Dt1Ln4/mWDdV0FosNo5aUMUMfCNhR6Lt8VvmsbzU3Ace87KhDxq1fn8NosekgE1aHmjy9g74702gp4tdEf7RxBkIhmlX8DWM1RyY67Ref2Emg2Afhy07KTacKAlwPOX0j3aDxNmSJ9DZWBN46DEguezi6LDK5UYZzMXO6e5qpNSOqsYWKsj2wuW0zbK0+Sc9PXBS34qz3H+BI5SkAHv/P1TNY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740390054; c=relaxed/relaxed;
	bh=5fCwu+be3C+HCGJqgK5LwH4PzLRD98nKrpXXDifm2oU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eoWbLjSbIJlScdsIj39kvfS7RV/4QB07LxaG/oe2BEuhTQZ0z3vDYQ8uCehK31ahnnp8QJJE1Vr8oJ65I0z3cRf4U2Uplf4TJdB3ViufbQuGdrrPI1/TfdEgBUGU7reCfsu7w6evyEhaaYHRWJh39wocske7S2Ghx88MLOlT7cN6b0Tfgu40323IeW9PRis6iYDz6WfM9Av/lK2bASTdKGHdztvmDkh5UslyzfwLaxqARnzPpaV05+2ENVtLeAj6hZQVdBuzdbmAymqS/Es7lUI6DeZUxbF9pgYxY1+6Uxzn8fyeHUzPj63N0QU18GlkmTdEdfYSOTTdCCbx9OQp9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=is93arJR; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=is93arJR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1bMS4yRMz2ynR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 20:40:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740390053; x=1771926053;
  h=date:from:to:cc:subject:message-id;
  bh=QoBPArr3qionFBtgyBsAYXJrbBPyNfufAzSaQ6rJ9wk=;
  b=is93arJRknP24SbxifDRKdeRocwKk6XsM5BV8qsLYBJtRRLgnpLgvB8D
   Tu3M1NHVA5C+qWQ/Nd5CQugMDVN8fDvHZfnwjN7oUZqgsCaeHHfov1RPS
   Pi8i6yXtiNJH00BFSSWJXiKVDfDc6HKQr3G3hxGJL8JsMqPpMAjuknbSc
   ftvGmS/ELeFECFai+V5S0dwesX51C2xhPixb1iwikxvJ6z6i+kIYL5oaQ
   PnGZeAiUFsW1eZFU09LtlMfomf/dEhnlzEBf66FNw34fB5Iy3kuPA617A
   lYYmqLAbJw1Jc6x5HQGA0SFFPFD+vOurnl/JxGnSslY6aDNW/OLa2HOwj
   g==;
X-CSE-ConnectionGUID: AMXH5NR0THStYm9Uvi5T3A==
X-CSE-MsgGUID: Gpte0MxdRCaqrjmfAbfhIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="66509644"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="66509644"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 01:40:47 -0800
X-CSE-ConnectionGUID: 8KtsCZ76RzuBqVX+XQQaFQ==
X-CSE-MsgGUID: cHGJo8IaTUmNV3EVvoguBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="120926728"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 Feb 2025 01:40:46 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmUxA-000870-0W;
	Mon, 24 Feb 2025 09:40:44 +0000
Date: Mon, 24 Feb 2025 17:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 79725863ce2f4b1da2fd9e92092d39335b0dab8b
Message-ID: <202502241701.7q0TMj6v-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
branch HEAD: 79725863ce2f4b1da2fd9e92092d39335b0dab8b  Automatic merge of 'fixes' into merge (2025-02-23 13:54)

elapsed time: 1446m

configs tested: 172
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20250223    gcc-13.2.0
arc                   randconfig-001-20250224    gcc-13.2.0
arc                   randconfig-002-20250223    gcc-13.2.0
arc                   randconfig-002-20250224    gcc-13.2.0
arc                        vdk_hs38_defconfig    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-21
arm                         lpc18xx_defconfig    clang-19
arm                   randconfig-001-20250223    gcc-14.2.0
arm                   randconfig-001-20250224    gcc-14.2.0
arm                   randconfig-002-20250223    clang-21
arm                   randconfig-002-20250224    gcc-14.2.0
arm                   randconfig-003-20250223    clang-19
arm                   randconfig-003-20250224    gcc-14.2.0
arm                   randconfig-004-20250223    gcc-14.2.0
arm                   randconfig-004-20250224    gcc-14.2.0
arm                           sama5_defconfig    gcc-14.2.0
arm                        spear3xx_defconfig    clang-16
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250223    clang-21
arm64                 randconfig-001-20250224    gcc-14.2.0
arm64                 randconfig-002-20250223    gcc-14.2.0
arm64                 randconfig-002-20250224    clang-21
arm64                 randconfig-003-20250223    clang-21
arm64                 randconfig-003-20250224    gcc-14.2.0
arm64                 randconfig-004-20250223    clang-21
arm64                 randconfig-004-20250224    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250223    gcc-14.2.0
csky                  randconfig-001-20250224    gcc-14.2.0
csky                  randconfig-002-20250223    gcc-14.2.0
csky                  randconfig-002-20250224    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250223    clang-21
hexagon               randconfig-001-20250224    clang-21
hexagon               randconfig-002-20250223    clang-16
hexagon               randconfig-002-20250224    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250223    clang-19
i386        buildonly-randconfig-002-20250223    gcc-11
i386        buildonly-randconfig-003-20250223    gcc-12
i386        buildonly-randconfig-004-20250223    clang-19
i386        buildonly-randconfig-005-20250223    gcc-12
i386        buildonly-randconfig-006-20250223    gcc-11
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250223    gcc-14.2.0
loongarch             randconfig-001-20250224    gcc-14.2.0
loongarch             randconfig-002-20250223    gcc-14.2.0
loongarch             randconfig-002-20250224    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                           sun3_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-21
mips                           jazz_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250223    gcc-14.2.0
nios2                 randconfig-001-20250224    gcc-14.2.0
nios2                 randconfig-002-20250223    gcc-14.2.0
nios2                 randconfig-002-20250224    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250223    gcc-14.2.0
parisc                randconfig-001-20250224    gcc-14.2.0
parisc                randconfig-002-20250223    gcc-14.2.0
parisc                randconfig-002-20250224    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                 canyonlands_defconfig    clang-19
powerpc               randconfig-001-20250223    gcc-14.2.0
powerpc               randconfig-001-20250224    gcc-14.2.0
powerpc               randconfig-002-20250223    clang-17
powerpc               randconfig-002-20250224    gcc-14.2.0
powerpc               randconfig-003-20250223    gcc-14.2.0
powerpc               randconfig-003-20250224    gcc-14.2.0
powerpc64             randconfig-001-20250223    gcc-14.2.0
powerpc64             randconfig-002-20250223    clang-21
powerpc64             randconfig-002-20250224    clang-18
powerpc64             randconfig-003-20250223    gcc-14.2.0
powerpc64             randconfig-003-20250224    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250223    clang-17
riscv                 randconfig-001-20250224    gcc-14.2.0
riscv                 randconfig-002-20250223    gcc-14.2.0
riscv                 randconfig-002-20250224    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250223    clang-18
s390                  randconfig-001-20250224    gcc-14.2.0
s390                  randconfig-002-20250223    clang-16
s390                  randconfig-002-20250224    clang-17
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250223    gcc-14.2.0
sh                    randconfig-001-20250224    gcc-14.2.0
sh                    randconfig-002-20250223    gcc-14.2.0
sh                    randconfig-002-20250224    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                   sh7770_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250223    gcc-14.2.0
sparc                 randconfig-001-20250224    gcc-14.2.0
sparc                 randconfig-002-20250223    gcc-14.2.0
sparc                 randconfig-002-20250224    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250223    gcc-14.2.0
sparc64               randconfig-001-20250224    gcc-14.2.0
sparc64               randconfig-002-20250223    gcc-14.2.0
sparc64               randconfig-002-20250224    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250223    clang-21
um                    randconfig-001-20250224    gcc-12
um                    randconfig-002-20250223    gcc-12
um                    randconfig-002-20250224    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250223    clang-19
x86_64      buildonly-randconfig-002-20250223    gcc-12
x86_64      buildonly-randconfig-003-20250223    gcc-12
x86_64      buildonly-randconfig-004-20250223    gcc-12
x86_64      buildonly-randconfig-005-20250223    gcc-12
x86_64      buildonly-randconfig-006-20250223    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250223    gcc-14.2.0
xtensa                randconfig-001-20250224    gcc-14.2.0
xtensa                randconfig-002-20250223    gcc-14.2.0
xtensa                randconfig-002-20250224    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

