Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE732D91EB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 03:57:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvQyz3DfBzDqJq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 13:56:59 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvQwh3hNkzDqQH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 13:54:59 +1100 (AEDT)
IronPort-SDR: MDHEeeTZQ0oIQt+6nammf3PZJ0gnE8OjxvkHI/zuyVndk1yTd9a8zC0cwQbbgDFfdfsbT3Oon2
 buon1RAfQJ5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="171138388"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; d="scan'208";a="171138388"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2020 18:54:52 -0800
IronPort-SDR: sP1g7jaVN4zFpB/2scsJpxq+niK96ZJsu5VK/KGNFIoruI0YTrtq7UuzqsObmzsDK8ffwXNJTc
 BqG2kfyrwO8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; d="scan'208";a="447513006"
Received: from lkp-server02.sh.intel.com (HELO a947d92d0467) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 13 Dec 2020 18:54:51 -0800
Received: from kbuild by a947d92d0467 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1koe0g-00007H-Oq; Mon, 14 Dec 2020 02:54:50 +0000
Date: Mon, 14 Dec 2020 10:54:45 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS WITH WARNING
 dddc4ef92d1ce92987da1d6926cdfa99e8acb622
Message-ID: <5fd6d3f5.vMQifsqQN+kdhk+e%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  next
branch HEAD: dddc4ef92d1ce92987da1d6926cdfa99e8acb622  KVM: PPC: Book3S HV: XIVE: Add a comment regarding VP numbering

Warning reports:

https://lore.kernel.org/linuxppc-dev/202012042220.zO7hSFT2-lkp@intel.com

Warning in current branch:

arch/powerpc/kernel/vdso32/vgettimeofday.c:13:5: warning: no previous prototype for function '__c_kernel_clock_gettime64' [-Wmissing-prototypes]

Warning ids grouped by kconfigs:

clang_recent_errors
`-- powerpc64-randconfig-r025-20201213
    `-- arch-powerpc-kernel-vdso32-vgettimeofday.c:warning:no-previous-prototype-for-function-__c_kernel_clock_gettime64

elapsed time: 1767m

configs tested: 138
configs skipped: 48

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nios2                            alldefconfig
sh                          polaris_defconfig
m68k                        mvme16x_defconfig
openrisc                            defconfig
mips                        qi_lb60_defconfig
arm                           tegra_defconfig
mips                           ip27_defconfig
s390                             alldefconfig
mips                       bmips_be_defconfig
arm                          exynos_defconfig
arm                          collie_defconfig
arc                          axs101_defconfig
sh                          urquell_defconfig
sh                        dreamcast_defconfig
mips                          rm200_defconfig
sh                               j2_defconfig
powerpc                     pseries_defconfig
mips                        bcm63xx_defconfig
mips                        nlm_xlp_defconfig
arm                        shmobile_defconfig
powerpc                 linkstation_defconfig
sh                        apsh4ad0a_defconfig
arc                           tb10x_defconfig
riscv                             allnoconfig
arm                        multi_v5_defconfig
sh                                  defconfig
powerpc                      pcm030_defconfig
m68k                          atari_defconfig
mips                      loongson3_defconfig
arm                           efm32_defconfig
arm                      footbridge_defconfig
powerpc                      ppc6xx_defconfig
powerpc                    amigaone_defconfig
powerpc                       ebony_defconfig
x86_64                              defconfig
alpha                            allyesconfig
mips                      maltasmvp_defconfig
mips                malta_kvm_guest_defconfig
c6x                        evmc6678_defconfig
powerpc                     rainier_defconfig
powerpc                          g5_defconfig
mips                            e55_defconfig
powerpc                      pmac32_defconfig
sh                          lboxre2_defconfig
sh                           se7206_defconfig
i386                             alldefconfig
xtensa                  audio_kc705_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                   currituck_defconfig
arm                          pxa910_defconfig
arm                          imote2_defconfig
h8300                       h8s-sim_defconfig
microblaze                      mmu_defconfig
sh                           se7724_defconfig
m68k                         apollo_defconfig
mips                       capcella_defconfig
powerpc                mpc7448_hpc2_defconfig
m68k                          hp300_defconfig
powerpc                    klondike_defconfig
xtensa                    smp_lx200_defconfig
sparc64                             defconfig
ia64                         bigsur_defconfig
parisc                generic-32bit_defconfig
csky                                defconfig
arm                       multi_v4t_defconfig
sh                         ecovec24_defconfig
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
alpha                               defconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20201213
x86_64               randconfig-a006-20201213
x86_64               randconfig-a002-20201213
x86_64               randconfig-a005-20201213
x86_64               randconfig-a004-20201213
x86_64               randconfig-a001-20201213
i386                 randconfig-a001-20201213
i386                 randconfig-a004-20201213
i386                 randconfig-a003-20201213
i386                 randconfig-a002-20201213
i386                 randconfig-a005-20201213
i386                 randconfig-a006-20201213
i386                 randconfig-a014-20201213
i386                 randconfig-a013-20201213
i386                 randconfig-a012-20201213
i386                 randconfig-a011-20201213
i386                 randconfig-a016-20201213
i386                 randconfig-a015-20201213
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a016-20201213
x86_64               randconfig-a012-20201213
x86_64               randconfig-a013-20201213
x86_64               randconfig-a015-20201213
x86_64               randconfig-a014-20201213
x86_64               randconfig-a011-20201213

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
