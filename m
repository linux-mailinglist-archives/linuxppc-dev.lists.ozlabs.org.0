Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 222B24E2F77
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 18:58:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMj5L6jBjz3bfF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 04:57:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b4Squ86y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=b4Squ86y; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMj4g6jPXz2yy3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 04:57:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647885444; x=1679421444;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=FEDzJGcJqImuKSydv7UDK1xgjoe0DP4rFLdFU7NMwrc=;
 b=b4Squ86yQwLUKi/N0u+ZBcqJ5gh1REE2OHST2ICth7jY0okcDATmCcBn
 FHT63psUPODOUcc7XJfC6qb2nd9G3Ml39BXq61urqpMrSW6dHvpLuolpL
 7WPwe6qTcG3MrfeiMpoY0TP7WQ4YRxyANP23+LlBUAcsLYc+r5LHfTwal
 wtT/qChPHGH4/10RIahD5646sUmHJGc/UDHMq0DUFSk99tuUtn6oKbf4R
 aqw3dgJq065lcF+hlHYN+v9FwFVyHZrApPK270t7qeZFhQK5U5bt/G/4d
 zg4MEVyPRPfx13yoKKbMjOyX+fDuGF/54wS74Fzekn11FSH7x6qa84zKf Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="238221284"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="238221284"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 10:56:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="716590625"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 21 Mar 2022 10:56:18 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nWMGP-000I2i-Ho; Mon, 21 Mar 2022 17:56:17 +0000
Date: Tue, 22 Mar 2022 01:55:19 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS fe2640bd7a62f1f7c3f55fbda31084085075bc30
Message-ID: <6238bc07.02sQpET6mq9miTVy%lkp@intel.com>
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
branch HEAD: fe2640bd7a62f1f7c3f55fbda31084085075bc30  powerpc/pseries: Fix use after free in remove_phb_dynamic()

elapsed time: 755m

configs tested: 167
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220321
mips                 randconfig-c004-20220320
i386                          randconfig-c001
arm                           corgi_defconfig
s390                             allmodconfig
powerpc                        cell_defconfig
arm                        oxnas_v6_defconfig
h8300                     edosk2674_defconfig
mips                           xway_defconfig
parisc64                         alldefconfig
powerpc                 mpc834x_mds_defconfig
arm                       omap2plus_defconfig
arm                        shmobile_defconfig
powerpc                mpc7448_hpc2_defconfig
microblaze                      mmu_defconfig
m68k                            mac_defconfig
arm                            pleb_defconfig
arm                          pxa3xx_defconfig
sh                                  defconfig
powerpc                     ep8248e_defconfig
mips                       bmips_be_defconfig
sh                           se7712_defconfig
sh                        dreamcast_defconfig
arm                           sunxi_defconfig
arm                            qcom_defconfig
powerpc                    amigaone_defconfig
powerpc                        warp_defconfig
arm                          exynos_defconfig
m68k                        mvme16x_defconfig
powerpc                       holly_defconfig
powerpc                    sam440ep_defconfig
arm                             pxa_defconfig
powerpc                      pcm030_defconfig
sh                          rsk7269_defconfig
nios2                         10m50_defconfig
powerpc64                           defconfig
ia64                                defconfig
sh                        sh7757lcr_defconfig
powerpc                 mpc837x_rdb_defconfig
m68k                             allmodconfig
arm                         vf610m4_defconfig
openrisc                    or1ksim_defconfig
nds32                               defconfig
arc                          axs103_defconfig
arc                                 defconfig
m68k                            q40_defconfig
arc                           tb10x_defconfig
sh                          urquell_defconfig
csky                             alldefconfig
arm64                            alldefconfig
xtensa                          iss_defconfig
arm                            mps2_defconfig
powerpc                       ppc64_defconfig
arc                            hsdk_defconfig
m68k                         amcore_defconfig
powerpc                     tqm8548_defconfig
sh                          sdk7780_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                  randconfig-c002-20220321
arm                  randconfig-c002-20220320
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a016-20220321
x86_64               randconfig-a011-20220321
x86_64               randconfig-a012-20220321
x86_64               randconfig-a013-20220321
x86_64               randconfig-a014-20220321
x86_64               randconfig-a015-20220321
i386                 randconfig-a015-20220321
i386                 randconfig-a016-20220321
i386                 randconfig-a011-20220321
i386                 randconfig-a013-20220321
i386                 randconfig-a012-20220321
i386                 randconfig-a014-20220321
arc                  randconfig-r043-20220320
riscv                randconfig-r042-20220321
s390                 randconfig-r044-20220321
arc                  randconfig-r043-20220321
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
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
mips                 randconfig-c004-20220320
arm                  randconfig-c002-20220320
powerpc              randconfig-c003-20220320
riscv                randconfig-c006-20220320
i386                          randconfig-c001
powerpc                      ppc64e_defconfig
mips                      malta_kvm_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                          allyesconfig
mips                     cu1000-neo_defconfig
powerpc                     mpc512x_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                          ep93xx_defconfig
powerpc                    gamecube_defconfig
arm                          collie_defconfig
powerpc                  mpc866_ads_defconfig
mips                       rbtx49xx_defconfig
arm                       netwinder_defconfig
mips                         tb0287_defconfig
arm                       cns3420vb_defconfig
riscv                          rv32_defconfig
arm                          imote2_defconfig
mips                       lemote2f_defconfig
arm                          pxa168_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                       ebony_defconfig
riscv                             allnoconfig
x86_64               randconfig-a001-20220321
x86_64               randconfig-a003-20220321
x86_64               randconfig-a005-20220321
x86_64               randconfig-a004-20220321
x86_64               randconfig-a002-20220321
x86_64               randconfig-a006-20220321
i386                 randconfig-a001-20220321
i386                 randconfig-a006-20220321
i386                 randconfig-a003-20220321
i386                 randconfig-a005-20220321
i386                 randconfig-a004-20220321
i386                 randconfig-a002-20220321
riscv                randconfig-r042-20220320
hexagon              randconfig-r045-20220321
hexagon              randconfig-r045-20220320
hexagon              randconfig-r041-20220321
hexagon              randconfig-r041-20220320
s390                 randconfig-r044-20220320

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
