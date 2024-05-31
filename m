Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4118D62B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 15:17:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G4za6dA7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrNv44zHVz30WC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 23:17:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G4za6dA7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrNsZ0SPdz3cQD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 23:15:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717161347; x=1748697347;
  h=date:from:to:cc:subject:message-id;
  bh=yAjCqCnQORGSW6+5Dcjxdp+de1+K/jDIIP5EciQy32w=;
  b=G4za6dA7s/PnmMVyOWtucyIUZH3mDNvZNRXj7LfR8ZYtaZneYsPa4K9B
   YuASN9kAaQff7HvQXq2IDVog01tsWfcLA/LPemrGK+8vtb4GnNMJ8LWkl
   DwaRx6Xa1tBPYzsHoFgK1/O1zbNoTNK11xZmopKSMfyvqXeIa4lDHbI9h
   4jH8QBZ+wOvHNwD11eYKC8GHNfhV5wL+jns0iBbJK7H7DHUJFV2bj92MA
   rp3FRlgEAdwp/vVSIWCpRNLJGklFw5UNcEzB53znbgq+T4kqeWZgUf6BN
   lnJGukwR0iD6ve3nnU1F2iyzsNF9qgQdIokbWTe0AqVei0Wj8ZIHgUgqk
   Q==;
X-CSE-ConnectionGUID: PqU2yA71TEOphXGL0F4oFg==
X-CSE-MsgGUID: uAUl2vB0SoSqrgtrg34wNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13824548"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="13824548"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 06:15:44 -0700
X-CSE-ConnectionGUID: D2cGD/DqQjqKQbYC2pqgyw==
X-CSE-MsgGUID: e3dHW4uSTRC9FLPeQOTi+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="40715208"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 31 May 2024 06:15:43 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD26c-000H8A-0k;
	Fri, 31 May 2024 13:15:39 +0000
Date: Fri, 31 May 2024 21:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/ppc-kvm] BUILD SUCCESS
 c6482eb8d937f3c97f4e73253810173c0040fd7d
Message-ID: <202405312127.mFBb4ftQ-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
branch HEAD: c6482eb8d937f3c97f4e73253810173c0040fd7d  KVM: PPC: Book3S HV nestedv2: Add support for reading VPA counters for pseries guests

elapsed time: 1338m

configs tested: 117
configs skipped: 155

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240531   gcc  
arc                   randconfig-002-20240531   gcc  
arm                            mmp2_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                        vexpress_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-003-20240531   gcc  
arm64                 randconfig-004-20240531   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240531   gcc  
csky                  randconfig-002-20240531   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
i386         buildonly-randconfig-001-20240531   clang
i386         buildonly-randconfig-004-20240531   clang
i386         buildonly-randconfig-006-20240531   clang
i386                                defconfig   clang
i386                  randconfig-002-20240531   clang
i386                  randconfig-003-20240531   clang
i386                  randconfig-005-20240531   clang
i386                  randconfig-006-20240531   clang
i386                  randconfig-011-20240531   clang
i386                  randconfig-014-20240531   clang
i386                  randconfig-016-20240531   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240531   gcc  
loongarch             randconfig-002-20240531   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  decstation_64_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240531   gcc  
nios2                 randconfig-002-20240531   gcc  
openrisc                         allmodconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                randconfig-001-20240531   gcc  
parisc                randconfig-002-20240531   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240531   clang
powerpc               randconfig-002-20240531   clang
powerpc               randconfig-003-20240531   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc64             randconfig-001-20240531   clang
powerpc64             randconfig-002-20240531   clang
powerpc64             randconfig-003-20240531   gcc  
riscv                            allmodconfig   clang
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240531   gcc  
s390                  randconfig-002-20240531   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                    randconfig-001-20240531   gcc  
sh                    randconfig-002-20240531   gcc  
sh                           se7343_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20240531   gcc  
sparc64               randconfig-002-20240531   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240531   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240531   clang
x86_64       buildonly-randconfig-003-20240531   clang
x86_64       buildonly-randconfig-004-20240531   clang
x86_64       buildonly-randconfig-006-20240531   clang
x86_64                randconfig-002-20240531   clang
x86_64                randconfig-011-20240531   clang
x86_64                randconfig-014-20240531   clang
x86_64                randconfig-071-20240531   clang
x86_64                randconfig-075-20240531   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240531   gcc  
xtensa                randconfig-002-20240531   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
