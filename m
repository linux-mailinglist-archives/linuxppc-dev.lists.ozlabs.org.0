Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3969370A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 00:32:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XL0/CPuL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQ6y25Fhhz3fQW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 08:32:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XL0/CPuL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQ6xJ3hmKz3dL7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2024 08:32:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721341925; x=1752877925;
  h=date:from:to:cc:subject:message-id;
  bh=fkTVUBDW5EY3km3sRbqV/g9JXFVqDpd1PqpV9+/eFU8=;
  b=XL0/CPuLXUMRkkRspj9RJGctwLLb3AkPcb2Weh+rnqttRrBe0UKwEFhy
   LEifTzwsIWcezq1dYtmok9AxJmY6wRoiqw/sAOl3JvVeEDMy04B9cixMO
   EVky2IJ5+P52GVj7c02Es2gAE6UODpWBDaURyj43Qf5w1KYGStHRkc4zm
   nWQV5pMhw/ZRRloaOTRVO8yt65FbFvL1eMg6rykfjL5gAsQ2manQBE86q
   urWMussuwEFEvS1TZ6U7xw0mBMGoGf21czYIA10RmWxTfGJMHXb8My7RC
   8EyzYBBuPjP/TVQBKbfDL2v1KlCKGKGtw4cdtB/Xq+Ka9erunL5aOs9ck
   w==;
X-CSE-ConnectionGUID: AG967UzlTvSe17a/H36J9w==
X-CSE-MsgGUID: nL98kZ1TTXyK6/QDkujlVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="22747386"
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="22747386"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 15:31:56 -0700
X-CSE-ConnectionGUID: VzCr0n5IRyCYskanwKJ/6g==
X-CSE-MsgGUID: r1vDjHT/R/CtCldxhqjKHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="51611030"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Jul 2024 15:31:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUZfE-000hdE-0X;
	Thu, 18 Jul 2024 22:31:52 +0000
Date: Fri, 19 Jul 2024 06:31:18 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 9ff0251b2eb54d17fbe4f6aff50f6edfd837adb6
Message-ID: <202407190616.inZErCm6-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 9ff0251b2eb54d17fbe4f6aff50f6edfd837adb6  Merge branch 'topic/ppc-kvm' into next

elapsed time: 985m

