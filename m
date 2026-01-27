Return-Path: <linuxppc-dev+bounces-16295-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMLvCisWeGkynwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16295-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 02:34:35 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8448EC12
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 02:34:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0Scj2GN1z2xjP;
	Tue, 27 Jan 2026 12:34:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769477669;
	cv=none; b=BMXLQ1ykLqdtGUW7b64lhez3nlNCQhqUxaHDOPWrT+sSQO88G4BDpH3VLhA7oFQ+6GtmyY8MxX3KNe5jB64vSo5WW7aI57srDuKcu1QKSN4i/gVoGAoJaDd4uJYOj22QblCiu8F9QPHFPkTcUup4mWqNh9luXFjsAGM6FuH0lFtB51FKQ1KcgdVV/hCe1+5BUryHj7poeziucopO5KZulsoiPMIASEnsU4V3LSHL5eMaqlcXrkCgQGGfBD8fzLD6a6fwJkINVHiHJGwiTfGhuOjpEn/iazflGKAVVlsmu0lK54eaIwEMNrF50QeVZSylQTayNElEntjkBTD6drqxnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769477669; c=relaxed/relaxed;
	bh=T/Y+jtduhwEG9xxPeIhE/4aePKJAQz4uDDjbl4101C4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NFItxWweh2exh5JlMmfiSjBSArCiCG2y6Y/YxdTEhtxw2sxEHV6rdj1YWw9XxJfPAdW0E9rwG4U8vzd6i+3pR2PsnXGOaEzktAM/xSzIsbukXr7h5upMQawrSn7G1oOSjX19u2OfAlsVpCk5P6hDMwEtlsRTPTByJPs16zC5JAmLLXMVhhtOkTnkRWpsWyVWYhDR3h+0G6F09OaJNRj55jjI9xkvtP25TOPd9lR7zlU5KGXjq9c1yIrHiA3n3amPZkeGycrMYWcTjoQRbaraOKMzdmUyPlF/FFvuy8akafGCbbn9+IVpCRn3AdLSfkRH0fznfaF6eMyKcLyjOEn7eg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SG3mkjdG; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SG3mkjdG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0Scf4FbPz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 12:34:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769477667; x=1801013667;
  h=date:from:to:cc:subject:message-id;
  bh=t/6jNvhxOwlEUL46eD83sehrSYitMoEeX/2nwOexdlQ=;
  b=SG3mkjdG/qYRV3o4zG7kjl2P3lwuqAqVYgniIX1WjaXKZBhi/yEZRrjf
   G7lAECYe+7fXW+QcNsDxV1zRzHKfo1RAgMk68YBdUO8AlQcjUqpJiB1aa
   7H4mVpwNfeXXyuE2SKnpnvyI/rBd9YJNb3igs74z8BcdizB5mMNNLDwXS
   Ez0Z2AUu4fL3xirvbJAIpfPPhxMckdXWHm1O4/0aS5UbklqVmcz2r0YK9
   caJf38UqWlYN2AqJ2j0QbcrtwK018UGM82zZhzGjnJyMhod7+A4FcWwMV
   PLIzTaB3sUDXRRQBl91zZIb+eCn6C7UQ00AMol8zhytAjk7aCTkw0WUuB
   Q==;
X-CSE-ConnectionGUID: eTa6Q2fnQBOt+pJZj1/g7A==
X-CSE-MsgGUID: 1YBi2HNtRFqj3bDgOUEbAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="88240368"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="88240368"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 17:34:20 -0800
X-CSE-ConnectionGUID: 8QDdyH6NTqGHugz8PssWag==
X-CSE-MsgGUID: RrdW02m3TcW6IHPkg8Io9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207856025"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Jan 2026 17:34:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkXyB-00000000Xqc-3JlT;
	Tue, 27 Jan 2026 01:34:15 +0000
Date: Tue, 27 Jan 2026 09:33:48 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next-test] BUILD SUCCESS
 1790f2f2939716be454170508d595758121894df
Message-ID: <202601270943.wfJVTrf9-lkp@intel.com>
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16295-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 6E8448EC12
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 1790f2f2939716be454170508d595758121894df  powerpc: Fix kuap warnings on lazy/full preemption with tracing

elapsed time: 880m

