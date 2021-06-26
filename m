Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1033B5062
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Jun 2021 00:52:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GC8JK3sPsz3c8J
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Jun 2021 08:52:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GC8HZ42fBz301g
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Jun 2021 08:51:13 +1000 (AEST)
IronPort-SDR: 4rixJl+7JoELFsa5Tblb1ZZv9xa7NjESN6zYn0gM4muXtSL8B+mH2T6fGEt5qNcvo5VXq5kBBJ
 bQHW3ScmVqqg==
X-IronPort-AV: E=McAfee;i="6200,9189,10027"; a="271668167"
X-IronPort-AV: E=Sophos;i="5.83,302,1616482800"; d="scan'208";a="271668167"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2021 15:51:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,302,1616482800"; d="scan'208";a="407313262"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 26 Jun 2021 15:51:07 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lxH8k-0007wE-PC; Sat, 26 Jun 2021 22:51:06 +0000
Date: Sun, 27 Jun 2021 06:50:32 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS b064037ea4104120418ccbf39951a6d529a9d6d5
Message-ID: <60d7af38.ye6kzt+KtqXQgfec%lkp@intel.com>
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
branch HEAD: b064037ea4104120418ccbf39951a6d529a9d6d5  powerpc/interrupt: Use names in check_return_regs_valid()

elapsed time: 723m

configs tested: 154
configs skipped: 35

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                  maltasmvp_eva_defconfig
mips                         db1xxx_defconfig
sh                        apsh4ad0a_defconfig
mips                         tb0226_defconfig
s390                          debug_defconfig
powerpc                 mpc832x_mds_defconfig
arc                            hsdk_defconfig
arc                           tb10x_defconfig
ia64                            zx1_defconfig
powerpc                         ps3_defconfig
powerpc                      mgcoge_defconfig
sh                        sh7785lcr_defconfig
sh                           se7721_defconfig
sh                        edosk7705_defconfig
arm                         bcm2835_defconfig
sh                               j2_defconfig
sh                          r7785rp_defconfig
h8300                            alldefconfig
mips                 decstation_r4k_defconfig
m68k                        mvme16x_defconfig
arm                           omap1_defconfig
riscv                            allyesconfig
arm                          pxa3xx_defconfig
arm                          moxart_defconfig
arm                           u8500_defconfig
arm                         palmz72_defconfig
powerpc                 mpc834x_mds_defconfig
arm                         s3c6400_defconfig
mips                      pic32mzda_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                     tqm8560_defconfig
arc                     nsimosci_hs_defconfig
arm                         hackkit_defconfig
mips                     cu1830-neo_defconfig
powerpc                 xes_mpc85xx_defconfig
m68k                       m5275evb_defconfig
powerpc                     pq2fads_defconfig
arm                         vf610m4_defconfig
m68k                            mac_defconfig
microblaze                      mmu_defconfig
arm                        trizeps4_defconfig
arm                        cerfcube_defconfig
sh                             shx3_defconfig
powerpc                    socrates_defconfig
powerpc                          g5_defconfig
powerpc                        fsp2_defconfig
sparc64                             defconfig
sparc                       sparc32_defconfig
sh                          rsk7201_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                    adder875_defconfig
mips                      malta_kvm_defconfig
arm                         orion5x_defconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210625
x86_64               randconfig-a001-20210625
x86_64               randconfig-a005-20210625
x86_64               randconfig-a003-20210625
x86_64               randconfig-a004-20210625
x86_64               randconfig-a006-20210625
i386                 randconfig-a002-20210625
i386                 randconfig-a001-20210625
i386                 randconfig-a003-20210625
i386                 randconfig-a006-20210625
i386                 randconfig-a005-20210625
i386                 randconfig-a004-20210625
x86_64               randconfig-a012-20210622
x86_64               randconfig-a016-20210622
x86_64               randconfig-a015-20210622
x86_64               randconfig-a014-20210622
x86_64               randconfig-a013-20210622
x86_64               randconfig-a011-20210622
i386                 randconfig-a011-20210626
i386                 randconfig-a014-20210626
i386                 randconfig-a013-20210626
i386                 randconfig-a015-20210626
i386                 randconfig-a012-20210626
i386                 randconfig-a016-20210626
i386                 randconfig-a011-20210625
i386                 randconfig-a014-20210625
i386                 randconfig-a013-20210625
i386                 randconfig-a015-20210625
i386                 randconfig-a012-20210625
i386                 randconfig-a016-20210625
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210622
x86_64               randconfig-b001-20210626
x86_64               randconfig-b001-20210625
x86_64               randconfig-a002-20210626
x86_64               randconfig-a001-20210626
x86_64               randconfig-a005-20210626
x86_64               randconfig-a003-20210626
x86_64               randconfig-a004-20210626
x86_64               randconfig-a006-20210626
x86_64               randconfig-a002-20210622
x86_64               randconfig-a001-20210622
x86_64               randconfig-a005-20210622
x86_64               randconfig-a003-20210622
x86_64               randconfig-a004-20210622
x86_64               randconfig-a006-20210622
x86_64               randconfig-a012-20210625
x86_64               randconfig-a016-20210625
x86_64               randconfig-a015-20210625
x86_64               randconfig-a014-20210625
x86_64               randconfig-a013-20210625
x86_64               randconfig-a011-20210625

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
