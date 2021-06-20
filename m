Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0601D3ADE4C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 14:34:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7BtZ51r0z308q
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 22:34:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7BtB6kZWz303q
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jun 2021 22:34:04 +1000 (AEST)
IronPort-SDR: uIfOnzrZJIum7phWhAsogv1QlwtD9Yy1qG4H/CbL4qlP2c+AUyFcMOGocd94rQ+qNoc1Bt4HTR
 aNPgoSLo+/9A==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="267861840"
X-IronPort-AV: E=Sophos;i="5.83,287,1616482800"; d="scan'208";a="267861840"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2021 05:33:56 -0700
IronPort-SDR: 6YRcQ5ZHW+ybuivYYhsRhYInKzrer31I8eNlYTJcuyVZ829AqHSQyPG4QqnzTIFjkShuYu9uOX
 wi6Jwr9LvYlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,287,1616482800"; d="scan'208";a="453610073"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2021 05:33:55 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1luweA-00046w-GZ; Sun, 20 Jun 2021 12:33:54 +0000
Date: Sun, 20 Jun 2021 20:33:07 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 60b7ed54a41b550d50caf7f2418db4a7e75b5bdc
Message-ID: <60cf3583.s/kDl0LEl2vwdx/j%lkp@intel.com>
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
branch HEAD: 60b7ed54a41b550d50caf7f2418db4a7e75b5bdc  powerpc/perf: Fix crash in perf_instruction_pointer() when ppmu is not set

elapsed time: 721m

configs tested: 140
configs skipped: 19

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc834x_itx_defconfig
mips                     loongson2k_defconfig
powerpc                     ep8248e_defconfig
sh                             espt_defconfig
mips                          ath79_defconfig
m68k                       bvme6000_defconfig
powerpc                     kmeter1_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                     akebono_defconfig
powerpc                    klondike_defconfig
arm                        neponset_defconfig
powerpc                        icon_defconfig
arc                        vdk_hs38_defconfig
powerpc                      acadia_defconfig
mips                           ci20_defconfig
sh                          lboxre2_defconfig
sh                        sh7763rdp_defconfig
mips                    maltaup_xpa_defconfig
arm                         palmz72_defconfig
sh                            hp6xx_defconfig
powerpc                      ep88xc_defconfig
powerpc                 mpc832x_rdb_defconfig
nios2                            allyesconfig
mips                           rs90_defconfig
m68k                        m5272c3_defconfig
mips                         cobalt_defconfig
mips                malta_qemu_32r6_defconfig
sh                   secureedge5410_defconfig
arm                          pxa3xx_defconfig
sh                   sh7724_generic_defconfig
powerpc                     tqm5200_defconfig
x86_64                            allnoconfig
arm                           sunxi_defconfig
arm                     davinci_all_defconfig
arm                           h3600_defconfig
arm                       multi_v4t_defconfig
powerpc                        cell_defconfig
sh                           se7722_defconfig
h8300                               defconfig
arm                          lpd270_defconfig
powerpc                    socrates_defconfig
m68k                       m5249evb_defconfig
arm                       cns3420vb_defconfig
mips                  decstation_64_defconfig
arm                         s3c2410_defconfig
s390                                defconfig
powerpc                   bluestone_defconfig
sh                          urquell_defconfig
powerpc                        warp_defconfig
arm                         assabet_defconfig
mips                      loongson3_defconfig
sh                            titan_defconfig
ia64                          tiger_defconfig
arm                         lubbock_defconfig
arm                            mps2_defconfig
sh                     magicpanelr2_defconfig
powerpc                 mpc8540_ads_defconfig
parisc                generic-64bit_defconfig
m68k                         amcore_defconfig
arm                           corgi_defconfig
ia64                        generic_defconfig
arm                        vexpress_defconfig
arm                        magician_defconfig
powerpc                     mpc512x_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nds32                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                             allyesconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210620
i386                 randconfig-a002-20210620
i386                 randconfig-a003-20210620
i386                 randconfig-a005-20210620
i386                 randconfig-a004-20210620
i386                 randconfig-a006-20210620
x86_64               randconfig-a016-20210620
x86_64               randconfig-a015-20210620
x86_64               randconfig-a014-20210620
x86_64               randconfig-a012-20210620
x86_64               randconfig-a013-20210620
x86_64               randconfig-a011-20210620
i386                 randconfig-a016-20210620
i386                 randconfig-a014-20210620
i386                 randconfig-a015-20210620
i386                 randconfig-a011-20210620
i386                 randconfig-a013-20210620
i386                 randconfig-a012-20210620
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210620
x86_64               randconfig-a005-20210620
x86_64               randconfig-a004-20210620
x86_64               randconfig-a006-20210620
x86_64               randconfig-a002-20210620
x86_64               randconfig-a001-20210620
x86_64               randconfig-a003-20210620

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
