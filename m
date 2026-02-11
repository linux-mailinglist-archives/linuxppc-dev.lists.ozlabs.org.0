Return-Path: <linuxppc-dev+bounces-16812-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOT6GhqtjGl/sAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16812-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 17:23:54 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8806F126139
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 17:23:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fB3dx5YFPz2yFc;
	Thu, 12 Feb 2026 03:23:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770827029;
	cv=none; b=XFISkiH2bof7VojJ+RUvw2JGqNLicCNPd+TNqyQNi8wACf6Eu+9q+aD2M9yLbH90T8GHxUg8iMneaCnVlMlDbT7GaSnQGIu3zVSOFjiZBzffLDETYwgXrnnyDJ5XA37gmezQs44AdhpVYxmCPMp0lnqFidYd2IGzIjXLTJYiZjwrF4wUmn5zxQaBnSGd3cXIyC+X1GbR7dFPIpPR/Oygp1WFJhRtXoqiz0ccwNWjN88mZjwIy6Xh9PpqOnRZrDFsSrY6Alrv+F4iOsPlX25Zt3q068MGluOvWsvFZ2dzj/IHfyd3rOfSPZd1rnqxU68wH/VJDgxPAljbNoKbFcawBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770827029; c=relaxed/relaxed;
	bh=tv615uGHABABhEhZMSI+yWmdpl7ZGoVDuF0uTYD1duk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y9B4U/5z5ilqMqS0IWfbt/oJiSI2HDSEIVBRwiR5CZKDZLGxTFsBAPFI19EEolidS/uleEPQQofgHE9hxUeCQ5jqaSPgw+s5/eSvn/oWlxNvGoQjilX6R4HOOTNRkrj7QLdX+4gG5yvgo31D0JTx0byQ1CdDgHQv5fn/469vQPxK485cwlzTuqQT5s7LoMq+cpPXPaNUG3uzPtXso94CoSAllIH2O9Vf+1YTMKv4KVbp2VZR8T/0gYMAGnMsT6aX1u1EqdZzmi9OUCxwjsDAzb4uuG9E4UdAz6WpS0O9+zuzTnXZq+CaYIqODh9N6l8jOnQOjoFmyetFF6zlBxoO1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BVxa50M0; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BVxa50M0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fB3dt4dlrz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Feb 2026 03:23:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770827027; x=1802363027;
  h=date:from:to:cc:subject:message-id;
  bh=a2Ed6bH2OyNNN23LghAhrs4rzkldKlcIAjVvdhbyoDg=;
  b=BVxa50M0MhLjKNikKsMQV9q859cSGK1Pf65oSMetpi5penZwzU6eXPg0
   2da6BTpfojB3XGnd2cSSPKJ/l6IUMcSoO1d80OvYfaYNDWr1e9ENHzaEm
   4+TGbOhJCgAT2wBWrZvDl3M2ugU+coN9i6d+2qOLdXFdto5lXHlKrINdb
   S62QBipFCc4QPvSyX27SqNLqQvDgOzvJaH3RPkv2rJ7vQ9jSPAL3ibk1D
   BBT312Ec7KtaMSWPrb+JZCK5P/lMrwcAlqWU9z/RM5CHBrAxxsTPBihOp
   DBZ7QnxcH7aybsXHgNjdampc5If+1DNdd5NHxIg1rShVJzZvKMb2slPYl
   w==;
X-CSE-ConnectionGUID: 9zXkByv3Qym0EcIx/lIfYQ==
X-CSE-MsgGUID: P0IxC+2fQZ2ZnvyQznGjdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89569473"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="89569473"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 08:23:39 -0800
X-CSE-ConnectionGUID: odadMh9PSe6P7wNtFcjUIA==
X-CSE-MsgGUID: dgEunkNsSQGKiB/pUyGj7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="211656388"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Feb 2026 08:23:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqD04-00000000q9E-0qmR;
	Wed, 11 Feb 2026 16:23:36 +0000
Date: Thu, 12 Feb 2026 00:22:43 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next] BUILD SUCCESS
 e2071f9ce42b6985a40feaf98d2f5f7ce0fca006
Message-ID: <202602120035.n8shTdqv-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16812-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 8806F126139
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: e2071f9ce42b6985a40feaf98d2f5f7ce0fca006  powerpc/pseries: plpks: export plpks_wrapping_is_supported

elapsed time: 829m

