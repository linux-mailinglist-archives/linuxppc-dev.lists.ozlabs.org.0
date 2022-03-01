Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 799F34C836E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 06:42:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K75kP3Zxmz3c2f
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 16:42:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d3zt8Hkf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=d3zt8Hkf; dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K75j337pSz3bd6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 16:41:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646113304; x=1677649304;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=TWPfJ46IREz2op/GhebwhOB8ddKwdxW8cIzUDmOdjmU=;
 b=d3zt8HkfpeMXqof0fdjxAoVpvG2/MIwnbWvFYH/KrQ/KbxUyn8wS7QgK
 N8+BVEICP58O55I4k4QJieopKhunhjotfEthgGw4Xpm/EGCpEWpzhXn97
 viiZb0dZN8PgufQ4pIUTn0XCGySazSoB9j5u6eKCQhwuS1rQzUIIp0doG
 Qmj0znLGJI11XAzpjtF9jrxEYikPC/vPq+yopuibNLvWgD5HSRPiGEKQt
 S4zsP05godV5+mwBV6yEkc8tKb1CsW7GPq/ifIZyNsZTeurQhRkTqwlxK
 MMKA/FpB+J1DpP585k8csm4SIdMU+CLpU/+2dMn/CVP3fBgtTQQyKxMWV g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="251892384"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="251892384"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 21:37:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="550568921"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 28 Feb 2022 21:37:50 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nOvCn-0008Cq-FP; Tue, 01 Mar 2022 05:37:49 +0000
Date: Tue, 01 Mar 2022 13:37:25 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 689576dd98c57e6b35277c361af898a5be401dcc
Message-ID: <621db115.bwnH+lj77nXL/9qD%lkp@intel.com>
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
branch HEAD: 689576dd98c57e6b35277c361af898a5be401dcc  powerpc: lib: sstep: fix build errors

elapsed time: 761m

configs tested: 196
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220228
arm                            lart_defconfig
arm                         assabet_defconfig
arm                          simpad_defconfig
sh                           se7780_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                        cell_defconfig
s390                                defconfig
mips                         db1xxx_defconfig
sh                ecovec24-romimage_defconfig
m68k                            mac_defconfig
sh                     sh7710voipgw_defconfig
powerpc                      bamboo_defconfig
parisc                generic-32bit_defconfig
powerpc                      tqm8xx_defconfig
xtensa                    xip_kc705_defconfig
sh                               alldefconfig
mips                         tb0226_defconfig
powerpc                  iss476-smp_defconfig
m68k                          atari_defconfig
s390                             allyesconfig
arm                       omap2plus_defconfig
powerpc                     tqm8555_defconfig
mips                         mpc30x_defconfig
arm                        cerfcube_defconfig
mips                       bmips_be_defconfig
mips                         rt305x_defconfig
sh                          rsk7269_defconfig
sh                        sh7785lcr_defconfig
sh                         ecovec24_defconfig
arm                        multi_v7_defconfig
arc                              allyesconfig
arm                          badge4_defconfig
arc                     nsimosci_hs_defconfig
sh                          r7780mp_defconfig
sh                           se7724_defconfig
sh                          sdk7780_defconfig
arm                            pleb_defconfig
microblaze                      mmu_defconfig
arm                          pxa3xx_defconfig
m68k                        m5307c3_defconfig
m68k                          multi_defconfig
arm                          gemini_defconfig
powerpc                      makalu_defconfig
m68k                        mvme16x_defconfig
sh                           se7619_defconfig
sh                        sh7757lcr_defconfig
powerpc                   motionpro_defconfig
um                           x86_64_defconfig
s390                       zfcpdump_defconfig
ia64                                defconfig
powerpc                     taishan_defconfig
openrisc                    or1ksim_defconfig
arm                         axm55xx_defconfig
powerpc                     sequoia_defconfig
m68k                       m5275evb_defconfig
arm                        mini2440_defconfig
sparc64                          alldefconfig
sh                          landisk_defconfig
powerpc                      ppc6xx_defconfig
arc                          axs103_defconfig
openrisc                         alldefconfig
sh                           se7751_defconfig
powerpc                 linkstation_defconfig
arm                            qcom_defconfig
mips                     loongson1b_defconfig
arm                       aspeed_g5_defconfig
arc                        nsimosci_defconfig
ia64                             allmodconfig
arc                        vdk_hs38_defconfig
m68k                         apollo_defconfig
arm                        spear6xx_defconfig
m68k                          amiga_defconfig
arm                           viper_defconfig
arm                  randconfig-c002-20220228
arm                  randconfig-c002-20220227
arm                  randconfig-c002-20220301
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
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
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a011-20220228
x86_64               randconfig-a015-20220228
x86_64               randconfig-a014-20220228
x86_64               randconfig-a013-20220228
x86_64               randconfig-a016-20220228
x86_64               randconfig-a012-20220228
i386                 randconfig-a016-20220228
i386                 randconfig-a012-20220228
i386                 randconfig-a015-20220228
i386                 randconfig-a011-20220228
i386                 randconfig-a013-20220228
i386                 randconfig-a014-20220228
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
s390                 randconfig-r044-20220228
arc                  randconfig-r043-20220228
riscv                randconfig-r042-20220228
arc                  randconfig-r043-20220227
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc              randconfig-c003-20220227
x86_64                        randconfig-c007
arm                  randconfig-c002-20220227
mips                 randconfig-c004-20220227
s390                 randconfig-c005-20220227
i386                          randconfig-c001
riscv                randconfig-c006-20220227
powerpc                    ge_imp3a_defconfig
powerpc                     powernv_defconfig
mips                           rs90_defconfig
arm                         hackkit_defconfig
arm                      pxa255-idp_defconfig
powerpc                     tqm8540_defconfig
mips                           mtx1_defconfig
powerpc                     pseries_defconfig
powerpc                     tqm8560_defconfig
arm                       cns3420vb_defconfig
arm                        neponset_defconfig
arm                       imx_v4_v5_defconfig
mips                      bmips_stb_defconfig
powerpc                      pmac32_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     mpc5200_defconfig
arm                           sama7_defconfig
mips                           ip28_defconfig
arm                        mvebu_v5_defconfig
arm                          imote2_defconfig
x86_64               randconfig-a003-20220228
x86_64               randconfig-a005-20220228
x86_64               randconfig-a002-20220228
x86_64               randconfig-a006-20220228
x86_64               randconfig-a001-20220228
x86_64               randconfig-a004-20220228
i386                 randconfig-a002-20220228
i386                 randconfig-a001-20220228
i386                 randconfig-a005-20220228
i386                 randconfig-a003-20220228
i386                 randconfig-a006-20220228
i386                 randconfig-a004-20220228
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220227
hexagon              randconfig-r041-20220227
riscv                randconfig-r042-20220227
hexagon              randconfig-r041-20220228
s390                 randconfig-r044-20220227
hexagon              randconfig-r045-20220228

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
