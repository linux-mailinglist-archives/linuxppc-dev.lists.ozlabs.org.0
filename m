Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAC129343C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 07:21:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFhnC4l4TzDqTw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 16:21:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFhks35QtzDqTQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 16:19:31 +1100 (AEDT)
IronPort-SDR: iJqtL8ul9Qx19clhWYSneXFJTC4MBNohu875sNAFOae+EsnOwneaTGb4eyN0GRs1tL3lJIUhAe
 auOmCMBfIHhQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="231352580"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; d="scan'208";a="231352580"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2020 22:19:27 -0700
IronPort-SDR: ePseumoaJrcJWOjiz5Xr2QreeR4pVx9Zf6VukmxVXJtOy6JPW+vcGzImu+ByNnmOs1ikha1hVl
 eWrAH9/ompeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; d="scan'208";a="301620594"
Received: from lkp-server01.sh.intel.com (HELO 88424da292e0) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 19 Oct 2020 22:19:26 -0700
Received: from kbuild by 88424da292e0 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kUk3R-0000Pg-G5; Tue, 20 Oct 2020 05:19:25 +0000
Date: Tue, 20 Oct 2020 13:19:15 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 c9818c0abfb0c3500684bb2bc75981123d63134d
Message-ID: <5f8e7353.QcADpqjlnakhzCpp%lkp@intel.com>
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
branch HEAD: c9818c0abfb0c3500684bb2bc75981123d63134d  powerpc/64s: Convert some cpu_setup() and cpu_restore() functions to C

elapsed time: 997m

configs tested: 209
configs skipped: 3

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
nds32                            alldefconfig
c6x                        evmc6457_defconfig
powerpc                     redwood_defconfig
parisc                generic-32bit_defconfig
arm                     am200epdkit_defconfig
mips                           ip27_defconfig
s390                             allyesconfig
arm                             rpc_defconfig
sh                        apsh4ad0a_defconfig
arc                           tb10x_defconfig
arm                        keystone_defconfig
mips                malta_qemu_32r6_defconfig
m68k                             allmodconfig
mips                  decstation_64_defconfig
powerpc                 mpc837x_mds_defconfig
riscv                    nommu_virt_defconfig
m68k                       m5475evb_defconfig
powerpc                          g5_defconfig
csky                             alldefconfig
powerpc                       eiger_defconfig
powerpc                     tqm8540_defconfig
arm                        neponset_defconfig
powerpc                      mgcoge_defconfig
arm                           spitz_defconfig
xtensa                  audio_kc705_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     kmeter1_defconfig
nios2                               defconfig
powerpc                     mpc5200_defconfig
arm                          pxa3xx_defconfig
sh                          landisk_defconfig
openrisc                    or1ksim_defconfig
arm                         nhk8815_defconfig
powerpc                 mpc834x_itx_defconfig
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
sh                     sh7710voipgw_defconfig
powerpc                      tqm8xx_defconfig
sh                               alldefconfig
m68k                          sun3x_defconfig
powerpc                       holly_defconfig
mips                       lemote2f_defconfig
mips                           ip28_defconfig
sh                 kfr2r09-romimage_defconfig
arm                          lpd270_defconfig
sh                           se7751_defconfig
arm                          ep93xx_defconfig
arm                      integrator_defconfig
sh                         ap325rxa_defconfig
arm                          moxart_defconfig
powerpc                      pasemi_defconfig
um                             i386_defconfig
mips                            e55_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                     cu1000-neo_defconfig
mips                        bcm47xx_defconfig
mips                           ip32_defconfig
sh                           se7780_defconfig
mips                         tb0287_defconfig
arm                            hisi_defconfig
arm                          badge4_defconfig
h8300                            alldefconfig
alpha                            alldefconfig
arm                          pcm027_defconfig
sh                            shmin_defconfig
arm                           sunxi_defconfig
sparc                               defconfig
arm                        realview_defconfig
mips                         tb0226_defconfig
sh                             shx3_defconfig
arm                           efm32_defconfig
powerpc                    amigaone_defconfig
powerpc                     powernv_defconfig
sh                               j2_defconfig
mips                  cavium_octeon_defconfig
arm                       omap2plus_defconfig
sh                ecovec24-romimage_defconfig
arm                       cns3420vb_defconfig
m68k                       bvme6000_defconfig
arm                         s5pv210_defconfig
powerpc                         ps3_defconfig
sh                          rsk7269_defconfig
arm                        mvebu_v7_defconfig
m68k                        mvme147_defconfig
arc                              allyesconfig
sh                           se7724_defconfig
powerpc                      ppc40x_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                           se7750_defconfig
sh                          kfr2r09_defconfig
powerpc                     mpc512x_defconfig
powerpc                    socrates_defconfig
c6x                        evmc6678_defconfig
powerpc                     skiroot_defconfig
arm                            zeus_defconfig
powerpc                      katmai_defconfig
mips                    maltaup_xpa_defconfig
arm                           tegra_defconfig
powerpc                  mpc866_ads_defconfig
mips                        nlm_xlp_defconfig
sh                          rsk7264_defconfig
sh                     magicpanelr2_defconfig
powerpc                 mpc8272_ads_defconfig
sh                          sdk7786_defconfig
arm                        oxnas_v6_defconfig
arc                     nsimosci_hs_defconfig
arm                    vt8500_v6_v7_defconfig
mips                        workpad_defconfig
mips                     loongson1b_defconfig
h8300                     edosk2674_defconfig
powerpc                   currituck_defconfig
powerpc                  iss476-smp_defconfig
arm                        spear3xx_defconfig
arm                  colibri_pxa300_defconfig
powerpc                    ge_imp3a_defconfig
mips                             allmodconfig
mips                         mpc30x_defconfig
alpha                               defconfig
mips                         tb0219_defconfig
sh                          urquell_defconfig
nios2                         10m50_defconfig
sparc64                             defconfig
arm                           omap1_defconfig
mips                        vocore2_defconfig
sh                        edosk7705_defconfig
m68k                        m5407c3_defconfig
sh                           se7343_defconfig
arc                        nsimosci_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
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
