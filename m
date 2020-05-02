Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F91C2592
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 15:10:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DqGm53jPzDqxF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 23:10:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49DnFm1B6GzDqWW
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:39:06 +1000 (AEST)
IronPort-SDR: xvReS/bfJpdt5AaZN+O/ivETFSgwydpHWiQJphMFJ7W+cEt7VMqYaGslJWikyQZK575ZQJep3+
 6errSVqr07QA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2020 04:39:03 -0700
IronPort-SDR: cdt18vqa/onJY3M16vL1UoRAibux59TuxmvYbE1zrnEB1JwmSU1IxJMcQZnKf74i3uty22RLe5
 OTDVJTThQkwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,343,1583222400"; d="scan'208";a="294135754"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 02 May 2020 04:39:02 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jUqU1-000HsR-Ul; Sat, 02 May 2020 19:39:01 +0800
Date: Sat, 02 May 2020 19:38:51 +0800
From: kbuild test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/uaccess] BUILD SUCCESS
 b44f687386875b714dae2afa768e73401e45c21c
Message-ID: <5ead5bcb.fgwiFAvfPnO+/mjN%lkp@intel.com>
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
branch HEAD: b44f687386875b714dae2afa768e73401e45c21c  drm/i915/gem: Replace user_access_begin by user_write_access_begin

elapsed time: 695m

configs tested: 193
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

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
arc                              allyesconfig
powerpc                             defconfig
ia64                                defconfig
i386                             alldefconfig
openrisc                 simple_smp_defconfig
arc                                 defconfig
mips                            ar7_defconfig
s390                              allnoconfig
mips                              allnoconfig
mips                             allmodconfig
sparc64                             defconfig
csky                                defconfig
sh                          rsk7269_defconfig
ia64                              allnoconfig
powerpc                     mpc512x_defconfig
sh                  sh7785lcr_32bit_defconfig
xtensa                          iss_defconfig
um                                  defconfig
nds32                             allnoconfig
m68k                           sun3_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                        generic_defconfig
ia64                          tiger_defconfig
ia64                         bigsur_defconfig
ia64                             allyesconfig
ia64                             alldefconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
m68k                       bvme6000_defconfig
m68k                          multi_defconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
c6x                              allyesconfig
openrisc                    or1ksim_defconfig
nds32                               defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
xtensa                       common_defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                           32r2_defconfig
mips                malta_kvm_guest_defconfig
mips                         tb0287_defconfig
mips                       capcella_defconfig
mips                           ip32_defconfig
mips                  decstation_64_defconfig
mips                      loongson3_defconfig
mips                          ath79_defconfig
mips                        bcm63xx_defconfig
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
m68k                 randconfig-a001-20200502
mips                 randconfig-a001-20200502
nds32                randconfig-a001-20200502
alpha                randconfig-a001-20200502
parisc               randconfig-a001-20200502
riscv                randconfig-a001-20200502
h8300                randconfig-a001-20200502
nios2                randconfig-a001-20200502
microblaze           randconfig-a001-20200502
c6x                  randconfig-a001-20200502
sparc64              randconfig-a001-20200502
s390                 randconfig-a001-20200502
xtensa               randconfig-a001-20200502
sh                   randconfig-a001-20200502
openrisc             randconfig-a001-20200502
csky                 randconfig-a001-20200502
x86_64               randconfig-a003-20200502
x86_64               randconfig-a001-20200502
x86_64               randconfig-a002-20200502
i386                 randconfig-a002-20200502
i386                 randconfig-a003-20200502
i386                 randconfig-a001-20200502
i386                 randconfig-b003-20200502
i386                 randconfig-b001-20200502
x86_64               randconfig-b003-20200502
x86_64               randconfig-b001-20200502
i386                 randconfig-b002-20200502
i386                 randconfig-b003-20200501
x86_64               randconfig-b002-20200501
i386                 randconfig-b001-20200501
x86_64               randconfig-b003-20200501
x86_64               randconfig-b001-20200501
i386                 randconfig-b002-20200501
x86_64               randconfig-c002-20200502
i386                 randconfig-c002-20200502
i386                 randconfig-c001-20200502
i386                 randconfig-c003-20200502
i386                 randconfig-d003-20200502
i386                 randconfig-d001-20200502
x86_64               randconfig-d002-20200502
i386                 randconfig-d002-20200502
x86_64               randconfig-e003-20200502
i386                 randconfig-e003-20200502
x86_64               randconfig-e001-20200502
i386                 randconfig-e002-20200502
i386                 randconfig-e001-20200502
i386                 randconfig-f003-20200502
x86_64               randconfig-f001-20200502
x86_64               randconfig-f003-20200502
x86_64               randconfig-f002-20200502
i386                 randconfig-f001-20200502
i386                 randconfig-f002-20200502
x86_64               randconfig-g003-20200502
i386                 randconfig-g003-20200502
i386                 randconfig-g002-20200502
x86_64               randconfig-g001-20200502
x86_64               randconfig-g002-20200502
i386                 randconfig-g001-20200502
i386                 randconfig-h001-20200502
i386                 randconfig-h002-20200502
i386                 randconfig-h003-20200502
x86_64               randconfig-h002-20200502
x86_64               randconfig-h001-20200502
x86_64               randconfig-h003-20200502
ia64                 randconfig-a001-20200502
arm64                randconfig-a001-20200502
arc                  randconfig-a001-20200502
powerpc              randconfig-a001-20200502
arm                  randconfig-a001-20200502
sparc                randconfig-a001-20200502
ia64                 randconfig-a001-20200501
arc                  randconfig-a001-20200501
powerpc              randconfig-a001-20200501
arm                  randconfig-a001-20200501
sparc                randconfig-a001-20200501
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                       zfcpdump_defconfig
s390                          debug_defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                             alldefconfig
s390                                defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
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
