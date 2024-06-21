Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8607E911928
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 06:01:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aa8eYg0B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W53Yt4VFFz3cXy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 14:01:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aa8eYg0B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W53Y65fyNz3cWD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 14:00:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718942428; x=1750478428;
  h=date:from:to:cc:subject:message-id;
  bh=HxY8vrD3hasBrLnXrsb5Tq4QgOB85RTK+fTOCaSFt5E=;
  b=aa8eYg0BrSTNJw687A9ogY4Pb3MXmCfPKQydXKZJC+tmLw7Qgy4hhO+M
   PbARd9uNVRMgbzpL9O+ySZpo97Gm49RA/cks9vAX32AVc/vN3mCMF3Fhe
   WPDEa7cvGgv45hbyc//PIwGxLroD7u+XRwN9S1JaauQZGdfRJv/itLkzu
   uzPJV5w+VPOiBvq8uIKKMWcXBFOao9gDxg+UB8XroIbhCMwfmJxsonbwu
   NW5t27LD/w3TGO+YGdNfIbfZlElPS+bLUzikMRnxp1nJHUYRQSmBqRz6r
   Z+ePeSDu7NgyxoQPdoECmu7VAsOW3b/oSM7fSkf2PulEJYRgKcf+jdDD8
   g==;
X-CSE-ConnectionGUID: d/f4BbuZR0mhZeRchE29UA==
X-CSE-MsgGUID: A+lqdJfQQdG8nLRO9znCiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="27097921"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="27097921"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 21:00:21 -0700
X-CSE-ConnectionGUID: jfHUbMIxSsqTjriHNxegIg==
X-CSE-MsgGUID: OWFlaYgtQeajQ8dxUVJGUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="65708164"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Jun 2024 21:00:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKVRh-0008BC-24;
	Fri, 21 Jun 2024 04:00:17 +0000
Date: Fri, 21 Jun 2024 11:59:46 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 e2b06d707dd067509cdc9ceba783c06fa6a551c2
Message-ID: <202406211144.SSQbBtug-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: e2b06d707dd067509cdc9ceba783c06fa6a551c2  Automatic merge of 'next' into merge (2024-06-17 15:38)

elapsed time: 5231m

configs tested: 121
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240618   gcc-13.2.0
arc                   randconfig-002-20240618   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                                 defconfig   clang-14
arm                   randconfig-001-20240618   gcc-13.2.0
arm                   randconfig-002-20240618   gcc-13.2.0
arm                   randconfig-003-20240618   clang-19
arm                   randconfig-004-20240618   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240618   clang-17
arm64                 randconfig-002-20240618   clang-19
arm64                 randconfig-003-20240618   clang-16
arm64                 randconfig-004-20240618   clang-19
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240618   gcc-13.2.0
csky                  randconfig-002-20240618   gcc-13.2.0
hexagon                           allnoconfig   clang-19
hexagon                             defconfig   clang-19
hexagon               randconfig-001-20240618   clang-19
hexagon               randconfig-002-20240618   clang-19
i386         buildonly-randconfig-001-20240618   gcc-13
i386         buildonly-randconfig-002-20240618   gcc-12
i386         buildonly-randconfig-003-20240618   gcc-8
i386         buildonly-randconfig-004-20240618   gcc-10
i386         buildonly-randconfig-005-20240618   gcc-10
i386         buildonly-randconfig-006-20240618   gcc-10
i386                  randconfig-001-20240618   clang-18
i386                  randconfig-002-20240618   gcc-13
i386                  randconfig-003-20240618   gcc-13
i386                  randconfig-004-20240618   clang-18
i386                  randconfig-005-20240618   clang-18
i386                  randconfig-006-20240618   clang-18
i386                  randconfig-011-20240618   gcc-13
i386                  randconfig-012-20240618   gcc-11
i386                  randconfig-013-20240618   gcc-7
i386                  randconfig-014-20240618   gcc-11
i386                  randconfig-015-20240618   clang-18
i386                  randconfig-016-20240618   clang-18
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240618   gcc-13.2.0
loongarch             randconfig-002-20240618   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240618   gcc-13.2.0
nios2                 randconfig-002-20240618   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240618   gcc-13.2.0
parisc                randconfig-002-20240618   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-001-20240618   gcc-13.2.0
powerpc               randconfig-002-20240618   clang-19
powerpc               randconfig-003-20240618   clang-19
powerpc64             randconfig-001-20240618   clang-19
powerpc64             randconfig-002-20240618   clang-17
powerpc64             randconfig-003-20240618   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240618   gcc-13.2.0
riscv                 randconfig-002-20240618   clang-14
s390                              allnoconfig   clang-19
s390                                defconfig   clang-19
s390                  randconfig-001-20240618   clang-15
s390                  randconfig-002-20240618   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240618   gcc-13.2.0
sh                    randconfig-002-20240618   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240618   gcc-13.2.0
sparc64               randconfig-002-20240618   gcc-13.2.0
um                                allnoconfig   clang-17
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240618   clang-19
um                    randconfig-002-20240618   clang-19
um                           x86_64_defconfig   clang-15
x86_64       buildonly-randconfig-001-20240617   gcc-13
x86_64       buildonly-randconfig-002-20240617   clang-18
x86_64       buildonly-randconfig-003-20240617   gcc-13
x86_64       buildonly-randconfig-004-20240617   gcc-13
x86_64       buildonly-randconfig-005-20240617   gcc-11
x86_64       buildonly-randconfig-006-20240617   clang-18
x86_64                randconfig-001-20240617   clang-18
x86_64                randconfig-002-20240617   gcc-8
x86_64                randconfig-003-20240617   gcc-13
x86_64                randconfig-004-20240617   clang-18
x86_64                randconfig-005-20240617   clang-18
x86_64                randconfig-006-20240617   gcc-13
x86_64                randconfig-011-20240617   clang-18
x86_64                randconfig-012-20240617   clang-18
x86_64                randconfig-013-20240617   clang-18
x86_64                randconfig-014-20240617   clang-18
x86_64                randconfig-015-20240617   clang-18
x86_64                randconfig-016-20240617   clang-18
x86_64                randconfig-071-20240617   gcc-9
x86_64                randconfig-072-20240617   clang-18
x86_64                randconfig-073-20240617   clang-18
x86_64                randconfig-074-20240617   clang-18
x86_64                randconfig-075-20240617   clang-18
x86_64                randconfig-076-20240617   gcc-13
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240618   gcc-13.2.0
xtensa                randconfig-002-20240618   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
