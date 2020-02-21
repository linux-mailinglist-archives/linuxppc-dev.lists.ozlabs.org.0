Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD411681FD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 16:40:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PFz670TZzDqng
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2020 02:40:34 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PFxK4VdbzDqf2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2020 02:38:54 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 07:38:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,468,1574150400"; d="scan'208";a="435216458"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 21 Feb 2020 07:38:49 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1j5AO8-000At7-P3; Fri, 21 Feb 2020 23:38:48 +0800
Date: Fri, 21 Feb 2020 23:38:42 +0800
From: kbuild test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 65b2623f395a4e25ab3ff4cff1c9c7623619a22d
Message-ID: <5e4ff982.SXzAZHpwe9fgDemX%lkp@intel.com>
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
branch HEAD: 65b2623f395a4e25ab3ff4cff1c9c7623619a22d  Automatic merge of branches 'master', 'next' and 'fixes' into merge

elapsed time: 3027m

configs tested: 278
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
sparc                            allyesconfig
sparc                               defconfig
parisc                generic-64bit_defconfig
powerpc                             defconfig
sparc64                          allyesconfig
riscv                            allyesconfig
sh                            titan_defconfig
sparc64                             defconfig
h8300                    h8300h-sim_defconfig
nios2                         3c120_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
ia64                              allnoconfig
openrisc                 simple_smp_defconfig
alpha                               defconfig
m68k                           sun3_defconfig
sh                               allmodconfig
xtensa                          iss_defconfig
powerpc                           allnoconfig
s390                              allnoconfig
mips                      malta_kvm_defconfig
arc                                 defconfig
i386                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
openrisc                    or1ksim_defconfig
xtensa                       common_defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
arc                              allyesconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
x86_64               randconfig-a001-20200219
x86_64               randconfig-a002-20200219
x86_64               randconfig-a003-20200219
i386                 randconfig-a001-20200219
i386                 randconfig-a002-20200219
i386                 randconfig-a003-20200219
x86_64               randconfig-a001-20200220
x86_64               randconfig-a002-20200220
x86_64               randconfig-a003-20200220
i386                 randconfig-a001-20200220
i386                 randconfig-a002-20200220
i386                 randconfig-a003-20200220
x86_64               randconfig-a001-20200221
x86_64               randconfig-a002-20200221
x86_64               randconfig-a003-20200221
i386                 randconfig-a001-20200221
i386                 randconfig-a002-20200221
i386                 randconfig-a003-20200221
alpha                randconfig-a001-20200219
m68k                 randconfig-a001-20200219
nds32                randconfig-a001-20200219
parisc               randconfig-a001-20200219
riscv                randconfig-a001-20200219
alpha                randconfig-a001-20200220
m68k                 randconfig-a001-20200220
mips                 randconfig-a001-20200220
nds32                randconfig-a001-20200220
parisc               randconfig-a001-20200220
riscv                randconfig-a001-20200220
c6x                  randconfig-a001-20200221
h8300                randconfig-a001-20200221
microblaze           randconfig-a001-20200221
nios2                randconfig-a001-20200221
sparc64              randconfig-a001-20200221
c6x                  randconfig-a001-20200220
h8300                randconfig-a001-20200220
microblaze           randconfig-a001-20200220
nios2                randconfig-a001-20200220
sparc64              randconfig-a001-20200220
c6x                  randconfig-a001-20200219
h8300                randconfig-a001-20200219
microblaze           randconfig-a001-20200219
nios2                randconfig-a001-20200219
sparc64              randconfig-a001-20200219
csky                 randconfig-a001-20200219
openrisc             randconfig-a001-20200219
s390                 randconfig-a001-20200219
xtensa               randconfig-a001-20200219
csky                 randconfig-a001-20200220
openrisc             randconfig-a001-20200220
s390                 randconfig-a001-20200220
sh                   randconfig-a001-20200220
xtensa               randconfig-a001-20200220
csky                 randconfig-a001-20200221
openrisc             randconfig-a001-20200221
s390                 randconfig-a001-20200221
sh                   randconfig-a001-20200221
xtensa               randconfig-a001-20200221
x86_64               randconfig-b001-20200219
x86_64               randconfig-b002-20200219
x86_64               randconfig-b003-20200219
i386                 randconfig-b001-20200219
i386                 randconfig-b002-20200219
i386                 randconfig-b003-20200219
x86_64               randconfig-b001-20200220
x86_64               randconfig-b002-20200220
x86_64               randconfig-b003-20200220
i386                 randconfig-b001-20200220
i386                 randconfig-b002-20200220
i386                 randconfig-b003-20200220
x86_64               randconfig-c003-20200219
i386                 randconfig-c002-20200219
i386                 randconfig-c001-20200219
x86_64               randconfig-c002-20200219
x86_64               randconfig-c001-20200219
i386                 randconfig-c003-20200219
x86_64               randconfig-c001-20200220
x86_64               randconfig-c002-20200220
x86_64               randconfig-c003-20200220
i386                 randconfig-c001-20200220
i386                 randconfig-c002-20200220
i386                 randconfig-c003-20200220
x86_64               randconfig-c001-20200221
x86_64               randconfig-c002-20200221
x86_64               randconfig-c003-20200221
i386                 randconfig-c001-20200221
i386                 randconfig-c002-20200221
i386                 randconfig-c003-20200221
x86_64               randconfig-d001-20200220
x86_64               randconfig-d002-20200220
x86_64               randconfig-d003-20200220
i386                 randconfig-d001-20200220
i386                 randconfig-d002-20200220
i386                 randconfig-d003-20200220
x86_64               randconfig-d001-20200221
x86_64               randconfig-d002-20200221
x86_64               randconfig-d003-20200221
i386                 randconfig-d001-20200221
i386                 randconfig-d002-20200221
i386                 randconfig-d003-20200221
x86_64               randconfig-e001-20200220
x86_64               randconfig-e002-20200220
x86_64               randconfig-e003-20200220
i386                 randconfig-e001-20200220
i386                 randconfig-e002-20200220
i386                 randconfig-e003-20200220
x86_64               randconfig-e001-20200219
x86_64               randconfig-e002-20200219
x86_64               randconfig-e003-20200219
i386                 randconfig-e001-20200219
i386                 randconfig-e002-20200219
i386                 randconfig-e003-20200219
x86_64               randconfig-f001-20200220
x86_64               randconfig-f002-20200220
x86_64               randconfig-f003-20200220
i386                 randconfig-f001-20200220
i386                 randconfig-f002-20200220
i386                 randconfig-f003-20200220
x86_64               randconfig-f001-20200219
x86_64               randconfig-f002-20200219
x86_64               randconfig-f003-20200219
i386                 randconfig-f001-20200219
i386                 randconfig-f002-20200219
i386                 randconfig-f003-20200219
x86_64               randconfig-f001-20200221
x86_64               randconfig-f002-20200221
x86_64               randconfig-f003-20200221
i386                 randconfig-f001-20200221
i386                 randconfig-f002-20200221
i386                 randconfig-f003-20200221
x86_64               randconfig-g001-20200220
x86_64               randconfig-g002-20200220
x86_64               randconfig-g003-20200220
i386                 randconfig-g001-20200220
i386                 randconfig-g002-20200220
i386                 randconfig-g003-20200220
x86_64               randconfig-g001-20200219
x86_64               randconfig-g002-20200219
x86_64               randconfig-g003-20200219
i386                 randconfig-g001-20200219
i386                 randconfig-g002-20200219
i386                 randconfig-g003-20200219
x86_64               randconfig-g001-20200221
x86_64               randconfig-g002-20200221
x86_64               randconfig-g003-20200221
i386                 randconfig-g001-20200221
i386                 randconfig-g002-20200221
i386                 randconfig-g003-20200221
x86_64               randconfig-h001-20200219
x86_64               randconfig-h002-20200219
x86_64               randconfig-h003-20200219
i386                 randconfig-h001-20200219
i386                 randconfig-h002-20200219
i386                 randconfig-h003-20200219
x86_64               randconfig-h001-20200221
x86_64               randconfig-h002-20200221
x86_64               randconfig-h003-20200221
i386                 randconfig-h001-20200221
i386                 randconfig-h002-20200221
i386                 randconfig-h003-20200221
x86_64               randconfig-h001-20200220
x86_64               randconfig-h002-20200220
x86_64               randconfig-h003-20200220
i386                 randconfig-h001-20200220
i386                 randconfig-h002-20200220
i386                 randconfig-h003-20200220
arc                  randconfig-a001-20200219
arm                  randconfig-a001-20200219
arm64                randconfig-a001-20200219
ia64                 randconfig-a001-20200219
powerpc              randconfig-a001-20200219
sparc                randconfig-a001-20200219
arc                  randconfig-a001-20200220
arm                  randconfig-a001-20200220
arm64                randconfig-a001-20200220
ia64                 randconfig-a001-20200220
powerpc              randconfig-a001-20200220
sparc                randconfig-a001-20200220
arc                  randconfig-a001-20200221
arm                  randconfig-a001-20200221
arm64                randconfig-a001-20200221
ia64                 randconfig-a001-20200221
powerpc              randconfig-a001-20200221
sparc                randconfig-a001-20200221
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
