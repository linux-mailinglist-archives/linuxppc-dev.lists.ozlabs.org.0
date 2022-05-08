Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8792B51F1D0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 23:24:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxHPJ2gCnz3cG1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 07:24:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G+Etlp88;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=G+Etlp88; dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxHNZ6Vc3z3c7j
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 07:23:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652045023; x=1683581023;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=A6H0k6brcU7pHQ8afpOPC7MFEz4JBkquyBke3AyoZVM=;
 b=G+Etlp8851k6QQjrD2KklPZlKa77A8mqkXmrwtk4vG56oGLWe4AVh15T
 GHYo/vu+G3aDqCZEXKrPlSZ2uXbOPQTCHV040KBr1QPNbsGiQ8OZkEBle
 M7vJfW8ZlQcYNjL75It1yPtXqzCm6Dc1nDALEUi3MByDud6CVIXYaUscT
 XBLZFiOu0Ci3o+748+oNvvqhyZXWuBHQOj+yUrsZEcobdEFIG1tRNqmL4
 ncCgpxZ4eyfc8jt1Vy1Hyc1v4ZSz0Hcl9BlaPTi2Fzb5vL2eDr+83EaSz
 mX6kwz73yAk9jeC2LIfbSI/rY9t3TcnHMq4ilUJfNR2dd4akxGODEVD2U Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="329466783"
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; d="scan'208";a="329466783"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2022 14:22:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; d="scan'208";a="622659083"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 08 May 2022 14:22:28 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nnoMG-000FqM-5G;
 Sun, 08 May 2022 21:22:28 +0000
Date: Mon, 09 May 2022 05:21:42 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 348c71344111d7a48892e3e52264ff11956fc196
Message-ID: <62783466.FhciSaH1AKJezeC7%lkp@intel.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 348c71344111d7a48892e3e52264ff11956fc196  powerpc/papr_scm: Fix buffer overflow issue with CONFIG_FORTIFY_SOURCE

elapsed time: 739m

configs tested: 153
configs skipped: 100

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
arm                           imxrt_defconfig
arm                      footbridge_defconfig
m68k                             alldefconfig
arm                             ezx_defconfig
powerpc64                           defconfig
h8300                            alldefconfig
powerpc                   motionpro_defconfig
arm                        shmobile_defconfig
sh                   sh7770_generic_defconfig
arm                         lubbock_defconfig
mips                        vocore2_defconfig
ia64                         bigsur_defconfig
mips                  decstation_64_defconfig
h8300                       h8s-sim_defconfig
sh                          kfr2r09_defconfig
sh                           se7712_defconfig
powerpc                     redwood_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc64                        alldefconfig
arc                        nsimosci_defconfig
um                           x86_64_defconfig
arm                        spear6xx_defconfig
powerpc                      cm5200_defconfig
arm                          iop32x_defconfig
arm                        trizeps4_defconfig
sparc                       sparc64_defconfig
ia64                             alldefconfig
mips                       bmips_be_defconfig
powerpc                     rainier_defconfig
sparc                               defconfig
sh                           se7750_defconfig
sh                                  defconfig
mips                 decstation_r4k_defconfig
sh                ecovec24-romimage_defconfig
arm                          lpd270_defconfig
sh                           se7721_defconfig
alpha                            allyesconfig
sh                        apsh4ad0a_defconfig
arm                       aspeed_g5_defconfig
sh                           se7343_defconfig
powerpc                       eiger_defconfig
arm                           sunxi_defconfig
powerpc                      mgcoge_defconfig
sh                           se7751_defconfig
mips                           xway_defconfig
sh                           se7619_defconfig
arm                         s3c6400_defconfig
arc                              alldefconfig
xtensa                    smp_lx200_defconfig
powerpc                     pq2fads_defconfig
m68k                             allmodconfig
sh                          sdk7780_defconfig
powerpc                    sam440ep_defconfig
sh                           se7722_defconfig
openrisc                            defconfig
arm                         at91_dt_defconfig
arm                           viper_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220508
ia64                                defconfig
m68k                             allyesconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
i386                          randconfig-c001
powerpc              randconfig-c003-20220508
riscv                randconfig-c006-20220508
mips                 randconfig-c004-20220508
arm                  randconfig-c002-20220508
powerpc                     mpc512x_defconfig
arm                           spitz_defconfig
powerpc                     tqm8560_defconfig
mips                     loongson2k_defconfig
arm                              alldefconfig
mips                        qi_lb60_defconfig
powerpc                       ebony_defconfig
powerpc                    ge_imp3a_defconfig
arm                          pxa168_defconfig
mips                      malta_kvm_defconfig
arm                     davinci_all_defconfig
powerpc                     tqm8540_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                      acadia_defconfig
arm                      pxa255-idp_defconfig
mips                  cavium_octeon_defconfig
arm                        vexpress_defconfig
powerpc                  mpc885_ads_defconfig
arm                         mv78xx0_defconfig
powerpc                          allmodconfig
mips                           rs90_defconfig
i386                             allyesconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220509
hexagon              randconfig-r045-20220508
riscv                randconfig-r042-20220508
hexagon              randconfig-r041-20220509
hexagon              randconfig-r041-20220508

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
