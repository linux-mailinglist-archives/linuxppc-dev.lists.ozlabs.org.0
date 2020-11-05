Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E38522A7EFD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 13:50:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRjzz4SBVzDqtZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 23:50:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRjwh3XrhzDqX7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 23:47:46 +1100 (AEDT)
IronPort-SDR: /Tiy4GQgK/ewgSYxQezTrO9nEHn11mvn8JL8k5RSPhf5dQ3N3WPMd8s24fqXeCFSEb5OmWNp4p
 akow05L4WFZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="187282061"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="187282061"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 04:47:44 -0800
IronPort-SDR: Xylllogelpv2sHQXltJ1UkJS5SDJQ3lziCfkAzcxwqO8N8X4ELXC5nsAjM+rezPyfWl7hrPJ2+
 8H6aH48emHzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="354269996"
Received: from lkp-server02.sh.intel.com (HELO e61783667810) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 05 Nov 2020 04:47:43 -0800
Received: from kbuild by e61783667810 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kaeg3-0001Ms-23; Thu, 05 Nov 2020 12:47:43 +0000
Date: Thu, 05 Nov 2020 20:47:24 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 58b9041431fcf9f3f87c8def87ca82dd54cf80dd
Message-ID: <5fa3f45c.oZrticSNOlMIeW9z%lkp@intel.com>
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
branch HEAD: 58b9041431fcf9f3f87c8def87ca82dd54cf80dd  Automatic merge of 'fixes' into merge (2020-11-05 10:16)

elapsed time: 806m

configs tested: 180
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                        shmobile_defconfig
arm                        vexpress_defconfig
mips                          ath25_defconfig
arm                            u300_defconfig
sh                           se7751_defconfig
sh                         microdev_defconfig
c6x                              alldefconfig
sh                            migor_defconfig
arm                          pxa168_defconfig
arm                      integrator_defconfig
sh                        sh7785lcr_defconfig
sh                          rsk7269_defconfig
sh                   secureedge5410_defconfig
mips                        maltaup_defconfig
arm                      pxa255-idp_defconfig
arm                          tango4_defconfig
arm                  colibri_pxa300_defconfig
arm                         hackkit_defconfig
m68k                       m5208evb_defconfig
mips                             allmodconfig
parisc                           alldefconfig
powerpc               mpc834x_itxgp_defconfig
arm                           tegra_defconfig
mips                         cobalt_defconfig
openrisc                            defconfig
alpha                            allyesconfig
mips                         tb0226_defconfig
xtensa                              defconfig
powerpc                    sam440ep_defconfig
mips                         db1xxx_defconfig
arm                            pleb_defconfig
arm                        mvebu_v7_defconfig
arm                        spear3xx_defconfig
powerpc                 mpc834x_itx_defconfig
ia64                                defconfig
mips                       capcella_defconfig
mips                       rbtx49xx_defconfig
arc                              alldefconfig
um                            kunit_defconfig
powerpc                    ge_imp3a_defconfig
mips                     loongson1c_defconfig
arm                        multi_v5_defconfig
arc                              allyesconfig
powerpc                      cm5200_defconfig
arc                            hsdk_defconfig
mips                        jmr3927_defconfig
powerpc                      ppc6xx_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                       ppc64_defconfig
arm                         s5pv210_defconfig
xtensa                  audio_kc705_defconfig
arm                        magician_defconfig
m68k                            mac_defconfig
powerpc                      ppc44x_defconfig
powerpc                     mpc5200_defconfig
m68k                       m5475evb_defconfig
m68k                          atari_defconfig
sh                            titan_defconfig
powerpc                  storcenter_defconfig
i386                             allyesconfig
arm                        clps711x_defconfig
sh                        edosk7760_defconfig
parisc                generic-64bit_defconfig
powerpc                     tqm8555_defconfig
i386                             alldefconfig
sh                           se7722_defconfig
powerpc                       holly_defconfig
mips                        bcm47xx_defconfig
mips                            gpr_defconfig
mips                        workpad_defconfig
mips                      pic32mzda_defconfig
sh                               allmodconfig
m68k                          sun3x_defconfig
mips                   sb1250_swarm_defconfig
powerpc                     taishan_defconfig
arm                          ep93xx_defconfig
m68k                                defconfig
riscv                    nommu_virt_defconfig
powerpc                      katmai_defconfig
m68k                       bvme6000_defconfig
sh                     sh7710voipgw_defconfig
arm                         orion5x_defconfig
arm                     davinci_all_defconfig
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
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201105
x86_64               randconfig-a003-20201105
x86_64               randconfig-a005-20201105
x86_64               randconfig-a002-20201105
x86_64               randconfig-a006-20201105
x86_64               randconfig-a001-20201105
i386                 randconfig-a006-20201104
i386                 randconfig-a004-20201104
i386                 randconfig-a005-20201104
i386                 randconfig-a001-20201104
i386                 randconfig-a002-20201104
i386                 randconfig-a003-20201104
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
i386                 randconfig-a015-20201105
i386                 randconfig-a013-20201105
i386                 randconfig-a014-20201105
i386                 randconfig-a016-20201105
i386                 randconfig-a011-20201105
i386                 randconfig-a012-20201105
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
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
