Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EC53B1272
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 05:48:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8q3n2q6lz3bvV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 13:48:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8q3Q4lLpz2xZh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 13:47:44 +1000 (AEST)
IronPort-SDR: EujTzMQ/rusF1sqgEsPlBJxkOn02YxBSLjc4N5s2pNMwW8ezgO17Cbc9chatAos2i1gENGlWWj
 QYFXYkxQ60+w==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="187568806"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="187568806"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 20:47:40 -0700
IronPort-SDR: uZ0F2z2O4Xb8u4RskgaPPlkEDJuTDxEqznfTVjxwDSFadD6pAtDEjMbAm+dr+HqO6TnyRmZIfL
 XvZhaVIIwc0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="452873383"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 22 Jun 2021 20:47:39 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lvtrX-0005hF-09; Wed, 23 Jun 2021 03:47:39 +0000
Date: Wed, 23 Jun 2021 11:47:27 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD REGRESSION
 a23408e2575e49c4394f8733c78dce907286ac8e
Message-ID: <60d2aecf.xBveEytZfnhCRdou%lkp@intel.com>
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
branch HEAD: a23408e2575e49c4394f8733c78dce907286ac8e  powerpc/64s/interrupt: Check and fix srr_valid without crashing

possible Error/Warning in current branch:

arch/powerpc/platforms/52xx/mpc52xx_pm.c:58:5: error: stack frame size (1040) exceeds limit (1024) in function 'mpc52xx_pm_prepare' [-Werror,-Wframe-larger-than]
arch/powerpc/platforms/52xx/mpc52xx_pm.c:58:5: error: stack frame size of 1040 bytes in function 'mpc52xx_pm_prepare' [-Werror,-Wframe-larger-than]
arch/powerpc/sysdev/ehv_pic.c:111:5: error: no previous prototype for function 'ehv_pic_set_irq_type' [-Werror,-Wmissing-prototypes]

Error/Warning ids grouped by kconfigs:

clang_recent_errors
|-- powerpc-randconfig-r005-20210622
|   |-- arch-powerpc-platforms-52xx-mpc52xx_pm.c:error:stack-frame-size-()-exceeds-limit-()-in-function-mpc52xx_pm_prepare-Werror-Wframe-larger-than
|   `-- arch-powerpc-platforms-52xx-mpc52xx_pm.c:error:stack-frame-size-of-bytes-in-function-mpc52xx_pm_prepare-Werror-Wframe-larger-than
`-- powerpc-randconfig-r035-20210622
    `-- arch-powerpc-sysdev-ehv_pic.c:error:no-previous-prototype-for-function-ehv_pic_set_irq_type-Werror-Wmissing-prototypes

elapsed time: 725m

configs tested: 107
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                           h3600_defconfig
powerpc                    klondike_defconfig
arm                       imx_v6_v7_defconfig
powerpc                      arches_defconfig
arm                             rpc_defconfig
powerpc                   motionpro_defconfig
arc                        vdk_hs38_defconfig
powerpc                     powernv_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                     tqm5200_defconfig
powerpc                    gamecube_defconfig
h8300                     edosk2674_defconfig
sh                           se7724_defconfig
mips                          malta_defconfig
arc                           tb10x_defconfig
mips                           ip28_defconfig
arm                     eseries_pxa_defconfig
powerpc                     ep8248e_defconfig
sh                   rts7751r2dplus_defconfig
mips                       rbtx49xx_defconfig
sh                           se7343_defconfig
powerpc                 mpc836x_rdk_defconfig
sh                 kfr2r09-romimage_defconfig
m68k                          atari_defconfig
powerpc                     tqm8555_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                    sam440ep_defconfig
powerpc                     sequoia_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210622
i386                 randconfig-a002-20210622
i386                 randconfig-a003-20210622
i386                 randconfig-a006-20210622
i386                 randconfig-a005-20210622
i386                 randconfig-a004-20210622
x86_64               randconfig-a012-20210622
x86_64               randconfig-a016-20210622
x86_64               randconfig-a015-20210622
x86_64               randconfig-a014-20210622
x86_64               randconfig-a013-20210622
x86_64               randconfig-a011-20210622
i386                 randconfig-a014-20210622
i386                 randconfig-a013-20210622
i386                 randconfig-a015-20210622
i386                 randconfig-a012-20210622
i386                 randconfig-a016-20210622
i386                 randconfig-a011-20210622
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210622
x86_64               randconfig-a002-20210622
x86_64               randconfig-a001-20210622
x86_64               randconfig-a005-20210622
x86_64               randconfig-a003-20210622
x86_64               randconfig-a004-20210622
x86_64               randconfig-a006-20210622

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
