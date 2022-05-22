Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F4A53067C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 00:22:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L5w1r22hHz3brS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 08:22:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R0E9XjZp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=R0E9XjZp; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L5w171h1Yz2yQK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 May 2022 08:21:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653258107; x=1684794107;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=yAaT8gWZ6kY8ENnWmTXJA6RdSNORa2a/fcDfe4CVwHE=;
 b=R0E9XjZp/Sadma2cMLaMYPmrKCJOvuSTltPas8jxRKSlFP55/ojI8s+T
 6jtzO8Omrf52M/KAkovso8qDNzfjKFOmzdgMZcgoXExdnriy9EpHF8wKo
 qNSMwMsEEF++o+N+BQsdKGKsLnH6XJfI5ecPTf1XMj4c24fZ4aQE3eTHs
 VlMGIsqmc0mmUj1yMVDQJ5GMCs5eZL8Bbj84vP3WRQmg+UB7/tQmirx0q
 +iCudxdzV+kdRGZ393AgafoFYJkmXkv79FYVDve7tq6kHvpL2M0+4I75/
 ue/IjgYbjbCQqk9aLQ1bZDJujWCrUsHQLJGEUupuTs+IpEVZ6yQ9FznLC A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="359446847"
X-IronPort-AV: E=Sophos;i="5.91,244,1647327600"; d="scan'208";a="359446847"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 15:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,244,1647327600"; d="scan'208";a="744402340"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 22 May 2022 15:20:32 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nstw7-0000ex-C7;
 Sun, 22 May 2022 22:20:31 +0000
Date: Mon, 23 May 2022 06:20:20 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS a5d28039ecb288f4788ae98c8291e092961e8742
Message-ID: <628ab724.I+oljYxCR4ZKcMss%lkp@intel.com>
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
branch HEAD: a5d28039ecb288f4788ae98c8291e092961e8742  powerpc/powernv/pci: Drop VF MPS fixup

elapsed time: 720m

configs tested: 175
configs skipped: 49

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
arm64                               defconfig
i386                          randconfig-c001
arm                           imxrt_defconfig
mips                     loongson1b_defconfig
arm                       imx_v6_v7_defconfig
parisc                           alldefconfig
arm                           stm32_defconfig
sparc                       sparc64_defconfig
sh                         ecovec24_defconfig
sh                               allmodconfig
arm                         assabet_defconfig
xtensa                generic_kc705_defconfig
arm                            hisi_defconfig
arc                        vdk_hs38_defconfig
sh                            shmin_defconfig
parisc                              defconfig
mips                      fuloong2e_defconfig
mips                      maltasmvp_defconfig
powerpc                      cm5200_defconfig
powerpc                    sam440ep_defconfig
arm                        shmobile_defconfig
um                               alldefconfig
um                                  defconfig
mips                         bigsur_defconfig
mips                       bmips_be_defconfig
arc                        nsimosci_defconfig
sh                            titan_defconfig
arm                        realview_defconfig
xtensa                           alldefconfig
sh                          polaris_defconfig
powerpc                         wii_defconfig
mips                        bcm47xx_defconfig
powerpc                     taishan_defconfig
powerpc64                           defconfig
arm                       omap2plus_defconfig
mips                 decstation_r4k_defconfig
s390                       zfcpdump_defconfig
csky                             alldefconfig
um                             i386_defconfig
sparc                               defconfig
arm                            qcom_defconfig
powerpc                     sequoia_defconfig
arm                            lart_defconfig
um                           x86_64_defconfig
mips                            ar7_defconfig
m68k                                defconfig
m68k                        stmark2_defconfig
m68k                         amcore_defconfig
m68k                         apollo_defconfig
arm                        trizeps4_defconfig
arm                        cerfcube_defconfig
mips                         db1xxx_defconfig
arm                            xcep_defconfig
powerpc                     tqm8548_defconfig
powerpc                       eiger_defconfig
sh                   rts7751r2dplus_defconfig
arm                      jornada720_defconfig
arc                          axs103_defconfig
powerpc                   motionpro_defconfig
arm                           sama5_defconfig
arc                           tb10x_defconfig
h8300                     edosk2674_defconfig
nios2                            alldefconfig
arm                           h5000_defconfig
m68k                          multi_defconfig
arc                          axs101_defconfig
sh                               j2_defconfig
ia64                        generic_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                         microdev_defconfig
mips                     decstation_defconfig
m68k                             allyesconfig
arm                           sunxi_defconfig
arm                            zeus_defconfig
mips                           jazz_defconfig
xtensa                  audio_kc705_defconfig
arm                         s3c6400_defconfig
sh                        edosk7760_defconfig
arm                  randconfig-c002-20220522
x86_64                        randconfig-c001
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
h8300                            allyesconfig
xtensa                           allyesconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
parisc64                            defconfig
parisc                           allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a004
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a002
arc                  randconfig-r043-20220522
s390                 randconfig-r044-20220522
riscv                randconfig-r042-20220522
riscv                             allnoconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
arm                          ep93xx_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                          g5_defconfig
powerpc                    socrates_defconfig
i386                             allyesconfig
powerpc                          allyesconfig
powerpc                     mpc512x_defconfig
powerpc                      ppc44x_defconfig
arm                      pxa255-idp_defconfig
mips                           ip27_defconfig
mips                           rs90_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                    ge_imp3a_defconfig
arm                         mv78xx0_defconfig
powerpc                   lite5200b_defconfig
powerpc                 mpc8560_ads_defconfig
mips                      pic32mzda_defconfig
mips                          rm200_defconfig
s390                             alldefconfig
arm                        mvebu_v5_defconfig
powerpc                     kmeter1_defconfig
arm                         orion5x_defconfig
arm                           omap1_defconfig
arm                         hackkit_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a005
x86_64                        randconfig-a003
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a001
hexagon              randconfig-r041-20220522
hexagon              randconfig-r045-20220522

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
