Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D96CF157CB9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 14:48:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GS0v2PtLzDqDf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 00:48:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GRvK1h9hzDqL5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 00:43:35 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Feb 2020 05:43:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,425,1574150400"; d="scan'208";a="256134150"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 10 Feb 2020 05:43:30 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1j19LW-00076b-BZ; Mon, 10 Feb 2020 21:43:30 +0800
Date: Mon, 10 Feb 2020 21:42:39 +0800
From: kbuild test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS a5bc6e124219546a81ce334dc9b16483d55e9abf
Message-ID: <5e415dcf.HlhQgEP8ouu9mfaB%lkp@intel.com>
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
branch HEAD: a5bc6e124219546a81ce334dc9b16483d55e9abf  Automatic merge of branches 'master', 'next' and 'fixes' into merge

elapsed time: 2918m

configs tested: 177
configs skipped: 0

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
sh                               allmodconfig
riscv                               defconfig
arc                                 defconfig
nds32                               defconfig
um                                  defconfig
xtensa                       common_defconfig
s390                          debug_defconfig
sparc64                           allnoconfig
um                           x86_64_defconfig
m68k                       m5475evb_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
parisc                         b180_defconfig
i386                                defconfig
sparc                               defconfig
sh                          rsk7269_defconfig
sparc64                          allyesconfig
s390                             allyesconfig
ia64                                defconfig
powerpc                       ppc64_defconfig
nios2                         3c120_defconfig
sh                            titan_defconfig
sparc64                          allmodconfig
parisc                           allyesconfig
riscv                            allmodconfig
mips                      fuloong2e_defconfig
microblaze                    nommu_defconfig
m68k                          multi_defconfig
riscv                             allnoconfig
parisc                            allnoconfig
c6x                              allyesconfig
s390                                defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
ia64                             alldefconfig
ia64                              allnoconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                          iss_defconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                           sun3_defconfig
arc                              allyesconfig
microblaze                      mmu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      malta_kvm_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
x86_64               randconfig-a001-20200210
x86_64               randconfig-a002-20200210
x86_64               randconfig-a003-20200210
i386                 randconfig-a001-20200210
i386                 randconfig-a002-20200210
i386                 randconfig-a003-20200210
alpha                randconfig-a001-20200208
parisc               randconfig-a001-20200208
m68k                 randconfig-a001-20200208
nds32                randconfig-a001-20200208
mips                 randconfig-a001-20200208
riscv                randconfig-a001-20200208
c6x                  randconfig-a001-20200210
h8300                randconfig-a001-20200210
microblaze           randconfig-a001-20200210
nios2                randconfig-a001-20200210
sparc64              randconfig-a001-20200210
h8300                randconfig-a001-20200208
nios2                randconfig-a001-20200208
microblaze           randconfig-a001-20200208
sparc64              randconfig-a001-20200208
c6x                  randconfig-a001-20200208
x86_64               randconfig-b001-20200210
x86_64               randconfig-b002-20200210
x86_64               randconfig-b003-20200210
i386                 randconfig-b001-20200210
i386                 randconfig-b002-20200210
i386                 randconfig-b003-20200210
x86_64               randconfig-c001-20200210
x86_64               randconfig-c002-20200210
x86_64               randconfig-c003-20200210
i386                 randconfig-c001-20200210
i386                 randconfig-c002-20200210
i386                 randconfig-c003-20200210
x86_64               randconfig-c001-20200209
x86_64               randconfig-c002-20200209
x86_64               randconfig-c003-20200209
i386                 randconfig-c001-20200209
i386                 randconfig-c002-20200209
i386                 randconfig-c003-20200209
x86_64               randconfig-d001-20200210
x86_64               randconfig-d002-20200210
x86_64               randconfig-d003-20200210
i386                 randconfig-d001-20200210
i386                 randconfig-d002-20200210
i386                 randconfig-d003-20200210
x86_64               randconfig-e001-20200210
x86_64               randconfig-e002-20200210
x86_64               randconfig-e003-20200210
i386                 randconfig-e001-20200210
i386                 randconfig-e002-20200210
i386                 randconfig-e003-20200210
x86_64               randconfig-f001-20200210
x86_64               randconfig-f002-20200210
x86_64               randconfig-f003-20200210
i386                 randconfig-f001-20200210
i386                 randconfig-f002-20200210
i386                 randconfig-f003-20200210
i386                 randconfig-f002-20200208
i386                 randconfig-f003-20200208
x86_64               randconfig-f002-20200208
i386                 randconfig-f001-20200208
x86_64               randconfig-f001-20200208
x86_64               randconfig-f003-20200208
x86_64               randconfig-g001-20200210
x86_64               randconfig-g002-20200210
x86_64               randconfig-g003-20200210
i386                 randconfig-g001-20200210
i386                 randconfig-g002-20200210
i386                 randconfig-g003-20200210
x86_64               randconfig-h001-20200210
x86_64               randconfig-h002-20200210
x86_64               randconfig-h003-20200210
i386                 randconfig-h001-20200210
i386                 randconfig-h002-20200210
i386                 randconfig-h003-20200210
arc                  randconfig-a001-20200209
arm                  randconfig-a001-20200209
arm64                randconfig-a001-20200209
ia64                 randconfig-a001-20200209
powerpc              randconfig-a001-20200209
sparc                randconfig-a001-20200209
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                       zfcpdump_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc64                             defconfig
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
