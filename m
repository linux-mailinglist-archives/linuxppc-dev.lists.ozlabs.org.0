Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 110AA202D89
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 00:56:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49qnwS0MrfzDqf3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 08:56:40 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49qntX3qd9zDqbf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 08:54:53 +1000 (AEST)
IronPort-SDR: Iu0jYFqJOdgVOt9O846fGiI/WELG6Xz/sfL/1kbYy03BSeQOY7B0CGsvciBtK+EdvGjv+XJ1N7
 meIJr3JGrl0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9659"; a="131013349"
X-IronPort-AV: E=Sophos;i="5.75,264,1589266800"; d="scan'208";a="131013349"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2020 15:54:49 -0700
IronPort-SDR: fBF/wGJP4InJbJaVvjL/eTGDyZ1lgebc5RV/5wQJ2TA8ZUwB74UV61zDjOoHBIciigieGgR5eZ
 31fL0sFBQpTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,264,1589266800"; d="scan'208";a="318625539"
Received: from lkp-server02.sh.intel.com (HELO 3aa54c81372e) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Jun 2020 15:54:47 -0700
Received: from kbuild by 3aa54c81372e with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jn8rP-0002uV-3P; Sun, 21 Jun 2020 22:54:47 +0000
Date: Mon, 22 Jun 2020 06:54:09 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 3ddb24ac766e1b028462b27aeae05c2bf17c12c5
Message-ID: <5eefe511.ozbql5adxGY/8UCi%lkp@intel.com>
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
branch HEAD: 3ddb24ac766e1b028462b27aeae05c2bf17c12c5  Automatic merge of 'master', 'next' and 'fixes' (2020-06-21 20:32)

elapsed time: 739m

configs tested: 133
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
sh                          landisk_defconfig
arm                              zx_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                         ecovec24_defconfig
mips                        vocore2_defconfig
mips                  decstation_64_defconfig
arm                         shannon_defconfig
mips                     loongson1b_defconfig
mips                         db1xxx_defconfig
m68k                          atari_defconfig
arm                             rpc_defconfig
mips                      pistachio_defconfig
sh                        edosk7760_defconfig
riscv                               defconfig
arm                           sunxi_defconfig
mips                   sb1250_swarm_defconfig
arm                        clps711x_defconfig
mips                      fuloong2e_defconfig
sparc                               defconfig
sh                ecovec24-romimage_defconfig
arm                          collie_defconfig
arm                          imote2_defconfig
arm                         socfpga_defconfig
mips                 pnx8335_stb225_defconfig
m68k                          sun3x_defconfig
arm                         hackkit_defconfig
c6x                        evmc6678_defconfig
arm                     am200epdkit_defconfig
i386                                defconfig
powerpc                       maple_defconfig
sh                           se7724_defconfig
sparc64                          alldefconfig
sh                        dreamcast_defconfig
arc                     nsimosci_hs_defconfig
microblaze                    nommu_defconfig
i386                             allyesconfig
sh                                  defconfig
mips                           xway_defconfig
sh                        sh7785lcr_defconfig
i386                              allnoconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
microblaze                        allnoconfig
sh                               allmodconfig
sh                                allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200621
i386                 randconfig-a002-20200621
i386                 randconfig-a003-20200621
i386                 randconfig-a001-20200621
i386                 randconfig-a005-20200621
i386                 randconfig-a004-20200621
x86_64               randconfig-a012-20200621
x86_64               randconfig-a011-20200621
x86_64               randconfig-a013-20200621
x86_64               randconfig-a014-20200621
x86_64               randconfig-a015-20200621
x86_64               randconfig-a016-20200621
i386                 randconfig-a013-20200621
i386                 randconfig-a016-20200621
i386                 randconfig-a012-20200621
i386                 randconfig-a014-20200621
i386                 randconfig-a015-20200621
i386                 randconfig-a011-20200621
riscv                            allyesconfig
riscv                             allnoconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allmodconfig
um                               allyesconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
