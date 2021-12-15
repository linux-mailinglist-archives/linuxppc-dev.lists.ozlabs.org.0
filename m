Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C77B475C03
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 16:43:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDff130Ngz3cZY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 02:43:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HxWXgyUv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HxWXgyUv; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDfcc5X6Zz3bWk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 02:41:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639582913; x=1671118913;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=NO5kslUcXFPj2zxkH8EylKi2U0DRgIxiljuGTnhuiHo=;
 b=HxWXgyUvNIWjC2y99VZopxJdck9Qj6xGGS9iOVAC0TXcB29IACc3MfqE
 2Fwgq1QLU/R/xIDegEEMcYq9q3GacIbDeHGGFjvE4CVg1WssKDlxclPXM
 1ZpSL+8C1hXYzPnIjx5yTlXuSlA1aX8kmSwudkw6qpukmWQqBSI4kMFg8
 8Rmvdt8T9ruMR9RfYyIgGzJYrA2i941wNvKx910rCceLDB6Kj5Sy3mcsq
 +kT3Xwr4ZdGnyHMIrAo2P4uT5d4uDwWdvlI8BWJOeRqsEXabKJvujUq1u
 ovOePN0Nkjn+urjYcdRGWsZEvCb97EDr/Av69lDJrkSMqfoS2+JsfwSht Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="226111284"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="226111284"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 07:40:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="661957926"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2021 07:40:05 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxWNw-0001yE-Pz; Wed, 15 Dec 2021 15:40:04 +0000
Date: Wed, 15 Dec 2021 23:39:46 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS 708da3ff1d67392500bdb8789d5635cd98f9ea92
Message-ID: <61ba0c42.b7QWK0NtjuQY48VN%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 708da3ff1d67392500bdb8789d5635cd98f9ea92  Merge branch 'topic/ppc-kvm' into next

elapsed time: 722m

configs tested: 164
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211214
mips                 randconfig-c004-20211214
i386                 randconfig-c001-20211215
sh                 kfr2r09-romimage_defconfig
xtensa                    xip_kc705_defconfig
powerpc                    klondike_defconfig
sh                          urquell_defconfig
mips                      bmips_stb_defconfig
arm                            hisi_defconfig
powerpc                      acadia_defconfig
arm                            mps2_defconfig
mips                           ip22_defconfig
powerpc                   motionpro_defconfig
powerpc                 mpc834x_itx_defconfig
sh                               alldefconfig
nds32                             allnoconfig
arm                             mxs_defconfig
powerpc                      pasemi_defconfig
powerpc                    gamecube_defconfig
powerpc64                        alldefconfig
powerpc                   lite5200b_defconfig
arc                     nsimosci_hs_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                          polaris_defconfig
mips                     loongson2k_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                 mpc836x_mds_defconfig
arm                           sama5_defconfig
mips                            ar7_defconfig
arm                       aspeed_g5_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                       imx_v4_v5_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                          lpd270_defconfig
powerpc                     ppa8548_defconfig
mips                      maltaaprp_defconfig
arm                          imote2_defconfig
sparc                               defconfig
sh                         microdev_defconfig
csky                             alldefconfig
powerpc                     stx_gp3_defconfig
sh                      rts7751r2d1_defconfig
parisc                           alldefconfig
m68k                        m5307c3_defconfig
xtensa                          iss_defconfig
sh                            shmin_defconfig
sh                  sh7785lcr_32bit_defconfig
m68k                        stmark2_defconfig
i386                             alldefconfig
mips                           rs90_defconfig
mips                    maltaup_xpa_defconfig
sparc                       sparc32_defconfig
h8300                               defconfig
openrisc                            defconfig
powerpc                       ppc64_defconfig
powerpc                      pmac32_defconfig
m68k                             alldefconfig
arm                            qcom_defconfig
sh                           se7724_defconfig
sparc64                             defconfig
h8300                    h8300h-sim_defconfig
sh                          r7780mp_defconfig
powerpc                          g5_defconfig
arm                           sama7_defconfig
arm                  randconfig-c002-20211214
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211214
x86_64               randconfig-a005-20211214
x86_64               randconfig-a001-20211214
x86_64               randconfig-a002-20211214
x86_64               randconfig-a003-20211214
x86_64               randconfig-a004-20211214
i386                 randconfig-a001-20211214
i386                 randconfig-a002-20211214
i386                 randconfig-a005-20211214
i386                 randconfig-a003-20211214
i386                 randconfig-a006-20211214
i386                 randconfig-a004-20211214
x86_64               randconfig-a011-20211215
x86_64               randconfig-a014-20211215
x86_64               randconfig-a012-20211215
x86_64               randconfig-a013-20211215
x86_64               randconfig-a016-20211215
x86_64               randconfig-a015-20211215
i386                 randconfig-a013-20211215
i386                 randconfig-a011-20211215
i386                 randconfig-a016-20211215
i386                 randconfig-a014-20211215
i386                 randconfig-a015-20211215
i386                 randconfig-a012-20211215
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211214
x86_64               randconfig-c007-20211214
riscv                randconfig-c006-20211214
mips                 randconfig-c004-20211214
i386                 randconfig-c001-20211214
s390                 randconfig-c005-20211214
powerpc              randconfig-c003-20211214
x86_64               randconfig-a011-20211214
x86_64               randconfig-a014-20211214
x86_64               randconfig-a012-20211214
x86_64               randconfig-a013-20211214
x86_64               randconfig-a016-20211214
x86_64               randconfig-a015-20211214
i386                 randconfig-a013-20211214
i386                 randconfig-a011-20211214
i386                 randconfig-a016-20211214
i386                 randconfig-a014-20211214
i386                 randconfig-a015-20211214
i386                 randconfig-a012-20211214
hexagon              randconfig-r045-20211214
s390                 randconfig-r044-20211214
riscv                randconfig-r042-20211214
hexagon              randconfig-r041-20211214
hexagon              randconfig-r045-20211215
hexagon              randconfig-r041-20211215

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
