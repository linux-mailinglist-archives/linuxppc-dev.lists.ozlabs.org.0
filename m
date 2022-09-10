Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4855B43AF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 03:47:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPbMQ1Smnz3c2W
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 11:47:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aQvR/dbg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aQvR/dbg;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPbLl66H6z306l
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 11:46:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662774400; x=1694310400;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=w6ltbndk8UuhxpKYV3FBQBKtDvSjEJr5/crLxQ/iV70=;
  b=aQvR/dbgfpd84Ryv6d0PjDl7nKIVRH1ICk+m7pU+uAtihE3Ic16DUfaS
   a84BqdZFX0Fc5Sud4jf23Dd783Tzb3BZSK4JDb4OCzdKJ/VLEbDi6UsJy
   8XsWKJyeDDuwjW8bXhT0/9i5aS1iYKznr/bdhdxAF0m/Gwyd2tE+RkbDL
   uB+KjytiqMAtfBsLG/RklRZzVkW00jbtI5s8RqFriSN5eFINmdboGo2pX
   O2rFngGD90p8C9Thlxrf7NNRFrsYMnFyT5D4R4FxrYj8VSuuW6ynoEPip
   LCgqXEzcAVj1Jjk+FfXK0jNgmNsnhCgwQsP73srzLGyclQ6wp/Ygg7/aK
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="284618244"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="284618244"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 18:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="648638113"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 09 Sep 2022 18:05:20 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWovv-0001wj-10;
	Sat, 10 Sep 2022 01:05:19 +0000
Date: Sat, 10 Sep 2022 09:04:50 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 78c73c80fd860d5b3471d8eaa2778a105a56f6ab
Message-ID: <631be2b2.QZ7dblmWO6f8Asj5%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 78c73c80fd860d5b3471d8eaa2778a105a56f6ab  powerpc/math-emu: Inhibit W=1 warnings

elapsed time: 812m

configs tested: 115
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                               rhel-8.3
i386                                defconfig
x86_64                           allyesconfig
i386                          randconfig-a001
x86_64                        randconfig-a013
i386                          randconfig-a003
powerpc                           allnoconfig
x86_64                        randconfig-a011
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a004
arm                                 defconfig
x86_64                        randconfig-a002
arc                  randconfig-r043-20220908
riscv                randconfig-r042-20220908
x86_64                        randconfig-a006
s390                 randconfig-r044-20220908
i386                             allyesconfig
sh                               allmodconfig
arm                              allyesconfig
mips                             allyesconfig
arm64                            allyesconfig
powerpc                          allmodconfig
loongarch                           defconfig
loongarch                         allnoconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
i386                          randconfig-a012
i386                          randconfig-a014
arc                    vdk_hs38_smp_defconfig
sh                         microdev_defconfig
m68k                       m5475evb_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     tqm8548_defconfig
csky                              allnoconfig
arc                               allnoconfig
nios2                            allyesconfig
sh                             espt_defconfig
sh                     magicpanelr2_defconfig
sh                             shx3_defconfig
xtensa                              defconfig
s390                       zfcpdump_defconfig
mips                        bcm47xx_defconfig
riscv                               defconfig
nios2                         10m50_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                            ar7_defconfig
mips                         rt305x_defconfig
openrisc                    or1ksim_defconfig
arm                           sunxi_defconfig
sh                        dreamcast_defconfig
arm                            zeus_defconfig
arc                  randconfig-r043-20220907
sh                        sh7763rdp_defconfig
xtensa                           allyesconfig
powerpc                     tqm8541_defconfig
powerpc                       holly_defconfig
i386                          randconfig-a016
alpha                             allnoconfig
riscv                             allnoconfig
riscv             nommu_k210_sdcard_defconfig
arm                            mps2_defconfig
arm                        clps711x_defconfig
sh                         ecovec24_defconfig
riscv                            allmodconfig
powerpc                      ppc40x_defconfig
arm                         axm55xx_defconfig
mips                         db1xxx_defconfig
parisc                              defconfig
sh                     sh7710voipgw_defconfig
arm                        keystone_defconfig
x86_64                           alldefconfig
xtensa                    xip_kc705_defconfig
mips                    maltaup_xpa_defconfig
mips                      maltasmvp_defconfig
i386                          randconfig-c001
m68k                        m5407c3_defconfig
nios2                         3c120_defconfig
arm                         cm_x300_defconfig
powerpc                    klondike_defconfig
arm                          badge4_defconfig
ia64                             allmodconfig
mips                      fuloong2e_defconfig

clang tested configs:
i386                          randconfig-a002
x86_64                        randconfig-a012
i386                          randconfig-a004
x86_64                        randconfig-a014
i386                          randconfig-a006
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a001
hexagon              randconfig-r041-20220908
hexagon              randconfig-r045-20220908
x86_64                        randconfig-a003
riscv                randconfig-r042-20220909
hexagon              randconfig-r041-20220909
hexagon              randconfig-r045-20220909
s390                 randconfig-r044-20220909
x86_64                        randconfig-k001
powerpc                          allmodconfig
powerpc                     tqm8540_defconfig
powerpc                      ppc44x_defconfig
riscv                randconfig-r042-20220907
hexagon              randconfig-r041-20220907
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
