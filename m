Return-Path: <linuxppc-dev+bounces-3455-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 960309D453D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2024 02:18:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xv0jK5jGLz2xFm;
	Thu, 21 Nov 2024 12:18:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732151893;
	cv=none; b=ceL87OOa6a4/UUEFlP1xiDsmhIkdiWu+UEC42ap5bwmDMr0M2tscEFsoxtEzhCXxVe/eTJ7ZvAp1S22jdK+TW80kHZ4mUOkgjeBYqOibf0lqfCygoV/tYSkxIKgONHFrPkPpNUDfgpJRp7WpOdPcPTO7Ww5JZi1JsPOxxQZ3uzhzntJkNI/P2frUBYgLRUwkDKPHC1ouU8Kkh4mdWVa+uDeJMjwiDBZgr6cca7vVgpGaHGBZbInKKLrhl5m2OX4TzVK1zLYAODxfVVWqai8ikD/pnHVpvFi/4eC/qEiaL1Ny7peRn7kZO8ravOEAEgArjTgPwOscx4/cFYbhRwGLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732151893; c=relaxed/relaxed;
	bh=n9SxhDHRHh51UCycW6PqVoQ73yamlVGPF2XM1jpSESg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jI+PhKJcvNcY2Dj7ozmWgwkDBnPA/mw3KrwcTSt8IMnpEdn5cX1Yvatf+aOaD0L8TDc/1QipsMmysYpd8AyKTrfBSwWsxCIulKAAxThk12qTfMRvu2N7QtWf6I7b7CtzBNaXHYqNHayFc/xqJpC/qmCq9D2LNH6LUtOKUSEHjfwI2+n3J6YLnLBBfpPjzYawffPO98GT3bCg+4tkTTzG19wSWX8GdI1AC06SSdCu9SFw0gvT8FBatg9SaEFukeNpp23TybT5Pjy+3NDTTwEWDqQ+J4kGXvNMi5m1gUE9591moC4sPoxgvwrNwZvUkHq7/XBMLyu+yAUVufmJSjh5kg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iYlpaW3v; dkim-atps=neutral; spf=pass (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iYlpaW3v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xv0jG54W8z2xBk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2024 12:18:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732151891; x=1763687891;
  h=date:from:to:cc:subject:message-id;
  bh=mYD+IoVwUaSWl9/4Ez1zzMIlPxRZvy1t995+xSU0cHo=;
  b=iYlpaW3v8aVJr/YLYh3s6lW1DsX0+cl2TGcdGy+L/5P39eLw4nBevmo5
   4zlbCb+RCWRN6mK8J4kfdUTrd5MTsWSiTfrZqbjTN0noce5H9MkaIpMTu
   u9IdA70zFUZhZe7Azr+sj2p0rT8EP4DNfCkNxQKo2M6nyNQHUgdPJLYuU
   CJRX95a5vrBqGL46VtW906RLdZigdasju9zXvwyITcmypewxN4D34bOIu
   yDswiSikvMpR0Lo07mBtD75g6Hox6RRvJx8tmfjXMt+ipYCpTbFpqpmHh
   tsmEmn3sMbLr3gwPsf552NlUkDcVTP5UCR+dDx91dBURNoG/QbE+jyUn1
   w==;
X-CSE-ConnectionGUID: QDDmNIQARTixuhJMLowNIQ==
X-CSE-MsgGUID: OZ+ffrSFSwyXmXr12iIsCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="19830009"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="19830009"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 17:18:04 -0800
X-CSE-ConnectionGUID: iV0sooawQweiD2roNb9lPw==
X-CSE-MsgGUID: eO77bq4oS5aV7CUBsSul2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="89896109"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Nov 2024 17:18:03 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDvpZ-0001Gv-0D;
	Thu, 21 Nov 2024 01:18:01 +0000
Date: Thu, 21 Nov 2024 09:17:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next] BUILD SUCCESS
 3c592ce7991cdf03bc7d139d790ce58c82c5903b
Message-ID: <202411210900.JVzOVhCQ-lkp@intel.com>
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
branch HEAD: 3c592ce7991cdf03bc7d139d790ce58c82c5903b  EDAC/powerpc: Remove PPC_MAPLE drivers

elapsed time: 1384m

