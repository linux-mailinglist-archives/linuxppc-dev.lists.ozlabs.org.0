Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E72427710
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 06:05:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HRBKn5ct8z3c5S
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 15:05:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HRBKL3tb4z2yp4
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 15:04:47 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="287513357"
X-IronPort-AV: E=Sophos;i="5.85,360,1624345200"; d="scan'208";a="287513357"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 21:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,360,1624345200"; d="scan'208";a="546458843"
Received: from lkp-server02.sh.intel.com (HELO 1950922c5479) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 08 Oct 2021 21:03:38 -0700
Received: from kbuild by 1950922c5479 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mZ3aE-000179-20; Sat, 09 Oct 2021 04:03:38 +0000
Date: Sat, 09 Oct 2021 12:03:00 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 f9473a65719e59c45f1638cc04db7c80de8fcc1a
Message-ID: <61611474.4O+0Q7OHNA+kSf7k%lkp@intel.com>
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
branch HEAD: f9473a65719e59c45f1638cc04db7c80de8fcc1a  powerpc/pseries/cpuhp: remove obsolete comment from pseries_cpu_die

elapsed time: 830m

configs tested: 161
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211008
s390                          debug_defconfig
parisc                generic-32bit_defconfig
m68k                       bvme6000_defconfig
arm                            hisi_defconfig
sh                            hp6xx_defconfig
arc                         haps_hs_defconfig
mips                    maltaup_xpa_defconfig
mips                          rb532_defconfig
riscv             nommu_k210_sdcard_defconfig
xtensa                          iss_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                     akebono_defconfig
mips                  cavium_octeon_defconfig
sh                          rsk7269_defconfig
sh                               alldefconfig
arm                        oxnas_v6_defconfig
arm                         orion5x_defconfig
m68k                         amcore_defconfig
arm                      pxa255-idp_defconfig
mips                            gpr_defconfig
mips                         rt305x_defconfig
arm                            zeus_defconfig
arm                         socfpga_defconfig
arm                           corgi_defconfig
sh                          rsk7264_defconfig
xtensa                    xip_kc705_defconfig
nds32                             allnoconfig
powerpc                 mpc8560_ads_defconfig
mips                       lemote2f_defconfig
m68k                        stmark2_defconfig
sh                          sdk7786_defconfig
powerpc                       holly_defconfig
arm                     am200epdkit_defconfig
sh                            migor_defconfig
powerpc                      pasemi_defconfig
mips                       rbtx49xx_defconfig
powerpc                   currituck_defconfig
ia64                             alldefconfig
arm                         bcm2835_defconfig
powerpc                 mpc832x_mds_defconfig
arm                            xcep_defconfig
mips                           rs90_defconfig
mips                        bcm63xx_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                          g5_defconfig
arm                        keystone_defconfig
riscv                               defconfig
mips                         tb0219_defconfig
arc                            hsdk_defconfig
sh                        apsh4ad0a_defconfig
mips                  decstation_64_defconfig
sh                        sh7785lcr_defconfig
m68k                         apollo_defconfig
openrisc                            defconfig
powerpc                      arches_defconfig
sh                   secureedge5410_defconfig
m68k                            mac_defconfig
xtensa                       common_defconfig
powerpc                   lite5200b_defconfig
powerpc                      cm5200_defconfig
arm                       multi_v4t_defconfig
arm                        multi_v7_defconfig
powerpc                 mpc836x_rdk_defconfig
xtensa                generic_kc705_defconfig
mips                         db1xxx_defconfig
arm                          ep93xx_defconfig
powerpc                   microwatt_defconfig
arm                           u8500_defconfig
h8300                    h8300h-sim_defconfig
arm                           viper_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                         s3c6400_defconfig
arm                        realview_defconfig
powerpc                     tqm8560_defconfig
x86_64               randconfig-c001-20211008
arm                  randconfig-c002-20211008
ia64                             allmodconfig
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
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
x86_64               randconfig-a015-20211008
x86_64               randconfig-a012-20211008
x86_64               randconfig-a016-20211008
x86_64               randconfig-a013-20211008
x86_64               randconfig-a011-20211008
x86_64               randconfig-a014-20211008
i386                 randconfig-a013-20211008
i386                 randconfig-a016-20211008
i386                 randconfig-a014-20211008
i386                 randconfig-a011-20211008
i386                 randconfig-a012-20211008
i386                 randconfig-a015-20211008
arc                  randconfig-r043-20211008
s390                 randconfig-r044-20211008
riscv                randconfig-r042-20211008
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211008
i386                 randconfig-c001-20211008
arm                  randconfig-c002-20211008
s390                 randconfig-c005-20211008
powerpc              randconfig-c003-20211008
riscv                randconfig-c006-20211008
mips                 randconfig-c004-20211008
x86_64               randconfig-a003-20211008
x86_64               randconfig-a005-20211008
x86_64               randconfig-a001-20211008
x86_64               randconfig-a002-20211008
x86_64               randconfig-a004-20211008
x86_64               randconfig-a006-20211008
i386                 randconfig-a001-20211008
i386                 randconfig-a003-20211008
i386                 randconfig-a005-20211008
i386                 randconfig-a004-20211008
i386                 randconfig-a002-20211008
i386                 randconfig-a006-20211008
hexagon              randconfig-r045-20211008
hexagon              randconfig-r041-20211008

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
