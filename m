Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F1D179F83
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 06:47:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Y0Bn2RpLzDqFC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 16:47:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Y0704TgTzDqpd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 16:44:05 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 21:44:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,516,1574150400"; d="scan'208";a="234349102"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 04 Mar 2020 21:44:00 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1j9jIc-0004Q7-WE; Thu, 05 Mar 2020 13:43:58 +0800
Date: Thu, 05 Mar 2020 13:43:31 +0800
From: kbuild test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS e3a1ab299346a9a415f334e91a78da7ea84aa5a2
Message-ID: <5e609183.C9xKONsUgN8f3N58%lkp@intel.com>
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
branch HEAD: e3a1ab299346a9a415f334e91a78da7ea84aa5a2  Automatic merge of branches 'master', 'next' and 'fixes' into merge

elapsed time: 8443m

configs tested: 232
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
arc                                 defconfig
riscv                               defconfig
i386                             allyesconfig
h8300                     edosk2674_defconfig
parisc                generic-32bit_defconfig
openrisc                    or1ksim_defconfig
mips                      fuloong2e_defconfig
riscv                          rv32_defconfig
ia64                                defconfig
riscv                    nommu_virt_defconfig
xtensa                       common_defconfig
ia64                             alldefconfig
sh                          rsk7269_defconfig
sparc64                          allyesconfig
um                           x86_64_defconfig
powerpc                             defconfig
microblaze                    nommu_defconfig
s390                       zfcpdump_defconfig
mips                              allnoconfig
nds32                             allnoconfig
s390                             allmodconfig
mips                             allmodconfig
sh                            titan_defconfig
nios2                         3c120_defconfig
mips                      malta_kvm_defconfig
ia64                              allnoconfig
h8300                       h8s-sim_defconfig
xtensa                          iss_defconfig
powerpc                           allnoconfig
openrisc                 simple_smp_defconfig
sh                                allnoconfig
i386                              allnoconfig
s390                              allnoconfig
parisc                            allnoconfig
i386                             alldefconfig
i386                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
alpha                               defconfig
csky                                defconfig
nds32                               defconfig
h8300                    h8300h-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
microblaze                      mmu_defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allyesconfig
parisc                           allyesconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200228
x86_64               randconfig-a002-20200228
x86_64               randconfig-a003-20200228
i386                 randconfig-a001-20200228
i386                 randconfig-a002-20200228
i386                 randconfig-a003-20200228
alpha                randconfig-a001-20200228
m68k                 randconfig-a001-20200228
mips                 randconfig-a001-20200228
nds32                randconfig-a001-20200228
parisc               randconfig-a001-20200228
riscv                randconfig-a001-20200228
alpha                randconfig-a001-20200229
m68k                 randconfig-a001-20200229
nds32                randconfig-a001-20200229
parisc               randconfig-a001-20200229
riscv                randconfig-a001-20200229
nios2                randconfig-a001-20200228
c6x                  randconfig-a001-20200228
sparc64              randconfig-a001-20200228
h8300                randconfig-a001-20200228
c6x                  randconfig-a001-20200229
h8300                randconfig-a001-20200229
microblaze           randconfig-a001-20200229
nios2                randconfig-a001-20200229
sparc64              randconfig-a001-20200229
microblaze           randconfig-a001-20200228
csky                 randconfig-a001-20200228
openrisc             randconfig-a001-20200228
s390                 randconfig-a001-20200228
sh                   randconfig-a001-20200228
xtensa               randconfig-a001-20200228
csky                 randconfig-a001-20200229
openrisc             randconfig-a001-20200229
s390                 randconfig-a001-20200229
xtensa               randconfig-a001-20200229
x86_64               randconfig-b001-20200228
x86_64               randconfig-b002-20200228
x86_64               randconfig-b003-20200228
i386                 randconfig-b001-20200228
i386                 randconfig-b002-20200228
i386                 randconfig-b003-20200228
x86_64               randconfig-b001-20200229
x86_64               randconfig-b002-20200229
x86_64               randconfig-b003-20200229
i386                 randconfig-b001-20200229
i386                 randconfig-b002-20200229
i386                 randconfig-b003-20200229
x86_64               randconfig-c001-20200228
x86_64               randconfig-c002-20200228
x86_64               randconfig-c003-20200228
i386                 randconfig-c001-20200228
i386                 randconfig-c002-20200228
i386                 randconfig-c003-20200228
x86_64               randconfig-c001-20200229
x86_64               randconfig-c002-20200229
x86_64               randconfig-c003-20200229
i386                 randconfig-c001-20200229
i386                 randconfig-c002-20200229
i386                 randconfig-c003-20200229
x86_64               randconfig-d001-20200229
x86_64               randconfig-d002-20200229
x86_64               randconfig-d003-20200229
i386                 randconfig-d001-20200229
i386                 randconfig-d002-20200229
i386                 randconfig-d003-20200229
x86_64               randconfig-d001-20200228
x86_64               randconfig-d002-20200228
x86_64               randconfig-d003-20200228
i386                 randconfig-d001-20200228
i386                 randconfig-d002-20200228
i386                 randconfig-d003-20200228
x86_64               randconfig-e001-20200228
x86_64               randconfig-e002-20200228
x86_64               randconfig-e003-20200228
i386                 randconfig-e001-20200228
i386                 randconfig-e002-20200228
i386                 randconfig-e003-20200228
x86_64               randconfig-e001-20200229
x86_64               randconfig-e002-20200229
x86_64               randconfig-e003-20200229
i386                 randconfig-e001-20200229
i386                 randconfig-e002-20200229
i386                 randconfig-e003-20200229
x86_64               randconfig-e001-20200301
x86_64               randconfig-e002-20200301
x86_64               randconfig-e003-20200301
i386                 randconfig-e001-20200301
i386                 randconfig-e002-20200301
i386                 randconfig-e003-20200301
x86_64               randconfig-f001-20200228
x86_64               randconfig-f002-20200228
x86_64               randconfig-f003-20200228
i386                 randconfig-f001-20200228
i386                 randconfig-f002-20200228
i386                 randconfig-f003-20200228
x86_64               randconfig-f001-20200229
x86_64               randconfig-f002-20200229
x86_64               randconfig-f003-20200229
i386                 randconfig-f001-20200229
i386                 randconfig-f002-20200229
i386                 randconfig-f003-20200229
x86_64               randconfig-g001-20200228
x86_64               randconfig-g002-20200228
x86_64               randconfig-g003-20200228
i386                 randconfig-g001-20200228
i386                 randconfig-g002-20200228
i386                 randconfig-g003-20200228
x86_64               randconfig-g001-20200229
x86_64               randconfig-g002-20200229
x86_64               randconfig-g003-20200229
i386                 randconfig-g001-20200229
i386                 randconfig-g002-20200229
i386                 randconfig-g003-20200229
x86_64               randconfig-h001-20200228
x86_64               randconfig-h002-20200228
x86_64               randconfig-h003-20200228
i386                 randconfig-h001-20200228
i386                 randconfig-h002-20200228
i386                 randconfig-h003-20200228
x86_64               randconfig-h001-20200229
x86_64               randconfig-h002-20200229
x86_64               randconfig-h003-20200229
i386                 randconfig-h001-20200229
i386                 randconfig-h002-20200229
i386                 randconfig-h003-20200229
arc                  randconfig-a001-20200228
arm                  randconfig-a001-20200228
arm64                randconfig-a001-20200228
ia64                 randconfig-a001-20200228
powerpc              randconfig-a001-20200228
sparc                randconfig-a001-20200228
arc                  randconfig-a001-20200229
arm                  randconfig-a001-20200229
arm64                randconfig-a001-20200229
ia64                 randconfig-a001-20200229
powerpc              randconfig-a001-20200229
sparc                randconfig-a001-20200229
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
s390                             alldefconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
sh                               allmodconfig
sh                  sh7785lcr_32bit_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                             defconfig
um                                  defconfig
um                             i386_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
