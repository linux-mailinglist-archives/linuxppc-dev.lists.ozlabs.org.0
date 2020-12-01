Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A137A2C968E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 05:37:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClTq55Z6NzDqww
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 15:37:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClTm64bTWzDqtK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 15:35:02 +1100 (AEDT)
IronPort-SDR: eTjrXwvFk0yO2gvv9rzdNDZc/u4+897tH0sCntsmqXDuMK0uM7Os5pxtrI9cEO7Y/a2ub+nXqW
 eSAmUyScFSJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="170198460"
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; d="scan'208";a="170198460"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 20:34:59 -0800
IronPort-SDR: ofx+EONrOdgbiWOr+/F/pHbKl9ZKNpjPUBSztX2bd99an05M5TOQuY34IwwV5KuGZlUhL9vQBP
 ZistOoFK4syQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; d="scan'208";a="360923114"
Received: from lkp-server01.sh.intel.com (HELO 70b44b587200) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 30 Nov 2020 20:34:58 -0800
Received: from kbuild by 70b44b587200 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kjxNR-000086-Ok; Tue, 01 Dec 2020 04:34:57 +0000
Date: Tue, 01 Dec 2020 12:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 61fb396f48fcf49892b6801f2e98f40a413da1dc
Message-ID: <5fc5c7b5.caOqquGXIHUlftLC%lkp@intel.com>
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
branch HEAD: 61fb396f48fcf49892b6801f2e98f40a413da1dc  powerpc/64: Fix an EMIT_BUG_ENTRY in head_64.S

elapsed time: 723m

configs tested: 169
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                                 defconfig
arm                              allmodconfig
arm                           sama5_defconfig
sh                             espt_defconfig
sh                        edosk7705_defconfig
arm                      jornada720_defconfig
mips                      malta_kvm_defconfig
mips                         db1xxx_defconfig
powerpc                 mpc8560_ads_defconfig
arm                   milbeaut_m10v_defconfig
arm                        neponset_defconfig
sh                         ecovec24_defconfig
arm                         cm_x300_defconfig
mips                           ip27_defconfig
mips                      pic32mzda_defconfig
arm                       imx_v6_v7_defconfig
arm                        mvebu_v5_defconfig
powerpc                       maple_defconfig
xtensa                    xip_kc705_defconfig
sh                         apsh4a3a_defconfig
c6x                         dsk6455_defconfig
powerpc                      ppc64e_defconfig
openrisc                 simple_smp_defconfig
s390                       zfcpdump_defconfig
mips                           gcw0_defconfig
arm                      pxa255-idp_defconfig
arm                        multi_v7_defconfig
s390                          debug_defconfig
powerpc                      ep88xc_defconfig
arm                       aspeed_g5_defconfig
arm                            mmp2_defconfig
sh                   secureedge5410_defconfig
arm                         lpc32xx_defconfig
powerpc                     mpc5200_defconfig
mips                         tb0287_defconfig
arm                        mvebu_v7_defconfig
powerpc                 canyonlands_defconfig
mips                            gpr_defconfig
arc                        nsimosci_defconfig
arm                        clps711x_defconfig
arm                           corgi_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                          r7785rp_defconfig
powerpc                    sam440ep_defconfig
mips                        workpad_defconfig
arm                          gemini_defconfig
mips                     cu1000-neo_defconfig
ia64                        generic_defconfig
powerpc                     kilauea_defconfig
powerpc                    adder875_defconfig
sh                               j2_defconfig
powerpc                      katmai_defconfig
arc                           tb10x_defconfig
sh                          polaris_defconfig
arm                             rpc_defconfig
x86_64                           alldefconfig
arm                           h5000_defconfig
powerpc                        cell_defconfig
arm                        trizeps4_defconfig
mips                      fuloong2e_defconfig
m68k                         apollo_defconfig
arm                           spitz_defconfig
arm                         vf610m4_defconfig
arm                          lpd270_defconfig
nios2                         10m50_defconfig
um                           x86_64_defconfig
powerpc                     skiroot_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                        fsp2_defconfig
mips                       capcella_defconfig
powerpc                      ppc44x_defconfig
arm                          imote2_defconfig
xtensa                           allyesconfig
h8300                       h8s-sim_defconfig
powerpc                   bluestone_defconfig
powerpc                   lite5200b_defconfig
m68k                        m5272c3_defconfig
powerpc                       ebony_defconfig
arm                       netwinder_defconfig
powerpc                     tqm8555_defconfig
mips                        nlm_xlp_defconfig
powerpc                   motionpro_defconfig
mips                             allyesconfig
riscv                               defconfig
sh                            hp6xx_defconfig
sh                          lboxre2_defconfig
arm                             pxa_defconfig
powerpc                 xes_mpc85xx_defconfig
xtensa                          iss_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                       multi_v4t_defconfig
mips                     cu1830-neo_defconfig
arm                  colibri_pxa270_defconfig
powerpc                     stx_gp3_defconfig
arm                          simpad_defconfig
arm                              zx_defconfig
arm                        realview_defconfig
powerpc                      ppc6xx_defconfig
powerpc                     kmeter1_defconfig
mips                      maltasmvp_defconfig
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
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201130
i386                 randconfig-a002-20201130
i386                 randconfig-a003-20201130
i386                 randconfig-a005-20201130
i386                 randconfig-a006-20201130
i386                 randconfig-a001-20201130
x86_64               randconfig-a014-20201130
x86_64               randconfig-a015-20201130
x86_64               randconfig-a016-20201130
x86_64               randconfig-a011-20201130
x86_64               randconfig-a012-20201130
x86_64               randconfig-a013-20201130
i386                 randconfig-a013-20201130
i386                 randconfig-a012-20201130
i386                 randconfig-a011-20201130
i386                 randconfig-a016-20201130
i386                 randconfig-a015-20201130
i386                 randconfig-a014-20201130
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20201130
x86_64               randconfig-a006-20201130
x86_64               randconfig-a005-20201130
x86_64               randconfig-a004-20201130
x86_64               randconfig-a001-20201130
x86_64               randconfig-a003-20201130

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
