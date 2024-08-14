Return-Path: <linuxppc-dev+bounces-85-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E95F2951BCE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2024 15:27:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hUSJ1Z19;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkTYx29Nnz2ydW;
	Wed, 14 Aug 2024 23:27:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hUSJ1Z19;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkTYv1H2Nz2yYY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 23:26:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723642019; x=1755178019;
  h=date:from:to:cc:subject:message-id;
  bh=v6dJhiyrW8pk0R/34jSwL8qL8xYsUWFMt6vhvb1HRNk=;
  b=hUSJ1Z19EBQUTCMyDSZtr+7SLkLOxij+wIpkrlwQJMQHI6g0eyzDcOOm
   FlzclFX0bBb2S3YtKuDPXQCq0pm3utIdLwVpfqgtv11ekV4ESO7Tj2eem
   +6sDqzbQ4Uer0VrVsIe8JZFDFIHU70SfRALNNeC9heI51wL+QlzkA9b4j
   1H1pSytojes5oqhOcSye+nq3scaj42i8EDg0Byqc0MsrAKNCpHuy5wpQb
   hP9yNldfjtit7vfjGBEYg303bfzfUBSKSOjlIh/rZP9uoqr7tJNxYxKXy
   ieHit1+W8nvpaFbLv/qrNXRIRwSLuL/dmGDKkFqSThORmKBFQrMyMJ6mp
   A==;
X-CSE-ConnectionGUID: vfAuYw7xQSu09s8m5zvkuQ==
X-CSE-MsgGUID: FhJzjPHGSBq8qvjXPdbG9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21996381"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="21996381"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 06:26:52 -0700
X-CSE-ConnectionGUID: VigXyBVUReS+JtaJHRAssw==
X-CSE-MsgGUID: nBI0K28zSdSymXUuYdfdIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="58894416"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Aug 2024 06:26:51 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seE1Y-0001gd-2T;
	Wed, 14 Aug 2024 13:26:48 +0000
Date: Wed, 14 Aug 2024 21:25:48 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:topic/ppc-kvm] BUILD SUCCESS
 9739ff4887c77a38575c23b12766b0a37c8be13c
Message-ID: <202408142146.JzQjua4G-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
branch HEAD: 9739ff4887c77a38575c23b12766b0a37c8be13c  KVM: PPC: Book3S HV: Refactor HFSCR emulation for KVM guests

elapsed time: 1457m

