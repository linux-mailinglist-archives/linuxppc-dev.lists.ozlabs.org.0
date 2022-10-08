Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D6C5F8863
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 00:54:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlL8c66Clz3c16
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 09:54:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g+jbDb7s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g+jbDb7s;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MlL7f20q1z2xfm
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 09:53:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665269614; x=1696805614;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5kmp0W7hwUyf+RqdJYOIt5O9ShDpqtZ9pBD+0DGZw6w=;
  b=g+jbDb7suy9BawWZ5MNnm0D+EuPrw6sQjYDivBC0XBDSZcNq37eYXvXV
   au0LIHVeFCBrf6oey1GmwKbumHb1WiNr3bI4oGhrkmY/yOY5EV50sZ17j
   puo5N7/4PGEyvXBGm/RMiNYx/6m7/YUWaml99ThQJE+ba7KjGIUkGYedH
   CYSax9+S91VIeR4HwSyMA+hkhtX4ctBlogTOtEjA6rONTEpyb7pn+h0x+
   56wdhCspahqT2BSH6qYsTX2D+he2UO6B1pLcxRBgb5vDly/GxIz6Gt1vi
   TtV6naNguPH6Hkkgtt6ItCmFQouhACSkFyDGpyqNvdK9kYfG4MxBhvIjx
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10494"; a="305007531"
X-IronPort-AV: E=Sophos;i="5.95,170,1661842800"; 
   d="scan'208";a="305007531"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2022 15:53:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10494"; a="603287240"
X-IronPort-AV: E=Sophos;i="5.95,170,1661842800"; 
   d="scan'208";a="603287240"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Oct 2022 15:53:28 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ohIhE-0000ZE-11;
	Sat, 08 Oct 2022 22:53:28 +0000
Date: Sun, 09 Oct 2022 06:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 376b3275c19f83d373e841e9af2d7658693190b9
Message-ID: <6341ff34.zGt/X/ulgbtASGCt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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
branch HEAD: 376b3275c19f83d373e841e9af2d7658693190b9  KVM: PPC: Book3S HV: Fix stack frame regs marker

elapsed time: 735m

configs tested: 149
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
x86_64                              defconfig
alpha                               defconfig
arc                                 defconfig
s390                                defconfig
i386                 randconfig-a011-20221003
i386                 randconfig-a015-20221003
i386                 randconfig-a016-20221003
i386                 randconfig-a014-20221003
i386                 randconfig-a012-20221003
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64               randconfig-a011-20221003
s390                             allmodconfig
x86_64               randconfig-a014-20221003
x86_64                        randconfig-a013
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a012-20221003
arm                                 defconfig
x86_64               randconfig-a013-20221003
x86_64               randconfig-a015-20221003
x86_64               randconfig-a016-20221003
i386                 randconfig-a013-20221003
x86_64                        randconfig-a011
x86_64                           allyesconfig
s390                             allyesconfig
x86_64                           rhel-8.3-kvm
powerpc                           allnoconfig
m68k                             allmodconfig
x86_64                           rhel-8.3-syz
arc                              allyesconfig
powerpc                          allmodconfig
x86_64                         rhel-8.3-kunit
alpha                            allyesconfig
m68k                             allyesconfig
mips                             allyesconfig
x86_64                        randconfig-a015
i386                             allyesconfig
arc                  randconfig-r043-20221002
sh                  sh7785lcr_32bit_defconfig
sh                               allmodconfig
riscv                randconfig-r042-20221007
riscv                randconfig-r042-20221003
arc                  randconfig-r043-20221007
ia64                             allmodconfig
csky                              allnoconfig
arc                               allnoconfig
sparc64                          alldefconfig
arc                  randconfig-r043-20221008
powerpc                     ep8248e_defconfig
arm                          badge4_defconfig
sh                          r7780mp_defconfig
arc                  randconfig-r043-20221003
mips                         db1xxx_defconfig
arc                        vdk_hs38_defconfig
alpha                             allnoconfig
ia64                                defconfig
riscv                             allnoconfig
powerpc                     redwood_defconfig
arm                        clps711x_defconfig
sh                           se7751_defconfig
arc                        nsim_700_defconfig
arm64                            allyesconfig
arm                             pxa_defconfig
arm                              allyesconfig
nios2                               defconfig
s390                 randconfig-r044-20221007
s390                 randconfig-r044-20221003
m68k                        stmark2_defconfig
sh                          kfr2r09_defconfig
powerpc                    klondike_defconfig
arm                        oxnas_v6_defconfig
powerpc                     sequoia_defconfig
um                               alldefconfig
riscv                randconfig-r042-20221009
arc                  randconfig-r043-20221009
s390                 randconfig-r044-20221009
sh                        dreamcast_defconfig
s390                          debug_defconfig
powerpc                     asp8347_defconfig
nios2                            alldefconfig
powerpc                         wii_defconfig
sparc                       sparc32_defconfig
m68k                          atari_defconfig
sh                           se7780_defconfig
x86_64                           alldefconfig
i386                          randconfig-c001
mips                 randconfig-c004-20221002
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                         ps3_defconfig
m68k                        mvme147_defconfig
arm                        spear6xx_defconfig
powerpc                     rainier_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                     decstation_defconfig
m68k                            q40_defconfig
powerpc                   motionpro_defconfig
powerpc                  storcenter_defconfig
arm                  randconfig-c002-20221009
x86_64                        randconfig-c001

clang tested configs:
x86_64               randconfig-a003-20221003
i386                 randconfig-a004-20221003
x86_64               randconfig-a006-20221003
x86_64               randconfig-a002-20221003
i386                 randconfig-a003-20221003
i386                 randconfig-a002-20221003
x86_64               randconfig-a001-20221003
i386                 randconfig-a001-20221003
x86_64               randconfig-a004-20221003
i386                 randconfig-a005-20221003
i386                 randconfig-a006-20221003
x86_64                        randconfig-a016
x86_64               randconfig-a005-20221003
x86_64                        randconfig-a012
hexagon              randconfig-r041-20221002
hexagon              randconfig-r045-20221002
x86_64                        randconfig-a014
riscv                randconfig-r042-20221002
hexagon              randconfig-r041-20221003
s390                 randconfig-r044-20221002
hexagon              randconfig-r041-20221008
hexagon              randconfig-r045-20221008
hexagon              randconfig-r045-20221007
riscv                randconfig-r042-20221008
hexagon              randconfig-r041-20221007
arm                        mvebu_v5_defconfig
s390                             alldefconfig
powerpc                 mpc832x_mds_defconfig
hexagon              randconfig-r045-20221003
s390                 randconfig-r044-20221008
arm                           spitz_defconfig
arm                  colibri_pxa300_defconfig
x86_64                        randconfig-k001
mips                       lemote2f_defconfig
mips                   sb1250_swarm_defconfig
arm                       mainstone_defconfig
arm                         s3c2410_defconfig
powerpc                  mpc866_ads_defconfig
hexagon                          alldefconfig
arm                    vt8500_v6_v7_defconfig
arm                         socfpga_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
