Return-Path: <linuxppc-dev+bounces-6042-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8C5A2F5DA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 18:51:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsBvp4mZbz2ykn;
	Tue, 11 Feb 2025 04:51:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739209878;
	cv=none; b=WF2K/JT8BcYB+PH+VkI2LrtPORor4FOEmErk9lpnzIC7XNS52a8eMt5MBedh5qPx4t+wLzHAEoJZcza4V97U035s1bACkILGDyvo5LV137yFIguRkNMU02z9IdB8ephVA4X9XZ3mOiWsfi7Uoptq43ixQzWcbh78gDUpupW5YMaZob0n4eg5CecphIbW8IHnGu2AMHsMYQYzLEXqNzl+uvFZzGWiTTw/KadD7MfzVZBoNWB6IOaQfWmdtpsIkOruuWfucU5CLwPr7z7fW3O9zqbijbnqYMZP5JGlxunymGtSZ7DBcqs3ai3rEY3GPBFhUOfP+Du4NhAGiyOzc+PH2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739209878; c=relaxed/relaxed;
	bh=di1cgUJ7vi7gq60tB+ybNSF+B/RZE1XBoAq+ZGSxow8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HxSAhzrVYo77ZoJ8sKKR1cQUCa6JGuSHcbH91IX7N015cErhpAmQ2gYRlUyUtWBG+Os5ENlFC2q7zaHSa5+tTQHcsB8wSCk91Rlr7UdLsONgT5ms3pdkust7wqynmnwPasAQCt8pH3Z35rR1h2GCJ1wdLUPgjgV14Rtf42IM7Xaei5Q4e4kxwASWXp4tvykZPcehIslFjdgv3o2VfLgdzr7mhHKBSBfa+us9bU/cUSf8hG6BFk2rCCFCvajO4BpVTvzHun6EcKQMOQbxZRwbmBtOqvNxJAfPeCs1+Ha5JraeSP8IDF7nAT/X7YAXqeLSfwtUTtZ6leeeiKfcJ+LgQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k4xd7B8W; dkim-atps=neutral; spf=pass (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k4xd7B8W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsBvl6yD7z2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 04:51:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739209876; x=1770745876;
  h=date:from:to:cc:subject:message-id;
  bh=O5TlHizbrv5oEqFoIrGqGA6AZGPEZoRHbzdDxFwPvbo=;
  b=k4xd7B8WHCmlyOCtwiZdcaH4y5Y/+KPobBMrZ8D2ZWm33q/Ebc/qPyXj
   3yfq5wSqMo2nzKyhQLidfW7SAyVfdFORbFnK6WKqBu2iI30pEszTcw7fJ
   KwajSYeN3EhozkPpSyJm4INdsOv596iPvqzygiMlMa2wexiGfMOiqNRVR
   q32gaYZgDBdCJGiBwp3rS9mEuAkur9MUhuMZEFgB40xMNWjxQlgd0l6Ou
   AMNOTDG9oGcNgc73dvh4W2o/JNLF0Ru8RDea9rEgDvIqUlEIhSc3GU25U
   TpPk9OXzgUjIX7s71wEwNwn6U3X2BlbvH0RUAcxapVWopRfmyZPgzSRmb
   A==;
X-CSE-ConnectionGUID: wKPzWswdTYuwlBgctj4n0Q==
X-CSE-MsgGUID: M/VArL1iQzOx00hyLAuKDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="42642194"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="42642194"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 09:50:53 -0800
X-CSE-ConnectionGUID: q+AcjOZwTGGgqSq1hdBLOw==
X-CSE-MsgGUID: mtP1ESmfQxyfcdikcJVHrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="112211729"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Feb 2025 09:50:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thXvm-00138w-0s;
	Mon, 10 Feb 2025 17:50:50 +0000
Date: Tue, 11 Feb 2025 01:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:fixes-test] BUILD SUCCESS
 61bcc752d1b81fde3cae454ff20c1d3c359df500
Message-ID: <202502110124.od2QJjaE-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 61bcc752d1b81fde3cae454ff20c1d3c359df500  powerpc/64s: Rewrite __real_pte() and __rpte_to_hidx() as static inline

elapsed time: 724m

