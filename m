Return-Path: <linuxppc-dev+bounces-8852-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CC5AC000E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 May 2025 00:50:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2mpx2gS4z2yZ5;
	Thu, 22 May 2025 08:50:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747867833;
	cv=none; b=kuf87gdsXUS5ehSlHZG+AQjqq3tdbWiULH87R5aXqPDCLm/IWg4tfoUt88+s9ROd3uz1F4kSjovv4tobZp739WD0fW5zaXEwmG5hp8GpYmcUF9ren56JD4aBK8XF6rqbrhwcsk9pWUKlZTgzQEe9fo/J0YCbQhQET2BUmlV/ZGRn1oFZ7zcYXbZ/vVTjeAmoi03hqA6EyErC8pPUCJoqmEs+4opOwqIG3IpoKhoRjT8ngjuVLg5w76x5ogWtkikaH4g3LCMArUihJZmRsg5I+zdZfzazHnckK9PyEl6UA1kw4d8546Ra6c0YA5v+SDtnhcLUOHb+XqrwK2z8iXi4Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747867833; c=relaxed/relaxed;
	bh=usnxWRsB9/sh1qYzI4osptSgrSjuYYbmXtDutw4/ZEw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aUQEX48pZMUhi71JIUIzsJZMwyuSR6O/2iJxN7SDVWsLGDxRyLD5eXVxs5ZuAUHzBE8SfA2OIOwKVSv0fpWvTE4kIaMkjo3brMeGq4a60Ln1K/9OuWLX2qvYfmYKD7TdF6ww6Z/bttZIADqwsnqNsp1LScZiQcLIQ9US2/nfi3gTh/NyRZVIw7LfdbfGj/qdk7gj2JUY0SwmE8XRSb2C9CSGBzo5eFvUXud/EvXmS3LM+e1JluGDgvmaZyW3xoaE5IN7aYGCkDHI8s5YN3hcCYWzfCPYMk9H9/xMUXjVGVH2FmnB/cpLi8WoQ+rjRr+fijdK8VvXOMKaaMQaAiV+kg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V5svBTM0; dkim-atps=neutral; spf=pass (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V5svBTM0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2mpt3P1Rz2yYy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 08:50:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747867830; x=1779403830;
  h=date:from:to:cc:subject:message-id;
  bh=x76xClH2JypGOWLBfAPn4A/hq439IkfdkcM+uCsU0lw=;
  b=V5svBTM0jXWr/OCKGzdW0oXexYjw4iFX6R4dk3n9Ral2AE8rbLNeCYJh
   iVUiGbI8XXTbaw0x3jtEzyDtE8uAV5knUHbh5OfEiuBhjyUkLYtw4RI91
   uPYsxQOEmK1UGQnzfGuJgddyLZRUgw289wnxWpCMhgm43bJli+9Ja75zB
   IJzyTfoDSAiADxkOqNyvBjQ/kuIlwDGRedJjyCge0y537yjgo3AcurQ8e
   ot38/zjtIfGTSffbs9xwcLlxTWwg+G76jEVC4qrI2h69o2s8stKQbYNYH
   5KoqUayYwJ00uUw4D3E0GmNXqEr3byCWkGL8TAPK1QnjHEX8tGwUU/hPS
   w==;
X-CSE-ConnectionGUID: yKyGGx6MRMqj828YK6afCA==
X-CSE-MsgGUID: Pr6KnMX2TiusaNOTUmn1tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49125859"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="49125859"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 15:50:24 -0700
X-CSE-ConnectionGUID: +ophvqOVQOi72xKBVbp8jQ==
X-CSE-MsgGUID: X7kseszgQK2dKZSIDz5uIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="145158546"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 May 2025 15:50:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHsGT-000Ohc-2i;
	Wed, 21 May 2025 22:50:21 +0000
Date: Thu, 22 May 2025 06:50:17 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next] BUILD SUCCESS
 8682a5749a3d2b416b57709115c0351b50c8efcb
