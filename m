Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 687652A7DB6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 13:04:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRhxz28FDzDqCl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 23:03:51 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRhTZ3XM9zDqtV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 22:42:38 +1100 (AEDT)
IronPort-SDR: vYJElZZVs7isNPn+gIKmmtIuxfQyrLRuD5ZNSpOTTDYYldaUY/tkpBXP9nvKXAN+DxtdKDplgG
 B+OvcBohrJVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="233533607"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="233533607"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 03:42:21 -0800
IronPort-SDR: GqxdQaCH5F7EzHCq6/J07Y2eemZqcvxpvQJlS2lfJrEyJYltubVzRMk+2+t2QMj1TALk0OIVJ7
 P/zq8I454htQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="527936723"
Received: from lkp-server02.sh.intel.com (HELO e61783667810) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 05 Nov 2020 03:42:20 -0800
Received: from kbuild by e61783667810 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kadel-0001KY-Ol; Thu, 05 Nov 2020 11:42:19 +0000
Date: Thu, 05 Nov 2020 19:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 eeb96257fc7f7f820ad019b6e26d225aded059bf
Message-ID: <5fa3e4f1.5+3d1Usw6nFonMHT%lkp@intel.com>
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
branch HEAD: eeb96257fc7f7f820ad019b6e26d225aded059bf  powerpc/vdso: Provide __kernel_clock_gettime64() on vdso32

elapsed time: 1411m

configs tested: 200
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                      bmips_stb_defconfig
powerpc                  storcenter_defconfig
arm                      pxa255-idp_defconfig
sh                             shx3_defconfig
powerpc                      makalu_defconfig
sh                           se7206_defconfig
m68k                       bvme6000_defconfig
m68k                           sun3_defconfig
h8300                               defconfig
arm                        shmobile_defconfig
sh                           se7751_defconfig
arm                        vexpress_defconfig
mips                          ath25_defconfig
arm                            u300_defconfig
powerpc                  mpc885_ads_defconfig
mips                  maltasmvp_eva_defconfig
sh                   secureedge5410_defconfig
powerpc                 canyonlands_defconfig
xtensa                              defconfig
microblaze                    nommu_defconfig
arm                           efm32_defconfig
arm                     davinci_all_defconfig
riscv                    nommu_k210_defconfig
sh                               alldefconfig
arm                          prima2_defconfig
powerpc                        fsp2_defconfig
sh                          rsk7269_defconfig
mips                        maltaup_defconfig
arm                          tango4_defconfig
parisc                           alldefconfig
powerpc               mpc834x_itxgp_defconfig
arm                           tegra_defconfig
mips                         cobalt_defconfig
s390                       zfcpdump_defconfig
powerpc                 mpc834x_itx_defconfig
ia64                                defconfig
m68k                       m5249evb_defconfig
arm                          pxa910_defconfig
openrisc                            defconfig
mips                         tb0226_defconfig
alpha                            allyesconfig
powerpc                    sam440ep_defconfig
mips                         db1xxx_defconfig
arm                            pleb_defconfig
arm                        mvebu_v7_defconfig
sh                        sh7785lcr_defconfig
arm                        spear3xx_defconfig
mips                       capcella_defconfig
mips                       rbtx49xx_defconfig
arc                              alldefconfig
um                            kunit_defconfig
powerpc                      cm5200_defconfig
arc                            hsdk_defconfig
mips                        jmr3927_defconfig
powerpc                      ppc6xx_defconfig
arm                      integrator_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                      tqm8xx_defconfig
mips                     cu1000-neo_defconfig
mips                           xway_defconfig
arm                          exynos_defconfig
mips                          ath79_defconfig
powerpc                     mpc5200_defconfig
m68k                       m5475evb_defconfig
m68k                          atari_defconfig
sh                            titan_defconfig
sh                          landisk_defconfig
m68k                          amiga_defconfig
arm                            mmp2_defconfig
arm                        clps711x_defconfig
sh                        edosk7760_defconfig
parisc                generic-64bit_defconfig
powerpc                     tqm8555_defconfig
i386                             allyesconfig
sh                ecovec24-romimage_defconfig
mips                malta_qemu_32r6_defconfig
arm                          ep93xx_defconfig
i386                             alldefconfig
sh                           se7722_defconfig
powerpc                       holly_defconfig
mips                        bcm47xx_defconfig
mips                            gpr_defconfig
m68k                          hp300_defconfig
openrisc                         alldefconfig
mips                          malta_defconfig
arc                          axs103_defconfig
powerpc                      chrp32_defconfig
mips                  decstation_64_defconfig
ia64                      gensparse_defconfig
riscv                          rv32_defconfig
powerpc                     kilauea_defconfig
mips                        nlm_xlp_defconfig
mips                         tb0287_defconfig
sh                         ap325rxa_defconfig
powerpc                     stx_gp3_defconfig
sh                     magicpanelr2_defconfig
powerpc                     taishan_defconfig
riscv                    nommu_virt_defconfig
powerpc                      katmai_defconfig
sh                     sh7710voipgw_defconfig
arm                         orion5x_defconfig
sh                   sh7724_generic_defconfig
powerpc                    klondike_defconfig
mips                       lemote2f_defconfig
riscv                            allmodconfig
mips                            ar7_defconfig
powerpc                        cell_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                  iss476-smp_defconfig
arm                          moxart_defconfig
m68k                             allmodconfig
arc                           tb10x_defconfig
ia64                        generic_defconfig
arm                         mv78xx0_defconfig
sh                            shmin_defconfig
m68k                          multi_defconfig
arm                          gemini_defconfig
powerpc                     asp8347_defconfig
powerpc                      ppc64e_defconfig
powerpc                     tqm8548_defconfig
powerpc                     ksi8560_defconfig
arc                     nsimosci_hs_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
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
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
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
x86_64               randconfig-a004-20201105
x86_64               randconfig-a003-20201105
x86_64               randconfig-a005-20201105
x86_64               randconfig-a002-20201105
x86_64               randconfig-a006-20201105
x86_64               randconfig-a001-20201105
x86_64               randconfig-a012-20201104
x86_64               randconfig-a015-20201104
x86_64               randconfig-a013-20201104
x86_64               randconfig-a011-20201104
x86_64               randconfig-a014-20201104
x86_64               randconfig-a016-20201104
i386                 randconfig-a015-20201104
i386                 randconfig-a013-20201104
i386                 randconfig-a014-20201104
i386                 randconfig-a016-20201104
i386                 randconfig-a011-20201104
i386                 randconfig-a012-20201104
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
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
