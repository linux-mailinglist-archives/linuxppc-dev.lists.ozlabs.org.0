Return-Path: <linuxppc-dev+bounces-6825-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEE8A57BA2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Mar 2025 16:44:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z96sp24ZJz3048;
	Sun,  9 Mar 2025 02:44:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741448686;
	cv=none; b=hHFIzG8o+A6DdkeSE5tKcJjdH7qFk1l62S4URrl946d6lRZ7nnej5wUWI0fywkw4ZIR3ZQB0w3CTIFZq8AHF3L2EJJL9SAeWN8Z9JShBkvjTYzz4JCmFa9Zs9WD+hMxa45t9/xa6eBEByE6GWXsmmilfXWlMFSbmffGvOmyPYPwb2/qAf3oF5DV0jRjVQ4B3RjCZiP3Cr6bUxK+GK8hqPIb3U25UtRhYcK9PQbhOGXmvAinTMio4eteluF4+TfZr5qU10TUhiV77hoQu/tiudzB8vA2ipaDz+DAcJNQYUCSvHArM3nrb0saDxae9ytCG5GWbSVHrADDyS/tebKs3Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741448686; c=relaxed/relaxed;
	bh=k3akHclizIp3nJ0QjdAUJFWJkessTjj28LNip2c4DUU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ERmOkZnZDBsZ5JoVrOZFcUm5GSk7Gxm8MauyVI0A9u4BnCjYdXolMKHSuWS3fd4MkuLYsWVTW+qnZxbYX+nClCPiG1H6uRG5XnK2WLTcYkrgbGaux1toOzoj7d1K62CDTinaHp6xoXeLAhnm9AnQ4Cgm59KjhiEKXrENjF9enHIk35SShuvpVrM/HWL78FiA6EIzcnBEl5LbwBpkAYRGrc4U23rRZL8x4xjWdRBz7wzg7N0FiZaxSQ1ni2LnJQBopY6RdP9J9Pxe407l2LOKwRojRQroIg6s9FrDnJltrrxV39v9fjy2+SlM63xzxpQFuNK7lZ+ZA77syteiDnXoIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C8S808l6; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C8S808l6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z96sl6jK7z2yn9
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Mar 2025 02:44:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741448684; x=1772984684;
  h=date:from:to:cc:subject:message-id;
  bh=7h2E8JeTf+koxEVjwrXGtJPg6xikOlxcV4lPpcPyDS0=;
  b=C8S808l6u9Co80UH5WG6/OGjkbz/ttE4CZ6k2VpoG/2TJwEO2tl9hYCf
   jAZlyDxXynZ1Tx7hIYeGMNL6OIh70FJncVd8wUSbh4KAEf9Gm92yRemjR
   Nz2JuWi/g0oNb335AaAhSd52xniNpKKGwARTeaCDH7lZYLYezdiyHG9d4
   GBUyCMEPIwTF01zQj1fpQbjdfFSFjWO35Zny5xtl5ypRdZlhN3Dni8XWD
   QJHsjvUs/4Ius9FnpL57/xsZXDIEnCokD/zJtEd3Ijefagmglap0YEtGz
   LfgloEQcoCXbjWNbBl5CpehnnQfydn0t5YWJRFfofmI1PZbf1tlwXNnYx
   A==;
X-CSE-ConnectionGUID: ucDPd4S6TLCz0BAWy4tPSw==
X-CSE-MsgGUID: PcxpZa4jQEidymOElNcUug==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="64925721"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="64925721"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 07:44:36 -0800
X-CSE-ConnectionGUID: ryuO+A+TSimjPeVdPizuPA==
X-CSE-MsgGUID: Fp5l0XF0QcaleHU1qHrrMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="156796273"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 08 Mar 2025 07:44:35 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqwLo-00020o-15;
	Sat, 08 Mar 2025 15:44:32 +0000
Date: Sat, 08 Mar 2025 23:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next-test] BUILD SUCCESS
 ff99d5b6a246715f2257123cdf6c4a29cb33aa78
Message-ID: <202503082329.KE1FHpdc-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: ff99d5b6a246715f2257123cdf6c4a29cb33aa78  powerpc/perf: Fix ref-counting on the PMU 'vpa_pmu'

elapsed time: 1451m

configs tested: 79
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250308    gcc-13.2.0
arc                   randconfig-002-20250308    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                   randconfig-001-20250308    gcc-14.2.0
arm                   randconfig-002-20250308    gcc-14.2.0
arm                   randconfig-003-20250308    gcc-14.2.0
arm                   randconfig-004-20250308    gcc-14.2.0
arm64                 randconfig-001-20250308    gcc-14.2.0
arm64                 randconfig-002-20250308    gcc-14.2.0
arm64                 randconfig-003-20250308    clang-16
arm64                 randconfig-004-20250308    gcc-14.2.0
csky                  randconfig-001-20250308    gcc-14.2.0
csky                  randconfig-002-20250308    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250308    clang-19
hexagon               randconfig-002-20250308    clang-21
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250308    gcc-12
i386        buildonly-randconfig-002-20250308    gcc-11
i386        buildonly-randconfig-003-20250308    clang-19
i386        buildonly-randconfig-004-20250308    clang-19
i386        buildonly-randconfig-005-20250308    clang-19
i386        buildonly-randconfig-006-20250308    gcc-12
loongarch             randconfig-001-20250308    gcc-14.2.0
loongarch             randconfig-002-20250308    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250308    gcc-14.2.0
nios2                 randconfig-002-20250308    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250308    gcc-14.2.0
parisc                randconfig-002-20250308    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250308    clang-18
powerpc               randconfig-002-20250308    gcc-14.2.0
powerpc               randconfig-003-20250308    gcc-14.2.0
powerpc64             randconfig-001-20250308    gcc-14.2.0
powerpc64             randconfig-002-20250308    gcc-14.2.0
powerpc64             randconfig-003-20250308    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250308    clang-21
riscv                 randconfig-002-20250308    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250308    clang-19
s390                  randconfig-002-20250308    clang-17
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250308    gcc-14.2.0
sh                    randconfig-002-20250308    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250308    gcc-14.2.0
sparc                 randconfig-002-20250308    gcc-14.2.0
sparc64               randconfig-001-20250308    gcc-14.2.0
sparc64               randconfig-002-20250308    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20250308    gcc-12
um                    randconfig-002-20250308    gcc-12
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250308    gcc-12
x86_64      buildonly-randconfig-002-20250308    clang-19
x86_64      buildonly-randconfig-003-20250308    gcc-12
x86_64      buildonly-randconfig-004-20250308    clang-19
x86_64      buildonly-randconfig-005-20250308    clang-19
x86_64      buildonly-randconfig-006-20250308    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250308    gcc-14.2.0
xtensa                randconfig-002-20250308    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

