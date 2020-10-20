Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA93293440
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 07:24:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFhqx3csCzDqKH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 16:23:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFhks45gzzDqTb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 16:19:30 +1100 (AEDT)
IronPort-SDR: 0q0p08HreCL8Dkw1ZLkHqg3g9j2JI8J9l0ci+KHAW8HiYLLYFtl2hYwvRcaHqmBsVGdTmZJIre
 1c1jJj5VJDrw==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="147013531"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; d="scan'208";a="147013531"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2020 22:19:27 -0700
IronPort-SDR: uz27SmLWXqLLZRytUVIJ15jbigPwgX0a1HDLDrUYnY7QJZeaRh/qiwfLNhkOCfFaYdOS700lpp
 FHC3kPTCfPDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; d="scan'208";a="320523152"
Received: from lkp-server01.sh.intel.com (HELO 88424da292e0) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 19 Oct 2020 22:19:25 -0700
Received: from kbuild by 88424da292e0 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kUk3R-0000Pa-1f; Tue, 20 Oct 2020 05:19:25 +0000
Date: Tue, 20 Oct 2020 13:19:12 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 96b5a60d059984a2f0eaef90e97f59ac4a76bff4
Message-ID: <5f8e7350.GRgmplCr/L7O8Ito%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  merge
branch HEAD: 96b5a60d059984a2f0eaef90e97f59ac4a76bff4  Automatic merge of 'fixes' into merge (2020-10-19 23:20)

elapsed time: 998m

configs tested: 176
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
xtensa                    xip_kc705_defconfig
mips                            ar7_defconfig
arm                            mmp2_defconfig
powerpc                      ppc64e_defconfig
mips                        nlm_xlr_defconfig
mips                           ip27_defconfig
s390                             allyesconfig
arm                             rpc_defconfig
sh                        apsh4ad0a_defconfig
arc                           tb10x_defconfig
arm                        keystone_defconfig
arc                      axs103_smp_defconfig
powerpc                    socrates_defconfig
riscv                            alldefconfig
powerpc                mpc7448_hpc2_defconfig
arm                          ixp4xx_defconfig
microblaze                      mmu_defconfig
powerpc                      mgcoge_defconfig
arm                           spitz_defconfig
xtensa                  audio_kc705_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     kmeter1_defconfig
powerpc                     mpc5200_defconfig
arm                          pxa3xx_defconfig
sh                          landisk_defconfig
openrisc                    or1ksim_defconfig
arm                         nhk8815_defconfig
powerpc                 mpc834x_itx_defconfig
arm                     am200epdkit_defconfig
arm                         palmz72_defconfig
powerpc                      acadia_defconfig
arm                          collie_defconfig
nios2                         3c120_defconfig
mips                      malta_kvm_defconfig
arm                           sama5_defconfig
sh                            migor_defconfig
powerpc                      makalu_defconfig
powerpc                   bluestone_defconfig
arm                           corgi_defconfig
powerpc                      ep88xc_defconfig
sh                             sh03_defconfig
parisc                generic-32bit_defconfig
sh                     sh7710voipgw_defconfig
powerpc                      tqm8xx_defconfig
sh                               alldefconfig
m68k                          sun3x_defconfig
powerpc                       holly_defconfig
mips                       lemote2f_defconfig
sh                           se7751_defconfig
arm                          ep93xx_defconfig
arm                      integrator_defconfig
c6x                        evmc6457_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                     cu1000-neo_defconfig
mips                        bcm47xx_defconfig
mips                           ip32_defconfig
sh                           se7780_defconfig
mips                         tb0287_defconfig
arm                            hisi_defconfig
arm                          badge4_defconfig
h8300                            alldefconfig
arm                        spear6xx_defconfig
arm                          tango4_defconfig
arm                           efm32_defconfig
powerpc                    amigaone_defconfig
powerpc                     powernv_defconfig
sh                               j2_defconfig
mips                         tb0226_defconfig
mips                  cavium_octeon_defconfig
arm                       omap2plus_defconfig
sh                ecovec24-romimage_defconfig
arm                       cns3420vb_defconfig
m68k                       bvme6000_defconfig
arm                         s5pv210_defconfig
powerpc                         ps3_defconfig
arm                        mvebu_v7_defconfig
m68k                        mvme147_defconfig
sh                          rsk7269_defconfig
sh                           se7724_defconfig
sh                            shmin_defconfig
powerpc                      ppc40x_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                           se7750_defconfig
alpha                            alldefconfig
sh                          kfr2r09_defconfig
powerpc                     mpc512x_defconfig
arm                            zeus_defconfig
powerpc                      katmai_defconfig
mips                    maltaup_xpa_defconfig
arm                           tegra_defconfig
sh                          rsk7264_defconfig
powerpc                     skiroot_defconfig
arm                          lpd270_defconfig
sh                     magicpanelr2_defconfig
arm                    vt8500_v6_v7_defconfig
mips                        workpad_defconfig
mips                     loongson1b_defconfig
powerpc                   currituck_defconfig
powerpc                  iss476-smp_defconfig
arm                        spear3xx_defconfig
m68k                        m5407c3_defconfig
sh                           se7343_defconfig
arc                        nsimosci_defconfig
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
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201019
x86_64               randconfig-a002-20201019
x86_64               randconfig-a006-20201019
x86_64               randconfig-a003-20201019
x86_64               randconfig-a005-20201019
x86_64               randconfig-a001-20201019
i386                 randconfig-a006-20201019
i386                 randconfig-a005-20201019
i386                 randconfig-a001-20201019
i386                 randconfig-a003-20201019
i386                 randconfig-a004-20201019
i386                 randconfig-a002-20201019
i386                 randconfig-a015-20201019
i386                 randconfig-a013-20201019
i386                 randconfig-a016-20201019
i386                 randconfig-a012-20201019
i386                 randconfig-a011-20201019
i386                 randconfig-a014-20201019
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a016-20201019
x86_64               randconfig-a015-20201019
x86_64               randconfig-a012-20201019
x86_64               randconfig-a013-20201019
x86_64               randconfig-a011-20201019
x86_64               randconfig-a014-20201019

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
