Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4055D490036
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 03:29:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JcbSw1G26z3cRj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 13:29:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dOYaL+m2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dOYaL+m2; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcbRs08jPz30N0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 13:28:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642386505; x=1673922505;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=LKtnd7aKgkAAdjs8ZUFJNqd77kcyD/4xM6L3+92AvAA=;
 b=dOYaL+m2nF+gTat5PAOpK3QW6Tokm0v1qNqezei0kjmJGnwNtaGPCjt8
 0up5iQ7JnIOo7/P1UOg4gtiAOHe+GVO4ucCUDi9Pdaqzr+oDFlHHaBJda
 wCq86AoQhtTUJXspZqkH5uXW6O950thfRfp00bTc9fqBjXMEh4c31yo2U
 dasr1IKKyH6Z4DcSC647Z3HWJiKvnnZPDTflUfNCDQWHZKH4/fclwN6wn
 G8Fb/hU8fKeLZ90tEkTWDn1UTwZ0bRviQ9K/6P4twYqM0ww1xSfIUsc4l
 ucizw4AK46OnqtFqAX64Gg4oLxcBB7ip+Of/edP5ZDZdXH7M/O89o+lxe w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="244735093"
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600"; d="scan'208";a="244735093"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:27:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600"; d="scan'208";a="577901208"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 16 Jan 2022 18:27:21 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n9Hjs-000BBW-Vs; Mon, 17 Jan 2022 02:27:20 +0000
Date: Mon, 17 Jan 2022 10:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 7773544e4027aa905e7f75752e3db619b473bd5c
Message-ID: <61e4d3c9.d3mPXBtWJ6Fqo4gx%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 7773544e4027aa905e7f75752e3db619b473bd5c  powerpc/kvm: no need to initialise statics to 0

elapsed time: 738m

configs tested: 128
configs skipped: 144

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
m68k                          hp300_defconfig
powerpc                     sequoia_defconfig
mips                    maltaup_xpa_defconfig
arm                           viper_defconfig
powerpc                 mpc837x_mds_defconfig
xtensa                           allyesconfig
arm                         assabet_defconfig
mips                       bmips_be_defconfig
mips                           ip32_defconfig
openrisc                 simple_smp_defconfig
sparc64                             defconfig
powerpc                     taishan_defconfig
parisc                           allyesconfig
xtensa                  cadence_csp_defconfig
powerpc                       eiger_defconfig
powerpc                  iss476-smp_defconfig
powerpc                     stx_gp3_defconfig
powerpc                      pcm030_defconfig
mips                            ar7_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                   currituck_defconfig
arm                           tegra_defconfig
mips                 decstation_r4k_defconfig
mips                         bigsur_defconfig
parisc                generic-32bit_defconfig
xtensa                  audio_kc705_defconfig
m68k                        stmark2_defconfig
m68k                          multi_defconfig
arm                           corgi_defconfig
powerpc                     redwood_defconfig
sh                   rts7751r2dplus_defconfig
mips                         cobalt_defconfig
arm                  randconfig-c002-20220116
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a016-20220117
x86_64               randconfig-a012-20220117
x86_64               randconfig-a013-20220117
x86_64               randconfig-a011-20220117
x86_64               randconfig-a014-20220117
x86_64               randconfig-a015-20220117
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220116
x86_64                        randconfig-c007
riscv                randconfig-c006-20220116
powerpc              randconfig-c003-20220116
i386                          randconfig-c001
mips                 randconfig-c004-20220116
s390                 randconfig-c005-20220116
powerpc                        icon_defconfig
mips                          rm200_defconfig
arm                             mxs_defconfig
arm                         mv78xx0_defconfig
powerpc                          allmodconfig
powerpc                 mpc832x_rdb_defconfig
mips                        omega2p_defconfig
powerpc                    gamecube_defconfig
x86_64               randconfig-a005-20220117
x86_64               randconfig-a004-20220117
x86_64               randconfig-a001-20220117
x86_64               randconfig-a006-20220117
x86_64               randconfig-a002-20220117
x86_64               randconfig-a003-20220117
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220116
riscv                randconfig-r042-20220116
hexagon              randconfig-r041-20220116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
