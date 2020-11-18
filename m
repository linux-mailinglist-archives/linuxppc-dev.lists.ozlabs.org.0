Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EDD2B73E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 02:49:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbQhZ6b5nzDqgd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 12:49:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbQfv4yVdzDqZm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 12:47:31 +1100 (AEDT)
IronPort-SDR: QQCBDbYUgbmbdULoVdYi0ncteUzVNqnbY1TYDqcvvrcgLLXLwqUJB8XJOx8pFJEf8F/W/Toot4
 F+p6nRpRId6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="235197340"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="235197340"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 17:47:27 -0800
IronPort-SDR: 7cccedmlvM468UG4Rpnz0ozmE8Sh6pZsJavLMraMV+nydrfoRuWvJHB4xLVYqQ3FMeuPUchwKP
 ywBlEL61thmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="368089067"
Received: from lkp-server01.sh.intel.com (HELO d102174a0e0d) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Nov 2020 17:47:26 -0800
Received: from kbuild by d102174a0e0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kfCZB-0000Ev-Tb; Wed, 18 Nov 2020 01:47:25 +0000
Date: Wed, 18 Nov 2020 09:47:12 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 9d1aa2f025c6cc516125c42c70f6a9ce087c49ea
Message-ID: <5fb47d20.J+yqgYbbS3v2HPBW%lkp@intel.com>
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
branch HEAD: 9d1aa2f025c6cc516125c42c70f6a9ce087c49ea  Automatic merge of 'fixes' into merge (2020-11-17 22:09)

elapsed time: 859m

configs tested: 171
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                           efm32_defconfig
powerpc                    sam440ep_defconfig
arm                       imx_v4_v5_defconfig
mips                         tb0219_defconfig
um                           x86_64_defconfig
powerpc                 mpc8315_rdb_defconfig
nios2                         10m50_defconfig
powerpc                       eiger_defconfig
m68k                        mvme147_defconfig
xtensa                          iss_defconfig
mips                           ci20_defconfig
c6x                        evmc6678_defconfig
m68k                        m5407c3_defconfig
arc                 nsimosci_hs_smp_defconfig
ia64                      gensparse_defconfig
powerpc64                        alldefconfig
mips                malta_kvm_guest_defconfig
powerpc                     redwood_defconfig
arm                        cerfcube_defconfig
arc                              alldefconfig
sh                            hp6xx_defconfig
s390                       zfcpdump_defconfig
openrisc                         alldefconfig
powerpc                 xes_mpc85xx_defconfig
arc                         haps_hs_defconfig
arc                    vdk_hs38_smp_defconfig
arm                          pxa910_defconfig
sh                          sdk7786_defconfig
powerpc                     tqm8555_defconfig
powerpc                     tqm8560_defconfig
arm                         orion5x_defconfig
powerpc                      mgcoge_defconfig
mips                           mtx1_defconfig
sh                          landisk_defconfig
sh                         apsh4a3a_defconfig
powerpc                        warp_defconfig
arm                            u300_defconfig
arm                      tct_hammer_defconfig
c6x                         dsk6455_defconfig
csky                             alldefconfig
sparc64                             defconfig
arm                           viper_defconfig
m68k                          hp300_defconfig
arm                          gemini_defconfig
mips                        bcm47xx_defconfig
arm                       mainstone_defconfig
mips                       bmips_be_defconfig
xtensa                       common_defconfig
arm                        neponset_defconfig
arm                            zeus_defconfig
arm                        clps711x_defconfig
sh                         ap325rxa_defconfig
mips                     cu1000-neo_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          iop32x_defconfig
mips                      loongson3_defconfig
powerpc                     stx_gp3_defconfig
arc                     nsimosci_hs_defconfig
mips                      bmips_stb_defconfig
powerpc                   lite5200b_defconfig
sh                        apsh4ad0a_defconfig
s390                             alldefconfig
arm                           sunxi_defconfig
s390                          debug_defconfig
sh                            titan_defconfig
arm                        oxnas_v6_defconfig
mips                        workpad_defconfig
powerpc                     ppa8548_defconfig
mips                         cobalt_defconfig
microblaze                    nommu_defconfig
mips                         mpc30x_defconfig
powerpc                     skiroot_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20201117
i386                 randconfig-a005-20201117
i386                 randconfig-a001-20201117
i386                 randconfig-a002-20201117
i386                 randconfig-a004-20201117
i386                 randconfig-a003-20201117
i386                 randconfig-a006-20201116
i386                 randconfig-a005-20201116
i386                 randconfig-a001-20201116
i386                 randconfig-a002-20201116
i386                 randconfig-a004-20201116
i386                 randconfig-a003-20201116
x86_64               randconfig-a015-20201115
x86_64               randconfig-a011-20201115
x86_64               randconfig-a014-20201115
x86_64               randconfig-a013-20201115
x86_64               randconfig-a016-20201115
x86_64               randconfig-a012-20201115
x86_64               randconfig-a003-20201116
x86_64               randconfig-a005-20201116
x86_64               randconfig-a004-20201116
x86_64               randconfig-a002-20201116
x86_64               randconfig-a001-20201116
x86_64               randconfig-a006-20201116
i386                 randconfig-a012-20201116
i386                 randconfig-a014-20201116
i386                 randconfig-a016-20201116
i386                 randconfig-a011-20201116
i386                 randconfig-a015-20201116
i386                 randconfig-a013-20201116
i386                 randconfig-a012-20201117
i386                 randconfig-a014-20201117
i386                 randconfig-a016-20201117
i386                 randconfig-a011-20201117
i386                 randconfig-a015-20201117
i386                 randconfig-a013-20201117
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
x86_64               randconfig-a003-20201115
x86_64               randconfig-a015-20201116
x86_64               randconfig-a011-20201116
x86_64               randconfig-a014-20201116
x86_64               randconfig-a013-20201116
x86_64               randconfig-a016-20201116
x86_64               randconfig-a012-20201116
x86_64               randconfig-a003-20201117
x86_64               randconfig-a005-20201117
x86_64               randconfig-a004-20201117
x86_64               randconfig-a002-20201117
x86_64               randconfig-a001-20201117
x86_64               randconfig-a006-20201117

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
