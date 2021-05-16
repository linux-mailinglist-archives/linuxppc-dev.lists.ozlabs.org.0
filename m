Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B862381E8E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 14:00:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fjgmv41J2z3bxh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 21:59:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fjgm91wyKz2xvc
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 21:59:16 +1000 (AEST)
IronPort-SDR: o2uEY2wyOoCl1+mFSgE4H8aLN/uEYgB39jnArpef9OMmvhI/oaHtd9jS3xh95xUiD7zvQWCUDr
 e95xaxHqyIgw==
X-IronPort-AV: E=McAfee;i="6200,9189,9985"; a="264254558"
X-IronPort-AV: E=Sophos;i="5.82,304,1613462400"; d="scan'208";a="264254558"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2021 04:59:12 -0700
IronPort-SDR: 2O5MZbOs2GwJ0U35gfC+226p2nUOYefOplfl3ZDqfiTB6t0/d4VIbXbK6IIyj4eIf26fV4chn+
 gBv7t0gDPeqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,304,1613462400"; d="scan'208";a="437262931"
Received: from lkp-server01.sh.intel.com (HELO ddd90b05c979) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 16 May 2021 04:59:10 -0700
Received: from kbuild by ddd90b05c979 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1liFQL-0001QW-TF; Sun, 16 May 2021 11:59:09 +0000
Date: Sun, 16 May 2021 19:58:35 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 3a81c0495fdb91fd9a9b4f617098c283131eeae1
Message-ID: <60a108eb.ACVKq4qy5H/jRG/U%lkp@intel.com>
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
branch HEAD: 3a81c0495fdb91fd9a9b4f617098c283131eeae1  Automatic merge of 'fixes' into merge (2021-05-16 08:46)

elapsed time: 723m

configs tested: 119
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc832x_rdb_defconfig
mips                      pic32mzda_defconfig
ia64                        generic_defconfig
arm                           viper_defconfig
arm                        spear3xx_defconfig
arm                         shannon_defconfig
arm                         lubbock_defconfig
arm                        keystone_defconfig
openrisc                 simple_smp_defconfig
mips                      maltasmvp_defconfig
powerpc                     ppa8548_defconfig
sh                         apsh4a3a_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                      ppc64e_defconfig
sh                   sh7770_generic_defconfig
mips                        nlm_xlp_defconfig
um                           x86_64_defconfig
powerpc                      acadia_defconfig
powerpc64                        alldefconfig
sh                        sh7757lcr_defconfig
powerpc                 mpc836x_rdk_defconfig
sh                          sdk7780_defconfig
m68k                          amiga_defconfig
arm                          pcm027_defconfig
mips                        jmr3927_defconfig
arc                     nsimosci_hs_defconfig
powerpc                 mpc8560_ads_defconfig
arm                            xcep_defconfig
m68k                       m5275evb_defconfig
h8300                            alldefconfig
sh                   rts7751r2dplus_defconfig
powerpc                    adder875_defconfig
arm                           omap1_defconfig
arm                          pxa910_defconfig
sh                             sh03_defconfig
arm                       aspeed_g5_defconfig
sh                          r7785rp_defconfig
powerpc                       holly_defconfig
sparc                       sparc64_defconfig
mips                      pistachio_defconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210516
x86_64               randconfig-a003-20210516
x86_64               randconfig-a001-20210516
x86_64               randconfig-a005-20210516
x86_64               randconfig-a002-20210516
x86_64               randconfig-a006-20210516
i386                 randconfig-a003-20210516
i386                 randconfig-a001-20210516
i386                 randconfig-a004-20210516
i386                 randconfig-a005-20210516
i386                 randconfig-a002-20210516
i386                 randconfig-a006-20210516
i386                 randconfig-a016-20210516
i386                 randconfig-a014-20210516
i386                 randconfig-a011-20210516
i386                 randconfig-a012-20210516
i386                 randconfig-a015-20210516
i386                 randconfig-a013-20210516
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210516
x86_64               randconfig-a012-20210516
x86_64               randconfig-a011-20210516
x86_64               randconfig-a013-20210516
x86_64               randconfig-a016-20210516
x86_64               randconfig-a014-20210516

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
