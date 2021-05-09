Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFAE3774D8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 May 2021 03:39:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fd6LN2t9Pz305q
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 May 2021 11:39:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fd6L14rsDz2yYJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 May 2021 11:39:16 +1000 (AEST)
IronPort-SDR: Ocv1naZK/MV6YLeXP9BTujNShw7S2PNEFbNSEbiLcqpovvyQ3cEPWYx83aNynMYWmI1AzdVYS2
 QxrahaQIVoVg==
X-IronPort-AV: E=McAfee;i="6200,9189,9978"; a="186424884"
X-IronPort-AV: E=Sophos;i="5.82,284,1613462400"; d="scan'208";a="186424884"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2021 18:39:12 -0700
IronPort-SDR: SKsyfH5tceDJOklFAo2K4I80YG0naj5DN2VrCU3YTHWizFuRu14nOo5Az40/v8slR9EIL7TkY7
 NWU9iYrb9eHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,284,1613462400"; d="scan'208";a="466799834"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 08 May 2021 18:39:11 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lfYPW-000BsI-KJ; Sun, 09 May 2021 01:39:10 +0000
Date: Sun, 09 May 2021 09:38:36 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS f96271cefe6dfd1cb04195b76f4a33e185cd7f92
Message-ID: <60973d1c.JDqDi+gKPKRuaUsz%lkp@intel.com>
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
branch HEAD: f96271cefe6dfd1cb04195b76f4a33e185cd7f92  Merge branch 'master' into next

elapsed time: 721m

configs tested: 173
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
i386                             allyesconfig
powerpc                    adder875_defconfig
powerpc                 linkstation_defconfig
powerpc                   lite5200b_defconfig
arm                         mv78xx0_defconfig
powerpc                     tqm8540_defconfig
arm                          simpad_defconfig
sh                        edosk7705_defconfig
m68k                       m5475evb_defconfig
powerpc                    mvme5100_defconfig
powerpc                     taishan_defconfig
arm                            hisi_defconfig
sh                   rts7751r2dplus_defconfig
arm                      jornada720_defconfig
powerpc                  mpc866_ads_defconfig
arm                            qcom_defconfig
mips                        qi_lb60_defconfig
arc                     haps_hs_smp_defconfig
m68k                        m5307c3_defconfig
arm                         s3c6400_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                   secureedge5410_defconfig
powerpc                     stx_gp3_defconfig
sh                          rsk7203_defconfig
mips                           ip27_defconfig
mips                      pic32mzda_defconfig
powerpc                 mpc832x_mds_defconfig
sh                          urquell_defconfig
sh                   sh7724_generic_defconfig
powerpc                 mpc837x_mds_defconfig
openrisc                 simple_smp_defconfig
i386                             alldefconfig
powerpc                 xes_mpc85xx_defconfig
arm                           sama5_defconfig
powerpc                     ep8248e_defconfig
mips                         tb0226_defconfig
sh                          lboxre2_defconfig
arm                        mini2440_defconfig
s390                                defconfig
mips                      maltaaprp_defconfig
h8300                     edosk2674_defconfig
m68k                         apollo_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                            e55_defconfig
powerpc                      pmac32_defconfig
arm                       imx_v6_v7_defconfig
mips                     cu1000-neo_defconfig
um                               allyesconfig
arc                     nsimosci_hs_defconfig
sh                           se7751_defconfig
nios2                            allyesconfig
powerpc                 mpc834x_mds_defconfig
arm                        spear3xx_defconfig
arm                         socfpga_defconfig
m68k                        mvme16x_defconfig
powerpc                      ppc6xx_defconfig
arm                       cns3420vb_defconfig
m68k                          sun3x_defconfig
ia64                      gensparse_defconfig
arm                              alldefconfig
mips                     cu1830-neo_defconfig
sh                             espt_defconfig
mips                          rb532_defconfig
arm                         nhk8815_defconfig
arc                            hsdk_defconfig
arc                           tb10x_defconfig
arm                        magician_defconfig
arm                            dove_defconfig
arc                          axs103_defconfig
s390                       zfcpdump_defconfig
powerpc                      ppc64e_defconfig
sparc                       sparc64_defconfig
ia64                             alldefconfig
mips                           ip22_defconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210508
i386                 randconfig-a006-20210508
i386                 randconfig-a001-20210508
i386                 randconfig-a005-20210508
i386                 randconfig-a004-20210508
i386                 randconfig-a002-20210508
i386                 randconfig-a003-20210509
i386                 randconfig-a006-20210509
i386                 randconfig-a001-20210509
i386                 randconfig-a005-20210509
i386                 randconfig-a004-20210509
i386                 randconfig-a002-20210509
x86_64               randconfig-a014-20210508
x86_64               randconfig-a015-20210508
x86_64               randconfig-a011-20210508
x86_64               randconfig-a013-20210508
x86_64               randconfig-a012-20210508
x86_64               randconfig-a016-20210508
i386                 randconfig-a013-20210508
i386                 randconfig-a015-20210508
i386                 randconfig-a014-20210508
i386                 randconfig-a016-20210508
i386                 randconfig-a011-20210508
i386                 randconfig-a012-20210508
i386                 randconfig-a013-20210509
i386                 randconfig-a015-20210509
i386                 randconfig-a014-20210509
i386                 randconfig-a016-20210509
i386                 randconfig-a011-20210509
i386                 randconfig-a012-20210509
x86_64               randconfig-a005-20210509
x86_64               randconfig-a003-20210509
x86_64               randconfig-a001-20210509
x86_64               randconfig-a002-20210509
x86_64               randconfig-a006-20210509
x86_64               randconfig-a004-20210509
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a005-20210508
x86_64               randconfig-a003-20210508
x86_64               randconfig-a001-20210508
x86_64               randconfig-a002-20210508
x86_64               randconfig-a006-20210508
x86_64               randconfig-a004-20210508
x86_64               randconfig-a014-20210509
x86_64               randconfig-a015-20210509
x86_64               randconfig-a011-20210509
x86_64               randconfig-a013-20210509
x86_64               randconfig-a012-20210509
x86_64               randconfig-a016-20210509

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
