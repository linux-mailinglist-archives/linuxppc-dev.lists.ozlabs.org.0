Return-Path: <linuxppc-dev+bounces-1508-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB1197DC6A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2024 11:32:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X9kZ71CHTz2y7M;
	Sat, 21 Sep 2024 19:32:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726911167;
	cv=none; b=dinvecHp4AGl1BxKQm55b8K2v7xP2czxnXK79uSu0TKfwqpdrQzbMF+xsAPZUnbdXiMKsxNQa+GK2NkD1F9n3/Ukdshk9zvEGxmwLXAuNIKnUs8r66eEXqCoxkH4o2BgYWOXYJAJ/F+l7q4T6tKTqb1SNouI3K1ZygTg82PDHBxZcwDBwdxoVGn1ftxRkrshafAPYdXk5o0j1+HyO2nP8W4ZtRLIGR8ahtoytea+kKFAsvwa7UXkx0CdJMbXDMLq8eJKi22cyLsD3Y178HlGRnyKnrjOSRxcFJxtVq9gQMYC01y1yB8hmaLGL1zEc94s1+seMxYVPimNYpAGxJF8/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726911167; c=relaxed/relaxed;
	bh=qvPY/1koblyKIj+VVuTL22yiD2TIdyuMbj9R689ZBzg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b5tpX5MWP3NsxFm6GLtZ2kOmaFXtX4HCBe49x9tr2sOpIw2ANlQSF6FxQilNXNFnmCO896qgUodCNcMF+6JPUxvz8emDvfjHWEL3yxmtQhMjTSKGG615oPkDurl7nywKiz21EaXU+JqHJJpTzI4B6hlzaSUg4ciLTSQjdqmWrPi7XGM5WD1wvOUfU4lR2tnX/LGKZndqpDAKv5QL+z69Y4vXZISn4UDyyWr5PfAivMqJ/Tmj1ii47/4HcqC/9I0GHd8NSLGKj7Yw1ixh8XcOAgfmsSxjZupjJnaiJp5WC5FPzwBK/ZL1sDlmZ0xsczEBM+ln2yBPUbwscKG3xIu/nQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K8YO3Rit; dkim-atps=neutral; spf=pass (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K8YO3Rit;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X9kZ52V7Cz2xmZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2024 19:32:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726911165; x=1758447165;
  h=date:from:to:cc:subject:message-id;
  bh=hfIXjS7AZ1D4YkLknihVpDa4ehK2qqK1S/TjIhAV6fE=;
  b=K8YO3RitSTyHYEMB2q9yxz/WGyNxVAYDbOALiW7NJ1xiRWqYdHMpoPbw
   qJ9D9XiQbxyfiRJjhCDXcd811EkCH5bpzFaNEgejgUFQMBfLyk0XTOiZ9
   AJlVnOkknrJhs5r15iXp4HSiBHNb0ZoJzBN/N2e4MVKAUjkNMfVubE7sg
   EODCN+bUYC9vKmOxXHBOE31pgnXVk47E8B5PhcLAm7G/toq8pdbTwjl96
   jplxa33GLF0DFN2nCNY40Px7mPYUz4AAowxtLsBTjeRjJ2i4X1gRshD6c
   0h0no60Wv+v2q/TIeRsMJ9dyZ1apVz7Sk7EZAaxN99Jlq+pc9NanWSGN9
   w==;
X-CSE-ConnectionGUID: onm86+GoRouPmFVegmVl2g==
X-CSE-MsgGUID: DwyeCAVQS7OOcvz+3SU71Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="13619982"
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="13619982"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 02:32:40 -0700
X-CSE-ConnectionGUID: Y9W1wRqqRim6OOIvXlNQLQ==
X-CSE-MsgGUID: WN9bl55RSdiKsuQKQFtR3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="93891892"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Sep 2024 02:32:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srwTl-000FJT-0e;
	Sat, 21 Sep 2024 09:32:37 +0000
Date: Sat, 21 Sep 2024 17:32:19 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 ef28aca2b21ca077606f40cf4676127c4952d0ff
Message-ID: <202409211713.cPlMZPsZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: ef28aca2b21ca077606f40cf4676127c4952d0ff  Automatic merge of 'fixes' into merge (2024-09-20 19:06)

elapsed time: 1448m

configs tested: 129
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                               allnoconfig    gcc-14.1.0
arc                                 defconfig    gcc-14.1.0
arm                               allnoconfig    gcc-14.1.0
arm                        clps711x_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                       multi_v4t_defconfig    gcc-14.1.0
arm                          pxa168_defconfig    gcc-14.1.0
arm                           sama7_defconfig    gcc-14.1.0
arm                       spear13xx_defconfig    gcc-14.1.0
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240921    clang-18
i386        buildonly-randconfig-002-20240921    clang-18
i386        buildonly-randconfig-003-20240921    clang-18
i386        buildonly-randconfig-004-20240921    clang-18
i386        buildonly-randconfig-005-20240921    clang-18
i386        buildonly-randconfig-006-20240921    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240921    clang-18
i386                  randconfig-002-20240921    clang-18
i386                  randconfig-003-20240921    clang-18
i386                  randconfig-004-20240921    clang-18
i386                  randconfig-005-20240921    clang-18
i386                  randconfig-006-20240921    clang-18
i386                  randconfig-011-20240921    clang-18
i386                  randconfig-012-20240921    clang-18
i386                  randconfig-013-20240921    clang-18
i386                  randconfig-014-20240921    clang-18
i386                  randconfig-015-20240921    clang-18
i386                  randconfig-016-20240921    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                          atari_defconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                           sun3_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                     cu1000-neo_defconfig    gcc-14.1.0
mips                       lemote2f_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      chrp32_defconfig    gcc-14.1.0
powerpc                 mpc8313_rdb_defconfig    gcc-14.1.0
powerpc                 mpc837x_rdb_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                         apsh4a3a_defconfig    gcc-14.1.0
sh                        apsh4ad0a_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          rsk7269_defconfig    gcc-14.1.0
sh                     sh7710voipgw_defconfig    gcc-14.1.0
sh                            shmin_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240921    clang-18
x86_64      buildonly-randconfig-002-20240921    clang-18
x86_64      buildonly-randconfig-003-20240921    clang-18
x86_64      buildonly-randconfig-004-20240921    clang-18
x86_64      buildonly-randconfig-005-20240921    clang-18
x86_64      buildonly-randconfig-006-20240921    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20240921    clang-18
x86_64                randconfig-002-20240921    clang-18
x86_64                randconfig-003-20240921    clang-18
x86_64                randconfig-004-20240921    clang-18
x86_64                randconfig-005-20240921    clang-18
x86_64                randconfig-006-20240921    clang-18
x86_64                randconfig-011-20240921    clang-18
x86_64                randconfig-012-20240921    clang-18
x86_64                randconfig-013-20240921    clang-18
x86_64                randconfig-014-20240921    clang-18
x86_64                randconfig-015-20240921    clang-18
x86_64                randconfig-016-20240921    clang-18
x86_64                randconfig-071-20240921    clang-18
x86_64                randconfig-072-20240921    clang-18
x86_64                randconfig-073-20240921    clang-18
x86_64                randconfig-074-20240921    clang-18
x86_64                randconfig-075-20240921    clang-18
x86_64                randconfig-076-20240921    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

