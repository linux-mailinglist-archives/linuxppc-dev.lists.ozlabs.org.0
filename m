Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A33175E26
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 16:26:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WP9y3KBJzDqcm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 02:26:14 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WP7g20lYzDqWJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 02:24:08 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 07:24:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,507,1574150400"; d="scan'208";a="233401558"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 02 Mar 2020 07:24:04 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1j8mvL-000GeM-VX; Mon, 02 Mar 2020 23:24:03 +0800
Date: Mon, 02 Mar 2020 23:23:17 +0800
From: kbuild test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 cb0cc635c7a9fa8a3a0f75d4d896721819c63add
Message-ID: <5e5d24e5.RNNQ/ybeAvVkGODl%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  fixes-test
branch HEAD: cb0cc635c7a9fa8a3a0f75d4d896721819c63add  powerpc: Include .BTF section

elapsed time: 4704m

configs tested: 350
configs skipped: 154

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
mips                      fuloong2e_defconfig
i386                             allyesconfig
ia64                                defconfig
powerpc                             defconfig
i386                              allnoconfig
powerpc                       ppc64_defconfig
openrisc                    or1ksim_defconfig
xtensa                       common_defconfig
ia64                             alldefconfig
h8300                     edosk2674_defconfig
s390                              allnoconfig
sparc                               defconfig
nds32                             allnoconfig
s390                             alldefconfig
s390                       zfcpdump_defconfig
mips                              allnoconfig
mips                             allmodconfig
s390                             allmodconfig
arc                              allyesconfig
mips                      malta_kvm_defconfig
m68k                           sun3_defconfig
xtensa                          iss_defconfig
i386                             alldefconfig
ia64                              allnoconfig
h8300                       h8s-sim_defconfig
m68k                       m5475evb_defconfig
nios2                         3c120_defconfig
m68k                          multi_defconfig
powerpc                           allnoconfig
sparc64                           allnoconfig
openrisc                 simple_smp_defconfig
sh                                allnoconfig
s390                                defconfig
alpha                               defconfig
parisc                            allnoconfig
i386                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
h8300                    h8300h-sim_defconfig
m68k                             allmodconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allyesconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200228
x86_64               randconfig-a002-20200228
x86_64               randconfig-a003-20200228
i386                 randconfig-a001-20200228
i386                 randconfig-a002-20200228
i386                 randconfig-a003-20200228
x86_64               randconfig-a001-20200229
x86_64               randconfig-a002-20200229
x86_64               randconfig-a003-20200229
i386                 randconfig-a001-20200229
i386                 randconfig-a002-20200229
i386                 randconfig-a003-20200229
x86_64               randconfig-a001-20200301
x86_64               randconfig-a002-20200301
x86_64               randconfig-a003-20200301
i386                 randconfig-a001-20200301
i386                 randconfig-a002-20200301
i386                 randconfig-a003-20200301
x86_64               randconfig-a001-20200302
x86_64               randconfig-a002-20200302
x86_64               randconfig-a003-20200302
i386                 randconfig-a001-20200302
i386                 randconfig-a002-20200302
i386                 randconfig-a003-20200302
alpha                randconfig-a001-20200228
m68k                 randconfig-a001-20200228
mips                 randconfig-a001-20200228
nds32                randconfig-a001-20200228
parisc               randconfig-a001-20200228
riscv                randconfig-a001-20200228
alpha                randconfig-a001-20200302
parisc               randconfig-a001-20200302
alpha                randconfig-a001-20200229
m68k                 randconfig-a001-20200229
nds32                randconfig-a001-20200229
parisc               randconfig-a001-20200229
riscv                randconfig-a001-20200229
m68k                 randconfig-a001-20200302
mips                 randconfig-a001-20200302
nds32                randconfig-a001-20200302
riscv                randconfig-a001-20200302
c6x                  randconfig-a001-20200229
h8300                randconfig-a001-20200229
microblaze           randconfig-a001-20200229
nios2                randconfig-a001-20200229
sparc64              randconfig-a001-20200229
c6x                  randconfig-a001-20200228
h8300                randconfig-a001-20200228
microblaze           randconfig-a001-20200228
nios2                randconfig-a001-20200228
sparc64              randconfig-a001-20200228
c6x                  randconfig-a001-20200302
microblaze           randconfig-a001-20200302
csky                 randconfig-a001-20200228
openrisc             randconfig-a001-20200228
s390                 randconfig-a001-20200228
sh                   randconfig-a001-20200228
xtensa               randconfig-a001-20200228
csky                 randconfig-a001-20200302
s390                 randconfig-a001-20200302
sh                   randconfig-a001-20200302
csky                 randconfig-a001-20200229
openrisc             randconfig-a001-20200229
s390                 randconfig-a001-20200229
xtensa               randconfig-a001-20200229
xtensa               randconfig-a001-20200302
x86_64               randconfig-b001-20200228
x86_64               randconfig-b002-20200228
x86_64               randconfig-b003-20200228
i386                 randconfig-b001-20200228
i386                 randconfig-b002-20200228
i386                 randconfig-b003-20200228
x86_64               randconfig-b001-20200301
x86_64               randconfig-b002-20200301
x86_64               randconfig-b003-20200301
i386                 randconfig-b001-20200301
i386                 randconfig-b002-20200301
i386                 randconfig-b003-20200301
x86_64               randconfig-b001-20200229
x86_64               randconfig-b002-20200229
x86_64               randconfig-b003-20200229
i386                 randconfig-b001-20200229
i386                 randconfig-b002-20200229
i386                 randconfig-b003-20200229
x86_64               randconfig-b001-20200302
x86_64               randconfig-b002-20200302
x86_64               randconfig-b003-20200302
i386                 randconfig-b001-20200302
i386                 randconfig-b002-20200302
i386                 randconfig-b003-20200302
x86_64               randconfig-c001-20200228
x86_64               randconfig-c002-20200228
x86_64               randconfig-c003-20200228
i386                 randconfig-c001-20200228
i386                 randconfig-c002-20200228
i386                 randconfig-c003-20200228
x86_64               randconfig-c001-20200301
x86_64               randconfig-c002-20200301
x86_64               randconfig-c003-20200301
i386                 randconfig-c001-20200301
i386                 randconfig-c002-20200301
i386                 randconfig-c003-20200301
x86_64               randconfig-c001-20200229
x86_64               randconfig-c002-20200229
x86_64               randconfig-c003-20200229
i386                 randconfig-c001-20200229
i386                 randconfig-c002-20200229
i386                 randconfig-c003-20200229
x86_64               randconfig-c001-20200302
x86_64               randconfig-c002-20200302
x86_64               randconfig-c003-20200302
i386                 randconfig-c001-20200302
i386                 randconfig-c002-20200302
i386                 randconfig-c003-20200302
x86_64               randconfig-d001-20200228
x86_64               randconfig-d002-20200228
x86_64               randconfig-d003-20200228
i386                 randconfig-d001-20200228
i386                 randconfig-d002-20200228
i386                 randconfig-d003-20200228
x86_64               randconfig-d001-20200301
x86_64               randconfig-d002-20200301
x86_64               randconfig-d003-20200301
i386                 randconfig-d001-20200301
i386                 randconfig-d002-20200301
i386                 randconfig-d003-20200301
x86_64               randconfig-d001-20200229
x86_64               randconfig-d002-20200229
x86_64               randconfig-d003-20200229
i386                 randconfig-d001-20200229
i386                 randconfig-d002-20200229
i386                 randconfig-d003-20200229
x86_64               randconfig-d001-20200302
x86_64               randconfig-d002-20200302
x86_64               randconfig-d003-20200302
i386                 randconfig-d001-20200302
i386                 randconfig-d002-20200302
i386                 randconfig-d003-20200302
x86_64               randconfig-e001-20200301
x86_64               randconfig-e002-20200301
x86_64               randconfig-e003-20200301
i386                 randconfig-e001-20200301
i386                 randconfig-e002-20200301
i386                 randconfig-e003-20200301
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
x86_64               randconfig-e001-20200302
x86_64               randconfig-e002-20200302
x86_64               randconfig-e003-20200302
i386                 randconfig-e003-20200302
i386                 randconfig-e001-20200302
i386                 randconfig-e002-20200302
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
x86_64               randconfig-f001-20200301
x86_64               randconfig-f002-20200301
x86_64               randconfig-f003-20200301
i386                 randconfig-f001-20200301
i386                 randconfig-f002-20200301
i386                 randconfig-f003-20200301
x86_64               randconfig-f001-20200302
x86_64               randconfig-f002-20200302
x86_64               randconfig-f003-20200302
i386                 randconfig-f001-20200302
i386                 randconfig-f002-20200302
i386                 randconfig-f003-20200302
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
i386                 randconfig-g002-20200302
i386                 randconfig-g003-20200302
x86_64               randconfig-g001-20200302
x86_64               randconfig-g002-20200302
x86_64               randconfig-g003-20200302
i386                 randconfig-g001-20200302
x86_64               randconfig-g001-20200301
x86_64               randconfig-g002-20200301
x86_64               randconfig-g003-20200301
i386                 randconfig-g001-20200301
i386                 randconfig-g002-20200301
i386                 randconfig-g003-20200301
x86_64               randconfig-h001-20200228
x86_64               randconfig-h002-20200228
x86_64               randconfig-h003-20200228
i386                 randconfig-h001-20200228
i386                 randconfig-h002-20200228
i386                 randconfig-h003-20200228
x86_64               randconfig-h001-20200301
x86_64               randconfig-h002-20200301
x86_64               randconfig-h003-20200301
i386                 randconfig-h001-20200301
i386                 randconfig-h002-20200301
i386                 randconfig-h003-20200301
x86_64               randconfig-h001-20200302
x86_64               randconfig-h002-20200302
x86_64               randconfig-h003-20200302
i386                 randconfig-h001-20200302
i386                 randconfig-h002-20200302
i386                 randconfig-h003-20200302
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
arc                  randconfig-a001-20200301
arm                  randconfig-a001-20200301
arm64                randconfig-a001-20200301
ia64                 randconfig-a001-20200301
powerpc              randconfig-a001-20200301
sparc                randconfig-a001-20200301
arm64                randconfig-a001-20200302
ia64                 randconfig-a001-20200302
powerpc              randconfig-a001-20200302
arc                  randconfig-a001-20200302
arm                  randconfig-a001-20200302
sparc                randconfig-a001-20200302
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             allyesconfig
s390                          debug_defconfig
sh                               allmodconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc64                          allmodconfig
sparc64                          allyesconfig
sparc64                             defconfig
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
