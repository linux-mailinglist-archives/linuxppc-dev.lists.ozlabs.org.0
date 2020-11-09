Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 700542AAE98
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 01:49:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CTspG26M1zDqnn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 11:49:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CTsm65dNlzDqkR
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Nov 2020 11:47:49 +1100 (AEDT)
IronPort-SDR: OS7lhBr03jD81zFXZayLRpUYnT7sonYYjkQx9uwmV95c5aM66+p04z2vCsUN5JMzA2qq21rFmm
 MRNAKb23WnCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="157516800"
X-IronPort-AV: E=Sophos;i="5.77,462,1596524400"; d="scan'208";a="157516800"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2020 16:47:46 -0800
IronPort-SDR: rJNAOoQBaQedpCCDlNk/bqPnNq1P5MGQH6Nq/TNlIYnMSESY8VM+ynLfKzOjiSXY/1K3BKGW+w
 Wo7eXE0dhr0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,462,1596524400"; d="scan'208";a="353961637"
Received: from lkp-server02.sh.intel.com (HELO defa7f6e4f65) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 08 Nov 2020 16:47:45 -0800
Received: from kbuild by defa7f6e4f65 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kbvLU-000022-St; Mon, 09 Nov 2020 00:47:44 +0000
Date: Mon, 09 Nov 2020 08:46:49 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 fea97f268bc201789c3da74db7eb0c6313d17917
Message-ID: <5fa89179.zWmtETY14BV7yoOl%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  next-test
branch HEAD: fea97f268bc201789c3da74db7eb0c6313d17917  powerpc: Use the common INIT_DATA_SECTION macro in vmlinux.lds.S

elapsed time: 4487m

configs tested: 163
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      tqm8xx_defconfig
sh                          rsk7269_defconfig
sh                        sh7763rdp_defconfig
powerpc                      cm5200_defconfig
mips                        maltaup_defconfig
arm                           viper_defconfig
arm                  colibri_pxa300_defconfig
arm                         lpc18xx_defconfig
arm                      tct_hammer_defconfig
powerpc                       ebony_defconfig
powerpc                 mpc8313_rdb_defconfig
nios2                         3c120_defconfig
sh                          r7780mp_defconfig
sparc                               defconfig
powerpc                     ep8248e_defconfig
powerpc                   lite5200b_defconfig
powerpc                 mpc834x_itx_defconfig
c6x                                 defconfig
mips                       bmips_be_defconfig
sparc                       sparc32_defconfig
arm                            zeus_defconfig
arm                            pleb_defconfig
arm                     am200epdkit_defconfig
powerpc                     stx_gp3_defconfig
sh                           se7724_defconfig
mips                        nlm_xlr_defconfig
arm                  colibri_pxa270_defconfig
mips                       lemote2f_defconfig
s390                             allyesconfig
s390                          debug_defconfig
arm                        mini2440_defconfig
arm                       versatile_defconfig
sh                            shmin_defconfig
powerpc                 mpc834x_mds_defconfig
c6x                        evmc6457_defconfig
arm                           tegra_defconfig
mips                         rt305x_defconfig
powerpc                     powernv_defconfig
powerpc                     taishan_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                       multi_v4t_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                malta_kvm_guest_defconfig
sh                          rsk7264_defconfig
arm                          lpd270_defconfig
powerpc                           allnoconfig
powerpc                 mpc837x_rdb_defconfig
arm                         hackkit_defconfig
arc                     haps_hs_smp_defconfig
riscv                            alldefconfig
arm                         s3c2410_defconfig
ia64                        generic_defconfig
mips                       capcella_defconfig
openrisc                 simple_smp_defconfig
nds32                            alldefconfig
sh                         ap325rxa_defconfig
arm                          gemini_defconfig
arm                            xcep_defconfig
mips                          ath79_defconfig
mips                           ip27_defconfig
powerpc                     sequoia_defconfig
mips                        bcm47xx_defconfig
sh                         ecovec24_defconfig
arm                          moxart_defconfig
arm                      footbridge_defconfig
powerpc                     kmeter1_defconfig
sh                           se7722_defconfig
mips                      malta_kvm_defconfig
powerpc                      ppc44x_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a004-20201104
i386                 randconfig-a006-20201104
i386                 randconfig-a005-20201104
i386                 randconfig-a001-20201104
i386                 randconfig-a002-20201104
i386                 randconfig-a003-20201104
i386                 randconfig-a004-20201105
i386                 randconfig-a006-20201105
i386                 randconfig-a005-20201105
i386                 randconfig-a001-20201105
i386                 randconfig-a002-20201105
i386                 randconfig-a003-20201105
x86_64               randconfig-a012-20201104
x86_64               randconfig-a015-20201104
x86_64               randconfig-a013-20201104
x86_64               randconfig-a011-20201104
x86_64               randconfig-a014-20201104
x86_64               randconfig-a016-20201104
x86_64               randconfig-a012-20201106
x86_64               randconfig-a011-20201106
x86_64               randconfig-a013-20201106
x86_64               randconfig-a014-20201106
x86_64               randconfig-a016-20201106
i386                 randconfig-a015-20201104
i386                 randconfig-a013-20201104
i386                 randconfig-a014-20201104
i386                 randconfig-a016-20201104
i386                 randconfig-a011-20201104
i386                 randconfig-a012-20201104
i386                 randconfig-a015-20201105
i386                 randconfig-a013-20201105
i386                 randconfig-a014-20201105
i386                 randconfig-a016-20201105
i386                 randconfig-a011-20201105
i386                 randconfig-a012-20201105
x86_64               randconfig-a004-20201105
x86_64               randconfig-a003-20201105
x86_64               randconfig-a005-20201105
x86_64               randconfig-a002-20201105
x86_64               randconfig-a006-20201105
x86_64               randconfig-a001-20201105
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201104
x86_64               randconfig-a003-20201104
x86_64               randconfig-a005-20201104
x86_64               randconfig-a002-20201104
x86_64               randconfig-a006-20201104
x86_64               randconfig-a001-20201104

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
