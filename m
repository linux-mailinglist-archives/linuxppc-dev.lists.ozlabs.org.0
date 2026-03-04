Return-Path: <linuxppc-dev+bounces-17758-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO+dAxmvqGmfwQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17758-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 23:15:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5101208636
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 23:15:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fR6SN3vvQz3bfZ;
	Thu, 05 Mar 2026 09:15:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772662548;
	cv=none; b=SImvfIpcnW1fEov9tUx0FNL145WmgMkGvWxFezB6L/aCoSAsGFYx3XyBljl1Co6yplnNe9rsBHRZPo1NtWIXka99RYLqS5BPN2h8lgO1jsbYUzA81sHjfHNB+9AT3YNgyGbsNzYWSWGtdDZPZSVqMgqJNzVEgaV2FAQvTkgStGviKrk78f1iuDwxEgkTl6fev+9NFe3C+KOoSRaxrtE1RjA3ieAgxFi41DrA+rh0tkIZg1kdwlyKAEp+jT3dl6lFaN2l5EnNZVdy3RBRJ3UKC9pzp9fGQUwZDOZG+1sn27opxXHacxMxLaBiItq5VF8pu2T49esfcC3lVRKVTgHyjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772662548; c=relaxed/relaxed;
	bh=QNsY5JQ3kGXDjQ2u/1WL3xrYHraIMEF8z+obk6EkjkU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a8p1qbIvlGuu2yLHZI8DSwvyb2Euc2fp0YTfmxfU2lTwfuqqHVphhkZDmsbGFvB9bRpQX2GB6OBTv6ca+tEA1y9i1auhns5UgnD4GbUs4Rz56vCX2RRltkJm+xV2ccXfQ0PooZGVEKKtVnuAFQ16Xw38fKifv+WzTwy5givY8hOKdRx9vZh2HoeEP8Ya6vbTXbnGf7L6sn8e19lslzPrb37C1AFbOq67RgXfRVfvlIkFbOMXe5ornQLjWRZr4WG2R+tQzC1UXq2DmeSRe37RI+aYv5qEB4VbvFtFpP7PkF6O0UvNVpJNbT6U/R+IKYWdhBqWjXhLliNgpqPShGffrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fAn+J3yy; dkim-atps=neutral; spf=pass (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fAn+J3yy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fR6SK45Gnz30FF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 09:15:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772662546; x=1804198546;
  h=date:from:to:cc:subject:message-id;
  bh=8AnkBt3Im4Xlx3lSdecFP31DJ1+u500NvidhHc6+7cM=;
  b=fAn+J3yyZ5URmpJQxsFtwvO7QvpI4p8hf7LA7qW8MelCtY6w8mI6JdwE
   VIb8KEJvCiySV0yOPDwEzf7vjxKawWiC7vr8miUR4UaRpOTlZa01vT+4K
   nH6to1qhgTddi97gKyxYLDQ09+2ihe+ZP4pNi6akCOGYZZiCgtnLZe7X3
   x/+2SZjRPHLvhTiM+QbqOXRfbzYk/ZdHgBdmGSV6CPvxMI/EtCPRknKQT
   o4jX4K0cF1SEVr2p9hr8nNwknaYnv87uzNz7Ai9/C0N7EuCy0HBYhTPAJ
   0Oozacs7I89fhkgaUXnxJyihQa7nH2HMI4AJaid7eHdHyDo1SKOCZbxRt
   g==;
X-CSE-ConnectionGUID: hnbXnsGEQYWqrMagFv+dOA==
X-CSE-MsgGUID: /CzKzX0LQ9SzUEUvPyGZnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77611468"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="77611468"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 14:15:38 -0800
X-CSE-ConnectionGUID: 8gLOFKi/ROi5kDejtdrVbg==
X-CSE-MsgGUID: B963C104RoyRkkDXOCJpKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="218462749"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Mar 2026 14:15:36 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxuVB-000000004aN-2WZ3;
	Wed, 04 Mar 2026 22:15:33 +0000
Date: Thu, 05 Mar 2026 06:14:49 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:fixes-test] BUILD SUCCESS
 1a35cff9978afbe9112d5ee43e50b5beff358439