configs tested: 119
configs skipped: 138

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                     allnoconfig    gcc-14.2.0
arc                       allnoconfig    gcc-14.2.0
arc           randconfig-001-20250210    clang-21
arc           randconfig-002-20250210    clang-21
arm                       allnoconfig    gcc-14.2.0
arm                 bcm2835_defconfig    gcc-14.2.0
arm                  ixp4xx_defconfig    gcc-14.2.0
arm           randconfig-001-20250210    clang-21
arm           randconfig-002-20250210    clang-21
arm           randconfig-003-20250210    clang-21
arm           randconfig-004-20250210    clang-21
arm                     rpc_defconfig    gcc-14.2.0
arm64                     allnoconfig    gcc-14.2.0
arm64                       defconfig    gcc-14.2.0
arm64         randconfig-001-20250210    clang-21
arm64         randconfig-002-20250210    clang-21
arm64         randconfig-003-20250210    clang-21
arm64         randconfig-004-20250210    clang-21
csky                     alldefconfig    gcc-14.2.0
csky                      allnoconfig    gcc-14.2.0
csky          randconfig-001-20250210    clang-21
csky          randconfig-002-20250210    clang-21
hexagon                   allnoconfig    gcc-14.2.0
hexagon       randconfig-001-20250210    clang-21
hexagon       randconfig-002-20250210    clang-21
i386                     allmodconfig    clang-19
i386                      allnoconfig    clang-19
i386                     allyesconfig    clang-19
i386                        defconfig    clang-19
i386          randconfig-011-20250210    gcc-12
i386          randconfig-012-20250210    gcc-12
i386          randconfig-013-20250210    gcc-12
i386          randconfig-014-20250210    gcc-12
i386          randconfig-015-20250210    gcc-12
i386          randconfig-016-20250210    gcc-12
i386          randconfig-017-20250210    gcc-12
loongarch                 allnoconfig    gcc-14.2.0
loongarch     randconfig-001-20250210    clang-21
loongarch     randconfig-002-20250210    clang-21
mips                   ip30_defconfig    gcc-14.2.0
nios2         randconfig-001-20250210    clang-21
nios2         randconfig-002-20250210    clang-21
openrisc                  allnoconfig    clang-21
openrisc                    defconfig    gcc-12
parisc                    allnoconfig    clang-21
parisc                      defconfig    gcc-12
parisc        randconfig-001-20250210    clang-21
parisc        randconfig-002-20250210    clang-21
powerpc                  allmodconfig    gcc-14.2.0
powerpc                   allnoconfig    clang-21
powerpc                  allyesconfig    clang-16
powerpc               eiger_defconfig    gcc-14.2.0
powerpc               holly_defconfig    gcc-14.2.0
powerpc          mpc885_ads_defconfig    gcc-14.2.0
powerpc       randconfig-001-20250210    clang-21
powerpc       randconfig-002-20250210    clang-21
powerpc       randconfig-003-20250210    clang-21
powerpc       randconfig-003-20250210    gcc-14.2.0
powerpc64     randconfig-001-20250210    clang-21
powerpc64     randconfig-001-20250210    gcc-14.2.0
powerpc64     randconfig-002-20250210    clang-21
powerpc64     randconfig-002-20250210    gcc-14.2.0
powerpc64     randconfig-003-20250210    clang-21
powerpc64     randconfig-003-20250210    gcc-14.2.0
riscv                     allnoconfig    clang-21
riscv                       defconfig    gcc-12
riscv            nommu_k210_defconfig    gcc-14.2.0
riscv         randconfig-001-20250210    clang-16
riscv         randconfig-002-20250210    clang-16
s390                     allmodconfig    gcc-14.2.0
s390                      allnoconfig    clang-21
s390                     allyesconfig    gcc-14.2.0
s390                        defconfig    gcc-12
s390          randconfig-001-20250210    clang-16
s390          randconfig-002-20250210    clang-16
sh                       allmodconfig    gcc-14.2.0
sh                       allyesconfig    gcc-14.2.0
sh                          defconfig    gcc-12
sh         kfr2r09-romimage_defconfig    gcc-14.2.0
sh                  lboxre2_defconfig    gcc-14.2.0
sh                  r7780mp_defconfig    gcc-14.2.0
sh            randconfig-001-20250210    clang-16
sh            randconfig-002-20250210    clang-16
sh                   se7751_defconfig    gcc-14.2.0
sparc                    allmodconfig    gcc-14.2.0
sparc         randconfig-001-20250210    clang-16
sparc         randconfig-002-20250210    clang-16
sparc64                     defconfig    gcc-12
sparc64       randconfig-001-20250210    clang-16
sparc64       randconfig-002-20250210    clang-16
um                        allnoconfig    clang-21
um                          defconfig    gcc-12
um                     i386_defconfig    gcc-12
um            randconfig-001-20250210    clang-16
um            randconfig-002-20250210    clang-16
um                   x86_64_defconfig    gcc-12
x86_64                    allnoconfig    clang-19
x86_64                   allyesconfig    clang-19
x86_64                      defconfig    clang-19
x86_64                          kexec    clang-19
x86_64        randconfig-001-20250210    clang-19
x86_64        randconfig-002-20250210    clang-19
x86_64        randconfig-003-20250210    clang-19
x86_64        randconfig-004-20250210    clang-19
x86_64        randconfig-005-20250210    clang-19
x86_64        randconfig-006-20250210    clang-19
x86_64        randconfig-007-20250210    clang-19
x86_64        randconfig-008-20250210    clang-19
x86_64        randconfig-071-20250210    gcc-12
x86_64        randconfig-072-20250210    gcc-12
x86_64        randconfig-073-20250210    gcc-12
x86_64        randconfig-074-20250210    gcc-12
x86_64        randconfig-075-20250210    gcc-12
x86_64        randconfig-076-20250210    gcc-12
x86_64        randconfig-077-20250210    gcc-12
x86_64        randconfig-078-20250210    gcc-12
x86_64                       rhel-9.4    clang-19
xtensa        randconfig-001-20250210    clang-16
xtensa        randconfig-002-20250210    clang-16

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

