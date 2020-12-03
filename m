Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F872CCCC2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 03:46:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmgFR4QQ4zDrRP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 13:46:03 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmftT56kCzDsNh
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 13:29:37 +1100 (AEDT)
IronPort-SDR: /5DsY3r72hGA5oX652BKjdkm5Z7IgS3YbKzQMSbSlagokXOpdZIiSmUB0/caAAhry9OSgoEdvq
 NMO9QnBVjGlQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="152949278"
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; d="scan'208";a="152949278"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 18:29:33 -0800
IronPort-SDR: QjgKzw6GyfSokO1qh+0SmxH47NpksOZsbiTegtT5ZGEGS9zCn5e7LKqbQewJamtYV8oC7DNaps
 uUwj6hY3P4Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; d="scan'208";a="365562152"
Received: from lkp-server01.sh.intel.com (HELO 54133fc185c3) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 02 Dec 2020 18:29:32 -0800
Received: from kbuild by 54133fc185c3 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kkeN9-0000TB-Ei; Thu, 03 Dec 2020 02:29:31 +0000
Date: Thu, 03 Dec 2020 10:28:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS a1aeabd25a36d9e019381278e543e2d538dd44a7
Message-ID: <5fc84d52.9Wf0MxKXTgMN/QRY%lkp@intel.com>
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
branch HEAD: a1aeabd25a36d9e019381278e543e2d538dd44a7  Automatic merge of 'fixes' into merge (2020-12-02 22:37)

elapsed time: 734m

configs tested: 151
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                        clps711x_defconfig
arm                        shmobile_defconfig
powerpc64                        alldefconfig
mips                 decstation_r4k_defconfig
nios2                         3c120_defconfig
mips                         bigsur_defconfig
mips                malta_qemu_32r6_defconfig
mips                         mpc30x_defconfig
microblaze                      mmu_defconfig
sh                     sh7710voipgw_defconfig
powerpc                     redwood_defconfig
parisc                           alldefconfig
mips                      pic32mzda_defconfig
powerpc                     skiroot_defconfig
sh                          rsk7264_defconfig
powerpc                        fsp2_defconfig
sh                             shx3_defconfig
sh                        sh7785lcr_defconfig
powerpc                      ep88xc_defconfig
powerpc                     sbc8548_defconfig
arm                        mini2440_defconfig
sh                        apsh4ad0a_defconfig
h8300                               defconfig
powerpc                 mpc836x_mds_defconfig
sh                            titan_defconfig
csky                             alldefconfig
m68k                          sun3x_defconfig
arm                          ep93xx_defconfig
sh                           se7724_defconfig
powerpc                     powernv_defconfig
powerpc                      walnut_defconfig
arm                         s3c6400_defconfig
arm                       aspeed_g5_defconfig
sparc                       sparc32_defconfig
mips                         tb0287_defconfig
m68k                          hp300_defconfig
mips                     cu1830-neo_defconfig
sh                           se7343_defconfig
arm                            u300_defconfig
m68k                             alldefconfig
arm                        spear6xx_defconfig
arm                         assabet_defconfig
sh                              ul2_defconfig
xtensa                  nommu_kc705_defconfig
nds32                             allnoconfig
arm                       versatile_defconfig
sh                            hp6xx_defconfig
arm                           sunxi_defconfig
powerpc                     mpc5200_defconfig
powerpc                 mpc8272_ads_defconfig
openrisc                            defconfig
powerpc                       holly_defconfig
arm                          prima2_defconfig
arc                           tb10x_defconfig
m68k                                defconfig
arm                        keystone_defconfig
mips                        nlm_xlr_defconfig
xtensa                              defconfig
powerpc                     stx_gp3_defconfig
arm                       cns3420vb_defconfig
arm                           omap1_defconfig
mips                       rbtx49xx_defconfig
arm                         s3c2410_defconfig
arm                         nhk8815_defconfig
mips                        maltaup_defconfig
mips                           ip32_defconfig
h8300                    h8300h-sim_defconfig
arm                  colibri_pxa300_defconfig
mips                      pistachio_defconfig
arm                       spear13xx_defconfig
mips                          ath79_defconfig
arm                           corgi_defconfig
powerpc                     ep8248e_defconfig
sh                   sh7770_generic_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                          landisk_defconfig
mips                     cu1000-neo_defconfig
arm                        mvebu_v5_defconfig
m68k                       m5275evb_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201202
x86_64               randconfig-a006-20201202
x86_64               randconfig-a001-20201202
x86_64               randconfig-a002-20201202
x86_64               randconfig-a005-20201202
x86_64               randconfig-a003-20201202
i386                 randconfig-a004-20201202
i386                 randconfig-a005-20201202
i386                 randconfig-a001-20201202
i386                 randconfig-a002-20201202
i386                 randconfig-a006-20201202
i386                 randconfig-a003-20201202
i386                 randconfig-a014-20201202
i386                 randconfig-a013-20201202
i386                 randconfig-a011-20201202
i386                 randconfig-a015-20201202
i386                 randconfig-a012-20201202
i386                 randconfig-a016-20201202
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
x86_64               randconfig-a016-20201202
x86_64               randconfig-a012-20201202
x86_64               randconfig-a014-20201202
x86_64               randconfig-a013-20201202
x86_64               randconfig-a015-20201202
x86_64               randconfig-a011-20201202

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
