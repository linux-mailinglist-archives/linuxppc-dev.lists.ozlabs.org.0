Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6428C6037AD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 03:52:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsYd91Jccz3drf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 12:52:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ik9O65iV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ik9O65iV;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsYcD4zYVz2xk6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Oct 2022 12:51:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666144284; x=1697680284;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UXT7gG971oP2JXBdlaihyL6YBUUTMqiNAezgGXZRaKM=;
  b=Ik9O65iV+Y0byBDxiyyYlbRcKtSbYy5nWEpwa1ddr0iUEZTFW8kxnQS6
   Gt4W8KYw2eaQlbEMIlVnT36hLZqHRXxxv0sRxdyxBevDLSxqapiMNBhJn
   nk8LhHYPuq7I1JPPCmDNiIl5imFIMIxM/d84UAX0vhm0lx0rcrXAioOiv
   b7CmmLsnZFC4X9tUrr+/GsyZEn/kAVjs0E3G+8oEXbF7ihSQoEJkymS0d
   pkBQTCbiLWsxS1gbvHZr9qz6IV1EKo5BUpYpH7eKrytuQvxZlN7SLoCNX
   gkHKQzU+4BpyCXpgessmmurneiy9LuNI7V6riJu/oVWq6D39cEV7SUQau
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="370501261"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; 
   d="scan'208";a="370501261"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 18:51:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="771523029"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; 
   d="scan'208";a="771523029"
Received: from lkp-server01.sh.intel.com (HELO 8381f64adc98) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Oct 2022 18:51:12 -0700
Received: from kbuild by 8381f64adc98 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1okyEi-0002Fa-0M;
	Wed, 19 Oct 2022 01:51:12 +0000
Date: Wed, 19 Oct 2022 09:51:11 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes] BUILD SUCCESS
 2147783d6bf0b7ca14c72a25527dc5135bd17f65
Message-ID: <634f580f.KR7/PXpXuGAgyYaL%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes
branch HEAD: 2147783d6bf0b7ca14c72a25527dc5135bd17f65  powerpc/pseries: Use lparcfg to reconfig VAS windows for DLPAR CPU

elapsed time: 721m

configs tested: 90
configs skipped: 109

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
mips                             allyesconfig
sh                               allmodconfig
sh                   sh7724_generic_defconfig
ia64                          tiger_defconfig
microblaze                      mmu_defconfig
powerpc                      ppc6xx_defconfig
xtensa                  audio_kc705_defconfig
arc                           tb10x_defconfig
openrisc                 simple_smp_defconfig
arc                  randconfig-r043-20221018
s390                 randconfig-r044-20221018
riscv                randconfig-r042-20221018
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                             allyesconfig
i386                                defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                          randconfig-c001
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
powerpc                     stx_gp3_defconfig
powerpc                   currituck_defconfig
powerpc                 mpc834x_mds_defconfig
ia64                             allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arm                        spear6xx_defconfig
arm                         assabet_defconfig
mips                 decstation_r4k_defconfig
arm                        mvebu_v7_defconfig
nios2                               defconfig
m68k                          amiga_defconfig
openrisc                         alldefconfig
arm                      jornada720_defconfig
sh                          r7780mp_defconfig
arm                         axm55xx_defconfig
ia64                        generic_defconfig
arm                           tegra_defconfig
powerpc                      chrp32_defconfig
mips                         db1xxx_defconfig
powerpc                  storcenter_defconfig
powerpc                 canyonlands_defconfig
sh                          urquell_defconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-k001
x86_64                        randconfig-c007
mips                 randconfig-c004-20221018
i386                          randconfig-c001
s390                 randconfig-c005-20221018
arm                  randconfig-c002-20221018
riscv                randconfig-c006-20221018
powerpc              randconfig-c003-20221018
arm                      tct_hammer_defconfig
riscv                             allnoconfig
i386                 randconfig-a013-20221017
i386                 randconfig-a015-20221017
i386                 randconfig-a016-20221017
i386                 randconfig-a011-20221017
i386                 randconfig-a014-20221017
i386                 randconfig-a012-20221017

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
