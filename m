Return-Path: <linuxppc-dev+bounces-3973-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF279EC3CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 04:55:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7MFn5jFcz30CD;
	Wed, 11 Dec 2024 14:55:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733889341;
	cv=none; b=od9vkAEN/l5Jx7t/xQ/uvVG1BmZj0QZ1GyIj86JNcw/zB+cYk/sea8mjdoT4vY+cEBkuvCXKuIuvGBxrtUe+F27uXoZ74CDZipMdFkiSW9CFryypwHvCmI/2MirqJtYVGLahXj/zpT1kY50NB+ivwS37ndInsxk/wykpb42vGIzWZM8ZUH6Gcp6wwcjTCtcmEWwFmsdVHwW2gLMuX9MYyu6qwxLagEc6aOAg8TFSJFAsEdneyEsUoAcLYoGG1YrijNXBozW3327Yi76v/SdSFT7CLFr/ZTDeOUMTC3DXaySmSg8nzECn9dcAee7h81IOp2+AaF9v9GNrFutbaiwSAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733889341; c=relaxed/relaxed;
	bh=cwGYvNhCnuYlA2DDODI+5rPvFbyLnErjr1kwH6Beeqs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EdaDThW947nxjLMzEyiHyaAxN2OKI7LKLRszFKwpFmbqVvG2GFvfCzPaGNecmyLgBU5rWOQKDPBA80fMpMSf/Prn7xfw1RDoOm7mR7JV/jzZNMEvOnAfh8BJjk/AfKBV9/Flhmu/8AY8PAMt3ptUqFXVDt/wlIg7o/80XpTGrVWOIzFLzQwe6Yt09nBfkXTgghJa34rWmFa+JPgT7GqZGccRdBpgRftmmgHJDBuLO7A4hLIEPVgM0fhJ3/G5P6D1uLSV8tGrFmrZet7XYiHYv+FsEZTouHFI7BerzaIY2XOTQ84d7oXZjabAvCCVq/yzXjgN/HeYwmqM+wyVhtUbYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f2ccBR1E; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f2ccBR1E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7MFk5SXwz305P
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 14:55:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733889340; x=1765425340;
  h=date:from:to:cc:subject:message-id;
  bh=lQMe5i0Bj4xZuvOH60e49Y9TL9Mu5V5IogZfyBLd0rE=;
  b=f2ccBR1EDv1WnUbT22gN6KmnAvc33AHgK9OG4wQT+1PW1ObuNO7Bgyna
   Jz3BolLq2d3L9SXIOpE1Qq7Ppn/2ZCU+U8zN1//5UR5xRFotjqSQj4bLB
   dJK6xcNKCxl3YA8Lbk3HW7xDkHvFI5Wt6BVactLvRd5CqtzbDzZ0nSXcs
   Z7OflqchtKXfNVyHfBbx9JSqht6I/12+CaWMrN1qeeRMilAzWHTs2C8/P
   QQw3Jf6ITriRJtSODgMeVPpbBr5+CG2J4oGVbwJsC8LCwtvkfTixqioo4
   ezSSBDy8t0CkMNEXql9BplHOO+qHzCRjk7ew02HHCcG/S3aUajRGIbJ/0
   w==;
X-CSE-ConnectionGUID: i5yEZuspRE+EOSoJKvABaQ==
X-CSE-MsgGUID: 39AuiIDITIq1Zj+lstWVDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="37941487"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="37941487"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 19:55:33 -0800
X-CSE-ConnectionGUID: yeKTpEThQc+QBNC1XHuiVQ==
X-CSE-MsgGUID: iSFHecbWTK+Ep0DTJzZ5Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96109369"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Dec 2024 19:55:31 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLDou-0006FR-2F;
	Wed, 11 Dec 2024 03:55:28 +0000
Date: Wed, 11 Dec 2024 11:55:18 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 bc67cde06879dc05aa0884075ecc43c15dc17d1b
Message-ID: <202412111112.OD2EY2o6-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: bc67cde06879dc05aa0884075ecc43c15dc17d1b  Automatic merge of 'master' into merge (2024-12-10 08:55)

elapsed time: 1406m

