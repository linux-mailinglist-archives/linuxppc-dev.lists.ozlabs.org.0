Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC72294726
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 06:11:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGH9D4ML0zDqP1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 15:10:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGH492GkDzDqXw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 15:06:30 +1100 (AEDT)
IronPort-SDR: jJ2SRgGgNVJC3DmZ4utkmsGlZgwCUwWb5NEoTMCwSmmKeZLVcUEqbyhnAlYkRUMoh/KSbvX5wC
 w41aY2Nj20Rg==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="167402037"
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; d="scan'208";a="167402037"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 21:06:26 -0700
IronPort-SDR: Umkha6M3Z7eEk1NF+lbnFbGJ8NZmGhOv/CpWHo6X8sE3x3mfPgZHT9y/lSilTh5xrG1p5By3nV
 KKWaR5BgIE5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; d="scan'208";a="301954102"
Received: from lkp-server02.sh.intel.com (HELO fbeef087c6a9) ([10.239.97.151])
 by fmsmga007.fm.intel.com with ESMTP; 20 Oct 2020 21:06:25 -0700
Received: from kbuild by fbeef087c6a9 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kV5OK-00001l-M4; Wed, 21 Oct 2020 04:06:24 +0000
Date: Wed, 21 Oct 2020 12:05:45 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 598b738031de83cadbcf745ad0ad2bd69a0ee012
Message-ID: <5f8fb399.Yq0DVNzm4NRUKBhY%lkp@intel.com>
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
branch HEAD: 598b738031de83cadbcf745ad0ad2bd69a0ee012  Automatic merge of 'master' into merge (2020-10-20 23:14)

elapsed time: 928m

configs tested: 128
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                  colibri_pxa300_defconfig
sh                          kfr2r09_defconfig
mips                  maltasmvp_eva_defconfig
m68k                         apollo_defconfig
arm                       aspeed_g5_defconfig
sh                           se7722_defconfig
alpha                            alldefconfig
m68k                         amcore_defconfig
mips                            e55_defconfig
sh                        sh7757lcr_defconfig
ia64                             allmodconfig
m68k                        mvme16x_defconfig
sh                ecovec24-romimage_defconfig
mips                      loongson3_defconfig
mips                malta_kvm_guest_defconfig
mips                        workpad_defconfig
powerpc                    klondike_defconfig
sh                         ecovec24_defconfig
xtensa                  nommu_kc705_defconfig
nios2                               defconfig
arm                         ebsa110_defconfig
powerpc                      pcm030_defconfig
csky                                defconfig
powerpc64                        alldefconfig
mips                       lemote2f_defconfig
powerpc                 mpc836x_rdk_defconfig
s390                          debug_defconfig
powerpc                       ppc64_defconfig
sh                            shmin_defconfig
arm                           viper_defconfig
powerpc                  iss476-smp_defconfig
powerpc                   bluestone_defconfig
sh                         ap325rxa_defconfig
arm                         at91_dt_defconfig
arm                   milbeaut_m10v_defconfig
mips                         mpc30x_defconfig
mips                          ath79_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                          rm200_defconfig
parisc                generic-64bit_defconfig
arm                            mps2_defconfig
sh                          urquell_defconfig
arm                           stm32_defconfig
powerpc                 canyonlands_defconfig
openrisc                 simple_smp_defconfig
h8300                     edosk2674_defconfig
x86_64                              defconfig
powerpc                 mpc836x_mds_defconfig
arc                          axs103_defconfig
sh                   sh7724_generic_defconfig
openrisc                            defconfig
mips                          malta_defconfig
powerpc                     stx_gp3_defconfig
powerpc                  mpc866_ads_defconfig
arm                          pxa3xx_defconfig
nios2                            alldefconfig
powerpc                 mpc8560_ads_defconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
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
i386                 randconfig-a002-20201020
i386                 randconfig-a005-20201020
i386                 randconfig-a003-20201020
i386                 randconfig-a001-20201020
i386                 randconfig-a006-20201020
i386                 randconfig-a004-20201020
x86_64               randconfig-a011-20201020
x86_64               randconfig-a013-20201020
x86_64               randconfig-a016-20201020
x86_64               randconfig-a015-20201020
x86_64               randconfig-a012-20201020
x86_64               randconfig-a014-20201020
i386                 randconfig-a016-20201020
i386                 randconfig-a014-20201020
i386                 randconfig-a015-20201020
i386                 randconfig-a013-20201020
i386                 randconfig-a012-20201020
i386                 randconfig-a011-20201020
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
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20201020
x86_64               randconfig-a002-20201020
x86_64               randconfig-a003-20201020
x86_64               randconfig-a006-20201020
x86_64               randconfig-a005-20201020
x86_64               randconfig-a004-20201020

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
