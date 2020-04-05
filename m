Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B615A19EE8E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 01:27:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wVFd6yHCzDqjV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 09:27:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wVCN0vbPzDqhb
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 09:25:35 +1000 (AEST)
IronPort-SDR: 1zQatsxJM+jugcI+Hd9WR9iQwyz9FL6j/boqFTLF5W4E0aqTw35w7qXdS68h1qYw7gNN364gWW
 BYbEZmK+r2sA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2020 16:25:34 -0700
IronPort-SDR: YQZH3YzIdGjlJzOiEPz7iVcBHExSnA5BDKg7nGCClDJzQWNgGPhb+/RcS/9VMjVWjMGH9j7aVa
 iUbu/LKBgSAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,349,1580803200"; d="scan'208";a="268911809"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 05 Apr 2020 16:25:32 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jLEdw-000ALY-5W; Mon, 06 Apr 2020 07:25:32 +0800
Date: Mon, 06 Apr 2020 07:24:36 +0800
From: kbuild test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS 6ba4a2d3591039aea1cb45c7c42262d26351a2fa
Message-ID: <5e8a68b4.+QhDCJQqWo5F10Mz%lkp@intel.com>
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
branch HEAD: 6ba4a2d3591039aea1cb45c7c42262d26351a2fa  selftests/powerpc: Always build the tm-poison test 64-bit

elapsed time: 627m

configs tested: 179
configs skipped: 27

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                              allmodconfig
arm64                            allmodconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
sparc                            allyesconfig
microblaze                      mmu_defconfig
mips                             allmodconfig
parisc                            allnoconfig
s390                              allnoconfig
microblaze                    nommu_defconfig
s390                       zfcpdump_defconfig
powerpc                             defconfig
riscv                            allyesconfig
c6x                              allyesconfig
nds32                             allnoconfig
mips                      fuloong2e_defconfig
parisc                generic-64bit_defconfig
powerpc                       ppc64_defconfig
sparc                               defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                              debian-10.3
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arc                              allyesconfig
arc                                 defconfig
powerpc                           allnoconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      malta_kvm_defconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
i386                 randconfig-a003-20200405
x86_64               randconfig-a001-20200405
x86_64               randconfig-a002-20200405
x86_64               randconfig-a003-20200405
i386                 randconfig-a001-20200405
i386                 randconfig-a002-20200405
alpha                randconfig-a001-20200405
m68k                 randconfig-a001-20200405
mips                 randconfig-a001-20200405
nds32                randconfig-a001-20200405
parisc               randconfig-a001-20200405
riscv                randconfig-a001-20200405
c6x                  randconfig-a001-20200405
h8300                randconfig-a001-20200405
microblaze           randconfig-a001-20200405
nios2                randconfig-a001-20200405
sparc64              randconfig-a001-20200405
csky                 randconfig-a001-20200405
openrisc             randconfig-a001-20200405
s390                 randconfig-a001-20200405
sh                   randconfig-a001-20200405
xtensa               randconfig-a001-20200405
csky                 randconfig-a001-20200406
openrisc             randconfig-a001-20200406
s390                 randconfig-a001-20200406
sh                   randconfig-a001-20200406
xtensa               randconfig-a001-20200406
x86_64               randconfig-b001-20200405
x86_64               randconfig-b002-20200405
x86_64               randconfig-b003-20200405
i386                 randconfig-b001-20200405
i386                 randconfig-b002-20200405
i386                 randconfig-b003-20200405
i386                 randconfig-c003-20200405
i386                 randconfig-c001-20200405
x86_64               randconfig-c002-20200405
x86_64               randconfig-c003-20200405
i386                 randconfig-c002-20200405
x86_64               randconfig-c001-20200405
x86_64               randconfig-d003-20200405
i386                 randconfig-d003-20200405
i386                 randconfig-d001-20200405
x86_64               randconfig-d002-20200405
i386                 randconfig-d002-20200405
x86_64               randconfig-d001-20200405
x86_64               randconfig-e001-20200405
x86_64               randconfig-e002-20200405
x86_64               randconfig-e003-20200405
i386                 randconfig-e001-20200405
i386                 randconfig-e002-20200405
i386                 randconfig-e003-20200405
x86_64               randconfig-e001-20200406
x86_64               randconfig-e002-20200406
x86_64               randconfig-e003-20200406
i386                 randconfig-e001-20200406
i386                 randconfig-e002-20200406
i386                 randconfig-e003-20200406
x86_64               randconfig-f001-20200405
x86_64               randconfig-f002-20200405
x86_64               randconfig-f003-20200405
i386                 randconfig-f001-20200405
i386                 randconfig-f002-20200405
i386                 randconfig-f003-20200405
x86_64               randconfig-g001-20200405
x86_64               randconfig-g002-20200405
x86_64               randconfig-g003-20200405
i386                 randconfig-g001-20200405
i386                 randconfig-g002-20200405
i386                 randconfig-g003-20200405
x86_64               randconfig-h001-20200405
x86_64               randconfig-h002-20200405
x86_64               randconfig-h003-20200405
i386                 randconfig-h001-20200405
i386                 randconfig-h002-20200405
i386                 randconfig-h003-20200405
arm64                randconfig-a001-20200406
sparc                randconfig-a001-20200406
ia64                 randconfig-a001-20200406
arc                  randconfig-a001-20200406
arm                  randconfig-a001-20200406
arc                  randconfig-a001-20200405
arm                  randconfig-a001-20200405
arm64                randconfig-a001-20200405
ia64                 randconfig-a001-20200405
powerpc              randconfig-a001-20200405
sparc                randconfig-a001-20200405
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                                allnoconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                               rhel-7.6
x86_64                         rhel-7.2-clear
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