configs tested: 238
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc-13.3.0
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                            hsdk_defconfig   gcc-13.2.0
arc                   randconfig-001-20240718   gcc-13.2.0
arc                   randconfig-002-20240718   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                           h3600_defconfig   gcc-13.2.0
arm                            hisi_defconfig   gcc-13.3.0
arm                            mmp2_defconfig   gcc-13.2.0
arm                          moxart_defconfig   gcc-13.2.0
arm                          moxart_defconfig   gcc-14.1.0
arm                         nhk8815_defconfig   gcc-14.1.0
arm                   randconfig-001-20240718   gcc-13.2.0
arm                   randconfig-002-20240718   gcc-13.2.0
arm                   randconfig-003-20240718   gcc-13.2.0
arm                   randconfig-004-20240718   gcc-13.2.0
arm                           spitz_defconfig   gcc-13.3.0
arm                       versatile_defconfig   gcc-13.3.0
arm                        vexpress_defconfig   gcc-14.1.0
arm                         vf610m4_defconfig   gcc-13.3.0
arm64                            alldefconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240718   gcc-13.2.0
arm64                 randconfig-002-20240718   gcc-13.2.0
arm64                 randconfig-003-20240718   gcc-13.2.0
arm64                 randconfig-004-20240718   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240718   gcc-13.2.0
csky                  randconfig-002-20240718   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240718   gcc-11
i386         buildonly-randconfig-001-20240719   clang-18
i386         buildonly-randconfig-002-20240718   gcc-11
i386         buildonly-randconfig-002-20240718   gcc-7
i386         buildonly-randconfig-002-20240719   clang-18
i386         buildonly-randconfig-003-20240718   gcc-11
i386         buildonly-randconfig-003-20240718   gcc-13
i386         buildonly-randconfig-003-20240719   clang-18
i386         buildonly-randconfig-004-20240718   clang-18
i386         buildonly-randconfig-004-20240718   gcc-11
i386         buildonly-randconfig-004-20240719   clang-18
i386         buildonly-randconfig-005-20240718   gcc-11
i386         buildonly-randconfig-005-20240718   gcc-9
i386         buildonly-randconfig-005-20240719   clang-18
i386         buildonly-randconfig-006-20240718   gcc-11
i386         buildonly-randconfig-006-20240718   gcc-13
i386         buildonly-randconfig-006-20240719   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240718   gcc-11
i386                  randconfig-001-20240718   gcc-13
i386                  randconfig-001-20240719   clang-18
i386                  randconfig-002-20240718   gcc-11
i386                  randconfig-002-20240718   gcc-13
i386                  randconfig-002-20240719   clang-18
i386                  randconfig-003-20240718   clang-18
i386                  randconfig-003-20240718   gcc-11
i386                  randconfig-003-20240719   clang-18
i386                  randconfig-004-20240718   clang-18
i386                  randconfig-004-20240718   gcc-11
i386                  randconfig-004-20240719   clang-18
i386                  randconfig-005-20240718   clang-18
i386                  randconfig-005-20240718   gcc-11
i386                  randconfig-005-20240719   clang-18
i386                  randconfig-006-20240718   clang-18
i386                  randconfig-006-20240718   gcc-11
i386                  randconfig-006-20240719   clang-18
i386                  randconfig-011-20240718   gcc-11
i386                  randconfig-011-20240718   gcc-13
i386                  randconfig-011-20240719   clang-18
i386                  randconfig-012-20240718   gcc-11
i386                  randconfig-012-20240718   gcc-13
i386                  randconfig-012-20240719   clang-18
i386                  randconfig-013-20240718   gcc-10
i386                  randconfig-013-20240718   gcc-11
i386                  randconfig-013-20240719   clang-18
i386                  randconfig-014-20240718   clang-18
i386                  randconfig-014-20240718   gcc-11
i386                  randconfig-014-20240719   clang-18
i386                  randconfig-015-20240718   clang-18
i386                  randconfig-015-20240718   gcc-11
i386                  randconfig-015-20240719   clang-18
i386                  randconfig-016-20240718   gcc-11
i386                  randconfig-016-20240718   gcc-13
i386                  randconfig-016-20240719   clang-18
loongarch                        alldefconfig   gcc-14.1.0
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240718   gcc-13.2.0
loongarch             randconfig-002-20240718   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         amcore_defconfig   gcc-13.3.0
m68k                                defconfig   gcc-13.2.0
m68k                        mvme16x_defconfig   gcc-14.1.0
m68k                           virt_defconfig   gcc-13.3.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                         cobalt_defconfig   gcc-13.3.0
mips                         db1xxx_defconfig   gcc-14.1.0
mips                  decstation_64_defconfig   gcc-14.1.0
mips                          eyeq5_defconfig   gcc-13.2.0
mips                           ip27_defconfig   gcc-13.3.0
mips                        maltaup_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240718   gcc-13.2.0
nios2                 randconfig-002-20240718   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240718   gcc-13.2.0
parisc                randconfig-002-20240718   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-14.1.0
powerpc                 canyonlands_defconfig   gcc-13.3.0
powerpc                  iss476-smp_defconfig   gcc-13.2.0
powerpc                      katmai_defconfig   gcc-13.2.0
powerpc                       maple_defconfig   gcc-13.2.0
powerpc                   microwatt_defconfig   gcc-13.3.0
powerpc                 mpc834x_itx_defconfig   gcc-13.3.0
powerpc                  mpc866_ads_defconfig   gcc-14.1.0
powerpc                    mvme5100_defconfig   gcc-13.2.0
powerpc                      ppc64e_defconfig   gcc-14.1.0
powerpc                      ppc6xx_defconfig   gcc-13.3.0
powerpc                     tqm8548_defconfig   gcc-13.3.0
powerpc                 xes_mpc85xx_defconfig   gcc-14.1.0
powerpc64             randconfig-001-20240718   gcc-13.2.0
powerpc64             randconfig-002-20240718   gcc-13.2.0
powerpc64             randconfig-003-20240718   gcc-13.2.0
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240718   gcc-13.2.0
riscv                 randconfig-002-20240718   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240718   gcc-13.2.0
s390                  randconfig-002-20240718   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                         apsh4a3a_defconfig   gcc-13.3.0
sh                        apsh4ad0a_defconfig   gcc-13.3.0
sh                                  defconfig   gcc-14.1.0
sh                         ecovec24_defconfig   gcc-14.1.0
sh                            hp6xx_defconfig   gcc-13.2.0
sh                          landisk_defconfig   gcc-13.2.0
sh                    randconfig-001-20240718   gcc-13.2.0
sh                    randconfig-002-20240718   gcc-13.2.0
sh                           se7206_defconfig   gcc-13.2.0
sh                           se7722_defconfig   gcc-13.2.0
sh                   sh7724_generic_defconfig   gcc-13.2.0
sh                        sh7763rdp_defconfig   gcc-13.3.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240718   gcc-13.2.0
sparc64               randconfig-002-20240718   gcc-13.2.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240718   gcc-13.2.0
um                    randconfig-002-20240718   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240718   gcc-11
x86_64       buildonly-randconfig-002-20240718   gcc-11
x86_64       buildonly-randconfig-003-20240718   gcc-11
x86_64       buildonly-randconfig-004-20240718   gcc-11
x86_64       buildonly-randconfig-005-20240718   gcc-11
x86_64       buildonly-randconfig-006-20240718   gcc-11
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240718   gcc-11
x86_64                randconfig-002-20240718   gcc-11
x86_64                randconfig-003-20240718   gcc-11
x86_64                randconfig-004-20240718   gcc-11
x86_64                randconfig-005-20240718   gcc-11
x86_64                randconfig-006-20240718   gcc-11
x86_64                randconfig-011-20240718   gcc-11
x86_64                randconfig-012-20240718   gcc-11
x86_64                randconfig-013-20240718   gcc-11
x86_64                randconfig-014-20240718   gcc-11
x86_64                randconfig-015-20240718   gcc-11
x86_64                randconfig-016-20240718   gcc-11
x86_64                randconfig-071-20240718   gcc-11
x86_64                randconfig-072-20240718   gcc-11
x86_64                randconfig-073-20240718   gcc-11
x86_64                randconfig-074-20240718   gcc-11
x86_64                randconfig-075-20240718   gcc-11
x86_64                randconfig-076-20240718   gcc-11
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                  audio_kc705_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240718   gcc-13.2.0
xtensa                randconfig-002-20240718   gcc-13.2.0
xtensa                    xip_kc705_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
