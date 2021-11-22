Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6136A4591A2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 16:49:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyWsr1h7Pz3c7B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 02:49:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyWsM0X7yz2xBx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 02:48:49 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="298222071"
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="298222071"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 07:46:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="496907909"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 22 Nov 2021 07:46:54 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mpBWv-0000MZ-Cu; Mon, 22 Nov 2021 15:46:53 +0000
Date: Mon, 22 Nov 2021 23:46:30 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 95c6ab13ec7e63e5e8628e237082431779d270f3
Message-ID: <619bbb56.dsYN+3v+F3mxBtVS%lkp@intel.com>
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
branch HEAD: 95c6ab13ec7e63e5e8628e237082431779d270f3  Automatic merge of 'master' into merge (2021-11-22 10:52)

elapsed time: 921m

configs tested: 137
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
i386                 randconfig-c001-20211122
mips                 randconfig-c004-20211122
m68k                       m5208evb_defconfig
arm                            pleb_defconfig
xtensa                  nommu_kc705_defconfig
parisc                           alldefconfig
arm                            qcom_defconfig
arc                      axs103_smp_defconfig
m68k                          sun3x_defconfig
mips                           ci20_defconfig
openrisc                         alldefconfig
sh                          kfr2r09_defconfig
mips                           mtx1_defconfig
ia64                          tiger_defconfig
arm                          iop32x_defconfig
sh                     magicpanelr2_defconfig
powerpc                 mpc8540_ads_defconfig
arc                            hsdk_defconfig
m68k                         amcore_defconfig
alpha                               defconfig
arm                        neponset_defconfig
sh                            hp6xx_defconfig
arm                         at91_dt_defconfig
mips                 decstation_r4k_defconfig
sh                      rts7751r2d1_defconfig
powerpc                   motionpro_defconfig
sh                         microdev_defconfig
powerpc                   microwatt_defconfig
arm                          collie_defconfig
sh                           se7721_defconfig
powerpc                     tqm5200_defconfig
powerpc                      pasemi_defconfig
powerpc                     ep8248e_defconfig
m68k                       bvme6000_defconfig
arm                     am200epdkit_defconfig
nios2                               defconfig
mips                           ip28_defconfig
arm                             rpc_defconfig
mips                            e55_defconfig
i386                             allyesconfig
powerpc                    ge_imp3a_defconfig
sh                         ap325rxa_defconfig
openrisc                  or1klitex_defconfig
arm                            xcep_defconfig
x86_64                              defconfig
arm                      pxa255-idp_defconfig
arm                         mv78xx0_defconfig
powerpc                     tqm8540_defconfig
microblaze                          defconfig
m68k                         apollo_defconfig
arm                       aspeed_g5_defconfig
sh                            migor_defconfig
microblaze                      mmu_defconfig
mips                malta_qemu_32r6_defconfig
arm                  randconfig-c002-20211122
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                            allyesconfig
nds32                               defconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                                defconfig
i386                              debian-10.3
sparc                            allyesconfig
sparc                               defconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a015-20211122
x86_64               randconfig-a016-20211122
i386                 randconfig-a015-20211122
i386                 randconfig-a012-20211122
i386                 randconfig-a013-20211122
i386                 randconfig-a014-20211122
i386                 randconfig-a011-20211122
i386                 randconfig-a016-20211122
x86_64               randconfig-a001-20211121
x86_64               randconfig-a003-20211121
x86_64               randconfig-a004-20211121
x86_64               randconfig-a005-20211121
x86_64               randconfig-a002-20211121
x86_64               randconfig-a006-20211121
arc                  randconfig-r043-20211122
s390                 randconfig-r044-20211122
riscv                randconfig-r042-20211122
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
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20211122
riscv                randconfig-c006-20211122
i386                 randconfig-c001-20211122
powerpc              randconfig-c003-20211122
arm                  randconfig-c002-20211122
x86_64               randconfig-c007-20211122
mips                 randconfig-c004-20211122
x86_64               randconfig-a001-20211122
x86_64               randconfig-a003-20211122
x86_64               randconfig-a004-20211122
x86_64               randconfig-a002-20211122
x86_64               randconfig-a005-20211122
x86_64               randconfig-a006-20211122
i386                 randconfig-a001-20211122
i386                 randconfig-a002-20211122
i386                 randconfig-a005-20211122
i386                 randconfig-a006-20211122
i386                 randconfig-a004-20211122
i386                 randconfig-a003-20211122

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
