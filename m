Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 709583BDFA9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 01:12:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKJHN2tQFz3bW8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 09:12:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GKJGz583Yz2yN1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 09:12:11 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="209252484"
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="209252484"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 16:11:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="647608691"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 06 Jul 2021 16:11:04 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1m0uDY-000DFY-2l; Tue, 06 Jul 2021 23:11:04 +0000
Date: Wed, 07 Jul 2021 07:10:28 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 311c00a9a9990647758763cc87d0588b6adcad02
Message-ID: <60e4e2e4.7VD/od5+l0a+F+V0%lkp@intel.com>
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
branch HEAD: 311c00a9a9990647758763cc87d0588b6adcad02  Automatic merge of 'fixes' into merge (2021-07-06 20:44)

elapsed time: 733m

configs tested: 131
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
arm                           corgi_defconfig
arm                            lart_defconfig
mips                           xway_defconfig
arm                       netwinder_defconfig
mips                             allmodconfig
powerpc                  iss476-smp_defconfig
mips                            ar7_defconfig
sh                               j2_defconfig
mips                         tb0226_defconfig
mips                      maltaaprp_defconfig
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
arm                    vt8500_v6_v7_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                      bmips_stb_defconfig
arm                             rpc_defconfig
s390                             alldefconfig
powerpc                       maple_defconfig
sh                          sdk7780_defconfig
m68k                       bvme6000_defconfig
powerpc                   microwatt_defconfig
arm                          lpd270_defconfig
arm                            qcom_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                            hisi_defconfig
arm                         vf610m4_defconfig
arm                         assabet_defconfig
xtensa                  nommu_kc705_defconfig
sh                          landisk_defconfig
openrisc                         alldefconfig
mips                          malta_defconfig
powerpc                      ppc6xx_defconfig
sparc                       sparc32_defconfig
powerpc                   motionpro_defconfig
sh                           se7750_defconfig
ia64                      gensparse_defconfig
microblaze                      mmu_defconfig
m68k                        stmark2_defconfig
sh                          rsk7264_defconfig
powerpc                    mvme5100_defconfig
sh                         microdev_defconfig
s390                       zfcpdump_defconfig
powerpc                    ge_imp3a_defconfig
sh                           se7722_defconfig
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
s390                                defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
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
i386                 randconfig-a012-20210706
i386                 randconfig-a011-20210706
i386                 randconfig-a014-20210706
i386                 randconfig-a013-20210706
i386                 randconfig-a015-20210706
i386                 randconfig-a016-20210706
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
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
x86_64               randconfig-a005-20210706
x86_64               randconfig-a006-20210706
x86_64               randconfig-a004-20210706
x86_64               randconfig-a002-20210706
x86_64               randconfig-a003-20210706
x86_64               randconfig-a001-20210706

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
