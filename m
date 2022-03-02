Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4E44C9B84
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 03:52:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7dv01TPrz3bk2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 13:52:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kg402cEv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kg402cEv; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7dtG2Qfcz30H3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 13:51:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646189495; x=1677725495;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=HEloWZJ+4PeKZT0uq4zVSpbCcN5EYrihNfOpHZuBTOQ=;
 b=kg402cEvsa7uHalFLrd0EQOBBjMcWCqWzwXn6K0SbWh0NGt0ny3qllL8
 s7rJsCAgKCs48VPBJg8qUsRMjbW5J3HRbHih7cF6FrwU/GDrLYOTQEdEH
 tX3BKXUGV4hf1/MIhMdhzW73YT7qYNiYK4swWAVZxIAieq4e0yQRMXA/6
 vCx9ZdftWNP+NP/dWzeAeN65rjMUsjm+SORvklzvvyCjhoJzpwF/0aY+S
 ek6OhaJtyspL/x3hvjsmsl4Gq52eolJYRihgrusOOwqnQIuieEZaUM4xG
 MBuwIfJZ7BW9lYqXwfVulzEC79zcjyJZKLM+ly90qi1dJx+031FfbAPB5 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="236803566"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="236803566"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 18:50:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="639623189"
Received: from lkp-server02.sh.intel.com (HELO e9605edfa585) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 01 Mar 2022 18:50:29 -0800
Received: from kbuild by e9605edfa585 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nPF4O-0000XE-El; Wed, 02 Mar 2022 02:50:28 +0000
Date: Wed, 02 Mar 2022 09:56:49 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD REGRESSION
 cb848c24e3dc532269b70f907ad6d51848039cf0
Message-ID: <621ecee1.6qo/5ZfRhNoweL3u%lkp@intel.com>
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
branch HEAD: cb848c24e3dc532269b70f907ad6d51848039cf0  powerpc/pseries/vas: Add VAS migration handler

Error/Warning reports:

https://lore.kernel.org/lkml/202203020911.R6SaDVQw-lkp@intel.com

Error/Warning:

mobility.c:(.text+0xb44): undefined reference to `.vas_migration_handler'
powerpc64-linux-ld: mobility.c:(.text+0xbc4): undefined reference to `.vas_migration_handler'

Unverified Error/Warning (likely false positive, please contact us if interested):

clang-15: error: linker command failed with exit code 1 (use -v to see invocation)

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- powerpc64-randconfig-c024-20220301
    |-- mobility.c:(.text):undefined-reference-to-vas_migration_handler
    `-- powerpc64-linux-ld:mobility.c:(.text):undefined-reference-to-vas_migration_handler

clang_recent_errors
|-- powerpc-allmodconfig
|   `-- clang:error:linker-command-failed-with-exit-code-(use-v-to-see-invocation)
|-- powerpc-g5_defconfig
|   `-- clang:error:linker-command-failed-with-exit-code-(use-v-to-see-invocation)
|-- powerpc-mpc512x_defconfig
|   `-- clang:error:linker-command-failed-with-exit-code-(use-v-to-see-invocation)
|-- powerpc-mpc836x_mds_defconfig
|   `-- clang:error:linker-command-failed-with-exit-code-(use-v-to-see-invocation)
|-- powerpc-randconfig-r011-20220301
|   `-- clang:error:linker-command-failed-with-exit-code-(use-v-to-see-invocation)
|-- powerpc64-allyesconfig
|   `-- clang:error:linker-command-failed-with-exit-code-(use-v-to-see-invocation)
`-- powerpc64-randconfig-r024-20220301
    `-- clang:error:linker-command-failed-with-exit-code-(use-v-to-see-invocation)

elapsed time: 724m

configs tested: 133
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
sh                          kfr2r09_defconfig
mips                     loongson1b_defconfig
powerpc                 mpc837x_mds_defconfig
sh                     magicpanelr2_defconfig
arc                                 defconfig
openrisc                  or1klitex_defconfig
ia64                            zx1_defconfig
arm                          iop32x_defconfig
arm                     eseries_pxa_defconfig
powerpc                      mgcoge_defconfig
arc                    vdk_hs38_smp_defconfig
mips                        vocore2_defconfig
sh                           se7722_defconfig
sh                               alldefconfig
powerpc                     ep8248e_defconfig
arc                           tb10x_defconfig
arm                           h5000_defconfig
xtensa                       common_defconfig
mips                         db1xxx_defconfig
xtensa                  audio_kc705_defconfig
powerpc                        cell_defconfig
arm                        trizeps4_defconfig
sh                          urquell_defconfig
arm                          gemini_defconfig
sh                          polaris_defconfig
sh                        sh7757lcr_defconfig
arm                            zeus_defconfig
arm                         assabet_defconfig
sh                           se7343_defconfig
mips                  decstation_64_defconfig
sh                            migor_defconfig
m68k                        stmark2_defconfig
arm                       imx_v6_v7_defconfig
microblaze                          defconfig
m68k                          multi_defconfig
powerpc                         ps3_defconfig
arm                         axm55xx_defconfig
powerpc                        warp_defconfig
sh                         ecovec24_defconfig
sh                           se7780_defconfig
arm                  randconfig-c002-20220301
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
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                               defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
arc                  randconfig-r043-20220301
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
powerpc                     mpc5200_defconfig
arm                                 defconfig
powerpc                  mpc866_ads_defconfig
arm                          imote2_defconfig
powerpc                      walnut_defconfig
riscv                    nommu_virt_defconfig
arm                         bcm2835_defconfig
arm                         palmz72_defconfig
arm                         orion5x_defconfig
powerpc                          g5_defconfig
powerpc                     mpc512x_defconfig
arm                        spear3xx_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220301
hexagon              randconfig-r041-20220301
riscv                randconfig-r042-20220301
s390                 randconfig-r044-20220301

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
