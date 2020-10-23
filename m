Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E4F2968F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 06:16:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHWBY4vwSzDqhT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 15:16:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHW8q0hZFzDqY7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 15:14:50 +1100 (AEDT)
IronPort-SDR: 5tPcYKZpxm4P+UyglksuIeqZHCbS8AY8UkFPOhZpYWugb6IeL7rzGSg6xvFuIb26mHYdUgoFoU
 nyprQfiokbuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="146918560"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="146918560"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 21:14:45 -0700
IronPort-SDR: J0eztgtGX6+j8XNfAnmrHBvba8DE30ss63bTQ6cmyUP2uPb7cXOvTBJ7NdPqIm1KXUG1aiu4VY
 oIJSXVVOmQ0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="359484111"
Received: from lkp-server01.sh.intel.com (HELO 1f55bd7cde4b) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Oct 2020 21:14:44 -0700
Received: from kbuild by 1f55bd7cde4b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kVoTT-00003V-Sn; Fri, 23 Oct 2020 04:14:43 +0000
Date: Fri, 23 Oct 2020 12:14:36 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes] BUILD SUCCESS 4ff753feab021242144818b9a3ba011238218145
Message-ID: <5f9258ac.88ixzwKMNJfFa6HI%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  fixes
branch HEAD: 4ff753feab021242144818b9a3ba011238218145  powerpc/pseries: Avoid using addr_to_pfn in real mode

elapsed time: 723m

configs tested: 120
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc837x_mds_defconfig
mips                          ath79_defconfig
um                            kunit_defconfig
powerpc                     ppa8548_defconfig
arm                        spear6xx_defconfig
riscv                            alldefconfig
arm                            xcep_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
powerpc                     ksi8560_defconfig
arm                         s3c6400_defconfig
mips                        maltaup_defconfig
arm                           omap1_defconfig
arm                         lubbock_defconfig
arm                           spitz_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                        vocore2_defconfig
arm                      jornada720_defconfig
arc                          axs103_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     redwood_defconfig
sh                             sh03_defconfig
mips                      bmips_stb_defconfig
sparc64                          alldefconfig
sh                     magicpanelr2_defconfig
arm                         axm55xx_defconfig
c6x                        evmc6678_defconfig
mips                         bigsur_defconfig
powerpc                     tqm8560_defconfig
mips                  cavium_octeon_defconfig
xtensa                    xip_kc705_defconfig
m68k                        m5407c3_defconfig
sh                             espt_defconfig
arm                        realview_defconfig
xtensa                         virt_defconfig
powerpc                      ppc6xx_defconfig
arm                       versatile_defconfig
h8300                               defconfig
m68k                        stmark2_defconfig
powerpc                        icon_defconfig
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
i386                 randconfig-a002-20201023
i386                 randconfig-a005-20201023
i386                 randconfig-a003-20201023
i386                 randconfig-a001-20201023
i386                 randconfig-a006-20201023
i386                 randconfig-a004-20201023
i386                 randconfig-a002-20201022
i386                 randconfig-a005-20201022
i386                 randconfig-a003-20201022
i386                 randconfig-a001-20201022
i386                 randconfig-a006-20201022
i386                 randconfig-a004-20201022
x86_64               randconfig-a011-20201022
x86_64               randconfig-a013-20201022
x86_64               randconfig-a016-20201022
x86_64               randconfig-a015-20201022
x86_64               randconfig-a012-20201022
x86_64               randconfig-a014-20201022
i386                 randconfig-a016-20201022
i386                 randconfig-a014-20201022
i386                 randconfig-a015-20201022
i386                 randconfig-a012-20201022
i386                 randconfig-a013-20201022
i386                 randconfig-a011-20201022
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
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20201022
x86_64               randconfig-a002-20201022
x86_64               randconfig-a003-20201022
x86_64               randconfig-a006-20201022
x86_64               randconfig-a004-20201022
x86_64               randconfig-a005-20201022

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
