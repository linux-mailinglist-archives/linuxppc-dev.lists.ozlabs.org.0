Return-Path: <linuxppc-dev+bounces-16903-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA6QL0RylGnVDwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16903-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 14:51:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E1D14CBF9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 14:50:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFgym2f7hz3bf2;
	Wed, 18 Feb 2026 00:50:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771336256;
	cv=none; b=NXBV1q7MCWBUKcFQRD8SWKoeuLxyfgErQ8CG8abVcGOm/Ld9ZXXk422t5HkZwpQX0a8it4MGNy2ZGBhLM3k8OMMZIXV/lZr0FxLmmT/7NnlPaFNs9Aqkz+nLCQthOIEPmZxHoLfxQZzE27fvw2fTFuGLAVqup0LhByHzdnBVlFAx4Fzx78DlO0sLbYtPO2sbhAsTkfQvks1+QDw1Dgk9UWQdBsN+XpE4DD+q5laF0AqHAB5By2eKXELS7AyLZEbEbOCsIjnE2F5a/ktnGYBeN9qHdn8uMvHdUb4bopCknvZ0ey+gd2oKW52InVtD6Px+6HxK0ZyzFEbAEyBORTFisg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771336256; c=relaxed/relaxed;
	bh=rbDKRiAPpl7WVVymGIECM1ETWX5TMmw5ozgKLxXO+qY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y06qnc+QEgPDoLte6ha3Zle7T48SlZrJz4EDRu2pNXmKZxkzdJkRnizcuvNN1HvL8PPBx+PwbB+f1+JajrrMYJP9imO3UBuA+kEF362eKsrug67YhNRYm2KFZ9eFIk4gP/xHpnpipIp/ZNn4TmXFk+K2kwsnqsSff4cJTa+KpVAnm1wICnYV6qHyFdwkySHAu6UUhBH2ur8MAT74j46SZzgAezam5MNlIHikfZF4GrzGR0gMu6uN+VESO3xx2NQyk6zk+xfrPqES+cJQ7Mia1lke87PF9sou965Zj3w+LPz+BVmZ45dJ0Iwzrl6rOPyuovcaRyz2FmMs6vb6pjVeiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DMs8k6B2; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DMs8k6B2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFgyh5Z1qz30hq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Feb 2026 00:50:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771336253; x=1802872253;
  h=date:from:to:cc:subject:message-id;
  bh=usSLvRsgSDHbBsO+qhg6e5OqOtsXlwaNGgDETwI3z54=;
  b=DMs8k6B2Z9hznUz60ijvN6x6gHAsbE2LDlhwoIoDkX1n0EBPE364Hm/z
   4nFZnze5BoXmCjUzGqll2nTSU0GfKN6j+yQ6XnUIbIGG6SNYKtWTsS4Ob
   fXF28HeSDPg/UGJvw17cH5ukzVD7LrSmLe7OKNwWgToZgV/yy4lzWTkj5
   9q3aX5mfpuADhssC7/4wFgVJuWSsdNvRdrD4gjz8JaF0EGaNU6+MgvWyu
   N/YbECfWCT5bXTA69zImckSkd9GDQvU3oyKwm3cukmw1SYqOLqOsn08Tm
   BjyGA07E64YDwTvEACkIhwBcHOa+b2+b3+JlyryM3ubt32ThRQA8hmtfp
   A==;
X-CSE-ConnectionGUID: 42b6bxLCRxeaPG4RRY3ccg==
X-CSE-MsgGUID: fPXOK3ryS/KBJQCiL1oS+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="97863817"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="97863817"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 05:50:46 -0800
X-CSE-ConnectionGUID: LDTwN1UyTKiEBOwReRCwkQ==
X-CSE-MsgGUID: NWxfROWyQyy0HeJycaW/fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="244479501"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Feb 2026 05:50:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsLTO-00000001128-3Cyb;
	Tue, 17 Feb 2026 13:50:42 +0000
Date: Tue, 17 Feb 2026 21:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 e54c7282d708f761e62e5d94e7de1f7d58ce6fe2
Message-ID: <202602172144.Qj2lVbTi-lkp@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16903-lists,linuxppc-dev=lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 25E1D14CBF9
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: e54c7282d708f761e62e5d94e7de1f7d58ce6fe2  powerpc/ci: Add Ubuntu 24.04 builds of selftests

