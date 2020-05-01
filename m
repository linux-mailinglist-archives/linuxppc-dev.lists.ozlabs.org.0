Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A2A1C1147
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 12:57:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49D8NC4WkJzDrPn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 20:57:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49D8LY18D8zDrM9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 20:55:58 +1000 (AEST)
IronPort-SDR: 6dRWiO7oFUcr2j/OvFRilGSC6hAhRycBcApFmQY9DUdG4fDOCy0Q/bAcalZcP/J2Dk4qTE+bna
 1DT6G6xwGxsw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2020 03:55:54 -0700
IronPort-SDR: J+Uw8qyOgPTyyWWB7KQk9L2oO/dCAqyGN686qcOkr8E9svzzJLvE9hQ/zzPW95NHIaQ8ZcY0UV
 j9+sikDfI84w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,339,1583222400"; d="scan'208";a="262064529"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 01 May 2020 03:55:53 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jUTKi-000BNd-IQ; Fri, 01 May 2020 18:55:52 +0800
Date: Fri, 01 May 2020 18:55:29 +0800
From: kbuild test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/uaccess] BUILD REGRESSION
 5bb3b9d986426296507d3ef58d1e5fe4625de01f
Message-ID: <5eac0021./qRL9P+/uEr919DO%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  topic/uaccess
branch HEAD: 5bb3b9d986426296507d3ef58d1e5fe4625de01f  uaccess: Rename user_access_begin/end() to user_full_access_begin/end()

Error/Warning in current branch:

