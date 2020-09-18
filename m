Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1447E27070E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 22:28:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtQQt0t11zDqtZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 06:28:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtQNj6TWTzDqsZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 06:27:00 +1000 (AEST)
IronPort-SDR: GgHApYrvWj36mArJFGjNphXZxrlX6U8UgKfwMNQiRx9yiSUDC6paKYQNXynjXHAUC8SrBr1pty
 id3Ly+he2WQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9748"; a="160085712"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="160085712"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 13:26:44 -0700
IronPort-SDR: UHl64kUgEfcoYTDDDujELAbtMlOLlPeWlV54aRroIyNJHmhLsQpUPutzX6YExrW818TNlIYPNT
 LA0as4oEHtCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="308021166"
Received: from lkp-server01.sh.intel.com (HELO a05db971c861) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 18 Sep 2020 13:26:43 -0700
Received: from kbuild by a05db971c861 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kJMxv-0000gq-2k; Fri, 18 Sep 2020 20:26:43 +0000
Date: Sat, 19 Sep 2020 04:26:02 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/irqs-off-activate-mm] BUILD SUCCESS
 a665eec0a22e11cdde708c1c256a465ebe768047
Message-ID: <5f6517da.mUs5tINRdV6Gsewg%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  topic/irqs-off-activate-mm
branch HEAD: a665eec0a22e11cdde708c1c256a465ebe768047  powerpc/64s/radix: Fix mm_cpumask trimming race vs kthread_use_mm

elapsed time: 722m

configs tested: 154
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                    nommu_k210_defconfig
m68k                          amiga_defconfig
powerpc                 mpc832x_mds_defconfig
ia64                             alldefconfig
riscv                          rv32_defconfig
arm                       imx_v6_v7_defconfig
arm                             rpc_defconfig
arm                            u300_defconfig
arm                         ebsa110_defconfig
sh                        edosk7760_defconfig
sparc64                          alldefconfig
m68k                          multi_defconfig
sh                        edosk7705_defconfig
arm                       omap2plus_defconfig
m68k                             alldefconfig
mips                          malta_defconfig
arm                          pxa910_defconfig
mips                        vocore2_defconfig
nds32                            alldefconfig
powerpc                 linkstation_defconfig
parisc                generic-64bit_defconfig
arm                      pxa255-idp_defconfig
ia64                         bigsur_defconfig
powerpc                      makalu_defconfig
arm                          pxa3xx_defconfig
powerpc                      mgcoge_defconfig
parisc                generic-32bit_defconfig
m68k                        m5272c3_defconfig
sh                     magicpanelr2_defconfig
arm                         nhk8815_defconfig
sh                           se7750_defconfig
xtensa                         virt_defconfig
arm                           corgi_defconfig
arm                         at91_dt_defconfig
arm                   milbeaut_m10v_defconfig
arm                     am200epdkit_defconfig
arm                          iop32x_defconfig
mips                 decstation_r4k_defconfig
nios2                         3c120_defconfig
powerpc                      pcm030_defconfig
sh                        sh7763rdp_defconfig
arm                  colibri_pxa300_defconfig
mips                  maltasmvp_eva_defconfig
sh                         microdev_defconfig
alpha                               defconfig
arm                    vt8500_v6_v7_defconfig
arm                         mv78xx0_defconfig
arm                          badge4_defconfig
mips                      loongson3_defconfig
m68k                        stmark2_defconfig
sh                           se7780_defconfig
powerpc                     tqm5200_defconfig
powerpc                    klondike_defconfig
arc                         haps_hs_defconfig
arm                          lpd270_defconfig
arm                          simpad_defconfig
mips                           ci20_defconfig
arm                           tegra_defconfig
mips                        nlm_xlr_defconfig
arm                         s3c2410_defconfig
arm                          moxart_defconfig
parisc                           alldefconfig
mips                     decstation_defconfig
powerpc                        cell_defconfig
arm                       mainstone_defconfig
powerpc                       holly_defconfig
microblaze                          defconfig
powerpc                     ksi8560_defconfig
powerpc                     ppa8548_defconfig
mips                        omega2p_defconfig
arm                       versatile_defconfig
arm                            mps2_defconfig
powerpc                        icon_defconfig
openrisc                         alldefconfig
sh                   sh7724_generic_defconfig
sh                               j2_defconfig
powerpc                       ppc64_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20200917
i386                 randconfig-a006-20200917
i386                 randconfig-a003-20200917
i386                 randconfig-a001-20200917
i386                 randconfig-a002-20200917
i386                 randconfig-a005-20200917
x86_64               randconfig-a014-20200917
x86_64               randconfig-a011-20200917
x86_64               randconfig-a016-20200917
x86_64               randconfig-a012-20200917
x86_64               randconfig-a015-20200917
x86_64               randconfig-a013-20200917
i386                 randconfig-a015-20200917
i386                 randconfig-a014-20200917
i386                 randconfig-a011-20200917
i386                 randconfig-a013-20200917
i386                 randconfig-a016-20200917
i386                 randconfig-a012-20200917
i386                 randconfig-a015-20200918
i386                 randconfig-a011-20200918
i386                 randconfig-a014-20200918
i386                 randconfig-a013-20200918
i386                 randconfig-a012-20200918
i386                 randconfig-a016-20200918
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20200917
x86_64               randconfig-a004-20200917
x86_64               randconfig-a003-20200917
x86_64               randconfig-a002-20200917
x86_64               randconfig-a001-20200917
x86_64               randconfig-a005-20200917

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
