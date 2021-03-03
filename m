Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CABEE32ACAC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 01:51:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqwSF4lL5z3d2t
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 11:51:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqwRw5McWz30N1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 11:51:34 +1100 (AEDT)
IronPort-SDR: J0XFmRxw4pe3Et9qGCr9//0PAGkARlIAU/03AXkZV4uq0feuh6UgzhiQGG8sbhIU/HB0l4H4w6
 UJWuBjOCBsVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="187111409"
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="187111409"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 16:51:30 -0800
IronPort-SDR: f1NMlvDcnP9CRdf2CwPh3KaliIaTNk6M5oWHX0G0YmjOCD1GRc+ntPG33LJgav1KeA/zpIcfAK
 Y4jI2SFpADxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="506544267"
Received: from lkp-server02.sh.intel.com (HELO 2482ff9f8ac0) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 02 Mar 2021 16:51:28 -0800
Received: from kbuild by 2482ff9f8ac0 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lHFjb-0000mE-7d; Wed, 03 Mar 2021 00:51:27 +0000
Date: Wed, 03 Mar 2021 08:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 5c88a17e15795226b56d83f579cbb9b7a4864f79
Message-ID: <603edd8a.I8TvZ4mOhGgkxSq8%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 5c88a17e15795226b56d83f579cbb9b7a4864f79  powerpc/sstep: Fix VSX instruction emulation

elapsed time: 723m

configs tested: 104
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nds32                               defconfig
arm                          ep93xx_defconfig
arm                     am200epdkit_defconfig
powerpc                        warp_defconfig
powerpc                          allmodconfig
m68k                        stmark2_defconfig
powerpc                     pq2fads_defconfig
arm                        mvebu_v7_defconfig
arm                  colibri_pxa270_defconfig
sh                           se7705_defconfig
i386                             alldefconfig
arm                           sama5_defconfig
arm                          iop32x_defconfig
s390                       zfcpdump_defconfig
sh                      rts7751r2d1_defconfig
sparc                               defconfig
c6x                              alldefconfig
powerpc                      walnut_defconfig
powerpc                     sbc8548_defconfig
powerpc                   currituck_defconfig
m68k                        mvme147_defconfig
nios2                            alldefconfig
arm                       mainstone_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                       ppc64_defconfig
arm                          pxa168_defconfig
riscv                          rv32_defconfig
arm                         socfpga_defconfig
openrisc                  or1klitex_defconfig
powerpc                      cm5200_defconfig
xtensa                  audio_kc705_defconfig
sh                        sh7757lcr_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
powerpc                           allnoconfig
x86_64               randconfig-a006-20210302
x86_64               randconfig-a001-20210302
x86_64               randconfig-a004-20210302
x86_64               randconfig-a002-20210302
x86_64               randconfig-a005-20210302
x86_64               randconfig-a003-20210302
i386                 randconfig-a005-20210302
i386                 randconfig-a003-20210302
i386                 randconfig-a002-20210302
i386                 randconfig-a004-20210302
i386                 randconfig-a006-20210302
i386                 randconfig-a001-20210302
i386                 randconfig-a016-20210302
i386                 randconfig-a012-20210302
i386                 randconfig-a014-20210302
i386                 randconfig-a013-20210302
i386                 randconfig-a011-20210302
i386                 randconfig-a015-20210302
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210302
x86_64               randconfig-a016-20210302
x86_64               randconfig-a015-20210302
x86_64               randconfig-a014-20210302
x86_64               randconfig-a012-20210302
x86_64               randconfig-a011-20210302

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
