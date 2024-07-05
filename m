Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD27928785
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2024 13:09:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RJQrY8TJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFrPS4VvLz3d8t
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2024 21:09:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RJQrY8TJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFrNk1s79z3cW7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2024 21:08:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720177718; x=1751713718;
  h=date:from:to:cc:subject:message-id;
  bh=4XY7/yJIbgEyQ3ON6kBoxvTkmV1yLSE66eMbNfEg7zs=;
  b=RJQrY8TJ+2mW/Tt3pgHeLm77SAbAHjxLGWKdH5OPu/MaUJh7hCVQ6ZWL
   3BdQpWqLBhDelZTNGrKs+Ff3TNaL/fFujZoqQEbCwSZIUSpcDefozBgbD
   cqNire2WYYAa2M+GkNu5+Tlfe2Rx/hUN6jlu4cymm6InmpV4rvDYwdrTW
   qq/kuQYigAVqYheACBAl85+X4JH3XO9UsPaX8bZCVEv/WXFwxQWxw2Sr/
   4UifA8aeA3vgic6ZAdStpv+hmqKR5F2yjXUcj5+BEZf2GqwUdNKP2DbEB
   LXKHeStRPjBBxQ6dbrdaiy82uwu003cS3FQYsDvCVBhvjmC8VrKJV2A2g
   A==;
X-CSE-ConnectionGUID: M9a2r1L5QC2VQSurW07Zzg==
X-CSE-MsgGUID: 5KVtT9tlQoygx0VP9QvtJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28622244"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="28622244"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 04:08:33 -0700
X-CSE-ConnectionGUID: DrK4OnoDQ1OMl/L4p2ppRw==
X-CSE-MsgGUID: oPBqWfcURgCMQpkrspdOzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="47592610"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Jul 2024 04:08:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPgnl-000SIr-1i;
	Fri, 05 Jul 2024 11:08:29 +0000
Date: Fri, 05 Jul 2024 19:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 20ce0c247b2500cb7060cb115274ba71abda2626
Message-ID: <202407051930.wT2BHmTg-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 20ce0c247b2500cb7060cb115274ba71abda2626  powerpc/pci: Hotplug driver bridge support

elapsed time: 1257m