configs tested: 301
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                      axs103_smp_defconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                   randconfig-001-20241210    gcc-13.2.0
arc                   randconfig-001-20241210    gcc-14.2.0
arc                   randconfig-001-20241211    gcc-14.2.0
arc                   randconfig-002-20241210    gcc-13.2.0
arc                   randconfig-002-20241210    gcc-14.2.0
arc                   randconfig-002-20241211    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                        keystone_defconfig    gcc-14.2.0
arm                        neponset_defconfig    gcc-14.2.0
arm                           omap1_defconfig    gcc-14.2.0
arm                            qcom_defconfig    gcc-14.2.0
arm                   randconfig-001-20241210    clang-20
arm                   randconfig-001-20241210    gcc-14.2.0
arm                   randconfig-001-20241211    gcc-14.2.0
arm                   randconfig-002-20241210    gcc-14.2.0
arm                   randconfig-002-20241211    gcc-14.2.0
arm                   randconfig-003-20241210    clang-20
arm                   randconfig-003-20241210    gcc-14.2.0
arm                   randconfig-003-20241211    gcc-14.2.0
arm                   randconfig-004-20241210    clang-20
arm                   randconfig-004-20241210    gcc-14.2.0
arm                   randconfig-004-20241211    gcc-14.2.0
arm                           sama5_defconfig    gcc-14.2.0
arm                        vexpress_defconfig    gcc-14.2.0
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241210    clang-20
arm64                 randconfig-001-20241210    gcc-14.2.0
arm64                 randconfig-001-20241211    gcc-14.2.0
arm64                 randconfig-002-20241210    clang-20
arm64                 randconfig-002-20241210    gcc-14.2.0
arm64                 randconfig-002-20241211    gcc-14.2.0
arm64                 randconfig-003-20241210    clang-20
arm64                 randconfig-003-20241210    gcc-14.2.0
arm64                 randconfig-003-20241211    gcc-14.2.0
arm64                 randconfig-004-20241210    clang-20
arm64                 randconfig-004-20241210    gcc-14.2.0
arm64                 randconfig-004-20241211    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241210    gcc-14.2.0
csky                  randconfig-001-20241211    gcc-14.2.0
csky                  randconfig-002-20241210    gcc-14.2.0
csky                  randconfig-002-20241211    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241210    clang-16
hexagon               randconfig-001-20241210    gcc-14.2.0
hexagon               randconfig-001-20241211    gcc-14.2.0
hexagon               randconfig-002-20241210    clang-14
hexagon               randconfig-002-20241210    gcc-14.2.0
hexagon               randconfig-002-20241211    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241210    gcc-12
i386        buildonly-randconfig-001-20241211    clang-19
i386        buildonly-randconfig-002-20241210    clang-19
i386        buildonly-randconfig-002-20241210    gcc-12
i386        buildonly-randconfig-002-20241211    clang-19
i386        buildonly-randconfig-003-20241210    gcc-12
i386        buildonly-randconfig-003-20241211    clang-19
i386        buildonly-randconfig-004-20241210    clang-19
i386        buildonly-randconfig-004-20241210    gcc-12
i386        buildonly-randconfig-004-20241211    clang-19
i386        buildonly-randconfig-005-20241210    clang-19
i386        buildonly-randconfig-005-20241210    gcc-12
i386        buildonly-randconfig-005-20241211    clang-19
i386        buildonly-randconfig-006-20241210    clang-19
i386        buildonly-randconfig-006-20241210    gcc-12
i386        buildonly-randconfig-006-20241211    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241210    clang-19
i386                  randconfig-001-20241211    gcc-12
i386                  randconfig-002-20241210    clang-19
i386                  randconfig-002-20241211    gcc-12
i386                  randconfig-003-20241210    clang-19
i386                  randconfig-003-20241211    gcc-12
i386                  randconfig-004-20241210    clang-19
i386                  randconfig-004-20241211    gcc-12
i386                  randconfig-005-20241210    clang-19
i386                  randconfig-005-20241211    gcc-12
i386                  randconfig-006-20241210    clang-19
i386                  randconfig-006-20241211    gcc-12
i386                  randconfig-007-20241210    clang-19
i386                  randconfig-007-20241211    gcc-12
i386                  randconfig-011-20241210    clang-19
i386                  randconfig-011-20241211    gcc-12
i386                  randconfig-012-20241210    clang-19
i386                  randconfig-012-20241211    gcc-12
i386                  randconfig-013-20241210    clang-19
i386                  randconfig-013-20241211    gcc-12
i386                  randconfig-014-20241210    clang-19
i386                  randconfig-014-20241211    gcc-12
i386                  randconfig-015-20241210    clang-19
i386                  randconfig-015-20241211    gcc-12
i386                  randconfig-016-20241210    clang-19
i386                  randconfig-016-20241211    gcc-12
i386                  randconfig-017-20241210    clang-19
i386                  randconfig-017-20241211    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241210    gcc-14.2.0
loongarch             randconfig-001-20241211    gcc-14.2.0
loongarch             randconfig-002-20241210    gcc-14.2.0
loongarch             randconfig-002-20241211    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                          eyeq6_defconfig    gcc-14.2.0
mips                        maltaup_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241210    gcc-14.2.0
nios2                 randconfig-001-20241211    gcc-14.2.0
nios2                 randconfig-002-20241210    gcc-14.2.0
nios2                 randconfig-002-20241211    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241210    gcc-14.2.0
parisc                randconfig-001-20241211    gcc-14.2.0
parisc                randconfig-002-20241210    gcc-14.2.0
parisc                randconfig-002-20241211    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      chrp32_defconfig    gcc-14.2.0
powerpc                       ebony_defconfig    gcc-14.2.0
powerpc                       eiger_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241210    clang-20
powerpc               randconfig-001-20241210    gcc-14.2.0
powerpc               randconfig-001-20241211    gcc-14.2.0
powerpc               randconfig-002-20241210    clang-20
powerpc               randconfig-002-20241210    gcc-14.2.0
powerpc               randconfig-002-20241211    gcc-14.2.0
powerpc               randconfig-003-20241210    clang-20
powerpc               randconfig-003-20241210    gcc-14.2.0
powerpc               randconfig-003-20241211    gcc-14.2.0
powerpc                     taishan_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241210    gcc-14.2.0
powerpc64             randconfig-001-20241211    gcc-14.2.0
powerpc64             randconfig-002-20241210    gcc-14.2.0
powerpc64             randconfig-002-20241211    gcc-14.2.0
powerpc64             randconfig-003-20241210    gcc-14.2.0
powerpc64             randconfig-003-20241211    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241210    clang-19
riscv                 randconfig-001-20241211    clang-20
riscv                 randconfig-002-20241210    gcc-14.2.0
riscv                 randconfig-002-20241211    clang-20
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                                defconfig    gcc-14.2.0
s390                  randconfig-001-20241210    gcc-14.2.0
s390                  randconfig-001-20241211    clang-20
s390                  randconfig-002-20241210    gcc-14.2.0
s390                  randconfig-002-20241211    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                    randconfig-001-20241210    gcc-14.2.0
sh                    randconfig-001-20241211    clang-20
sh                    randconfig-002-20241210    gcc-14.2.0
sh                    randconfig-002-20241211    clang-20
sh                          rsk7203_defconfig    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241210    gcc-14.2.0
sparc                 randconfig-001-20241211    clang-20
sparc                 randconfig-002-20241210    gcc-14.2.0
sparc                 randconfig-002-20241211    clang-20
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241210    gcc-14.2.0
sparc64               randconfig-001-20241211    clang-20
sparc64               randconfig-002-20241210    gcc-14.2.0
sparc64               randconfig-002-20241211    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241210    clang-20
um                    randconfig-001-20241211    clang-20
um                    randconfig-002-20241210    gcc-12
um                    randconfig-002-20241211    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                           alldefconfig    gcc-14.2.0
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241210    clang-19
x86_64      buildonly-randconfig-001-20241210    gcc-12
x86_64      buildonly-randconfig-001-20241211    gcc-12
x86_64      buildonly-randconfig-002-20241210    clang-19
x86_64      buildonly-randconfig-002-20241211    gcc-12
x86_64      buildonly-randconfig-003-20241210    clang-19
x86_64      buildonly-randconfig-003-20241211    gcc-12
x86_64      buildonly-randconfig-004-20241210    clang-19
x86_64      buildonly-randconfig-004-20241210    gcc-12
x86_64      buildonly-randconfig-004-20241211    gcc-12
x86_64      buildonly-randconfig-005-20241210    clang-19
x86_64      buildonly-randconfig-005-20241210    gcc-12
x86_64      buildonly-randconfig-005-20241211    gcc-12
x86_64      buildonly-randconfig-006-20241210    clang-19
x86_64      buildonly-randconfig-006-20241211    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241210    gcc-12
x86_64                randconfig-001-20241211    clang-19
x86_64                randconfig-002-20241210    gcc-12
x86_64                randconfig-002-20241211    clang-19
x86_64                randconfig-003-20241210    gcc-12
x86_64                randconfig-003-20241211    clang-19
x86_64                randconfig-004-20241210    gcc-12
x86_64                randconfig-004-20241211    clang-19
x86_64                randconfig-005-20241210    gcc-12
x86_64                randconfig-005-20241211    clang-19
x86_64                randconfig-006-20241210    gcc-12
x86_64                randconfig-006-20241211    clang-19
x86_64                randconfig-007-20241210    gcc-12
x86_64                randconfig-007-20241211    clang-19
x86_64                randconfig-008-20241210    gcc-12
x86_64                randconfig-008-20241211    clang-19
x86_64                randconfig-071-20241210    gcc-12
x86_64                randconfig-071-20241211    clang-19
x86_64                randconfig-072-20241210    gcc-12
x86_64                randconfig-072-20241211    clang-19
x86_64                randconfig-073-20241210    gcc-12
x86_64                randconfig-073-20241211    clang-19
x86_64                randconfig-074-20241210    gcc-12
x86_64                randconfig-074-20241211    clang-19
x86_64                randconfig-075-20241210    gcc-12
x86_64                randconfig-075-20241211    clang-19
x86_64                randconfig-076-20241210    gcc-12
x86_64                randconfig-076-20241211    clang-19
x86_64                randconfig-077-20241210    gcc-12
x86_64                randconfig-077-20241211    clang-19
x86_64                randconfig-078-20241210    gcc-12
x86_64                randconfig-078-20241211    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241210    gcc-14.2.0
xtensa                randconfig-001-20241211    clang-20
xtensa                randconfig-002-20241210    gcc-14.2.0
xtensa                randconfig-002-20241211    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

