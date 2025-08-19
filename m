Return-Path: <linuxppc-dev+bounces-11116-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8A0B2B86A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 06:48:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5cXf5GMsz3cls;
	Tue, 19 Aug 2025 14:48:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755578898;
	cv=none; b=AGoAYzEF+5I2n6cz3Exj3c0ebAWb9wXS9xHMSuV0cYpxGr2VUzVC7C44ztyeNUNuBCT41pCwkRgOSB5d7gPd4cux8dCb+FVbj4uNVIxagaPzAP96Q85nXMCk/ZXnAVrtdYgU6cigopDSJntEM41hnblfFVB+CEeB+GYzoP/XkMnlnca+kelSkeb1XyTT2nVKB72i9LlZ9kyMgdfA0eZ1I0SHSWmLoVlX9SC/EtBzNq5mkfW9W/g1Uut8iH6sjEU/CkkzjvQ9C3xcuWP6jXHERvYJVpkgFMBZlZumXoCyxqrg5VTCVnu1w9ACf9Ce+z8BdthKfxWV6bLuC1tows3LzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755578898; c=relaxed/relaxed;
	bh=Je9UfaCkRNAUx4VMCU707Q6dh+4X8+wm1IHU9IL9+BA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SnrHN5SWzmKmFuEyhzmzvSZ6D24UlMw+uL2DVARcrB7Bm2HsLoddXAaXYbQYdr7GopOTAOALl5W4qtnfQruz3PO6ySIobpziBuLi8yNTdvnpn3nlBaHa/Azn49MJlW+d+OA39ssKiIMYfso5JNlR9in1ZA+LpW/rhTc6ulRNN5sObmMrhoYpHZ8SU0zbJrIBpilrVwHwJvwt9XT85wTFFdhcNGHg8HSSBnvhgfaogUzb+iNiE1YTPNkarzD29m3IR6tor7bArnVSM/YxNeYieaW6C6NyumgQKckx4vlzB0tIef/wionW/Ma9K27HOvNZsNisy6CPbZwUb1w3MF98gA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FNCiUMs4; dkim-atps=neutral; spf=pass (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FNCiUMs4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5cXb6GLkz3clR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 14:48:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755578896; x=1787114896;
  h=date:from:to:cc:subject:message-id;
  bh=K+JmFZWzQRrfE/6y6ZdWTLvK96jrXTYdTwYriBpQEIg=;
  b=FNCiUMs4n/ekuSuCcC7XZJmmHPYps347/Mlc7ckKSSKEBsaz4vWyL3TO
   yvolTUqQAr/FQukYuAG2Z6yuv+15edAFj+dc8cd8YETnxljHqotkL7rCj
   l/y992Wq1dM0uoY0hfBya2KGan+eR0bWWpK9TTUjAF3Mx4UkfjpzDig/L
   WOtOHVjIyR5zBh0U8OFiV1s5AxOCaBq4IC5p3zvT1MFfFb7Adbfyzidga
   l5YNsAbvwRDEOJS4o3kTIb6po3PUqOz6MdSXlFu1yxE3Jpo7wKi2K0/Gr
   9FHK4ZyZ6oyYfRckEGqzpNeGmXg9EwxN0m8J0dH6dV3roF/DjFPTUM5f6
   w==;
X-CSE-ConnectionGUID: pCdMb8FlSiG9+4mCvujK+A==
X-CSE-MsgGUID: NuLlP9bVShauSuXaVuvbMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="45385517"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="45385517"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 21:48:10 -0700
X-CSE-ConnectionGUID: 07Zo4DedQyeZdvA8AcSmbg==
X-CSE-MsgGUID: NZfd9uJvQjOZKKv5AfJTig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="167257397"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 21:48:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoEFv-000GW7-06;
	Tue, 19 Aug 2025 04:47:56 +0000
Date: Tue, 19 Aug 2025 12:46:23 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 ff75f6055d715177e4b8dd3d10091d3a5450ba73
Message-ID: <202508191217.njFv7DEz-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: ff75f6055d715177e4b8dd3d10091d3a5450ba73  Automatic merge of 'master' into merge (2025-08-18 15:22)

elapsed time: 984m

configs tested: 236
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250818    gcc-13.4.0
arc                   randconfig-001-20250819    gcc-8.5.0
arc                   randconfig-002-20250818    gcc-12.5.0
arc                   randconfig-002-20250819    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                   milbeaut_m10v_defconfig    clang-19
arm                        mvebu_v7_defconfig    clang-19
arm                   randconfig-001-20250818    gcc-12.5.0
arm                   randconfig-001-20250819    gcc-8.5.0
arm                   randconfig-002-20250818    clang-22
arm                   randconfig-002-20250819    gcc-8.5.0
arm                   randconfig-003-20250818    clang-18
arm                   randconfig-003-20250819    gcc-8.5.0
arm                   randconfig-004-20250818    gcc-10.5.0
arm                   randconfig-004-20250819    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250818    gcc-11.5.0
arm64                 randconfig-001-20250819    gcc-8.5.0
arm64                 randconfig-002-20250818    gcc-12.5.0
arm64                 randconfig-002-20250819    gcc-8.5.0
arm64                 randconfig-003-20250818    gcc-8.5.0
arm64                 randconfig-003-20250819    gcc-8.5.0
arm64                 randconfig-004-20250818    clang-22
arm64                 randconfig-004-20250819    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250819    clang-22
csky                  randconfig-001-20250819    gcc-15.1.0
csky                  randconfig-002-20250819    clang-22
csky                  randconfig-002-20250819    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250819    clang-22
hexagon               randconfig-002-20250819    clang-18
hexagon               randconfig-002-20250819    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250818    clang-20
i386        buildonly-randconfig-001-20250819    gcc-12
i386        buildonly-randconfig-002-20250818    clang-20
i386        buildonly-randconfig-002-20250819    gcc-12
i386        buildonly-randconfig-003-20250818    gcc-12
i386        buildonly-randconfig-003-20250819    gcc-12
i386        buildonly-randconfig-004-20250818    clang-20
i386        buildonly-randconfig-004-20250819    gcc-12
i386        buildonly-randconfig-005-20250818    gcc-12
i386        buildonly-randconfig-005-20250819    gcc-12
i386        buildonly-randconfig-006-20250818    gcc-12
i386        buildonly-randconfig-006-20250819    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250819    clang-20
i386                  randconfig-002-20250819    clang-20
i386                  randconfig-003-20250819    clang-20
i386                  randconfig-004-20250819    clang-20
i386                  randconfig-005-20250819    clang-20
i386                  randconfig-006-20250819    clang-20
i386                  randconfig-007-20250819    clang-20
i386                  randconfig-011-20250819    gcc-12
i386                  randconfig-012-20250819    gcc-12
i386                  randconfig-013-20250819    gcc-12
i386                  randconfig-014-20250819    gcc-12
i386                  randconfig-015-20250819    gcc-12
i386                  randconfig-016-20250819    gcc-12
i386                  randconfig-017-20250819    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250819    clang-22
loongarch             randconfig-001-20250819    gcc-15.1.0
loongarch             randconfig-002-20250819    clang-18
loongarch             randconfig-002-20250819    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath79_defconfig    clang-19
mips                        bcm47xx_defconfig    clang-19
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250819    clang-22
nios2                 randconfig-001-20250819    gcc-8.5.0
nios2                 randconfig-002-20250819    clang-22
nios2                 randconfig-002-20250819    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250819    clang-22
parisc                randconfig-001-20250819    gcc-10.5.0
parisc                randconfig-002-20250819    clang-22
parisc                randconfig-002-20250819    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20250819    clang-22
powerpc               randconfig-002-20250819    clang-22
powerpc               randconfig-002-20250819    gcc-10.5.0
powerpc               randconfig-003-20250819    clang-22
powerpc                    sam440ep_defconfig    clang-19
powerpc                     stx_gp3_defconfig    clang-19
powerpc64             randconfig-001-20250819    clang-22
powerpc64             randconfig-002-20250819    clang-22
powerpc64             randconfig-003-20250819    clang-22
powerpc64             randconfig-003-20250819    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250818    gcc-10.5.0
riscv                 randconfig-001-20250819    gcc-8.5.0
riscv                 randconfig-002-20250818    clang-22
riscv                 randconfig-002-20250819    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250818    clang-22
s390                  randconfig-001-20250819    gcc-8.5.0
s390                  randconfig-002-20250818    gcc-8.5.0
s390                  randconfig-002-20250819    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250818    gcc-12.5.0
sh                    randconfig-001-20250819    gcc-8.5.0
sh                    randconfig-002-20250818    gcc-13.4.0
sh                    randconfig-002-20250819    gcc-8.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250818    gcc-12.5.0
sparc                 randconfig-001-20250819    gcc-8.5.0
sparc                 randconfig-002-20250818    gcc-15.1.0
sparc                 randconfig-002-20250819    gcc-8.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250818    clang-22
sparc64               randconfig-001-20250819    gcc-8.5.0
sparc64               randconfig-002-20250818    gcc-12.5.0
sparc64               randconfig-002-20250819    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250818    gcc-11
um                    randconfig-001-20250819    gcc-8.5.0
um                    randconfig-002-20250818    gcc-12
um                    randconfig-002-20250819    gcc-8.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250818    gcc-12
x86_64      buildonly-randconfig-001-20250819    clang-20
x86_64      buildonly-randconfig-002-20250818    gcc-12
x86_64      buildonly-randconfig-002-20250819    clang-20
x86_64      buildonly-randconfig-003-20250818    gcc-12
x86_64      buildonly-randconfig-003-20250819    clang-20
x86_64      buildonly-randconfig-004-20250818    gcc-12
x86_64      buildonly-randconfig-004-20250819    clang-20
x86_64      buildonly-randconfig-005-20250818    gcc-12
x86_64      buildonly-randconfig-005-20250819    clang-20
x86_64      buildonly-randconfig-006-20250818    clang-20
x86_64      buildonly-randconfig-006-20250819    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250819    gcc-12
x86_64                randconfig-002-20250819    gcc-12
x86_64                randconfig-003-20250819    gcc-12
x86_64                randconfig-004-20250819    gcc-12
x86_64                randconfig-005-20250819    gcc-12
x86_64                randconfig-006-20250819    gcc-12
x86_64                randconfig-007-20250819    gcc-12
x86_64                randconfig-008-20250819    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                           alldefconfig    clang-19
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250818    gcc-14.3.0
xtensa                randconfig-001-20250819    gcc-8.5.0
xtensa                randconfig-002-20250818    gcc-14.3.0
xtensa                randconfig-002-20250819    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

