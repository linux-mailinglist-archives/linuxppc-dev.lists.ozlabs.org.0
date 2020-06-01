Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C87961E9D3C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 07:22:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49b3T15nLczDqMK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 15:22:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49b3R81KdfzDqJQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jun 2020 15:20:36 +1000 (AEST)
IronPort-SDR: ZIqYAM2xIpyDXFwvbxA2ZxKaaJFan5xOSXOwJBUdjAGzp9sGxB1xqVxbQNXX+kuUS37xadvaBn
 ZFezG/Y/Bkqw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2020 22:20:33 -0700
IronPort-SDR: 6LSEttQRc9u7WMhw7EQhN4O5962xm33vzL4HMQLT5Tl/Hx2JwWbT9UuxTcOrKP6TEYmH86XVBa
 gyxMo/YIx3NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,459,1583222400"; d="scan'208";a="268202349"
Received: from lkp-server01.sh.intel.com (HELO 49d03d9b0ee7) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 31 May 2020 22:20:31 -0700
Received: from kbuild by 49d03d9b0ee7 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jfcsA-0000FU-Bf; Mon, 01 Jun 2020 05:20:30 +0000
Date: Mon, 01 Jun 2020 13:19:28 +0800
From: kbuild test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 e376ca093587eafd840bb0f9df04090e2a54249c
Message-ID: <5ed48fe0.pTi7Yry8+hoSh2pW%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  next-test
branch HEAD: e376ca093587eafd840bb0f9df04090e2a54249c  powerpc/module_64: Use special stub for _mcount() with -mprofile-kernel

Warning in current branch:

kernel/events/hw_breakpoint.c:216:12: warning: no previous prototype for 'arch_reserve_bp_slot' [-Wmissing-prototypes]
kernel/events/hw_breakpoint.c:221:13: warning: no previous prototype for 'arch_release_bp_slot' [-Wmissing-prototypes]

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-allmodconfig
|   |-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_release_bp_slot
|   `-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_reserve_bp_slot
|-- arm64-allyesconfig
|   |-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_release_bp_slot
|   `-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_reserve_bp_slot
|-- arm64-defconfig
|   |-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_release_bp_slot
|   `-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_reserve_bp_slot
|-- i386-allnoconfig
|   |-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_release_bp_slot
|   `-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_reserve_bp_slot
|-- i386-randconfig-m021-20200529
|   |-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_release_bp_slot
|   `-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_reserve_bp_slot
|-- i386-tinyconfig
|   |-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_release_bp_slot
|   `-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_reserve_bp_slot
|-- sh-shmin_defconfig
|   |-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_release_bp_slot
|   `-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_reserve_bp_slot
|-- x86_64-defconfig
|   |-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_release_bp_slot
|   `-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_reserve_bp_slot
`-- x86_64-randconfig-m001-20200531
    |-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_release_bp_slot
    `-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_reserve_bp_slot

elapsed time: 3868m

configs tested: 143
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                          pxa3xx_defconfig
arm                         palmz72_defconfig
sh                            shmin_defconfig
ia64                            zx1_defconfig
riscv                          rv32_defconfig
xtensa                          iss_defconfig
powerpc                      pasemi_defconfig
sparc                       sparc64_defconfig
mips                  decstation_64_defconfig
mips                          ath79_defconfig
mips                              allnoconfig
mips                        qi_lb60_defconfig
sh                            migor_defconfig
sh                     magicpanelr2_defconfig
mips                   sb1250_swarm_defconfig
powerpc                  mpc885_ads_defconfig
arm                       aspeed_g5_defconfig
mips                        maltaup_defconfig
arc                             nps_defconfig
sh                          rsk7269_defconfig
mips                             allyesconfig
ia64                        generic_defconfig
m68k                            q40_defconfig
sh                           se7724_defconfig
mips                malta_qemu_32r6_defconfig
mips                            e55_defconfig
mips                       lemote2f_defconfig
arm                         ebsa110_defconfig
arm                            lart_defconfig
sh                         microdev_defconfig
arm                          badge4_defconfig
arm                        oxnas_v6_defconfig
x86_64                              defconfig
powerpc                    adder875_defconfig
mips                            ar7_defconfig
arm                        keystone_defconfig
arm                           viper_defconfig
arm                            pleb_defconfig
sh                             espt_defconfig
arm                           omap1_defconfig
arm                       spear13xx_defconfig
sparc64                          allyesconfig
microblaze                    nommu_defconfig
arm                     davinci_all_defconfig
c6x                                 defconfig
i386                              allnoconfig
arm                            qcom_defconfig
powerpc                    amigaone_defconfig
nios2                         10m50_defconfig
arm                         s3c6400_defconfig
openrisc                            defconfig
powerpc                             defconfig
arc                           tb10x_defconfig
arm                        mvebu_v7_defconfig
powerpc                mpc7448_hpc2_defconfig
xtensa                              defconfig
s390                       zfcpdump_defconfig
s390                             allyesconfig
arm                       cns3420vb_defconfig
arm                        spear3xx_defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20200529
i386                 randconfig-a001-20200529
i386                 randconfig-a002-20200529
i386                 randconfig-a006-20200529
i386                 randconfig-a003-20200529
i386                 randconfig-a005-20200529
i386                 randconfig-a013-20200529
i386                 randconfig-a011-20200529
i386                 randconfig-a012-20200529
i386                 randconfig-a015-20200529
i386                 randconfig-a016-20200529
i386                 randconfig-a014-20200529
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allyesconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
