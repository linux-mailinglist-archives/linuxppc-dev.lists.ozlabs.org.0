Return-Path: <linuxppc-dev+bounces-3080-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFDE9C3564
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2024 01:38:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XmrJK6Qshz2xxt;
	Mon, 11 Nov 2024 11:38:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731285521;
	cv=none; b=IW7mdqo5i3k41BKbSUDRQXShYOETK4JMUenLl+xACnanffFei930soRxKLY7m3Lf6gdBIhB8U6I+FQn5+5EX+kIzRW3zDQD4jqtvQ3DF+83OGhdQMOtI4wRNGsHEto6jcocsDaYti5cP5JYiTqUnzZMr4fpRZzxISWqcaHVguRL6WhhEFOOeo0ZZRAZ5O/c75JQFSd3/6kfvLQqLtW+v1N/YmfTblf/2zaOPnlazwsPgvB5kv4jK4cT7At7cD/NZaz5qxXHqXy2D2UVVrG7LtLYyukgVbwUnzmTsWpnQmKzfUEbkFLl6Hg4i1dIzEUjmByY94PyOmvkWgPrR6kag4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731285521; c=relaxed/relaxed;
	bh=bZNY7NO3jeIFlcrHu6wFsF6h/CM9hpwQuZb/k4p1/Do=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ha1RLhMzwbTNNiCOHsyKOXEJNexNl8B9rxpyVjzPztNkNFlswx4EJZNsJ5DylDBVgzPdsJdvOMTTg7OD9NABG1IBrUig7NvQIX6tq9ymhow+tsJVQ47uxbFwBJI7TKo8oOkzHeZdOk3svObBx3JzB2k2mokv65BJ5Mnk05Al3p/Ranac+XyV5NDQI0stChTJpPrcU5v/kDG1J4jfW/bTq9An2dkKY9D8T6iYh9FzS5pWIiTcHNl9mhi/b+DTJYqsZIw4nSkfI44LF1lug/+1ACGpQlfzxNI+kxWBBC/n+vj+DmXM+RSxqewVHQN7puzStH0E9S05EtTzbDX2XmAsGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bq+vu0Ht; dkim-atps=neutral; spf=pass (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bq+vu0Ht;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XmrJG5W8Lz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 11:38:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731285519; x=1762821519;
  h=date:from:to:cc:subject:message-id;
  bh=b4Oxb8OPS/ioMjBHvOrUzoIoJRroqjwP3sfH0x+qgKk=;
  b=bq+vu0HtWuMsKANXpZNNrP19BVTnJ2D88FzvkLYPv9lL+zYvA4LFQvGP
   HPJFS2Zgz2MTzk9Y5iw9ewmKrSbR8B23iBViJJBqW5knj7hzQCWkTsyy0
   0yKM6bRmSQu3c8MPm/SnyBfBE3wYvfPkxgEM6AEyTJsfaISntpJeO/o6I
   o6f96G4gILfXD9O765Br70Dsd3WBJN5SpM/a5mPU4VzsE9fAHv+bQIOSn
   Yvllg8/bjw7cAo2G/BgoHpOPovUX+FgLPlMjsnkKpZrMU2SC6HQiVzfhe
   UsJyonPVw2ILHzHQ5KTnCnFC6ZoT4xtoVKFF8UPjoMv+AVsNqwN/S8XTI
   w==;
X-CSE-ConnectionGUID: BKS3wYBKTMyEvXll/LAhwA==
X-CSE-MsgGUID: Kr+4/DAzQ1+4CDz82RinZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31250851"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31250851"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 16:38:33 -0800
X-CSE-ConnectionGUID: +VRsvsXnTjmj+/zcbYl3yg==
X-CSE-MsgGUID: dP+dS2nbQZmsFcX7LqR+TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="87097437"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Nov 2024 16:38:05 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAIRP-0000Vk-1D;
	Mon, 11 Nov 2024 00:38:03 +0000
Date: Mon, 11 Nov 2024 08:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next] BUILD SUCCESS
 5b881c1f83792f5db421124171b06f1b8f1fe075
