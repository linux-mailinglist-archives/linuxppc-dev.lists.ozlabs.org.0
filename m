Return-Path: <linuxppc-dev+bounces-5554-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CB2A1BFDF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2025 01:36:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yfwhs3Zlbz2ytQ;
	Sat, 25 Jan 2025 11:36:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737765373;
	cv=none; b=OHGs9eJg06cq3oSn2So56JdXldNeZ792QL/k4Qhn6kL7vzcPDpDLBw2oZJtxhCVU37F5WyAnHROp2KDZwnog47Ns7ibG4oK+aPRfQ5kSMB1D1p1Eb/OXUW5LWWBgRGRoIySuj0JjmSffuEq6HgLfjkpvhRyUpd6Ggq47nYZe2gkyPZMzxDLvPYVI4STkHlwqDOJn2FKqlzJqafiGMQ+XujL16vPI+GCFCrXdARrB7BtUABBS98nW0dl+erl68yhju5i4b4upvy2ItOWSTXdfRVyTiz8PA/g2Xey9ZxPlE3k42ZhfV2u4fIopshhNyr6+3/ISN97R/VeHYxBiT3m8ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737765373; c=relaxed/relaxed;
	bh=nG99io+ek6XriclHDN3apOWOO4X88VArHephxohRvYA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NeprIdMnTznZhl7QsO9x4wpu7Y4eXjMGxYAMhVgSW3l5htGZea+QHRNjxgGOPQSezcJ9128Uxz7eVzl4zpX1un4IiNVhW3dat3pefme2+/DWKsiASjsmAWW1L6k/KRPkBNjix3x8Oqw2YBOziUPTQ+XG5VdmpsFe9In4f8dfkGrtO0oNOjmLfMqPPNoBxPCaaLOUxftDEDnUzEXuk1CoVP/kI0lLMPIfVJq96W7Bv19twkRK1qTtbI8ETWZbJ3wWFGv8Ft1cVdhiM2PG7cNpimfPwhjGv709iNPHUTwwmIdiIQ6oAPnaGQps2a1zZ7zli45GjsDziw5pq56tLdbAVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KDCqD0P4; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KDCqD0P4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yfwhp6pgbz2ymg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jan 2025 11:36:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737765371; x=1769301371;
  h=date:from:to:cc:subject:message-id;
  bh=7sDKd3DTbCIFORrXPamAW+BQ25RfJk4Fkwo1yyLTEow=;
  b=KDCqD0P4QaxjaZaZUBDkQlhNjbnC1svj6NVl3QuvcFhF1CFnwP8vnmRq
   nt+swjXXY6RqeOe0etK/DGIwI1fPptnj4yIixoa+RTbhaa1pFqBwEMomb
   XBAU+zi4Z0w2ivOznRemI7fVJlXGc9w9Fltl1CsA1YKrSRw6F8yIEqoz8
   PN5/wJADoDz4x7m+s0jBpOIQQvLhWtEI5TX82bR8zm0f7IKaD8nJBBCks
   rBAVg0ql3eKlzSxYuU2qwM/ddLdJj0IIJN1VjYscZm9/h+5FJdgmElQyW
   SQK/W8QjPGTnIeTFUxK4oTj5iuzFMCqs84nR/ss2Iimc0FWg61bUZvr5C
   A==;
X-CSE-ConnectionGUID: TAPrwm+oT0yqlF26EcND8g==
X-CSE-MsgGUID: fnJTmAUiRnu+WkQZS3ucqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="41977095"
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="41977095"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 16:36:07 -0800
X-CSE-ConnectionGUID: Hcf4EyiPQzGvYDc+Wk+Uyw==
X-CSE-MsgGUID: FoV4LaDLQ7egETRJCG/V5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="108506908"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Jan 2025 16:35:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbU9N-000dJ9-1w;
	Sat, 25 Jan 2025 00:35:49 +0000
Date: Sat, 25 Jan 2025 08:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next] BUILD SUCCESS
 17391cb2613b82f8c405570fea605af3255ff8d2
