Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9CC490035
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 03:28:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JcbS30h79z3cBN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 13:28:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hdxljrK+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hdxljrK+; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcbQj6LxRz2xYK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 13:27:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642386446; x=1673922446;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=sk6BVF/Fvyp9cXGisxpqdVkKply7JaDTZAdy+r8vTnU=;
 b=hdxljrK+aYM7bTfqawq7RMTFSVL526zFtrmrBnhuxDY+Bf8NnxdtklcD
 35xWxnxYcyFa235opaE9bPo5ghKD54Y+WNxOXdTVzSSlyIvorx/1Bcz97
 Kd+mmdK6hvhDd8P2P5CPdfNVZwCPJ4jsWcIQloNY9+WNBI1GHXUiQqFnt
 /+ypExVZ0g5bgAR7u3+hKcX7Hv3jvvxxyF5zlHNLnaefKAFYmEPEl0L8K
 pNwhBXWqq2WH44MnsNXqYyP0d/4lKyEB+B+XtHG/nDmAeePFRtcCC9YPd
 9YnfskOR17Iyf/KXbKmdp/c3/1di39b1f+S2kVx8d38oFhg6uyP+fQfUG w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="268913479"
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600"; d="scan'208";a="268913479"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:26:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600"; d="scan'208";a="692912256"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 16 Jan 2022 18:26:21 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n9Hiu-000BBB-SL; Mon, 17 Jan 2022 02:26:20 +0000
Date: Mon, 17 Jan 2022 10:26:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 863a7c25c334ed368b4508fccae92d6bb61e71a4
Message-ID: <61e4d3c0.k/0f4ouu6KCqk5KT%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 863a7c25c334ed368b4508fccae92d6bb61e71a4  Automatic merge of 'master' into merge (2022-01-15 10:55)

elapsed time: 739m

configs tested: 177
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
m68k                          hp300_defconfig
powerpc                     sequoia_defconfig
mips                    maltaup_xpa_defconfig
arm                           viper_defconfig
sh                           se7712_defconfig
csky                             alldefconfig
powerpc                 mpc837x_rdb_defconfig
xtensa                           allyesconfig
arm                         assabet_defconfig
mips                       bmips_be_defconfig
mips                           ip32_defconfig
openrisc                 simple_smp_defconfig
sh                        apsh4ad0a_defconfig
mips                            gpr_defconfig
sparc64                             defconfig
powerpc                     taishan_defconfig
parisc                           allyesconfig
xtensa                  cadence_csp_defconfig
mips                     decstation_defconfig
powerpc                     tqm8548_defconfig
powerpc                      pcm030_defconfig
mips                            ar7_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                   currituck_defconfig
arm                           tegra_defconfig
mips                 decstation_r4k_defconfig
powerpc                  iss476-smp_defconfig
powerpc                       maple_defconfig
sh                         microdev_defconfig
sh                            titan_defconfig
mips                        vocore2_defconfig
openrisc                         alldefconfig
mips                          rb532_defconfig
m68k                           sun3_defconfig
xtensa                  nommu_kc705_defconfig
arc                                 defconfig
sh                             sh03_defconfig
powerpc                      ppc40x_defconfig
xtensa                           alldefconfig
sh                  sh7785lcr_32bit_defconfig
mips                         bigsur_defconfig
parisc                generic-32bit_defconfig
xtensa                  audio_kc705_defconfig
powerpc                     stx_gp3_defconfig
m68k                        stmark2_defconfig
m68k                          multi_defconfig
sh                      rts7751r2d1_defconfig
arm                            qcom_defconfig
arm                         at91_dt_defconfig
m68k                         apollo_defconfig
m68k                          sun3x_defconfig
s390                          debug_defconfig
sh                          polaris_defconfig
sh                         ap325rxa_defconfig
sh                             shx3_defconfig
arm                           corgi_defconfig
powerpc                     redwood_defconfig
sh                   rts7751r2dplus_defconfig
mips                         cobalt_defconfig
arm                             pxa_defconfig
sh                                  defconfig
mips                       capcella_defconfig
xtensa                       common_defconfig
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
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a004
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64               randconfig-a012-20220117
x86_64               randconfig-a013-20220117
x86_64               randconfig-a011-20220117
x86_64               randconfig-a015-20220117
x86_64               randconfig-a014-20220117
x86_64               randconfig-a016-20220117
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220116
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
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
arm                  randconfig-c002-20220116
x86_64                        randconfig-c007
riscv                randconfig-c006-20220116
powerpc              randconfig-c003-20220116
i386                          randconfig-c001
mips                 randconfig-c004-20220116
s390                 randconfig-c005-20220116
mips                          rm200_defconfig
arm                             mxs_defconfig
arm                         mv78xx0_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                      bmips_stb_defconfig
powerpc                      acadia_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                        omega2p_defconfig
powerpc                    gamecube_defconfig
arm64                            allyesconfig
x86_64               randconfig-a005-20220117
x86_64               randconfig-a004-20220117
x86_64               randconfig-a001-20220117
x86_64               randconfig-a006-20220117
x86_64               randconfig-a002-20220117
x86_64               randconfig-a003-20220117
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a005-20220117
i386                 randconfig-a001-20220117
i386                 randconfig-a006-20220117
i386                 randconfig-a004-20220117
i386                 randconfig-a002-20220117
i386                 randconfig-a003-20220117
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220116
riscv                randconfig-r042-20220116
hexagon              randconfig-r041-20220116
s390                 randconfig-r044-20220116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
