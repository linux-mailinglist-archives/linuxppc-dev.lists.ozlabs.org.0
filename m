Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD2A4D693A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 20:56:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFcC56S8xz3bTf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 06:56:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EEsjEoFB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EEsjEoFB; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFcBN6z4Qz305p
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 06:56:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647028574; x=1678564574;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=yCF0mu+nPZRT22aFhzNFgO7W+IolZH6SYhglIU+MJTM=;
 b=EEsjEoFBc8ctdVQY3yyiPhpf9RMnLvPFOjQ/KTmTTATsQ4P26Cxvb94o
 FT8jE+3+3lWQJI78xtYjSzTTnc3wgsAMoJk9ZnxNavDlaC180QQHFAjjr
 GEbiItmqtl08UjrMbUMUX33YhKq0XShnR7lYbe9L3MmCHEik1jJbJQCqq
 IT9FGUpBafLh0rQ/CpdUtujePGnbhsB/Erckg01ZHCBlfnaGke9VRaybB
 NmwZVQIydWUduUmAffoNbU1f8Uu/iuSawwsBe6J2ZU/gUd90c+3OW7NrZ
 0o2x3dQlksXv5TOsSCwjn04t4eiKTEbKT0gqnBdG95otAVMyzHppAcQwA g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="280389006"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="280389006"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 11:55:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="539111588"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 11 Mar 2022 11:55:03 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSlLq-00070g-Bb; Fri, 11 Mar 2022 19:55:02 +0000
Date: Sat, 12 Mar 2022 03:54:01 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/ppc-kvm] BUILD SUCCESS
 f771b55731fc82b1e8e9ef123f6f1b8d8c92bc63
Message-ID: <622ba8d9.tPU3xhkDKXE+GIvc%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
branch HEAD: f771b55731fc82b1e8e9ef123f6f1b8d8c92bc63  KVM: PPC: Use KVM_CAP_PPC_AIL_MODE_3

elapsed time: 742m

configs tested: 123
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
arm                         cm_x300_defconfig
arm                     eseries_pxa_defconfig
sh                   sh7770_generic_defconfig
powerpc                     tqm8548_defconfig
mips                  maltasmvp_eva_defconfig
sh                             sh03_defconfig
powerpc                     ep8248e_defconfig
xtensa                          iss_defconfig
arm                       omap2plus_defconfig
sh                            titan_defconfig
parisc                generic-64bit_defconfig
mips                    maltaup_xpa_defconfig
arc                    vdk_hs38_smp_defconfig
openrisc                 simple_smp_defconfig
arm                            mps2_defconfig
arm                          badge4_defconfig
sh                           se7721_defconfig
sh                           se7750_defconfig
arm                        shmobile_defconfig
arc                        nsim_700_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                 canyonlands_defconfig
sh                        edosk7705_defconfig
powerpc                       ppc64_defconfig
ia64                      gensparse_defconfig
mips                         db1xxx_defconfig
arm                          pxa3xx_defconfig
openrisc                         alldefconfig
powerpc                       holly_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                   motionpro_defconfig
h8300                     edosk2674_defconfig
arm                           stm32_defconfig
mips                 decstation_r4k_defconfig
sh                        sh7757lcr_defconfig
arm                  randconfig-c002-20220310
arm                  randconfig-c002-20220311
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
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220310
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220310
riscv                randconfig-c006-20220310
mips                 randconfig-c004-20220310
i386                          randconfig-c001
powerpc                     tqm8540_defconfig
mips                       lemote2f_defconfig
arm                    vt8500_v6_v7_defconfig
hexagon                          alldefconfig
arm                     davinci_all_defconfig
mips                           mtx1_defconfig
arm                          collie_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220310
hexagon              randconfig-r041-20220310
riscv                randconfig-r042-20220310

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