Message-ID: <202501250812.rMlSd2Ui-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 17391cb2613b82f8c405570fea605af3255ff8d2  powerpc/pseries/iommu: Don't unset window if it was never set

elapsed time: 1173m

configs tested: 252
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              alldefconfig    gcc-13.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                        nsim_700_defconfig    gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-13.2.0
arc                   randconfig-001-20250124    gcc-13.2.0
arc                   randconfig-001-20250125    gcc-13.2.0
arc                   randconfig-002-20250124    gcc-13.2.0
arc                   randconfig-002-20250125    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-20
arm                                 defconfig    gcc-14.2.0
arm                          ep93xx_defconfig    gcc-14.2.0
arm                   randconfig-001-20250124    clang-17
arm                   randconfig-001-20250125    gcc-14.2.0
arm                   randconfig-002-20250124    gcc-14.2.0
arm                   randconfig-002-20250125    gcc-14.2.0
arm                   randconfig-003-20250124    gcc-14.2.0
arm                   randconfig-003-20250125    clang-18
arm                   randconfig-004-20250124    clang-19
arm                   randconfig-004-20250125    clang-20
arm                          sp7021_defconfig    gcc-14.2.0
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250124    clang-20
arm64                 randconfig-001-20250125    gcc-14.2.0
arm64                 randconfig-002-20250124    clang-20
arm64                 randconfig-002-20250125    gcc-14.2.0
arm64                 randconfig-003-20250124    clang-19
arm64                 randconfig-003-20250125    gcc-14.2.0
arm64                 randconfig-004-20250124    clang-20
arm64                 randconfig-004-20250125    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250124    gcc-14.2.0
csky                  randconfig-001-20250125    gcc-14.2.0
csky                  randconfig-002-20250124    gcc-14.2.0
csky                  randconfig-002-20250125    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250124    clang-20
hexagon               randconfig-001-20250125    clang-20
hexagon               randconfig-001-20250125    gcc-14.2.0
hexagon               randconfig-002-20250124    clang-14
hexagon               randconfig-002-20250125    clang-20
hexagon               randconfig-002-20250125    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250124    clang-19
i386        buildonly-randconfig-002-20250124    clang-19
i386        buildonly-randconfig-003-20250124    gcc-12
i386        buildonly-randconfig-004-20250124    gcc-12
i386        buildonly-randconfig-005-20250124    gcc-12
i386        buildonly-randconfig-006-20250124    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250125    clang-19
i386                  randconfig-002-20250125    clang-19
i386                  randconfig-003-20250125    clang-19
i386                  randconfig-004-20250125    clang-19
i386                  randconfig-005-20250125    clang-19
i386                  randconfig-006-20250125    clang-19
i386                  randconfig-007-20250125    clang-19
i386                  randconfig-011-20250125    gcc-12
i386                  randconfig-012-20250125    gcc-12
i386                  randconfig-013-20250125    gcc-12
i386                  randconfig-014-20250125    gcc-12
i386                  randconfig-015-20250125    gcc-12
i386                  randconfig-016-20250125    gcc-12
i386                  randconfig-017-20250125    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250124    gcc-14.2.0
loongarch             randconfig-001-20250125    gcc-14.2.0
loongarch             randconfig-002-20250124    gcc-14.2.0
loongarch             randconfig-002-20250125    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                  cavium_octeon_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250124    gcc-14.2.0
nios2                 randconfig-001-20250125    gcc-14.2.0
nios2                 randconfig-002-20250124    gcc-14.2.0
nios2                 randconfig-002-20250125    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250124    gcc-14.2.0
parisc                randconfig-001-20250125    gcc-14.2.0
parisc                randconfig-002-20250124    gcc-14.2.0
parisc                randconfig-002-20250125    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    gamecube_defconfig    gcc-14.2.0
powerpc                 mpc8315_rdb_defconfig    clang-20
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250124    gcc-14.2.0
powerpc               randconfig-001-20250125    clang-18
powerpc               randconfig-001-20250125    gcc-14.2.0
powerpc               randconfig-002-20250124    gcc-14.2.0
powerpc               randconfig-002-20250125    gcc-14.2.0
powerpc               randconfig-003-20250124    clang-20
powerpc               randconfig-003-20250125    gcc-14.2.0
powerpc                     redwood_defconfig    gcc-14.2.0
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc                      tqm8xx_defconfig    clang-20
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250124    gcc-14.2.0
powerpc64             randconfig-001-20250125    gcc-14.2.0
powerpc64             randconfig-002-20250124    clang-20
powerpc64             randconfig-002-20250125    clang-20
powerpc64             randconfig-002-20250125    gcc-14.2.0
powerpc64             randconfig-003-20250124    clang-19
powerpc64             randconfig-003-20250125    clang-16
powerpc64             randconfig-003-20250125    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250124    clang-19
riscv                 randconfig-001-20250125    gcc-14.2.0
riscv                 randconfig-002-20250124    gcc-14.2.0
riscv                 randconfig-002-20250125    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250124    gcc-14.2.0
s390                  randconfig-001-20250125    clang-19
s390                  randconfig-001-20250125    gcc-14.2.0
s390                  randconfig-002-20250124    clang-20
s390                  randconfig-002-20250125    clang-20
s390                  randconfig-002-20250125    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250124    gcc-14.2.0
sh                    randconfig-001-20250125    gcc-14.2.0
sh                    randconfig-002-20250124    gcc-14.2.0
sh                    randconfig-002-20250125    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sh                           se7751_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sh                            titan_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250124    gcc-14.2.0
sparc                 randconfig-001-20250125    gcc-14.2.0
sparc                 randconfig-002-20250124    gcc-14.2.0
sparc                 randconfig-002-20250125    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250124    gcc-14.2.0
sparc64               randconfig-001-20250125    gcc-14.2.0
sparc64               randconfig-002-20250124    gcc-14.2.0
sparc64               randconfig-002-20250125    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250124    gcc-12
um                    randconfig-001-20250125    clang-20
um                    randconfig-001-20250125    gcc-14.2.0
um                    randconfig-002-20250124    clang-20
um                    randconfig-002-20250125    gcc-11
um                    randconfig-002-20250125    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250124    gcc-12
x86_64      buildonly-randconfig-001-20250125    clang-19
x86_64      buildonly-randconfig-002-20250124    gcc-12
x86_64      buildonly-randconfig-002-20250125    clang-19
x86_64      buildonly-randconfig-003-20250124    clang-19
x86_64      buildonly-randconfig-003-20250125    clang-19
x86_64      buildonly-randconfig-004-20250124    clang-19
x86_64      buildonly-randconfig-004-20250125    clang-19
x86_64      buildonly-randconfig-005-20250124    clang-19
x86_64      buildonly-randconfig-005-20250125    clang-19
x86_64      buildonly-randconfig-006-20250124    clang-19
x86_64      buildonly-randconfig-006-20250125    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250125    clang-19
x86_64                randconfig-002-20250125    clang-19
x86_64                randconfig-003-20250125    clang-19
x86_64                randconfig-004-20250125    clang-19
x86_64                randconfig-005-20250125    clang-19
x86_64                randconfig-006-20250125    clang-19
x86_64                randconfig-007-20250125    clang-19
x86_64                randconfig-008-20250125    clang-19
x86_64                randconfig-071-20250125    clang-19
x86_64                randconfig-072-20250125    clang-19
x86_64                randconfig-073-20250125    clang-19
x86_64                randconfig-074-20250125    clang-19
x86_64                randconfig-075-20250125    clang-19
x86_64                randconfig-076-20250125    clang-19
x86_64                randconfig-077-20250125    clang-19
x86_64                randconfig-078-20250125    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250124    gcc-14.2.0
xtensa                randconfig-001-20250125    gcc-14.2.0
xtensa                randconfig-002-20250124    gcc-14.2.0
xtensa                randconfig-002-20250125    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

