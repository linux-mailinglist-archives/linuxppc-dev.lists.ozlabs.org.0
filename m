Return-Path: <linuxppc-dev+bounces-14580-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D48C9F292
	for <lists+linuxppc-dev@lfdr.de>; Wed, 03 Dec 2025 14:40:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLzL50LHTz2yrl;
	Thu, 04 Dec 2025 00:40:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764769244;
	cv=none; b=ipG8+jbhlQae3EN2VozHLDbivPUZHqVHZBYMvgy0yAa1iNclkoQWFkGRgDrDztLivCR0dDCOR5dHvZ3NUMPRoQPOwIo4BxX0HOSQwSXHDQj/DnP5Wdo5UrUK5rws9ZbJdsTRNN//3tp8UqRbs/GByRlSs9+1xHtrTOC0GtBLo+OHc8KgflItNkD3CO2l8ToC6dna9up+x8YfWWJRJT2NyRObSDgePGixbZaGdaH3Koevde/Kkl3qAmYNP4rUz3mn507DlSxkZKleu6GGaHovgWPwYkB2xT/l3yqYK1DQKAoSzsqQKbv9j+gZFSa5L2T0aGZpPxCIalRO2c3xfdDMSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764769244; c=relaxed/relaxed;
	bh=mBfwfLS7CV2k6LYu+wVQ6deBCI9Ep5tZ3gWP4bXJEkc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ho5Zof0JMgNObrQV/BBF/sLN/QsNl+6Oqv7gPvit/h0KOLWbl1qCnQFo3cTjR7jHiTXQofKqpgNELYy/MJ2DyzZPM2HoyGvgaRPzmvR+v+4hC2qhDJPlrhKFDPbbPdGBfdM25Sa+6SDj27YQ1brQtmqiICR7/kNonMPbzOE93y7wtC67Kuh1RyLfI3NvsweB8fZOcjtJ8tUAx9yb0N3TM7l81RuNuSo3PlPdehybln7Y8SJ6Rplf0d0v1K+eFvzGDm/GK2K7k+1Ylzg++TjiIE5jLyqBmh3TbmqMkPwP/uB2TDr05gAbtbF1rZkf9MJBgzv/IMlIWO5Af30nPcolqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JwdFSw7F; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JwdFSw7F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dLzL22dyVz2xPB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Dec 2025 00:40:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764769242; x=1796305242;
  h=date:from:to:cc:subject:message-id;
  bh=3SmVUxWi8oG+rXOgxrUpvkRfoI76Sso6gHGdjN+IJy0=;
  b=JwdFSw7FsQadwOVpFZxPGvt5tbRodQs2MSJ0BKYIIdcnJlFIwzmOfQXi
   0PsSTylqQTl3Wy3BfeXYJT2ad+fGtp6rTN2SptZvEJIpAQ5k/T+HUsOgY
   FOmSxO/v5G6chgYWD4ByyCnSIip/PbkmKpKWOHQpjrMvHELnDztyQFBDM
   y/P08BqsxhPbTOn1IQWtQ8qUQbBFIDAV1zwEmyqNeTz2akHY01bphAP0R
   uHDQRm/Xf7DOBe/Vi2c50RVFJ8LDrJu9Rtm8eeyGS9Ugp4WIpNoQeOEv5
   mhItmuJd1D46h28PIzRp3pxcO1GzNE0yLRiBMPMM27bMMZrd7nqXAcF3S
   A==;
X-CSE-ConnectionGUID: T4NQ/siWTTCZvaDw6MRxkA==
X-CSE-MsgGUID: baTWqPhRQmWOdikS//v0zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84353987"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="84353987"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 05:40:37 -0800
X-CSE-ConnectionGUID: etBV5hREToaPX2By3u7Q4Q==
X-CSE-MsgGUID: TAyWlU7uSeyZjpIMZrMGuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="194707887"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Dec 2025 05:40:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQn5t-00000000B1R-42WV;
	Wed, 03 Dec 2025 13:40:33 +0000
Date: Wed, 03 Dec 2025 21:39:59 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next] BUILD SUCCESS
 9b36c7fc5aa5f2c6e6eeb9f312fdfe61b4291c9f
