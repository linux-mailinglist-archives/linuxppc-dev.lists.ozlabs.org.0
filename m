Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC70B315F2D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 06:50:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Db84N5wF1zDvb3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 16:50:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Db7tv4ZVgzDsnQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 16:42:13 +1100 (AEDT)
IronPort-SDR: 1naxTYXms6wj+++oquzYSUyIXpiW9v9vGrSRRtlyKmHIBZ+yj+H1zAOAw2Egbgy05LnILmrWrL
 tefD12jheV5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="243510704"
X-IronPort-AV: E=Sophos;i="5.81,167,1610438400"; d="scan'208";a="243510704"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 21:42:10 -0800
IronPort-SDR: gG5CQiPVeBpw/KWkWn8mAvZIUK1i8E4JHlhp4V8CJwoDkB5KB529FQMyuhO+6L0aUv8YALBjhe
 EjpfGN4XxcBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,167,1610438400"; d="scan'208";a="362061447"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 09 Feb 2021 21:42:08 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1l9iGO-0002hy-5L; Wed, 10 Feb 2021 05:42:08 +0000
Date: Wed, 10 Feb 2021 13:41:56 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS e7eb919057c3450cdd9d335e4a23a4da8da58db4
Message-ID: <60237224.wGHvon0f0E7sY6hu%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: e7eb919057c3450cdd9d335e4a23a4da8da58db4  powerpc/64s: Handle program checks in wrong endian during early boot

elapsed time: 1360m

configs tested: 158
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                       m5208evb_defconfig
sh                        edosk7760_defconfig
sparc                            alldefconfig
arm                         palmz72_defconfig
h8300                    h8300h-sim_defconfig
arm                     davinci_all_defconfig
s390                          debug_defconfig
arm                         hackkit_defconfig
sh                           se7721_defconfig
powerpc                      ep88xc_defconfig
arm                              zx_defconfig
x86_64                           alldefconfig
mips                          rb532_defconfig
powerpc                 mpc836x_mds_defconfig
sh                             sh03_defconfig
mips                           rs90_defconfig
sparc64                             defconfig
sh                             shx3_defconfig
powerpc                     ksi8560_defconfig
powerpc                    sam440ep_defconfig
nios2                               defconfig
m68k                        m5307c3_defconfig
m68k                       m5275evb_defconfig
xtensa                       common_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                     cu1830-neo_defconfig
arm                        mini2440_defconfig
arm                          ep93xx_defconfig
arm                           sunxi_defconfig
powerpc                      makalu_defconfig
powerpc                      pasemi_defconfig
arm                             mxs_defconfig
arc                              alldefconfig
mips                          ath79_defconfig
c6x                        evmc6474_defconfig
arm                          pxa3xx_defconfig
powerpc                    socrates_defconfig
xtensa                    smp_lx200_defconfig
mips                        jmr3927_defconfig
powerpc                       ppc64_defconfig
c6x                              allyesconfig
riscv                    nommu_k210_defconfig
mips                          rm200_defconfig
arm                       aspeed_g5_defconfig
powerpc                      bamboo_defconfig
powerpc                 mpc85xx_cds_defconfig
xtensa                  audio_kc705_defconfig
sh                               allmodconfig
arm                            zeus_defconfig
powerpc                     pq2fads_defconfig
mips                            e55_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                    vt8500_v6_v7_defconfig
arm                             pxa_defconfig
mips                           xway_defconfig
arm                       netwinder_defconfig
mips                            gpr_defconfig
arc                        vdk_hs38_defconfig
powerpc                     sequoia_defconfig
powerpc                     taishan_defconfig
alpha                               defconfig
mips                      maltaaprp_defconfig
arc                              allyesconfig
m68k                       m5475evb_defconfig
arm                           stm32_defconfig
mips                          malta_defconfig
m68k                        mvme147_defconfig
arm                       cns3420vb_defconfig
arm                          ixp4xx_defconfig
xtensa                  nommu_kc705_defconfig
alpha                            allyesconfig
arm                        mvebu_v7_defconfig
arm                         s3c2410_defconfig
powerpc                        cell_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                            mac_defconfig
sh                        dreamcast_defconfig
mips                 decstation_r4k_defconfig
arm                       imx_v4_v5_defconfig
arm                     am200epdkit_defconfig
microblaze                      mmu_defconfig
sh                  sh7785lcr_32bit_defconfig
h8300                     edosk2674_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                      ppc40x_defconfig
m68k                          multi_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210209
x86_64               randconfig-a001-20210209
x86_64               randconfig-a005-20210209
x86_64               randconfig-a004-20210209
x86_64               randconfig-a002-20210209
x86_64               randconfig-a003-20210209
i386                 randconfig-a001-20210209
i386                 randconfig-a005-20210209
i386                 randconfig-a003-20210209
i386                 randconfig-a002-20210209
i386                 randconfig-a006-20210209
i386                 randconfig-a004-20210209
i386                 randconfig-a016-20210209
i386                 randconfig-a013-20210209
i386                 randconfig-a012-20210209
i386                 randconfig-a014-20210209
i386                 randconfig-a011-20210209
i386                 randconfig-a015-20210209
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210209
x86_64               randconfig-a014-20210209
x86_64               randconfig-a015-20210209
x86_64               randconfig-a012-20210209
x86_64               randconfig-a016-20210209
x86_64               randconfig-a011-20210209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
