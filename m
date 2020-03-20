Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B870418DAC6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 23:05:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kd9r2ZjczDsTN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 09:05:04 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kd5q3WPxzDrqV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 09:01:28 +1100 (AEDT)
IronPort-SDR: JBr8ONM7nb9xMbysuH9TfokEURrQH2qEyEG1k/reE5p/m8J7sIKzRZE34xInPSWcqaNO9pw2DC
 wf858QQEXidQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 15:01:24 -0700
IronPort-SDR: 7S3Mi4swb4c76s8OxSQ/gEhNvOZJ0c+aBoqjfP3+lMFR2QBunJBHkogLj9SNWwz0dBMoT6YRll
 HJ+nyfp3uKBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,286,1580803200"; d="scan'208";a="446785769"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 20 Mar 2020 15:01:23 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jFPhi-0000GK-Gt; Sat, 21 Mar 2020 06:01:22 +0800
Date: Sat, 21 Mar 2020 06:00:47 +0800
From: kbuild test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS a87b93bdf800a4d7a42d95683624a4516e516b4f
Message-ID: <5e753d0f.YdLBirrFIHG2zMfD%lkp@intel.com>
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
branch HEAD: a87b93bdf800a4d7a42d95683624a4516e516b4f  Automatic merge of branches 'master', 'next' and 'fixes' into merge

elapsed time: 569m

configs tested: 157
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
parisc                generic-32bit_defconfig
openrisc                 simple_smp_defconfig
sparc64                          allmodconfig
powerpc                       ppc64_defconfig
i386                              allnoconfig
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
xtensa                       common_defconfig
xtensa                          iss_defconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                       m5475evb_defconfig
m68k                           sun3_defconfig
m68k                             allmodconfig
m68k                          multi_defconfig
arc                                 defconfig
arc                              allyesconfig
powerpc                             defconfig
powerpc                          rhel-kconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200320
x86_64               randconfig-a002-20200320
x86_64               randconfig-a003-20200320
i386                 randconfig-a001-20200320
i386                 randconfig-a002-20200320
i386                 randconfig-a003-20200320
alpha                randconfig-a001-20200320
mips                 randconfig-a001-20200320
nds32                randconfig-a001-20200320
parisc               randconfig-a001-20200320
m68k                 randconfig-a001-20200320
c6x                  randconfig-a001-20200320
h8300                randconfig-a001-20200320
microblaze           randconfig-a001-20200320
nios2                randconfig-a001-20200320
sparc64              randconfig-a001-20200320
csky                 randconfig-a001-20200320
openrisc             randconfig-a001-20200320
s390                 randconfig-a001-20200320
sh                   randconfig-a001-20200320
xtensa               randconfig-a001-20200320
i386                 randconfig-b003-20200320
i386                 randconfig-b001-20200320
x86_64               randconfig-b003-20200320
i386                 randconfig-b002-20200320
x86_64               randconfig-b002-20200320
x86_64               randconfig-b001-20200320
x86_64               randconfig-c003-20200320
i386                 randconfig-c002-20200320
x86_64               randconfig-c001-20200320
i386                 randconfig-c003-20200320
i386                 randconfig-c001-20200320
x86_64               randconfig-c002-20200320
i386                 randconfig-d003-20200320
i386                 randconfig-d001-20200320
x86_64               randconfig-d002-20200320
i386                 randconfig-d002-20200320
x86_64               randconfig-d001-20200320
x86_64               randconfig-d003-20200320
x86_64               randconfig-f001-20200320
x86_64               randconfig-f002-20200320
x86_64               randconfig-f003-20200320
i386                 randconfig-f001-20200320
i386                 randconfig-f002-20200320
i386                 randconfig-f003-20200320
x86_64               randconfig-g001-20200320
x86_64               randconfig-g002-20200320
x86_64               randconfig-g003-20200320
i386                 randconfig-g001-20200320
i386                 randconfig-g002-20200320
i386                 randconfig-g003-20200320
x86_64               randconfig-h001-20200320
x86_64               randconfig-h002-20200320
x86_64               randconfig-h003-20200320
i386                 randconfig-h001-20200320
i386                 randconfig-h002-20200320
i386                 randconfig-h003-20200320
arc                  randconfig-a001-20200320
arm                  randconfig-a001-20200320
arm64                randconfig-a001-20200320
ia64                 randconfig-a001-20200320
powerpc              randconfig-a001-20200320
sparc                randconfig-a001-20200320
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
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
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
