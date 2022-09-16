Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA6D5BAFCD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 17:01:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTcjT4Dddz3dpv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 01:01:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GyeM16Nq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GyeM16Nq;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTcgW1HF0z3bYG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Sep 2022 01:00:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663340407; x=1694876407;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Lg+PSk5JzTdKuGJ5KiTNdG8nfAU9O1q5XWm3/f201pE=;
  b=GyeM16NqlodrRtjNWAfcdU41n7lV5B7MrePx4PfYssRZd6JGdZG3JghU
   tdQT7jmJZdPmmkAEz3rFoDfEdGzOphDmIO7AZCfHF+a4OQUI+NYlg0m+z
   vL49tdBX4bc0mZfo4kpy8ZgVjW3gRVqUQkGn1KaLmsSr/UBDS9k64P50Y
   6asrULaQkojuWzli+avM3yxDsNt/ieZX4q32nCM6YhC4ueQxuuOAOkuay
   Fi5dfMnarnBhDnLvRZ8EbdG2KIyeuTgCrsUtOlNPrQhHta9752m3vAWum
   14f8yP5fAHnU0DeAqR30lwSJ+xbRWykMv6DT8F/XkPoldcq6N76vYwOaz
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="299830639"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="299830639"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 08:00:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="595274944"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Sep 2022 07:59:59 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZCow-0001r4-28;
	Fri, 16 Sep 2022 14:59:58 +0000
Date: Fri, 16 Sep 2022 22:59:46 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 3d7a198cfdb47405cfb4a3ea523876569fe341e6
Message-ID: <63248f62.1D4jkUk7mu1UgTOQ%lkp@intel.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 3d7a198cfdb47405cfb4a3ea523876569fe341e6  KVM: PPC: remove orphan declarations from kvm_ppc.h

elapsed time: 725m

configs tested: 138
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
s390                             allmodconfig
x86_64                           rhel-8.3-kvm
s390                                defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
arm                                 defconfig
i386                          randconfig-a001
s390                             allyesconfig
i386                          randconfig-a003
x86_64                           allyesconfig
i386                          randconfig-a012
arc                  randconfig-r043-20220915
i386                          randconfig-a016
i386                                defconfig
arc                              allyesconfig
i386                          randconfig-a005
riscv                randconfig-r042-20220915
alpha                            allyesconfig
mips                             allyesconfig
m68k                             allyesconfig
i386                          randconfig-a014
s390                 randconfig-r044-20220915
powerpc                           allnoconfig
arm64                            allyesconfig
powerpc                          allmodconfig
arm                              allyesconfig
sh                               allmodconfig
i386                             allyesconfig
ia64                             allmodconfig
x86_64                        randconfig-c001
i386                          randconfig-c001
arm                  randconfig-c002-20220916
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
loongarch                           defconfig
loongarch                         allnoconfig
powerpc                      bamboo_defconfig
arm64                               defconfig
powerpc                      pcm030_defconfig
arm                        mini2440_defconfig
powerpc                  iss476-smp_defconfig
sh                          r7785rp_defconfig
powerpc                        cell_defconfig
xtensa                generic_kc705_defconfig
mips                      maltasmvp_defconfig
arc                        nsim_700_defconfig
m68k                            q40_defconfig
sh                            titan_defconfig
arm                        realview_defconfig
arm                         assabet_defconfig
arm                         nhk8815_defconfig
powerpc                    amigaone_defconfig
arm                        oxnas_v6_defconfig
x86_64                        randconfig-a006
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
mips                        bcm47xx_defconfig
arc                           tb10x_defconfig
arc                          axs101_defconfig
openrisc                       virt_defconfig
sh                        sh7763rdp_defconfig
m68k                             alldefconfig
powerpc                      cm5200_defconfig
arc                              alldefconfig
powerpc                     stx_gp3_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                       m5475evb_defconfig
powerpc                      pasemi_defconfig
arm                       aspeed_g5_defconfig
arm                           h3600_defconfig
openrisc                    or1ksim_defconfig
s390                       zfcpdump_defconfig
sh                          kfr2r09_defconfig
alpha                            alldefconfig
arc                      axs103_smp_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
xtensa                    xip_kc705_defconfig
mips                    maltaup_xpa_defconfig
ia64                             allyesconfig
arm                              allmodconfig
m68k                                defconfig
ia64                                defconfig
mips                             allmodconfig
mips                  decstation_64_defconfig
s390                          debug_defconfig
powerpc                     rainier_defconfig

clang tested configs:
i386                          randconfig-a013
hexagon              randconfig-r045-20220915
i386                          randconfig-a011
hexagon              randconfig-r041-20220915
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a015
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
s390                 randconfig-r044-20220916
hexagon              randconfig-r045-20220916
riscv                randconfig-r042-20220916
hexagon              randconfig-r041-20220916
arm                          sp7021_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     mpc512x_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
