Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9D619BB3A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 06:58:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t9mm1yy1zDrNm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 15:58:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48t9l738hzzDqht
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 15:56:34 +1100 (AEDT)
IronPort-SDR: I/wWk38vdUy4QF3fj3ch1TyHxPELEjzHSDvEZn5vAt9Hw38P4a0PpmGsV0ZET91txJZfFv/O1+
 JKp6lIuGUaOQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2020 21:56:32 -0700
IronPort-SDR: ETEyw3Ed3XqWZL0acnvbYdN8jn7jE33/npx1fMR1A769Rd1JY80tbFi029NNw0X42EvmBX6mkD
 4VUqjQZIY4FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,334,1580803200"; d="scan'208";a="284648055"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 01 Apr 2020 21:56:30 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jJru2-00088j-2f; Thu, 02 Apr 2020 12:56:30 +0800
Date: Thu, 02 Apr 2020 12:56:07 +0800
From: kbuild test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS d0c12846a3a24cd6d68b608c866712bc7e471634
Message-ID: <5e857067.0olXLgpLQjG+Ij/q%lkp@intel.com>
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
branch HEAD: d0c12846a3a24cd6d68b608c866712bc7e471634  Automatic merge of branch 'next' into merge

elapsed time: 879m

configs tested: 176
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
riscv                    nommu_virt_defconfig
ia64                                defconfig
powerpc                             defconfig
c6x                              allyesconfig
powerpc                       ppc64_defconfig
sparc64                             defconfig
s390                              allnoconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                             alldefconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                          rhel-kconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200401
x86_64               randconfig-a002-20200401
x86_64               randconfig-a003-20200401
i386                 randconfig-a001-20200401
i386                 randconfig-a002-20200401
i386                 randconfig-a003-20200401
alpha                randconfig-a001-20200401
m68k                 randconfig-a001-20200401
mips                 randconfig-a001-20200401
nds32                randconfig-a001-20200401
parisc               randconfig-a001-20200401
riscv                randconfig-a001-20200401
mips                 randconfig-a001-20200402
c6x                  randconfig-a001-20200401
h8300                randconfig-a001-20200401
microblaze           randconfig-a001-20200401
nios2                randconfig-a001-20200401
sparc64              randconfig-a001-20200401
c6x                  randconfig-a001-20200402
h8300                randconfig-a001-20200402
microblaze           randconfig-a001-20200402
nios2                randconfig-a001-20200402
sparc64              randconfig-a001-20200402
csky                 randconfig-a001-20200401
openrisc             randconfig-a001-20200401
s390                 randconfig-a001-20200401
sh                   randconfig-a001-20200401
xtensa               randconfig-a001-20200401
x86_64               randconfig-b001-20200402
x86_64               randconfig-b002-20200402
x86_64               randconfig-b003-20200402
i386                 randconfig-b001-20200402
i386                 randconfig-b002-20200402
i386                 randconfig-b003-20200402
x86_64               randconfig-b001-20200401
x86_64               randconfig-b002-20200401
x86_64               randconfig-b003-20200401
i386                 randconfig-b001-20200401
i386                 randconfig-b002-20200401
i386                 randconfig-b003-20200401
x86_64               randconfig-c001-20200401
x86_64               randconfig-c002-20200401
x86_64               randconfig-c003-20200401
i386                 randconfig-c001-20200401
i386                 randconfig-c002-20200401
i386                 randconfig-c003-20200401
x86_64               randconfig-d001-20200401
x86_64               randconfig-d002-20200401
x86_64               randconfig-d003-20200401
i386                 randconfig-d001-20200401
i386                 randconfig-d002-20200401
i386                 randconfig-d003-20200401
x86_64               randconfig-e001-20200401
x86_64               randconfig-e002-20200401
x86_64               randconfig-e003-20200401
i386                 randconfig-e001-20200401
i386                 randconfig-e002-20200401
i386                 randconfig-e003-20200401
i386                 randconfig-f001-20200402
i386                 randconfig-f003-20200402
x86_64               randconfig-f003-20200402
x86_64               randconfig-f001-20200402
i386                 randconfig-f002-20200402
x86_64               randconfig-f002-20200402
x86_64               randconfig-h001-20200401
x86_64               randconfig-h002-20200401
x86_64               randconfig-h003-20200401
i386                 randconfig-h001-20200401
i386                 randconfig-h002-20200401
i386                 randconfig-h003-20200401
arc                  randconfig-a001-20200402
arm                  randconfig-a001-20200402
arm64                randconfig-a001-20200402
ia64                 randconfig-a001-20200402
powerpc              randconfig-a001-20200402
sparc                randconfig-a001-20200402
arm64                randconfig-a001-20200401
sparc                randconfig-a001-20200401
ia64                 randconfig-a001-20200401
arc                  randconfig-a001-20200401
powerpc              randconfig-a001-20200401
arm                  randconfig-a001-20200401
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                             alldefconfig
s390                             allmodconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
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
