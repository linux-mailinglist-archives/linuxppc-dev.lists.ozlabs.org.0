Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB3A338D3A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 13:39:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dxlkx3zVrz3dQh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 23:39:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxlkG6RJ6z3cVG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 23:39:16 +1100 (AEDT)
IronPort-SDR: 7p7aMvRwptk0zhEvXkX61y+Il8wy5c2pRdjUk1w4KcH+505NRMNz79TprVgzUWpT3J89qi+0Q+
 0C+NTb2+dI8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="208665552"
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; d="scan'208";a="208665552"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 04:39:11 -0800
IronPort-SDR: 4MiYjDGFNuUQxTAUO0BLGV2lFBGtUbNYbP5jMNEXKxk7ybg/wHXoc1ELcOOigzgF31QTZA9Frr
 ycbEJYTpR4gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; d="scan'208";a="387340559"
Received: from lkp-server02.sh.intel.com (HELO ce64c092ff93) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 12 Mar 2021 04:39:10 -0800
Received: from kbuild by ce64c092ff93 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lKh4P-0001Li-Nd; Fri, 12 Mar 2021 12:39:09 +0000
Date: Fri, 12 Mar 2021 20:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes] BUILD SUCCESS 0b736881c8f1a6cd912f7a9162b9e097b28c1c30
Message-ID: <604b60c2.LDKh+kSUHOZqo42m%lkp@intel.com>
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
branch HEAD: 0b736881c8f1a6cd912f7a9162b9e097b28c1c30  powerpc/traps: unrecoverable_exception() is not an interrupt handler

elapsed time: 732m

configs tested: 106
configs skipped: 20

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
nds32                            alldefconfig
powerpc                    socrates_defconfig
sh                           se7712_defconfig
arm                          collie_defconfig
riscv                               defconfig
powerpc                    ge_imp3a_defconfig
sh                             sh03_defconfig
arm                             mxs_defconfig
sh                        dreamcast_defconfig
arm                          ixp4xx_defconfig
h8300                               defconfig
arc                          axs101_defconfig
sh                   sh7724_generic_defconfig
m68k                         apollo_defconfig
arm                         lpc32xx_defconfig
m68k                          multi_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                      ep88xc_defconfig
sh                        sh7763rdp_defconfig
arm                        neponset_defconfig
sh                 kfr2r09-romimage_defconfig
ia64                          tiger_defconfig
arm                       netwinder_defconfig
arm                        magician_defconfig
mips                        bcm63xx_defconfig
powerpc                 mpc832x_rdb_defconfig
arm64                            alldefconfig
sh                          r7785rp_defconfig
arc                           tb10x_defconfig
arm                        keystone_defconfig
arm                        trizeps4_defconfig
sparc                               defconfig
parisc                generic-64bit_defconfig
mips                          malta_defconfig
m68k                        mvme147_defconfig
powerpc                      ppc40x_defconfig
powerpc                     tqm8548_defconfig
arm                         s3c6400_defconfig
mips                        nlm_xlr_defconfig
arm                          iop32x_defconfig
sparc                       sparc32_defconfig
sh                        edosk7705_defconfig
powerpc                 mpc836x_mds_defconfig
arm                                 defconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210311
i386                 randconfig-a005-20210311
i386                 randconfig-a003-20210311
i386                 randconfig-a002-20210311
i386                 randconfig-a004-20210311
i386                 randconfig-a006-20210311
i386                 randconfig-a013-20210311
i386                 randconfig-a016-20210311
i386                 randconfig-a011-20210311
i386                 randconfig-a014-20210311
i386                 randconfig-a015-20210311
i386                 randconfig-a012-20210311
x86_64               randconfig-a006-20210311
x86_64               randconfig-a001-20210311
x86_64               randconfig-a005-20210311
x86_64               randconfig-a002-20210311
x86_64               randconfig-a003-20210311
x86_64               randconfig-a004-20210311
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20210311
x86_64               randconfig-a016-20210311
x86_64               randconfig-a013-20210311
x86_64               randconfig-a015-20210311
x86_64               randconfig-a014-20210311
x86_64               randconfig-a012-20210311

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
