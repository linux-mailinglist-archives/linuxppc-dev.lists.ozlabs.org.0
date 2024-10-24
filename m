Return-Path: <linuxppc-dev+bounces-2536-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D567A9ADB19
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 06:44:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYtcY70NWz2yMt;
	Thu, 24 Oct 2024 15:44:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729745085;
	cv=none; b=cSuPdFLBnbw8bgY+eoySgUip85kQBTi2DsFBqfb+IVylheaANixhvVNIWnIl8p7i19wMwtgrtuRYqKnQ8a2OqaJDIOy7XOJxtM4wuWMCUMdxvVw6YjFLtmvD/ssOMP3EDCIdcGgAlBVnumtH4ae7AsKIEArPn5lnL/uPGz5VK7zgPzABGzmT61UfPCFYH7HeBDkxbw5QNuRcQWKYSlbzOhz5MZCg/IwohB7e9aI5iZabXa4ZaeFqiGGJzur6qCFsqkHOhngT3Q7EavwXmSjtY/hSaFtociVfOe9/s1sQUV2d5KJclSigs6tBBX/0Nb4kKxwJt8CmYiBz+2yK4CCxcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729745085; c=relaxed/relaxed;
	bh=e47vuNkgUQeyDBjn/s7Wd4sH9r+wla9A5YMiPpwqSRM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AlX2LiMgLB+gxocYkTvFEtNMozSjAeEwH/qEvQQ0J0ksPE7sLp0A7fzvemjzZu9qvgsTtq3bwTg91wvOTSPuJSqmbTscNiwnAJMXI78Dj3NfyU42Ap7ReO2YPN9MVUAdZEnZyK1CRxM8+UHPYxeMc7Zcz0pFDZ5vVAYqU6FQcgMMr8dJqLVYaR8CffpfoO3BdaoPVo19rbnojXhl+/eOnftDRe17yXJMhKC4IFuRZ3jZ+tGCur4347MrjVNgDEjPoAP7UAWrctXGluRrWh7VPE5YPtJ5QVHoGtLbO4QfgyrpouTE8gKW83P86FfBzffjIV8wFRizEQP+0csxeJ+5NA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DPyFS/KZ; dkim-atps=neutral; spf=pass (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DPyFS/KZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYtcV50Wwz2yF4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 15:44:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729745083; x=1761281083;
  h=date:from:to:cc:subject:message-id;
  bh=vAs8zQ/yI1OtiDX2MQP2VnajenVQDJPUhmdecfk7wo8=;
  b=DPyFS/KZCbxYMBdZYXhq45LBTwCTSUetT3gQloZ9cj8tpf7Lf8W2JtcT
   F6K80hM2GLN5H8rszVZMmHc4Qqw2IlmSgSW5WuOkeizAbzdAtTel6HLrZ
   2goarxh9VAi6s6H6dM/hy9HV8oNaTU0cNA4FXY2PKp4vQkqqrLc0uEnT0
   OIZzWxLHJo1zS0ac+MxP6pBMBI4W1DsIkh4SKNeFnXmTJGYhFrzGK1Qp/
   5whpoC4cVMfxPiSZhHD5RkXGFyd1CABTm51selAoML3Wt9D5/uWxGbqFP
   +aRlhuEkMqstwhvP0hw49yYBApKCztSSIz/IZf+BM5GnlJZa1VgP412jM
   g==;
X-CSE-ConnectionGUID: YsJH0aMsRq2Y0hotmAbgfA==
X-CSE-MsgGUID: sMT1MWX5Q3aln2Ysq2J/fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="33161992"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="33161992"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 21:44:36 -0700
X-CSE-ConnectionGUID: CA+n4cabR2+BvxtDheklKg==
X-CSE-MsgGUID: MD4yxpZ+SfW7LJBq3eDv3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="85262239"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Oct 2024 21:44:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3pi4-000Vx8-18;
	Thu, 24 Oct 2024 04:44:32 +0000
Date: Thu, 24 Oct 2024 12:43:57 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next-test] BUILD SUCCESS
 bee08a9e6ab03caf14481d97b35a258400ffab8f
Message-ID: <202410241249.qgfChKuH-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
branch HEAD: bee08a9e6ab03caf14481d97b35a258400ffab8f  powerpc: Adjust adding stack protector flags to KBUILD_CLAGS for clang

elapsed time: 1095m

configs tested: 98
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                    vdk_hs38_smp_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                        spear3xx_defconfig    gcc-14.1.0
arm                           stm32_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
csky                             alldefconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241024    clang-18
i386        buildonly-randconfig-002-20241024    clang-18
i386        buildonly-randconfig-003-20241024    clang-18
i386        buildonly-randconfig-004-20241024    clang-18
i386        buildonly-randconfig-005-20241024    clang-18
i386        buildonly-randconfig-006-20241024    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241024    clang-18
i386                  randconfig-002-20241024    clang-18
i386                  randconfig-003-20241024    clang-18
i386                  randconfig-004-20241024    clang-18
i386                  randconfig-005-20241024    clang-18
i386                  randconfig-006-20241024    clang-18
i386                  randconfig-011-20241024    clang-18
i386                  randconfig-012-20241024    clang-18
i386                  randconfig-013-20241024    clang-18
i386                  randconfig-014-20241024    clang-18
i386                  randconfig-015-20241024    clang-18
i386                  randconfig-016-20241024    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                        m5272c3_defconfig    gcc-14.1.0
m68k                       m5275evb_defconfig    gcc-14.1.0
m68k                           virt_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      mgcoge_defconfig    gcc-14.1.0
powerpc               mpc834x_itxgp_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                ecovec24-romimage_defconfig    gcc-14.1.0
sh                        edosk7760_defconfig    gcc-14.1.0
sh                           se7712_defconfig    gcc-14.1.0
sh                           se7751_defconfig    gcc-14.1.0
sh                   sh7724_generic_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  cadence_csp_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

