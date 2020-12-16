Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4642DB85B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 02:18:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cwchj6Nj0zDqKD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 12:18:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwcbB4lbgzDqJl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 12:13:54 +1100 (AEDT)
IronPort-SDR: qiDRJ6UtGDqwxMns4T8yDZqB/zgpzk+zNZ+fU1fQFTUpLMawpm5McCa6tZcJ40w+frfTydL9pb
 visFqFRzCzKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="162034687"
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; d="scan'208";a="162034687"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 17:13:51 -0800
IronPort-SDR: X/GQAWs2wHbj7rJaEVH1W7BbyV3jr0K9jvk/CMWdnx7g01vz9/i+izy3dvFhd0KeCkpv8A22WY
 2Lpd3hcI54/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; d="scan'208";a="391085126"
Received: from lkp-server02.sh.intel.com (HELO a947d92d0467) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Dec 2020 17:13:50 -0800
Received: from kbuild by a947d92d0467 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kpLO2-000150-5C; Wed, 16 Dec 2020 01:13:50 +0000
Date: Wed, 16 Dec 2020 09:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS a1d4aa500bfb93c4ea6eb9a3c5c9cb6720ed8f46
Message-ID: <5fd95f3b.gixXVbwu+KXoYPUU%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  merge
branch HEAD: a1d4aa500bfb93c4ea6eb9a3c5c9cb6720ed8f46  Automatic merge of 'next' into merge (2020-12-15 23:50)

elapsed time: 727m

configs tested: 134
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                 nsimosci_hs_smp_defconfig
riscv                            allyesconfig
mips                      bmips_stb_defconfig
arm                        realview_defconfig
mips                     decstation_defconfig
arm64                            alldefconfig
powerpc                       holly_defconfig
powerpc                 mpc837x_mds_defconfig
arm                        shmobile_defconfig
sh                ecovec24-romimage_defconfig
arm                      pxa255-idp_defconfig
h8300                       h8s-sim_defconfig
powerpc                     powernv_defconfig
arm                         assabet_defconfig
ia64                      gensparse_defconfig
openrisc                 simple_smp_defconfig
powerpc                 mpc836x_mds_defconfig
arm                    vt8500_v6_v7_defconfig
riscv                    nommu_k210_defconfig
mips                            ar7_defconfig
powerpc                       ppc64_defconfig
arm                          ep93xx_defconfig
powerpc                        warp_defconfig
nios2                         10m50_defconfig
mips                       bmips_be_defconfig
xtensa                    xip_kc705_defconfig
sh                           se7724_defconfig
arm                            lart_defconfig
um                             i386_defconfig
ia64                         bigsur_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                        clps711x_defconfig
powerpc                     ep8248e_defconfig
arm                       netwinder_defconfig
arm                           h5000_defconfig
powerpc                     kmeter1_defconfig
arm                      integrator_defconfig
powerpc                     pq2fads_defconfig
powerpc                     tqm5200_defconfig
sh                        sh7763rdp_defconfig
arm                          collie_defconfig
arm                      jornada720_defconfig
arm                     davinci_all_defconfig
powerpc                 linkstation_defconfig
m68k                            mac_defconfig
powerpc64                        alldefconfig
arm                           sunxi_defconfig
arm                            zeus_defconfig
mips                         tb0287_defconfig
powerpc                     sequoia_defconfig
mips                  decstation_64_defconfig
arm                       omap2plus_defconfig
powerpc                 mpc834x_itx_defconfig
xtensa                          iss_defconfig
sh                           sh2007_defconfig
sh                        dreamcast_defconfig
arm                           corgi_defconfig
parisc                           alldefconfig
mips                      pic32mzda_defconfig
mips                           xway_defconfig
arm                         mv78xx0_defconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20201215
x86_64               randconfig-a006-20201215
x86_64               randconfig-a002-20201215
x86_64               randconfig-a005-20201215
x86_64               randconfig-a004-20201215
x86_64               randconfig-a001-20201215
i386                 randconfig-a001-20201215
i386                 randconfig-a004-20201215
i386                 randconfig-a003-20201215
i386                 randconfig-a002-20201215
i386                 randconfig-a006-20201215
i386                 randconfig-a005-20201215
i386                 randconfig-a014-20201215
i386                 randconfig-a013-20201215
i386                 randconfig-a012-20201215
i386                 randconfig-a011-20201215
i386                 randconfig-a015-20201215
i386                 randconfig-a016-20201215
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
x86_64               randconfig-a016-20201215
x86_64               randconfig-a012-20201215
x86_64               randconfig-a013-20201215
x86_64               randconfig-a015-20201215
x86_64               randconfig-a014-20201215
x86_64               randconfig-a011-20201215

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