configs tested: 191
configs skipped: 154

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240814   gcc-13.2.0
arc                   randconfig-002-20240814   gcc-13.2.0
arc                           tb10x_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         assabet_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                            dove_defconfig   gcc-12.4.0
arm                          exynos_defconfig   clang-17
arm                          gemini_defconfig   clang-17
arm                            hisi_defconfig   gcc-12.4.0
arm                          moxart_defconfig   gcc-12.4.0
arm                         mv78xx0_defconfig   gcc-12.4.0
arm                       omap2plus_defconfig   gcc-13.2.0
arm                         orion5x_defconfig   clang-17
arm                   randconfig-001-20240814   gcc-13.2.0
arm                   randconfig-002-20240814   gcc-13.2.0
arm                   randconfig-003-20240814   gcc-13.2.0
arm                   randconfig-004-20240814   gcc-13.2.0
arm                             rpc_defconfig   clang-17
arm                         s5pv210_defconfig   clang-17
arm                           sunxi_defconfig   gcc-13.2.0
arm                         wpcm450_defconfig   gcc-12.4.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240814   gcc-13.2.0
arm64                 randconfig-002-20240814   gcc-13.2.0
arm64                 randconfig-003-20240814   gcc-13.2.0
arm64                 randconfig-004-20240814   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240814   gcc-13.2.0
csky                  randconfig-002-20240814   gcc-13.2.0
i386                             alldefconfig   gcc-12.4.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240814   clang-18
i386         buildonly-randconfig-002-20240814   clang-18
i386         buildonly-randconfig-003-20240814   clang-18
i386         buildonly-randconfig-004-20240814   clang-18
i386         buildonly-randconfig-005-20240814   clang-18
i386         buildonly-randconfig-006-20240814   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240814   clang-18
i386                  randconfig-002-20240814   clang-18
i386                  randconfig-003-20240814   clang-18
i386                  randconfig-004-20240814   clang-18
i386                  randconfig-005-20240814   clang-18
i386                  randconfig-006-20240814   clang-18
i386                  randconfig-011-20240814   clang-18
i386                  randconfig-012-20240814   clang-18
i386                  randconfig-013-20240814   clang-18
i386                  randconfig-014-20240814   clang-18
i386                  randconfig-015-20240814   clang-18
i386                  randconfig-016-20240814   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240814   gcc-13.2.0
loongarch             randconfig-002-20240814   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         amcore_defconfig   gcc-12.4.0
m68k                                defconfig   gcc-13.2.0
m68k                        mvme16x_defconfig   gcc-12.4.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                       bmips_be_defconfig   gcc-13.2.0
mips                         cobalt_defconfig   clang-17
mips                      fuloong2e_defconfig   clang-17
mips                         rt305x_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240814   gcc-13.2.0
nios2                 randconfig-002-20240814   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
openrisc                  or1klitex_defconfig   gcc-12.4.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240814   gcc-13.2.0
parisc                randconfig-002-20240814   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                     akebono_defconfig   clang-17
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      katmai_defconfig   gcc-12.4.0
powerpc                      katmai_defconfig   gcc-13.2.0
powerpc                       maple_defconfig   clang-17
powerpc                 mpc837x_rdb_defconfig   gcc-13.2.0
powerpc                      ppc44x_defconfig   gcc-13.2.0
powerpc                       ppc64_defconfig   gcc-12.4.0
powerpc               randconfig-002-20240814   gcc-13.2.0
powerpc               randconfig-003-20240814   gcc-13.2.0
powerpc               randconfig-003-20240814   gcc-14.1.0
powerpc                 xes_mpc85xx_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240814   clang-20
powerpc64             randconfig-001-20240814   gcc-13.2.0
powerpc64             randconfig-002-20240814   clang-15
powerpc64             randconfig-002-20240814   gcc-13.2.0
powerpc64             randconfig-003-20240814   clang-20
powerpc64             randconfig-003-20240814   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240814   gcc-13.2.0
riscv                 randconfig-002-20240814   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                                defconfig   gcc-13.2.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240814   gcc-13.2.0
s390                  randconfig-002-20240814   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-14.1.0
sh                          landisk_defconfig   gcc-13.2.0
sh                            migor_defconfig   gcc-12.4.0
sh                          polaris_defconfig   gcc-12.4.0
sh                    randconfig-001-20240814   gcc-13.2.0
sh                    randconfig-002-20240814   gcc-13.2.0
sh                          rsk7269_defconfig   gcc-13.2.0
sh                      rts7751r2d1_defconfig   gcc-12.4.0
sh                          sdk7780_defconfig   gcc-13.2.0
sh                           sh2007_defconfig   gcc-12.4.0
sh                     sh7710voipgw_defconfig   gcc-12.4.0
sparc                       sparc64_defconfig   gcc-12.4.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240814   gcc-13.2.0
sparc64               randconfig-002-20240814   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240814   gcc-13.2.0
um                    randconfig-002-20240814   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240814   clang-18
x86_64       buildonly-randconfig-002-20240814   clang-18
x86_64       buildonly-randconfig-003-20240814   clang-18
x86_64       buildonly-randconfig-004-20240814   clang-18
x86_64       buildonly-randconfig-005-20240814   clang-18
x86_64       buildonly-randconfig-006-20240814   clang-18
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240814   clang-18
x86_64                randconfig-002-20240814   clang-18
x86_64                randconfig-003-20240814   clang-18
x86_64                randconfig-004-20240814   clang-18
x86_64                randconfig-005-20240814   clang-18
x86_64                randconfig-006-20240814   clang-18
x86_64                randconfig-011-20240814   clang-18
x86_64                randconfig-012-20240814   clang-18
x86_64                randconfig-013-20240814   clang-18
x86_64                randconfig-014-20240814   clang-18
x86_64                randconfig-015-20240814   clang-18
x86_64                randconfig-016-20240814   clang-18
x86_64                randconfig-071-20240814   clang-18
x86_64                randconfig-072-20240814   clang-18
x86_64                randconfig-073-20240814   clang-18
x86_64                randconfig-074-20240814   clang-18
x86_64                randconfig-075-20240814   clang-18
x86_64                randconfig-076-20240814   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240814   gcc-13.2.0
xtensa                randconfig-002-20240814   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

