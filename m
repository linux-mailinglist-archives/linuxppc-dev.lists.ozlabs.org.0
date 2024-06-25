Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9148D915D88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 06:00:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dcTyGCtn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7WMf0grRz3cyd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 14:00:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dcTyGCtn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7WLw2dkNz30Sv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 14:00:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719288010; x=1750824010;
  h=date:from:to:cc:subject:message-id;
  bh=9K1BRRPcY4+yCc+pDbnu2dyCzNY3NVtMPuhCmnHaG2Q=;
  b=dcTyGCtnVOsvMtQ9lQur7XKtVxMI+hN04yAotX9vTfNGp55v8yuFzGCs
   riMjrKBLrb/VgyJ8GPqs90Xre7+UXlYiwAFTpOKyoxgi2dKMaawq0z+Wh
   zbmNcU5fqcN8gSlajDCWsJBhklun6DEISA9h5oZnxHCiIkdT51lltPdNr
   44dGI9pUcbBVUmKsk2gC4SepFTBADnrfm77egLs4OaMi/cPcRBGi2FJZ6
   c4wg71CBthmWGRIlPb3HvBQJJ6lMzL/jJTzqgQ0PWt9O4qULRl29R7Ac5
   7tGAv6cADMu5gWp4ZeH3dCfehLm6bhBmGB4jdJxtjXtenO5HG8SwZyYfn
   Q==;
X-CSE-ConnectionGUID: aV7c+gZjTZaUgE6VodeNTw==
X-CSE-MsgGUID: yuDJUr17R5aBMHMftobYxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16430027"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="16430027"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 21:00:05 -0700
X-CSE-ConnectionGUID: Qa0hK1JGTlimxoqCygnofA==
X-CSE-MsgGUID: 2B5Kcq91TTusff6fm2SMag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="81046956"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Jun 2024 21:00:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLxLc-000E1R-3D;
	Tue, 25 Jun 2024 04:00:01 +0000
Date: Tue, 25 Jun 2024 11:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 18bc7f1d505a55667d4dd495d82af9acead61e27
Message-ID: <202406251138.CUK51Gbs-lkp@intel.com>
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
branch HEAD: 18bc7f1d505a55667d4dd495d82af9acead61e27  Automatic merge of 'next' into merge (2024-06-24 12:09)

elapsed time: 1458m

configs tested: 108
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240625   gcc-13.2.0
arc                   randconfig-002-20240625   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                   randconfig-001-20240625   clang-15
arm                   randconfig-002-20240625   clang-19
arm                   randconfig-003-20240625   gcc-13.2.0
arm                   randconfig-004-20240625   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240625   gcc-13.2.0
arm64                 randconfig-002-20240625   gcc-13.2.0
arm64                 randconfig-003-20240625   clang-19
arm64                 randconfig-004-20240625   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240625   gcc-13.2.0
csky                  randconfig-002-20240625   gcc-13.2.0
hexagon                           allnoconfig   clang-19
hexagon               randconfig-001-20240625   clang-14
hexagon               randconfig-002-20240625   clang-19
i386         buildonly-randconfig-001-20240624   gcc-8
i386         buildonly-randconfig-002-20240624   gcc-13
i386         buildonly-randconfig-003-20240624   clang-18
i386         buildonly-randconfig-004-20240624   gcc-10
i386         buildonly-randconfig-005-20240624   clang-18
i386         buildonly-randconfig-006-20240624   clang-18
i386                  randconfig-001-20240624   clang-18
i386                  randconfig-002-20240624   clang-18
i386                  randconfig-003-20240624   gcc-13
i386                  randconfig-004-20240624   gcc-13
i386                  randconfig-005-20240624   gcc-13
i386                  randconfig-006-20240624   clang-18
i386                  randconfig-011-20240624   clang-18
i386                  randconfig-012-20240624   clang-18
i386                  randconfig-013-20240624   gcc-9
i386                  randconfig-014-20240624   clang-18
i386                  randconfig-015-20240624   clang-18
i386                  randconfig-016-20240624   gcc-9
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240625   gcc-13.2.0
loongarch             randconfig-002-20240625   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240625   gcc-13.2.0
nios2                 randconfig-002-20240625   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240625   gcc-13.2.0
parisc                randconfig-002-20240625   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-001-20240625   clang-19
powerpc               randconfig-002-20240625   gcc-13.2.0
powerpc               randconfig-003-20240625   gcc-13.2.0
powerpc64             randconfig-001-20240625   gcc-13.2.0
powerpc64             randconfig-002-20240625   clang-19
powerpc64             randconfig-003-20240625   clang-17
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240625   gcc-13.2.0
riscv                 randconfig-002-20240625   clang-19
s390                              allnoconfig   clang-19
s390                                defconfig   clang-19
s390                  randconfig-001-20240625   clang-19
s390                  randconfig-002-20240625   clang-19
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240625   gcc-13.2.0
sh                    randconfig-002-20240625   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240625   gcc-13.2.0
sparc64               randconfig-002-20240625   gcc-13.2.0
um                                allnoconfig   clang-17
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240625   clang-19
um                    randconfig-002-20240625   clang-19
um                           x86_64_defconfig   clang-15
x86_64       buildonly-randconfig-001-20240625   gcc-13
x86_64       buildonly-randconfig-002-20240625   clang-18
x86_64       buildonly-randconfig-003-20240625   clang-18
x86_64       buildonly-randconfig-004-20240625   clang-18
x86_64       buildonly-randconfig-005-20240625   clang-18
x86_64       buildonly-randconfig-006-20240625   clang-18
x86_64                randconfig-001-20240625   clang-18
x86_64                randconfig-002-20240625   gcc-13
x86_64                randconfig-003-20240625   gcc-13
x86_64                randconfig-004-20240625   clang-18
x86_64                randconfig-005-20240625   clang-18
x86_64                randconfig-006-20240625   gcc-13
x86_64                randconfig-011-20240625   clang-18
x86_64                randconfig-012-20240625   gcc-13
x86_64                randconfig-013-20240625   clang-18
x86_64                randconfig-014-20240625   clang-18
x86_64                randconfig-015-20240625   gcc-13
x86_64                randconfig-016-20240625   gcc-11
x86_64                randconfig-071-20240625   gcc-13
x86_64                randconfig-072-20240625   clang-18
x86_64                randconfig-073-20240625   clang-18
x86_64                randconfig-074-20240625   gcc-13
x86_64                randconfig-075-20240625   clang-18
x86_64                randconfig-076-20240625   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240625   gcc-13.2.0
xtensa                randconfig-002-20240625   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
