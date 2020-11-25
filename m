Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 218A82C4951
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 21:49:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChCg91bTkzDqTC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 07:49:25 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChCbx4NMCzDr24
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 07:46:37 +1100 (AEDT)
IronPort-SDR: 9UiPLSEx5TALMswUBabAYxnpjFmeVLGCEA0ptcF8xfAktkjyRxuBcbMixSvzig/2g4yh8Lql/O
 4PGTJ51cRL3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="159967192"
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; d="scan'208";a="159967192"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 12:46:34 -0800
IronPort-SDR: j0tzttd62yXMTBskos9nYHNUzanEFTe2AunzE2J4O8UEj4r/UR9SRbOpydhja9+jHLtulCKROK
 CqZOF2ev6hzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; d="scan'208";a="370908056"
Received: from lkp-server01.sh.intel.com (HELO f59a693d3a73) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 25 Nov 2020 12:46:33 -0800
Received: from kbuild by f59a693d3a73 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1ki1gO-0000G5-TH; Wed, 25 Nov 2020 20:46:32 +0000
Date: Thu, 26 Nov 2020 04:45:37 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 6cc5522b62bbc176e1a5666c401466a37ffc746e
Message-ID: <5fbec271.QdOJ8BPIPHgPWZ7m%lkp@intel.com>
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
branch HEAD: 6cc5522b62bbc176e1a5666c401466a37ffc746e  powerpc: inline iomap accessors

elapsed time: 960m

configs tested: 142
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                     ep8248e_defconfig
powerpc                     sequoia_defconfig
arm                        oxnas_v6_defconfig
nds32                               defconfig
m68k                            q40_defconfig
powerpc                     asp8347_defconfig
parisc                generic-32bit_defconfig
powerpc64                        alldefconfig
arm                          collie_defconfig
arm                           corgi_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                               allmodconfig
powerpc                   lite5200b_defconfig
ia64                          tiger_defconfig
sh                           se7722_defconfig
arm                      tct_hammer_defconfig
sh                           se7721_defconfig
mips                      maltaaprp_defconfig
arm                         nhk8815_defconfig
mips                            ar7_defconfig
sh                            titan_defconfig
powerpc                     mpc83xx_defconfig
powerpc                          allmodconfig
m68k                        stmark2_defconfig
powerpc                  mpc866_ads_defconfig
m68k                         apollo_defconfig
powerpc64                           defconfig
sh                         apsh4a3a_defconfig
powerpc                     mpc512x_defconfig
s390                                defconfig
nios2                               defconfig
mips                           rs90_defconfig
nios2                         3c120_defconfig
arm                            qcom_defconfig
mips                         db1xxx_defconfig
powerpc                        fsp2_defconfig
c6x                        evmc6472_defconfig
sh                          rsk7203_defconfig
arm                        mvebu_v7_defconfig
mips                 decstation_r4k_defconfig
parisc                           alldefconfig
mips                          rm200_defconfig
sh                   sh7770_generic_defconfig
powerpc                    gamecube_defconfig
arm                        trizeps4_defconfig
powerpc                 mpc836x_mds_defconfig
mips                  cavium_octeon_defconfig
sh                 kfr2r09-romimage_defconfig
arm                         mv78xx0_defconfig
mips                      maltasmvp_defconfig
m68k                                defconfig
sh                        sh7763rdp_defconfig
sparc                            alldefconfig
arm                        magician_defconfig
powerpc                     tqm8548_defconfig
sh                        sh7785lcr_defconfig
arm                        clps711x_defconfig
powerpc                     sbc8548_defconfig
arm                         lpc32xx_defconfig
sh                        dreamcast_defconfig
mips                     cu1000-neo_defconfig
arm                   milbeaut_m10v_defconfig
arm                        neponset_defconfig
powerpc                 mpc8313_rdb_defconfig
xtensa                           alldefconfig
arm                          lpd270_defconfig
powerpc                     ppa8548_defconfig
mips                           ip27_defconfig
sh                          rsk7201_defconfig
arm                             pxa_defconfig
mips                      malta_kvm_defconfig
riscv                            alldefconfig
c6x                        evmc6474_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201125
i386                 randconfig-a003-20201125
i386                 randconfig-a002-20201125
i386                 randconfig-a005-20201125
i386                 randconfig-a001-20201125
i386                 randconfig-a006-20201125
x86_64               randconfig-a015-20201125
x86_64               randconfig-a011-20201125
x86_64               randconfig-a014-20201125
x86_64               randconfig-a016-20201125
x86_64               randconfig-a012-20201125
x86_64               randconfig-a013-20201125
i386                 randconfig-a012-20201125
i386                 randconfig-a013-20201125
i386                 randconfig-a011-20201125
i386                 randconfig-a016-20201125
i386                 randconfig-a014-20201125
i386                 randconfig-a015-20201125
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
x86_64               randconfig-a006-20201125
x86_64               randconfig-a005-20201125
x86_64               randconfig-a003-20201125
x86_64               randconfig-a004-20201125
x86_64               randconfig-a002-20201125
x86_64               randconfig-a001-20201125

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
