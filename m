Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E05552A37AF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 01:23:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQ9Vx5W9mzDqSd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 11:23:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQ9TF1FFczDqQQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 11:22:06 +1100 (AEDT)
IronPort-SDR: JTFvEH2+IhZtscgemuhXC8Hg6X1+QsiLrT1diSAz+qHGQMXYoTzdCoJiEHOnDp1s4pEv2lGRYR
 gKW1hcigttaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="148255822"
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; d="scan'208";a="148255822"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2020 16:22:03 -0800
IronPort-SDR: gk0TcGKeNNJLV8rtYvYbKh1sm2HxnME6Tkh9dVylH7TyEkiGKR4I/YcykJtdPzxEA+9gHbxLpi
 BW1eAeVGQV+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; d="scan'208";a="357496533"
Received: from lkp-server02.sh.intel.com (HELO 9353403cd79d) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 02 Nov 2020 16:22:02 -0800
Received: from kbuild by 9353403cd79d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kZk5J-0000F4-VJ; Tue, 03 Nov 2020 00:22:01 +0000
Date: Tue, 03 Nov 2020 08:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 2d83b0f30c1483a556c8aa1f7d891006fffcd5e0
Message-ID: <5fa0a285.FY9PDbmCmZ6PNJje%lkp@intel.com>
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
branch HEAD: 2d83b0f30c1483a556c8aa1f7d891006fffcd5e0  powerpc: Avoid broken GCC __attribute__((optimize))

elapsed time: 1338m

configs tested: 209
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                              allmodconfig
c6x                        evmc6457_defconfig
arm                       imx_v6_v7_defconfig
powerpc                      cm5200_defconfig
arm                        magician_defconfig
powerpc                     skiroot_defconfig
sh                        sh7757lcr_defconfig
powerpc                    adder875_defconfig
mips                         bigsur_defconfig
mips                           rs90_defconfig
powerpc                       holly_defconfig
arm                        trizeps4_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                    amigaone_defconfig
arm                        spear6xx_defconfig
arm                            mmp2_defconfig
ia64                        generic_defconfig
mips                    maltaup_xpa_defconfig
sh                          rsk7269_defconfig
arm                      tct_hammer_defconfig
arm                            xcep_defconfig
sh                   rts7751r2dplus_defconfig
mips                      maltasmvp_defconfig
nios2                         10m50_defconfig
sh                           se7712_defconfig
mips                         mpc30x_defconfig
powerpc                   currituck_defconfig
sh                           se7750_defconfig
arm                         at91_dt_defconfig
arm                              zx_defconfig
sh                           se7343_defconfig
sh                            hp6xx_defconfig
powerpc                      makalu_defconfig
powerpc                       maple_defconfig
mips                           ip28_defconfig
arm                         lpc18xx_defconfig
c6x                         dsk6455_defconfig
powerpc                     kilauea_defconfig
arc                          axs101_defconfig
arc                        vdk_hs38_defconfig
arm                           omap1_defconfig
arm                         lpc32xx_defconfig
mips                      fuloong2e_defconfig
arm                        mvebu_v5_defconfig
powerpc                      ppc6xx_defconfig
m68k                        mvme16x_defconfig
mips                        bcm47xx_defconfig
mips                            gpr_defconfig
powerpc                 mpc837x_mds_defconfig
alpha                               defconfig
ia64                             allyesconfig
riscv                    nommu_k210_defconfig
powerpc                 mpc832x_rdb_defconfig
c6x                                 defconfig
arm                        oxnas_v6_defconfig
arm                     davinci_all_defconfig
mips                     decstation_defconfig
powerpc                 mpc8315_rdb_defconfig
parisc                generic-64bit_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                              ul2_defconfig
mips                      maltaaprp_defconfig
arc                            hsdk_defconfig
m68k                          sun3x_defconfig
powerpc                     tqm8548_defconfig
um                            kunit_defconfig
arc                     haps_hs_smp_defconfig
m68k                       bvme6000_defconfig
arm                         vf610m4_defconfig
arm                         mv78xx0_defconfig
powerpc                      ppc40x_defconfig
sh                          sdk7780_defconfig
powerpc                       eiger_defconfig
m68k                          multi_defconfig
arm                         socfpga_defconfig
riscv                            allyesconfig
arm                          badge4_defconfig
arm                           sunxi_defconfig
xtensa                generic_kc705_defconfig
powerpc                      obs600_defconfig
sh                   sh7770_generic_defconfig
powerpc                      arches_defconfig
sh                            migor_defconfig
arm                          pxa168_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                      ppc44x_defconfig
i386                             alldefconfig
powerpc                 mpc8560_ads_defconfig
arm                          iop32x_defconfig
mips                malta_kvm_guest_defconfig
mips                        jmr3927_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                        cell_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                        keystone_defconfig
riscv                          rv32_defconfig
powerpc                     tqm8541_defconfig
sh                ecovec24-romimage_defconfig
arm                        multi_v5_defconfig
powerpc                     tqm5200_defconfig
powerpc                   lite5200b_defconfig
m68k                        mvme147_defconfig
h8300                     edosk2674_defconfig
sh                           sh2007_defconfig
ia64                             alldefconfig
mips                         cobalt_defconfig
microblaze                    nommu_defconfig
arm                          gemini_defconfig
sparc                       sparc32_defconfig
powerpc                           allnoconfig
arm                       aspeed_g4_defconfig
arm                       imx_v4_v5_defconfig
sh                          rsk7264_defconfig
arm                       versatile_defconfig
sh                            titan_defconfig
arm                             rpc_defconfig
c6x                              alldefconfig
powerpc                      pmac32_defconfig
powerpc                     ksi8560_defconfig
powerpc                        icon_defconfig
arm                          pxa3xx_defconfig
arm                       cns3420vb_defconfig
arm                  colibri_pxa270_defconfig
ia64                             allmodconfig
ia64                                defconfig
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
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
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
x86_64               randconfig-a004-20201101
x86_64               randconfig-a003-20201101
x86_64               randconfig-a005-20201101
x86_64               randconfig-a002-20201101
x86_64               randconfig-a006-20201101
x86_64               randconfig-a001-20201101
i386                 randconfig-a004-20201102
i386                 randconfig-a006-20201102
i386                 randconfig-a005-20201102
i386                 randconfig-a001-20201102
i386                 randconfig-a002-20201102
i386                 randconfig-a003-20201102
i386                 randconfig-a004-20201101
i386                 randconfig-a006-20201101
i386                 randconfig-a005-20201101
i386                 randconfig-a001-20201101
i386                 randconfig-a002-20201101
i386                 randconfig-a003-20201101
x86_64               randconfig-a012-20201102
x86_64               randconfig-a015-20201102
x86_64               randconfig-a011-20201102
x86_64               randconfig-a013-20201102
x86_64               randconfig-a014-20201102
x86_64               randconfig-a016-20201102
i386                 randconfig-a013-20201102
i386                 randconfig-a015-20201102
i386                 randconfig-a014-20201102
i386                 randconfig-a016-20201102
i386                 randconfig-a011-20201102
i386                 randconfig-a012-20201102
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
x86_64               randconfig-a004-20201102
x86_64               randconfig-a005-20201102
x86_64               randconfig-a003-20201102
x86_64               randconfig-a002-20201102
x86_64               randconfig-a006-20201102
x86_64               randconfig-a001-20201102
x86_64               randconfig-a012-20201101
x86_64               randconfig-a015-20201101
x86_64               randconfig-a013-20201101
x86_64               randconfig-a011-20201101
x86_64               randconfig-a014-20201101
x86_64               randconfig-a016-20201101

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
