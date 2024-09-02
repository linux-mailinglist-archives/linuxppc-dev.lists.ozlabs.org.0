Return-Path: <linuxppc-dev+bounces-852-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA95967D37
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 03:08:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WxrHF1zKlz2y8t;
	Mon,  2 Sep 2024 11:08:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725239321;
	cv=none; b=oGk8CI3Ni+1luVw1byRxtUhYV2CI62s8ZRX3Y8v/Yd/PStxX/l/VehRQCYQ/CQH/cUJr6zViDe7yn+Y5pgbpG/HNU2AymjiO4W4EfgfcegBLHHZ4iVpyD+L+QriEBzuqx3UGlZ2EZtB09TjqFSsAPJnfPFj6w7liQgBLCLhzrz+jIA4zm4hxXu6Wq/Y0etZLna0sBdDDI7475hf9CHz02s2gG6FQ++tTt43zZFdZunL5eF4VOrxpGB2czhRfdJ/7LJRzZyjbtgpuabIbAJfyWh8tOmlB85S/rnH0sbdr1+z1kXh8zxHqKi5hunLORBr03H1NixTx9ANYc9b+v7uTdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725239321; c=relaxed/relaxed;
	bh=H01vllS/7ztfIMOHn6VdvBKIOOVEkfm9NIFYHCGc5I0=;
	h=DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-IronPort-AV:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:User-Agent; b=CoWHwvEwuOli/eQNmwx7aY24wHaYsLj1sxMmQVM4tnmqVnUh12J30vAZHEpIBewGK4dNsXJeUakaqQzvt8rS38Mo66YWRg0zNRKPV+gCjqcwP+Y4jMpJc4RUagf7WQ0Yo8dz14hbDIQMzc0esSTzwXF18GDsjcapPsajMOy2BKSNdGNjxRQ0vNopqrWs/YFjYww/c19mLgK6IkGqkm9l07ZtdPSgy0nG6WxayE3eQ1KCXcSyWoj/UALyZ3eHBvbeU85O5Kz3urx8fm+aTJcJ4F2ntEu7k/mTRFp3QYmFzjBYMUwj8dUJAvLkneIi56QUhRqKJH89Lh7Mhm8NxeZFdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bq6gS4//; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bq6gS4//;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WxrHC2Jy7z2xxm
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 11:08:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725239320; x=1756775320;
  h=date:from:to:cc:subject:message-id;
  bh=laJTcMC/FzZVhjz/uxZb9Asa2+3Mq2ffH0lot5j5hqA=;
  b=Bq6gS4//RdM66O7ldlCIjofPaI/riW9cmK/YvXUxkECuuWYYvT7jJqCe
   Jsg6kXo9F/qFYJxg4P2RLRGZkgDZbjpz7syNghWk2wXlCCzPg+TLk5Y1K
   RZ+IpCtWow5EbcjcZ5dnmRZJQVDj7VCvIdI3cYxAIivjx1nTnCL9EKUU8
   B6n/IVx9TSh7vkdG39DVfq2E109L82gw1ipm+u8LMl36gFE+vf0+Qg98a
   vZyoYATF5lCmTuRD4zxDqpsp2cnqmBeK/E4bFMgiehzpxHBhlTwWVM3Ha
   I3/m8zzIXtGHElH+nT4qJl2dqbP0XcJL6JEHXDsQn7EbXBONvR68pvvKH
   Q==;
X-CSE-ConnectionGUID: J3jeYmLMRB26eWWjivjtuA==
X-CSE-MsgGUID: GrMq+t6XQea8VX4QcyLi4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="41287645"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="41287645"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 18:08:33 -0700
X-CSE-ConnectionGUID: AuTZNSSiTi+dZ65QMqie5A==
X-CSE-MsgGUID: oHyBDgLoRfal688ClOHZ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="69348089"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Sep 2024 18:08:32 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skvYT-000516-2r;
	Mon, 02 Sep 2024 01:08:29 +0000
Date: Mon, 02 Sep 2024 09:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next-test] BUILD SUCCESS
 087c25f837f4fc43a78b08b3b2be9f41b17adb5d
Message-ID: <202409020901.r9NRCzNJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 087c25f837f4fc43a78b08b3b2be9f41b17adb5d  powerpc: Replace kretprobe code with rethook on powerpc

elapsed time: 767m

configs tested: 106
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                      axs103_smp_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-14.1.0
arc                     nsimosci_hs_defconfig   gcc-13.2.0
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                       aspeed_g4_defconfig   gcc-14.1.0
arm                                 defconfig   gcc-14.1.0
arm                         mv78xx0_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                                defconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386                                defconfig   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
m68k                            q40_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                          ath79_defconfig   gcc-14.1.0
mips                        bcm63xx_defconfig   gcc-14.1.0
mips                  cavium_octeon_defconfig   gcc-13.2.0
mips                        maltaup_defconfig   gcc-14.1.0
mips                           mtx1_defconfig   gcc-13.2.0
mips                        omega2p_defconfig   gcc-13.2.0
nios2                         3c120_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
openrisc                    or1ksim_defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc64                            defconfig   gcc-14.1.0
powerpc                    adder875_defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                   currituck_defconfig   gcc-14.1.0
powerpc                       maple_defconfig   gcc-13.2.0
powerpc                     mpc5200_defconfig   gcc-14.1.0
powerpc                    socrates_defconfig   gcc-13.2.0
powerpc                    socrates_defconfig   gcc-14.1.0
powerpc                     stx_gp3_defconfig   gcc-14.1.0
powerpc                     tqm8540_defconfig   gcc-13.2.0
powerpc                     tqm8548_defconfig   gcc-14.1.0
powerpc                      tqm8xx_defconfig   gcc-14.1.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                            migor_defconfig   gcc-13.2.0
sh                           se7780_defconfig   gcc-13.2.0
sh                           sh2007_defconfig   gcc-13.2.0
sh                   sh7724_generic_defconfig   gcc-13.2.0
sh                  sh7785lcr_32bit_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                               alldefconfig   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                             i386_defconfig   gcc-13.2.0
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                    xip_kc705_defconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