configs tested: 106
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-14.2.0
alpha                  allyesconfig    gcc-14.2.0
arc                    allmodconfig    gcc-13.2.0
arc                     allnoconfig    gcc-13.2.0
arc                    allyesconfig    gcc-13.2.0
arc         randconfig-001-20241120    gcc-13.2.0
arc         randconfig-002-20241120    gcc-13.2.0
arm                    allmodconfig    gcc-14.2.0
arm                     allnoconfig    clang-20
arm                    allyesconfig    gcc-14.2.0
arm           am200epdkit_defconfig    gcc-14.2.0
arm         milbeaut_m10v_defconfig    clang-16
arm               mv78xx0_defconfig    clang-20
arm                pxa168_defconfig    clang-20
arm         randconfig-001-20241120    clang-20
arm         randconfig-002-20241120    clang-20
arm         randconfig-003-20241120    gcc-14.2.0
arm         randconfig-004-20241120    gcc-14.2.0
arm64                  allmodconfig    clang-20
arm64                   allnoconfig    gcc-14.2.0
arm64       randconfig-001-20241120    gcc-14.2.0
arm64       randconfig-002-20241120    clang-17
arm64       randconfig-003-20241120    gcc-14.2.0
arm64       randconfig-004-20241120    gcc-14.2.0
csky                    allnoconfig    gcc-14.2.0
csky        randconfig-001-20241120    gcc-14.2.0
csky        randconfig-002-20241120    gcc-14.2.0
hexagon                allmodconfig    clang-20
hexagon                 allnoconfig    clang-20
hexagon                allyesconfig    clang-20
hexagon     randconfig-001-20241120    clang-20
hexagon     randconfig-002-20241120    clang-20
i386                   allmodconfig    gcc-12
i386                    allnoconfig    gcc-12
i386                   allyesconfig    gcc-12
i386                      defconfig    clang-19
loongarch              allmodconfig    gcc-14.2.0
loongarch               allnoconfig    gcc-14.2.0
loongarch   randconfig-001-20241120    gcc-14.2.0
loongarch   randconfig-002-20241120    gcc-14.2.0
m68k                   allmodconfig    gcc-14.2.0
m68k                    allnoconfig    gcc-14.2.0
m68k                   allyesconfig    gcc-14.2.0
microblaze             allmodconfig    gcc-14.2.0
microblaze              allnoconfig    gcc-14.2.0
microblaze             allyesconfig    gcc-14.2.0
mips                    allnoconfig    gcc-14.2.0
nios2                   allnoconfig    gcc-14.2.0
nios2       randconfig-001-20241120    gcc-14.2.0
nios2       randconfig-002-20241120    gcc-14.2.0
openrisc                allnoconfig    gcc-14.2.0
openrisc               allyesconfig    gcc-14.2.0
openrisc                  defconfig    gcc-14.2.0
parisc                 allmodconfig    gcc-14.2.0
parisc                  allnoconfig    gcc-14.2.0
parisc                 allyesconfig    gcc-14.2.0
parisc                    defconfig    gcc-14.2.0
parisc      randconfig-001-20241120    gcc-14.2.0
parisc      randconfig-002-20241120    gcc-14.2.0
powerpc                allmodconfig    gcc-14.2.0
powerpc                 allnoconfig    gcc-14.2.0
powerpc                allyesconfig    clang-20
powerpc     randconfig-001-20241120    gcc-14.2.0
powerpc     randconfig-002-20241120    gcc-14.2.0
powerpc     randconfig-003-20241120    gcc-14.2.0
powerpc64   randconfig-001-20241120    clang-20
powerpc64   randconfig-002-20241120    clang-20
powerpc64   randconfig-003-20241120    clang-20
riscv                  allmodconfig    clang-20
riscv                   allnoconfig    gcc-14.2.0
riscv                  allyesconfig    clang-20
riscv                     defconfig    clang-20
riscv       randconfig-001-20241120    gcc-14.2.0
riscv       randconfig-002-20241120    gcc-14.2.0
s390                   allmodconfig    clang-20
s390                    allnoconfig    clang-20
s390                   allyesconfig    gcc-14.2.0
s390                      defconfig    clang-20
s390        randconfig-001-20241120    clang-20
s390        randconfig-002-20241120    clang-20
sh                     allmodconfig    gcc-14.2.0
sh                      allnoconfig    gcc-14.2.0
sh                     allyesconfig    gcc-14.2.0
sh                        defconfig    gcc-14.2.0
sh          randconfig-001-20241120    gcc-14.2.0
sh          randconfig-002-20241120    gcc-14.2.0
sparc                  allmodconfig    gcc-14.2.0
sparc64                   defconfig    gcc-14.2.0
sparc64     randconfig-001-20241120    gcc-14.2.0
sparc64     randconfig-002-20241120    gcc-14.2.0
um                     allmodconfig    clang-20
um                      allnoconfig    clang-17
um                     allyesconfig    gcc-12
um                        defconfig    clang-20
um                   i386_defconfig    gcc-12
um          randconfig-001-20241120    gcc-12
um          randconfig-002-20241120    clang-20
um                 x86_64_defconfig    clang-15
x86_64                  allnoconfig    clang-19
x86_64                 allyesconfig    clang-19
x86_64                    defconfig    gcc-11
x86_64                        kexec    clang-19
x86_64                     rhel-9.4    gcc-12
xtensa                  allnoconfig    gcc-14.2.0
xtensa      randconfig-001-20241120    gcc-14.2.0
xtensa      randconfig-002-20241120    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

