Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9C93B4177
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 12:20:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBCgs6GQXz3c6y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 20:20:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBCg32dksz2yWs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 20:19:58 +1000 (AEST)
IronPort-SDR: 1k4TyCOPVWRI3rcJ4SF0kSnp4MzAxYzniu1H5JfOaik3bt1hEYOBcrk4WxxPynAQ5Gu3gZ5yCg
 d5+UTvFodNVA==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="293280919"
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; d="scan'208";a="293280919"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 03:19:50 -0700
IronPort-SDR: W3xZpQVF1Znk80hJ21pmyN2QBokp3fq6uiYYkDeR0ZqYQLO73E74UmFOH932Vk193itB3NS4uj
 16iqw+Jv7zRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; d="scan'208";a="453765000"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 25 Jun 2021 03:19:49 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lwiw8-00075X-Ti; Fri, 25 Jun 2021 10:19:48 +0000
Date: Fri, 25 Jun 2021 18:19:45 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 06664e6c0f810035deb4b1d135d7a8f70795512f
Message-ID: <60d5adc1.ZzWHYB4TIOPy/3d7%lkp@intel.com>
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
branch HEAD: 06664e6c0f810035deb4b1d135d7a8f70795512f  powerpc: mark local variables around longjmp as volatile

elapsed time: 1120m

configs tested: 162
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                           ip28_defconfig
powerpc                 mpc832x_mds_defconfig
arm                      pxa255-idp_defconfig
sh                              ul2_defconfig
arm                        neponset_defconfig
sh                           se7721_defconfig
alpha                            alldefconfig
m68k                          amiga_defconfig
powerpc                     ep8248e_defconfig
mips                        omega2p_defconfig
arm                         s5pv210_defconfig
arm                         hackkit_defconfig
csky                             alldefconfig
arc                           tb10x_defconfig
sh                          rsk7201_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                  maltasmvp_eva_defconfig
arm                        spear6xx_defconfig
sh                             espt_defconfig
mips                        qi_lb60_defconfig
h8300                            alldefconfig
powerpc                     akebono_defconfig
ia64                             allmodconfig
xtensa                generic_kc705_defconfig
openrisc                    or1ksim_defconfig
mips                         rt305x_defconfig
sh                           se7206_defconfig
nios2                            alldefconfig
powerpc                 mpc8540_ads_defconfig
mips                malta_qemu_32r6_defconfig
m68k                        m5407c3_defconfig
m68k                            mac_defconfig
xtensa                           alldefconfig
mips                        bcm63xx_defconfig
arc                          axs103_defconfig
sh                        edosk7760_defconfig
powerpc                      katmai_defconfig
powerpc                 mpc834x_mds_defconfig
arc                        nsimosci_defconfig
xtensa                    xip_kc705_defconfig
sh                           se7751_defconfig
mips                       capcella_defconfig
arm                      footbridge_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                 xes_mpc85xx_defconfig
sh                        sh7763rdp_defconfig
powerpc                     tqm8555_defconfig
xtensa                  audio_kc705_defconfig
mips                      maltaaprp_defconfig
h8300                            allyesconfig
arm                        mvebu_v5_defconfig
arm                          exynos_defconfig
xtensa                              defconfig
mips                    maltaup_xpa_defconfig
arm                       multi_v4t_defconfig
um                                  defconfig
sh                         ap325rxa_defconfig
m68k                       m5249evb_defconfig
arm                  colibri_pxa270_defconfig
sh                           sh2007_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                   milbeaut_m10v_defconfig
arm                           tegra_defconfig
s390                          debug_defconfig
powerpc                       ebony_defconfig
powerpc                       holly_defconfig
x86_64                            allnoconfig
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
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210625
x86_64               randconfig-a001-20210625
x86_64               randconfig-a005-20210625
x86_64               randconfig-a003-20210625
x86_64               randconfig-a004-20210625
x86_64               randconfig-a006-20210625
i386                 randconfig-a002-20210625
i386                 randconfig-a001-20210625
i386                 randconfig-a003-20210625
i386                 randconfig-a006-20210625
i386                 randconfig-a005-20210625
i386                 randconfig-a004-20210625
i386                 randconfig-a001-20210622
i386                 randconfig-a002-20210622
i386                 randconfig-a003-20210622
i386                 randconfig-a006-20210622
i386                 randconfig-a005-20210622
i386                 randconfig-a004-20210622
x86_64               randconfig-a012-20210622
x86_64               randconfig-a016-20210622
x86_64               randconfig-a015-20210622
x86_64               randconfig-a014-20210622
x86_64               randconfig-a013-20210622
x86_64               randconfig-a011-20210622
i386                 randconfig-a011-20210622
i386                 randconfig-a014-20210622
i386                 randconfig-a013-20210622
i386                 randconfig-a015-20210622
i386                 randconfig-a012-20210622
i386                 randconfig-a016-20210622
i386                 randconfig-a011-20210625
i386                 randconfig-a014-20210625
i386                 randconfig-a013-20210625
i386                 randconfig-a015-20210625
i386                 randconfig-a012-20210625
i386                 randconfig-a016-20210625
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
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210622
x86_64               randconfig-a002-20210622
x86_64               randconfig-a001-20210622
x86_64               randconfig-a005-20210622
x86_64               randconfig-a003-20210622
x86_64               randconfig-a004-20210622
x86_64               randconfig-a006-20210622

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
