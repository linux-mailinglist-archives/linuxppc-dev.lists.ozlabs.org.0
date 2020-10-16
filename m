Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9C1290E3D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 01:41:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCjNS1nWlzDr0X
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 10:41:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCjLk6HVtzDqsd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 10:40:12 +1100 (AEDT)
IronPort-SDR: s7LrEVtH5zUALdhFCkWB3bbFlB1N81NI35KD1JgGa7t+aNIFO+AKf5fQDikn9UCltUrPYy0OBS
 flCiifh4rcuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9776"; a="251403505"
X-IronPort-AV: E=Sophos;i="5.77,384,1596524400"; d="scan'208";a="251403505"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2020 16:40:05 -0700
IronPort-SDR: qUO764IeaHPlmL4ZYWfyE6uBfs916ZJvOrGMSYF4/ODNIt2Y1GJ6r6uLT3CGd3uqSHkBcqpnfq
 SOUky7ybId6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,384,1596524400"; d="scan'208";a="347362570"
Received: from lkp-server02.sh.intel.com (HELO 262a2cdd3070) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 16 Oct 2020 16:40:03 -0700
Received: from kbuild by 262a2cdd3070 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kTZKN-0000Bv-5U; Fri, 16 Oct 2020 23:40:03 +0000
Date: Sat, 17 Oct 2020 07:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 8d0e2101274358d9b6b1f27232b40253ca48bab5
Message-ID: <5f8a2f4b.Wejydun7qRkyYgn8%lkp@intel.com>
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
branch HEAD: 8d0e2101274358d9b6b1f27232b40253ca48bab5  powerpc/mce: Avoid nmi_enter/exit in real mode on pseries hash

elapsed time: 750m

configs tested: 119
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                          axs101_defconfig
sparc                            allyesconfig
powerpc                    klondike_defconfig
powerpc                 mpc832x_mds_defconfig
sh                   secureedge5410_defconfig
arm                        neponset_defconfig
sh                          urquell_defconfig
sh                          kfr2r09_defconfig
m68k                            mac_defconfig
parisc                           allyesconfig
sh                         ecovec24_defconfig
mips                   sb1250_swarm_defconfig
m68k                          atari_defconfig
arm                         s5pv210_defconfig
arm                         palmz72_defconfig
mips                            gpr_defconfig
arm                       spear13xx_defconfig
ia64                        generic_defconfig
arm                            xcep_defconfig
arm                          tango4_defconfig
powerpc                 mpc85xx_cds_defconfig
xtensa                         virt_defconfig
powerpc                          g5_defconfig
csky                             alldefconfig
xtensa                  nommu_kc705_defconfig
arm                       aspeed_g4_defconfig
sh                           se7206_defconfig
arm                          prima2_defconfig
mips                        qi_lb60_defconfig
powerpc                 mpc837x_mds_defconfig
mips                        vocore2_defconfig
sh                         microdev_defconfig
c6x                         dsk6455_defconfig
powerpc                         wii_defconfig
mips                      loongson3_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                        icon_defconfig
sh                         ap325rxa_defconfig
mips                    maltaup_xpa_defconfig
microblaze                          defconfig
sh                   rts7751r2dplus_defconfig
sh                        edosk7705_defconfig
arm                         cm_x300_defconfig
arm                       netwinder_defconfig
arm                   milbeaut_m10v_defconfig
arm                            hisi_defconfig
ia64                             alldefconfig
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
s390                             allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20201016
i386                 randconfig-a006-20201016
i386                 randconfig-a001-20201016
i386                 randconfig-a003-20201016
i386                 randconfig-a004-20201016
i386                 randconfig-a002-20201016
x86_64               randconfig-a016-20201016
x86_64               randconfig-a012-20201016
x86_64               randconfig-a015-20201016
x86_64               randconfig-a013-20201016
x86_64               randconfig-a014-20201016
x86_64               randconfig-a011-20201016
i386                 randconfig-a016-20201016
i386                 randconfig-a015-20201016
i386                 randconfig-a013-20201016
i386                 randconfig-a011-20201016
i386                 randconfig-a012-20201016
i386                 randconfig-a014-20201016
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
x86_64               randconfig-a004-20201016
x86_64               randconfig-a002-20201016
x86_64               randconfig-a006-20201016
x86_64               randconfig-a001-20201016
x86_64               randconfig-a005-20201016
x86_64               randconfig-a003-20201016

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
