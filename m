Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 199034584E9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Nov 2021 17:56:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HxxPp6R9sz305W
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 03:56:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HxxPL5kHLz2xXg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 03:56:02 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="214704240"
X-IronPort-AV: E=Sophos;i="5.87,252,1631602800"; d="scan'208";a="214704240"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 08:54:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,252,1631602800"; d="scan'208";a="537643280"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 21 Nov 2021 08:54:57 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1moq7F-00071E-19; Sun, 21 Nov 2021 16:54:57 +0000
Date: Mon, 22 Nov 2021 00:54:16 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 e5abb2825c66bacb76417c9a28941cdf7fd22f32
Message-ID: <619a79b8.ynolvMt24KAFlfDy%lkp@intel.com>
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
branch HEAD: e5abb2825c66bacb76417c9a28941cdf7fd22f32  powerpc/32: Fix hardlockup on vmap stack overflow

elapsed time: 726m

configs tested: 132
configs skipped: 97

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
ia64                                defconfig
powerpc                 mpc8313_rdb_defconfig
m68k                        mvme16x_defconfig
powerpc                       holly_defconfig
mips                          ath79_defconfig
arm                      jornada720_defconfig
csky                                defconfig
arm                        mvebu_v7_defconfig
powerpc                     kmeter1_defconfig
powerpc                     ppa8548_defconfig
mips                           ip28_defconfig
sh                          rsk7269_defconfig
powerpc                     rainier_defconfig
powerpc                        warp_defconfig
arm                        oxnas_v6_defconfig
arm                      tct_hammer_defconfig
sparc                            alldefconfig
sh                        apsh4ad0a_defconfig
m68k                        mvme147_defconfig
sh                         microdev_defconfig
ia64                          tiger_defconfig
arm                       netwinder_defconfig
sh                   sh7770_generic_defconfig
arm                        vexpress_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                     tqm8541_defconfig
sh                               alldefconfig
powerpc                 mpc832x_mds_defconfig
riscv                    nommu_virt_defconfig
arm                            dove_defconfig
mips                      loongson3_defconfig
mips                      maltasmvp_defconfig
powerpc                      ep88xc_defconfig
sh                        dreamcast_defconfig
arm                          pxa168_defconfig
arm                        trizeps4_defconfig
mips                   sb1250_swarm_defconfig
sh                          urquell_defconfig
arm                          simpad_defconfig
powerpc                    sam440ep_defconfig
mips                     loongson1c_defconfig
powerpc                     tqm8555_defconfig
m68k                           sun3_defconfig
powerpc                        icon_defconfig
powerpc                      pcm030_defconfig
riscv                            allyesconfig
sh                          r7785rp_defconfig
powerpc                     akebono_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                     asp8347_defconfig
powerpc                    mvme5100_defconfig
s390                       zfcpdump_defconfig
powerpc                    socrates_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                     loongson1b_defconfig
m68k                       bvme6000_defconfig
arm                  randconfig-c002-20211121
ia64                             allmodconfig
ia64                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                 randconfig-a001-20211121
i386                 randconfig-a002-20211121
i386                 randconfig-a005-20211121
i386                 randconfig-a006-20211121
i386                 randconfig-a004-20211121
i386                 randconfig-a003-20211121
x86_64               randconfig-a001-20211121
x86_64               randconfig-a006-20211121
x86_64               randconfig-a003-20211121
x86_64               randconfig-a004-20211121
x86_64               randconfig-a005-20211121
x86_64               randconfig-a002-20211121
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20211121
i386                 randconfig-c001-20211121
powerpc              randconfig-c003-20211121
arm                  randconfig-c002-20211121
riscv                randconfig-c006-20211121
x86_64               randconfig-c007-20211121
mips                 randconfig-c004-20211121
x86_64               randconfig-a011-20211121
x86_64               randconfig-a014-20211121
x86_64               randconfig-a012-20211121
x86_64               randconfig-a016-20211121
x86_64               randconfig-a013-20211121
x86_64               randconfig-a015-20211121
i386                 randconfig-a016-20211121
i386                 randconfig-a015-20211121
i386                 randconfig-a012-20211121
i386                 randconfig-a013-20211121
i386                 randconfig-a014-20211121
i386                 randconfig-a011-20211121
hexagon              randconfig-r045-20211121
s390                 randconfig-r044-20211121
hexagon              randconfig-r041-20211121
riscv                randconfig-r042-20211121

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
