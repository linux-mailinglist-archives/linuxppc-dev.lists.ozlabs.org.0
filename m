Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 396FF50D66A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 02:59:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KmmqY0Ylsz3bqL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 10:59:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DhZKE9+j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DhZKE9+j; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kmmpr6yRrz2xKK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Apr 2022 10:58:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650848309; x=1682384309;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=O7qnGlPMrgpDKbbYI9rrAgthdM9sceSOJrP3v4bB/yA=;
 b=DhZKE9+jO4uPIec6sGgXRVm6OodVNa55NncdbBWzLel60qpPsRQpqiGR
 dbVxb8ZcrdQdXQwTXn+eG0XMliW5REbMkEg9acYcqHXbIt8DN2KA/qoMM
 JC3FMHpyz7Ug5h+23Fl1CPlo4u2dqgP87nxI1HzoT5CXQU4k3f6cTHZcB
 nxMbLwQ5DyUFeT0N5UwqXHrcjsYizuS9iltH2baM9lP5deamUnVFe6PuO
 52tncWRwcribTVH4xti3iT0ECzWKrNvzwh7wgHnD44uzNcbbcc0VMJUEW
 bttVaBoLoHwxhmtRCyqeUlG0SC9BlX7I5ZNj4yrmaChX2DBU44fm6xeIq w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="252467529"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; d="scan'208";a="252467529"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2022 17:57:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; d="scan'208";a="675962870"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 24 Apr 2022 17:57:18 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nin2T-000207-Cs;
 Mon, 25 Apr 2022 00:57:17 +0000
Date: Mon, 25 Apr 2022 08:57:11 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 a9d1c96332a4d9177c3ae1672d948817568d2b84
Message-ID: <6265f1e7.TRqbO/v8r5CLf7yh%lkp@intel.com>
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
branch HEAD: a9d1c96332a4d9177c3ae1672d948817568d2b84  powerpc/85xx: Remove FSL_85XX_CACHE_SRAM

elapsed time: 722m

configs tested: 141
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220424
sh                           se7751_defconfig
sh                   sh7724_generic_defconfig
arc                         haps_hs_defconfig
mips                  maltasmvp_eva_defconfig
arm                       multi_v4t_defconfig
sh                           se7780_defconfig
arm                         lpc18xx_defconfig
sh                          r7785rp_defconfig
mips                  decstation_64_defconfig
powerpc                      tqm8xx_defconfig
arm                      jornada720_defconfig
arm                     eseries_pxa_defconfig
sh                           sh2007_defconfig
um                             i386_defconfig
arc                     nsimosci_hs_defconfig
m68k                       m5275evb_defconfig
powerpc                         wii_defconfig
powerpc                      bamboo_defconfig
sh                        apsh4ad0a_defconfig
m68k                        mvme147_defconfig
arm                          exynos_defconfig
x86_64                           alldefconfig
microblaze                          defconfig
powerpc                     mpc83xx_defconfig
arm                            lart_defconfig
arm                            zeus_defconfig
arm                           corgi_defconfig
mips                      maltasmvp_defconfig
arm                         nhk8815_defconfig
sh                            hp6xx_defconfig
arm                          pxa3xx_defconfig
arm                           imxrt_defconfig
parisc64                            defconfig
sh                      rts7751r2d1_defconfig
m68k                        m5407c3_defconfig
riscv                               defconfig
arm                        realview_defconfig
mips                       capcella_defconfig
arm                  randconfig-c002-20220424
x86_64                        randconfig-c001
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
nios2                               defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220424
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
riscv                randconfig-c006-20220424
mips                 randconfig-c004-20220424
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220424
powerpc              randconfig-c003-20220424
arm                       spear13xx_defconfig
arm                       aspeed_g4_defconfig
mips                           ip28_defconfig
mips                          rm200_defconfig
powerpc                 mpc836x_mds_defconfig
arm                   milbeaut_m10v_defconfig
arm                         hackkit_defconfig
mips                       rbtx49xx_defconfig
arm                              alldefconfig
powerpc                      acadia_defconfig
arm                       mainstone_defconfig
arm                          moxart_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a003-20220425
i386                 randconfig-a002-20220425
i386                 randconfig-a004-20220425
i386                 randconfig-a001-20220425
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r041-20220424
hexagon              randconfig-r045-20220424
riscv                randconfig-r042-20220424
s390                 randconfig-r044-20220424

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
