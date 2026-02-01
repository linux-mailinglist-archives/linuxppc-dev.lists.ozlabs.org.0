Return-Path: <linuxppc-dev+bounces-16499-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IET7DqSkf2k6vAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16499-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Feb 2026 20:08:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F15CC707C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Feb 2026 20:08:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f3zmH2VQXz2ySb;
	Mon, 02 Feb 2026 06:08:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769972895;
	cv=none; b=auZSXOzFd8Wgmm/60rdelCsNrOjTYRJbn9V1tTrdFG1xC72pAj4FRWKFJG/0F0suJvLpyL/jctmdnoWugs2IoRno07q23cEZxMB/MsW+mOvO6rHfNmiibFZNuh0sVwysk9veCDviUFhmONgNuUyU+3Ohr5e4I6gtSA0eDk7p1qY+9ds3ym01yBaOuQUFSndY7akqUzgUnpr+4nTKXIP+Nc/UGMTJr2tuLVGLbKF+Q0aog2cU3o1kTvLjyQmPbLthuHSPTPjIYKATf17PQwtTaNv6F2YFrmQyqP6uXH/Bd12CwlK0QorAh8iKQvkBZ8hAMuBF9xGvYJ2U4GFxClfDag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769972895; c=relaxed/relaxed;
	bh=ZqL2tydUgQcnpq+fR/xMxYGXUgZGGV1OpmJEMQ5s1fI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fyaDDbYjSdgIKVrN+zXtnnBLNPVV+guwCZn2Y4WDwJ6u8ZwndmQCp7uLo7OVd7CgLaVsXbQJ6OXeKtNkxb7hnc26G3t0n18F+Xyj4FYPvAJqGrKdPpo66LE6R3cc7BUoBl795raCQXjF7ymOUnDTO5M+bvQqfuY0K5r6E0x+sQR/aN/Zz+uL5Vy6JC7xt1HRjQ3yCAnZ0gqsSrFn5kg3DX2zHlzuprehdwMIFb1h188pHJQN+kfp0eJq54D7NTyONlwATBzE9jn3EYsQIF8P8K1KXiLZDhEy+dDeidlO1x14s5cUzpB87HoTHaNYcWKpKAQsHcMgS5oKqVWC/zqTYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m2pBGKh6; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m2pBGKh6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f3zm85KWDz2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 06:08:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769972889; x=1801508889;
  h=date:from:to:cc:subject:message-id;
  bh=ibd+waM4M8cVrRWsor0TQ9JjLp9m0/wAxhvMn3SOB1I=;
  b=m2pBGKh64NKYgx3+UvdTiaHmW6RVryjgiMCZFLRfUgusbDr8S7EN8xL1
   TGDsp4f3qCLxea+54JnnumO/sWv+vPaw57oHQr6kKS2vF+607Jhwu4HLt
   +6k61Q/DFC4NfnmYpLEdFroD5iIoxbc7GhYw8pa909W8vU+wv5dfrXaZR
   NChzrv+R5gjx7huOAJrlXZ9gZE8T5lXdQkenOUGPdskvkr+He89SYgCBy
   6dxbsGoi1cjxDWgTyFJCEXhzlWXrxe1L+4U6xbYE/8Y6P8GNkXEoYHlVo
   LGHnQGGpsGjnKVz+j2Ctl3zoAz1mE6GsAMC3OuGcSKKMQ7Y3lttJ97UZO
   Q==;
X-CSE-ConnectionGUID: OtVbWoInRvaAStGeOsuP3g==
X-CSE-MsgGUID: TlTQ5is5RQm5xxlBi3Sg6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="88565010"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="88565010"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 11:08:03 -0800
X-CSE-ConnectionGUID: 6LqY8MUAT5OOVmALgeG0nQ==
X-CSE-MsgGUID: /h6Z9QzrQzKqJdyqpcvE9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="209217247"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Feb 2026 11:08:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmcnf-00000000eyi-3Qrs;
	Sun, 01 Feb 2026 19:07:59 +0000
Date: Mon, 02 Feb 2026 03:07:33 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 25ce7a5ce70ee7be5aad79b47e050563bebc6fe5
Message-ID: <202602020324.gNosikpa-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16499-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 5F15CC707C
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 25ce7a5ce70ee7be5aad79b47e050563bebc6fe5  Automatic merge of 'next' into merge (2026-02-01 11:28)

elapsed time: 720m

