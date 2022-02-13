Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A792A4B3E01
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 23:29:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxhpf1XFcz3bcc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 09:28:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KgsYQzz7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KgsYQzz7; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxhnw6dNmz2xvV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 09:28:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644791301; x=1676327301;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=1j2FOilWYSEWGvSM3tYhxHouLG1n+3v04/9JAFepb38=;
 b=KgsYQzz7o/0G/poEEu/l3fLRGHGu9VA43YP10KJZJofzJ05NLNPyU9VB
 bNQY77VklnYTfSZx8sgn15cimstSNSNKs/2AgveLg3Y+Fly7vVrD+TJFC
 CpLYOZbrdvmZ12vpVOYomkmVkoL/efxDiUhbdAzX0/VESdv5SyHpAnDCA
 DLQ8yHDmG9Cjj0KYQhXKo2fNa41XkwXbD1edx19oSF3PkiFuVizIElSkB
 gtDdLdOu0GFax1ld4rdqMp7ZI/y4h+rfXwHJDpwXPwGPy7CzGrHV+YvEW
 M8kOQhjdtIBecTFTcJ4lu8NU5OpUByW5uJTdVDl/rp1oHuIf0moCW2U1D Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="233527669"
X-IronPort-AV: E=Sophos;i="5.88,366,1635231600"; d="scan'208";a="233527669"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2022 14:27:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,366,1635231600"; d="scan'208";a="542951590"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 13 Feb 2022 14:27:11 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nJNKo-0007uc-C1; Sun, 13 Feb 2022 22:27:10 +0000
Date: Mon, 14 Feb 2022 06:26:16 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS 5a72345e6a78120368fcc841b570331b6c5a50da
Message-ID: <62098588.IfXhdQNs3tGSnzZ4%lkp@intel.com>
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
branch HEAD: 5a72345e6a78120368fcc841b570331b6c5a50da  powerpc: Fix STACKTRACE=n build

elapsed time: 726m

configs tested: 179
configs skipped: 27

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220214
sh                          rsk7264_defconfig
arm                           h3600_defconfig
openrisc                            defconfig
m68k                        mvme147_defconfig
sh                            hp6xx_defconfig
powerpc64                        alldefconfig
powerpc                 mpc8540_ads_defconfig
sh                             espt_defconfig
sparc64                          alldefconfig
powerpc                     mpc83xx_defconfig
m68k                       m5208evb_defconfig
arm                       imx_v6_v7_defconfig
arm                      integrator_defconfig
arc                        vdk_hs38_defconfig
powerpc                      pasemi_defconfig
sh                        edosk7760_defconfig
sh                           se7343_defconfig
xtensa                           alldefconfig
arm                        multi_v7_defconfig
csky                                defconfig
arm                          pxa910_defconfig
powerpc64                           defconfig
arm64                            alldefconfig
arm                         assabet_defconfig
ia64                         bigsur_defconfig
arm                           corgi_defconfig
sh                ecovec24-romimage_defconfig
sh                              ul2_defconfig
powerpc                      cm5200_defconfig
powerpc                       eiger_defconfig
m68k                          hp300_defconfig
sh                                  defconfig
alpha                            alldefconfig
arm                           tegra_defconfig
sh                        dreamcast_defconfig
m68k                        m5407c3_defconfig
arc                            hsdk_defconfig
m68k                       bvme6000_defconfig
powerpc                     pq2fads_defconfig
mips                         rt305x_defconfig
mips                     decstation_defconfig
mips                            gpr_defconfig
ia64                          tiger_defconfig
arm                           u8500_defconfig
mips                      loongson3_defconfig
sh                           se7619_defconfig
arm                         axm55xx_defconfig
sh                           se7721_defconfig
mips                      fuloong2e_defconfig
arm                        realview_defconfig
m68k                            mac_defconfig
sh                         microdev_defconfig
arm                            xcep_defconfig
powerpc                     rainier_defconfig
powerpc                       ppc64_defconfig
s390                                defconfig
parisc                              defconfig
sh                        sh7785lcr_defconfig
m68k                        stmark2_defconfig
powerpc                 linkstation_defconfig
mips                            ar7_defconfig
sparc                       sparc64_defconfig
mips                 decstation_r4k_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
x86_64               randconfig-a013-20220214
x86_64               randconfig-a014-20220214
x86_64               randconfig-a012-20220214
x86_64               randconfig-a015-20220214
x86_64               randconfig-a011-20220214
x86_64               randconfig-a016-20220214
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
riscv                randconfig-c006-20220213
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220213
arm                  randconfig-c002-20220213
i386                          randconfig-c001
mips                 randconfig-c004-20220213
s390                 randconfig-c005-20220213
arm                           omap1_defconfig
arm                  colibri_pxa270_defconfig
arm                       aspeed_g4_defconfig
hexagon                             defconfig
powerpc                  mpc866_ads_defconfig
arm                     am200epdkit_defconfig
powerpc                      pmac32_defconfig
arm                  colibri_pxa300_defconfig
arm                          ep93xx_defconfig
arm                            dove_defconfig
mips                           rs90_defconfig
arm                         mv78xx0_defconfig
riscv                            alldefconfig
mips                        qi_lb60_defconfig
mips                          ath79_defconfig
mips                           ip22_defconfig
powerpc                     mpc5200_defconfig
arm                          moxart_defconfig
mips                     cu1000-neo_defconfig
i386                 randconfig-a004-20220214
i386                 randconfig-a005-20220214
i386                 randconfig-a006-20220214
i386                 randconfig-a002-20220214
i386                 randconfig-a003-20220214
i386                 randconfig-a001-20220214
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220213
hexagon              randconfig-r041-20220213
riscv                randconfig-r042-20220213
s390                 randconfig-r044-20220213
hexagon              randconfig-r045-20220214
hexagon              randconfig-r041-20220214

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
