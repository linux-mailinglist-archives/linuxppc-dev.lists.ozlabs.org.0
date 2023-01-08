Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40127661505
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 13:27:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqbtT0hFlz3c8q
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 23:27:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XK55JtLh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XK55JtLh;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NqbsT37pmz2xvL
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 23:26:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673180781; x=1704716781;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=owjEx2HM2D3CQiSbaG9f+v4op2rLBDinU0Ekudz3LwA=;
  b=XK55JtLhzOZm268GAtJm4I5jMBryIJUaNpRdID7WdcNic460D7fh3ZYv
   NO0gYF4mpyOpkriIy7GigusxWDIgR8uwNH6YCRW3HCbNLiFeXoFVrTp+z
   C0HnMv5LhZDF/E+x3UXvdHEgRd+1Ca2F6Go/weiOPmdRdw5kZ8WmjmHEQ
   T0TgtNbeKeOUiIm5Z3Bja6CwYdDM/cuf7V+93S9jHvR8/FQroCYFGPcQe
   NGXCFOBg80cx93tOjiipvohl6WmFNAWZ4XT0cpTN8ZTU+ihYfyULtdJzB
   BROWQFzXEhol7n1XhkRjjBTTOkoPBJeSMXKeW020yuoySo9jBcZQ1Qv2p
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10583"; a="349928297"
X-IronPort-AV: E=Sophos;i="5.96,310,1665471600"; 
   d="scan'208";a="349928297"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2023 04:26:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10583"; a="606337939"
X-IronPort-AV: E=Sophos;i="5.96,310,1665471600"; 
   d="scan'208";a="606337939"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 08 Jan 2023 04:26:15 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pEUkh-0005LU-0J;
	Sun, 08 Jan 2023 12:26:15 +0000
Date: Sun, 08 Jan 2023 20:26:09 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 be5f95c8779e19779dd81927c8574fec5aaba36c
Message-ID: <63bab661.A/295G1dGX6Wjgft%lkp@intel.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: be5f95c8779e19779dd81927c8574fec5aaba36c  powerpc/vmlinux.lds: Don't discard .comment

elapsed time: 2157m

configs tested: 155
configs skipped: 107

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                 linkstation_defconfig
i386                             allyesconfig
i386                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
x86_64                            allnoconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
sparc64                             defconfig
powerpc                       ppc64_defconfig
sh                            titan_defconfig
ia64                             alldefconfig
powerpc                     mpc83xx_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
powerpc                      ppc40x_defconfig
arc                              alldefconfig
mips                           ci20_defconfig
arm                        cerfcube_defconfig
m68k                        mvme147_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm                        clps711x_defconfig
arm                       imx_v6_v7_defconfig
mips                           xway_defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
mips                             allyesconfig
sh                               allmodconfig
arm                            lart_defconfig
mips                         db1xxx_defconfig
powerpc                      ppc6xx_defconfig
mips                         cobalt_defconfig
sh                          rsk7264_defconfig
x86_64                           alldefconfig
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                          randconfig-c001
arm64                               defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                     rainier_defconfig
sh                           se7619_defconfig
arm                        oxnas_v6_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
ia64                        generic_defconfig
nios2                            allyesconfig
sh                           sh2007_defconfig
powerpc                   currituck_defconfig
powerpc                      pasemi_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
xtensa                  cadence_csp_defconfig
sh                           se7722_defconfig
mips                            gpr_defconfig
arm                        trizeps4_defconfig
nios2                         3c120_defconfig
s390                       zfcpdump_defconfig
arm                           imxrt_defconfig
arc                            hsdk_defconfig
arm                        mini2440_defconfig
mips                           ip32_defconfig
riscv                            allmodconfig
mips                       bmips_be_defconfig
powerpc                         wii_defconfig
arm                          pxa3xx_defconfig
sh                        dreamcast_defconfig
sh                            migor_defconfig
xtensa                          iss_defconfig
sh                              ul2_defconfig
arm                       multi_v4t_defconfig
mips                           gcw0_defconfig
powerpc                  storcenter_defconfig
alpha                               defconfig
mips                     loongson1b_defconfig
ia64                            zx1_defconfig
sparc                       sparc64_defconfig
arc                    vdk_hs38_smp_defconfig
sh                     sh7710voipgw_defconfig
sh                ecovec24-romimage_defconfig
sh                                  defconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                             rpc_defconfig
powerpc                     sequoia_defconfig
sh                 kfr2r09-romimage_defconfig
arm                  randconfig-c002-20230108
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allyesconfig
mips                         bigsur_defconfig
riscv             nommu_k210_sdcard_defconfig
openrisc                 simple_smp_defconfig
sh                          landisk_defconfig
powerpc                      mgcoge_defconfig
xtensa                    smp_lx200_defconfig
s390                             allyesconfig
sh                             sh03_defconfig
ia64                         bigsur_defconfig
sh                           se7751_defconfig
arc                      axs103_smp_defconfig
powerpc                      cm5200_defconfig

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-k001
hexagon              randconfig-r041-20230107
hexagon              randconfig-r045-20230107
arm                  randconfig-r046-20230107
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
powerpc                 xes_mpc85xx_defconfig
powerpc                          g5_defconfig
arm                          ixp4xx_defconfig
arm                         palmz72_defconfig
arm                         orion5x_defconfig
arm                           spitz_defconfig
arm                       aspeed_g4_defconfig
powerpc                     mpc5200_defconfig
x86_64                           allyesconfig
arm                       imx_v4_v5_defconfig
mips                     loongson1c_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                     pseries_defconfig
mips                        maltaup_defconfig
powerpc                      ppc64e_defconfig
mips                  cavium_octeon_defconfig
mips                           ip28_defconfig
arm                       cns3420vb_defconfig
powerpc                 mpc8560_ads_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
