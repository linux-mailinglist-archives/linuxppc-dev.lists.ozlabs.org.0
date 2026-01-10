Return-Path: <linuxppc-dev+bounces-15491-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7CFD0DEF1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jan 2026 00:06:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dpZ5W52MLz2ySB;
	Sun, 11 Jan 2026 10:06:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768086399;
	cv=none; b=gSY7ygaHM3XrnKNA03EtDwhwL8KRCM7/B5876TP/TobxGR6iLMEisB1/M9UecRiMockAych9BZfxWNYer7twphhhPPX8v/9TmHVzwT3sZRvdSpA52Skbq+Z+0CDc/WXyL9Bnr95ZH3u3o4o92+oOwj6czYHhNh9Paddn+/Gt8Ft1+Mt/g+22F9Be6EixOKIykaEf+umnHVu6FnGoTF39oWib/bHBvJASTw9QVb8ZA0qRwenCQr5GjGyfeEoDKEVlup5hoYJTrMJ1wrUc3lwjq60lZXb68JHltRD7PEjFemn0bvU1kcVXeCovhb6JZeAOnWY3n/v5DaRk7i3Yms97mw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768086399; c=relaxed/relaxed;
	bh=nbk0K43Sjq5krcwQejLzdc+hPAgT3BpX+ZfnCr8mzng=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ng+vlTIZO4i8Yba3ceKFbjzJBdDfqUaVmpVccaeZ1FZZHdN1t3koNjeqUIwik4vYcDGBw6m8Gq+EBjMWwY4ba/1MZFDpMWEXfbz2YovOF8V53uphRh6NFXy5SuSnsz1TA4NFD7EeAsLr4jM3f2/Ym8n58IYfI4w6DHPQVec6MsLg7Y4iDCOAFLdTqi9HILHuF36E/LGLO35jeYbMH/qhJKmpaFTF8/OzV92hgY3Wq39jjz7WLGGMc1VynlPH7Ii3SNAG1JsZbVMf1Fi6JO9YWZA8tMZGQsrBjTHaNLIzpy5nSYvJ4vSp1MWjMnaUd1Vx0rmSuQHNULC/yNoXQSfX+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M9uIOjwE; dkim-atps=neutral; spf=pass (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M9uIOjwE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dpZ5S5hbGz2xpt
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jan 2026 10:06:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768086397; x=1799622397;
  h=date:from:to:cc:subject:message-id;
  bh=hwhXV+JxkgB2NzJFZhFbzrVB71Jme4mtH3zjUToVZ6A=;
  b=M9uIOjwEZ7+wyNLnGkBG2fiiiGjmgKc2/b+q1aGDjMN6Rc+hDqDc77M1
   fGYANQ5AEkCFPZ1vqK3I9ilD2PCRsIF5awce+CMDhGjh3XTROxisR1nhj
   xbR2F4XwrBQ0oqnB/+q06g4RS1QinlsH66GCRtChJCqdERA0BYa3LINZp
   XJMZd0gm9x1oqD0axzGiuuc6R2KlEN/6xniSbCKrWv5lZ1HFZcOq+YFno
   PbZ6lhlbWJX4DUe4kE4IjHOSnBqxVd4B5ALuly5d8/RJcmuPxhYw1fDBj
   f+F9toKZ/0OSING9Pc//kHVdH9+S347W9+9kaNwep+PGaIfIEXY3DP8LS
   Q==;
X-CSE-ConnectionGUID: b538tbiUSFmX2CPB4x1Mww==
X-CSE-MsgGUID: VpDDyypBR+qicnmiTCMa6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="80786285"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="80786285"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 15:06:31 -0800
X-CSE-ConnectionGUID: EFQHASzDSAWD8k/1F3cc4w==
X-CSE-MsgGUID: bQ1rmBlFTt2593moir75ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="203836288"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Jan 2026 15:06:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vei2N-000000009Ii-2isn;
	Sat, 10 Jan 2026 23:06:27 +0000
Date: Sun, 11 Jan 2026 07:05:49 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 d5603db47ae6851ec30266bbfd00d39f76086dad
Message-ID: <202601110744.V9RjSLzh-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: d5603db47ae6851ec30266bbfd00d39f76086dad  Automatic merge of 'next' into merge (2026-01-10 15:34)

elapsed time: 773m

configs tested: 319
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.2.0
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                          axs101_defconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260110    clang-22
arc                   randconfig-001-20260111    clang-22
arc                   randconfig-002-20260110    clang-22
arc                   randconfig-002-20260111    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                           h3600_defconfig    gcc-15.2.0
arm                           imxrt_defconfig    gcc-15.2.0
arm                          ixp4xx_defconfig    gcc-15.2.0
arm                   milbeaut_m10v_defconfig    clang-22
arm                            mmp2_defconfig    gcc-15.2.0
arm                             pxa_defconfig    clang-22
arm                   randconfig-001-20260110    clang-22
arm                   randconfig-001-20260111    clang-22
arm                   randconfig-002-20260110    clang-22
arm                   randconfig-002-20260111    clang-22
arm                   randconfig-003-20260110    clang-22
arm                   randconfig-003-20260111    clang-22
arm                   randconfig-004-20260110    clang-22
arm                   randconfig-004-20260111    clang-22
arm                             rpc_defconfig    clang-22
arm                        shmobile_defconfig    clang-22
arm                           u8500_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    clang-22
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260110    gcc-10.5.0
arm64                 randconfig-001-20260111    gcc-12.5.0
arm64                 randconfig-002-20260110    gcc-10.5.0
arm64                 randconfig-002-20260111    gcc-12.5.0
arm64                 randconfig-003-20260110    gcc-10.5.0
arm64                 randconfig-003-20260111    gcc-12.5.0
arm64                 randconfig-004-20260110    gcc-10.5.0
arm64                 randconfig-004-20260111    gcc-12.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260110    gcc-10.5.0
csky                  randconfig-001-20260111    gcc-12.5.0
csky                  randconfig-002-20260110    gcc-10.5.0
csky                  randconfig-002-20260111    gcc-12.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260110    clang-22
hexagon               randconfig-001-20260111    clang-22
hexagon               randconfig-002-20260110    clang-22
hexagon               randconfig-002-20260111    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260110    gcc-14
i386        buildonly-randconfig-001-20260111    clang-20
i386        buildonly-randconfig-002-20260110    gcc-14
i386        buildonly-randconfig-002-20260111    clang-20
i386        buildonly-randconfig-003-20260110    gcc-12
i386        buildonly-randconfig-003-20260110    gcc-14
i386        buildonly-randconfig-003-20260111    clang-20
i386        buildonly-randconfig-004-20260110    clang-20
i386        buildonly-randconfig-004-20260110    gcc-14
i386        buildonly-randconfig-004-20260111    clang-20
i386        buildonly-randconfig-005-20260110    gcc-14
i386        buildonly-randconfig-005-20260111    clang-20
i386        buildonly-randconfig-006-20260110    gcc-14
i386        buildonly-randconfig-006-20260111    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260110    gcc-14
i386                  randconfig-001-20260111    clang-20
i386                  randconfig-002-20260110    gcc-14
i386                  randconfig-002-20260111    clang-20
i386                  randconfig-003-20260110    gcc-14
i386                  randconfig-003-20260111    clang-20
i386                  randconfig-004-20260110    gcc-14
i386                  randconfig-004-20260111    clang-20
i386                  randconfig-005-20260110    gcc-14
i386                  randconfig-005-20260111    clang-20
i386                  randconfig-006-20260110    gcc-14
i386                  randconfig-006-20260111    clang-20
i386                  randconfig-007-20260110    gcc-14
i386                  randconfig-007-20260111    clang-20
i386                  randconfig-011-20260110    clang-20
i386                  randconfig-011-20260110    gcc-14
i386                  randconfig-011-20260111    clang-20
i386                  randconfig-012-20260110    gcc-14
i386                  randconfig-012-20260111    clang-20
i386                  randconfig-013-20260110    gcc-14
i386                  randconfig-013-20260111    clang-20
i386                  randconfig-014-20260110    clang-20
i386                  randconfig-014-20260110    gcc-14
i386                  randconfig-014-20260111    clang-20
i386                  randconfig-015-20260110    clang-20
i386                  randconfig-015-20260110    gcc-14
i386                  randconfig-015-20260111    clang-20
i386                  randconfig-016-20260110    clang-20
i386                  randconfig-016-20260110    gcc-14
i386                  randconfig-016-20260111    clang-20
i386                  randconfig-017-20260110    clang-20
i386                  randconfig-017-20260110    gcc-14
i386                  randconfig-017-20260111    clang-20
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260110    clang-22
loongarch             randconfig-001-20260111    clang-22
loongarch             randconfig-002-20260110    clang-22
loongarch             randconfig-002-20260111    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                         amcore_defconfig    gcc-15.2.0
m68k                         apollo_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                       m5275evb_defconfig    gcc-15.2.0
m68k                        m5307c3_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                       bmips_be_defconfig    gcc-15.2.0
mips                     cu1830-neo_defconfig    gcc-15.2.0
mips                  decstation_64_defconfig    gcc-15.2.0
mips                     decstation_defconfig    clang-22
mips                          eyeq6_defconfig    clang-22
mips                           mtx1_defconfig    gcc-15.2.0
mips                         rt305x_defconfig    clang-22
mips                        vocore2_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260110    clang-22
nios2                 randconfig-001-20260111    clang-22
nios2                 randconfig-002-20260110    clang-22
nios2                 randconfig-002-20260111    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
openrisc                  or1klitex_defconfig    gcc-15.2.0
openrisc                 simple_smp_defconfig    clang-22
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                generic-32bit_defconfig    clang-22
parisc                randconfig-001-20260110    gcc-14.3.0
parisc                randconfig-001-20260111    clang-22
parisc                randconfig-002-20260110    gcc-13.4.0
parisc                randconfig-002-20260110    gcc-14.3.0
parisc                randconfig-002-20260111    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                        fsp2_defconfig    gcc-15.2.0
powerpc                    gamecube_defconfig    clang-22
powerpc                       holly_defconfig    clang-22
powerpc                      mgcoge_defconfig    clang-22
powerpc                 mpc8313_rdb_defconfig    gcc-15.2.0
powerpc               mpc834x_itxgp_defconfig    clang-22
powerpc                     powernv_defconfig    clang-22
powerpc                      ppc44x_defconfig    gcc-15.2.0
powerpc                      ppc6xx_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260110    gcc-14.3.0
powerpc               randconfig-001-20260110    gcc-8.5.0
powerpc               randconfig-001-20260111    clang-22
powerpc               randconfig-002-20260110    gcc-10.5.0
powerpc               randconfig-002-20260110    gcc-14.3.0
powerpc               randconfig-002-20260111    clang-22
powerpc                     tqm5200_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260110    gcc-14.3.0
powerpc64             randconfig-001-20260111    clang-22
powerpc64             randconfig-002-20260110    gcc-14.3.0
powerpc64             randconfig-002-20260111    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260110    gcc-15.2.0
riscv                 randconfig-001-20260111    gcc-11.5.0
riscv                 randconfig-002-20260110    gcc-15.2.0
riscv                 randconfig-002-20260111    gcc-11.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260110    gcc-15.2.0
s390                  randconfig-001-20260111    gcc-11.5.0
s390                  randconfig-002-20260110    gcc-15.2.0
s390                  randconfig-002-20260111    gcc-11.5.0
s390                       zfcpdump_defconfig    gcc-15.2.0
sh                               alldefconfig    clang-22
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                        edosk7760_defconfig    gcc-15.2.0
sh                            hp6xx_defconfig    gcc-15.2.0
sh                          landisk_defconfig    clang-22
sh                          r7780mp_defconfig    clang-22
sh                    randconfig-001-20260110    gcc-15.2.0
sh                    randconfig-001-20260111    gcc-11.5.0
sh                    randconfig-002-20260110    gcc-15.2.0
sh                    randconfig-002-20260111    gcc-11.5.0
sh                          rsk7203_defconfig    gcc-15.2.0
sh                      rts7751r2d1_defconfig    gcc-15.2.0
sh                           se7343_defconfig    clang-22
sh                   secureedge5410_defconfig    gcc-15.2.0
sh                        sh7785lcr_defconfig    gcc-15.2.0
sh                          urquell_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260110    clang-22
sparc                 randconfig-001-20260111    gcc-8.5.0
sparc                 randconfig-002-20260110    clang-22
sparc                 randconfig-002-20260111    gcc-8.5.0
sparc64                          alldefconfig    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260110    clang-22
sparc64               randconfig-001-20260111    gcc-8.5.0
sparc64               randconfig-002-20260110    clang-22
sparc64               randconfig-002-20260111    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260110    clang-22
um                    randconfig-001-20260111    gcc-8.5.0
um                    randconfig-002-20260110    clang-22
um                    randconfig-002-20260111    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260110    gcc-14
x86_64      buildonly-randconfig-001-20260111    clang-20
x86_64      buildonly-randconfig-002-20260110    clang-20
x86_64      buildonly-randconfig-002-20260110    gcc-14
x86_64      buildonly-randconfig-002-20260111    clang-20
x86_64      buildonly-randconfig-003-20260110    clang-20
x86_64      buildonly-randconfig-003-20260110    gcc-14
x86_64      buildonly-randconfig-003-20260111    clang-20
x86_64      buildonly-randconfig-004-20260110    gcc-14
x86_64      buildonly-randconfig-004-20260111    clang-20
x86_64      buildonly-randconfig-005-20260110    gcc-14
x86_64      buildonly-randconfig-005-20260111    clang-20
x86_64      buildonly-randconfig-006-20260110    gcc-14
x86_64      buildonly-randconfig-006-20260111    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260110    clang-20
x86_64                randconfig-001-20260111    gcc-12
x86_64                randconfig-002-20260110    clang-20
x86_64                randconfig-002-20260110    gcc-14
x86_64                randconfig-002-20260111    gcc-12
x86_64                randconfig-003-20260110    clang-20
x86_64                randconfig-003-20260111    gcc-12
x86_64                randconfig-004-20260110    clang-20
x86_64                randconfig-004-20260111    gcc-12
x86_64                randconfig-005-20260110    clang-20
x86_64                randconfig-005-20260110    gcc-14
x86_64                randconfig-005-20260111    gcc-12
x86_64                randconfig-006-20260110    clang-20
x86_64                randconfig-006-20260111    gcc-12
x86_64                randconfig-011-20260110    clang-20
x86_64                randconfig-011-20260111    clang-20
x86_64                randconfig-012-20260110    clang-20
x86_64                randconfig-012-20260110    gcc-14
x86_64                randconfig-012-20260111    clang-20
x86_64                randconfig-013-20260110    clang-20
x86_64                randconfig-013-20260110    gcc-14
x86_64                randconfig-013-20260111    clang-20
x86_64                randconfig-014-20260110    clang-20
x86_64                randconfig-014-20260111    clang-20
x86_64                randconfig-015-20260110    clang-20
x86_64                randconfig-015-20260110    gcc-14
x86_64                randconfig-015-20260111    clang-20
x86_64                randconfig-016-20260110    clang-20
x86_64                randconfig-016-20260111    clang-20
x86_64                randconfig-071-20260110    clang-20
x86_64                randconfig-071-20260111    gcc-14
x86_64                randconfig-072-20260110    clang-20
x86_64                randconfig-072-20260111    gcc-14
x86_64                randconfig-073-20260110    clang-20
x86_64                randconfig-073-20260111    gcc-14
x86_64                randconfig-074-20260110    clang-20
x86_64                randconfig-074-20260111    gcc-14
x86_64                randconfig-075-20260110    clang-20
x86_64                randconfig-075-20260111    gcc-14
x86_64                randconfig-076-20260110    clang-20
x86_64                randconfig-076-20260111    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                       common_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260110    clang-22
xtensa                randconfig-001-20260111    gcc-8.5.0
xtensa                randconfig-002-20260110    clang-22
xtensa                randconfig-002-20260111    gcc-8.5.0
xtensa                    smp_lx200_defconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

