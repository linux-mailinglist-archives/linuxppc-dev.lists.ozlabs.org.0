Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABFD49F105
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 03:34:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlM3M6Y31z30QX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 13:34:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cm6Dng95;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cm6Dng95; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlM2h2TRSz2ymg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 13:33:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643337212; x=1674873212;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=EXgSbev64TfF1qCWAtpoW5BpzWZBOYBu7urVkB8aHVY=;
 b=cm6Dng95eR506XHSpfk4rS3X5Lr0m4YQ+z7l6n4IhN6jsKYuBfsH4Uhb
 eN/Rau8ket38mDsCtG9c55ZHHKhjvB03Gf0QHU5FSgjyCo7Nrp0pcTK68
 F7ogG6TqeFitczAyl9E6IVcN0bFpVPmrrZwkMbsH7M4vFvL4nyGUeCYU7
 uoTjKvEOXgMUEFhn3xYxs8dhQqRFGjDKkc/HvJEqxqNwEBsXfQoVsKUaT
 /ZjlCnCX94+YLU9zqFfj0Sq7jDlOYtVpIIDm63aN++SB55cnBzAiibK4D
 H/FjiqWXeLRtsOIu5hokRtdSTDpE+iTEwdxnKorJTq106YPDwX60A8NfY A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="271483700"
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; d="scan'208";a="271483700"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 18:31:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; d="scan'208";a="696912016"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 27 Jan 2022 18:31:49 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nDH3E-000NJC-SO; Fri, 28 Jan 2022 02:31:48 +0000
Date: Fri, 28 Jan 2022 10:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes] BUILD SUCCESS 8defc2a5dd8f4c0cb19ecbaca8d3e89ab98524da
Message-ID: <61f35567.kXljPiWkpQB6rugZ%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes
branch HEAD: 8defc2a5dd8f4c0cb19ecbaca8d3e89ab98524da  powerpc/64s/interrupt: Fix decrementer storm

elapsed time: 739m

configs tested: 152
configs skipped: 147

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
powerpc                 mpc834x_itx_defconfig
arm                         at91_dt_defconfig
mips                         mpc30x_defconfig
xtensa                              defconfig
mips                        vocore2_defconfig
arc                      axs103_smp_defconfig
arm                       imx_v6_v7_defconfig
m68k                       m5275evb_defconfig
um                             i386_defconfig
h8300                    h8300h-sim_defconfig
nios2                         10m50_defconfig
xtensa                  audio_kc705_defconfig
powerpc                      ppc40x_defconfig
powerpc                 mpc837x_mds_defconfig
s390                       zfcpdump_defconfig
arm                            pleb_defconfig
sparc                       sparc64_defconfig
sh                               allmodconfig
powerpc                  storcenter_defconfig
arm                        keystone_defconfig
sh                     sh7710voipgw_defconfig
sh                 kfr2r09-romimage_defconfig
parisc                generic-32bit_defconfig
arm                           viper_defconfig
sh                         ecovec24_defconfig
riscv                            allyesconfig
powerpc                     rainier_defconfig
mips                    maltaup_xpa_defconfig
arm                       omap2plus_defconfig
arm                           h5000_defconfig
powerpc                     tqm8541_defconfig
mips                           xway_defconfig
powerpc                      ppc6xx_defconfig
arc                              alldefconfig
arm                           sunxi_defconfig
arc                        nsimosci_defconfig
arm                         lpc18xx_defconfig
i386                                defconfig
arm                  randconfig-c002-20220127
arm                  randconfig-c002-20220124
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
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20220124
i386                 randconfig-a005-20220124
i386                 randconfig-a003-20220124
i386                 randconfig-a004-20220124
i386                 randconfig-a001-20220124
i386                 randconfig-a006-20220124
x86_64               randconfig-a002-20220124
x86_64               randconfig-a003-20220124
x86_64               randconfig-a001-20220124
x86_64               randconfig-a004-20220124
x86_64               randconfig-a005-20220124
x86_64               randconfig-a006-20220124
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220124
riscv                randconfig-c006-20220124
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
mips                 randconfig-c004-20220124
x86_64               randconfig-c007-20220124
x86_64                        randconfig-c007
arm                  randconfig-c002-20220125
riscv                randconfig-c006-20220125
powerpc              randconfig-c003-20220125
mips                 randconfig-c004-20220125
i386                          randconfig-c001
powerpc                   bluestone_defconfig
mips                           ip27_defconfig
powerpc                      ppc44x_defconfig
arm                     davinci_all_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                          allmodconfig
arm                                 defconfig
mips                     cu1830-neo_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                      katmai_defconfig
arm                         bcm2835_defconfig
powerpc                       ebony_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a016-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
i386                 randconfig-a011-20220124
i386                 randconfig-a016-20220124
i386                 randconfig-a013-20220124
i386                 randconfig-a014-20220124
i386                 randconfig-a015-20220124
i386                 randconfig-a012-20220124
riscv                randconfig-r042-20220126
riscv                randconfig-r042-20220124
hexagon              randconfig-r045-20220124
hexagon              randconfig-r045-20220127
hexagon              randconfig-r045-20220126
hexagon              randconfig-r041-20220124
hexagon              randconfig-r041-20220127
hexagon              randconfig-r041-20220126
hexagon              randconfig-r045-20220125
hexagon              randconfig-r041-20220125

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
