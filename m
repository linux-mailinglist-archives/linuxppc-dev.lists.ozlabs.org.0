Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C857D33052A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 00:10:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dtxz35qHqz3ckl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 10:10:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dtxyk6z9bz3bPN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Mar 2021 10:10:22 +1100 (AEDT)
IronPort-SDR: JD7FLRDNwi4mrowFs3Henh9Qe5s1C3fAkozGA68hchxPJLJADrA6WdC4MPMl8h5ChP/DsjpGBv
 OuwLu5iEuJHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="167844506"
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="167844506"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 15:10:18 -0800
IronPort-SDR: mZWsyx00LP4CdepB7SemTJfpMTLPJJUEj0e18cKEWn5ni4c/+pTG/dBzqF3iK9y8hzBaAbJTVC
 pxJ6HpuPEHmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="375874473"
Received: from lkp-server01.sh.intel.com (HELO 3e992a48ca98) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 07 Mar 2021 15:10:17 -0800
Received: from kbuild by 3e992a48ca98 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lJ2XQ-0000g4-FT; Sun, 07 Mar 2021 23:10:16 +0000
Date: Mon, 08 Mar 2021 07:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS WITH WARNING
 7c6d5b4b9e8a472043a26ccc22092aebbe65ca68
Message-ID: <60455d3f.dxQ+XwoGWoamxEDM%lkp@intel.com>
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
branch HEAD: 7c6d5b4b9e8a472043a26ccc22092aebbe65ca68  powerpc/pseries: export LPAR security flavor in lparcfg

Warning reports:

https://lore.kernel.org/linuxppc-dev/202103072122.wpIjBOYV-lkp@intel.com

possible Warning in current branch:

arch/powerpc/mm/book3s64/hash_utils.c:1986:6: warning: no previous prototype for 'kfence_protect_page' [-Wmissing-prototypes]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- powerpc-allmodconfig
|   `-- arch-powerpc-mm-book3s64-hash_utils.c:warning:no-previous-prototype-for-kfence_protect_page
|-- powerpc-allyesconfig
|   `-- arch-powerpc-mm-book3s64-hash_utils.c:warning:no-previous-prototype-for-kfence_protect_page
`-- powerpc64-allyesconfig
    `-- arch-powerpc-mm-book3s64-hash_utils.c:warning:no-previous-prototype-for-kfence_protect_page

elapsed time: 723m

configs tested: 172
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                           ip28_defconfig
mips                       capcella_defconfig
arm                        mini2440_defconfig
arm                           spitz_defconfig
arm                          pxa168_defconfig
mips                           gcw0_defconfig
sh                           se7724_defconfig
arc                        nsim_700_defconfig
powerpc                     mpc83xx_defconfig
mips                  decstation_64_defconfig
arm                        clps711x_defconfig
arc                              allyesconfig
parisc                              defconfig
powerpc                    klondike_defconfig
sh                            titan_defconfig
xtensa                    smp_lx200_defconfig
powerpc                    ge_imp3a_defconfig
arm                       mainstone_defconfig
mips                             allmodconfig
arm                            dove_defconfig
sh                             shx3_defconfig
s390                       zfcpdump_defconfig
powerpc                     akebono_defconfig
arc                            hsdk_defconfig
powerpc                        warp_defconfig
mips                      loongson3_defconfig
m68k                                defconfig
riscv                    nommu_k210_defconfig
sparc                            allyesconfig
mips                        maltaup_defconfig
sh                        sh7785lcr_defconfig
powerpc                      chrp32_defconfig
mips                        qi_lb60_defconfig
arm                         mv78xx0_defconfig
arm                        spear3xx_defconfig
arc                          axs103_defconfig
arc                          axs101_defconfig
powerpc                  mpc866_ads_defconfig
mips                        workpad_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                         at91_dt_defconfig
powerpc                     powernv_defconfig
csky                             alldefconfig
mips                        nlm_xlr_defconfig
xtensa                       common_defconfig
sh                                  defconfig
sh                           se7722_defconfig
arm                         s5pv210_defconfig
arm                            hisi_defconfig
ia64                         bigsur_defconfig
sh                             espt_defconfig
m68k                          sun3x_defconfig
sparc                       sparc64_defconfig
sh                          r7780mp_defconfig
arc                 nsimosci_hs_smp_defconfig
parisc                generic-64bit_defconfig
powerpc                      bamboo_defconfig
arc                           tb10x_defconfig
powerpc                  mpc885_ads_defconfig
sh                          sdk7786_defconfig
arm                     am200epdkit_defconfig
mips                            gpr_defconfig
arm                         cm_x300_defconfig
arc                        vdk_hs38_defconfig
sh                          polaris_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                     tqm8555_defconfig
mips                       rbtx49xx_defconfig
arm                          pxa3xx_defconfig
powerpc                      pasemi_defconfig
arc                      axs103_smp_defconfig
powerpc                     tqm8560_defconfig
microblaze                          defconfig
sh                          sdk7780_defconfig
arm                      jornada720_defconfig
powerpc                   bluestone_defconfig
mips                           ip27_defconfig
xtensa                          iss_defconfig
mips                         tb0226_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
nios2                               defconfig
nds32                             allnoconfig
i386                             allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210308
x86_64               randconfig-a001-20210308
x86_64               randconfig-a004-20210308
x86_64               randconfig-a002-20210308
x86_64               randconfig-a005-20210308
x86_64               randconfig-a003-20210308
i386                 randconfig-a005-20210307
i386                 randconfig-a003-20210307
i386                 randconfig-a002-20210307
i386                 randconfig-a004-20210307
i386                 randconfig-a006-20210307
i386                 randconfig-a001-20210307
i386                 randconfig-a005-20210308
i386                 randconfig-a003-20210308
i386                 randconfig-a002-20210308
i386                 randconfig-a006-20210308
i386                 randconfig-a004-20210308
i386                 randconfig-a001-20210308
x86_64               randconfig-a013-20210307
x86_64               randconfig-a016-20210307
x86_64               randconfig-a015-20210307
x86_64               randconfig-a014-20210307
x86_64               randconfig-a012-20210307
x86_64               randconfig-a011-20210307
i386                 randconfig-a016-20210307
i386                 randconfig-a012-20210307
i386                 randconfig-a013-20210307
i386                 randconfig-a014-20210307
i386                 randconfig-a011-20210307
i386                 randconfig-a015-20210307
i386                 randconfig-a016-20210308
i386                 randconfig-a012-20210308
i386                 randconfig-a014-20210308
i386                 randconfig-a013-20210308
i386                 randconfig-a011-20210308
i386                 randconfig-a015-20210308
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210307
x86_64               randconfig-a001-20210307
x86_64               randconfig-a004-20210307
x86_64               randconfig-a005-20210307
x86_64               randconfig-a002-20210307
x86_64               randconfig-a003-20210307
x86_64               randconfig-a013-20210308
x86_64               randconfig-a016-20210308
x86_64               randconfig-a015-20210308
x86_64               randconfig-a014-20210308
x86_64               randconfig-a011-20210308
x86_64               randconfig-a012-20210308

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
