Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AABA530D034
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 01:17:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVj1D1RxZzDsPv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 11:17:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVHJ92gkdzDwh6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 18:58:48 +1100 (AEDT)
IronPort-SDR: iBvGyVuajiDzGJACUBDRKCcBJfEPvrhM99x5e/medc1ff2AFrhKQDPc9LvTt+ndpzcjkhB+y2y
 hKQGiWyGtVZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="199728603"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="199728603"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 23:58:46 -0800
IronPort-SDR: RgYBbecUr94dmY/nhf4ebUz4/DKAa7mpeBszppsvOdJMSYsjEI6YUzKBCzHTQo5+6i+HwE9Y8s
 8dfb46LdJrkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="581850240"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2021 23:58:37 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1l6qa4-0009Ch-LL; Tue, 02 Feb 2021 07:58:36 +0000
Date: Tue, 02 Feb 2021 15:58:11 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS WITH WARNING
 30133c32d19c678dbd9da28ace3aac35eb5dd4c9
Message-ID: <60190613.EjDY/uD9LFPZU3Y1%lkp@intel.com>
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
branch HEAD: 30133c32d19c678dbd9da28ace3aac35eb5dd4c9  Fixup powermac PCI

Warning in current branch:

arch/powerpc/kernel/pci-common.c:1704:12: warning: no previous prototype for 'discover_phbs' [-Wmissing-prototypes]
arch/powerpc/kernel/pci-common.c:1704:12: warning: no previous prototype for function 'discover_phbs' [-Wmissing-prototypes]

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- powerpc-allyesconfig
    `-- arch-powerpc-kernel-pci-common.c:warning:no-previous-prototype-for-discover_phbs

clang_recent_errors
`-- powerpc-randconfig-r033-20210131
    `-- arch-powerpc-kernel-pci-common.c:warning:no-previous-prototype-for-function-discover_phbs

elapsed time: 2644m

configs tested: 151
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                    vt8500_v6_v7_defconfig
powerpc                      tqm8xx_defconfig
sh                          r7785rp_defconfig
arm                        mvebu_v5_defconfig
sh                   rts7751r2dplus_defconfig
mips                        workpad_defconfig
powerpc                   bluestone_defconfig
powerpc                      walnut_defconfig
sh                           se7721_defconfig
sh                           sh2007_defconfig
ia64                             alldefconfig
c6x                        evmc6457_defconfig
sh                          rsk7203_defconfig
powerpc                      arches_defconfig
m68k                        mvme147_defconfig
powerpc                     tqm8548_defconfig
sh                           se7780_defconfig
powerpc                   motionpro_defconfig
arm                          ep93xx_defconfig
arm                        multi_v5_defconfig
mips                         cobalt_defconfig
arm                            pleb_defconfig
arm                           stm32_defconfig
powerpc                     tqm8555_defconfig
powerpc                     taishan_defconfig
arm                              alldefconfig
powerpc                       maple_defconfig
arm                         at91_dt_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                      ppc64e_defconfig
arc                      axs103_smp_defconfig
sh                             sh03_defconfig
mips                           mtx1_defconfig
mips                          malta_defconfig
powerpc                 mpc8272_ads_defconfig
sh                           se7751_defconfig
arc                            hsdk_defconfig
arm                        mini2440_defconfig
arm                         assabet_defconfig
s390                       zfcpdump_defconfig
arm                          gemini_defconfig
alpha                            alldefconfig
mips                        omega2p_defconfig
mips                      bmips_stb_defconfig
xtensa                  audio_kc705_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210201
i386                 randconfig-a005-20210201
i386                 randconfig-a003-20210201
i386                 randconfig-a006-20210201
i386                 randconfig-a002-20210201
i386                 randconfig-a004-20210201
i386                 randconfig-a005-20210131
i386                 randconfig-a003-20210131
i386                 randconfig-a002-20210131
i386                 randconfig-a001-20210131
i386                 randconfig-a004-20210131
i386                 randconfig-a006-20210131
x86_64               randconfig-a015-20210131
x86_64               randconfig-a011-20210131
x86_64               randconfig-a014-20210131
x86_64               randconfig-a016-20210131
x86_64               randconfig-a012-20210131
x86_64               randconfig-a013-20210131
x86_64               randconfig-a013-20210202
x86_64               randconfig-a014-20210202
x86_64               randconfig-a015-20210202
x86_64               randconfig-a016-20210202
x86_64               randconfig-a011-20210202
x86_64               randconfig-a012-20210202
i386                 randconfig-a013-20210131
i386                 randconfig-a011-20210131
i386                 randconfig-a015-20210131
i386                 randconfig-a012-20210131
i386                 randconfig-a014-20210131
i386                 randconfig-a016-20210131
i386                 randconfig-a013-20210201
i386                 randconfig-a016-20210201
i386                 randconfig-a014-20210201
i386                 randconfig-a012-20210201
i386                 randconfig-a015-20210201
i386                 randconfig-a011-20210201
x86_64               randconfig-a006-20210201
x86_64               randconfig-a001-20210201
x86_64               randconfig-a005-20210201
x86_64               randconfig-a002-20210201
x86_64               randconfig-a004-20210201
x86_64               randconfig-a003-20210201
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210131
x86_64               randconfig-a002-20210131
x86_64               randconfig-a001-20210131
x86_64               randconfig-a005-20210131
x86_64               randconfig-a006-20210131
x86_64               randconfig-a003-20210131
x86_64               randconfig-a013-20210201
x86_64               randconfig-a014-20210201
x86_64               randconfig-a015-20210201
x86_64               randconfig-a016-20210201
x86_64               randconfig-a011-20210201
x86_64               randconfig-a012-20210201

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
