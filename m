Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A83EE52FDFF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 17:55:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L57Tz469vz3c7d
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 May 2022 01:55:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c1TjXdBQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=c1TjXdBQ; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L57TG4wddz2yh9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 May 2022 01:54:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653148498; x=1684684498;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=s3FXEEIJTYKHH7t6mxv1tPTKUtQZcCoyczr968nKO10=;
 b=c1TjXdBQONEkc2uc7TBp9rQgzvoUUFUlX9bPpkku3uloAHpcKJD8gvd0
 CvVLn0SUIi6r2V7iJSY8QkBEAf2nXG/KEahSvO9BWygHiMCbW06y/dxPv
 ns1ragovSZAvUU8S9NL8tCFpmNw+tU+R4reXe1dHFxVS2xWWGb72uEbeI
 f0FjLzQgm0EoRHur61W5J2LEUPJaN+7ZrYB7MNxBrNhhNGwQZdX+6d8d4
 MPM4V2KNfB6LljecC7E1UGYseo/FTE2Da6PMyg/8aq9jVhZezivKomE+a
 JrQEn+TKP4L26WSJ62nN/L8N+ZculX/LXNqGSOxr9NOJDGRdk5p7WnDtV A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10354"; a="272848160"
X-IronPort-AV: E=Sophos;i="5.91,242,1647327600"; d="scan'208";a="272848160"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2022 08:54:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,242,1647327600"; d="scan'208";a="743953523"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 21 May 2022 08:54:43 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nsRRC-0006PY-Nv;
 Sat, 21 May 2022 15:54:42 +0000
Date: Sat, 21 May 2022 23:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS 34f0971f8ca73d7e5502b4cf299788a9402120f7
Message-ID: <62890b3c.VEuyzaeI56J6fWAZ%lkp@intel.com>
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
branch HEAD: 34f0971f8ca73d7e5502b4cf299788a9402120f7  powerpc/powernv/flash: Check OPAL flash calls exist before using

elapsed time: 2933m

configs tested: 222
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
powerpc64                           defconfig
arc                                 defconfig
powerpc                     asp8347_defconfig
m68k                            mac_defconfig
ia64                            zx1_defconfig
m68k                           sun3_defconfig
mips                         bigsur_defconfig
xtensa                    smp_lx200_defconfig
powerpc                     mpc83xx_defconfig
ia64                      gensparse_defconfig
arm                            pleb_defconfig
arm                      footbridge_defconfig
s390                          debug_defconfig
xtensa                    xip_kc705_defconfig
sh                         microdev_defconfig
sh                               j2_defconfig
s390                       zfcpdump_defconfig
arm                         axm55xx_defconfig
mips                           ci20_defconfig
xtensa                          iss_defconfig
s390                             allyesconfig
ia64                        generic_defconfig
powerpc                      chrp32_defconfig
mips                  maltasmvp_eva_defconfig
riscv                            allyesconfig
powerpc                      pcm030_defconfig
sh                   sh7770_generic_defconfig
h8300                    h8300h-sim_defconfig
arm                        mini2440_defconfig
xtensa                           allyesconfig
m68k                            q40_defconfig
sh                           se7721_defconfig
arm                           tegra_defconfig
h8300                            allyesconfig
arm                          badge4_defconfig
arm                        cerfcube_defconfig
arm                           corgi_defconfig
sh                        sh7763rdp_defconfig
powerpc                     sequoia_defconfig
arm                      jornada720_defconfig
um                                  defconfig
powerpc                        cell_defconfig
sh                                  defconfig
powerpc                    klondike_defconfig
mips                       capcella_defconfig
powerpc                 linkstation_defconfig
powerpc                        warp_defconfig
xtensa                  audio_kc705_defconfig
arm                           h3600_defconfig
parisc                generic-64bit_defconfig
sh                           se7619_defconfig
powerpc                      ppc40x_defconfig
alpha                               defconfig
arm                           h5000_defconfig
arm                        multi_v7_defconfig
ia64                         bigsur_defconfig
sh                          landisk_defconfig
alpha                            allyesconfig
sh                           se7343_defconfig
sh                            migor_defconfig
nios2                            alldefconfig
arc                        nsimosci_defconfig
powerpc                     stx_gp3_defconfig
sparc64                          alldefconfig
i386                                defconfig
powerpc                      ep88xc_defconfig
h8300                       h8s-sim_defconfig
powerpc                 mpc834x_mds_defconfig
arm                            lart_defconfig
sh                          urquell_defconfig
m68k                       m5208evb_defconfig
mips                  decstation_64_defconfig
m68k                       bvme6000_defconfig
mips                             allyesconfig
x86_64                           alldefconfig
powerpc                 canyonlands_defconfig
sh                          sdk7786_defconfig
mips                 decstation_r4k_defconfig
um                             i386_defconfig
m68k                          hp300_defconfig
mips                         mpc30x_defconfig
m68k                             allyesconfig
powerpc                 mpc837x_mds_defconfig
arm                           viper_defconfig
arm                             pxa_defconfig
m68k                        mvme147_defconfig
arm                        keystone_defconfig
openrisc                 simple_smp_defconfig
xtensa                generic_kc705_defconfig
powerpc                       holly_defconfig
powerpc                     rainier_defconfig
powerpc                      mgcoge_defconfig
mips                     loongson1b_defconfig
arc                         haps_hs_defconfig
sh                               allmodconfig
sh                   secureedge5410_defconfig
arm                        realview_defconfig
sh                   rts7751r2dplus_defconfig
arm                           sama5_defconfig
m68k                          sun3x_defconfig
sh                        sh7757lcr_defconfig
arc                        nsim_700_defconfig
arc                          axs103_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220519
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
riscv                             allnoconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a001
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220521
arc                  randconfig-r043-20220519
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc              randconfig-c003-20220519
x86_64                        randconfig-c007
riscv                randconfig-c006-20220519
mips                 randconfig-c004-20220519
i386                          randconfig-c001
arm                  randconfig-c002-20220519
s390                 randconfig-c005-20220519
powerpc                          g5_defconfig
hexagon                             defconfig
mips                      pic32mzda_defconfig
powerpc                 mpc836x_mds_defconfig
mips                      bmips_stb_defconfig
mips                     loongson2k_defconfig
powerpc                     tqm8560_defconfig
hexagon                          alldefconfig
powerpc                       ebony_defconfig
mips                      malta_kvm_defconfig
arm                              alldefconfig
arm                          ixp4xx_defconfig
powerpc                      pmac32_defconfig
powerpc                   microwatt_defconfig
powerpc                      acadia_defconfig
riscv                          rv32_defconfig
powerpc                     tqm8540_defconfig
arm                       versatile_defconfig
arm                   milbeaut_m10v_defconfig
mips                           ip22_defconfig
arm                         s5pv210_defconfig
powerpc                   bluestone_defconfig
powerpc                      katmai_defconfig
powerpc                        icon_defconfig
powerpc                      ppc44x_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                       spear13xx_defconfig
mips                           rs90_defconfig
powerpc                          allmodconfig
powerpc                 mpc8272_ads_defconfig
arm                        magician_defconfig
arm                         palmz72_defconfig
mips                            e55_defconfig
arm                        mvebu_v5_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                    gamecube_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220519
riscv                randconfig-r042-20220519
hexagon              randconfig-r041-20220519
s390                 randconfig-r044-20220519
hexagon              randconfig-r045-20220521
hexagon              randconfig-r041-20220521
s390                 randconfig-r044-20220521
riscv                randconfig-r042-20220521

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