elapsed time: 755m

configs tested: 276
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                        nsimosci_defconfig    gcc-15.2.0
arc                   randconfig-001-20260217    gcc-11.5.0
arc                   randconfig-002-20260217    gcc-11.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                         at91_dt_defconfig    gcc-15.2.0
arm                         bcm2835_defconfig    gcc-15.2.0
arm                          collie_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          pxa3xx_defconfig    gcc-15.2.0
arm                   randconfig-001-20260217    gcc-11.5.0
arm                   randconfig-002-20260217    gcc-11.5.0
arm                   randconfig-003-20260217    gcc-11.5.0
arm                   randconfig-004-20260217    gcc-11.5.0
arm                           sama5_defconfig    gcc-15.2.0
arm                           sama7_defconfig    gcc-15.2.0
arm                        spear6xx_defconfig    gcc-15.2.0
arm                           spitz_defconfig    gcc-15.2.0
arm                           u8500_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260217    clang-23
arm64                 randconfig-001-20260217    gcc-9.5.0
arm64                 randconfig-002-20260217    clang-23
arm64                 randconfig-003-20260217    clang-23
arm64                 randconfig-003-20260217    gcc-8.5.0
arm64                 randconfig-004-20260217    clang-23
arm64                 randconfig-004-20260217    gcc-13.4.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260217    clang-23
csky                  randconfig-001-20260217    gcc-15.2.0
csky                  randconfig-002-20260217    clang-23
csky                  randconfig-002-20260217    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260217    clang-23
hexagon               randconfig-002-20260217    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260217    clang-20
i386        buildonly-randconfig-002-20260217    clang-20
i386        buildonly-randconfig-003-20260217    clang-20
i386        buildonly-randconfig-004-20260217    clang-20
i386        buildonly-randconfig-004-20260217    gcc-14
i386        buildonly-randconfig-005-20260217    clang-20
i386        buildonly-randconfig-006-20260217    clang-20
i386        buildonly-randconfig-006-20260217    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260217    gcc-14
i386                  randconfig-002-20260217    gcc-14
i386                  randconfig-003-20260217    clang-20
i386                  randconfig-003-20260217    gcc-14
i386                  randconfig-004-20260217    gcc-14
i386                  randconfig-005-20260217    gcc-14
i386                  randconfig-006-20260217    gcc-14
i386                  randconfig-007-20260217    clang-20
i386                  randconfig-007-20260217    gcc-14
i386                  randconfig-011-20260217    clang-20
i386                  randconfig-011-20260217    gcc-13
i386                  randconfig-012-20260217    clang-20
i386                  randconfig-013-20260217    clang-20
i386                  randconfig-014-20260217    clang-20
i386                  randconfig-015-20260217    clang-20
i386                  randconfig-016-20260217    clang-20
i386                  randconfig-016-20260217    gcc-14
i386                  randconfig-017-20260217    clang-20
i386                  randconfig-017-20260217    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260217    clang-23
loongarch             randconfig-002-20260217    clang-23
loongarch             randconfig-002-20260217    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
m68k                       m5249evb_defconfig    gcc-15.2.0
m68k                        mvme16x_defconfig    gcc-15.2.0
m68k                           virt_defconfig    gcc-15.2.0
microblaze                       alldefconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                  cavium_octeon_defconfig    gcc-15.2.0
mips                           ip28_defconfig    gcc-15.2.0
mips                     loongson2k_defconfig    gcc-15.2.0
mips                      malta_kvm_defconfig    gcc-15.2.0
mips                        omega2p_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260217    clang-23
nios2                 randconfig-001-20260217    gcc-11.5.0
nios2                 randconfig-002-20260217    clang-23
nios2                 randconfig-002-20260217    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                generic-64bit_defconfig    gcc-15.2.0
parisc                randconfig-001-20260217    clang-19
parisc                randconfig-002-20260217    clang-19
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                     akebono_defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      arches_defconfig    gcc-15.2.0
powerpc                   currituck_defconfig    gcc-15.2.0
powerpc                    ge_imp3a_defconfig    gcc-15.2.0
powerpc                      katmai_defconfig    gcc-15.2.0
powerpc                   lite5200b_defconfig    gcc-15.2.0
powerpc                  mpc885_ads_defconfig    gcc-15.2.0
powerpc                    mvme5100_defconfig    gcc-15.2.0
powerpc                      pmac32_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260217    clang-19
powerpc               randconfig-001-20260217    gcc-8.5.0
powerpc               randconfig-002-20260217    clang-19
powerpc                    sam440ep_defconfig    gcc-15.2.0
powerpc                 xes_mpc85xx_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260217    clang-19
powerpc64             randconfig-002-20260217    clang-19
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_k210_defconfig    gcc-15.2.0
riscv                 randconfig-001-20260217    gcc-10.5.0
riscv                 randconfig-002-20260217    gcc-10.5.0
riscv                 randconfig-002-20260217    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260217    clang-23
s390                  randconfig-001-20260217    gcc-10.5.0
s390                  randconfig-002-20260217    clang-23
s390                  randconfig-002-20260217    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                        edosk7705_defconfig    gcc-15.2.0
sh                    randconfig-001-20260217    gcc-10.5.0
sh                    randconfig-001-20260217    gcc-15.2.0
sh                    randconfig-002-20260217    gcc-10.5.0
sh                        sh7785lcr_defconfig    gcc-15.2.0
sh                             shx3_defconfig    gcc-15.2.0
sh                            titan_defconfig    gcc-15.2.0
sh                          urquell_defconfig    gcc-15.2.0
sparc                            alldefconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260217    gcc-12.5.0
sparc                 randconfig-001-20260217    gcc-8.5.0
sparc                 randconfig-002-20260217    gcc-12.5.0
sparc                 randconfig-002-20260217    gcc-15.2.0
sparc64                          alldefconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260217    clang-23
sparc64               randconfig-001-20260217    gcc-12.5.0
sparc64               randconfig-002-20260217    clang-20
sparc64               randconfig-002-20260217    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260217    gcc-12.5.0
um                    randconfig-001-20260217    gcc-14
um                    randconfig-002-20260217    gcc-12.5.0
um                    randconfig-002-20260217    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260217    clang-20
x86_64      buildonly-randconfig-001-20260217    gcc-14
x86_64      buildonly-randconfig-002-20260217    gcc-14
x86_64      buildonly-randconfig-003-20260217    clang-20
x86_64      buildonly-randconfig-003-20260217    gcc-14
x86_64      buildonly-randconfig-004-20260217    gcc-14
x86_64      buildonly-randconfig-005-20260217    gcc-14
x86_64      buildonly-randconfig-006-20260217    clang-20
x86_64      buildonly-randconfig-006-20260217    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260217    clang-20
x86_64                randconfig-002-20260217    clang-20
x86_64                randconfig-003-20260217    clang-20
x86_64                randconfig-003-20260217    gcc-14
x86_64                randconfig-004-20260217    clang-20
x86_64                randconfig-005-20260217    clang-20
x86_64                randconfig-006-20260217    clang-20
x86_64                randconfig-006-20260217    gcc-14
x86_64                randconfig-011-20260217    gcc-14
x86_64                randconfig-012-20260217    gcc-14
x86_64                randconfig-013-20260217    gcc-14
x86_64                randconfig-014-20260217    gcc-14
x86_64                randconfig-015-20260217    gcc-14
x86_64                randconfig-016-20260217    gcc-14
x86_64                randconfig-071-20260217    clang-20
x86_64                randconfig-071-20260217    gcc-14
x86_64                randconfig-072-20260217    clang-20
x86_64                randconfig-072-20260217    gcc-14
x86_64                randconfig-073-20260217    clang-20
x86_64                randconfig-073-20260217    gcc-14
x86_64                randconfig-074-20260217    gcc-14
x86_64                randconfig-075-20260217    clang-20
x86_64                randconfig-075-20260217    gcc-14
x86_64                randconfig-076-20260217    clang-20
x86_64                randconfig-076-20260217    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                generic_kc705_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260217    gcc-12.5.0
xtensa                randconfig-001-20260217    gcc-8.5.0
xtensa                randconfig-002-20260217    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

