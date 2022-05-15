Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 015355275E3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 07:49:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1BKw6Tzkz3c9b
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 15:49:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DeNuOt9h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DeNuOt9h; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1BKD35t4z3bWm
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 May 2022 15:49:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652593760; x=1684129760;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=ssVw8V2HC/X+EbZiVhX0naWBgiq4JfKjL/xpwwX4AnM=;
 b=DeNuOt9h6KDCee4GhOBrFL2to1zBXDX1kIQiEwKDZuFyV9goI6kXfjF6
 ljYgKIPsj1grxvIlmQ57wMt5xBSae7x9ASuSNLwVkPpzVE2Wm55Q1rzRA
 6DIw8oNQ5fSv+9aymOuOGk/Kud15IdoddujTvQ4OWp4jg0R7oP7d5V8bL
 RLD6nNe9ktHuJDQymFxccVLXsDLtcpxwyEw4zp+8jPzm4pgSVKnIhGRPU
 SiGhkREdMWqXTWElo1iDVe/ZEfBCP4QTLJXRdDohUzXOzMSguop4+hldk
 +RrLzGRwwG7Xzf8yqhbXZtEmTYO+rQz0w/a8WYzHPu0ph3kD2f8Oj4UVt g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10347"; a="270280901"
X-IronPort-AV: E=Sophos;i="5.91,227,1647327600"; d="scan'208";a="270280901"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2022 22:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,227,1647327600"; d="scan'208";a="543859228"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 14 May 2022 22:49:02 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nq77l-0001Kv-88;
 Sun, 15 May 2022 05:49:01 +0000
Date: Sun, 15 May 2022 13:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS f5802608e604dbedd4e791a43dd7732b68fcacae
Message-ID: <62809432.+d9c/ysLAOmN5qH1%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: f5802608e604dbedd4e791a43dd7732b68fcacae  Automatic merge of 'next' into merge (2022-05-09 11:36)

elapsed time: 6543m

configs tested: 212
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220509
i386                          randconfig-c001
xtensa                  audio_kc705_defconfig
xtensa                           alldefconfig
m68k                       m5275evb_defconfig
ia64                      gensparse_defconfig
xtensa                    xip_kc705_defconfig
arc                            hsdk_defconfig
mips                           ci20_defconfig
sh                           se7721_defconfig
um                               alldefconfig
arm                           stm32_defconfig
parisc                generic-64bit_defconfig
xtensa                generic_kc705_defconfig
h8300                       h8s-sim_defconfig
sparc                            alldefconfig
powerpc                       maple_defconfig
arm                           viper_defconfig
sh                           sh2007_defconfig
mips                            ar7_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                       holly_defconfig
arm                        trizeps4_defconfig
mips                         tb0226_defconfig
arm                         cm_x300_defconfig
sh                         ecovec24_defconfig
arm                         lubbock_defconfig
openrisc                 simple_smp_defconfig
s390                                defconfig
sh                        apsh4ad0a_defconfig
sh                   rts7751r2dplus_defconfig
arm                         axm55xx_defconfig
nios2                         3c120_defconfig
m68k                       bvme6000_defconfig
powerpc                      bamboo_defconfig
arc                        nsim_700_defconfig
arm                     eseries_pxa_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                      pcm030_defconfig
parisc                generic-32bit_defconfig
s390                       zfcpdump_defconfig
arm                        shmobile_defconfig
sh                               alldefconfig
mips                  maltasmvp_eva_defconfig
sh                        sh7763rdp_defconfig
powerpc                           allnoconfig
powerpc                 mpc837x_mds_defconfig
m68k                        mvme147_defconfig
powerpc                        cell_defconfig
arm                           h3600_defconfig
ia64                                defconfig
xtensa                          iss_defconfig
arm                         nhk8815_defconfig
powerpc                  iss476-smp_defconfig
mips                       capcella_defconfig
sh                           se7722_defconfig
arm                          exynos_defconfig
openrisc                  or1klitex_defconfig
arm                         at91_dt_defconfig
sh                          r7780mp_defconfig
m68k                        stmark2_defconfig
arm                          simpad_defconfig
m68k                          sun3x_defconfig
powerpc                    sam440ep_defconfig
powerpc                      chrp32_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      ep88xc_defconfig
powerpc                   currituck_defconfig
sh                         apsh4a3a_defconfig
sh                                  defconfig
arm                           corgi_defconfig
sh                        sh7785lcr_defconfig
m68k                       m5249evb_defconfig
arc                           tb10x_defconfig
mips                            gpr_defconfig
ia64                         bigsur_defconfig
m68k                          atari_defconfig
arm                         lpc18xx_defconfig
sh                           se7343_defconfig
arc                     haps_hs_smp_defconfig
arm                         s3c6400_defconfig
mips                         mpc30x_defconfig
sh                          rsk7203_defconfig
powerpc                     tqm8548_defconfig
sh                           se7724_defconfig
sh                      rts7751r2d1_defconfig
x86_64               randconfig-c001-20220509
arm                  randconfig-c002-20220509
x86_64                        randconfig-c001
arm                  randconfig-c002-20220512
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a015-20220509
x86_64               randconfig-a012-20220509
x86_64               randconfig-a016-20220509
x86_64               randconfig-a014-20220509
x86_64               randconfig-a013-20220509
x86_64               randconfig-a011-20220509
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                 randconfig-a011-20220509
i386                 randconfig-a013-20220509
i386                 randconfig-a016-20220509
i386                 randconfig-a015-20220509
i386                 randconfig-a014-20220509
i386                 randconfig-a012-20220509
arc                  randconfig-r043-20220509
s390                 randconfig-r044-20220509
riscv                randconfig-r042-20220509
s390                 randconfig-r044-20220512
riscv                randconfig-r042-20220512
arc                  randconfig-r043-20220512
s390                 randconfig-r044-20220510
riscv                randconfig-r042-20220510
arc                  randconfig-r043-20220510
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz

clang tested configs:
mips                 randconfig-c004-20220512
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220512
arm                  randconfig-c002-20220512
s390                 randconfig-c005-20220512
i386                          randconfig-c001
riscv                randconfig-c006-20220512
powerpc                     tqm5200_defconfig
powerpc                          allyesconfig
arm                          moxart_defconfig
mips                          ath79_defconfig
arm                       netwinder_defconfig
powerpc                          g5_defconfig
mips                  cavium_octeon_defconfig
powerpc                     tqm8540_defconfig
riscv                             allnoconfig
powerpc                 mpc832x_rdb_defconfig
arm                         socfpga_defconfig
mips                       lemote2f_defconfig
riscv                          rv32_defconfig
arm                        mvebu_v5_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                   lite5200b_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                        icon_defconfig
x86_64               randconfig-a006-20220509
x86_64               randconfig-a002-20220509
x86_64               randconfig-a001-20220509
x86_64               randconfig-a004-20220509
x86_64               randconfig-a005-20220509
x86_64               randconfig-a003-20220509
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                 randconfig-a003-20220509
i386                 randconfig-a002-20220509
i386                 randconfig-a001-20220509
i386                 randconfig-a004-20220509
i386                 randconfig-a005-20220509
i386                 randconfig-a006-20220509
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220509
hexagon              randconfig-r045-20220509

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
