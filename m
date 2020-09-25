Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C830E277DCB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 04:04:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ByFbb0yRzzDqjT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 12:04:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ByFXM4rtzzDqdM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Sep 2020 12:01:54 +1000 (AEST)
IronPort-SDR: 8nlp3/A1b1VoXzz/Ze31vQdbWESsvtC7aRG4cOcjCIddzMIDtjbfP6qOMvPXpt22lwnBrFv3/R
 61M86uJDKSYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="158755377"
X-IronPort-AV: E=Sophos;i="5.77,300,1596524400"; d="scan'208";a="158755377"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 19:01:52 -0700
IronPort-SDR: VUdnRHshe+OqcZZlYgN+Liw4dUryvE2ZpGoqriZKXsWZtdhKsJn9Wyf5XBE7Dd1cSmDtfR7k3+
 APOvvX/DAwlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,300,1596524400"; d="scan'208";a="383300246"
Received: from lkp-server01.sh.intel.com (HELO d1a6b931d9c6) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 24 Sep 2020 19:01:50 -0700
Received: from kbuild by d1a6b931d9c6 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kLd3W-0000DW-1c; Fri, 25 Sep 2020 02:01:50 +0000
Date: Fri, 25 Sep 2020 10:01:01 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD REGRESSION
 2e60265c1feb6848c77dbea22d38bbe262ec49db
Message-ID: <5f6d4f5d.+yaqJYQuo5UoavvV%lkp@intel.com>
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
branch HEAD: 2e60265c1feb6848c77dbea22d38bbe262ec49db  powerpc/perf: Exclude pmc5/6 from the irrelevant PMU group constraints

Error/Warning in current branch:

arch/powerpc/platforms/pseries/eeh_pseries.c:420:6: error: variable 'ret' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Error/Warning ids grouped by kconfigs:

clang_recent_errors
`-- powerpc64-randconfig-r035-20200923
    `-- arch-powerpc-platforms-pseries-eeh_pseries.c:error:variable-ret-is-used-uninitialized-whenever-if-condition-is-true-Werror-Wsometimes-uninitialized

elapsed time: 806m

configs tested: 138
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
xtensa                generic_kc705_defconfig
powerpc                    socrates_defconfig
powerpc                     sbc8548_defconfig
arm                            hisi_defconfig
sh                     magicpanelr2_defconfig
arm                        spear3xx_defconfig
sh                          r7780mp_defconfig
mips                 pnx8335_stb225_defconfig
sh                          r7785rp_defconfig
arm                            xcep_defconfig
arm                          badge4_defconfig
mips                  maltasmvp_eva_defconfig
m68k                         apollo_defconfig
mips                      bmips_stb_defconfig
arc                     nsimosci_hs_defconfig
sh                ecovec24-romimage_defconfig
arm                           u8500_defconfig
powerpc                        warp_defconfig
arm                         assabet_defconfig
sh                          rsk7201_defconfig
arm                     davinci_all_defconfig
m68k                       m5275evb_defconfig
powerpc                     tqm8548_defconfig
arm                         nhk8815_defconfig
mips                         rt305x_defconfig
arm                       mainstone_defconfig
powerpc64                           defconfig
xtensa                              defconfig
m68k                        stmark2_defconfig
arm                            qcom_defconfig
powerpc                       ebony_defconfig
xtensa                    smp_lx200_defconfig
m68k                        m5272c3_defconfig
openrisc                         alldefconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                     pseries_defconfig
powerpc                     akebono_defconfig
powerpc                    adder875_defconfig
arc                      axs103_smp_defconfig
m68k                          amiga_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                     tqm8540_defconfig
m68k                          hp300_defconfig
sparc                            allyesconfig
sparc                       sparc32_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                      pcm030_defconfig
parisc                           alldefconfig
mips                          malta_defconfig
arc                             nps_defconfig
h8300                    h8300h-sim_defconfig
powerpc                     tqm8541_defconfig
sh                          rsk7269_defconfig
arm                         s3c6400_defconfig
mips                        omega2p_defconfig
h8300                               defconfig
arm                         axm55xx_defconfig
sh                          polaris_defconfig
sh                          lboxre2_defconfig
nds32                             allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200924
i386                 randconfig-a006-20200924
i386                 randconfig-a003-20200924
i386                 randconfig-a004-20200924
i386                 randconfig-a005-20200924
i386                 randconfig-a001-20200924
i386                 randconfig-a002-20200923
i386                 randconfig-a006-20200923
i386                 randconfig-a003-20200923
i386                 randconfig-a004-20200923
i386                 randconfig-a005-20200923
i386                 randconfig-a001-20200923
x86_64               randconfig-a011-20200923
x86_64               randconfig-a013-20200923
x86_64               randconfig-a014-20200923
x86_64               randconfig-a015-20200923
x86_64               randconfig-a012-20200923
x86_64               randconfig-a016-20200923
i386                 randconfig-a012-20200923
i386                 randconfig-a014-20200923
i386                 randconfig-a013-20200923
i386                 randconfig-a011-20200923
i386                 randconfig-a016-20200923
i386                 randconfig-a015-20200923
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
x86_64               randconfig-a005-20200923
x86_64               randconfig-a003-20200923
x86_64               randconfig-a004-20200923
x86_64               randconfig-a002-20200923
x86_64               randconfig-a006-20200923
x86_64               randconfig-a001-20200923

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
