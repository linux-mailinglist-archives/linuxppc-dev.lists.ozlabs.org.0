Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C00AE38BCEB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 05:19:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmX0W2zQ3z3bv8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 13:19:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmX074G7Zz2xy4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 13:19:34 +1000 (AEST)
IronPort-SDR: n9CxMptdvDd+2p+dlObTOmhVyhXDCQ4beBM1eXZRFxJk8CRKFNYRxW9GMKKxqNHoZf2ALTqafz
 mxEcSetVIQZg==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="181002059"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="181002059"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 20:19:32 -0700
IronPort-SDR: wpNSBFtrnftQ/vbJqz05OyxPVS7w2lwee5y6lYvqf7ombo/Xz5lHul7jVYBlVxQm07UStl3i/C
 zRS+L/JxcyhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="543870671"
Received: from lkp-server02.sh.intel.com (HELO 1b329be5b008) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 20 May 2021 20:19:31 -0700
Received: from kbuild by 1b329be5b008 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1ljvhC-0000v5-Sa; Fri, 21 May 2021 03:19:30 +0000
Date: Fri, 21 May 2021 11:18:55 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 8554e45273f0bf09a6efaa32f9f772335e19f429
Message-ID: <60a7269f.PJPKUt9mirX4SVuK%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 8554e45273f0bf09a6efaa32f9f772335e19f429  powerpc/kprobes: Replace ppc_optinsn by common optinsn

elapsed time: 725m

configs tested: 153
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                  colibri_pxa300_defconfig
powerpc                      mgcoge_defconfig
mips                      bmips_stb_defconfig
mips                        jmr3927_defconfig
sh                           se7343_defconfig
powerpc                  mpc885_ads_defconfig
mips                           gcw0_defconfig
powerpc                 mpc834x_itx_defconfig
arm                           sunxi_defconfig
mips                malta_qemu_32r6_defconfig
mips                           ci20_defconfig
arc                        nsimosci_defconfig
powerpc                         ps3_defconfig
powerpc                     tqm5200_defconfig
m68k                       m5275evb_defconfig
sh                          lboxre2_defconfig
mips                           ip27_defconfig
powerpc                      ep88xc_defconfig
arm                        spear6xx_defconfig
arm                       aspeed_g5_defconfig
um                                  defconfig
powerpc                     tqm8541_defconfig
powerpc                      pcm030_defconfig
m68k                       m5475evb_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                    mvme5100_defconfig
ia64                             allmodconfig
powerpc                     pq2fads_defconfig
xtensa                    xip_kc705_defconfig
sparc                       sparc64_defconfig
powerpc                      ppc6xx_defconfig
arm                         s5pv210_defconfig
powerpc                 mpc8315_rdb_defconfig
sh                           se7722_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                         apsh4a3a_defconfig
sh                           se7206_defconfig
sh                          r7780mp_defconfig
arm                     am200epdkit_defconfig
arm                         cm_x300_defconfig
mips                           ip28_defconfig
powerpc                     asp8347_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      makalu_defconfig
arm                            zeus_defconfig
parisc                generic-64bit_defconfig
arm                           viper_defconfig
arm                       omap2plus_defconfig
powerpc                       ebony_defconfig
arm                         palmz72_defconfig
arm                             ezx_defconfig
arm                  colibri_pxa270_defconfig
powerpc                     powernv_defconfig
um                             i386_defconfig
mips                     loongson2k_defconfig
sh                           se7751_defconfig
powerpc                     ep8248e_defconfig
arm                          lpd270_defconfig
powerpc                      chrp32_defconfig
nios2                         3c120_defconfig
nds32                             allnoconfig
sh                               j2_defconfig
sh                             espt_defconfig
s390                       zfcpdump_defconfig
arc                                 defconfig
powerpc                        warp_defconfig
powerpc                     tqm8548_defconfig
mips                            gpr_defconfig
powerpc                      walnut_defconfig
arc                    vdk_hs38_smp_defconfig
openrisc                 simple_smp_defconfig
mips                        vocore2_defconfig
arm                         shannon_defconfig
xtensa                  audio_kc705_defconfig
ia64                            zx1_defconfig
arm                      integrator_defconfig
powerpc                 mpc836x_mds_defconfig
x86_64                            allnoconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
x86_64               randconfig-a001-20210520
x86_64               randconfig-a006-20210520
x86_64               randconfig-a005-20210520
x86_64               randconfig-a003-20210520
x86_64               randconfig-a004-20210520
x86_64               randconfig-a002-20210520
i386                 randconfig-a001-20210520
i386                 randconfig-a005-20210520
i386                 randconfig-a002-20210520
i386                 randconfig-a006-20210520
i386                 randconfig-a004-20210520
i386                 randconfig-a003-20210520
i386                 randconfig-a016-20210520
i386                 randconfig-a011-20210520
i386                 randconfig-a015-20210520
i386                 randconfig-a012-20210520
i386                 randconfig-a014-20210520
i386                 randconfig-a013-20210520
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210520
x86_64               randconfig-a013-20210520
x86_64               randconfig-a014-20210520
x86_64               randconfig-a012-20210520
x86_64               randconfig-a016-20210520
x86_64               randconfig-a015-20210520
x86_64               randconfig-a011-20210520

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
