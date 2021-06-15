Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 605B33A7D64
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 13:38:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G45sy6LHkz3c0Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 21:38:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G45sc3Jtsz30CT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 21:37:49 +1000 (AEST)
IronPort-SDR: 69lWVABZZAbmDvQWgNyYgRQlvQUjb1Ka0HF/audVaFtTpwMHZSTB+wkDj4jTXRUBdc8p8OGeym
 as+fXG4YjG9g==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="269820746"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="269820746"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 04:37:44 -0700
IronPort-SDR: RLDU3AbZjaa+TiKnfhbhwENOpHKej1jIAutEt8Ds1bKrRXeSgSponcqCXr1KnDSph3UrMY2Lpj
 z0rmbXu79Xyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="484439348"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 15 Jun 2021 04:37:43 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lt7O2-0000OQ-OX; Tue, 15 Jun 2021 11:37:42 +0000
Date: Tue, 15 Jun 2021 19:37:18 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 419dfbc3e05d80c5f6d6856534cd0a21c22c22de
Message-ID: <60c890ee.Mmu/4OlFTJm7V8Gn%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 419dfbc3e05d80c5f6d6856534cd0a21c22c22de  Automatic merge of 'master' into merge (2021-06-07 11:03)

elapsed time: 12103m

configs tested: 181
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         cm_x300_defconfig
sh                               alldefconfig
powerpc                       ebony_defconfig
sh                        edosk7760_defconfig
sparc                       sparc32_defconfig
mips                       lemote2f_defconfig
powerpc                   motionpro_defconfig
arm                          moxart_defconfig
sh                             sh03_defconfig
powerpc                     pseries_defconfig
m68k                        mvme147_defconfig
um                               alldefconfig
powerpc                    amigaone_defconfig
powerpc                        fsp2_defconfig
powerpc                      ppc64e_defconfig
powerpc                      katmai_defconfig
m68k                          hp300_defconfig
ia64                                defconfig
powerpc                     tqm8560_defconfig
mips                        vocore2_defconfig
mips                         cobalt_defconfig
mips                        bcm63xx_defconfig
powerpc                  mpc866_ads_defconfig
sh                          polaris_defconfig
mips                  maltasmvp_eva_defconfig
sh                        dreamcast_defconfig
powerpc                     powernv_defconfig
powerpc                 mpc832x_mds_defconfig
arm                         s3c2410_defconfig
arm                         nhk8815_defconfig
powerpc                      chrp32_defconfig
nios2                         10m50_defconfig
arm                           omap1_defconfig
csky                                defconfig
sh                     magicpanelr2_defconfig
sh                   sh7724_generic_defconfig
powerpc                     tqm8555_defconfig
mips                       bmips_be_defconfig
arm                        realview_defconfig
m68k                            mac_defconfig
x86_64                            allnoconfig
powerpc                     tqm8548_defconfig
powerpc                     tqm8540_defconfig
arm                           sunxi_defconfig
sh                 kfr2r09-romimage_defconfig
arm                         s3c6400_defconfig
sh                          sdk7780_defconfig
mips                           jazz_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                         bigsur_defconfig
powerpc                     taishan_defconfig
arm                          ixp4xx_defconfig
mips                        nlm_xlp_defconfig
arm64                            alldefconfig
mips                        maltaup_defconfig
m68k                       m5275evb_defconfig
powerpc                     kmeter1_defconfig
powerpc                   lite5200b_defconfig
um                                  defconfig
powerpc                 mpc8315_rdb_defconfig
sh                           se7721_defconfig
mips                      malta_kvm_defconfig
arm                          pcm027_defconfig
powerpc                      ppc40x_defconfig
arm                          simpad_defconfig
sh                          rsk7201_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                      walnut_defconfig
m68k                        mvme16x_defconfig
arm                         mv78xx0_defconfig
arm                            dove_defconfig
mips                      maltasmvp_defconfig
xtensa                              defconfig
arm                        multi_v7_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20210613
i386                 randconfig-a006-20210613
i386                 randconfig-a001-20210613
i386                 randconfig-a004-20210613
i386                 randconfig-a005-20210613
i386                 randconfig-a003-20210613
i386                 randconfig-a003-20210606
i386                 randconfig-a006-20210606
i386                 randconfig-a004-20210606
i386                 randconfig-a001-20210606
i386                 randconfig-a005-20210606
i386                 randconfig-a002-20210606
i386                 randconfig-a003-20210607
i386                 randconfig-a006-20210607
i386                 randconfig-a004-20210607
i386                 randconfig-a001-20210607
i386                 randconfig-a002-20210607
i386                 randconfig-a005-20210607
x86_64               randconfig-a015-20210607
x86_64               randconfig-a011-20210607
x86_64               randconfig-a014-20210607
x86_64               randconfig-a012-20210607
x86_64               randconfig-a016-20210607
x86_64               randconfig-a013-20210607
i386                 randconfig-a015-20210613
i386                 randconfig-a013-20210613
i386                 randconfig-a016-20210613
i386                 randconfig-a014-20210613
i386                 randconfig-a012-20210613
i386                 randconfig-a011-20210613
i386                 randconfig-a015-20210607
i386                 randconfig-a013-20210607
i386                 randconfig-a011-20210607
i386                 randconfig-a016-20210607
i386                 randconfig-a014-20210607
i386                 randconfig-a012-20210607
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210607
x86_64               randconfig-b001-20210614
x86_64               randconfig-a001-20210614
x86_64               randconfig-a004-20210614
x86_64               randconfig-a002-20210614
x86_64               randconfig-a003-20210614
x86_64               randconfig-a006-20210614
x86_64               randconfig-a005-20210614
x86_64               randconfig-a002-20210607
x86_64               randconfig-a004-20210607
x86_64               randconfig-a003-20210607
x86_64               randconfig-a006-20210607
x86_64               randconfig-a005-20210607
x86_64               randconfig-a001-20210607
x86_64               randconfig-a015-20210613
x86_64               randconfig-a011-20210613
x86_64               randconfig-a014-20210613
x86_64               randconfig-a012-20210613
x86_64               randconfig-a013-20210613
x86_64               randconfig-a016-20210613

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
