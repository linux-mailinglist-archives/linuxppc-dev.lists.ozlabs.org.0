Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC13C19EE8F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 01:29:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wVHz1LNbzDqjX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 09:29:35 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wVCN0tCMzDqhC
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 09:25:33 +1000 (AEST)
IronPort-SDR: wXKuYfVZJzJirkZ1GZAhTviUXUTqenOU1IEPw3zy7bpdxMXI/JIbCJovZJLOSFdHy+A/rtHa/b
 ZI8JIKCj3teA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2020 16:25:30 -0700
IronPort-SDR: WFyG890ewdrnL9H6UY7s0a9IEMXV8166pnGiFalLVwMx8EZla2OUj7K/jgtB/xkKRZjCt7quIn
 H1YJqHaR2wUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,349,1580803200"; d="scan'208";a="285705358"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 05 Apr 2020 16:25:28 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jLEds-0009sq-1x; Mon, 06 Apr 2020 07:25:28 +0800
Date: Mon, 06 Apr 2020 07:24:34 +0800
From: kbuild test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 2c0ce4ff35994a7b12cc9879ced52c9e7c2e6667
Message-ID: <5e8a68b2.XU1KEcXrAmcnVJ/m%lkp@intel.com>
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
branch HEAD: 2c0ce4ff35994a7b12cc9879ced52c9e7c2e6667  Automatic merge of branches 'master', 'next' and 'fixes' into merge

elapsed time: 629m

configs tested: 158
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
sparc                            allyesconfig
parisc                            allnoconfig
s390                              allnoconfig
c6x                              allyesconfig
s390                       zfcpdump_defconfig
openrisc                    or1ksim_defconfig
nds32                             allnoconfig
sh                                allnoconfig
sparc                               defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                             alldefconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
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
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
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
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200405
x86_64               randconfig-a002-20200405
x86_64               randconfig-a003-20200405
i386                 randconfig-a001-20200405
i386                 randconfig-a002-20200405
i386                 randconfig-a003-20200405
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
i386                 randconfig-c003-20200405
i386                 randconfig-c001-20200405
x86_64               randconfig-c002-20200405
x86_64               randconfig-c003-20200405
i386                 randconfig-c002-20200405
x86_64               randconfig-c001-20200405
x86_64               randconfig-e001-20200405
x86_64               randconfig-e002-20200405
x86_64               randconfig-e003-20200405
i386                 randconfig-e001-20200405
i386                 randconfig-e002-20200405
i386                 randconfig-e003-20200405
i386                 randconfig-f001-20200405
x86_64               randconfig-f003-20200405
i386                 randconfig-f003-20200405
x86_64               randconfig-f001-20200405
x86_64               randconfig-f002-20200405
i386                 randconfig-f002-20200405
x86_64               randconfig-g001-20200405
x86_64               randconfig-g002-20200405
x86_64               randconfig-g003-20200405
i386                 randconfig-g001-20200405
i386                 randconfig-g002-20200405
i386                 randconfig-g003-20200405
x86_64               randconfig-h002-20200405
i386                 randconfig-h002-20200405
i386                 randconfig-h003-20200405
i386                 randconfig-h001-20200405
x86_64               randconfig-h003-20200405
x86_64               randconfig-h001-20200405
arm64                randconfig-a001-20200405
sparc                randconfig-a001-20200405
ia64                 randconfig-a001-20200405
arc                  randconfig-a001-20200405
arm                  randconfig-a001-20200405
powerpc              randconfig-a001-20200405
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                             alldefconfig
s390                             allmodconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
