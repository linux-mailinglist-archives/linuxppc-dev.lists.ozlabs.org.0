Return-Path: <linuxppc-dev+bounces-16466-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCtRB8AffWmYQQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16466-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 22:16:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADD5BEC30
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 22:16:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2pjP5r0Pz2xJF;
	Sat, 31 Jan 2026 08:16:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769807801;
	cv=none; b=UUNR3YkV2M6VTb6YM65tnXvxcIBbRg7U2QalCyWQ1ZG/seV9Z2RJvvSmb7jOQn2M3V1Unwc2zabBSO0f0fcu0lNQ0gUdItGkznf1XpLUzWSNBL9AQFUckuDPzMtGHn5//2v4MErdyhirI7wo8TzjJ/m8UuV5p6i3J4tFd6vzXIC+JdZ94pkfGpX5WgNcDhuQfttXRclmXyxl2hZ7+6/jrDpCg98uDLYOvDW40ZJSF4jBofbQhREgoOJlyZNsDGWZ5OkgMLrqDo+6vFqGi8QRTCQPHjdkX1ynvCZ0fHLu6bD+l31RuArEZpmxAZICZy3BzSZZZ+bGe1z7yXQSkR4INA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769807801; c=relaxed/relaxed;
	bh=O+zdsgp511zBib6fROMhQSNfbEZmSSYWoYLMdu2jyNQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oHHcXFzO8I7xGATRzdX1/OrEcfrM4oGMcUdtxcNAIzRxrSe8LBvjdW3Qi/i/DEAU+3TPZd9IHEJph+7twvzqKHRTerza5sf/nRb7AblsG/+bU0Ojyo9Z0ZQ1T2fngO76AWsaLSYc+nCVHD1lJOO9QIRs26+B9EhtTC05w9O9XqMJawpaqVPfNe4VbmNdXV7wLrZ1/50S043hz7mkWFy2pr9Q0CIzfJ1hDGSrJwPcUV/7mCRwOL7m/aIlaZDMn+O/Z81QFE7NUqGAJwKkIXd/hngmHeG4Emb9YVDbjoMCg702GipK+9dH9geAN4wtT7Pa/4xV0kK3PE+/vWP7IxZuhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k0nFuWeg; dkim-atps=neutral; spf=pass (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k0nFuWeg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2pjM0zX9z2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 08:16:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769807799; x=1801343799;
  h=date:from:to:cc:subject:message-id;
  bh=EJoMoejVEPX7Q7RIBwGdv83gHGYPj5/p3bvQciVQidc=;
  b=k0nFuWegeHmNdzHQdGud99yQdIHDQFujnHg/a+eFA0LhbVXMn6rAAxma
   1iZQbStJ/UjjzY3aXww6AeptXeuj2+eSptlZDShtGypv9GmyHd7AZxRDg
   7q2A4DiddbcBkhZ/XlZeC9Qr1KOrC3tb243Ot/E/BQv7zlJ86kb/vdvqe
   Q/Lk0P63s4sCLLNKrI2dMTDe2MEOdzgDNS1mrUlfPhhP3K23OY9lx3zQM
   P1TdtSgtVEwYCUfBADTqzaXVSG4PyfkBv0/rvkyrf+NGlJD1kIWD/ugJW
   5psrD8rvoQr/xP6UG/tRH7cAg3slL5ZZ/kkTG61OxvU/1ibHKwyhbhY1C
   A==;
X-CSE-ConnectionGUID: 6xKr1k2ASHyI/e8mtdvqcQ==
X-CSE-MsgGUID: 9LPTBX+8R1WiYvQbCR966A==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="81796648"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="81796648"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 13:16:33 -0800
X-CSE-ConnectionGUID: w+/2g780SneSr/lWmok9yA==
X-CSE-MsgGUID: i9kBy2LoQtC8LfhbI1sGoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="239669486"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Jan 2026 13:16:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlvqv-00000000dMm-0fmh;
	Fri, 30 Jan 2026 21:16:29 +0000
Date: Sat, 31 Jan 2026 05:16:27 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next-test] BUILD SUCCESS
 1d72a02d65a733ad124bacc2db3fb90fa81a612b