configs tested: 211
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              alldefconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                     haps_hs_smp_defconfig   gcc-13.2.0
arc                        nsim_700_defconfig   gcc-13.2.0
arc                   randconfig-001-20240705   gcc-13.2.0
arc                   randconfig-002-20240705   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         axm55xx_defconfig   gcc-13.2.0
arm                     davinci_all_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                            mps2_defconfig   gcc-13.2.0
arm                             mxs_defconfig   gcc-13.2.0
arm                       omap2plus_defconfig   gcc-13.2.0
arm                          pxa3xx_defconfig   gcc-13.2.0
arm                   randconfig-001-20240705   gcc-13.2.0
arm                   randconfig-002-20240705   gcc-13.2.0
arm                   randconfig-003-20240705   gcc-13.2.0
arm                   randconfig-004-20240705   gcc-13.2.0
arm                           sama7_defconfig   gcc-13.2.0
arm                          sp7021_defconfig   gcc-13.2.0
arm                           u8500_defconfig   gcc-13.2.0
arm                         vf610m4_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240705   gcc-13.2.0
arm64                 randconfig-002-20240705   gcc-13.2.0
arm64                 randconfig-003-20240705   gcc-13.2.0
arm64                 randconfig-004-20240705   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240705   gcc-13.2.0
csky                  randconfig-002-20240705   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240705   gcc-13
i386         buildonly-randconfig-002-20240705   gcc-13
i386         buildonly-randconfig-002-20240705   gcc-9
i386         buildonly-randconfig-003-20240705   gcc-11
i386         buildonly-randconfig-003-20240705   gcc-13
i386         buildonly-randconfig-004-20240705   clang-18
i386         buildonly-randconfig-004-20240705   gcc-13
i386         buildonly-randconfig-005-20240705   clang-18
i386         buildonly-randconfig-005-20240705   gcc-13
i386         buildonly-randconfig-006-20240705   clang-18
i386         buildonly-randconfig-006-20240705   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240705   gcc-13
i386                  randconfig-002-20240705   clang-18
i386                  randconfig-002-20240705   gcc-13
i386                  randconfig-003-20240705   gcc-11
i386                  randconfig-003-20240705   gcc-13
i386                  randconfig-004-20240705   gcc-13
i386                  randconfig-005-20240705   clang-18
i386                  randconfig-005-20240705   gcc-13
i386                  randconfig-006-20240705   clang-18
i386                  randconfig-006-20240705   gcc-13
i386                  randconfig-011-20240705   gcc-13
i386                  randconfig-012-20240705   gcc-13
i386                  randconfig-013-20240705   clang-18
i386                  randconfig-013-20240705   gcc-13
i386                  randconfig-014-20240705   gcc-13
i386                  randconfig-014-20240705   gcc-8
i386                  randconfig-015-20240705   gcc-10
i386                  randconfig-015-20240705   gcc-13
i386                  randconfig-016-20240705   clang-18
i386                  randconfig-016-20240705   gcc-13
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch                 loongson3_defconfig   gcc-13.2.0
loongarch             randconfig-001-20240705   gcc-13.2.0
loongarch             randconfig-002-20240705   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                         apollo_defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                            mac_defconfig   gcc-13.2.0
m68k                        mvme16x_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                         bigsur_defconfig   gcc-13.2.0
mips                     cu1830-neo_defconfig   gcc-13.2.0
mips                  decstation_64_defconfig   gcc-13.2.0
mips                     decstation_defconfig   gcc-13.2.0
mips                     loongson1c_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240705   gcc-13.2.0
nios2                 randconfig-002-20240705   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                generic-32bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240705   gcc-13.2.0
parisc                randconfig-002-20240705   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   gcc-13.2.0
powerpc                      chrp32_defconfig   gcc-13.2.0
powerpc                   currituck_defconfig   gcc-13.2.0
powerpc                          g5_defconfig   gcc-13.2.0
powerpc                    ge_imp3a_defconfig   gcc-13.2.0
powerpc                  iss476-smp_defconfig   gcc-13.2.0
powerpc                 mpc8313_rdb_defconfig   gcc-13.2.0
powerpc               mpc834x_itxgp_defconfig   gcc-13.2.0
powerpc                      pasemi_defconfig   gcc-13.2.0
powerpc                      pcm030_defconfig   gcc-13.2.0
powerpc                     ppa8548_defconfig   gcc-13.2.0
powerpc                       ppc64_defconfig   gcc-13.2.0
powerpc                         ps3_defconfig   gcc-13.2.0
powerpc                     redwood_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240705   gcc-13.2.0
powerpc64             randconfig-002-20240705   gcc-13.2.0
powerpc64             randconfig-003-20240705   gcc-13.2.0
riscv                            allmodconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
riscv                 randconfig-001-20240705   gcc-13.2.0
riscv                 randconfig-002-20240705   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   gcc-13.2.0
s390                  randconfig-001-20240705   gcc-13.2.0
s390                  randconfig-002-20240705   gcc-13.2.0
s390                       zfcpdump_defconfig   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                     magicpanelr2_defconfig   gcc-13.2.0
sh                    randconfig-001-20240705   gcc-13.2.0
sh                    randconfig-002-20240705   gcc-13.2.0
sh                   rts7751r2dplus_defconfig   gcc-13.2.0
sh                           se7206_defconfig   gcc-13.2.0
sh                           se7343_defconfig   gcc-13.2.0
sh                           se7712_defconfig   gcc-13.2.0
sh                          urquell_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240705   gcc-13.2.0
sparc64               randconfig-002-20240705   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.2.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240705   gcc-13.2.0
um                    randconfig-002-20240705   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240705   gcc-7
x86_64       buildonly-randconfig-002-20240705   gcc-7
x86_64       buildonly-randconfig-003-20240705   gcc-7
x86_64       buildonly-randconfig-004-20240705   gcc-7
x86_64       buildonly-randconfig-005-20240705   gcc-7
x86_64       buildonly-randconfig-006-20240705   gcc-7
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240705   gcc-7
x86_64                randconfig-002-20240705   gcc-7
x86_64                randconfig-003-20240705   gcc-7
x86_64                randconfig-004-20240705   gcc-7
x86_64                randconfig-005-20240705   gcc-7
x86_64                randconfig-006-20240705   gcc-7
x86_64                randconfig-011-20240705   gcc-7
x86_64                randconfig-012-20240705   gcc-7
x86_64                randconfig-013-20240705   gcc-7
x86_64                randconfig-014-20240705   gcc-7
x86_64                randconfig-015-20240705   gcc-7
x86_64                randconfig-016-20240705   gcc-7
x86_64                randconfig-071-20240705   gcc-7
x86_64                randconfig-072-20240705   gcc-7
x86_64                randconfig-073-20240705   gcc-7
x86_64                randconfig-074-20240705   gcc-7
x86_64                randconfig-075-20240705   gcc-7
x86_64                randconfig-076-20240705   gcc-7
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                       common_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240705   gcc-13.2.0
xtensa                randconfig-002-20240705   gcc-13.2.0
xtensa                    xip_kc705_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
