Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF22A331BD9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 01:44:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dvc0Q6Whxz3cLY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 11:44:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dvc056jJHz30RG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 11:43:45 +1100 (AEDT)
IronPort-SDR: nFLlRgsAdDaBpjF4IzQ/+5BiPnqFIg53nPuBtNt41WyINWz0KVFYKsi++xCayQ8advg55G6Z3n
 052RvsgHYHZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="185744137"
X-IronPort-AV: E=Sophos;i="5.81,233,1610438400"; d="scan'208";a="185744137"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2021 16:43:42 -0800
IronPort-SDR: p3OtcuTSj92gqBffzldQDj2Cb0SuavyVXPIB6jOewiyyuyglF+Z1rRPYTFRpk/MDiGxuYSVo1y
 ocPFV1gIkEaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,233,1610438400"; d="scan'208";a="408431521"
Received: from lkp-server01.sh.intel.com (HELO 3e992a48ca98) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 08 Mar 2021 16:43:40 -0800
Received: from kbuild by 3e992a48ca98 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lJQTL-0001Fx-Nv; Tue, 09 Mar 2021 00:43:39 +0000
Date: Tue, 09 Mar 2021 08:43:03 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 67f76911b6d44cea4c783271c9633d1414bce4fb
Message-ID: <6046c497.R3PItZQR7pJmlZTO%lkp@intel.com>
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
branch HEAD: 67f76911b6d44cea4c783271c9633d1414bce4fb  Automatic merge of 'master' into merge (2021-03-08 10:21)

elapsed time: 727m

configs tested: 127
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     akebono_defconfig
sh                          polaris_defconfig
sh                          rsk7264_defconfig
powerpc                 mpc832x_mds_defconfig
arm                          pcm027_defconfig
powerpc                     skiroot_defconfig
mips                        workpad_defconfig
sh                          sdk7780_defconfig
sh                        edosk7760_defconfig
powerpc                          g5_defconfig
csky                             alldefconfig
powerpc                  mpc885_ads_defconfig
nds32                            alldefconfig
parisc                generic-32bit_defconfig
sh                          lboxre2_defconfig
sh                          rsk7203_defconfig
sh                           se7619_defconfig
powerpc                        cell_defconfig
arm                           corgi_defconfig
arm                     eseries_pxa_defconfig
arm                             rpc_defconfig
arm                        mvebu_v7_defconfig
powerpc                     stx_gp3_defconfig
sparc                            allyesconfig
sh                             espt_defconfig
m68k                          sun3x_defconfig
sparc                       sparc64_defconfig
mips                  maltasmvp_eva_defconfig
m68k                       m5208evb_defconfig
arm                       imx_v6_v7_defconfig
arm                             ezx_defconfig
arm                        trizeps4_defconfig
h8300                       h8s-sim_defconfig
powerpc                      mgcoge_defconfig
sh                             sh03_defconfig
mips                       capcella_defconfig
xtensa                  audio_kc705_defconfig
sh                           se7705_defconfig
arm                         bcm2835_defconfig
arm                        keystone_defconfig
mips                            gpr_defconfig
arm                        neponset_defconfig
arm                       aspeed_g5_defconfig
sh                          sdk7786_defconfig
arm                           u8500_defconfig
mips                         mpc30x_defconfig
mips                  decstation_64_defconfig
sh                           se7721_defconfig
mips                         tb0219_defconfig
powerpc                 mpc8272_ads_defconfig
sh                ecovec24-romimage_defconfig
arm                            hisi_defconfig
ia64                            zx1_defconfig
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
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210308
x86_64               randconfig-a001-20210308
x86_64               randconfig-a004-20210308
x86_64               randconfig-a002-20210308
x86_64               randconfig-a005-20210308
x86_64               randconfig-a003-20210308
i386                 randconfig-a005-20210308
i386                 randconfig-a003-20210308
i386                 randconfig-a002-20210308
i386                 randconfig-a006-20210308
i386                 randconfig-a004-20210308
i386                 randconfig-a001-20210308
i386                 randconfig-a016-20210308
i386                 randconfig-a012-20210308
i386                 randconfig-a014-20210308
i386                 randconfig-a013-20210308
i386                 randconfig-a011-20210308
i386                 randconfig-a015-20210308
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210308
x86_64               randconfig-a016-20210308
x86_64               randconfig-a015-20210308
x86_64               randconfig-a014-20210308
x86_64               randconfig-a011-20210308
x86_64               randconfig-a012-20210308

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