Message-ID: <202411110840.qdg5wk86-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 5b881c1f83792f5db421124171b06f1b8f1fe075  powerpc/irq: use seq_put_decimal_ull_width() for decimal values

elapsed time: 725m

configs tested: 330
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                          axs103_defconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    clang-15
arc                   randconfig-001-20241110    gcc-13.2.0
arc                   randconfig-001-20241111    gcc-14.2.0
arc                   randconfig-002-20241110    gcc-13.2.0
arc                   randconfig-002-20241111    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                          ep93xx_defconfig    gcc-14.2.0
arm                        keystone_defconfig    clang-20
arm                         lpc18xx_defconfig    clang-15
arm                   randconfig-001-20241110    clang-20
arm                   randconfig-001-20241111    gcc-14.2.0
arm                   randconfig-002-20241110    gcc-14.2.0
arm                   randconfig-002-20241111    gcc-14.2.0
arm                   randconfig-003-20241110    gcc-14.2.0
arm                   randconfig-003-20241111    gcc-14.2.0
arm                   randconfig-004-20241110    clang-20
arm                   randconfig-004-20241111    gcc-14.2.0
arm                         socfpga_defconfig    clang-20
arm                          sp7021_defconfig    clang-20
arm                           stm32_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241110    gcc-14.2.0
arm64                 randconfig-001-20241111    gcc-14.2.0
arm64                 randconfig-002-20241110    gcc-14.2.0
arm64                 randconfig-002-20241111    gcc-14.2.0
arm64                 randconfig-003-20241110    gcc-14.2.0
arm64                 randconfig-003-20241111    gcc-14.2.0
arm64                 randconfig-004-20241110    gcc-14.2.0
arm64                 randconfig-004-20241111    gcc-14.2.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241110    gcc-14.2.0
csky                  randconfig-001-20241111    gcc-14.2.0
csky                  randconfig-002-20241110    gcc-14.2.0
csky                  randconfig-002-20241111    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241110    clang-20
hexagon               randconfig-001-20241111    gcc-14.2.0
hexagon               randconfig-002-20241110    clang-20
hexagon               randconfig-002-20241111    gcc-14.2.0
i386                             alldefconfig    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241110    gcc-11
i386        buildonly-randconfig-001-20241111    gcc-11
i386        buildonly-randconfig-002-20241110    gcc-11
i386        buildonly-randconfig-002-20241110    gcc-12
i386        buildonly-randconfig-002-20241111    gcc-11
i386        buildonly-randconfig-003-20241110    clang-19
i386        buildonly-randconfig-003-20241110    gcc-11
i386        buildonly-randconfig-003-20241111    gcc-11
i386        buildonly-randconfig-004-20241110    gcc-11
i386        buildonly-randconfig-004-20241111    gcc-11
i386        buildonly-randconfig-005-20241110    gcc-11
i386        buildonly-randconfig-005-20241110    gcc-12
i386        buildonly-randconfig-005-20241111    gcc-11
i386        buildonly-randconfig-006-20241110    gcc-11
i386        buildonly-randconfig-006-20241110    gcc-12
i386        buildonly-randconfig-006-20241111    gcc-11
i386                                defconfig    clang-19
i386                  randconfig-001-20241110    gcc-11
i386                  randconfig-001-20241110    gcc-12
i386                  randconfig-001-20241111    gcc-11
i386                  randconfig-002-20241110    clang-19
i386                  randconfig-002-20241110    gcc-11
i386                  randconfig-002-20241111    gcc-11
i386                  randconfig-003-20241110    gcc-11
i386                  randconfig-003-20241110    gcc-12
i386                  randconfig-003-20241111    gcc-11
i386                  randconfig-004-20241110    clang-19
i386                  randconfig-004-20241110    gcc-11
i386                  randconfig-004-20241111    gcc-11
i386                  randconfig-005-20241110    gcc-11
i386                  randconfig-005-20241110    gcc-12
i386                  randconfig-005-20241111    gcc-11
i386                  randconfig-006-20241110    gcc-11
i386                  randconfig-006-20241110    gcc-12
i386                  randconfig-006-20241111    gcc-11
i386                  randconfig-011-20241110    clang-19
i386                  randconfig-011-20241110    gcc-11
i386                  randconfig-011-20241111    gcc-11
i386                  randconfig-012-20241110    gcc-11
i386                  randconfig-012-20241110    gcc-12
i386                  randconfig-012-20241111    gcc-11
i386                  randconfig-013-20241110    gcc-11
i386                  randconfig-013-20241110    gcc-12
i386                  randconfig-013-20241111    gcc-11
i386                  randconfig-014-20241110    gcc-11
i386                  randconfig-014-20241110    gcc-12
i386                  randconfig-014-20241111    gcc-11
i386                  randconfig-015-20241110    gcc-11
i386                  randconfig-015-20241110    gcc-12
i386                  randconfig-015-20241111    gcc-11
i386                  randconfig-016-20241110    clang-19
i386                  randconfig-016-20241110    gcc-11
i386                  randconfig-016-20241111    gcc-11
loongarch                        alldefconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241110    gcc-14.2.0
loongarch             randconfig-001-20241111    gcc-14.2.0
loongarch             randconfig-002-20241110    gcc-14.2.0
loongarch             randconfig-002-20241111    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    clang-20
m68k                                defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    clang-20
m68k                        m5407c3_defconfig    clang-15
m68k                           sun3_defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    gcc-14.2.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
microblaze                      mmu_defconfig    clang-15
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    gcc-14.2.0
mips                       bmips_be_defconfig    clang-15
mips                         db1xxx_defconfig    clang-20
mips                           ip22_defconfig    gcc-14.2.0
mips                           ip32_defconfig    clang-15
mips                     loongson1b_defconfig    clang-15
mips                      maltaaprp_defconfig    gcc-14.2.0
mips                        maltaup_defconfig    clang-15
mips                       rbtx49xx_defconfig    clang-20
mips                        vocore2_defconfig    clang-15
mips                           xway_defconfig    clang-20
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241110    gcc-14.2.0
nios2                 randconfig-001-20241111    gcc-14.2.0
nios2                 randconfig-002-20241110    gcc-14.2.0
nios2                 randconfig-002-20241111    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241110    gcc-14.2.0
parisc                randconfig-001-20241111    gcc-14.2.0
parisc                randconfig-002-20241110    gcc-14.2.0
parisc                randconfig-002-20241111    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    amigaone_defconfig    clang-20
powerpc                     asp8347_defconfig    gcc-14.2.0
powerpc                      chrp32_defconfig    clang-15
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                    gamecube_defconfig    clang-15
powerpc                 mpc834x_itx_defconfig    clang-15
powerpc                 mpc834x_itx_defconfig    gcc-14.2.0
powerpc                 mpc837x_rdb_defconfig    clang-20
powerpc                      pcm030_defconfig    clang-20
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241110    gcc-14.2.0
powerpc               randconfig-001-20241111    gcc-14.2.0
powerpc               randconfig-002-20241110    gcc-14.2.0
powerpc               randconfig-002-20241111    gcc-14.2.0
powerpc               randconfig-003-20241110    clang-20
powerpc               randconfig-003-20241111    gcc-14.2.0
powerpc                  storcenter_defconfig    clang-15
powerpc                     stx_gp3_defconfig    gcc-14.2.0
powerpc                     taishan_defconfig    gcc-14.2.0
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241110    clang-20
powerpc64             randconfig-001-20241111    gcc-14.2.0
powerpc64             randconfig-002-20241110    gcc-14.2.0
powerpc64             randconfig-002-20241111    gcc-14.2.0
powerpc64             randconfig-003-20241110    clang-16
powerpc64             randconfig-003-20241111    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-20
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    clang-20
riscv                 randconfig-001-20241110    gcc-14.2.0
riscv                 randconfig-001-20241111    gcc-14.2.0
riscv                 randconfig-002-20241110    gcc-14.2.0
riscv                 randconfig-002-20241111    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-20
s390                                defconfig    gcc-12
s390                  randconfig-001-20241110    gcc-14.2.0
s390                  randconfig-001-20241111    gcc-14.2.0
s390                  randconfig-002-20241110    gcc-14.2.0
s390                  randconfig-002-20241111    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                          polaris_defconfig    clang-15
sh                    randconfig-001-20241110    gcc-14.2.0
sh                    randconfig-001-20241111    gcc-14.2.0
sh                    randconfig-002-20241110    gcc-14.2.0
sh                    randconfig-002-20241111    gcc-14.2.0
sh                          rsk7264_defconfig    gcc-14.2.0
sh                           se7705_defconfig    clang-20
sh                           se7751_defconfig    clang-15
sh                           sh2007_defconfig    gcc-14.2.0
sh                  sh7785lcr_32bit_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20241110    gcc-14.2.0
sparc64               randconfig-001-20241111    gcc-14.2.0
sparc64               randconfig-002-20241110    gcc-14.2.0
sparc64               randconfig-002-20241111    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241110    gcc-12
um                    randconfig-001-20241111    gcc-14.2.0
um                    randconfig-002-20241110    clang-14
um                    randconfig-002-20241111    gcc-14.2.0
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
um                           x86_64_defconfig    gcc-14.2.0
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241110    clang-19
x86_64      buildonly-randconfig-001-20241110    gcc-12
x86_64      buildonly-randconfig-002-20241110    gcc-12
x86_64      buildonly-randconfig-003-20241110    clang-19
x86_64      buildonly-randconfig-003-20241110    gcc-12
x86_64      buildonly-randconfig-004-20241110    gcc-12
x86_64      buildonly-randconfig-005-20241110    gcc-12
x86_64      buildonly-randconfig-006-20241110    clang-19
x86_64      buildonly-randconfig-006-20241110    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241110    gcc-12
x86_64                randconfig-002-20241110    clang-19
x86_64                randconfig-002-20241110    gcc-12
x86_64                randconfig-003-20241110    gcc-12
x86_64                randconfig-004-20241110    gcc-12
x86_64                randconfig-005-20241110    clang-19
x86_64                randconfig-005-20241110    gcc-12
x86_64                randconfig-006-20241110    clang-19
x86_64                randconfig-006-20241110    gcc-12
x86_64                randconfig-011-20241110    gcc-12
x86_64                randconfig-012-20241110    gcc-12
x86_64                randconfig-013-20241110    gcc-12
x86_64                randconfig-014-20241110    clang-19
x86_64                randconfig-014-20241110    gcc-12
x86_64                randconfig-015-20241110    gcc-12
x86_64                randconfig-016-20241110    gcc-12
x86_64                randconfig-071-20241110    clang-19
x86_64                randconfig-071-20241110    gcc-12
x86_64                randconfig-072-20241110    gcc-12
x86_64                randconfig-073-20241110    gcc-12
x86_64                randconfig-074-20241110    gcc-12
x86_64                randconfig-075-20241110    gcc-11
x86_64                randconfig-075-20241110    gcc-12
x86_64                randconfig-076-20241110    clang-19
x86_64                randconfig-076-20241110    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-14.2.0
xtensa                       common_defconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241110    gcc-14.2.0
xtensa                randconfig-001-20241111    gcc-14.2.0
xtensa                randconfig-002-20241110    gcc-14.2.0
xtensa                randconfig-002-20241111    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

