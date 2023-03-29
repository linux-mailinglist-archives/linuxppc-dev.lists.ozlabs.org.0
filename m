Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EF16CCF90
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 03:37:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmThH3v23z3fXc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 12:37:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OxW6k9Rc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OxW6k9Rc;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmTdk4rNCz3fTK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 12:35:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680053738; x=1711589738;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=utliznxY6yCf7tDcgMeQu7h8ltYgX7mcX6Nx4i71jIw=;
  b=OxW6k9RcIt7iSN3C0uBjDgud8Zyqi2/G5W97Mo4WLwoDhEJCMjKKOeGb
   kuEzZHXGAAts318Rx54U3Al62OLDi37bKqEpFQEogpZMbbVEk1MjuNnWO
   noJdL28TiA2ROm7Ei0uK9OMB4XrocAfujcOIUBzIUfyhnNEigGKMIl4a1
   IUrIsY+wSW25OcaP+ju0tSZMglq7XKQ++XXQ85b1a8c7Ubwauipv3AYCm
   GQiZk65MWU6aRprAyfImBlDhOTNuSfGmrsD+ztq0pFGdyFUNamj19ghpt
   aXggPiJ3tc2VSklS+BS3i6t5Jof4TbCtk3omiPK2U2ft5xs5PWyFoMup8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="321144220"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="321144220"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 18:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="748609363"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="748609363"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Mar 2023 18:35:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phKim-000J3R-2g;
	Wed, 29 Mar 2023 01:35:28 +0000
Date: Wed, 29 Mar 2023 09:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD REGRESSION
 c827c932c00ccd231a73da9816a51ce2c2b557d6
