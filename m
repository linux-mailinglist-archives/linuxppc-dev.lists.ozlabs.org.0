Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A97A3CC7E8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jul 2021 08:06:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GSDxZ3TBkz3079
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jul 2021 16:06:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GSDx80HZRz2yNG
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jul 2021 16:05:42 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10048"; a="207812313"
X-IronPort-AV: E=Sophos;i="5.84,249,1620716400"; d="scan'208";a="207812313"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2021 23:04:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,249,1620716400"; d="scan'208";a="491833112"
Received: from lkp-server01.sh.intel.com (HELO a467b34d8c10) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 17 Jul 2021 23:04:37 -0700
Received: from kbuild by a467b34d8c10 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1m4zun-00008i-5d; Sun, 18 Jul 2021 06:04:37 +0000
Date: Sun, 18 Jul 2021 14:03:47 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS bcc9472087d0a15f82c79ecd4e1bc2c18b045a7a
Message-ID: <60f3c443.vyrpeij7CU9Ujzwp%lkp@intel.com>
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
branch HEAD: bcc9472087d0a15f82c79ecd4e1bc2c18b045a7a  Automatic merge of 'master' into merge (2021-07-15 20:45)

elapsed time: 3916m

configs tested: 170
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                  mpc885_ads_defconfig
powerpc                    ge_imp3a_defconfig
riscv                             allnoconfig
powerpc                     stx_gp3_defconfig
arm                           sunxi_defconfig
sh                           se7705_defconfig
arc                          axs101_defconfig
sh                      rts7751r2d1_defconfig
arm                          gemini_defconfig
powerpc                     asp8347_defconfig
riscv                    nommu_virt_defconfig
powerpc                 mpc832x_mds_defconfig
ia64                          tiger_defconfig
m68k                            mac_defconfig
arm                            mps2_defconfig
m68k                        mvme16x_defconfig
x86_64                           alldefconfig
mips                         mpc30x_defconfig
parisc                generic-32bit_defconfig
x86_64                              defconfig
arm                          pxa910_defconfig
xtensa                  cadence_csp_defconfig
sh                           se7722_defconfig
arc                                 defconfig
powerpc               mpc834x_itxgp_defconfig
mips                     loongson1c_defconfig
s390                             alldefconfig
nios2                         3c120_defconfig
arc                        vdk_hs38_defconfig
sh                            shmin_defconfig
powerpc                 canyonlands_defconfig
powerpc                        cell_defconfig
microblaze                      mmu_defconfig
powerpc                    amigaone_defconfig
arm                          pcm027_defconfig
csky                             alldefconfig
powerpc                     mpc83xx_defconfig
sh                           se7619_defconfig
powerpc                      ppc44x_defconfig
sh                          rsk7264_defconfig
arc                      axs103_smp_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                         wii_defconfig
arm                       versatile_defconfig
sh                          rsk7201_defconfig
arm                       imx_v4_v5_defconfig
sh                          landisk_defconfig
sh                               alldefconfig
arm                        mvebu_v7_defconfig
arm                         nhk8815_defconfig
arm                      tct_hammer_defconfig
arm                           sama5_defconfig
mips                     cu1000-neo_defconfig
h8300                               defconfig
arm                              alldefconfig
arm                    vt8500_v6_v7_defconfig
arm                         shannon_defconfig
mips                     loongson2k_defconfig
m68k                            q40_defconfig
powerpc                      cm5200_defconfig
arm                       cns3420vb_defconfig
mips                          rb532_defconfig
powerpc                 mpc837x_mds_defconfig
parisc                           allyesconfig
sh                         ap325rxa_defconfig
powerpc                      pasemi_defconfig
mips                             allyesconfig
ia64                        generic_defconfig
arm                          exynos_defconfig
sh                     magicpanelr2_defconfig
sh                                  defconfig
arm                            lart_defconfig
powerpc                    klondike_defconfig
arm                        shmobile_defconfig
powerpc                     kmeter1_defconfig
nios2                               defconfig
arm                       mainstone_defconfig
arm                            pleb_defconfig
sh                           se7712_defconfig
arm                      integrator_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
x86_64                            allnoconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210715
i386                 randconfig-a006-20210715
i386                 randconfig-a004-20210715
i386                 randconfig-a001-20210715
i386                 randconfig-a003-20210715
i386                 randconfig-a002-20210715
i386                 randconfig-a005-20210716
i386                 randconfig-a006-20210716
i386                 randconfig-a004-20210716
i386                 randconfig-a001-20210716
i386                 randconfig-a002-20210716
i386                 randconfig-a003-20210716
x86_64               randconfig-a013-20210715
x86_64               randconfig-a012-20210715
x86_64               randconfig-a015-20210715
x86_64               randconfig-a014-20210715
x86_64               randconfig-a016-20210715
x86_64               randconfig-a011-20210715
i386                 randconfig-a014-20210715
i386                 randconfig-a015-20210715
i386                 randconfig-a011-20210715
i386                 randconfig-a013-20210715
i386                 randconfig-a012-20210715
i386                 randconfig-a016-20210715
i386                 randconfig-a014-20210718
i386                 randconfig-a015-20210718
i386                 randconfig-a011-20210718
i386                 randconfig-a013-20210718
i386                 randconfig-a016-20210718
i386                 randconfig-a012-20210718
x86_64               randconfig-a005-20210716
x86_64               randconfig-a004-20210716
x86_64               randconfig-a003-20210716
x86_64               randconfig-a002-20210716
x86_64               randconfig-a006-20210716
x86_64               randconfig-a001-20210716
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210716
x86_64               randconfig-b001-20210715
x86_64               randconfig-a005-20210715
x86_64               randconfig-a004-20210715
x86_64               randconfig-a002-20210715
x86_64               randconfig-a003-20210715
x86_64               randconfig-a006-20210715
x86_64               randconfig-a001-20210715

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
