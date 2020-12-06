Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD91B2D0045
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 03:21:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CpVYB61WdzDqpv
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 13:21:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CpVTH6LBTzDqkx
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Dec 2020 13:17:35 +1100 (AEDT)
IronPort-SDR: Kbxk+ib1lakL3VtdwzTG506OQxJ1NgS1ri0P6I4XSWsOUeSASSi0tgmkKafKMd6rm4Z27fnJqQ
 l+io4ldtCr0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9826"; a="153368550"
X-IronPort-AV: E=Sophos;i="5.78,396,1599548400"; d="scan'208";a="153368550"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2020 18:17:32 -0800
IronPort-SDR: LxcfbrjApLB/EcYvAdgxLaziHWeGoRZ6qc1zqZVJkQsN60PDEaAFXDb1N6SaC7uUt5UmlQPoeG
 rNfzVHI+qxaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,396,1599548400"; d="scan'208";a="366764394"
Received: from lkp-server01.sh.intel.com (HELO 47754f1311fc) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 05 Dec 2020 18:17:31 -0800
Received: from kbuild by 47754f1311fc with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kljcB-0000X0-00; Sun, 06 Dec 2020 02:17:31 +0000
Date: Sun, 06 Dec 2020 10:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 8817aabb1bdd5811130f94ff6442bb19c9158a3a
Message-ID: <5fcc3f0c.h6GLKKKbYJQYcKjh%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  next-test
branch HEAD: 8817aabb1bdd5811130f94ff6442bb19c9158a3a  powerpc: Remove ucache_bsize

elapsed time: 864m

configs tested: 137
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                             alldefconfig
powerpc                 mpc8272_ads_defconfig
powerpc                          g5_defconfig
powerpc                     sequoia_defconfig
powerpc                    gamecube_defconfig
nios2                            alldefconfig
arc                        vdk_hs38_defconfig
powerpc                      cm5200_defconfig
arm                          tango4_defconfig
mips                 decstation_r4k_defconfig
powerpc                     tqm8555_defconfig
sh                           se7721_defconfig
c6x                        evmc6457_defconfig
mips                     loongson1c_defconfig
powerpc                         wii_defconfig
mips                  decstation_64_defconfig
xtensa                  cadence_csp_defconfig
arm                        shmobile_defconfig
um                           x86_64_defconfig
ia64                          tiger_defconfig
arm                         mv78xx0_defconfig
ia64                            zx1_defconfig
sh                 kfr2r09-romimage_defconfig
mips                       capcella_defconfig
x86_64                              defconfig
mips                       rbtx49xx_defconfig
arm                          ixp4xx_defconfig
mips                        bcm63xx_defconfig
powerpc                   motionpro_defconfig
mips                           jazz_defconfig
powerpc                        cell_defconfig
ia64                             alldefconfig
powerpc                     tqm5200_defconfig
arc                         haps_hs_defconfig
arm                           spitz_defconfig
arm                          exynos_defconfig
mips                         tb0219_defconfig
arm                          prima2_defconfig
sh                            titan_defconfig
powerpc                       eiger_defconfig
arm                        trizeps4_defconfig
sh                          lboxre2_defconfig
powerpc                    amigaone_defconfig
powerpc               mpc834x_itxgp_defconfig
sparc                               defconfig
arm                        spear3xx_defconfig
arm                         at91_dt_defconfig
powerpc                       ebony_defconfig
mips                         tb0226_defconfig
sh                             espt_defconfig
arm                         vf610m4_defconfig
arm                        multi_v5_defconfig
arm                         nhk8815_defconfig
arm                           sama5_defconfig
powerpc                 mpc8560_ads_defconfig
ia64                        generic_defconfig
arm                           omap1_defconfig
arm                        mini2440_defconfig
s390                                defconfig
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
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20201205
i386                 randconfig-a004-20201205
i386                 randconfig-a001-20201205
i386                 randconfig-a002-20201205
i386                 randconfig-a006-20201205
i386                 randconfig-a003-20201205
i386                 randconfig-a005-20201204
i386                 randconfig-a004-20201204
i386                 randconfig-a001-20201204
i386                 randconfig-a002-20201204
i386                 randconfig-a006-20201204
i386                 randconfig-a003-20201204
x86_64               randconfig-a016-20201205
x86_64               randconfig-a012-20201205
x86_64               randconfig-a014-20201205
x86_64               randconfig-a013-20201205
x86_64               randconfig-a015-20201205
x86_64               randconfig-a011-20201205
i386                 randconfig-a014-20201205
i386                 randconfig-a013-20201205
i386                 randconfig-a011-20201205
i386                 randconfig-a015-20201205
i386                 randconfig-a012-20201205
i386                 randconfig-a016-20201205
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201205
x86_64               randconfig-a006-20201205
x86_64               randconfig-a002-20201205
x86_64               randconfig-a001-20201205
x86_64               randconfig-a005-20201205
x86_64               randconfig-a003-20201205

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
