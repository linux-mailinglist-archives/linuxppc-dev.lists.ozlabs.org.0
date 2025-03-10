Return-Path: <linuxppc-dev+bounces-6858-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E08AA5AE06
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 00:36:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBYDm5lwgz301Y;
	Tue, 11 Mar 2025 10:36:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741649768;
	cv=none; b=mM1tXe0g8Oo56lnPx0iq0MqnrT4actTlv1kIDwL2bBy50tVfuiDy7LmUjObTxyE6ACWuQZGx6NohSxhJJjhDuVuwLc5V9tbQUMmZZ2Dvb32zn7GKbl4i6yYiVfBsrG8ZwzsqQEN3Qy9PJyPfZaQ7/INspzuC7ZtL33+9woo3TkLAOG6IS5O1o37qdgsWW6rmiuQQRDB+MYNjtKhRSLCdvBNEbCdyAx9pqxiop1stezssXQJ4AhFxrdEREKLqBljs7HKmGn2tFGNQMn85G9ZsLpEalYhecijaYzc8R0Wz0bCShqSoyMeM8HcUE+n1+trv5ZLYRy3nUsGGMNoEXHt22Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741649768; c=relaxed/relaxed;
	bh=R6Qo7w2ukDlO6wPlHSv9WlGLNVR1x0MNnFEj/CMEi60=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QHvv9GI8F0/yFMRhKxCwp6kVhd8MyKYUVphPv6b8T3I9L9TZ5TlBElbRI3zOHQWyvkfJ2CpR/lR5U48JAMrUl72QPkuKggR2/DxYU0CSwlh5VC9vW/NFf3CBpuMMyN1ONoNzVM9VX/bm+JXup0cv8W0Ft/Dso7b2anP8iTjim0p7LuyJu9si7DZ0KjFO5PIbbhy9zz6Ks/4SqvlcIkMb/Ki0jlr5sJssdqf8gVoBNaXhFVvGyIeMWTtFztytQRwJ+HIbmvpd84aAHq/XZ6fZokg5B7GRhHxeXGrdoJ/NJ2zCMaVHrAhyKpUoHEzQ0xLFNtrBS5wrpGuT70zkqTFRcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PtiytiJx; dkim-atps=neutral; spf=pass (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PtiytiJx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBYDg1JvVz2yjV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 10:36:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741649763; x=1773185763;
  h=date:from:to:cc:subject:message-id;
  bh=kaG+xFQMkbozI46JAPR2SzEgvgjimMMYRlaawOWzUeI=;
  b=PtiytiJxLvx1hvlxY3iCi86yBgV2FORoT5yg/jL2CblAUiKazkuczn9O
   /FP1Walwv8zRaA39GPeetFcfWZDJzMG3LIS7JryTHAh+pXeKpmes4G/Sh
   Zj/1il1P2LFzwMdBGhgQiQMZ/8B7G/I+QhlRDLeLFfg2DeSrxthGN2+jL
   3MzGtP6doxSAZ2SoAHII/ucXjhZUmJY/siKhoAeJEH4KvaDfEvEpOaVDo
   8ctNlUfretmSEZcJReVcI6ePq4nTW0YJcVFJWDmk7MME3t1W7YscEsM29
   j0qlA4zchbfDidaxy9EmMvTHG0ZIbDLNek8m1MIMe1hV7usJ9+inWd5ni
   g==;
X-CSE-ConnectionGUID: rzXDFxTWRAeJ0xzCnh+C4w==
X-CSE-MsgGUID: 5cMdEan0QM6GTc1WHABYNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="30245274"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="30245274"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 16:35:57 -0700
X-CSE-ConnectionGUID: DVKt7Bg+R72nKmGDumVMUg==
X-CSE-MsgGUID: 45dWciXHSmOJZAqAllXX9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="124737123"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 10 Mar 2025 16:35:56 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trmf4-0006BQ-1L;
	Mon, 10 Mar 2025 23:35:54 +0000
Date: Tue, 11 Mar 2025 07:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next-test] BUILD SUCCESS
 861efb8a48ee8b73ae4e8817509cd4e82fd52bc4
Message-ID: <202503110713.6TxenSYO-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 861efb8a48ee8b73ae4e8817509cd4e82fd52bc4  powerpc/kexec: fix physical address calculation in clear_utlb_entry()

Warning ids grouped by kconfigs:

recent_errors
`-- powerpc-allnoconfig
    `-- kismet:WARNING:unmet-direct-dependencies-detected-for-PPC_RADIX_BROADCAST_TLBIE-when-selected-by-PPC_POWERNV

elapsed time: 1078m

configs tested: 122
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250310    gcc-13.2.0
arc                   randconfig-002-20250310    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                          pxa3xx_defconfig    clang-21
arm                   randconfig-001-20250310    clang-21
arm                   randconfig-002-20250310    gcc-14.2.0
arm                   randconfig-003-20250310    gcc-14.2.0
arm                   randconfig-004-20250310    clang-21
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250310    clang-19
arm64                 randconfig-002-20250310    clang-17
arm64                 randconfig-003-20250310    clang-15
arm64                 randconfig-004-20250310    clang-17
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250310    gcc-14.2.0
csky                  randconfig-002-20250310    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250310    clang-21
hexagon               randconfig-002-20250310    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250310    clang-19
i386        buildonly-randconfig-002-20250310    clang-19
i386        buildonly-randconfig-003-20250310    clang-19
i386        buildonly-randconfig-004-20250310    clang-19
i386        buildonly-randconfig-005-20250310    clang-19
i386        buildonly-randconfig-006-20250310    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250310    gcc-14.2.0
loongarch             randconfig-002-20250310    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250310    gcc-14.2.0
nios2                 randconfig-002-20250310    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250310    gcc-14.2.0
parisc                randconfig-002-20250310    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                 canyonlands_defconfig    clang-19
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250310    clang-17
powerpc               randconfig-002-20250310    clang-21
powerpc               randconfig-003-20250310    clang-17
powerpc64             randconfig-001-20250310    gcc-14.2.0
powerpc64             randconfig-002-20250310    gcc-14.2.0
powerpc64             randconfig-003-20250310    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250310    clang-19
riscv                 randconfig-002-20250310    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250310    gcc-14.2.0
s390                  randconfig-002-20250310    clang-18
s390                       zfcpdump_defconfig    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250310    gcc-14.2.0
sh                    randconfig-002-20250310    gcc-14.2.0
sh                          rsk7203_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.2.0
sh                            titan_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250310    gcc-14.2.0
sparc                 randconfig-002-20250310    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250310    gcc-14.2.0
sparc64               randconfig-002-20250310    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250310    gcc-12
um                    randconfig-002-20250310    clang-17
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250310    gcc-12
x86_64      buildonly-randconfig-002-20250310    clang-19
x86_64      buildonly-randconfig-003-20250310    clang-19
x86_64      buildonly-randconfig-004-20250310    clang-19
x86_64      buildonly-randconfig-005-20250310    clang-19
x86_64      buildonly-randconfig-006-20250310    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250310    gcc-14.2.0
xtensa                randconfig-002-20250310    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