Message-ID: <202603050641.qTzfK9le-lkp@intel.com>
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
X-Rspamd-Queue-Id: A5101208636
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-17758-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,intel.com:dkim,intel.com:mid]
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 1a35cff9978afbe9112d5ee43e50b5beff358439  powerpc/pseries: Correct MSI allocation tracking

elapsed time: 959m

configs tested: 167
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                   randconfig-001-20260304    clang-23
arc                   randconfig-002-20260304    clang-23
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                   randconfig-001-20260304    clang-23
arm                   randconfig-002-20260304    clang-23
arm                   randconfig-003-20260304    clang-23
arm                   randconfig-004-20260304    clang-23
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                 randconfig-001-20260304    gcc-15.2.0
arm64                 randconfig-002-20260304    gcc-15.2.0
arm64                 randconfig-003-20260304    gcc-15.2.0
arm64                 randconfig-004-20260304    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                  randconfig-001-20260304    gcc-15.2.0
csky                  randconfig-002-20260304    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260305    clang-20
i386        buildonly-randconfig-002-20260305    clang-20
i386        buildonly-randconfig-003-20260305    clang-20
i386        buildonly-randconfig-004-20260305    clang-20
i386        buildonly-randconfig-005-20260305    clang-20
i386        buildonly-randconfig-006-20260305    clang-20
i386                  randconfig-001-20260304    clang-20
i386                  randconfig-002-20260304    clang-20
i386                  randconfig-003-20260304    clang-20
i386                  randconfig-004-20260304    clang-20
i386                  randconfig-005-20260304    clang-20
i386                  randconfig-006-20260304    clang-20
i386                  randconfig-007-20260304    clang-20
i386                  randconfig-011-20260304    gcc-14
i386                  randconfig-012-20260304    gcc-14
i386                  randconfig-013-20260304    gcc-14
i386                  randconfig-014-20260304    gcc-14
i386                  randconfig-015-20260304    gcc-14
i386                  randconfig-016-20260304    gcc-14
i386                  randconfig-017-20260304    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                randconfig-001-20260304    gcc-8.5.0
parisc                randconfig-002-20260304    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260304    gcc-8.5.0
powerpc               randconfig-002-20260304    gcc-8.5.0
powerpc64             randconfig-001-20260304    gcc-8.5.0
powerpc64             randconfig-002-20260304    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20260305    clang-23
riscv                 randconfig-002-20260305    clang-23
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                  randconfig-001-20260305    clang-23
s390                  randconfig-002-20260305    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260305    clang-23
sh                    randconfig-002-20260305    clang-23
sh                           se7751_defconfig    gcc-15.2.0
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260304    gcc-14
x86_64      buildonly-randconfig-002-20260304    gcc-14
x86_64      buildonly-randconfig-003-20260304    gcc-14
x86_64      buildonly-randconfig-004-20260304    gcc-14
x86_64      buildonly-randconfig-005-20260304    gcc-14
x86_64      buildonly-randconfig-006-20260304    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260304    clang-20
x86_64                randconfig-002-20260304    clang-20
x86_64                randconfig-003-20260304    clang-20
x86_64                randconfig-004-20260304    clang-20
x86_64                randconfig-005-20260304    clang-20
x86_64                randconfig-006-20260304    clang-20
x86_64                randconfig-011-20260304    gcc-14
x86_64                randconfig-012-20260304    gcc-14
x86_64                randconfig-013-20260304    gcc-14
x86_64                randconfig-014-20260304    gcc-14
x86_64                randconfig-015-20260304    gcc-14
x86_64                randconfig-016-20260304    gcc-14
x86_64                randconfig-071-20260304    clang-20
x86_64                randconfig-072-20260304    clang-20
x86_64                randconfig-073-20260304    clang-20
x86_64                randconfig-074-20260304    clang-20
x86_64                randconfig-075-20260304    clang-20
x86_64                randconfig-076-20260304    clang-20
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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

