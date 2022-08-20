Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DF759ADF7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 14:42:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8yvQ723mz3c79
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 22:42:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jWmB5Obm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jWmB5Obm;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8ytq40Psz30hw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 22:42:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660999331; x=1692535331;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jxp7QfCkJu5Tk9gA94TRau/Zv7j2RahznbPfx4Cx15I=;
  b=jWmB5ObmpfKxbpEj6L8rb8u/v98rfnqS9sSj0CegRoRxD7RG3n8cni/g
   0YSTzcZ0V43YZRii1LY0xHkh+YFTuI9VgLefwrlYwoErYGoxRiQFRKkBM
   3ixA3VdGX8z3dTjjVQziueXncMlyzRKj2Vw6IAlS/i/pq+UVE0Qn7DTcK
   qvb/+KTjjS6ryIzcfjeWib7E8AKQMgjawr8h2CiqWOmPX5igk/TKGfWZ5
   VXy2y612tuWnUOT15JG+jQo9WVat/ZrNYhWjfV1QkrqsSRCa67hfcgkZY
   jqH81KawFJ1skAxbedAtRn8BPzPDWEf8sfU1lvS0yE8431rgx07IjcCvQ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="293959132"
X-IronPort-AV: E=Sophos;i="5.93,251,1654585200"; 
   d="scan'208";a="293959132"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2022 05:42:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,251,1654585200"; 
   d="scan'208";a="637593155"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Aug 2022 05:42:06 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oPNnh-0002fD-2O;
	Sat, 20 Aug 2022 12:42:05 +0000
Date: Sat, 20 Aug 2022 20:41:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 bbee0d0affda40bb0917813cf416ac6ccbe1d5fa
Message-ID: <6300d664.C4FdUsPCZm4hpARk%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: bbee0d0affda40bb0917813cf416ac6ccbe1d5fa  powerpc/vdso: Don't map VDSO at a fixed address on PPC32

elapsed time: 1479m

configs tested: 171
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
i386                             allyesconfig
i386                                defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
mips                    maltaup_xpa_defconfig
openrisc                  or1klitex_defconfig
arm                         at91_dt_defconfig
powerpc                      tqm8xx_defconfig
openrisc                            defconfig
sh                          lboxre2_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
riscv             nommu_k210_sdcard_defconfig
i386                          randconfig-c001
loongarch                           defconfig
loongarch                         allnoconfig
riscv                randconfig-r042-20220820
s390                 randconfig-r044-20220820
arc                  randconfig-r043-20220820
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                    amigaone_defconfig
arm                         lpc18xx_defconfig
arm                          iop32x_defconfig
arm                        mini2440_defconfig
microblaze                          defconfig
powerpc                 linkstation_defconfig
arm                             ezx_defconfig
ia64                                defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                           u8500_defconfig
ia64                        generic_defconfig
powerpc                  storcenter_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                                defconfig
powerpc                     asp8347_defconfig
mips                             allmodconfig
powerpc                         wii_defconfig
powerpc                     ep8248e_defconfig
mips                         db1xxx_defconfig
s390                          debug_defconfig
powerpc                     rainier_defconfig
csky                                defconfig
loongarch                 loongson3_defconfig
openrisc                 simple_smp_defconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
m68k                             alldefconfig
sh                           se7722_defconfig
arm                        spear6xx_defconfig
sh                            hp6xx_defconfig
sh                     sh7710voipgw_defconfig
xtensa                generic_kc705_defconfig
um                                  defconfig
arm                          simpad_defconfig
powerpc                  iss476-smp_defconfig
s390                       zfcpdump_defconfig
mips                           jazz_defconfig
m68k                            mac_defconfig
powerpc                     stx_gp3_defconfig
m68k                          amiga_defconfig
arm                        oxnas_v6_defconfig
mips                     decstation_defconfig
arm                            qcom_defconfig
powerpc                      ppc40x_defconfig
microblaze                      mmu_defconfig
arm                         cm_x300_defconfig
xtensa                          iss_defconfig
parisc                generic-32bit_defconfig
arm                           viper_defconfig
sh                         apsh4a3a_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                          atari_defconfig
sh                          sdk7780_defconfig
sh                         ecovec24_defconfig
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
arc                     haps_hs_smp_defconfig
mips                            ar7_defconfig
mips                          rb532_defconfig
m68k                        m5407c3_defconfig
arm                           imxrt_defconfig
m68k                          sun3x_defconfig
arm                          exynos_defconfig
mips                           ci20_defconfig
sh                        edosk7760_defconfig
powerpc                      cm5200_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220820
powerpc                      ep88xc_defconfig
arm                            zeus_defconfig
mips                      maltasmvp_defconfig
sh                        edosk7705_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig

clang tested configs:
riscv                randconfig-r042-20220819
s390                 randconfig-r044-20220819
hexagon              randconfig-r045-20220819
hexagon              randconfig-r041-20220819
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-k001
arm                                 defconfig
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
powerpc                      ppc64e_defconfig
mips                malta_qemu_32r6_defconfig
mips                        omega2p_defconfig
mips                          malta_defconfig
powerpc                    gamecube_defconfig
arm                         orion5x_defconfig
arm                       mainstone_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                     loongson1c_defconfig
i386                             allyesconfig
powerpc                     ksi8560_defconfig
arm                         socfpga_defconfig
arm                       versatile_defconfig
mips                     cu1000-neo_defconfig
powerpc                      ppc44x_defconfig
arm                         hackkit_defconfig
powerpc                 mpc8315_rdb_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
