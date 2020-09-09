Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BD0262509
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 04:15:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmQb64VwGzDqBP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 12:15:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmQNm2qh5zDqM0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 12:06:15 +1000 (AEST)
IronPort-SDR: MakxrcdFunoZz+aGtRvpUhjDGAy0LgV6JjebsJjUWjdDOgMh5KDWxXewSPxuzvarDoV8778L2b
 mjhN6U+AOJmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="219813622"
X-IronPort-AV: E=Sophos;i="5.76,408,1592895600"; d="scan'208";a="219813622"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 19:05:52 -0700
IronPort-SDR: o8ZR5CRLcqwmsN4r5IaDCucJe2h9aKialljkwRVeiUgtblC55Q9aTrBnO8SO/FQ1W12PhLZoh/
 X0a3tJRILCmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,408,1592895600"; d="scan'208";a="328725566"
Received: from lkp-server01.sh.intel.com (HELO fc0154cbc871) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 08 Sep 2020 19:05:51 -0700
Received: from kbuild by fc0154cbc871 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kFpUd-0000Jf-00; Wed, 09 Sep 2020 02:05:51 +0000
Date: Wed, 09 Sep 2020 10:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 1caa0de62d8cfeb6874fba2a6af5fbe67ebfca70
Message-ID: <5f583870.K0InkiNtroOYJ7rI%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  next-test
branch HEAD: 1caa0de62d8cfeb6874fba2a6af5fbe67ebfca70  powerpc/64: Make VDSO32 track COMPAT on 64-bit

elapsed time: 744m

configs tested: 157
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
parisc                              defconfig
powerpc                    mvme5100_defconfig
sh                         microdev_defconfig
c6x                         dsk6455_defconfig
powerpc                          allmodconfig
arm                       omap2plus_defconfig
powerpc                    adder875_defconfig
mips                            ar7_defconfig
arm                           omap1_defconfig
sh                           se7619_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     ep8248e_defconfig
xtensa                              defconfig
arm                          pxa910_defconfig
arm                        spear3xx_defconfig
mips                malta_kvm_guest_defconfig
m68k                        m5407c3_defconfig
c6x                              allyesconfig
mips                            gpr_defconfig
sh                           se7780_defconfig
powerpc                           allnoconfig
c6x                        evmc6457_defconfig
m68k                            q40_defconfig
sparc                            allyesconfig
sh                        sh7763rdp_defconfig
arm                            zeus_defconfig
sh                           se7705_defconfig
riscv                    nommu_k210_defconfig
arm                       spear13xx_defconfig
arc                     haps_hs_smp_defconfig
m68k                       m5275evb_defconfig
h8300                               defconfig
c6x                        evmc6474_defconfig
mips                   sb1250_swarm_defconfig
mips                         tb0287_defconfig
riscv                            alldefconfig
m68k                         amcore_defconfig
arm                           h5000_defconfig
sh                          lboxre2_defconfig
arm                            qcom_defconfig
sh                   sh7724_generic_defconfig
mips                     loongson1b_defconfig
parisc                generic-32bit_defconfig
arm                        spear6xx_defconfig
ia64                          tiger_defconfig
microblaze                      mmu_defconfig
powerpc                     mpc512x_defconfig
arm                          collie_defconfig
arm                         hackkit_defconfig
powerpc                 linkstation_defconfig
arm                      footbridge_defconfig
mips                      bmips_stb_defconfig
arm                             rpc_defconfig
mips                        nlm_xlr_defconfig
m68k                        stmark2_defconfig
h8300                            alldefconfig
sh                        sh7785lcr_defconfig
arc                          axs103_defconfig
xtensa                           allyesconfig
s390                          debug_defconfig
c6x                        evmc6678_defconfig
arm                         shannon_defconfig
arm                            pleb_defconfig
arc                          axs101_defconfig
nios2                            allyesconfig
sh                        apsh4ad0a_defconfig
c6x                        evmc6472_defconfig
riscv                          rv32_defconfig
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
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
x86_64               randconfig-a006-20200907
x86_64               randconfig-a004-20200907
x86_64               randconfig-a003-20200907
x86_64               randconfig-a005-20200907
x86_64               randconfig-a001-20200907
x86_64               randconfig-a002-20200907
i386                 randconfig-a004-20200908
i386                 randconfig-a005-20200908
i386                 randconfig-a006-20200908
i386                 randconfig-a002-20200908
i386                 randconfig-a001-20200908
i386                 randconfig-a003-20200908
i386                 randconfig-a004-20200907
i386                 randconfig-a005-20200907
i386                 randconfig-a006-20200907
i386                 randconfig-a002-20200907
i386                 randconfig-a003-20200907
i386                 randconfig-a001-20200907
x86_64               randconfig-a013-20200908
x86_64               randconfig-a016-20200908
x86_64               randconfig-a011-20200908
x86_64               randconfig-a012-20200908
x86_64               randconfig-a015-20200908
x86_64               randconfig-a014-20200908
i386                 randconfig-a016-20200907
i386                 randconfig-a015-20200907
i386                 randconfig-a011-20200907
i386                 randconfig-a013-20200907
i386                 randconfig-a014-20200907
i386                 randconfig-a012-20200907
i386                 randconfig-a016-20200908
i386                 randconfig-a015-20200908
i386                 randconfig-a011-20200908
i386                 randconfig-a013-20200908
i386                 randconfig-a014-20200908
i386                 randconfig-a012-20200908
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20200908
x86_64               randconfig-a006-20200908
x86_64               randconfig-a003-20200908
x86_64               randconfig-a001-20200908
x86_64               randconfig-a005-20200908
x86_64               randconfig-a002-20200908
x86_64               randconfig-a013-20200907
x86_64               randconfig-a011-20200907
x86_64               randconfig-a016-20200907
x86_64               randconfig-a012-20200907
x86_64               randconfig-a015-20200907
x86_64               randconfig-a014-20200907

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
