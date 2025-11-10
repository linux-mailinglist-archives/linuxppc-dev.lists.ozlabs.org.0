Return-Path: <linuxppc-dev+bounces-14010-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA529C46ECD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 14:34:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4rJ05ZbRz2xqZ;
	Tue, 11 Nov 2025 00:34:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762781696;
	cv=none; b=IeypCvZT8/3CVhlKC7M5jtIzxQgXJRWXbj/dD+17MkiVqKYAlq5E5f178OyPxK82UhLy/W8XTCtDIGKXie9g26V+XjHOEPoC2YqxWSDdYyzpS3ExewUxu20GI5EuQd13MAn0TvKXKyPeqFTpaoJvfnwEYtOwKwNI99eCyJvmkSMs5mIdpboI4mU4dshnl96U2Zt9w+Ny7cDKcg8r0rsiRRpIdTFRAAHFl/zlst01F7jvrDNzpnISdfv+pd5sEmyzfCQO8Yvb7gh5fNbbODcdfP446m+5CGWLBBDEqUAFLlkLIz7U+CP6K5lv/8F8/TXA7fVhTOqtFmRWFCP6t13cbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762781696; c=relaxed/relaxed;
	bh=shC1Nztt1uP9RkUsjuMyV1/zqopJXCF8SQBqEZp6MqY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RmTMGUjQJ4C9kUpADJX5qUSLKemW0Lq6nmDLOHptoT8/04zqEQfDM2AuFVjD8PUwFiETGGKw+Xn9CccEL7YRwOHlVWEkU50Spud7zF6TpxOV0YdjAZATcixsUQLXdunwJOSnPrPA4qjFWo3jL7H8AgJ3LFSXqMM88dTmfoEeh9R+9KuHubKYJZA3+ksP8QTeI65LaIZzYoAFz3YB2NURZHM4GQ/m5wvZTQjnv+IDHb1lRde6Wz9vxfc1dyNDkJzWv5gjTiZ37krkS1Jaz3aMzOFzUI+wcdJ+NlrlIaL/5O3TlEa1acCmquJovPwZh8bpy9lbS+vGt8hpWQ4nvmyJLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gde5P61S; dkim-atps=neutral; spf=pass (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gde5P61S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4rHx6HWRz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 00:34:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762781694; x=1794317694;
  h=date:from:to:cc:subject:message-id;
  bh=dFMVwLA+GNo5nONQrHMph/WOiR/PUlH/z6BxNBqdCvs=;
  b=Gde5P61SDts31AbZNfRwLEsf+bGqmKVWyEYnYjnkRWT0REnr6GqRNKRc
   AiKkHv+KyxreKUUFwbNpkFf6fBH0Q/Cu7TDNbyMXxrAdOh9BqwOnZtdtM
   O1e+SbFHBqvVspzc9UNYuq9sMuQmnznixqZ6HG36zkOB0PlV2MuGsUOmz
   omPtRjj5qLeqb3aYYTrLrmPUgkVFlQuiX5iHaG5j4oTVJStte2tijk+VQ
   Qd3mef8HBu/5dqBcsxIsM5GsuQ8HCidbNNlzhvjlPk7yyFVruoKfw2d/7
   x3OAvg1ykSZ/fzrVu41b8CbsyAapKuAv24pzbeWJ7609AvsTzgyKEy3ZU
   g==;
X-CSE-ConnectionGUID: OsXxo3dhQzCSkBrbmBFV4Q==
X-CSE-MsgGUID: WtGK6GS0Tp2/Bf64RzNdAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64037153"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64037153"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 05:34:49 -0800
X-CSE-ConnectionGUID: q37GyQLoT32xALWNKkNIbg==
X-CSE-MsgGUID: iNqESZ5YQG2GHbMbhyJmqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="219331617"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Nov 2025 05:34:48 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIS2f-0000TJ-1y;
	Mon, 10 Nov 2025 13:34:45 +0000
Date: Mon, 10 Nov 2025 21:33:59 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 e651f06871db048f84f90710508e2fe671c23f5f
Message-ID: <202511102154.Uzl42whC-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: e651f06871db048f84f90710508e2fe671c23f5f  powerpc/ci: Add ppce500 machine to kernel+qemu workflows

elapsed time: 2901m

configs tested: 60
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc         randconfig-001-20251109    gcc-12.5.0
arc         randconfig-002-20251109    gcc-8.5.0
arm                     allnoconfig    clang-22
arm         randconfig-001-20251109    clang-16
arm         randconfig-002-20251109    clang-22
arm         randconfig-003-20251109    clang-22
arm         randconfig-004-20251109    gcc-8.5.0
arm64                   allnoconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-22
hexagon                allyesconfig    clang-22
hexagon     randconfig-001-20251108    clang-22
hexagon     randconfig-002-20251108    clang-22
i386                    allnoconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
loongarch   randconfig-001-20251108    gcc-12.5.0
loongarch   randconfig-002-20251108    gcc-12.5.0
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    gcc-15.1.0
microblaze             allmodconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
nios2                   allnoconfig    gcc-11.5.0
nios2       randconfig-001-20251108    gcc-8.5.0
nios2       randconfig-002-20251108    gcc-9.5.0
openrisc                allnoconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc      randconfig-001-20251109    gcc-9.5.0
parisc      randconfig-002-20251109    gcc-13.4.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc     randconfig-001-20251109    clang-22
powerpc     randconfig-002-20251109    clang-22
powerpc64   randconfig-001-20251109    gcc-8.5.0
powerpc64   randconfig-002-20251109    gcc-8.5.0
riscv                   allnoconfig    gcc-15.1.0
riscv       randconfig-001-20251108    clang-19
riscv       randconfig-002-20251108    gcc-12.5.0
s390                    allnoconfig    clang-22
s390        randconfig-001-20251108    clang-22
sh                      allnoconfig    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    gcc-14
x86_64                  allnoconfig    clang-20
x86_64                        kexec    clang-20
x86_64                     rhel-9.4    clang-20
x86_64                 rhel-9.4-bpf    gcc-14
x86_64                rhel-9.4-func    clang-20
x86_64          rhel-9.4-kselftests    clang-20
x86_64               rhel-9.4-kunit    gcc-14
x86_64                 rhel-9.4-ltp    gcc-14
xtensa                  allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

