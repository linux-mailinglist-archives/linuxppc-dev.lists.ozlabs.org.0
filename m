Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E0B5B430F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 01:35:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPXQn6jh3z3c74
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 09:34:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pgg1Wnp2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pgg1Wnp2;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPXQ727xxz306l
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 09:34:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662766463; x=1694302463;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kexUsGNLS1PTgdK7Z7JpDfdVWOS8kCTW9fvcwVRu1BI=;
  b=Pgg1Wnp2/Q9l70fVzo/W/dv9USrFb+TEEMVzgmkm8GgpQwQtuDu2vfKY
   0ZFD1cizkxa8d5mDk54IOL93Q2F55PzTHD5KMuSmKsMDzeW9Ek8jejdCq
   sW54xuqJHgtLA1Yl7KTowGSli/fjlqrT2N4BGF5TtQRWMCO3QJsjnPjLV
   S1KY3JHD9M0vQkQAcOtD/PGQSWsRqGhGtBqmwOBJ3IAGqVYXSJCmPy9iX
   dOnGkrkhQjVps7XJKsTi7qZ0H2fr0pnPOxZc+PFJbbbCbyyd+3V9hUBr5
   LUA3ckkWVn57UWtRtt3ZoF24hVyeJlWm90moLQCfxkwzauZUxpTvjhSub
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="295173328"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="295173328"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 16:34:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="677362551"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 09 Sep 2022 16:34:14 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWnVl-0001rQ-1e;
	Fri, 09 Sep 2022 23:34:13 +0000
Date: Sat, 10 Sep 2022 07:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 a66de5283e16602b74658289360505ceeb308c90
Message-ID: <631bcd70.jTyR3JHUoYvgsvqJ%lkp@intel.com>
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
branch HEAD: a66de5283e16602b74658289360505ceeb308c90  powerpc/pseries: Fix plpks crash on non-pseries

elapsed time: 723m

configs tested: 105
configs skipped: 115

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
i386                             allyesconfig
i386                                defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
mips                             allyesconfig
sh                               allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
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
x86_64                        randconfig-a006
csky                              allnoconfig
arm64                            allyesconfig
arm                              allyesconfig
loongarch                           defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a013
x86_64                        randconfig-a015
arc                              allyesconfig
sh                             shx3_defconfig
xtensa                              defconfig
s390                       zfcpdump_defconfig
mips                        bcm47xx_defconfig
riscv                               defconfig
nios2                         10m50_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                           sunxi_defconfig
sh                        dreamcast_defconfig
arm                            zeus_defconfig
riscv                randconfig-r042-20220908
arc                  randconfig-r043-20220907
arc                  randconfig-r043-20220908
s390                 randconfig-r044-20220908
arm                                 defconfig
sh                        sh7763rdp_defconfig
xtensa                           allyesconfig
powerpc                     tqm8541_defconfig
powerpc                       holly_defconfig
i386                          randconfig-a016
x86_64                        randconfig-a002
sh                             espt_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                            mps2_defconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
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
x86_64                        randconfig-a011
m68k                        m5407c3_defconfig
nios2                         3c120_defconfig
loongarch                         allnoconfig
arm                         cm_x300_defconfig
powerpc                    klondike_defconfig
arm                          badge4_defconfig

clang tested configs:
riscv                randconfig-r042-20220909
hexagon              randconfig-r041-20220909
hexagon              randconfig-r045-20220909
s390                 randconfig-r044-20220909
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
powerpc                          allmodconfig
powerpc                     tqm8540_defconfig
powerpc                      ppc44x_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
riscv                randconfig-r042-20220907
hexagon              randconfig-r041-20220907
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
hexagon              randconfig-r041-20220908
hexagon              randconfig-r045-20220908
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
