Return-Path: <linuxppc-dev+bounces-6541-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E78FA48613
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2025 18:03:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3d3F2xc8z3blF;
	Fri, 28 Feb 2025 04:03:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740675833;
	cv=none; b=iwEuUHnCGJ7izhVVAJGctc0rV0lT3jqx6XQwqmP6CNojK0zc1jB9rVwmmd/uttl9vay86GCQI5Ac7lglymo4Uo9xWoP0gSYrPdZwB4JlI8MKmDUGvxc+Dg6V/SFQT9Qw78+Whfn1fF71jmd4Ch7DXfC5nuJ2uBm3u7HlRNctlT9e9Y5xhAk7NxhlPjOgsskvuPFvPXQ/2/rGhrvMftq0WCFcofVxQ4nmopJHFSp6DrZ4RsWQ73VAP55vy6jcz0HOfC3y20hN66eUcanuqWFJGnLz7G0VWIuX9Km7ZM8qPig5QcW2MEJlSQgyN2/PYEWebP2HDBrUTDyvhucPm5qNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740675833; c=relaxed/relaxed;
	bh=Vq0gedB0va8K/zS2jv46HwCZqFtUxxSrUXVIKposaOs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kXUEKwgg0az3zAXjYfr8xbYXIT98ovJLzL5lWTb07+5z8jtARCg1TqvW4Tx1tsuBoa89XpvyIdeDmkzgkkWjoc2Tbx9QOMLtJJw5QruzDQUBy2B+hE9nrjNYJ63nB9W6z9hfwEw9sTsFg9mhNfB1sTbJTgHk9icdRdhRliGg1lelIUGqcUmq8G+GASNP3Q+flF4+r2wCWCtNgL3fgh1J9CMPUSZjY83QBQtFiuImZq3t0KeUU/a1jkrAosEkB88YkRHiPCULfdko1KVzwxqzzJ3WLoDCrF5zV+pWlUl/tO2/hoXXNv0srDsUIpGkLUXdZStCXPGysZTvDhzl/E5ncg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=II5ZyYLa; dkim-atps=neutral; spf=pass (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=II5ZyYLa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z3d3B4fBlz3005
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2025 04:03:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740675831; x=1772211831;
  h=date:from:to:cc:subject:message-id;
  bh=g4JvIBnSMlhJorrjGFl9K+Dz2avpQ5ojSUMEL6KaLDc=;
  b=II5ZyYLavAXMxpJr8V8bFCzVCKL9tY7GDCU3WGxZKQ6qauADR84nOusv
   jXZWipZ2SmAT3W0ya78npmaKWggoTnFU0bIMNkyV71L58fT3zS5AKIH/K
   j0pgyGneszXW1gscbueOD8khnEnU20rgowiz/1CXFF56nN9WIFTY3dSe8
   8tY8uQasBShesf39x2dnbUvbrCf/NxadkgflDxCurNyq+la/VuBI6vywf
   dkaDlmiPQErm0WPYi6SLHZX1rAUF+DaJeIFrS/SoeCKYLw/OkrWvkPj11
   9IlE/ITt1yynPMCCLQ1B40qQYUgTTTKidKxFHCZNoAp0ffgA7Nni+AhlR
   A==;
X-CSE-ConnectionGUID: GuAm4TSnSg2oAYH3OYHwCA==
X-CSE-MsgGUID: QF2ZbqhqR76gjAk9EFFsoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="29182984"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="29182984"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 09:03:45 -0800
X-CSE-ConnectionGUID: 6rJHNJP4SFKNTD+L6QcCOA==
X-CSE-MsgGUID: CBcR09ofQ12MSyo/NbL9Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117609376"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 27 Feb 2025 09:03:43 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnhIT-000DkM-0p;
	Thu, 27 Feb 2025 17:03:41 +0000
Date: Fri, 28 Feb 2025 01:02:52 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next-test] BUILD SUCCESS
 aca95fb6bb572a77f39d42d83ab72a965026577d
Message-ID: <202502280146.5MIc9BI1-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
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
branch HEAD: aca95fb6bb572a77f39d42d83ab72a965026577d  powerpc/microwatt: Add SMP support

elapsed time: 1450m

configs tested: 78
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250227    gcc-13.2.0
arc                   randconfig-002-20250227    gcc-13.2.0
arm                   randconfig-001-20250227    gcc-14.2.0
arm                   randconfig-002-20250227    clang-17
arm                   randconfig-003-20250227    gcc-14.2.0
arm                   randconfig-004-20250227    clang-21
arm64                 randconfig-001-20250227    gcc-14.2.0
arm64                 randconfig-002-20250227    clang-19
arm64                 randconfig-003-20250227    gcc-14.2.0
arm64                 randconfig-004-20250227    gcc-14.2.0
csky                  randconfig-001-20250227    gcc-14.2.0
csky                  randconfig-002-20250227    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250227    clang-14
hexagon               randconfig-002-20250227    clang-16
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250227    gcc-12
i386        buildonly-randconfig-002-20250227    gcc-11
i386        buildonly-randconfig-003-20250227    clang-19
i386        buildonly-randconfig-004-20250227    gcc-12
i386        buildonly-randconfig-005-20250227    gcc-11
i386        buildonly-randconfig-006-20250227    clang-19
loongarch             randconfig-001-20250227    gcc-14.2.0
loongarch             randconfig-002-20250227    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250227    gcc-14.2.0
nios2                 randconfig-002-20250227    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250227    gcc-14.2.0
parisc                randconfig-002-20250227    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250227    clang-19
powerpc               randconfig-002-20250227    gcc-14.2.0
powerpc               randconfig-003-20250227    clang-19
powerpc64             randconfig-001-20250227    clang-17
powerpc64             randconfig-002-20250227    clang-21
powerpc64             randconfig-003-20250227    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250227    gcc-14.2.0
riscv                 randconfig-002-20250227    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250227    clang-18
s390                  randconfig-002-20250227    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250227    gcc-14.2.0
sh                    randconfig-002-20250227    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250227    gcc-14.2.0
sparc                 randconfig-002-20250227    gcc-14.2.0
sparc64               randconfig-001-20250227    gcc-14.2.0
sparc64               randconfig-002-20250227    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250227    clang-17
um                    randconfig-002-20250227    gcc-12
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250227    clang-19
x86_64      buildonly-randconfig-002-20250227    clang-19
x86_64      buildonly-randconfig-003-20250227    gcc-12
x86_64      buildonly-randconfig-004-20250227    gcc-12
x86_64      buildonly-randconfig-005-20250227    clang-19
x86_64      buildonly-randconfig-006-20250227    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250227    gcc-14.2.0
xtensa                randconfig-002-20250227    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