Message-ID: <642395b2.9xXK0P9s+LMbMRgG%lkp@intel.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: c827c932c00ccd231a73da9816a51ce2c2b557d6  powerpc: Use of_address_to_resource()

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202303240411.Tq2tZKiG-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/powerpc/platforms/embedded6xx/ls_uart.c:128:15: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- powerpc-linkstation_defconfig
    `-- arch-powerpc-platforms-embedded6xx-ls_uart.c:error:implicit-declaration-of-function-of_address_to_resource

elapsed time: 9412m

configs tested: 354
configs skipped: 35

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230322   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r012-20230323   gcc  
alpha                randconfig-r014-20230322   gcc  
alpha                randconfig-r014-20230323   gcc  
alpha                randconfig-r021-20230322   gcc  
alpha                randconfig-r025-20230322   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r004-20230323   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                  randconfig-r016-20230322   gcc  
arc                  randconfig-r023-20230322   gcc  
arc                  randconfig-r024-20230322   gcc  
arc                  randconfig-r031-20230322   gcc  
arc                  randconfig-r034-20230322   gcc  
arc                  randconfig-r036-20230322   gcc  
arc                  randconfig-r043-20230322   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm          buildonly-randconfig-r001-20230322   clang
arm                                 defconfig   gcc  
arm                            dove_defconfig   clang
arm                      footbridge_defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                       imx_v4_v5_defconfig   clang
arm                       imx_v6_v7_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                      jornada720_defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                         mv78xx0_defconfig   clang
arm                       netwinder_defconfig   clang
arm                             pxa_defconfig   gcc  
arm                  randconfig-c002-20230322   clang
arm                  randconfig-c002-20230322   gcc  
arm                  randconfig-c002-20230324   gcc  
arm                  randconfig-r002-20230322   gcc  
arm                  randconfig-r013-20230322   clang
arm                  randconfig-r014-20230322   clang
arm                  randconfig-r022-20230322   clang
arm                  randconfig-r023-20230322   clang
arm                  randconfig-r026-20230322   clang
arm                  randconfig-r035-20230322   gcc  
arm                           stm32_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230322   clang
arm64                randconfig-r011-20230322   gcc  
arm64                randconfig-r023-20230322   gcc  
arm64                randconfig-r025-20230322   gcc  
arm64                randconfig-r031-20230322   clang
arm64                randconfig-r032-20230322   clang
arm64                randconfig-r036-20230322   clang
csky         buildonly-randconfig-r001-20230322   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230322   gcc  
csky                 randconfig-r012-20230322   gcc  
csky                 randconfig-r013-20230322   gcc  
csky                 randconfig-r023-20230322   gcc  
csky                 randconfig-r024-20230322   gcc  
csky                 randconfig-r026-20230322   gcc  
csky                 randconfig-r034-20230322   gcc  
hexagon      buildonly-randconfig-r003-20230322   clang
hexagon      buildonly-randconfig-r004-20230322   clang
hexagon      buildonly-randconfig-r006-20230323   clang
hexagon              randconfig-r003-20230322   clang
hexagon              randconfig-r004-20230322   clang
hexagon              randconfig-r015-20230322   clang
hexagon              randconfig-r034-20230322   clang
hexagon              randconfig-r035-20230322   clang
i386                             alldefconfig   gcc  
i386                             allyesconfig   gcc  
i386                         debian-10.3-func   gcc  
i386                   debian-10.3-kselftests   gcc  
i386                        debian-10.3-kunit   gcc  
i386                          debian-10.3-kvm   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a004   clang
i386                          randconfig-a006   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a014   gcc  
i386                          randconfig-a016   gcc  
i386                          randconfig-c001   clang
i386                          randconfig-c001   gcc  
ia64                             allmodconfig   gcc  
ia64                             allyesconfig   gcc  
ia64         buildonly-randconfig-r005-20230322   gcc  
ia64         buildonly-randconfig-r005-20230323   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r001-20230322   gcc  
ia64                 randconfig-r004-20230322   gcc  
ia64                 randconfig-r005-20230322   gcc  
ia64                 randconfig-r011-20230322   gcc  
ia64                 randconfig-r013-20230322   gcc  
ia64                 randconfig-r015-20230322   gcc  
ia64                 randconfig-r024-20230322   gcc  
ia64                 randconfig-r031-20230322   gcc  
ia64                 randconfig-r032-20230322   gcc  
ia64                 randconfig-r033-20230322   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r001-20230322   gcc  
loongarch    buildonly-randconfig-r003-20230322   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch            randconfig-r011-20230322   gcc  
loongarch            randconfig-r016-20230322   gcc  
loongarch            randconfig-r023-20230322   gcc  
loongarch            randconfig-r032-20230322   gcc  
loongarch            randconfig-r034-20230322   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k         buildonly-randconfig-r001-20230322   gcc  
m68k         buildonly-randconfig-r002-20230322   gcc  
m68k         buildonly-randconfig-r003-20230322   gcc  
m68k         buildonly-randconfig-r004-20230322   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                 randconfig-r013-20230322   gcc  
m68k                 randconfig-r015-20230322   gcc  
m68k                 randconfig-r016-20230322   gcc  
m68k                 randconfig-r024-20230322   gcc  
m68k                 randconfig-r026-20230322   gcc  
m68k                 randconfig-r031-20230322   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze   buildonly-randconfig-r004-20230322   gcc  
microblaze   buildonly-randconfig-r006-20230322   gcc  
microblaze           randconfig-r002-20230322   gcc  
microblaze           randconfig-r011-20230323   gcc  
microblaze           randconfig-r012-20230322   gcc  
microblaze           randconfig-r015-20230322   gcc  
microblaze           randconfig-r021-20230322   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips         buildonly-randconfig-r003-20230322   gcc  
mips         buildonly-randconfig-r004-20230322   gcc  
mips         buildonly-randconfig-r005-20230322   gcc  
mips                     cu1000-neo_defconfig   clang
mips                     loongson1b_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                 randconfig-c004-20230322   clang
mips                 randconfig-r021-20230322   clang
mips                 randconfig-r034-20230322   gcc  
mips                 randconfig-r036-20230322   gcc  
mips                           rs90_defconfig   clang
mips                           xway_defconfig   gcc  
nios2                            allyesconfig   gcc  
nios2        buildonly-randconfig-r001-20230322   gcc  
nios2        buildonly-randconfig-r002-20230322   gcc  
nios2        buildonly-randconfig-r004-20230322   gcc  
nios2        buildonly-randconfig-r005-20230322   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230322   gcc  
nios2                randconfig-r003-20230322   gcc  
nios2                randconfig-r005-20230322   gcc  
nios2                randconfig-r015-20230322   gcc  
nios2                randconfig-r016-20230322   gcc  
nios2                randconfig-r021-20230322   gcc  
nios2                randconfig-r035-20230322   gcc  
nios2                randconfig-r036-20230322   gcc  
openrisc     buildonly-randconfig-r002-20230322   gcc  
openrisc             randconfig-r012-20230322   gcc  
openrisc             randconfig-r013-20230322   gcc  
openrisc             randconfig-r016-20230322   gcc  
openrisc             randconfig-r023-20230322   gcc  
openrisc             randconfig-r025-20230322   gcc  
openrisc             randconfig-r026-20230322   gcc  
openrisc             randconfig-r032-20230322   gcc  
openrisc             randconfig-r033-20230322   gcc  
openrisc             randconfig-r036-20230322   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           alldefconfig   gcc  
parisc                           allyesconfig   gcc  
parisc       buildonly-randconfig-r001-20230323   gcc  
parisc       buildonly-randconfig-r002-20230322   gcc  
parisc       buildonly-randconfig-r005-20230322   gcc  
parisc       buildonly-randconfig-r006-20230323   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230322   gcc  
parisc               randconfig-r004-20230322   gcc  
parisc               randconfig-r006-20230322   gcc  
parisc               randconfig-r013-20230322   gcc  
parisc               randconfig-r014-20230322   gcc  
parisc               randconfig-r022-20230322   gcc  
parisc               randconfig-r024-20230322   gcc  
parisc               randconfig-r025-20230322   gcc  
parisc               randconfig-r031-20230322   gcc  
parisc               randconfig-r034-20230322   gcc  
parisc               randconfig-r036-20230322   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                          allyesconfig   gcc  
powerpc                     asp8347_defconfig   gcc  
powerpc                      bamboo_defconfig   gcc  
powerpc      buildonly-randconfig-r003-20230322   gcc  
powerpc      buildonly-randconfig-r005-20230322   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc                     kmeter1_defconfig   clang
powerpc                 linkstation_defconfig   gcc  
powerpc                      mgcoge_defconfig   gcc  
powerpc                     mpc512x_defconfig   clang
powerpc                mpc7448_hpc2_defconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                 mpc836x_mds_defconfig   clang
powerpc                     mpc83xx_defconfig   gcc  
powerpc                  mpc885_ads_defconfig   clang
powerpc                      obs600_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc                     powernv_defconfig   clang
powerpc                     rainier_defconfig   gcc  
powerpc              randconfig-c003-20230322   clang
powerpc              randconfig-c003-20230322   gcc  
powerpc              randconfig-r001-20230322   clang
powerpc              randconfig-r012-20230322   gcc  
powerpc              randconfig-r016-20230322   gcc  
powerpc              randconfig-r033-20230322   clang
powerpc              randconfig-r035-20230322   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv        buildonly-randconfig-r005-20230322   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-c006-20230322   clang
riscv                randconfig-r001-20230322   clang
riscv                randconfig-r002-20230322   clang
riscv                randconfig-r006-20230322   clang
riscv                randconfig-r021-20230322   gcc  
riscv                randconfig-r024-20230322   gcc  
riscv                randconfig-r036-20230322   clang
riscv                randconfig-r042-20230322   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r005-20230322   gcc  
s390         buildonly-randconfig-r005-20230323   clang
s390                                defconfig   gcc  
s390                 randconfig-c005-20230322   clang
s390                 randconfig-r001-20230322   clang
s390                 randconfig-r003-20230322   clang
s390                 randconfig-r004-20230322   clang
s390                 randconfig-r016-20230322   gcc  
s390                 randconfig-r022-20230322   gcc  
s390                 randconfig-r031-20230322   clang
s390                 randconfig-r035-20230322   clang
s390                 randconfig-r044-20230322   gcc  
sh                               allmodconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh           buildonly-randconfig-r001-20230322   gcc  
sh           buildonly-randconfig-r006-20230322   gcc  
sh                                  defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                   randconfig-r005-20230322   gcc  
sh                   randconfig-r011-20230322   gcc  
sh                   randconfig-r012-20230322   gcc  
sh                   randconfig-r013-20230322   gcc  
sh                   randconfig-r016-20230322   gcc  
sh                   randconfig-r026-20230322   gcc  
sh                   randconfig-r034-20230322   gcc  
sh                   randconfig-r036-20230322   gcc  
sh                          rsk7264_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc        buildonly-randconfig-r001-20230322   gcc  
sparc        buildonly-randconfig-r004-20230322   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230322   gcc  
sparc                randconfig-r006-20230322   gcc  
sparc                randconfig-r014-20230322   gcc  
sparc                randconfig-r015-20230322   gcc  
sparc                randconfig-r023-20230322   gcc  
sparc                randconfig-r035-20230322   gcc  
sparc64      buildonly-randconfig-r001-20230322   gcc  
sparc64      buildonly-randconfig-r002-20230322   gcc  
sparc64      buildonly-randconfig-r006-20230322   gcc  
sparc64              randconfig-r001-20230322   gcc  
sparc64              randconfig-r015-20230323   gcc  
sparc64              randconfig-r016-20230323   gcc  
sparc64              randconfig-r022-20230322   gcc  
sparc64              randconfig-r024-20230322   gcc  
sparc64              randconfig-r031-20230322   gcc  
sparc64              randconfig-r032-20230322   gcc  
sparc64              randconfig-r033-20230322   gcc  
sparc64              randconfig-r035-20230322   gcc  
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                        randconfig-c001   gcc  
x86_64                        randconfig-c007   clang
x86_64                        randconfig-k001   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                           rhel-8.3-syz   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa       buildonly-randconfig-r001-20230322   gcc  
xtensa       buildonly-randconfig-r006-20230322   gcc  
xtensa               randconfig-r001-20230322   gcc  
xtensa               randconfig-r002-20230322   gcc  
xtensa               randconfig-r011-20230322   gcc  
xtensa               randconfig-r014-20230322   gcc  
xtensa               randconfig-r015-20230322   gcc  
xtensa               randconfig-r022-20230322   gcc  
xtensa               randconfig-r031-20230322   gcc  
xtensa               randconfig-r032-20230322   gcc  
xtensa               randconfig-r035-20230322   gcc  
xtensa                    smp_lx200_defconfig   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
