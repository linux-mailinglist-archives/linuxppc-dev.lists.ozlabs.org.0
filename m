Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DDE3ECC89
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 04:07:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GnyGF5b3jz3d8F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 12:07:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GnyFH4qDJz30DZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 12:06:07 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="213931617"
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="213931617"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2021 19:05:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="678919105"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2021 19:05:01 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mFRzp-000QIP-9C; Mon, 16 Aug 2021 02:05:01 +0000
Date: Mon, 16 Aug 2021 10:04:53 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 0355785313e2191be4e1108cdbda94ddb0238c48
Message-ID: <6119c7c5.dOAIrqNhqdlqAYXH%lkp@intel.com>
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
branch HEAD: 0355785313e2191be4e1108cdbda94ddb0238c48  powerpc: Add "-z notext" flag to disable diagnostic

elapsed time: 722m

configs tested: 176
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
i386                 randconfig-c001-20210816
i386                 randconfig-c001-20210815
nios2                         3c120_defconfig
sh                          landisk_defconfig
sh                           se7712_defconfig
arm                        trizeps4_defconfig
mips                      fuloong2e_defconfig
powerpc                     asp8347_defconfig
arm                             rpc_defconfig
xtensa                       common_defconfig
arm                      jornada720_defconfig
sh                   secureedge5410_defconfig
powerpc                     tqm8540_defconfig
arm                        neponset_defconfig
powerpc                     stx_gp3_defconfig
nios2                         10m50_defconfig
powerpc                    klondike_defconfig
mips                malta_qemu_32r6_defconfig
arm                        mini2440_defconfig
arc                              alldefconfig
h8300                     edosk2674_defconfig
arm                          moxart_defconfig
arm                          ixp4xx_defconfig
mips                        bcm63xx_defconfig
arm                  colibri_pxa300_defconfig
sh                 kfr2r09-romimage_defconfig
arm                           viper_defconfig
arm                         s3c6400_defconfig
parisc                generic-32bit_defconfig
sh                           se7343_defconfig
arm                           tegra_defconfig
h8300                               defconfig
powerpc                     tqm5200_defconfig
powerpc                      walnut_defconfig
mips                      bmips_stb_defconfig
sh                           se7619_defconfig
arm                         orion5x_defconfig
sh                          r7785rp_defconfig
m68k                       m5275evb_defconfig
mips                   sb1250_swarm_defconfig
powerpc                         ps3_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                         lubbock_defconfig
arm                        magician_defconfig
powerpc                 mpc837x_rdb_defconfig
m68k                          hp300_defconfig
mips                            ar7_defconfig
i386                                defconfig
openrisc                    or1ksim_defconfig
powerpc                     pq2fads_defconfig
sh                             espt_defconfig
arm                   milbeaut_m10v_defconfig
mips                            gpr_defconfig
powerpc                     mpc5200_defconfig
i386                             alldefconfig
powerpc                 mpc832x_rdb_defconfig
arm                        spear6xx_defconfig
sparc                       sparc64_defconfig
sh                          polaris_defconfig
powerpc                    amigaone_defconfig
powerpc                     mpc83xx_defconfig
sh                          lboxre2_defconfig
arm                         shannon_defconfig
mips                        workpad_defconfig
m68k                        mvme16x_defconfig
arm                          badge4_defconfig
sh                           se7705_defconfig
mips                         bigsur_defconfig
mips                      pic32mzda_defconfig
powerpc                     rainier_defconfig
arm                            hisi_defconfig
powerpc                      bamboo_defconfig
csky                             alldefconfig
alpha                               defconfig
arm                          collie_defconfig
arm                             pxa_defconfig
m68k                          atari_defconfig
arm                          pxa910_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                      mgcoge_defconfig
sh                               j2_defconfig
ia64                      gensparse_defconfig
powerpc                     ksi8560_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20210815
i386                 randconfig-a001-20210815
i386                 randconfig-a002-20210815
i386                 randconfig-a003-20210815
i386                 randconfig-a006-20210815
i386                 randconfig-a005-20210815
i386                 randconfig-a004-20210816
i386                 randconfig-a003-20210816
i386                 randconfig-a002-20210816
i386                 randconfig-a001-20210816
i386                 randconfig-a006-20210816
i386                 randconfig-a005-20210816
x86_64               randconfig-a013-20210815
x86_64               randconfig-a011-20210815
x86_64               randconfig-a016-20210815
x86_64               randconfig-a012-20210815
x86_64               randconfig-a014-20210815
x86_64               randconfig-a015-20210815
i386                 randconfig-a011-20210815
i386                 randconfig-a015-20210815
i386                 randconfig-a014-20210815
i386                 randconfig-a013-20210815
i386                 randconfig-a016-20210815
i386                 randconfig-a012-20210815
i386                 randconfig-a011-20210816
i386                 randconfig-a015-20210816
i386                 randconfig-a013-20210816
i386                 randconfig-a014-20210816
i386                 randconfig-a016-20210816
i386                 randconfig-a012-20210816
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210815
x86_64               randconfig-a004-20210815
x86_64               randconfig-a006-20210815
x86_64               randconfig-a003-20210815
x86_64               randconfig-a001-20210815
x86_64               randconfig-a002-20210815
x86_64               randconfig-a005-20210815
x86_64               randconfig-a011-20210816
x86_64               randconfig-a013-20210816
x86_64               randconfig-a016-20210816
x86_64               randconfig-a012-20210816
x86_64               randconfig-a015-20210816
x86_64               randconfig-a014-20210816

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