Message-ID: <202505220607.UNHmsr7j-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 8682a5749a3d2b416b57709115c0351b50c8efcb  MAINTAINERS: powerpc: Remove myself as a reviewer

elapsed time: 1112m

configs tested: 240
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                      axs103_smp_defconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250521    gcc-10.5.0
arc                   randconfig-001-20250522    clang-21
arc                   randconfig-002-20250521    gcc-12.4.0
arc                   randconfig-002-20250522    clang-21
arc                    vdk_hs38_smp_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                         bcm2835_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                          moxart_defconfig    clang-21
arm                            mps2_defconfig    clang-21
arm                            mps2_defconfig    gcc-14.2.0
arm                   randconfig-001-20250521    clang-21
arm                   randconfig-001-20250522    clang-21
arm                   randconfig-002-20250521    clang-21
arm                   randconfig-002-20250522    clang-21
arm                   randconfig-003-20250521    clang-16
arm                   randconfig-003-20250522    clang-21
arm                   randconfig-004-20250521    clang-21
arm                   randconfig-004-20250522    clang-21
arm                        realview_defconfig    clang-16
arm                         socfpga_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250521    gcc-6.5.0
arm64                 randconfig-001-20250522    clang-21
arm64                 randconfig-002-20250521    gcc-6.5.0
arm64                 randconfig-002-20250522    clang-21
arm64                 randconfig-003-20250521    gcc-8.5.0
arm64                 randconfig-003-20250522    clang-21
arm64                 randconfig-004-20250521    gcc-8.5.0
arm64                 randconfig-004-20250522    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250521    gcc-10.5.0
csky                  randconfig-001-20250522    gcc-9.3.0
csky                  randconfig-002-20250521    gcc-12.4.0
csky                  randconfig-002-20250522    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250521    clang-20
hexagon               randconfig-001-20250522    gcc-9.3.0
hexagon               randconfig-002-20250521    clang-21
hexagon               randconfig-002-20250522    gcc-9.3.0
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250521    clang-20
i386        buildonly-randconfig-001-20250522    clang-20
i386        buildonly-randconfig-001-20250522    gcc-12
i386        buildonly-randconfig-002-20250521    clang-20
i386        buildonly-randconfig-002-20250522    gcc-12
i386        buildonly-randconfig-003-20250521    gcc-12
i386        buildonly-randconfig-003-20250522    gcc-12
i386        buildonly-randconfig-004-20250521    clang-20
i386        buildonly-randconfig-004-20250522    gcc-12
i386        buildonly-randconfig-005-20250521    gcc-12
i386        buildonly-randconfig-005-20250522    gcc-12
i386        buildonly-randconfig-006-20250521    gcc-12
i386        buildonly-randconfig-006-20250522    clang-20
i386        buildonly-randconfig-006-20250522    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250522    clang-20
i386                  randconfig-002-20250522    clang-20
i386                  randconfig-003-20250522    clang-20
i386                  randconfig-004-20250522    clang-20
i386                  randconfig-005-20250522    clang-20
i386                  randconfig-006-20250522    clang-20
i386                  randconfig-007-20250522    clang-20
i386                  randconfig-011-20250522    gcc-12
i386                  randconfig-012-20250522    gcc-12
i386                  randconfig-013-20250522    gcc-12
i386                  randconfig-014-20250522    gcc-12
i386                  randconfig-015-20250522    gcc-12
i386                  randconfig-016-20250522    gcc-12
i386                  randconfig-017-20250522    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250521    gcc-15.1.0
loongarch             randconfig-001-20250522    gcc-9.3.0
loongarch             randconfig-002-20250521    gcc-14.2.0
loongarch             randconfig-002-20250522    gcc-9.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    clang-21
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           jazz_defconfig    clang-17
mips                       rbtx49xx_defconfig    gcc-14.2.0
mips                         rt305x_defconfig    gcc-14.2.0
mips                   sb1250_swarm_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250521    gcc-14.2.0
nios2                 randconfig-001-20250522    gcc-9.3.0
nios2                 randconfig-002-20250521    gcc-14.2.0
nios2                 randconfig-002-20250522    gcc-9.3.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250521    gcc-13.3.0
parisc                randconfig-001-20250522    gcc-9.3.0
parisc                randconfig-002-20250521    gcc-11.5.0
parisc                randconfig-002-20250522    gcc-9.3.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                 canyonlands_defconfig    clang-21
powerpc                        fsp2_defconfig    clang-21
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc                      ppc64e_defconfig    clang-21
powerpc               randconfig-001-20250521    clang-21
powerpc               randconfig-001-20250522    gcc-9.3.0
powerpc               randconfig-002-20250521    gcc-8.5.0
powerpc               randconfig-002-20250522    gcc-9.3.0
powerpc               randconfig-003-20250521    gcc-6.5.0
powerpc               randconfig-003-20250522    gcc-9.3.0
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250521    gcc-8.5.0
powerpc64             randconfig-001-20250522    gcc-9.3.0
powerpc64             randconfig-002-20250521    gcc-6.5.0
powerpc64             randconfig-002-20250522    gcc-9.3.0
powerpc64             randconfig-003-20250521    clang-21
powerpc64             randconfig-003-20250522    gcc-9.3.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250521    gcc-8.5.0
riscv                 randconfig-001-20250522    gcc-10.5.0
riscv                 randconfig-002-20250521    gcc-8.5.0
riscv                 randconfig-002-20250522    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250521    clang-20
s390                  randconfig-001-20250522    gcc-10.5.0
s390                  randconfig-002-20250521    clang-21
s390                  randconfig-002-20250522    gcc-10.5.0
s390                       zfcpdump_defconfig    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250521    gcc-12.4.0
sh                    randconfig-001-20250522    gcc-10.5.0
sh                    randconfig-002-20250521    gcc-15.1.0
sh                    randconfig-002-20250522    gcc-10.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250521    gcc-13.3.0
sparc                 randconfig-001-20250522    gcc-10.5.0
sparc                 randconfig-002-20250521    gcc-13.3.0
sparc                 randconfig-002-20250522    gcc-10.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250521    gcc-13.3.0
sparc64               randconfig-001-20250522    gcc-10.5.0
sparc64               randconfig-002-20250521    gcc-13.3.0
sparc64               randconfig-002-20250522    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250521    clang-21
um                    randconfig-001-20250522    gcc-10.5.0
um                    randconfig-002-20250521    clang-21
um                    randconfig-002-20250522    gcc-10.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250521    clang-20
x86_64      buildonly-randconfig-001-20250522    clang-20
x86_64      buildonly-randconfig-002-20250521    clang-20
x86_64      buildonly-randconfig-002-20250522    clang-20
x86_64      buildonly-randconfig-003-20250521    gcc-12
x86_64      buildonly-randconfig-003-20250522    clang-20
x86_64      buildonly-randconfig-004-20250521    gcc-12
x86_64      buildonly-randconfig-004-20250522    clang-20
x86_64      buildonly-randconfig-005-20250521    clang-20
x86_64      buildonly-randconfig-005-20250522    clang-20
x86_64      buildonly-randconfig-006-20250521    clang-20
x86_64      buildonly-randconfig-006-20250522    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20250522    gcc-12
x86_64                randconfig-072-20250522    gcc-12
x86_64                randconfig-073-20250522    gcc-12
x86_64                randconfig-074-20250522    gcc-12
x86_64                randconfig-075-20250522    gcc-12
x86_64                randconfig-076-20250522    gcc-12
x86_64                randconfig-077-20250522    gcc-12
x86_64                randconfig-078-20250522    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250521    gcc-15.1.0
xtensa                randconfig-001-20250522    gcc-10.5.0
xtensa                randconfig-002-20250521    gcc-15.1.0
xtensa                randconfig-002-20250522    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

