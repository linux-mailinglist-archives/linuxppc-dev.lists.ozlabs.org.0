Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E071C2AAE96
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 01:48:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CTsmC0l44zDqjN
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 11:47:55 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CTsjq6D6ZzDqWY
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Nov 2020 11:45:47 +1100 (AEDT)
IronPort-SDR: CA0+k2HPy4Xp3yj8nTj6I96A/ajUegr94L5ivJ47uA9PDpScSHuI9SDFCqumZg/b1yOA05cLhq
 RmDMsxPS4ibQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="187678588"
X-IronPort-AV: E=Sophos;i="5.77,462,1596524400"; d="scan'208";a="187678588"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2020 16:45:43 -0800
IronPort-SDR: UZj762EMZBZnNYkOpX0fWMqC/mFUK9anu2A796KmWjRnR+SXpJtTKkQqtNoZcn2nLDYLTmJSox
 9g37aAHrc7xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,462,1596524400"; d="scan'208";a="327077314"
Received: from lkp-server02.sh.intel.com (HELO defa7f6e4f65) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 08 Nov 2020 16:45:41 -0800
Received: from kbuild by defa7f6e4f65 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kbvJU-000015-M3; Mon, 09 Nov 2020 00:45:40 +0000
Date: Mon, 09 Nov 2020 08:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 33fe43cfd9b1c20f6f9899b44bf04e91823ff1c9
Message-ID: <5fa8912b.7raF7ySGbunbZG+F%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  fixes-test
branch HEAD: 33fe43cfd9b1c20f6f9899b44bf04e91823ff1c9  powerpc/8xx: Manage _PAGE_ACCESSED through APG bits in L1 entry

elapsed time: 4486m

configs tested: 152
configs skipped: 87

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
sh                           se7724_defconfig
ia64                        generic_defconfig
mips                       capcella_defconfig
openrisc                 simple_smp_defconfig
mips                           ip27_defconfig
powerpc                     sequoia_defconfig
mips                        bcm47xx_defconfig
sh                         ecovec24_defconfig
arm                          moxart_defconfig
arm                      footbridge_defconfig
arm                  colibri_pxa270_defconfig
powerpc                     kmeter1_defconfig
sh                           se7722_defconfig
mips                      malta_kvm_defconfig
mips                       lemote2f_defconfig
powerpc                      ppc44x_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
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
s390                             allyesconfig
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
i386                 randconfig-a015-20201105
i386                 randconfig-a013-20201105
i386                 randconfig-a014-20201105
i386                 randconfig-a016-20201105
i386                 randconfig-a011-20201105
i386                 randconfig-a012-20201105
i386                 randconfig-a015-20201104
i386                 randconfig-a013-20201104
i386                 randconfig-a014-20201104
i386                 randconfig-a016-20201104
i386                 randconfig-a011-20201104
i386                 randconfig-a012-20201104
x86_64               randconfig-a004-20201105
x86_64               randconfig-a003-20201105
x86_64               randconfig-a005-20201105
x86_64               randconfig-a002-20201105
x86_64               randconfig-a006-20201105
x86_64               randconfig-a001-20201105
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
x86_64               randconfig-a004-20201104
x86_64               randconfig-a003-20201104
x86_64               randconfig-a005-20201104
x86_64               randconfig-a002-20201104
x86_64               randconfig-a006-20201104
x86_64               randconfig-a001-20201104

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