Message-ID: <202601310522.VBxYsc93-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-16466-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: 4ADD5BEC30
X-Rspamd-Action: no action

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 1d72a02d65a733ad124bacc2db3fb90fa81a612b  docs: trusted-encryped: add PKWM as a new trust source

elapsed time: 1034m

configs tested: 268
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              alldefconfig    clang-22
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260130    clang-17
arc                   randconfig-001-20260130    gcc-13.4.0
arc                   randconfig-001-20260131    gcc-8.5.0
arc                   randconfig-002-20260130    clang-17
arc                   randconfig-002-20260130    gcc-15.2.0
arc                   randconfig-002-20260131    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                            dove_defconfig    clang-22
arm                      jornada720_defconfig    clang-22
arm                          pxa910_defconfig    clang-22
arm                   randconfig-001-20260130    clang-17
arm                   randconfig-001-20260130    clang-22
arm                   randconfig-001-20260131    gcc-8.5.0
arm                   randconfig-002-20260130    clang-17
arm                   randconfig-002-20260131    gcc-8.5.0
arm                   randconfig-003-20260130    clang-17
arm                   randconfig-003-20260130    clang-22
arm                   randconfig-003-20260131    gcc-8.5.0
arm                   randconfig-004-20260130    clang-17
arm                   randconfig-004-20260130    clang-22
arm                   randconfig-004-20260131    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260130    gcc-8.5.0
arm64                 randconfig-002-20260130    gcc-8.5.0
arm64                 randconfig-003-20260130    gcc-8.5.0
arm64                 randconfig-004-20260130    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260130    gcc-8.5.0
csky                  randconfig-002-20260130    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260130    gcc-11.5.0
hexagon               randconfig-001-20260131    gcc-11.5.0
hexagon               randconfig-002-20260130    gcc-11.5.0
hexagon               randconfig-002-20260131    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260130    clang-20
i386        buildonly-randconfig-002-20260130    clang-20
i386        buildonly-randconfig-003-20260130    clang-20
i386        buildonly-randconfig-004-20260130    clang-20
i386        buildonly-randconfig-004-20260130    gcc-14
i386        buildonly-randconfig-005-20260130    clang-20
i386        buildonly-randconfig-006-20260130    clang-20
i386        buildonly-randconfig-006-20260130    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260130    clang-20
i386                  randconfig-001-20260130    gcc-14
i386                  randconfig-002-20260130    clang-20
i386                  randconfig-002-20260130    gcc-14
i386                  randconfig-003-20260130    clang-20
i386                  randconfig-003-20260130    gcc-14
i386                  randconfig-004-20260130    clang-20
i386                  randconfig-004-20260130    gcc-14
i386                  randconfig-005-20260130    gcc-14
i386                  randconfig-006-20260130    clang-20
i386                  randconfig-006-20260130    gcc-14
i386                  randconfig-007-20260130    gcc-14
i386                  randconfig-011-20260130    clang-20
i386                  randconfig-012-20260130    clang-20
i386                  randconfig-013-20260130    clang-20
i386                  randconfig-014-20260130    clang-20
i386                  randconfig-015-20260130    clang-20
i386                  randconfig-016-20260130    clang-20
i386                  randconfig-017-20260130    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260130    gcc-11.5.0
loongarch             randconfig-001-20260131    gcc-11.5.0
loongarch             randconfig-002-20260130    gcc-11.5.0
loongarch             randconfig-002-20260131    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                        m5307c3_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260130    gcc-11.5.0
nios2                 randconfig-001-20260131    gcc-11.5.0
nios2                 randconfig-002-20260130    gcc-11.5.0
nios2                 randconfig-002-20260131    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260130    gcc-14.3.0
parisc                randconfig-001-20260130    gcc-8.5.0
parisc                randconfig-001-20260131    gcc-8.5.0
parisc                randconfig-002-20260130    gcc-8.5.0
parisc                randconfig-002-20260131    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      mgcoge_defconfig    clang-22
powerpc                     mpc5200_defconfig    clang-22
powerpc               randconfig-001-20260130    gcc-14.3.0
powerpc               randconfig-001-20260130    gcc-8.5.0
powerpc               randconfig-001-20260131    gcc-8.5.0
powerpc               randconfig-002-20260130    gcc-10.5.0
powerpc               randconfig-002-20260130    gcc-8.5.0
powerpc               randconfig-002-20260131    gcc-8.5.0
powerpc64             randconfig-001-20260130    clang-22
powerpc64             randconfig-001-20260130    gcc-8.5.0
powerpc64             randconfig-001-20260131    gcc-8.5.0
powerpc64             randconfig-002-20260130    clang-22
powerpc64             randconfig-002-20260130    gcc-8.5.0
powerpc64             randconfig-002-20260131    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260130    clang-22
riscv                 randconfig-001-20260130    gcc-14.3.0
riscv                 randconfig-001-20260131    gcc-8.5.0
riscv                 randconfig-002-20260130    clang-22
riscv                 randconfig-002-20260131    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260130    clang-22
s390                  randconfig-001-20260131    gcc-8.5.0
s390                  randconfig-002-20260130    clang-22
s390                  randconfig-002-20260131    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260130    clang-22
sh                    randconfig-001-20260130    gcc-9.5.0
sh                    randconfig-001-20260131    gcc-8.5.0
sh                    randconfig-002-20260130    clang-22
sh                    randconfig-002-20260130    gcc-13.4.0
sh                    randconfig-002-20260131    gcc-8.5.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260130    clang-22
sparc                 randconfig-001-20260130    gcc-8.5.0
sparc                 randconfig-001-20260131    gcc-14
sparc                 randconfig-002-20260130    clang-22
sparc                 randconfig-002-20260130    gcc-8.5.0
sparc                 randconfig-002-20260131    gcc-14
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260130    clang-22
sparc64               randconfig-001-20260131    gcc-14
sparc64               randconfig-002-20260130    clang-22
sparc64               randconfig-002-20260130    gcc-8.5.0
sparc64               randconfig-002-20260131    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260130    clang-22
um                    randconfig-001-20260131    gcc-14
um                    randconfig-002-20260130    clang-22
um                    randconfig-002-20260130    gcc-13
um                    randconfig-002-20260131    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260130    clang-20
x86_64      buildonly-randconfig-002-20260130    clang-20
x86_64      buildonly-randconfig-002-20260130    gcc-14
x86_64      buildonly-randconfig-003-20260130    clang-20
x86_64      buildonly-randconfig-004-20260130    clang-20
x86_64      buildonly-randconfig-005-20260130    clang-20
x86_64      buildonly-randconfig-006-20260130    clang-20
x86_64      buildonly-randconfig-006-20260130    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260130    clang-20
x86_64                randconfig-002-20260130    clang-20
x86_64                randconfig-003-20260130    clang-20
x86_64                randconfig-004-20260130    clang-20
x86_64                randconfig-005-20260130    clang-20
x86_64                randconfig-006-20260130    clang-20
x86_64                randconfig-011-20260130    clang-20
x86_64                randconfig-011-20260131    clang-20
x86_64                randconfig-012-20260130    clang-20
x86_64                randconfig-012-20260131    clang-20
x86_64                randconfig-013-20260130    clang-20
x86_64                randconfig-013-20260131    clang-20
x86_64                randconfig-014-20260130    clang-20
x86_64                randconfig-014-20260130    gcc-14
x86_64                randconfig-014-20260131    clang-20
x86_64                randconfig-015-20260130    clang-20
x86_64                randconfig-015-20260131    clang-20
x86_64                randconfig-016-20260130    clang-20
x86_64                randconfig-016-20260130    gcc-14
x86_64                randconfig-016-20260131    clang-20
x86_64                randconfig-071-20260130    clang-20
x86_64                randconfig-072-20260130    clang-20
x86_64                randconfig-073-20260130    clang-20
x86_64                randconfig-074-20260130    clang-20
x86_64                randconfig-075-20260130    clang-20
x86_64                randconfig-076-20260130    clang-20
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
xtensa                randconfig-001-20260130    clang-22
xtensa                randconfig-001-20260130    gcc-12.5.0
xtensa                randconfig-001-20260131    gcc-14
xtensa                randconfig-002-20260130    clang-22
xtensa                randconfig-002-20260130    gcc-14.3.0
xtensa                randconfig-002-20260131    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

