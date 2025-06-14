Return-Path: <linuxppc-dev+bounces-9378-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DEAAD9E7E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jun 2025 19:30:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bKNZJ0bVKz30P3;
	Sun, 15 Jun 2025 03:30:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749922216;
	cv=none; b=bksa8LlcU9QdL5OS8LcJI4CLclCOjuRdRz32Qnfh8gvOrOWSHBUr4GyF6tiRR9aHHho4DFjjrcPqapyNaaC+jq2kXSOVAK1dp2tyljSs9TQOVdpZq9jbSQxuOQObIZtoNyGsXWnOz8ENHni8LyFh0OKIiWqjm9nnJEumaH0lXs/cxF/jeB86ob0nRCiunC4SlIKfYiIbPBZ0T4EvfaOb1umoq036lEygnk5wubtyHN/Xa3W03nTx4YLNydRl6I7YFBAgm82zeICx3Ii1VpGU7wf/COFbeRLaJa6pMXxZ4YtYfra+T50H33l6RzAdcHyV+WzWhqIlj1boWnpjVVavyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749922216; c=relaxed/relaxed;
	bh=XES0dj5oF/A4thJXzYWLkAuuRz9Bmax/N+uVvKZOlPM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RfRfSYzoS5HFENII9f3cfInDlwYW9Yhhj84B8hJap3MIxUjpofsE+lt6Js4sOL1WKu8lSTiPWBCfzgMY/j0s+Q3okBUWtDNLbG9wG7AoTORAtt+VUnlWLVcpEjw+QpQdHiSwgE25gejOX5VL/dEmH/meeenJ/zFCApsW3KgkEybkyYcY0DG8hSDZj/Xfn9PdyIzrluGOcNiNI7UDK5y1/UJZMdkNtTKR1mcU5EWGlYMMNyiT6HdppfUQa0ImpH0ipgp0NADV4bwyc0PhG7iaVfysjoPSRsrcyem2BxAiH9Dz+VlQVr0XbnUeOBmpLB/JDWpOYmb2KwY1IWYDhUUntw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yic1ASKg; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yic1ASKg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKNZH1K94z30MY
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Jun 2025 03:30:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749922216; x=1781458216;
  h=date:from:to:cc:subject:message-id;
  bh=mw5gDFHxHvBjCEAvkgC8wpxY4DrQfeNbipiqBOwHOAo=;
  b=Yic1ASKgvT8qxkuKozlvRqYU46OPfLgvTnIo2peHk/Vr7hoZMaexZYmb
   VFYVOFH0orWfa/+y0GHwzIQ0FBCWM2tSk4CA67BPtoXnyZmK9WENJRHHo
   Ynd7J/N3nB7qKLdzeSPQYev9aQzBM4LpUkHF+KOhQ4ZAcSCiB8i5ZXO7q
   HpBoSC3nvZzjXdoFvZ3wJNj73SgOdblh591as4/B40lo28blOkB+UlQDl
   2UjBZuEn1e6Pe+GPdkcvB9rcYw8U7urgutFCpMPcgQriHEQJzLWABrpD4
   XDnJkUJUv+2UgMzB7cT0zifb/zQx9LHTcG9DfBM8rB7sqZT5LwJEyIrMC
   g==;
X-CSE-ConnectionGUID: E8KiUmUpRS2QqUDERVW0xQ==
X-CSE-MsgGUID: Ez52fyLESReLjvlblsV/9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="77510302"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="77510302"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 10:30:13 -0700
X-CSE-ConnectionGUID: rxmtrQ0bTnyPEwvziRGy3g==
X-CSE-MsgGUID: t6mXPThfTAGTgs+a67V+FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="147953116"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jun 2025 10:30:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQUhm-000Dih-0y;
	Sat, 14 Jun 2025 17:30:10 +0000
Date: Sun, 15 Jun 2025 01:29:19 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 2ceef7f4b099382dbdcfbe08852724165c938fec
Message-ID: <202506150109.Ep6bvwsq-lkp@intel.com>
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
branch HEAD: 2ceef7f4b099382dbdcfbe08852724165c938fec  Automatic merge of 'fixes' into merge (2025-06-13 22:21)

elapsed time: 1442m

configs tested: 97
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250614    gcc-8.5.0
arc                   randconfig-002-20250614    gcc-12.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250614    gcc-8.5.0
arm                   randconfig-002-20250614    clang-21
arm                   randconfig-003-20250614    clang-16
arm                   randconfig-004-20250614    clang-17
arm64                            allmodconfig    clang-19
arm64                 randconfig-001-20250614    clang-21
arm64                 randconfig-002-20250614    gcc-15.1.0
arm64                 randconfig-003-20250614    clang-21
arm64                 randconfig-004-20250614    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250614    gcc-13.3.0
csky                  randconfig-002-20250614    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250614    clang-21
hexagon               randconfig-002-20250614    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250614    clang-20
i386        buildonly-randconfig-002-20250614    clang-20
i386        buildonly-randconfig-003-20250614    clang-20
i386        buildonly-randconfig-004-20250614    gcc-12
i386        buildonly-randconfig-005-20250614    clang-20
i386        buildonly-randconfig-006-20250614    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch             randconfig-001-20250614    gcc-15.1.0
loongarch             randconfig-002-20250614    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250614    gcc-13.3.0
nios2                 randconfig-002-20250614    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20250614    gcc-8.5.0
parisc                randconfig-002-20250614    gcc-11.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20250614    gcc-13.3.0
powerpc               randconfig-002-20250614    clang-21
powerpc               randconfig-003-20250614    gcc-12.4.0
powerpc64             randconfig-001-20250614    gcc-11.5.0
powerpc64             randconfig-002-20250614    clang-21
powerpc64             randconfig-003-20250614    gcc-12.4.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250614    clang-21
riscv                 randconfig-002-20250614    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250614    clang-21
s390                  randconfig-002-20250614    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250614    gcc-14.3.0
sh                    randconfig-002-20250614    gcc-12.4.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250614    gcc-15.1.0
sparc                 randconfig-002-20250614    gcc-10.3.0
sparc64               randconfig-001-20250614    gcc-8.5.0
sparc64               randconfig-002-20250614    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250614    clang-21
um                    randconfig-002-20250614    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250614    clang-20
x86_64      buildonly-randconfig-002-20250614    clang-20
x86_64      buildonly-randconfig-003-20250614    gcc-12
x86_64      buildonly-randconfig-004-20250614    clang-20
x86_64      buildonly-randconfig-005-20250614    clang-20
x86_64      buildonly-randconfig-006-20250614    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250614    gcc-9.3.0
xtensa                randconfig-002-20250614    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

