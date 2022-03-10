Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 782434D406A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 05:50:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDc7Y34Lzz3bSy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 15:50:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FFB1+hOh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FFB1+hOh; dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDc6w3nSFz2yQG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 15:49:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646887784; x=1678423784;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=V99w5rWIU4/wFWmNF1aCXXJqD185aj6uctNc6zFjIg4=;
 b=FFB1+hOhtAcbngUbHdMv5ouIgnQPFrLH2QxAglJv4XvOIsSQKzMRSN16
 zWLOeqXq5uCoANdZus0icSyzqsb1tsqGVFOMFPL+Xp2yUQz5n1gUsfR6C
 DVMEyJf5Yac9dk7EyC3ZAd9h2OrZFmVjjusnbF9/Ux5k50YrohCfXBQIh
 aA59sIu20kRagUnHnIoPEa3pf9Ywr1MHfQ6w4WpieipYGu/EE2kdzUl7p
 hgeHmgVXuyHYZazWkHK7WZjpazapMttOcNufrf2GEmNOSMQ6/Kr74Ze9H
 4P0TMU/30cD/WMIFntxGwFZ9nYPpIVUA2DZO5qeqvRAkNCRJWzGSCDtzu Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="235109229"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="235109229"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 20:48:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="712219779"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 09 Mar 2022 20:48:38 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSAj7-0004Kp-QR; Thu, 10 Mar 2022 04:48:37 +0000
Date: Thu, 10 Mar 2022 12:48:28 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS d799769188529abc6cbf035a10087a51f7832b6b
Message-ID: <6229831c.BI8PrqNq44Iyx/uO%lkp@intel.com>
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
branch HEAD: d799769188529abc6cbf035a10087a51f7832b6b  powerpc/64: Add UADDR64 relocation support

elapsed time: 739m

configs tested: 149
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
mips                  maltasmvp_eva_defconfig
powerpc                     sequoia_defconfig
powerpc                     taishan_defconfig
ia64                             alldefconfig
arm                        clps711x_defconfig
m68k                       m5208evb_defconfig
sparc64                          alldefconfig
sh                              ul2_defconfig
h8300                     edosk2674_defconfig
sh                           se7206_defconfig
arm                           corgi_defconfig
arm                        spear6xx_defconfig
mips                           gcw0_defconfig
sh                          sdk7786_defconfig
mips                       capcella_defconfig
arm                           viper_defconfig
powerpc                 mpc8540_ads_defconfig
arc                          axs103_defconfig
powerpc                    klondike_defconfig
arm                       aspeed_g5_defconfig
sh                        apsh4ad0a_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
sh                               allmodconfig
m68k                         apollo_defconfig
parisc64                         alldefconfig
powerpc                  iss476-smp_defconfig
um                                  defconfig
m68k                          multi_defconfig
arm                         axm55xx_defconfig
arc                 nsimosci_hs_smp_defconfig
h8300                               defconfig
sh                            migor_defconfig
mips                         rt305x_defconfig
sh                          rsk7264_defconfig
arm                          exynos_defconfig
nios2                            alldefconfig
arm                            pleb_defconfig
mips                        vocore2_defconfig
powerpc                      chrp32_defconfig
sh                         ap325rxa_defconfig
parisc                generic-32bit_defconfig
powerpc                 mpc837x_mds_defconfig
sh                            hp6xx_defconfig
powerpc                     asp8347_defconfig
xtensa                       common_defconfig
sh                  sh7785lcr_32bit_defconfig
openrisc                         alldefconfig
sh                             espt_defconfig
powerpc                     rainier_defconfig
arm                        mini2440_defconfig
sh                           se7705_defconfig
sh                           se7722_defconfig
arm                        keystone_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                           xway_defconfig
arm                  randconfig-c002-20220309
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220309
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
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
riscv                randconfig-c006-20220309
powerpc              randconfig-c003-20220309
i386                          randconfig-c001
arm                  randconfig-c002-20220309
arm                                 defconfig
riscv                             allnoconfig
powerpc                 mpc8540_ads_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     tqm8560_defconfig
mips                     cu1830-neo_defconfig
arm                           spitz_defconfig
arm                          pxa168_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220309
hexagon              randconfig-r041-20220309
riscv                randconfig-r042-20220309

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
