Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2401548FF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 17:22:18 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48D3c7271bzDqbC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 03:22:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48D3ZL5TbRzDqYb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 03:20:37 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Feb 2020 08:20:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,410,1574150400"; d="scan'208";a="404532981"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 06 Feb 2020 08:20:32 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1izjtI-00087Z-6h; Fri, 07 Feb 2020 00:20:32 +0800
Date: Fri, 07 Feb 2020 00:20:26 +0800
From: kbuild test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 530a1cfd52af0aba1af4b1c9a7bc66a202a459b1
Message-ID: <5e3c3cca.Rca1igd9wNNxlsd5%lkp@intel.com>
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
branch HEAD: 530a1cfd52af0aba1af4b1c9a7bc66a202a459b1  Automatic merge of branches 'master', 'next' and 'fixes' into merge

elapsed time: 3124m

configs tested: 279
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm64                               defconfig
sparc                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
sparc64                             defconfig
um                                  defconfig
nds32                               defconfig
sh                          rsk7269_defconfig
sparc64                          allmodconfig
i386                              allnoconfig
h8300                    h8300h-sim_defconfig
sparc                               defconfig
alpha                               defconfig
parisc                              defconfig
h8300                       h8s-sim_defconfig
um                             i386_defconfig
arc                                 defconfig
parisc                            allnoconfig
um                           x86_64_defconfig
microblaze                    nommu_defconfig
microblaze                      mmu_defconfig
s390                                defconfig
riscv                             allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
csky                                defconfig
nds32                             allnoconfig
h8300                     edosk2674_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allyesonfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
x86_64               randconfig-a001-20200206
x86_64               randconfig-a002-20200206
x86_64               randconfig-a003-20200206
i386                 randconfig-a001-20200206
i386                 randconfig-a002-20200206
i386                 randconfig-a003-20200206
x86_64               randconfig-a001-20200204
x86_64               randconfig-a002-20200204
x86_64               randconfig-a003-20200204
i386                 randconfig-a001-20200204
i386                 randconfig-a002-20200204
i386                 randconfig-a003-20200204
alpha                randconfig-a001-20200206
m68k                 randconfig-a001-20200206
mips                 randconfig-a001-20200206
nds32                randconfig-a001-20200206
parisc               randconfig-a001-20200206
riscv                randconfig-a001-20200206
alpha                randconfig-a001-20200204
m68k                 randconfig-a001-20200204
mips                 randconfig-a001-20200204
nds32                randconfig-a001-20200204
parisc               randconfig-a001-20200204
riscv                randconfig-a001-20200204
c6x                  randconfig-a001-20200206
h8300                randconfig-a001-20200206
microblaze           randconfig-a001-20200206
nios2                randconfig-a001-20200206
sparc64              randconfig-a001-20200206
c6x                  randconfig-a001-20200205
h8300                randconfig-a001-20200205
microblaze           randconfig-a001-20200205
nios2                randconfig-a001-20200205
sparc64              randconfig-a001-20200205
c6x                  randconfig-a001-20200204
h8300                randconfig-a001-20200204
microblaze           randconfig-a001-20200204
nios2                randconfig-a001-20200204
sparc64              randconfig-a001-20200204
csky                 randconfig-a001-20200205
openrisc             randconfig-a001-20200205
s390                 randconfig-a001-20200205
sh                   randconfig-a001-20200205
xtensa               randconfig-a001-20200205
csky                 randconfig-a001-20200204
openrisc             randconfig-a001-20200204
s390                 randconfig-a001-20200204
sh                   randconfig-a001-20200204
xtensa               randconfig-a001-20200204
csky                 randconfig-a001-20200206
openrisc             randconfig-a001-20200206
s390                 randconfig-a001-20200206
sh                   randconfig-a001-20200206
xtensa               randconfig-a001-20200206
x86_64               randconfig-b001-20200206
x86_64               randconfig-b002-20200206
x86_64               randconfig-b003-20200206
i386                 randconfig-b001-20200206
i386                 randconfig-b002-20200206
i386                 randconfig-b003-20200206
x86_64               randconfig-b001-20200205
x86_64               randconfig-b002-20200205
x86_64               randconfig-b003-20200205
i386                 randconfig-b001-20200205
i386                 randconfig-b002-20200205
i386                 randconfig-b003-20200205
i386                 randconfig-b001-20200204
i386                 randconfig-b002-20200204
x86_64               randconfig-b002-20200204
x86_64               randconfig-b001-20200204
i386                 randconfig-b003-20200204
x86_64               randconfig-b003-20200204
x86_64               randconfig-c001-20200204
x86_64               randconfig-c002-20200204
x86_64               randconfig-c003-20200204
i386                 randconfig-c001-20200204
i386                 randconfig-c002-20200204
i386                 randconfig-c003-20200204
x86_64               randconfig-c001-20200205
x86_64               randconfig-c002-20200205
x86_64               randconfig-c003-20200205
i386                 randconfig-c001-20200205
i386                 randconfig-c002-20200205
i386                 randconfig-c003-20200205
x86_64               randconfig-d001-20200204
x86_64               randconfig-d002-20200204
x86_64               randconfig-d003-20200204
i386                 randconfig-d001-20200204
i386                 randconfig-d002-20200204
i386                 randconfig-d003-20200204
x86_64               randconfig-d001-20200205
x86_64               randconfig-d002-20200205
x86_64               randconfig-d003-20200205
i386                 randconfig-d001-20200205
i386                 randconfig-d002-20200205
i386                 randconfig-d003-20200205
x86_64               randconfig-d001-20200206
x86_64               randconfig-d002-20200206
x86_64               randconfig-d003-20200206
i386                 randconfig-d001-20200206
i386                 randconfig-d002-20200206
i386                 randconfig-d003-20200206
x86_64               randconfig-e001-20200206
x86_64               randconfig-e002-20200206
x86_64               randconfig-e003-20200206
i386                 randconfig-e001-20200206
i386                 randconfig-e002-20200206
i386                 randconfig-e003-20200206
x86_64               randconfig-e001-20200204
x86_64               randconfig-e002-20200204
x86_64               randconfig-e003-20200204
i386                 randconfig-e001-20200204
i386                 randconfig-e002-20200204
i386                 randconfig-e003-20200204
i386                 randconfig-f002-20200204
i386                 randconfig-f003-20200204
x86_64               randconfig-f002-20200204
i386                 randconfig-f001-20200204
x86_64               randconfig-f001-20200204
x86_64               randconfig-f003-20200204
x86_64               randconfig-f001-20200205
x86_64               randconfig-f002-20200205
x86_64               randconfig-f003-20200205
i386                 randconfig-f001-20200205
i386                 randconfig-f002-20200205
i386                 randconfig-f003-20200205
x86_64               randconfig-f001-20200206
x86_64               randconfig-f002-20200206
x86_64               randconfig-f003-20200206
i386                 randconfig-f001-20200206
i386                 randconfig-f002-20200206
i386                 randconfig-f003-20200206
x86_64               randconfig-g001-20200205
x86_64               randconfig-g002-20200205
x86_64               randconfig-g003-20200205
i386                 randconfig-g001-20200205
i386                 randconfig-g002-20200205
i386                 randconfig-g003-20200205
x86_64               randconfig-g001-20200204
x86_64               randconfig-g002-20200204
x86_64               randconfig-g003-20200204
i386                 randconfig-g001-20200204
i386                 randconfig-g002-20200204
i386                 randconfig-g003-20200204
x86_64               randconfig-g001-20200206
x86_64               randconfig-g002-20200206
x86_64               randconfig-g003-20200206
i386                 randconfig-g001-20200206
i386                 randconfig-g002-20200206
i386                 randconfig-g003-20200206
x86_64               randconfig-h001-20200206
x86_64               randconfig-h002-20200206
x86_64               randconfig-h003-20200206
i386                 randconfig-h001-20200206
i386                 randconfig-h002-20200206
i386                 randconfig-h003-20200206
x86_64               randconfig-h001-20200204
x86_64               randconfig-h002-20200204
x86_64               randconfig-h003-20200204
i386                 randconfig-h001-20200204
i386                 randconfig-h002-20200204
i386                 randconfig-h003-20200204
x86_64               randconfig-h001-20200205
x86_64               randconfig-h002-20200205
x86_64               randconfig-h003-20200205
i386                 randconfig-h001-20200205
i386                 randconfig-h002-20200205
i386                 randconfig-h003-20200205
arc                  randconfig-a001-20200204
arm                  randconfig-a001-20200204
arm64                randconfig-a001-20200204
ia64                 randconfig-a001-20200204
powerpc              randconfig-a001-20200204
sparc                randconfig-a001-20200204
arm                  randconfig-a001-20200205
arm64                randconfig-a001-20200205
ia64                 randconfig-a001-20200205
powerpc              randconfig-a001-20200205
arc                  randconfig-a001-20200206
arm                  randconfig-a001-20200206
arm64                randconfig-a001-20200206
ia64                 randconfig-a001-20200206
powerpc              randconfig-a001-20200206
sparc                randconfig-a001-20200206
riscv                            allmodconfig
riscv                            allyesconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
