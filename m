Return-Path: <linuxppc-dev+bounces-2339-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8A09A1ECC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 11:47:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTjfy2zFsz3bcy;
	Thu, 17 Oct 2024 20:47:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729158442;
	cv=none; b=h3b0kgZZgoYRCVgHgY/z3yS8lLtYsRBg4j74pdzf6KG2at9uP9XYCzw7a/TjaNoPsPlYV+Khx2Bw73OeqBgeaNL20lHxk62WUWlWSqDGGrbUeyPfj5wyskYVv/kLSFlb8MmcyEbcwIRxv7CuASm+8e9wjGJJNrF/tSjn98Udns57OqxkZzzbdNKFA9C1GdL5IWbLYdHcKc0JmXZHTLKVvwtgvDE7lZh8ELTeoWjBRAxIb9251MLWq2xY3s6p5Wzcy7iWki5NS9Z7pg9oSjmejjYuB318wt1iaJFhICtEV2fY+MJ2aaSgkv+PcDC6VIkxoK5uDGgRRWb8EYKsXzcLww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729158442; c=relaxed/relaxed;
	bh=GkYBjXq2N82bpSFi37zDwRag0AAj6URE7VcOWvSvFTY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XmwyA+oOUKr2zOmwbaPG/ftQVRgLL6vV/l+psvaNgWbHonCeTS7hPgmSX9ez9YaTqg5OTKuzGqoW09WspONnnqGb79MPpBcEMNPlorblS9ud7w0UfIGZvoWqoAlB1p2+GaApDzegO9HxmeX0EuUwrQoxmYEmn7vvQxtqZLogVaEG4G2VrmRiKNBQgQGjJTcKB22m87RltzRfIa1aZ6vbwA0YiFrqxZd8NlaqpmDjh5fw7H2+Om2qL5h5xTYkPSY6x22Lk4xCwfjdv2CY+ZbwBEgbZTAc1l44ZrMexMaAw+FnStO+AIwSdswTNEwBKJ3vkFfprUz5UMt5beGicymUvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lWlrs5F/; dkim-atps=neutral; spf=pass (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lWlrs5F/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTjfv0QRrz3bcP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 20:47:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729158440; x=1760694440;
  h=date:from:to:cc:subject:message-id;
  bh=1krwuzNi5X1Yc8YwSBfN2yM4vxqqAJOVs9T05UIl0qw=;
  b=lWlrs5F/Wavu3OoIfwL7bHvN3PXqE+r78Q0flu8HKBl9M1mLfEU1psCC
   VGm7SyKxXgw+711hk0hBW1XJn5GBD1xjbu+/YcqBPO4I9VfFnNGqfRmdd
   VN5ytLd6x7msZv4cMsoKtmQwHM60QtPz1lnQ9g6rXyMQJt+2W+Cz6tL9w
   ZOoBNh26J5h6+Safr3MYMjr4UdID3saEQB7G32qd+5yMtiDLhA8vWMz7m
   tDWLgjPgNm3Lz3Z0wJxldqcPP59CP/+l1HAQr977U2D0/9uK0jWcdl4Fk
   BLUVWXYGI3qmKHusr+LDIW/FzL1L0vVTkjbYlsvZO8ShOe+QU5keTpTeg
   w==;
X-CSE-ConnectionGUID: I+COAlW4SB2rJR1DnjrZ0Q==
X-CSE-MsgGUID: MDx87OjMS9OgWJ8VVLaouQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28734372"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28734372"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 02:47:13 -0700
X-CSE-ConnectionGUID: FYxJIDufTgKuxZiFLlpvhQ==
X-CSE-MsgGUID: atYvZPYqR3ilTdqlhd7szA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78521719"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Oct 2024 02:47:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1N65-000M8N-2I;
	Thu, 17 Oct 2024 09:47:09 +0000
Date: Thu, 17 Oct 2024 17:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:fixes-test] BUILD SUCCESS
 cf8989d20d64ad702a6210c11a0347ebf3852aa7
Message-ID: <202410171701.yP3dO7vk-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: cf8989d20d64ad702a6210c11a0347ebf3852aa7  powerpc/powernv: Free name on error in opal_event_init()

elapsed time: 1296m

configs tested: 106
configs skipped: 151

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                              allyesconfig    clang-20
arc                            hsdk_defconfig    gcc-14.1.0
arc                    vdk_hs38_smp_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                              allyesconfig    clang-20
arm                         axm55xx_defconfig    gcc-14.1.0
arm                            mmp2_defconfig    gcc-14.1.0
arm                       spear13xx_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
hexagon                          allmodconfig    clang-20
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241017    clang-18
i386        buildonly-randconfig-002-20241017    clang-18
i386        buildonly-randconfig-003-20241017    clang-18
i386        buildonly-randconfig-004-20241017    clang-18
i386        buildonly-randconfig-005-20241017    clang-18
i386        buildonly-randconfig-006-20241017    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241017    clang-18
i386                  randconfig-002-20241017    clang-18
i386                  randconfig-003-20241017    clang-18
i386                  randconfig-004-20241017    clang-18
i386                  randconfig-005-20241017    clang-18
i386                  randconfig-006-20241017    clang-18
i386                  randconfig-011-20241017    clang-18
i386                  randconfig-012-20241017    clang-18
i386                  randconfig-013-20241017    clang-18
i386                  randconfig-014-20241017    clang-18
i386                  randconfig-015-20241017    clang-18
i386                  randconfig-016-20241017    clang-18
loongarch                        allmodconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                       bvme6000_defconfig    gcc-14.1.0
m68k                        m5407c3_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                           ip28_defconfig    gcc-14.1.0
mips                          rb532_defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                      rts7751r2d1_defconfig    gcc-14.1.0
sh                             sh03_defconfig    gcc-14.1.0
sh                   sh7724_generic_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241017    gcc-12
x86_64      buildonly-randconfig-002-20241017    gcc-12
x86_64      buildonly-randconfig-003-20241017    gcc-12
x86_64      buildonly-randconfig-004-20241017    gcc-12
x86_64      buildonly-randconfig-005-20241017    gcc-12
x86_64      buildonly-randconfig-006-20241017    gcc-12
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241017    gcc-12
x86_64                randconfig-002-20241017    gcc-12
x86_64                randconfig-003-20241017    gcc-12
x86_64                randconfig-004-20241017    gcc-12
x86_64                randconfig-005-20241017    gcc-12
x86_64                randconfig-006-20241017    gcc-12
x86_64                randconfig-011-20241017    gcc-12
x86_64                randconfig-012-20241017    gcc-12
x86_64                randconfig-013-20241017    gcc-12
x86_64                randconfig-014-20241017    gcc-12
x86_64                randconfig-015-20241017    gcc-12
x86_64                randconfig-016-20241017    gcc-12
x86_64                randconfig-071-20241017    gcc-12
x86_64                randconfig-072-20241017    gcc-12
x86_64                randconfig-073-20241017    gcc-12
x86_64                randconfig-074-20241017    gcc-12
x86_64                randconfig-075-20241017    gcc-12
x86_64                randconfig-076-20241017    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                         virt_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

