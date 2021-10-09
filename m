Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 364CF427913
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 12:43:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HRM9F0Vszz3c9q
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 21:43:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HRM8l2W0pz2xKY
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 21:42:56 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="206771455"
X-IronPort-AV: E=Sophos;i="5.85,360,1624345200"; d="scan'208";a="206771455"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2021 03:41:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,360,1624345200"; d="scan'208";a="658084638"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 09 Oct 2021 03:41:47 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mZ9nW-000090-0m; Sat, 09 Oct 2021 10:41:46 +0000
Date: Sat, 09 Oct 2021 18:41:33 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 83467bc737d9f37f076f208ccdcd929a96d86dcc
Message-ID: <616171dd.WpWiCxpfhHYNMAbk%lkp@intel.com>
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
branch HEAD: 83467bc737d9f37f076f208ccdcd929a96d86dcc  Automatic merge of 'fixes' into merge (2021-10-09 00:21)

elapsed time: 1230m

configs tested: 192
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211009
sh                           se7206_defconfig
sh                   sh7724_generic_defconfig
powerpc                      pasemi_defconfig
x86_64                              defconfig
arm                        cerfcube_defconfig
powerpc                  mpc866_ads_defconfig
arm                         bcm2835_defconfig
powerpc                      cm5200_defconfig
microblaze                      mmu_defconfig
m68k                          amiga_defconfig
arm                        realview_defconfig
mips                      loongson3_defconfig
arm                         axm55xx_defconfig
arm                           stm32_defconfig
powerpc                     pseries_defconfig
xtensa                           alldefconfig
arm                          moxart_defconfig
sh                           se7724_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                       cns3420vb_defconfig
mips                           rs90_defconfig
xtensa                              defconfig
sh                        sh7763rdp_defconfig
powerpc                     mpc83xx_defconfig
sh                      rts7751r2d1_defconfig
m68k                          atari_defconfig
arm                             mxs_defconfig
arc                         haps_hs_defconfig
sh                   sh7770_generic_defconfig
arm                        mvebu_v7_defconfig
powerpc                      tqm8xx_defconfig
powerpc                 mpc8560_ads_defconfig
sh                            titan_defconfig
sh                             espt_defconfig
arm                      jornada720_defconfig
powerpc                  mpc885_ads_defconfig
arm                       imx_v4_v5_defconfig
mips                         mpc30x_defconfig
arm                          collie_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                    socrates_defconfig
arm                          pcm027_defconfig
mips                     loongson1b_defconfig
arm64                            alldefconfig
mips                    maltaup_xpa_defconfig
riscv                             allnoconfig
arm                          ixp4xx_defconfig
powerpc                      mgcoge_defconfig
mips                           mtx1_defconfig
sh                           se7712_defconfig
sh                   secureedge5410_defconfig
sh                          rsk7264_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                          g5_defconfig
arm                        keystone_defconfig
riscv                               defconfig
arm                        vexpress_defconfig
powerpc                      ppc40x_defconfig
um                                  defconfig
mips                           ip22_defconfig
mips                   sb1250_swarm_defconfig
arm                       versatile_defconfig
powerpc                 mpc836x_mds_defconfig
arm                          gemini_defconfig
m68k                            q40_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                               j2_defconfig
sh                            shmin_defconfig
sh                           se7619_defconfig
sh                           se7721_defconfig
powerpc                 mpc85xx_cds_defconfig
m68k                        m5307c3_defconfig
arm                   milbeaut_m10v_defconfig
arm                  colibri_pxa270_defconfig
arm                            mps2_defconfig
sh                          lboxre2_defconfig
arm                     davinci_all_defconfig
arm                            dove_defconfig
powerpc                  iss476-smp_defconfig
mips                           xway_defconfig
m68k                          multi_defconfig
x86_64               randconfig-c001-20211008
i386                 randconfig-c001-20211008
arm                  randconfig-c002-20211008
x86_64               randconfig-c001-20211009
arm                  randconfig-c002-20211009
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
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
s390                                defconfig
parisc                           allyesconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
x86_64               randconfig-a003-20211009
x86_64               randconfig-a005-20211009
x86_64               randconfig-a001-20211009
x86_64               randconfig-a002-20211009
x86_64               randconfig-a004-20211009
x86_64               randconfig-a006-20211009
i386                 randconfig-a001-20211009
i386                 randconfig-a003-20211009
i386                 randconfig-a005-20211009
i386                 randconfig-a004-20211009
i386                 randconfig-a002-20211009
i386                 randconfig-a006-20211009
x86_64               randconfig-a015-20211008
x86_64               randconfig-a012-20211008
x86_64               randconfig-a016-20211008
x86_64               randconfig-a013-20211008
x86_64               randconfig-a011-20211008
x86_64               randconfig-a014-20211008
i386                 randconfig-a013-20211008
i386                 randconfig-a016-20211008
i386                 randconfig-a014-20211008
i386                 randconfig-a011-20211008
i386                 randconfig-a012-20211008
i386                 randconfig-a015-20211008
arc                  randconfig-r043-20211008
s390                 randconfig-r044-20211008
riscv                randconfig-r042-20211008
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20211008
x86_64               randconfig-a005-20211008
x86_64               randconfig-a001-20211008
x86_64               randconfig-a002-20211008
x86_64               randconfig-a004-20211008
x86_64               randconfig-a006-20211008
i386                 randconfig-a001-20211008
i386                 randconfig-a003-20211008
i386                 randconfig-a005-20211008
i386                 randconfig-a004-20211008
i386                 randconfig-a002-20211008
i386                 randconfig-a006-20211008
x86_64               randconfig-a015-20211009
x86_64               randconfig-a012-20211009
x86_64               randconfig-a016-20211009
x86_64               randconfig-a013-20211009
x86_64               randconfig-a011-20211009
x86_64               randconfig-a014-20211009
i386                 randconfig-a013-20211009
i386                 randconfig-a016-20211009
i386                 randconfig-a014-20211009
i386                 randconfig-a012-20211009
i386                 randconfig-a011-20211009
i386                 randconfig-a015-20211009
hexagon              randconfig-r045-20211009
hexagon              randconfig-r041-20211009
s390                 randconfig-r044-20211009
riscv                randconfig-r042-20211009
hexagon              randconfig-r045-20211008
hexagon              randconfig-r041-20211008

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