Message-ID: <202512032153.pQdPnjTH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
branch HEAD: 9b36c7fc5aa5f2c6e6eeb9f312fdfe61b4291c9f  macintosh/via-pmu-backlight: Include <linux/fb.h> and <linux/of.h>

elapsed time: 1446m

configs tested: 253
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                          axs101_defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251203    clang-22
arc                   randconfig-001-20251203    gcc-9.5.0
arc                   randconfig-002-20251203    clang-22
arc                   randconfig-002-20251203    gcc-11.5.0
arm                               allnoconfig    gcc-15.1.0
arm                         at91_dt_defconfig    clang-22
arm                                 defconfig    gcc-15.1.0
arm                            hisi_defconfig    gcc-15.1.0
arm                         lpc32xx_defconfig    clang-17
arm                          moxart_defconfig    clang-22
arm                       multi_v4t_defconfig    clang-22
arm                             mxs_defconfig    clang-22
arm                            qcom_defconfig    clang-22
arm                   randconfig-001-20251203    clang-22
arm                   randconfig-001-20251203    gcc-8.5.0
arm                   randconfig-002-20251203    clang-22
arm                   randconfig-003-20251203    clang-22
arm                   randconfig-004-20251203    clang-22
arm                       versatile_defconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251203    clang-17
arm64                 randconfig-001-20251203    gcc-8.5.0
arm64                 randconfig-002-20251203    clang-17
arm64                 randconfig-003-20251203    clang-17
arm64                 randconfig-003-20251203    gcc-8.5.0
arm64                 randconfig-004-20251203    clang-17
arm64                 randconfig-004-20251203    gcc-8.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251203    clang-17
csky                  randconfig-001-20251203    gcc-15.1.0
csky                  randconfig-002-20251203    clang-17
csky                  randconfig-002-20251203    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251203    clang-22
hexagon               randconfig-001-20251203    gcc-15.1.0
hexagon               randconfig-002-20251203    clang-20
hexagon               randconfig-002-20251203    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251203    clang-20
i386        buildonly-randconfig-001-20251203    gcc-14
i386        buildonly-randconfig-002-20251203    clang-20
i386        buildonly-randconfig-002-20251203    gcc-14
i386        buildonly-randconfig-003-20251203    clang-20
i386        buildonly-randconfig-003-20251203    gcc-14
i386        buildonly-randconfig-004-20251203    clang-20
i386        buildonly-randconfig-005-20251203    clang-20
i386        buildonly-randconfig-006-20251203    clang-20
i386        buildonly-randconfig-006-20251203    gcc-14
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251203    clang-20
i386                  randconfig-002-20251203    clang-20
i386                  randconfig-002-20251203    gcc-14
i386                  randconfig-003-20251203    clang-20
i386                  randconfig-004-20251203    clang-20
i386                  randconfig-005-20251203    clang-20
i386                  randconfig-005-20251203    gcc-14
i386                  randconfig-006-20251203    clang-20
i386                  randconfig-006-20251203    gcc-14
i386                  randconfig-007-20251203    clang-20
i386                  randconfig-007-20251203    gcc-14
i386                  randconfig-011-20251203    clang-20
i386                  randconfig-012-20251203    clang-20
i386                  randconfig-012-20251203    gcc-14
i386                  randconfig-013-20251203    clang-20
i386                  randconfig-014-20251203    clang-20
i386                  randconfig-014-20251203    gcc-14
i386                  randconfig-015-20251203    clang-20
i386                  randconfig-015-20251203    gcc-13
i386                  randconfig-016-20251203    clang-20
i386                  randconfig-017-20251203    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251203    gcc-15.1.0
loongarch             randconfig-002-20251203    gcc-14.3.0
loongarch             randconfig-002-20251203    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
m68k                       m5475evb_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                           ip22_defconfig    gcc-15.1.0
mips                           ip30_defconfig    gcc-15.1.0
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251203    gcc-15.1.0
nios2                 randconfig-001-20251203    gcc-9.5.0
nios2                 randconfig-002-20251203    gcc-15.1.0
nios2                 randconfig-002-20251203    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-32bit_defconfig    gcc-15.1.0
parisc                generic-64bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20251203    clang-22
parisc                randconfig-001-20251203    gcc-12.5.0
parisc                randconfig-002-20251203    clang-22
parisc                randconfig-002-20251203    gcc-8.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                       ebony_defconfig    clang-22
powerpc                  iss476-smp_defconfig    clang-22
powerpc                   motionpro_defconfig    clang-22
powerpc                     mpc5200_defconfig    clang-22
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc               randconfig-001-20251203    clang-22
powerpc               randconfig-001-20251203    gcc-8.5.0
powerpc               randconfig-002-20251203    clang-22
powerpc64             randconfig-001-20251203    gcc-8.5.0
powerpc64             randconfig-002-20251203    clang-22
riscv                             allnoconfig    clang-22
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251203    gcc-14.3.0
riscv                 randconfig-002-20251203    clang-22
riscv                 randconfig-002-20251203    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251203    clang-22
s390                  randconfig-001-20251203    gcc-14.3.0
s390                  randconfig-002-20251203    clang-22
s390                  randconfig-002-20251203    gcc-14.3.0
sh                               alldefconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                        edosk7760_defconfig    clang-22
sh                          kfr2r09_defconfig    clang-22
sh                    randconfig-001-20251203    gcc-14.3.0
sh                    randconfig-001-20251203    gcc-15.1.0
sh                    randconfig-002-20251203    gcc-13.4.0
sh                    randconfig-002-20251203    gcc-14.3.0
sh                           se7705_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251203    clang-20
sparc                 randconfig-001-20251203    gcc-13.4.0
sparc                 randconfig-002-20251203    clang-20
sparc                 randconfig-002-20251203    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251203    clang-20
sparc64               randconfig-002-20251203    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251203    clang-20
um                    randconfig-001-20251203    gcc-14
um                    randconfig-002-20251203    clang-20
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251203    clang-20
x86_64      buildonly-randconfig-002-20251203    clang-20
x86_64      buildonly-randconfig-003-20251203    clang-20
x86_64      buildonly-randconfig-004-20251203    clang-20
x86_64      buildonly-randconfig-004-20251203    gcc-14
x86_64      buildonly-randconfig-005-20251203    clang-20
x86_64      buildonly-randconfig-006-20251203    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251203    clang-20
x86_64                randconfig-001-20251203    gcc-14
x86_64                randconfig-002-20251203    clang-20
x86_64                randconfig-002-20251203    gcc-14
x86_64                randconfig-003-20251203    clang-20
x86_64                randconfig-004-20251203    clang-20
x86_64                randconfig-005-20251203    clang-20
x86_64                randconfig-005-20251203    gcc-14
x86_64                randconfig-006-20251203    clang-20
x86_64                randconfig-006-20251203    gcc-14
x86_64                randconfig-011-20251203    clang-20
x86_64                randconfig-011-20251203    gcc-14
x86_64                randconfig-012-20251203    clang-20
x86_64                randconfig-013-20251203    clang-20
x86_64                randconfig-013-20251203    gcc-14
x86_64                randconfig-014-20251203    clang-20
x86_64                randconfig-015-20251203    clang-20
x86_64                randconfig-015-20251203    gcc-14
x86_64                randconfig-016-20251203    clang-20
x86_64                randconfig-071-20251203    clang-20
x86_64                randconfig-071-20251203    gcc-14
x86_64                randconfig-072-20251203    gcc-14
x86_64                randconfig-073-20251203    clang-20
x86_64                randconfig-073-20251203    gcc-14
x86_64                randconfig-074-20251203    gcc-14
x86_64                randconfig-075-20251203    clang-20
x86_64                randconfig-075-20251203    gcc-14
x86_64                randconfig-076-20251203    clang-20
x86_64                randconfig-076-20251203    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                randconfig-001-20251203    clang-20
xtensa                randconfig-001-20251203    gcc-14.3.0
xtensa                randconfig-002-20251203    clang-20
xtensa                randconfig-002-20251203    gcc-11.5.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

