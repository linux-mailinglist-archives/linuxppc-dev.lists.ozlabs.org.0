Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EFE38152B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 04:28:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fhq8032Gwz3c5F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 12:28:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fhq726y0Pz308b
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 12:27:42 +1000 (AEST)
IronPort-SDR: zJ5rwLwxCCA/60rjG35Fy1zwpbOCXgnUnFfKNKhMxUxMjft2vFrwz3xcvaSfHxRX3SGLgAFbqF
 R0jfVAhuRvOg==
X-IronPort-AV: E=McAfee;i="6200,9189,9984"; a="198304704"
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; d="scan'208";a="198304704"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 19:27:40 -0700
IronPort-SDR: KuDvSVoSNwGXFLSq/K2P+PLgLraeskxiRyJoJe9G3+fNYUKK9+XS5TOJOisJH49eQdX9CMY0vM
 lsjUJ3kgMbQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; d="scan'208";a="471130990"
Received: from lkp-server01.sh.intel.com (HELO ddd90b05c979) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 14 May 2021 19:27:26 -0700
Received: from kbuild by ddd90b05c979 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lhk1W-0000zW-4x; Sat, 15 May 2021 02:27:26 +0000
Date: Sat, 15 May 2021 10:27:15 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 4572be3694e6e0f9ee6b669df8e4b5bbc040791e
Message-ID: <609f3183.iZZrxJohs0ae2zFS%lkp@intel.com>
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
branch HEAD: 4572be3694e6e0f9ee6b669df8e4b5bbc040791e  selftests/powerpc: Add test of mitigation patching

elapsed time: 723m

configs tested: 165
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                           mtx1_defconfig
arm                           stm32_defconfig
mips                           ip32_defconfig
arm                           sunxi_defconfig
mips                        bcm63xx_defconfig
powerpc                 mpc836x_rdk_defconfig
sh                          rsk7264_defconfig
arm                         lpc32xx_defconfig
powerpc                 mpc834x_mds_defconfig
sh                         ecovec24_defconfig
xtensa                  cadence_csp_defconfig
mips                          rm200_defconfig
arm                      pxa255-idp_defconfig
arm                        mini2440_defconfig
powerpc                       eiger_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                       ppc64_defconfig
arm                   milbeaut_m10v_defconfig
mips                          rb532_defconfig
arm                          ixp4xx_defconfig
um                                  defconfig
powerpc                         ps3_defconfig
m68k                        m5307c3_defconfig
m68k                       m5275evb_defconfig
arm                          iop32x_defconfig
powerpc                 mpc8315_rdb_defconfig
sh                          landisk_defconfig
m68k                         amcore_defconfig
sh                        apsh4ad0a_defconfig
arm                        keystone_defconfig
um                               alldefconfig
sh                        edosk7705_defconfig
openrisc                  or1klitex_defconfig
powerpc                    amigaone_defconfig
sh                          sdk7786_defconfig
powerpc                 mpc832x_mds_defconfig
sh                           se7206_defconfig
m68k                        mvme16x_defconfig
mips                      pistachio_defconfig
arm                        oxnas_v6_defconfig
arm                      jornada720_defconfig
nios2                         3c120_defconfig
openrisc                         alldefconfig
ia64                                defconfig
powerpc                     mpc5200_defconfig
parisc                generic-64bit_defconfig
arm                            mps2_defconfig
powerpc                      chrp32_defconfig
ia64                          tiger_defconfig
powerpc                   currituck_defconfig
riscv                               defconfig
arm                       imx_v4_v5_defconfig
powerpc                     tqm5200_defconfig
sh                   sh7770_generic_defconfig
h8300                               defconfig
sh                        sh7785lcr_defconfig
arc                                 defconfig
m68k                       m5249evb_defconfig
m68k                           sun3_defconfig
powerpc                     mpc512x_defconfig
openrisc                 simple_smp_defconfig
mips                           ip22_defconfig
arc                          axs101_defconfig
m68k                          hp300_defconfig
powerpc                         wii_defconfig
riscv                          rv32_defconfig
xtensa                  nommu_kc705_defconfig
arm                       mainstone_defconfig
openrisc                            defconfig
arm                        mvebu_v5_defconfig
arc                           tb10x_defconfig
sparc64                          alldefconfig
openrisc                    or1ksim_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
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
x86_64               randconfig-a004-20210514
x86_64               randconfig-a003-20210514
x86_64               randconfig-a001-20210514
x86_64               randconfig-a005-20210514
x86_64               randconfig-a002-20210514
x86_64               randconfig-a006-20210514
i386                 randconfig-a003-20210514
i386                 randconfig-a001-20210514
i386                 randconfig-a004-20210514
i386                 randconfig-a005-20210514
i386                 randconfig-a002-20210514
i386                 randconfig-a006-20210514
x86_64               randconfig-a012-20210515
x86_64               randconfig-a015-20210515
x86_64               randconfig-a011-20210515
x86_64               randconfig-a013-20210515
x86_64               randconfig-a016-20210515
x86_64               randconfig-a014-20210515
i386                 randconfig-a016-20210515
i386                 randconfig-a014-20210515
i386                 randconfig-a011-20210515
i386                 randconfig-a012-20210515
i386                 randconfig-a015-20210515
i386                 randconfig-a013-20210515
i386                 randconfig-a016-20210514
i386                 randconfig-a014-20210514
i386                 randconfig-a011-20210514
i386                 randconfig-a012-20210514
i386                 randconfig-a015-20210514
i386                 randconfig-a013-20210514
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210515
x86_64               randconfig-a003-20210515
x86_64               randconfig-a001-20210515
x86_64               randconfig-a005-20210515
x86_64               randconfig-a002-20210515
x86_64               randconfig-a006-20210515
x86_64               randconfig-a015-20210514
x86_64               randconfig-a012-20210514
x86_64               randconfig-a011-20210514
x86_64               randconfig-a013-20210514
x86_64               randconfig-a016-20210514
x86_64               randconfig-a014-20210514

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