arch/x86/kernel/signal.c:312:7: error: implicit declaration of function 'user_access_begin'; did you mean 'user_access_end'? [-Werror=implicit-function-declaration]
arch/x86/kernel/signal.c:452:7: error: implicit declaration of function 'user_access_begin'; did you mean 'user_access_end'? [-Werror=implicit-function-declaration]
arch/x86/kernel/vm86_32.c:116:7: error: implicit declaration of function 'user_access_begin'; did you mean 'user_access_end'? [-Werror=implicit-function-declaration]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- i386-allyesconfig
|   |-- arch-x86-kernel-signal.c:error:implicit-declaration-of-function-user_access_begin
|   `-- arch-x86-kernel-vm86_32.c:error:implicit-declaration-of-function-user_access_begin
|-- i386-randconfig-f002-20200430
|   |-- arch-x86-kernel-signal.c:error:implicit-declaration-of-function-user_access_begin
|   `-- arch-x86-kernel-vm86_32.c:error:implicit-declaration-of-function-user_access_begin
|-- x86_64-allmodconfig
|   `-- arch-x86-kernel-signal.c:error:implicit-declaration-of-function-user_access_begin
`-- x86_64-allyesconfig
    `-- arch-x86-kernel-signal.c:error:implicit-declaration-of-function-user_access_begin

elapsed time: 486m

configs tested: 221
configs skipped: 0

arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm                              allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
sparc                            allyesconfig
ia64                        generic_defconfig
powerpc                             defconfig
ia64                                defconfig
mips                malta_kvm_guest_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                              allnoconfig
ia64                          tiger_defconfig
ia64                         bigsur_defconfig
ia64                             allyesconfig
ia64                             alldefconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
m68k                       bvme6000_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
c6x                              allyesconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
xtensa                          iss_defconfig
h8300                    h8300h-sim_defconfig
xtensa                       common_defconfig
arc                                 defconfig
arc                              allyesconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
mips                         tb0287_defconfig
mips                       capcella_defconfig
mips                           ip32_defconfig
mips                  decstation_64_defconfig
mips                      loongson3_defconfig
mips                          ath79_defconfig
mips                        bcm63xx_defconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                            ar7_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                      chrp32_defconfig
powerpc                       holly_defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
powerpc                           allnoconfig
powerpc                  mpc866_ads_defconfig
powerpc                    amigaone_defconfig
powerpc                    adder875_defconfig
powerpc                     ep8248e_defconfig
powerpc                          g5_defconfig
powerpc                     mpc512x_defconfig
m68k                 randconfig-a001-20200501
mips                 randconfig-a001-20200501
nds32                randconfig-a001-20200501
alpha                randconfig-a001-20200501
parisc               randconfig-a001-20200501
riscv                randconfig-a001-20200501
microblaze           randconfig-a001-20200430
nios2                randconfig-a001-20200430
h8300                randconfig-a001-20200430
c6x                  randconfig-a001-20200430
sparc64              randconfig-a001-20200430
s390                 randconfig-a001-20200430
xtensa               randconfig-a001-20200430
csky                 randconfig-a001-20200430
openrisc             randconfig-a001-20200430
sh                   randconfig-a001-20200430
s390                 randconfig-a001-20200501
xtensa               randconfig-a001-20200501
sh                   randconfig-a001-20200501
openrisc             randconfig-a001-20200501
csky                 randconfig-a001-20200501
i386                 randconfig-b001-20200430
i386                 randconfig-b002-20200430
x86_64               randconfig-b001-20200430
i386                 randconfig-b003-20200430
x86_64               randconfig-b002-20200430
x86_64               randconfig-b003-20200430
i386                 randconfig-b003-20200501
x86_64               randconfig-b002-20200501
i386                 randconfig-b001-20200501
x86_64               randconfig-b003-20200501
x86_64               randconfig-b001-20200501
i386                 randconfig-b002-20200501
x86_64               randconfig-c001-20200501
x86_64               randconfig-c002-20200501
i386                 randconfig-c002-20200501
x86_64               randconfig-c003-20200501
i386                 randconfig-c001-20200501
i386                 randconfig-c003-20200501
x86_64               randconfig-c001-20200430
i386                 randconfig-c001-20200430
i386                 randconfig-c002-20200430
x86_64               randconfig-c002-20200430
x86_64               randconfig-c003-20200430
i386                 randconfig-c003-20200430
x86_64               randconfig-d001-20200501
i386                 randconfig-d003-20200501
x86_64               randconfig-d003-20200501
i386                 randconfig-d001-20200501
x86_64               randconfig-d002-20200501
i386                 randconfig-d002-20200501
x86_64               randconfig-d002-20200430
x86_64               randconfig-d001-20200430
i386                 randconfig-d001-20200430
i386                 randconfig-d003-20200430
i386                 randconfig-d002-20200430
x86_64               randconfig-d003-20200430
x86_64               randconfig-e002-20200430
i386                 randconfig-e003-20200430
x86_64               randconfig-e003-20200430
i386                 randconfig-e002-20200430
x86_64               randconfig-e001-20200430
i386                 randconfig-e001-20200430
x86_64               randconfig-e002-20200501
x86_64               randconfig-e003-20200501
i386                 randconfig-e003-20200501
x86_64               randconfig-e001-20200501
i386                 randconfig-e002-20200501
i386                 randconfig-e001-20200501
x86_64               randconfig-f001-20200430
i386                 randconfig-f002-20200430
i386                 randconfig-f003-20200430
i386                 randconfig-f001-20200430
x86_64               randconfig-f003-20200430
i386                 randconfig-f003-20200501
x86_64               randconfig-f001-20200501
x86_64               randconfig-f003-20200501
i386                 randconfig-f001-20200501
i386                 randconfig-f002-20200501
i386                 randconfig-g003-20200501
i386                 randconfig-g002-20200501
x86_64               randconfig-g002-20200501
i386                 randconfig-g001-20200501
x86_64               randconfig-a003-20200501
x86_64               randconfig-a001-20200501
i386                 randconfig-a003-20200501
i386                 randconfig-a002-20200501
i386                 randconfig-a001-20200501
i386                 randconfig-h001-20200501
i386                 randconfig-h002-20200501
i386                 randconfig-h003-20200501
x86_64               randconfig-h001-20200501
x86_64               randconfig-h003-20200501
i386                 randconfig-h002-20200430
i386                 randconfig-h003-20200430
x86_64               randconfig-h001-20200430
x86_64               randconfig-h003-20200430
i386                 randconfig-h001-20200430
sparc                randconfig-a001-20200430
arc                  randconfig-a001-20200430
ia64                 randconfig-a001-20200430
powerpc              randconfig-a001-20200430
arm                  randconfig-a001-20200430
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                       zfcpdump_defconfig
s390                          debug_defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                             alldefconfig
s390                                defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