configs tested: 220
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260211    gcc-8.5.0
arc                   randconfig-001-20260211    gcc-9.5.0
arc                   randconfig-002-20260211    gcc-8.5.0
arc                   randconfig-002-20260211    gcc-9.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                            hisi_defconfig    gcc-15.2.0
arm                       multi_v4t_defconfig    gcc-15.2.0
arm                   randconfig-001-20260211    gcc-10.5.0
arm                   randconfig-001-20260211    gcc-8.5.0
arm                   randconfig-002-20260211    gcc-8.5.0
arm                   randconfig-003-20260211    clang-22
arm                   randconfig-003-20260211    gcc-8.5.0
arm                   randconfig-004-20260211    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260211    gcc-15.2.0
arm64                 randconfig-002-20260211    gcc-15.2.0
arm64                 randconfig-003-20260211    gcc-15.2.0
arm64                 randconfig-004-20260211    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260211    gcc-15.2.0
csky                  randconfig-002-20260211    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260211    clang-22
hexagon               randconfig-002-20260211    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260211    clang-20
i386        buildonly-randconfig-002-20260211    clang-20
i386        buildonly-randconfig-003-20260211    clang-20
i386        buildonly-randconfig-004-20260211    clang-20
i386        buildonly-randconfig-005-20260211    clang-20
i386        buildonly-randconfig-006-20260211    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260211    gcc-14
i386                  randconfig-002-20260211    gcc-14
i386                  randconfig-003-20260211    gcc-14
i386                  randconfig-004-20260211    gcc-14
i386                  randconfig-005-20260211    gcc-14
i386                  randconfig-006-20260211    gcc-14
i386                  randconfig-007-20260211    gcc-14
i386                  randconfig-011-20260211    clang-20
i386                  randconfig-012-20260211    clang-20
i386                  randconfig-013-20260211    clang-20
i386                  randconfig-014-20260211    clang-20
i386                  randconfig-015-20260211    clang-20
i386                  randconfig-016-20260211    clang-20
i386                  randconfig-017-20260211    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260211    clang-22
loongarch             randconfig-002-20260211    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                          atari_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                        m5307c3_defconfig    gcc-15.2.0
m68k                            mac_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                      mmu_defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                  cavium_octeon_defconfig    gcc-15.2.0
mips                        maltaup_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260211    clang-22
nios2                 randconfig-002-20260211    clang-22
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                randconfig-001-20260211    clang-22
parisc                randconfig-001-20260211    gcc-14.3.0
parisc                randconfig-002-20260211    clang-22
parisc                randconfig-002-20260211    gcc-15.2.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                        icon_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260211    clang-16
powerpc               randconfig-001-20260211    clang-22
powerpc               randconfig-002-20260211    clang-22
powerpc64             randconfig-001-20260211    clang-17
powerpc64             randconfig-001-20260211    clang-22
powerpc64             randconfig-002-20260211    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20260211    gcc-13.4.0
riscv                 randconfig-002-20260211    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                  randconfig-001-20260211    gcc-13.4.0
s390                  randconfig-002-20260211    gcc-13.4.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                         ecovec24_defconfig    gcc-15.2.0
sh                 kfr2r09-romimage_defconfig    gcc-15.2.0
sh                    randconfig-001-20260211    gcc-13.4.0
sh                    randconfig-002-20260211    gcc-13.4.0
sh                          rsk7264_defconfig    gcc-15.2.0
sh                   rts7751r2dplus_defconfig    gcc-15.2.0
sh                        sh7757lcr_defconfig    gcc-15.2.0
sh                             shx3_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                 randconfig-001-20260211    gcc-13.4.0
sparc                 randconfig-002-20260211    gcc-13.4.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260211    gcc-13.4.0
sparc64               randconfig-002-20260211    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260211    gcc-13.4.0
um                    randconfig-002-20260211    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260211    gcc-12
x86_64      buildonly-randconfig-002-20260211    gcc-12
x86_64      buildonly-randconfig-003-20260211    gcc-12
x86_64      buildonly-randconfig-004-20260211    gcc-12
x86_64      buildonly-randconfig-005-20260211    gcc-12
x86_64      buildonly-randconfig-006-20260211    gcc-12
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260211    clang-20
x86_64                randconfig-002-20260211    clang-20
x86_64                randconfig-003-20260211    clang-20
x86_64                randconfig-004-20260211    clang-20
x86_64                randconfig-005-20260211    clang-20
x86_64                randconfig-006-20260211    clang-20
x86_64                randconfig-011-20260211    gcc-14
x86_64                randconfig-012-20260211    gcc-14
x86_64                randconfig-013-20260211    gcc-12
x86_64                randconfig-013-20260211    gcc-14
x86_64                randconfig-014-20260211    clang-20
x86_64                randconfig-014-20260211    gcc-14
x86_64                randconfig-015-20260211    gcc-14
x86_64                randconfig-016-20260211    gcc-14
x86_64                randconfig-071-20260211    clang-20
x86_64                randconfig-071-20260211    gcc-14
x86_64                randconfig-072-20260211    clang-20
x86_64                randconfig-073-20260211    clang-20
x86_64                randconfig-073-20260211    gcc-14
x86_64                randconfig-074-20260211    clang-20
x86_64                randconfig-075-20260211    clang-20
x86_64                randconfig-075-20260211    gcc-14
x86_64                randconfig-076-20260211    clang-20
x86_64                randconfig-076-20260211    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260211    gcc-13.4.0
xtensa                randconfig-002-20260211    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

