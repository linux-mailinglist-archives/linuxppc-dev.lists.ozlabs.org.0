Return-Path: <linuxppc-dev+bounces-3393-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B0B9D0749
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 01:38:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xs7zF10hFz2y8d;
	Mon, 18 Nov 2024 11:38:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731890329;
	cv=none; b=hzaXRioBGxpEnDP08oM6i1BeLb7ekVqVjRo8v1FQal2lMaAS/s5vKm2I6vZWs9Y9RdaIHUMciyFcpctrWrQrHv1zk1e4cGlUd+yA6XaMf/WYY0/4Ajf3HkbeUh0MVvDMUNwLAtpZ8/4GIW+lKr/479e/vznTuTlWqw4wylsc/7Lwn1uPASxBJuI4sTPO72gyFUDs69QiYl6x1qyE0fiCv8oQ9/WksNWwHmJOpmslnKmbbreZgwQXMICq3VwVDyPZWLBXRcRx4BQIsWkdE0PKjKnH1vx1L1J3LWPLTw6fBDo8IDp++51GWdk3aGF9TygMhjq+9lHPYAXylM84sStNyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731890329; c=relaxed/relaxed;
	bh=C7pu9qmd20BDOEI/Zw/u5rkpyOhh4fAu4i9Vo/KOoHs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NVOgBtQHbHS9hAFCGhu3Rtz3vcAI2Yhn6Fokt/m6fGne/Et/frkupB/vgs+2DqztsV0ojG17qOm5GIqtFhl7SBgx2zYh7EOa1L9vl45SfUE/S3pOYwYRYf4/bdFc/1IrdAts9VNHoLoo0qzzzs/KTN55PYaZzEMi33qsBNlI9RqYeLrS1DgvjtTMPIpZYqP6cOi9EUc3f5YOtLoXMVQIUslfFCfJ8BCimcYjjcCQDPuHFYfXLrWuc72KEd7KcrMN6Vh3YQ285Wz7JYRr3jjK4oURYUyUWkVRAc0pteRJ/pG3/PBja6yyfLSb3r2XNJVlagXj94m3bfQjobon8lj98Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kyAohKsV; dkim-atps=neutral; spf=pass (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kyAohKsV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xs7z92H2vz2y8c
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 11:38:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731890326; x=1763426326;
  h=date:from:to:cc:subject:message-id;
  bh=32P8u+GnaFyQsfCV9kKOlf+6VxWPLdH4RB/0/fYtgIo=;
  b=kyAohKsV5UlBKLNqr9T6wUzTucaf6UXTyVRGv2DH/CphuT/QNR/24Lvw
   jL4lUBxXZ9zi3ZAN/fuL21CO3GafolSYbd/Alsg5/adbOKlh47qD4OuG3
   tsYiKGqiKU9ufMveA5N404sx26T/FwLCr5/9zeqol81x05vvtr7DDu/Bp
   jC14LaeS28zSFLS8JaTOdsyOwpZc6tkKjl4GAUrefSpU5Aow3JaBtwzRa
   y0Bgh078PM5mMT1MTgh9Hk9k9doef55gkzwPykIaKjQsK5dyQypH4ja3s
   QMaDOuo7d0YTWT6fHWSyD8tZEHHzhTUgd/ynZKFtA9Pqo4jjZ9P8nYGxT
   A==;
X-CSE-ConnectionGUID: DeZpSD7PRmapBu2MlsnO8g==
X-CSE-MsgGUID: 3ZxiQmknS4Sl6Dcxj9eZNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31980598"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31980598"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 16:38:40 -0800
X-CSE-ConnectionGUID: UWplRdxuTGSF+Lt+DMVNTg==
X-CSE-MsgGUID: K1OiK4qHSTiT1zZlL1vj+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="88834968"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Nov 2024 16:38:37 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCpmk-00029i-2M;
	Mon, 18 Nov 2024 00:38:34 +0000
Date: Mon, 18 Nov 2024 08:37:58 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:topic/ppc-kvm] BUILD SUCCESS
 590d2f9347f7974d7954400e5d937672fd844a8b
Message-ID: <202411180852.JDUQNB8a-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
branch HEAD: 590d2f9347f7974d7954400e5d937672fd844a8b  KVM: PPC: Book3S HV: Fix kmv -> kvm typo

elapsed time: 4962m

