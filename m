Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AFF64F6F7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Dec 2022 03:11:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYqGL1L3Dz3bYW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Dec 2022 13:11:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PafMB1j3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PafMB1j3;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYqDN5KG4z2xVr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Dec 2022 13:09:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671242996; x=1702778996;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gXJxIWOyGgDzUfsWNd7q6OBHT42dLDNOpjzQj0YH2zg=;
  b=PafMB1j3JSWUt9Hzstw4XkhytgXPG+aACLkrlbndy/s2yW4FKj0Zlcmo
   I21de35UEqC+5Jeb2GqXROcsEstVoAYW2gQV2Le5x3C1YBasCENQZsoyq
   0lrNna9W/RqMJQsXdB/Nd4OuMWE+Q+bAvoRffIXnqhJMqtCA+s9tT6xZ7
   YOlwlmRf7H95wYp2ujVcrhIP2/qbFF19QZzO7qlgyuQZC05UZSFphJ1Mq
   O4YPcPMvchNDE8DXMuS5MItN49h2dHtOYEZbuDVWEOn0GNyMUmKsjU/Wv
   /QMJx31o8Ic4ID+z1m5T1BXQEuHrRAOVYfpp/RxBYAlDRr190aSPS+kvZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="320982068"
X-IronPort-AV: E=Sophos;i="5.96,251,1665471600"; 
   d="scan'208";a="320982068"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 18:09:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="682456997"
X-IronPort-AV: E=Sophos;i="5.96,251,1665471600"; 
   d="scan'208";a="682456997"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Dec 2022 18:09:48 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p6Me3-0007Wu-1V;
	Sat, 17 Dec 2022 02:09:47 +0000
Date: Sat, 17 Dec 2022 10:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 a241780d5def95e1568c06bb3da0000a86b637db
Message-ID: <639d24d4.TYCvxXWzyaojwxFa%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: a241780d5def95e1568c06bb3da0000a86b637db  powerpc/64: Set default CPU in Kconfig

elapsed time: 1402m

configs tested: 118
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
x86_64                        randconfig-a013
alpha                            allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a015
sh                               allmodconfig
ia64                             allmodconfig
arc                  randconfig-r043-20221215
arm                  randconfig-r046-20221215
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                            allnoconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                              defconfig
x86_64                           allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                             allyesconfig
i386                                defconfig
loongarch                           defconfig
loongarch                         allnoconfig
arc                  randconfig-r043-20221216
s390                 randconfig-r044-20221216
riscv                randconfig-r042-20221216
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sh                           se7724_defconfig
m68k                             alldefconfig
powerpc                      chrp32_defconfig
ia64                            zx1_defconfig
powerpc                  storcenter_defconfig
arm                          exynos_defconfig
arc                            hsdk_defconfig
loongarch                        allmodconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
sh                        sh7763rdp_defconfig
powerpc                         wii_defconfig
arm                            lart_defconfig
i386                          randconfig-c001
m68k                       m5249evb_defconfig
sh                            hp6xx_defconfig
m68k                           virt_defconfig
powerpc                     tqm8548_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20221216
arm                           stm32_defconfig
powerpc                     redwood_defconfig
powerpc                        cell_defconfig
sh                         microdev_defconfig
mips                          rb532_defconfig

clang tested configs:
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
hexagon              randconfig-r041-20221215
hexagon              randconfig-r045-20221215
riscv                randconfig-r042-20221215
s390                 randconfig-r044-20221215
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a013
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                          rhel-8.3-rust
arm                  randconfig-r046-20221216
hexagon              randconfig-r041-20221216
hexagon              randconfig-r045-20221216
x86_64                        randconfig-k001
arm                          moxart_defconfig
mips                        qi_lb60_defconfig
arm                      tct_hammer_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                     ppa8548_defconfig
arm                         lpc32xx_defconfig
mips                      pic32mzda_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                          malta_defconfig
powerpc                      katmai_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
