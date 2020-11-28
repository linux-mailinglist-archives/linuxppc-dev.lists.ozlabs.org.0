Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E002C6E21
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 02:22:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjYdR03j3zDsx9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 12:22:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjYc00KhczDsGD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 12:21:19 +1100 (AEDT)
IronPort-SDR: KjqeBo/nDP6H/oQT5RqRWx0rlGLI7H1OersmsPyPK2uV/MpyvLzn0dW9Z+G9yeK9vAKBsOFGt5
 ToPL586ujN6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="234053108"
X-IronPort-AV: E=Sophos;i="5.78,376,1599548400"; d="scan'208";a="234053108"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 17:21:11 -0800
IronPort-SDR: b3FJOpXSXb1zA4gPjsId0pnnKL4fw+9I0aFzr4uXizUa1fcX0Mq6BAYIfupoCIhDat9stq8JIL
 H6VQFz5lxOhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,376,1599548400"; d="scan'208";a="479821617"
Received: from lkp-server01.sh.intel.com (HELO b5888d13d5a5) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 27 Nov 2020 17:21:10 -0800
Received: from kbuild by b5888d13d5a5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kiovF-0000EN-DZ; Sat, 28 Nov 2020 01:21:09 +0000
Date: Sat, 28 Nov 2020 09:21:01 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 2551450071df2dabd7134e548ac209688ac6741d
Message-ID: <5fc1a5fd.YaLL1UujVGQbZ8ke%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  merge
branch HEAD: 2551450071df2dabd7134e548ac209688ac6741d  Automatic merge of 'master' into merge (2020-11-27 00:11)

elapsed time: 2160m

configs tested: 176
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                          axs101_defconfig
mips                      pic32mzda_defconfig
arm                       imx_v6_v7_defconfig
powerpc64                        alldefconfig
sh                   sh7724_generic_defconfig
m68k                        m5307c3_defconfig
csky                             alldefconfig
xtensa                          iss_defconfig
arm                           efm32_defconfig
powerpc                    sam440ep_defconfig
m68k                       m5475evb_defconfig
xtensa                    smp_lx200_defconfig
arm                         mv78xx0_defconfig
powerpc                      ep88xc_defconfig
powerpc                        fsp2_defconfig
powerpc                      acadia_defconfig
arc                              allyesconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                     mpc83xx_defconfig
arm                           viper_defconfig
s390                                defconfig
sh                         ap325rxa_defconfig
powerpc                      pasemi_defconfig
mips                         bigsur_defconfig
mips                        omega2p_defconfig
xtensa                       common_defconfig
powerpc                     kilauea_defconfig
xtensa                    xip_kc705_defconfig
parisc                generic-32bit_defconfig
arm                        magician_defconfig
powerpc                   currituck_defconfig
powerpc                     tqm8548_defconfig
sh                            migor_defconfig
powerpc                     skiroot_defconfig
powerpc                 mpc832x_mds_defconfig
sh                           se7712_defconfig
mips                        jmr3927_defconfig
powerpc                      makalu_defconfig
mips                     loongson1c_defconfig
alpha                               defconfig
arm                         s3c2410_defconfig
powerpc                        cell_defconfig
sh                   rts7751r2dplus_defconfig
xtensa                  cadence_csp_defconfig
powerpc                     mpc5200_defconfig
powerpc                      chrp32_defconfig
arm                      tct_hammer_defconfig
powerpc                     rainier_defconfig
m68k                        mvme147_defconfig
sh                          sdk7786_defconfig
powerpc                     sequoia_defconfig
arm                         lpc32xx_defconfig
powerpc                     akebono_defconfig
arm                     davinci_all_defconfig
powerpc                   bluestone_defconfig
mips                          rb532_defconfig
mips                           ip32_defconfig
c6x                        evmc6474_defconfig
arm                          prima2_defconfig
powerpc                      arches_defconfig
x86_64                           alldefconfig
sh                             shx3_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                      tqm8xx_defconfig
mips                           ip27_defconfig
powerpc64                           defconfig
arm                          ep93xx_defconfig
mips                          ath25_defconfig
microblaze                      mmu_defconfig
arm                         ebsa110_defconfig
arm                           corgi_defconfig
mips                       rbtx49xx_defconfig
sh                        sh7757lcr_defconfig
arm                          pxa3xx_defconfig
powerpc                     tqm8540_defconfig
arm                        trizeps4_defconfig
arm                         nhk8815_defconfig
powerpc                 mpc8272_ads_defconfig
xtensa                              defconfig
mips                       lemote2f_defconfig
mips                     decstation_defconfig
arc                            hsdk_defconfig
powerpc                      ppc40x_defconfig
sh                        dreamcast_defconfig
arm                       spear13xx_defconfig
um                            kunit_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20201126
x86_64               randconfig-a003-20201126
x86_64               randconfig-a004-20201126
x86_64               randconfig-a005-20201126
x86_64               randconfig-a001-20201126
x86_64               randconfig-a002-20201126
i386                 randconfig-a004-20201126
i386                 randconfig-a003-20201126
i386                 randconfig-a002-20201126
i386                 randconfig-a005-20201126
i386                 randconfig-a001-20201126
i386                 randconfig-a006-20201126
i386                 randconfig-a004-20201127
i386                 randconfig-a003-20201127
i386                 randconfig-a002-20201127
i386                 randconfig-a005-20201127
i386                 randconfig-a001-20201127
i386                 randconfig-a006-20201127
x86_64               randconfig-a015-20201127
x86_64               randconfig-a011-20201127
x86_64               randconfig-a014-20201127
x86_64               randconfig-a016-20201127
x86_64               randconfig-a012-20201127
x86_64               randconfig-a013-20201127
i386                 randconfig-a012-20201127
i386                 randconfig-a013-20201127
i386                 randconfig-a011-20201127
i386                 randconfig-a016-20201127
i386                 randconfig-a014-20201127
i386                 randconfig-a015-20201127
i386                 randconfig-a012-20201126
i386                 randconfig-a013-20201126
i386                 randconfig-a011-20201126
i386                 randconfig-a016-20201126
i386                 randconfig-a014-20201126
i386                 randconfig-a015-20201126
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20201127
x86_64               randconfig-a003-20201127
x86_64               randconfig-a004-20201127
x86_64               randconfig-a005-20201127
x86_64               randconfig-a002-20201127
x86_64               randconfig-a001-20201127

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