configs tested: 256
configs skipped: 198

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-13.2.0
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.2.0
arc                        nsimosci_defconfig    clang-20
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig    clang-20
arc                   randconfig-001-20241117    clang-20
arc                   randconfig-002-20241117    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                       aspeed_g5_defconfig    clang-20
arm                         axm55xx_defconfig    clang-20
arm                          collie_defconfig    clang-20
arm                                 defconfig    gcc-14.2.0
arm                          ep93xx_defconfig    clang-20
arm                          ixp4xx_defconfig    clang-20
arm                      jornada720_defconfig    clang-20
arm                         lpc18xx_defconfig    clang-20
arm                        multi_v7_defconfig    clang-20
arm                         nhk8815_defconfig    clang-20
arm                          pxa3xx_defconfig    clang-20
arm                             pxa_defconfig    clang-20
arm                   randconfig-001-20241117    clang-20
arm                   randconfig-002-20241117    clang-20
arm                   randconfig-003-20241117    clang-20
arm                   randconfig-004-20241117    clang-20
arm                         s3c6400_defconfig    clang-20
arm                         s5pv210_defconfig    clang-20
arm                           sama7_defconfig    clang-20
arm                           spitz_defconfig    clang-20
arm                           sunxi_defconfig    clang-20
arm                           u8500_defconfig    clang-20
arm                       versatile_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241117    clang-20
arm64                 randconfig-002-20241117    clang-20
arm64                 randconfig-003-20241117    clang-20
arm64                 randconfig-004-20241117    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241117    clang-20
csky                  randconfig-002-20241117    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241117    clang-20
hexagon               randconfig-002-20241117    clang-20
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241117    clang-19
i386        buildonly-randconfig-001-20241118    gcc-12
i386        buildonly-randconfig-002-20241117    clang-19
i386        buildonly-randconfig-002-20241118    gcc-12
i386        buildonly-randconfig-003-20241117    clang-19
i386        buildonly-randconfig-003-20241118    gcc-12
i386        buildonly-randconfig-004-20241117    clang-19
i386        buildonly-randconfig-004-20241118    gcc-12
i386        buildonly-randconfig-005-20241117    clang-19
i386        buildonly-randconfig-005-20241118    gcc-12
i386        buildonly-randconfig-006-20241117    clang-19
i386        buildonly-randconfig-006-20241118    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241117    clang-19
i386                  randconfig-001-20241118    gcc-12
i386                  randconfig-002-20241117    clang-19
i386                  randconfig-002-20241118    gcc-12
i386                  randconfig-003-20241117    clang-19
i386                  randconfig-003-20241118    gcc-12
i386                  randconfig-004-20241117    clang-19
i386                  randconfig-004-20241118    gcc-12
i386                  randconfig-005-20241117    clang-19
i386                  randconfig-005-20241118    gcc-12
i386                  randconfig-006-20241117    clang-19
i386                  randconfig-006-20241118    gcc-12
i386                  randconfig-011-20241117    clang-19
i386                  randconfig-011-20241118    gcc-12
i386                  randconfig-012-20241117    clang-19
i386                  randconfig-012-20241118    gcc-12
i386                  randconfig-013-20241117    clang-19
i386                  randconfig-013-20241118    gcc-12
i386                  randconfig-014-20241117    clang-19
i386                  randconfig-014-20241118    gcc-12
i386                  randconfig-015-20241117    clang-19
i386                  randconfig-015-20241118    gcc-12
i386                  randconfig-016-20241117    clang-19
i386                  randconfig-016-20241118    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241117    clang-20
loongarch             randconfig-002-20241117    clang-20
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         db1xxx_defconfig    clang-20
mips                           ip27_defconfig    clang-20
mips                           jazz_defconfig    clang-20
mips                           mtx1_defconfig    gcc-13.2.0
mips                   sb1250_swarm_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241117    clang-20
nios2                 randconfig-002-20241117    clang-20
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                generic-64bit_defconfig    gcc-13.2.0
parisc                randconfig-001-20241117    clang-20
parisc                randconfig-002-20241117    clang-20
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      cm5200_defconfig    clang-20
powerpc                     ep8248e_defconfig    clang-20
powerpc                    gamecube_defconfig    clang-20
powerpc                     ksi8560_defconfig    gcc-13.2.0
powerpc                 mpc8313_rdb_defconfig    gcc-13.2.0
powerpc                      pmac32_defconfig    clang-20
powerpc                         ps3_defconfig    clang-20
powerpc                     rainier_defconfig    gcc-13.2.0
powerpc               randconfig-001-20241117    clang-20
powerpc               randconfig-002-20241117    clang-20
powerpc               randconfig-003-20241117    clang-20
powerpc                    sam440ep_defconfig    clang-20
powerpc                     sequoia_defconfig    gcc-13.2.0
powerpc                     tqm8560_defconfig    clang-20
powerpc                      tqm8xx_defconfig    clang-20
powerpc                 xes_mpc85xx_defconfig    clang-20
powerpc64                        alldefconfig    clang-20
powerpc64             randconfig-001-20241117    clang-20
powerpc64             randconfig-002-20241117    clang-20
powerpc64             randconfig-003-20241117    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    clang-20
riscv                 randconfig-001-20241117    clang-20
riscv                 randconfig-002-20241117    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241117    clang-20
s390                  randconfig-002-20241117    clang-20
s390                       zfcpdump_defconfig    gcc-13.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    clang-20
sh                               j2_defconfig    gcc-13.2.0
sh                 kfr2r09-romimage_defconfig    clang-20
sh                    randconfig-001-20241117    clang-20
sh                    randconfig-002-20241117    clang-20
sh                           se7206_defconfig    gcc-13.2.0
sh                           se7750_defconfig    clang-20
sh                           se7750_defconfig    gcc-13.2.0
sh                        sh7757lcr_defconfig    clang-20
sh                   sh7770_generic_defconfig    clang-20
sh                        sh7785lcr_defconfig    gcc-13.2.0
sh                            shmin_defconfig    clang-20
sh                          urquell_defconfig    gcc-13.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241117    clang-20
sparc64               randconfig-002-20241117    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241117    clang-20
um                    randconfig-002-20241117    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241117    gcc-12
x86_64      buildonly-randconfig-001-20241118    gcc-12
x86_64      buildonly-randconfig-002-20241117    gcc-12
x86_64      buildonly-randconfig-002-20241118    gcc-12
x86_64      buildonly-randconfig-003-20241117    gcc-12
x86_64      buildonly-randconfig-003-20241118    gcc-12
x86_64      buildonly-randconfig-004-20241117    gcc-12
x86_64      buildonly-randconfig-004-20241118    gcc-12
x86_64      buildonly-randconfig-005-20241117    gcc-12
x86_64      buildonly-randconfig-005-20241118    gcc-12
x86_64      buildonly-randconfig-006-20241117    gcc-12
x86_64      buildonly-randconfig-006-20241118    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241117    gcc-12
x86_64                randconfig-001-20241118    gcc-12
x86_64                randconfig-002-20241117    gcc-12
x86_64                randconfig-002-20241118    gcc-12
x86_64                randconfig-003-20241117    gcc-12
x86_64                randconfig-003-20241118    gcc-12
x86_64                randconfig-004-20241117    gcc-12
x86_64                randconfig-004-20241118    gcc-12
x86_64                randconfig-005-20241117    gcc-12
x86_64                randconfig-005-20241118    gcc-12
x86_64                randconfig-006-20241117    gcc-12
x86_64                randconfig-006-20241118    gcc-12
x86_64                randconfig-011-20241117    gcc-12
x86_64                randconfig-011-20241118    gcc-12
x86_64                randconfig-012-20241117    gcc-12
x86_64                randconfig-012-20241118    gcc-12
x86_64                randconfig-013-20241117    gcc-12
x86_64                randconfig-013-20241118    gcc-12
x86_64                randconfig-014-20241117    gcc-12
x86_64                randconfig-014-20241118    gcc-12
x86_64                randconfig-015-20241117    gcc-12
x86_64                randconfig-015-20241118    gcc-12
x86_64                randconfig-016-20241117    gcc-12
x86_64                randconfig-016-20241118    gcc-12
x86_64                randconfig-071-20241117    gcc-12
x86_64                randconfig-071-20241118    gcc-12
x86_64                randconfig-072-20241117    gcc-12
x86_64                randconfig-072-20241118    gcc-12
x86_64                randconfig-073-20241117    gcc-12
x86_64                randconfig-073-20241118    gcc-12
x86_64                randconfig-074-20241117    gcc-12
x86_64                randconfig-074-20241118    gcc-12
x86_64                randconfig-075-20241117    gcc-12
x86_64                randconfig-075-20241118    gcc-12
x86_64                randconfig-076-20241117    gcc-12
x86_64                randconfig-076-20241118    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    clang-20
xtensa                randconfig-001-20241117    clang-20
xtensa                randconfig-002-20241117    clang-20
xtensa                    xip_kc705_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

