Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB51318385
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 03:24:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbgSM3BLwzDwmK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 13:24:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbgQX36hJzDwjS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 13:22:56 +1100 (AEDT)
IronPort-SDR: nKJVtI5dZ+8JTN8uQlFBLwHB5GDytmZX8UEjEmGgjErcV4ucjwhDfEDML08u85Asb+w3WRZr7p
 nbrR5fKtobqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="179625987"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="179625987"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 18:22:52 -0800
IronPort-SDR: /B/rZVC4Nu6g83bWxAZ1rlEAFDT8FQJjnSUeWGeMclRcUB5vOyttLbOCw5bwjC3QguRbB+KhUH
 pqCx/s6EFxxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="399391410"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 10 Feb 2021 18:22:51 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lA1d4-0003QE-Jr; Thu, 11 Feb 2021 02:22:50 +0000
Date: Thu, 11 Feb 2021 10:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 ea721ec55c8a4a166373978b9c8ce77374d684d6
Message-ID: <602494f1.IKYEQDwTFB98GZQH%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: ea721ec55c8a4a166373978b9c8ce77374d684d6  selftests/powerpc: Test for spurious kernel memory faults on radix

elapsed time: 822m

configs tested: 195
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         shannon_defconfig
sh                          rsk7203_defconfig
sparc                               defconfig
mips                      bmips_stb_defconfig
arm                              alldefconfig
arm                           sama5_defconfig
riscv                    nommu_virt_defconfig
m68k                        mvme147_defconfig
arm                          badge4_defconfig
sh                        dreamcast_defconfig
openrisc                         alldefconfig
arm                         bcm2835_defconfig
powerpc                    klondike_defconfig
c6x                         dsk6455_defconfig
mips                          malta_defconfig
powerpc                        cell_defconfig
powerpc                    sam440ep_defconfig
m68k                          amiga_defconfig
sh                        apsh4ad0a_defconfig
arm                           tegra_defconfig
mips                 decstation_r4k_defconfig
sh                                  defconfig
powerpc                     powernv_defconfig
arm                         palmz72_defconfig
mips                       bmips_be_defconfig
mips                        bcm47xx_defconfig
openrisc                    or1ksim_defconfig
openrisc                  or1klitex_defconfig
powerpc                      obs600_defconfig
m68k                       m5249evb_defconfig
powerpc                mpc7448_hpc2_defconfig
arc                        nsimosci_defconfig
nios2                         3c120_defconfig
arm                         s3c6400_defconfig
arm                         vf610m4_defconfig
arc                              alldefconfig
c6x                        evmc6474_defconfig
arc                     haps_hs_smp_defconfig
mips                         bigsur_defconfig
mips                      maltaaprp_defconfig
arc                          axs103_defconfig
mips                         tb0219_defconfig
m68k                            q40_defconfig
mips                        qi_lb60_defconfig
arm                           sunxi_defconfig
powerpc                 mpc834x_itx_defconfig
arm                         socfpga_defconfig
mips                         db1xxx_defconfig
m68k                           sun3_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc64                           defconfig
mips                           xway_defconfig
mips                            e55_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                        nlm_xlp_defconfig
xtensa                         virt_defconfig
arm                        magician_defconfig
mips                           ip32_defconfig
powerpc                     tqm8540_defconfig
sh                          kfr2r09_defconfig
nios2                         10m50_defconfig
powerpc                  mpc885_ads_defconfig
arc                         haps_hs_defconfig
arm                          prima2_defconfig
powerpc                          g5_defconfig
arm                  colibri_pxa300_defconfig
sh                          rsk7269_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                           allnoconfig
powerpc                      bamboo_defconfig
arm                  colibri_pxa270_defconfig
sh                             shx3_defconfig
sh                               allmodconfig
xtensa                  audio_kc705_defconfig
arm                    vt8500_v6_v7_defconfig
arm                        realview_defconfig
arc                        vdk_hs38_defconfig
mips                           rs90_defconfig
powerpc                     sequoia_defconfig
powerpc                     taishan_defconfig
alpha                               defconfig
mips                         tb0287_defconfig
powerpc                    socrates_defconfig
mips                            ar7_defconfig
powerpc                     sbc8548_defconfig
powerpc                     tqm8555_defconfig
powerpc                          allmodconfig
powerpc                         ps3_defconfig
powerpc                      walnut_defconfig
powerpc                    mvme5100_defconfig
sh                         microdev_defconfig
mips                     loongson1c_defconfig
nds32                            alldefconfig
sh                          landisk_defconfig
arm                           corgi_defconfig
arm                         at91_dt_defconfig
ia64                         bigsur_defconfig
arm                      integrator_defconfig
sh                           se7750_defconfig
sh                        sh7763rdp_defconfig
m68k                       m5275evb_defconfig
sparc64                          alldefconfig
powerpc                 mpc836x_mds_defconfig
nios2                            alldefconfig
mips                           ip27_defconfig
powerpc                      katmai_defconfig
xtensa                       common_defconfig
riscv                            alldefconfig
arm                        vexpress_defconfig
m68k                            mac_defconfig
arm                             pxa_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                           se7751_defconfig
ia64                      gensparse_defconfig
m68k                             alldefconfig
m68k                         apollo_defconfig
m68k                       bvme6000_defconfig
mips                           ci20_defconfig
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
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a006-20210209
x86_64               randconfig-a001-20210209
x86_64               randconfig-a005-20210209
x86_64               randconfig-a004-20210209
x86_64               randconfig-a002-20210209
x86_64               randconfig-a003-20210209
i386                 randconfig-a001-20210209
i386                 randconfig-a005-20210209
i386                 randconfig-a003-20210209
i386                 randconfig-a002-20210209
i386                 randconfig-a006-20210209
i386                 randconfig-a004-20210209
i386                 randconfig-a016-20210209
i386                 randconfig-a013-20210209
i386                 randconfig-a012-20210209
i386                 randconfig-a014-20210209
i386                 randconfig-a011-20210209
i386                 randconfig-a015-20210209
i386                 randconfig-a016-20210210
i386                 randconfig-a014-20210210
i386                 randconfig-a012-20210210
i386                 randconfig-a013-20210210
i386                 randconfig-a011-20210210
i386                 randconfig-a015-20210210
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
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210209
x86_64               randconfig-a014-20210209
x86_64               randconfig-a015-20210209
x86_64               randconfig-a012-20210209
x86_64               randconfig-a016-20210209
x86_64               randconfig-a011-20210209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
