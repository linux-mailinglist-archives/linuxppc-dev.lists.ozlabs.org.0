Return-Path: <linuxppc-dev+bounces-6217-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A56BCA36E42
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2025 13:55:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yw86Y6jglz2yMD;
	Sat, 15 Feb 2025 23:55:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739624149;
	cv=none; b=Ws8Xp//oXJyy9Vq5cyaf4MnhN/VecNWisKg96IOjSBALNtz1PG087CIqR4yVtrgyYbBvaiCmC4l0h9zcjwx+jti9eFRfoxq9fvLwiTIFe+5X//X6muDpoKrEqCmSFs8fuWAX8stu7WQ1Kl5AuEoFjsNNNSB6rlha1Usrm7aELypnjAbDpPGTq2Pc/a7TnfKz9ZgR7o2FVpExCBBhTCTjPTKmGpdB+e+Sf+fDLQ9y/7/GMd9jCoHfsUeck2ErmxMMBP1MmFmbEMhjvYvvwe+YIFS+ltOqkgRYvU//2Dbi23yDVZRYRuLk8zlBQ2OtMJFCViX2xZ8IrsXG35delJF8/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739624149; c=relaxed/relaxed;
	bh=p467yl45oLmRGrafSN5Up+7/iD1Z2wYE7/SsbnqK1Fk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=otDy1uk9MB31+CZ4XAiLE+iPWDgOSeGKwhbviicArVNZVADgCTlCIoGtb3yas6lkfzIUn+YR5Z0pvynGoIilslZ0mmbGiZ0SWcjy4uQ9teH1AU4MpyMi4MnOxsnzTAm8JWXukvgOgvuMYvFgGZHVZ91Hz1khMjqYj220+8rozjydw+4uB8EV9cEqTnYkzgujkgUyqN18GAHGOdSV6EsW7/0jphTveDGz4qOQEkwJpCSK0LmL3H9THc/PmBL3Xai1h62nOSDbxiMwlbfye3DbGFfEMleTV+lAl1/us2yUWHGkAzhlqv/0HuUuVGVur5ZZ9TZzLAtyujn2UjyC6+59xg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HM6uytMP; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HM6uytMP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yw86W4bZ7z2yGC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2025 23:55:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739624148; x=1771160148;
  h=date:from:to:cc:subject:message-id;
  bh=94JEKl2MaZ4XuKtjoa8FgCnq7Vyq/9G1DLdKLQgs+ok=;
  b=HM6uytMPMtBbTlV/6Co3u95qr9wZYtt+b8EiOOE3pkjVO/bAYJGi0tib
   F2P8y0UDCtzG4EAeU4cDWwwXHkI8XHlWTwnSoXJ8sGNG8dcz62SaSuZgH
   14AAd4wOcP1GusmqSx4nk52Byt20ovwlQOp1qeD3ZBkAmxnMb7bgbDzAf
   7qVr81srp7IunZKaqYaRdplrGl3Q8Zwz7TPF4ZU2k7vTiP33NAHJNJvdO
   F7DjP3z2MOetLwYbNDUCxRZHFVJ0t0A0b6kCBh8tfMPA+lFPgPa3mh1vj
   txbOto5ZAfYlrXjylYJ1RTI2SbaqpODeHwtNUzBg1mmJidzhCfuJgIp/2
   A==;
X-CSE-ConnectionGUID: /sWFJHPcQj+xc1MVDaYMaQ==
X-CSE-MsgGUID: Ey/sHqk6QXOx5ovfHjGlOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="40505333"
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="40505333"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 04:55:42 -0800
X-CSE-ConnectionGUID: PatXK1dKTAySTihLzIya9g==
X-CSE-MsgGUID: vP7rMyB7RcygBAdiTS3oAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="113676074"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Feb 2025 04:55:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjHhr-001AoD-28;
	Sat, 15 Feb 2025 12:55:39 +0000
Date: Sat, 15 Feb 2025 20:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 3062e4bd79ed920c60453b56e08d3bda74513f7d
Message-ID: <202502152011.xGCU46O1-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
branch HEAD: 3062e4bd79ed920c60453b56e08d3bda74513f7d  Automatic merge of 'next' into merge (2025-02-14 17:57)

elapsed time: 1444m

configs tested: 101
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250214    gcc-13.2.0
arc                   randconfig-001-20250215    gcc-13.2.0
arc                   randconfig-002-20250214    gcc-13.2.0
arc                   randconfig-002-20250215    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250214    clang-16
arm                   randconfig-001-20250215    clang-15
arm                   randconfig-002-20250214    gcc-14.2.0
arm                   randconfig-002-20250215    clang-17
arm                   randconfig-003-20250214    clang-21
arm                   randconfig-003-20250215    gcc-14.2.0
arm                   randconfig-004-20250214    gcc-14.2.0
arm                   randconfig-004-20250215    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                 randconfig-001-20250214    gcc-14.2.0
arm64                 randconfig-001-20250215    clang-21
arm64                 randconfig-002-20250214    gcc-14.2.0
arm64                 randconfig-002-20250215    gcc-14.2.0
arm64                 randconfig-003-20250214    gcc-14.2.0
arm64                 randconfig-004-20250214    gcc-14.2.0
csky                  randconfig-001-20250214    gcc-14.2.0
csky                  randconfig-002-20250214    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250214    clang-21
hexagon               randconfig-002-20250214    clang-15
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250214    gcc-12
i386        buildonly-randconfig-002-20250214    gcc-12
i386        buildonly-randconfig-003-20250214    clang-19
i386        buildonly-randconfig-004-20250214    gcc-12
i386        buildonly-randconfig-005-20250214    gcc-12
i386        buildonly-randconfig-006-20250214    gcc-12
i386                                defconfig    clang-19
loongarch             randconfig-001-20250214    gcc-14.2.0
loongarch             randconfig-002-20250214    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250214    gcc-14.2.0
nios2                 randconfig-002-20250214    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250214    gcc-14.2.0
parisc                randconfig-002-20250214    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250214    gcc-14.2.0
powerpc               randconfig-002-20250214    clang-18
powerpc               randconfig-003-20250214    clang-21
powerpc64             randconfig-001-20250214    clang-18
powerpc64             randconfig-002-20250214    gcc-14.2.0
powerpc64             randconfig-003-20250214    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250214    clang-18
riscv                 randconfig-002-20250214    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250214    gcc-14.2.0
s390                  randconfig-002-20250214    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250214    gcc-14.2.0
sh                    randconfig-002-20250214    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250214    gcc-14.2.0
sparc                 randconfig-002-20250214    gcc-14.2.0
sparc64               randconfig-001-20250214    gcc-14.2.0
sparc64               randconfig-002-20250214    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250214    gcc-12
um                    randconfig-002-20250214    clang-16
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250214    clang-19
x86_64      buildonly-randconfig-001-20250215    gcc-12
x86_64      buildonly-randconfig-002-20250214    clang-19
x86_64      buildonly-randconfig-002-20250215    clang-19
x86_64      buildonly-randconfig-003-20250214    gcc-12
x86_64      buildonly-randconfig-003-20250215    gcc-12
x86_64      buildonly-randconfig-004-20250214    clang-19
x86_64      buildonly-randconfig-004-20250215    clang-19
x86_64      buildonly-randconfig-005-20250214    gcc-12
x86_64      buildonly-randconfig-005-20250215    clang-19
x86_64      buildonly-randconfig-006-20250214    gcc-12
x86_64      buildonly-randconfig-006-20250215    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250214    gcc-14.2.0
xtensa                randconfig-002-20250214    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