configs tested: 243
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              alldefconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260201    gcc-10.5.0
arc                   randconfig-002-20260201    gcc-10.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                       imx_v4_v5_defconfig    clang-22
arm                         mv78xx0_defconfig    clang-22
arm                        mvebu_v5_defconfig    clang-22
arm                        mvebu_v7_defconfig    gcc-15.2.0
arm                   randconfig-001-20260201    gcc-10.5.0
arm                   randconfig-002-20260201    gcc-10.5.0
arm                   randconfig-003-20260201    gcc-10.5.0
arm                   randconfig-004-20260201    gcc-10.5.0
arm                        spear3xx_defconfig    clang-17
arm                        vexpress_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260201    gcc-13.4.0
arm64                 randconfig-001-20260201    gcc-15.2.0
arm64                 randconfig-002-20260201    clang-20
arm64                 randconfig-002-20260201    gcc-15.2.0
arm64                 randconfig-003-20260201    gcc-15.2.0
arm64                 randconfig-003-20260201    gcc-8.5.0
arm64                 randconfig-004-20260201    gcc-12.5.0
arm64                 randconfig-004-20260201    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260201    gcc-11.5.0
csky                  randconfig-001-20260201    gcc-15.2.0
csky                  randconfig-002-20260201    gcc-15.2.0
hexagon                          alldefconfig    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260201    clang-22
hexagon               randconfig-001-20260201    gcc-15.2.0
hexagon               randconfig-002-20260201    clang-22
hexagon               randconfig-002-20260201    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260201    clang-20
i386        buildonly-randconfig-002-20260201    clang-20
i386        buildonly-randconfig-003-20260201    clang-20
i386        buildonly-randconfig-004-20260201    clang-20
i386        buildonly-randconfig-005-20260201    clang-20
i386        buildonly-randconfig-006-20260201    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260201    clang-20
i386                  randconfig-002-20260201    clang-20
i386                  randconfig-003-20260201    clang-20
i386                  randconfig-004-20260201    clang-20
i386                  randconfig-005-20260201    clang-20
i386                  randconfig-006-20260201    clang-20
i386                  randconfig-007-20260201    clang-20
i386                  randconfig-011-20260201    gcc-14
i386                  randconfig-012-20260201    gcc-14
i386                  randconfig-013-20260201    gcc-14
i386                  randconfig-014-20260201    gcc-14
i386                  randconfig-015-20260201    gcc-14
i386                  randconfig-016-20260201    gcc-14
i386                  randconfig-017-20260201    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260201    clang-22
loongarch             randconfig-001-20260201    gcc-15.2.0
loongarch             randconfig-002-20260201    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                       m5475evb_defconfig    clang-22
microblaze                       alldefconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                      mmu_defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath25_defconfig    clang-22
mips                  cavium_octeon_defconfig    gcc-15.2.0
mips                         db1xxx_defconfig    gcc-15.2.0
mips                  decstation_64_defconfig    gcc-15.2.0
mips                malta_qemu_32r6_defconfig    gcc-15.2.0
mips                      maltaaprp_defconfig    clang-22
mips                      maltasmvp_defconfig    gcc-15.2.0
mips                        maltaup_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260201    gcc-10.5.0
nios2                 randconfig-001-20260201    gcc-15.2.0
nios2                 randconfig-002-20260201    gcc-15.2.0
nios2                 randconfig-002-20260201    gcc-9.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260201    gcc-14.3.0
parisc                randconfig-002-20260201    gcc-14.3.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                   lite5200b_defconfig    gcc-15.2.0
powerpc                 mpc8315_rdb_defconfig    clang-22
powerpc                     powernv_defconfig    gcc-15.2.0
powerpc                      ppc6xx_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260201    gcc-12.5.0
powerpc               randconfig-001-20260201    gcc-14.3.0
powerpc               randconfig-002-20260201    gcc-11.5.0
powerpc               randconfig-002-20260201    gcc-14.3.0
powerpc                     skiroot_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260201    gcc-10.5.0
powerpc64             randconfig-001-20260201    gcc-14.3.0
powerpc64             randconfig-002-20260201    gcc-14.3.0
powerpc64             randconfig-002-20260201    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260201    clang-22
riscv                 randconfig-001-20260201    gcc-13.4.0
riscv                 randconfig-002-20260201    gcc-13.4.0
riscv                 randconfig-002-20260201    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260201    gcc-13.4.0
s390                  randconfig-002-20260201    gcc-12.5.0
s390                  randconfig-002-20260201    gcc-13.4.0
s390                       zfcpdump_defconfig    clang-22
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                            migor_defconfig    clang-22
sh                    randconfig-001-20260201    gcc-11.5.0
sh                    randconfig-001-20260201    gcc-13.4.0
sh                    randconfig-002-20260201    gcc-13.4.0
sh                          sdk7780_defconfig    gcc-15.2.0
sh                           sh2007_defconfig    gcc-15.2.0
sh                        sh7763rdp_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260201    gcc-8.5.0
sparc                 randconfig-002-20260201    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260201    gcc-8.5.0
sparc64               randconfig-002-20260201    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260201    gcc-8.5.0
um                    randconfig-002-20260201    gcc-8.5.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260201    clang-20
x86_64      buildonly-randconfig-002-20260201    clang-20
x86_64      buildonly-randconfig-003-20260201    clang-20
x86_64      buildonly-randconfig-004-20260201    clang-20
x86_64      buildonly-randconfig-004-20260201    gcc-14
x86_64      buildonly-randconfig-005-20260201    clang-20
x86_64      buildonly-randconfig-006-20260201    clang-20
x86_64      buildonly-randconfig-006-20260201    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260201    clang-20
x86_64                randconfig-001-20260201    gcc-14
x86_64                randconfig-002-20260201    gcc-14
x86_64                randconfig-003-20260201    gcc-14
x86_64                randconfig-004-20260201    gcc-14
x86_64                randconfig-005-20260201    gcc-14
x86_64                randconfig-006-20260201    clang-20
x86_64                randconfig-006-20260201    gcc-14
x86_64                randconfig-011-20260201    gcc-14
x86_64                randconfig-012-20260201    gcc-14
x86_64                randconfig-013-20260201    gcc-14
x86_64                randconfig-014-20260201    gcc-14
x86_64                randconfig-015-20260201    gcc-14
x86_64                randconfig-016-20260201    gcc-14
x86_64                randconfig-071-20260201    gcc-14
x86_64                randconfig-072-20260201    gcc-14
x86_64                randconfig-073-20260201    gcc-14
x86_64                randconfig-074-20260201    gcc-14
x86_64                randconfig-075-20260201    gcc-14
x86_64                randconfig-076-20260201    gcc-14
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
xtensa                generic_kc705_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260201    gcc-8.5.0
xtensa                randconfig-002-20260201    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

