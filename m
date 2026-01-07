Return-Path: <linuxppc-dev+bounces-15353-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A66D7CFC50D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 08:22:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmKHb13Nvz2yGD;
	Wed, 07 Jan 2026 18:22:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767770555;
	cv=none; b=GG9YX3OMc6SByumE0FaU6CqCE/q94lbSmMqJmutDmnYb1ujEMzPbM7s1PDV3smHrU3r/vAEcTDiEByxO8xFACXYKJ3/xppLrxyQ82p1Dl7HSDy4AMuMSd1J2ac8TSiwzjtUygtmrVsFam69Ab+rQrCd+AtJWp8HpjmyWOpd0+iRuPGMovATO1iCQIpNWYfyC/UQr7eUhgfFZ3toN5tpgwtk9zY6++NEo+PGBYfZaVNmgD7fwUwt6T9ZXcu/O6f2mFd5F5Sn2/WLadyHk0rW71EZNVZ610SPc6oVNBLbArGqaoTqBSpD5TJovBqC8qpy0bohwenWZxzNnKiMe1CbwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767770555; c=relaxed/relaxed;
	bh=8W0WIsKjEZ+ZcLLUhBWu3j2AvFIfo354SWsGTtuLXhk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZIrxVZFirONgG360Kit7ISYCtTZYkmMievGxVam23LMmPaFMujZKyoQGsWv3m6dcHQQzjVVv6/nGuArKT2wsIXQJTbH36L6uUWZMcNY4x6P8uq2cDS7hxg697uh06F6nq21JdklhdLYdsggjI1l7CJR3bfPZt5YTZppvXOX+IUjr4eevEB5cR66toekQVt7V2X3+8ZKqiNAQreMzsjqyzBfTzmLWrFgbznc1QuK3b8wDCp/astI7huo8ugJ/lyifL5vn8GnCgdLMG54VJMdj3UqbN+96I7Wcj9y2IZBKa33psDcwJJBAJZi+qkhmrPJbKg6H4TwX+aRqrs+Ctsa1eA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=baQGzf3t; dkim-atps=neutral; spf=pass (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=baQGzf3t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmKHX56Hpz2yFh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 18:22:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767770553; x=1799306553;
  h=date:from:to:cc:subject:message-id;
  bh=4JniRD0yoDFUo8/7InUTuIuogopE9l9ExtZQRHOEp6M=;
  b=baQGzf3tPh4L970wbJQ2xvYpjb21Eexae7heAj+IbrpRoOCm9TN/Z8Z3
   mEjXJaUmqT1YMy8YIixpZ2wjweZi++WMrcoxKZvvGW3ihT8N6/Fit4sXd
   l6RrTFA15aCJt8uz/5Fpz/+CZip1cCHQrsdQqJTMBwyWop16nNgYiGDwb
   bLJyTtUEE80a84QRwGlozVOoS+uJgseG3m+jbBw1K89NO6fsNGfi6jVPR
   trOgUlgqC+Xq9yEntVV0RaIgdD3wBRxuWWmEIp83h/hfcymOjzDL8jnow
   UPlSdGWwA0A+LB8Fptqe99M0bnTMaICp+8d+yWObWCDjYxZWCBNBWHZsM
   Q==;
X-CSE-ConnectionGUID: RUTo10hSTwyWDQ4m0ZUxwQ==
X-CSE-MsgGUID: mm9rN2XKRuKUPFLLyDscAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69047853"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="69047853"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 23:22:28 -0800
X-CSE-ConnectionGUID: irBhA32tTe+zsmQTNeEn6g==
X-CSE-MsgGUID: +VoJalJkS9aKf4FshLEirA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="207388337"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Jan 2026 23:22:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdNs8-000000003YL-3ucx;
	Wed, 07 Jan 2026 07:22:24 +0000
Date: Wed, 07 Jan 2026 15:21:58 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 27527b2f6bdfdbd251c68e891b4bba0795f1b912
Message-ID: <202601071547.f1H55NEK-lkp@intel.com>
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
branch HEAD: 27527b2f6bdfdbd251c68e891b4bba0795f1b912  Automatic merge of 'fixes' into merge (2026-01-06 11:15)

elapsed time: 1505m

configs tested: 124
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                               defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20260107    gcc-14.3.0
arc                   randconfig-002-20260107    gcc-8.5.0
arm                                 defconfig    clang-22
arm                      jornada720_defconfig    clang-22
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20260107    gcc-10.5.0
arm                   randconfig-002-20260107    clang-22
arm                   randconfig-003-20260107    clang-22
arm                   randconfig-004-20260107    gcc-10.5.0
arm                           tegra_defconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20260107    clang-22
arm64                 randconfig-002-20260107    clang-22
arm64                 randconfig-003-20260107    gcc-8.5.0
arm64                 randconfig-004-20260107    clang-22
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20260107    gcc-15.1.0
csky                  randconfig-002-20260107    gcc-9.5.0
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20260107    clang-22
hexagon               randconfig-002-20260107    clang-22
i386        buildonly-randconfig-001-20260107    gcc-14
i386        buildonly-randconfig-002-20260107    gcc-14
i386        buildonly-randconfig-003-20260107    clang-20
i386        buildonly-randconfig-004-20260107    gcc-14
i386        buildonly-randconfig-005-20260107    clang-20
i386        buildonly-randconfig-006-20260107    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20260107    gcc-14
i386                  randconfig-002-20260107    gcc-14
i386                  randconfig-003-20260107    gcc-14
i386                  randconfig-004-20260107    gcc-14
i386                  randconfig-005-20260107    gcc-14
i386                  randconfig-006-20260107    gcc-14
i386                  randconfig-007-20260107    clang-20
i386                  randconfig-011-20260107    gcc-13
i386                  randconfig-012-20260107    gcc-14
i386                  randconfig-013-20260107    clang-20
i386                  randconfig-014-20260107    gcc-14
i386                  randconfig-015-20260107    clang-20
i386                  randconfig-016-20260107    clang-20
i386                  randconfig-017-20260107    clang-20
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260107    gcc-15.1.0
loongarch             randconfig-002-20260107    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                          hp300_defconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260107    gcc-8.5.0
nios2                 randconfig-002-20260107    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20260107    gcc-8.5.0
parisc                randconfig-002-20260107    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                     akebono_defconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      pasemi_defconfig    clang-22
powerpc               randconfig-001-20260107    clang-22
powerpc               randconfig-002-20260107    gcc-8.5.0
powerpc                        warp_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20260107    gcc-14.3.0
powerpc64             randconfig-002-20260107    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20260107    clang-22
riscv                 randconfig-002-20260107    gcc-9.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20260107    clang-22
s390                  randconfig-002-20260107    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          lboxre2_defconfig    gcc-15.1.0
sh                    randconfig-001-20260107    gcc-12.5.0
sh                    randconfig-002-20260107    gcc-12.5.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20260107    gcc-8.5.0
sparc                 randconfig-002-20260107    gcc-11.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260107    clang-22
sparc64               randconfig-002-20260107    gcc-10.5.0
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260107    clang-16
um                    randconfig-002-20260107    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20260107    gcc-14
x86_64      buildonly-randconfig-002-20260107    gcc-14
x86_64      buildonly-randconfig-003-20260107    gcc-14
x86_64      buildonly-randconfig-004-20260107    clang-20
x86_64      buildonly-randconfig-005-20260107    gcc-14
x86_64      buildonly-randconfig-006-20260107    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260107    clang-20
x86_64                randconfig-002-20260107    clang-20
x86_64                randconfig-003-20260107    clang-20
x86_64                randconfig-004-20260107    gcc-13
x86_64                randconfig-005-20260107    clang-20
x86_64                randconfig-006-20260107    clang-20
x86_64                randconfig-011-20260107    gcc-12
x86_64                randconfig-012-20260107    gcc-14
x86_64                randconfig-013-20260107    clang-20
x86_64                randconfig-014-20260107    clang-20
x86_64                randconfig-015-20260107    clang-20
x86_64                randconfig-016-20260107    clang-20
x86_64                randconfig-071-20260107    gcc-14
x86_64                randconfig-072-20260107    clang-20
x86_64                randconfig-073-20260107    gcc-14
x86_64                randconfig-074-20260107    gcc-14
x86_64                randconfig-075-20260107    clang-20
x86_64                randconfig-076-20260107    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20260107    gcc-8.5.0
xtensa                randconfig-002-20260107    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

