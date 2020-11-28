Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 160462C6E22
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 02:24:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjYg72lYWzF0Rs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 12:24:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjYd425gnzDsM9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 12:22:15 +1100 (AEDT)
IronPort-SDR: X7CYz31vD0EJbS8+L6FwVGXUrI7xwGJUM/aSVYQHNNphqqHx0zzz5BO6kDbBRPnQzizQDam59h
 AD3aS6adKU4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="172601918"
X-IronPort-AV: E=Sophos;i="5.78,376,1599548400"; d="scan'208";a="172601918"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 17:22:11 -0800
IronPort-SDR: QAmUKQvLYemror6gLB033VRmB4VjeuLOLx6tztR3W6wSsnOJLUc0ejqhQ6GgRGb58bLTYiqe3q
 o8JM+H4i0LOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,376,1599548400"; d="scan'208";a="536194641"
Received: from lkp-server01.sh.intel.com (HELO b5888d13d5a5) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 27 Nov 2020 17:22:10 -0800
Received: from kbuild by b5888d13d5a5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kiowD-0000ER-E9; Sat, 28 Nov 2020 01:22:09 +0000
Date: Sat, 28 Nov 2020 09:21:16 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 278f4532318c176ef8a22a78f45a8c8a30abe40b
Message-ID: <5fc1a60c.5sBX3JJnHhtNCMh1%lkp@intel.com>
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
branch HEAD: 278f4532318c176ef8a22a78f45a8c8a30abe40b  powerpc/vdso: Cleanup vdso.h

elapsed time: 783m

configs tested: 154
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                           efm32_defconfig
powerpc                    sam440ep_defconfig
m68k                       m5475evb_defconfig
xtensa                    smp_lx200_defconfig
arm                         mv78xx0_defconfig
powerpc                      ppc6xx_defconfig
powerpc                       eiger_defconfig
parisc                           allyesconfig
mips                        workpad_defconfig
powerpc                      arches_defconfig
mips                            gpr_defconfig
m68k                           sun3_defconfig
nds32                             allnoconfig
sh                           se7206_defconfig
arm                         lpc18xx_defconfig
arm                        keystone_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          imote2_defconfig
arm                            qcom_defconfig
m68k                          atari_defconfig
arm                           omap1_defconfig
mips                      pistachio_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                     loongson1c_defconfig
alpha                               defconfig
arm                         s3c2410_defconfig
powerpc                        cell_defconfig
sh                   rts7751r2dplus_defconfig
xtensa                  cadence_csp_defconfig
arm                       aspeed_g5_defconfig
arc                        nsim_700_defconfig
arm                            xcep_defconfig
powerpc                     skiroot_defconfig
m68k                        m5407c3_defconfig
mips                     cu1000-neo_defconfig
x86_64                           alldefconfig
nds32                               defconfig
powerpc                      ppc40x_defconfig
arm                            dove_defconfig
arm                      jornada720_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                     akebono_defconfig
arm                         socfpga_defconfig
riscv                            allyesconfig
arm                         cm_x300_defconfig
mips                          malta_defconfig
arm                          pxa168_defconfig
openrisc                 simple_smp_defconfig
powerpc                 mpc834x_itx_defconfig
sh                          polaris_defconfig
arm                            pleb_defconfig
powerpc                 mpc834x_mds_defconfig
arm                          simpad_defconfig
s390                       zfcpdump_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                            hisi_defconfig
sh                           sh2007_defconfig
powerpc                     mpc512x_defconfig
mips                      malta_kvm_defconfig
c6x                         dsk6455_defconfig
arm                           h5000_defconfig
powerpc                     ppa8548_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                      tqm8xx_defconfig
mips                           ip27_defconfig
powerpc64                           defconfig
arm                          ep93xx_defconfig
mips                          ath25_defconfig
microblaze                      mmu_defconfig
mips                         rt305x_defconfig
sh                             sh03_defconfig
sparc64                             defconfig
arm                  colibri_pxa300_defconfig
arm                           corgi_defconfig
sh                          kfr2r09_defconfig
sh                          sdk7786_defconfig
mips                           ip22_defconfig
sh                           se7722_defconfig
powerpc                 linkstation_defconfig
arm                        oxnas_v6_defconfig
riscv                          rv32_defconfig
sh                          rsk7201_defconfig
h8300                       h8s-sim_defconfig
arm                          pxa3xx_defconfig
ia64                             alldefconfig
sh                           se7721_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
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
i386                 randconfig-a004-20201127
i386                 randconfig-a003-20201127
i386                 randconfig-a002-20201127
i386                 randconfig-a005-20201127
i386                 randconfig-a001-20201127
i386                 randconfig-a006-20201127
x86_64               randconfig-a015-20201127
x86_64               randconfig-a011-20201127
x86_64               randconfig-a014-20201127
x86_64               randconfig-a016-20201127
x86_64               randconfig-a012-20201127
x86_64               randconfig-a013-20201127
i386                 randconfig-a012-20201127
i386                 randconfig-a013-20201127
i386                 randconfig-a011-20201127
i386                 randconfig-a016-20201127
i386                 randconfig-a014-20201127
i386                 randconfig-a015-20201127
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20201127
x86_64               randconfig-a003-20201127
x86_64               randconfig-a004-20201127
x86_64               randconfig-a005-20201127
x86_64               randconfig-a002-20201127
x86_64               randconfig-a001-20201127

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
