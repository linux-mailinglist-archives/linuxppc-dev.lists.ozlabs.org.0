Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2315A47515D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 04:32:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDLQt0SzSz3cPd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 14:32:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lORTeRLr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lORTeRLr; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDLQC2dVdz2yPd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 14:31:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639539107; x=1671075107;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=n2qX969ABAeNbXfSQLiUHgcFuPoA/OWYFX4l5JrPGB8=;
 b=lORTeRLrh+3XsyoNoQiTagXr8npOcvjv3mhdQKkBOTVT/oLhbH2b/T0J
 8bX/2wc3DcHV1BWIk0DbU/mMKRMyLWuTdvNam9ia8uxAxrFMaO5YzlFOn
 4TFaTE/JLo5hlnA2reT3JGIlaytPCvQKgrFhWgC9wkPEHbARDpyPQuFfK
 eF5HB7Q881LR9A1yvtwgkKGdTL4R8FQflkbIUQ2C/uRsZHehCIR6zSpoM
 YVCTbTsIZTXvWqLu/z7aQNVG54EsSGM2HZPzWGlznmXrMiB5dsBemx1AE
 tO+c4+MWnS0m1jpIZdWDEB6V47zd/vjxJlfP0tvKLHAyNle4OljUGz9e2 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="219822162"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="219822162"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 19:30:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="614550239"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 14 Dec 2021 19:30:43 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxL06-0001D6-Sa; Wed, 15 Dec 2021 03:30:42 +0000
Date: Wed, 15 Dec 2021 11:29:40 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 5eab62c15c387fa3caa03039bd027dc9aab9f637
Message-ID: <61b96124.3ogxKuEmK/M0pgcs%lkp@intel.com>
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
branch HEAD: 5eab62c15c387fa3caa03039bd027dc9aab9f637  powerpc/perf: Add data source encodings for power10 platform

elapsed time: 867m

configs tested: 203
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211214
mips                 randconfig-c004-20211214
i386                 randconfig-c001-20211215
sh                 kfr2r09-romimage_defconfig
powerpc                    klondike_defconfig
xtensa                    xip_kc705_defconfig
mips                      bmips_stb_defconfig
arm                            hisi_defconfig
arm                            mps2_defconfig
mips                           ip22_defconfig
powerpc                      tqm8xx_defconfig
arm                          gemini_defconfig
csky                             alldefconfig
arm                        cerfcube_defconfig
powerpc                        cell_defconfig
mips                  maltasmvp_eva_defconfig
mips                     loongson1c_defconfig
arm                        mini2440_defconfig
xtensa                  audio_kc705_defconfig
arm                         orion5x_defconfig
powerpc                   motionpro_defconfig
powerpc                 mpc834x_itx_defconfig
sh                               alldefconfig
arm                             mxs_defconfig
mips                           ip27_defconfig
powerpc                      ep88xc_defconfig
arm                           stm32_defconfig
xtensa                       common_defconfig
sh                         ecovec24_defconfig
powerpc                      pasemi_defconfig
powerpc                    gamecube_defconfig
powerpc64                        alldefconfig
mips                  cavium_octeon_defconfig
arm                     eseries_pxa_defconfig
arm                      footbridge_defconfig
arm                          pxa168_defconfig
riscv                            allmodconfig
m68k                          sun3x_defconfig
arm                         s5pv210_defconfig
mips                         tb0226_defconfig
mips                         tb0219_defconfig
powerpc                 xes_mpc85xx_defconfig
arm64                            alldefconfig
arc                    vdk_hs38_smp_defconfig
powerpc                   lite5200b_defconfig
powerpc                      acadia_defconfig
arc                     nsimosci_hs_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         hackkit_defconfig
arm                         s3c2410_defconfig
m68k                           sun3_defconfig
mips                      malta_kvm_defconfig
mips                           ci20_defconfig
sh                          r7780mp_defconfig
arm                   milbeaut_m10v_defconfig
arm                  colibri_pxa270_defconfig
powerpc                      makalu_defconfig
arm                      jornada720_defconfig
sh                          urquell_defconfig
arm                           sama5_defconfig
mips                            ar7_defconfig
arm                       aspeed_g5_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                       imx_v4_v5_defconfig
mips                      fuloong2e_defconfig
arm                         assabet_defconfig
arm                      integrator_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                          lpd270_defconfig
powerpc                     ppa8548_defconfig
mips                      maltaaprp_defconfig
arm                          imote2_defconfig
sh                      rts7751r2d1_defconfig
sparc                               defconfig
sh                         microdev_defconfig
powerpc                     stx_gp3_defconfig
parisc                           alldefconfig
m68k                        m5307c3_defconfig
xtensa                          iss_defconfig
sh                            shmin_defconfig
sh                  sh7785lcr_32bit_defconfig
m68k                        stmark2_defconfig
h8300                       h8s-sim_defconfig
x86_64                           allyesconfig
arm                         lubbock_defconfig
arm                         lpc32xx_defconfig
mips                        vocore2_defconfig
i386                             alldefconfig
mips                           rs90_defconfig
mips                    maltaup_xpa_defconfig
sparc                       sparc32_defconfig
h8300                               defconfig
openrisc                            defconfig
powerpc                       ppc64_defconfig
powerpc                      pmac32_defconfig
mips                         tb0287_defconfig
arm                         vf610m4_defconfig
powerpc                   currituck_defconfig
m68k                             alldefconfig
arm                            qcom_defconfig
sh                           se7724_defconfig
sparc64                             defconfig
h8300                    h8300h-sim_defconfig
arm                         socfpga_defconfig
powerpc                      bamboo_defconfig
ia64                         bigsur_defconfig
arm                        multi_v5_defconfig
arm                        oxnas_v6_defconfig
arm                        shmobile_defconfig
arm                        magician_defconfig
sh                                  defconfig
powerpc                    mvme5100_defconfig
sh                        apsh4ad0a_defconfig
parisc                              defconfig
sh                           se7712_defconfig
sh                        dreamcast_defconfig
powerpc                     tqm8540_defconfig
powerpc                          g5_defconfig
arm                           sama7_defconfig
arm                  randconfig-c002-20211214
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
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211214
x86_64               randconfig-a005-20211214
x86_64               randconfig-a001-20211214
x86_64               randconfig-a002-20211214
x86_64               randconfig-a003-20211214
x86_64               randconfig-a004-20211214
i386                 randconfig-a001-20211214
i386                 randconfig-a002-20211214
i386                 randconfig-a005-20211214
i386                 randconfig-a003-20211214
i386                 randconfig-a006-20211214
i386                 randconfig-a004-20211214
arc                  randconfig-r043-20211214
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211214
x86_64               randconfig-c007-20211214
riscv                randconfig-c006-20211214
mips                 randconfig-c004-20211214
i386                 randconfig-c001-20211214
s390                 randconfig-c005-20211214
powerpc              randconfig-c003-20211214
x86_64               randconfig-a011-20211214
x86_64               randconfig-a014-20211214
x86_64               randconfig-a012-20211214
x86_64               randconfig-a013-20211214
x86_64               randconfig-a016-20211214
x86_64               randconfig-a015-20211214
i386                 randconfig-a013-20211214
i386                 randconfig-a011-20211214
i386                 randconfig-a016-20211214
i386                 randconfig-a014-20211214
i386                 randconfig-a015-20211214
i386                 randconfig-a012-20211214
hexagon              randconfig-r045-20211214
s390                 randconfig-r044-20211214
riscv                randconfig-r042-20211214
hexagon              randconfig-r041-20211214

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
