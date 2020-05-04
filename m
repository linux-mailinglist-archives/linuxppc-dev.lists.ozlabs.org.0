Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA211C3D74
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 16:47:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G5LQ6gTtzDqQY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 00:47:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G59W03RJzDqG8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 00:39:52 +1000 (AEST)
IronPort-SDR: dzAFV5+wo1ZfsEPRBUnhJlhMJ40t7/0zbUZzdQhgyvjw1VoaI7xRe/P9pQwnn6cRq36aBmVmot
 JqD3a7dcvj+g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2020 07:39:49 -0700
IronPort-SDR: ikL8Qk5sEcKZNkMoWUJr/2BUASmSimb5EzxASHcl1x/L3IygjPXt0gW4qS77wnNR/H48XS0tYF
 OARoDR92WqNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,352,1583222400"; d="scan'208";a="434121748"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 04 May 2020 07:39:47 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jVcG3-000HZX-5C; Mon, 04 May 2020 22:39:47 +0800
Date: Mon, 04 May 2020 22:39:03 +0800
From: kbuild test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 1bc92fe3175eb26ff37e580c0383d7a9abe06835
Message-ID: <5eb02907.1bPRSDWUjLp06nKz%lkp@intel.com>
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
branch HEAD: 1bc92fe3175eb26ff37e580c0383d7a9abe06835  Automatic merge of branches 'master', 'next' and 'fixes' into merge

elapsed time: 5894m

configs tested: 248
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
arm                          exynos_defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm                              allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
sparc                            allyesconfig
powerpc                             defconfig
ia64                                defconfig
powerpc                      chrp32_defconfig
c6x                        evmc6678_defconfig
xtensa                       common_defconfig
ia64                             alldefconfig
nds32                             allnoconfig
mips                       capcella_defconfig
riscv                    nommu_virt_defconfig
mips                             allmodconfig
s390                       zfcpdump_defconfig
powerpc                     mpc512x_defconfig
sh                  sh7785lcr_32bit_defconfig
xtensa                          iss_defconfig
um                                  defconfig
sh                          rsk7269_defconfig
mips                              allnoconfig
csky                                defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                              allnoconfig
ia64                        generic_defconfig
ia64                          tiger_defconfig
ia64                         bigsur_defconfig
ia64                             allyesconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
m68k                       bvme6000_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                              allyesconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
nds32                               defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
arc                                 defconfig
arc                              allyesconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                            ar7_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                           32r2_defconfig
mips                malta_kvm_guest_defconfig
mips                         tb0287_defconfig
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
powerpc                       holly_defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
powerpc                           allnoconfig
powerpc                  mpc866_ads_defconfig
powerpc                    amigaone_defconfig
powerpc                    adder875_defconfig
powerpc                     ep8248e_defconfig
powerpc                          g5_defconfig
parisc               randconfig-a001-20200430
mips                 randconfig-a001-20200430
m68k                 randconfig-a001-20200430
riscv                randconfig-a001-20200430
alpha                randconfig-a001-20200430
nds32                randconfig-a001-20200430
m68k                 randconfig-a001-20200502
mips                 randconfig-a001-20200502
nds32                randconfig-a001-20200502
alpha                randconfig-a001-20200502
parisc               randconfig-a001-20200502
riscv                randconfig-a001-20200502
microblaze           randconfig-a001-20200430
nios2                randconfig-a001-20200430
h8300                randconfig-a001-20200430
c6x                  randconfig-a001-20200430
sparc64              randconfig-a001-20200430
h8300                randconfig-a001-20200502
nios2                randconfig-a001-20200502
microblaze           randconfig-a001-20200502
c6x                  randconfig-a001-20200502
sparc64              randconfig-a001-20200502
s390                 randconfig-a001-20200430
xtensa               randconfig-a001-20200430
csky                 randconfig-a001-20200430
openrisc             randconfig-a001-20200430
sh                   randconfig-a001-20200430
s390                 randconfig-a001-20200502
xtensa               randconfig-a001-20200502
sh                   randconfig-a001-20200502
openrisc             randconfig-a001-20200502
csky                 randconfig-a001-20200502
s390                 randconfig-a001-20200501
xtensa               randconfig-a001-20200501
sh                   randconfig-a001-20200501
openrisc             randconfig-a001-20200501
csky                 randconfig-a001-20200501
x86_64               randconfig-a003-20200501
x86_64               randconfig-a001-20200501
i386                 randconfig-a003-20200501
i386                 randconfig-a002-20200501
i386                 randconfig-a001-20200501
i386                 randconfig-b003-20200501
x86_64               randconfig-b002-20200501
i386                 randconfig-b001-20200501
x86_64               randconfig-b003-20200501
x86_64               randconfig-b001-20200501
i386                 randconfig-b002-20200501
i386                 randconfig-b001-20200430
i386                 randconfig-b002-20200430
x86_64               randconfig-b001-20200430
i386                 randconfig-b003-20200430
x86_64               randconfig-b002-20200430
x86_64               randconfig-b003-20200430
i386                 randconfig-b003-20200502
i386                 randconfig-b001-20200502
x86_64               randconfig-b003-20200502
x86_64               randconfig-b001-20200502
i386                 randconfig-b002-20200502
x86_64               randconfig-d001-20200501
i386                 randconfig-d003-20200501
x86_64               randconfig-d003-20200501
i386                 randconfig-d001-20200501
x86_64               randconfig-d002-20200501
i386                 randconfig-d002-20200501
x86_64               randconfig-e003-20200503
x86_64               randconfig-e002-20200503
i386                 randconfig-e003-20200503
x86_64               randconfig-e001-20200503
i386                 randconfig-e002-20200503
i386                 randconfig-e001-20200503
x86_64               randconfig-e002-20200430
i386                 randconfig-e003-20200430
x86_64               randconfig-e003-20200430
i386                 randconfig-e002-20200430
x86_64               randconfig-e001-20200430
i386                 randconfig-e001-20200430
i386                 randconfig-f003-20200501
x86_64               randconfig-f001-20200501
x86_64               randconfig-f003-20200501
i386                 randconfig-f001-20200501
i386                 randconfig-f002-20200501
x86_64               randconfig-a003-20200502
x86_64               randconfig-a001-20200502
x86_64               randconfig-a002-20200502
i386                 randconfig-a002-20200502
i386                 randconfig-a003-20200502
i386                 randconfig-a001-20200502
x86_64               randconfig-g003-20200502
i386                 randconfig-g003-20200502
i386                 randconfig-g002-20200502
x86_64               randconfig-g001-20200502
x86_64               randconfig-g002-20200502
i386                 randconfig-g001-20200502
i386                 randconfig-g003-20200501
i386                 randconfig-g002-20200501
x86_64               randconfig-g002-20200501
i386                 randconfig-g001-20200501
i386                 randconfig-h002-20200430
i386                 randconfig-h003-20200430
x86_64               randconfig-h001-20200430
x86_64               randconfig-h003-20200430
i386                 randconfig-h001-20200430
i386                 randconfig-h001-20200501
i386                 randconfig-h002-20200501
i386                 randconfig-h003-20200501
x86_64               randconfig-h001-20200501
x86_64               randconfig-h003-20200501
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
sparc                randconfig-a001-20200430
arc                  randconfig-a001-20200430
ia64                 randconfig-a001-20200430
powerpc              randconfig-a001-20200430
arm                  randconfig-a001-20200430
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                          debug_defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                             alldefconfig
s390                                defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                             defconfig
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