configs tested: 281
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                     haps_hs_smp_defconfig    clang-22
arc                   randconfig-001-20260126    gcc-10.5.0
arc                   randconfig-001-20260127    gcc-14.3.0
arc                   randconfig-002-20260126    gcc-10.5.0
arc                   randconfig-002-20260127    gcc-14.3.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                         axm55xx_defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260126    gcc-10.5.0
arm                   randconfig-001-20260127    gcc-14.3.0
arm                   randconfig-002-20260126    gcc-10.5.0
arm                   randconfig-002-20260127    gcc-14.3.0
arm                   randconfig-003-20260126    gcc-10.5.0
arm                   randconfig-003-20260127    gcc-14.3.0
arm                   randconfig-004-20260126    gcc-10.5.0
arm                   randconfig-004-20260127    gcc-14.3.0
arm                           spitz_defconfig    clang-22
arm                           u8500_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260126    gcc-15.2.0
arm64                 randconfig-001-20260127    gcc-15.2.0
arm64                 randconfig-002-20260126    gcc-15.2.0
arm64                 randconfig-002-20260127    gcc-15.2.0
arm64                 randconfig-003-20260126    gcc-15.2.0
arm64                 randconfig-003-20260127    gcc-15.2.0
arm64                 randconfig-004-20260126    gcc-15.2.0
arm64                 randconfig-004-20260127    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260126    gcc-15.2.0
csky                  randconfig-001-20260127    gcc-15.2.0
csky                  randconfig-002-20260126    gcc-15.2.0
csky                  randconfig-002-20260127    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260126    gcc-15.2.0
hexagon               randconfig-001-20260127    gcc-15.2.0
hexagon               randconfig-002-20260126    gcc-15.2.0
hexagon               randconfig-002-20260127    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260126    clang-20
i386        buildonly-randconfig-001-20260127    gcc-14
i386        buildonly-randconfig-002-20260126    clang-20
i386        buildonly-randconfig-002-20260127    gcc-14
i386        buildonly-randconfig-003-20260126    clang-20
i386        buildonly-randconfig-003-20260127    gcc-14
i386        buildonly-randconfig-004-20260126    clang-20
i386        buildonly-randconfig-004-20260127    gcc-14
i386        buildonly-randconfig-005-20260126    clang-20
i386        buildonly-randconfig-005-20260127    gcc-14
i386        buildonly-randconfig-006-20260126    clang-20
i386        buildonly-randconfig-006-20260127    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260126    clang-20
i386                  randconfig-001-20260126    gcc-14
i386                  randconfig-002-20260126    clang-20
i386                  randconfig-002-20260126    gcc-14
i386                  randconfig-003-20260126    clang-20
i386                  randconfig-003-20260126    gcc-14
i386                  randconfig-004-20260126    clang-20
i386                  randconfig-004-20260126    gcc-14
i386                  randconfig-005-20260126    clang-20
i386                  randconfig-005-20260126    gcc-14
i386                  randconfig-006-20260126    clang-20
i386                  randconfig-007-20260126    clang-20
i386                  randconfig-007-20260126    gcc-14
i386                  randconfig-011-20260126    clang-20
i386                  randconfig-011-20260127    gcc-14
i386                  randconfig-012-20260126    clang-20
i386                  randconfig-012-20260127    gcc-14
i386                  randconfig-013-20260126    clang-20
i386                  randconfig-013-20260127    gcc-14
i386                  randconfig-014-20260126    clang-20
i386                  randconfig-014-20260127    gcc-14
i386                  randconfig-015-20260126    clang-20
i386                  randconfig-015-20260127    gcc-14
i386                  randconfig-016-20260126    clang-20
i386                  randconfig-016-20260127    gcc-14
i386                  randconfig-017-20260126    clang-20
i386                  randconfig-017-20260127    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260126    gcc-15.2.0
loongarch             randconfig-001-20260127    gcc-15.2.0
loongarch             randconfig-002-20260126    gcc-15.2.0
loongarch             randconfig-002-20260127    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                       bvme6000_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           ip22_defconfig    gcc-15.2.0
mips                       lemote2f_defconfig    clang-22
mips                      maltaaprp_defconfig    clang-22
mips                    maltaup_xpa_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260126    gcc-15.2.0
nios2                 randconfig-001-20260127    gcc-15.2.0
nios2                 randconfig-002-20260126    gcc-15.2.0
nios2                 randconfig-002-20260127    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                generic-32bit_defconfig    clang-22
parisc                randconfig-001-20260126    gcc-8.5.0
parisc                randconfig-001-20260127    gcc-11.5.0
parisc                randconfig-002-20260126    gcc-8.5.0
parisc                randconfig-002-20260127    gcc-11.5.0
parisc64                         alldefconfig    gcc-15.2.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                      pcm030_defconfig    gcc-15.2.0
powerpc                     powernv_defconfig    clang-22
powerpc                      ppc44x_defconfig    clang-22
powerpc               randconfig-001-20260126    gcc-8.5.0
powerpc               randconfig-001-20260127    gcc-11.5.0
powerpc               randconfig-002-20260126    gcc-8.5.0
powerpc               randconfig-002-20260127    gcc-11.5.0
powerpc                     tqm8540_defconfig    gcc-15.2.0
powerpc                     tqm8548_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260126    gcc-8.5.0
powerpc64             randconfig-001-20260127    gcc-11.5.0
powerpc64             randconfig-002-20260126    gcc-8.5.0
powerpc64             randconfig-002-20260127    gcc-11.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260126    gcc-9.5.0
riscv                 randconfig-001-20260127    clang-22
riscv                 randconfig-002-20260126    gcc-9.5.0
riscv                 randconfig-002-20260127    clang-22
riscv                 randconfig-002-20260127    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                          debug_defconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260126    gcc-9.5.0
s390                  randconfig-001-20260127    clang-22
s390                  randconfig-001-20260127    gcc-13.4.0
s390                  randconfig-002-20260126    gcc-9.5.0
s390                  randconfig-002-20260127    clang-22
s390                  randconfig-002-20260127    gcc-13.4.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                        edosk7760_defconfig    clang-22
sh                            migor_defconfig    gcc-15.2.0
sh                    randconfig-001-20260126    gcc-9.5.0
sh                    randconfig-001-20260127    clang-22
sh                    randconfig-001-20260127    gcc-13.4.0
sh                    randconfig-002-20260126    gcc-9.5.0
sh                    randconfig-002-20260127    clang-22
sh                    randconfig-002-20260127    gcc-13.4.0
sh                   rts7751r2dplus_defconfig    clang-22
sh                           se7724_defconfig    clang-22
sparc                            alldefconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260126    gcc-13.4.0
sparc                 randconfig-001-20260127    gcc-15.2.0
sparc                 randconfig-002-20260126    gcc-13.4.0
sparc                 randconfig-002-20260127    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260126    gcc-13.4.0
sparc64               randconfig-001-20260127    gcc-15.2.0
sparc64               randconfig-002-20260126    gcc-13.4.0
sparc64               randconfig-002-20260127    gcc-15.2.0
um                               alldefconfig    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260126    gcc-13.4.0
um                    randconfig-001-20260127    gcc-15.2.0
um                    randconfig-002-20260126    gcc-13.4.0
um                    randconfig-002-20260127    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260126    clang-20
x86_64      buildonly-randconfig-001-20260127    gcc-14
x86_64      buildonly-randconfig-002-20260126    clang-20
x86_64      buildonly-randconfig-002-20260127    gcc-14
x86_64      buildonly-randconfig-003-20260126    clang-20
x86_64      buildonly-randconfig-003-20260127    gcc-14
x86_64      buildonly-randconfig-004-20260126    clang-20
x86_64      buildonly-randconfig-004-20260127    gcc-14
x86_64      buildonly-randconfig-005-20260126    clang-20
x86_64      buildonly-randconfig-005-20260127    gcc-14
x86_64      buildonly-randconfig-006-20260126    clang-20
x86_64      buildonly-randconfig-006-20260127    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260126    gcc-14
x86_64                randconfig-001-20260127    clang-20
x86_64                randconfig-002-20260126    gcc-14
x86_64                randconfig-002-20260127    clang-20
x86_64                randconfig-003-20260126    gcc-14
x86_64                randconfig-003-20260127    clang-20
x86_64                randconfig-004-20260126    gcc-14
x86_64                randconfig-004-20260127    clang-20
x86_64                randconfig-005-20260126    gcc-14
x86_64                randconfig-005-20260127    clang-20
x86_64                randconfig-006-20260126    gcc-14
x86_64                randconfig-006-20260127    clang-20
x86_64                randconfig-011-20260126    gcc-14
x86_64                randconfig-011-20260127    clang-20
x86_64                randconfig-012-20260126    gcc-14
x86_64                randconfig-012-20260127    clang-20
x86_64                randconfig-013-20260126    gcc-14
x86_64                randconfig-013-20260127    clang-20
x86_64                randconfig-014-20260126    gcc-14
x86_64                randconfig-014-20260127    clang-20
x86_64                randconfig-015-20260126    gcc-14
x86_64                randconfig-015-20260127    clang-20
x86_64                randconfig-016-20260126    gcc-14
x86_64                randconfig-016-20260127    clang-20
x86_64                randconfig-071-20260126    gcc-14
x86_64                randconfig-071-20260127    gcc-14
x86_64                randconfig-072-20260126    gcc-14
x86_64                randconfig-072-20260127    gcc-14
x86_64                randconfig-073-20260126    gcc-14
x86_64                randconfig-073-20260127    gcc-14
x86_64                randconfig-074-20260126    gcc-14
x86_64                randconfig-074-20260127    gcc-14
x86_64                randconfig-075-20260126    gcc-14
x86_64                randconfig-075-20260127    gcc-14
x86_64                randconfig-076-20260126    gcc-14
x86_64                randconfig-076-20260127    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                  audio_kc705_defconfig    gcc-15.2.0
xtensa                       common_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260126    gcc-13.4.0
xtensa                randconfig-001-20260127    gcc-15.2.0
xtensa                randconfig-002-20260126    gcc-13.4.0
xtensa                randconfig-002-20260127    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

