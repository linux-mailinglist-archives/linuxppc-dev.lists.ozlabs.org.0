Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A073BDF8C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 01:03:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKJ546Q40z3bkH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 09:03:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GKJ4j2ScWz301m
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 09:03:12 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="270328636"
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="270328636"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 16:02:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="627828476"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 06 Jul 2021 16:02:04 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1m0u4p-000DEl-MH; Tue, 06 Jul 2021 23:02:03 +0000
Date: Wed, 07 Jul 2021 07:01:49 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 1df3af6dc3cfe643f43d46f202bd44861ccbdb99
Message-ID: <60e4e0dd.VydzW9fhGHg5F+WC%lkp@intel.com>
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
branch HEAD: 1df3af6dc3cfe643f43d46f202bd44861ccbdb99  powerpc/64e: Fix system call illegal mtmsrd instruction

elapsed time: 727m

configs tested: 141
configs skipped: 101

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                        fsp2_defconfig
powerpc                     sbc8548_defconfig
powerpc                     mpc512x_defconfig
powerpc                      ppc44x_defconfig
sh                          rsk7203_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                   microwatt_defconfig
arm                           h5000_defconfig
riscv                               defconfig
h8300                            alldefconfig
arm                           corgi_defconfig
arm                            lart_defconfig
mips                           xway_defconfig
arm                       netwinder_defconfig
mips                             allmodconfig
powerpc                  iss476-smp_defconfig
xtensa                    xip_kc705_defconfig
arm                           sama5_defconfig
parisc                generic-64bit_defconfig
arm                        mvebu_v5_defconfig
powerpc                  storcenter_defconfig
powerpc                      ppc6xx_defconfig
powerpc                    adder875_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                     pseries_defconfig
mips                        bcm47xx_defconfig
mips                           ip32_defconfig
powerpc                     tqm8560_defconfig
powerpc                     akebono_defconfig
mips                     cu1830-neo_defconfig
arc                              alldefconfig
sh                     magicpanelr2_defconfig
m68k                             alldefconfig
arm                         lpc18xx_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                     mpc83xx_defconfig
arm                         s3c2410_defconfig
powerpc                     kilauea_defconfig
sh                           se7705_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                        realview_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                      bmips_stb_defconfig
arm                             rpc_defconfig
s390                             alldefconfig
powerpc                    mvme5100_defconfig
powerpc                      makalu_defconfig
powerpc                      chrp32_defconfig
powerpc                 mpc8560_ads_defconfig
sh                           se7722_defconfig
arm                         s3c6400_defconfig
arm                           h3600_defconfig
arm                            qcom_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                            hisi_defconfig
arm                         vf610m4_defconfig
arm                         assabet_defconfig
xtensa                  nommu_kc705_defconfig
s390                       zfcpdump_defconfig
sh                          rsk7264_defconfig
sh                         microdev_defconfig
powerpc                    ge_imp3a_defconfig
mips                       bmips_be_defconfig
mips                          ath25_defconfig
riscv                          rv32_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20210706
i386                 randconfig-a006-20210706
i386                 randconfig-a001-20210706
i386                 randconfig-a003-20210706
i386                 randconfig-a005-20210706
i386                 randconfig-a002-20210706
x86_64               randconfig-a015-20210706
x86_64               randconfig-a014-20210706
x86_64               randconfig-a012-20210706
x86_64               randconfig-a011-20210706
x86_64               randconfig-a016-20210706
x86_64               randconfig-a013-20210706
i386                 randconfig-a015-20210706
i386                 randconfig-a016-20210706
i386                 randconfig-a012-20210706
i386                 randconfig-a011-20210706
i386                 randconfig-a014-20210706
i386                 randconfig-a013-20210706
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210706
x86_64               randconfig-a004-20210706
x86_64               randconfig-a002-20210706
x86_64               randconfig-a005-20210706
x86_64               randconfig-a006-20210706
x86_64               randconfig-a003-20210706
x86_64               randconfig-a001-20210706

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
