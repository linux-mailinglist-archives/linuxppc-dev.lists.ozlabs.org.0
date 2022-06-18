Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FAB55075D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 00:46:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQWH44r5Zz3cgx
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 08:46:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cG3T0mbZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cG3T0mbZ;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQWGN3Tccz3bbQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jun 2022 08:45:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655592348; x=1687128348;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=k3Mv+UYatiajtFHnbkm2F8jBvD7Bv76orJVWKdZWCcU=;
  b=cG3T0mbZekv2O/XB0hR4o3qr2dUFcK9NZGowhkxdfIkSgCG9wYqFpFO/
   gDj9BP5aQoXZlJOEbRuD1Fh+9/kzt66sQ8r4fMtdpYah5MwXqijQF2ebj
   kTBUSb6syeY/PJo/T64dFNNk7poPGLVvZlbjbU4FfA3UHH8uyMPMX0BQc
   z7s81Jcv+fDvWEpXT95eow3oH6AwDrWGDOOwkWcKEnBFRkkQlf0PWdwBM
   eMnKrRfy4CbxKMkQq61sY+ZL7XEs1wiyJ8F/10uboH48O+YMDOlL6q397
   gYpz/if9YnRhQD86HieWJ1BmIQpOyWPd/ibh2veill3uogibJSdWawj8O
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="305116297"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="305116297"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2022 15:45:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="654122785"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jun 2022 15:45:35 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o2hCB-000Qfb-1t;
	Sat, 18 Jun 2022 22:45:35 +0000
Date: Sun, 19 Jun 2022 06:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 7bc08056a6dabc3a1442216daf527edf61ac24b6
Message-ID: <62ae5563.D4ooV9oWmlU/NYOE%lkp@intel.com>
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
branch HEAD: 7bc08056a6dabc3a1442216daf527edf61ac24b6  powerpc/rtas: Allow ibm,platform-dump RTAS call with null buffer address

elapsed time: 723m

configs tested: 114
configs skipped: 94

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
s390                       zfcpdump_defconfig
sh                           se7751_defconfig
sh                            migor_defconfig
mips                            gpr_defconfig
arm                         axm55xx_defconfig
powerpc                  storcenter_defconfig
mips                           xway_defconfig
openrisc                  or1klitex_defconfig
powerpc                         ps3_defconfig
sh                          r7780mp_defconfig
sh                           sh2007_defconfig
arm                         assabet_defconfig
alpha                            alldefconfig
arm                          pxa910_defconfig
arm                            mps2_defconfig
parisc                generic-64bit_defconfig
powerpc                         wii_defconfig
sh                              ul2_defconfig
nios2                            alldefconfig
arm                           sunxi_defconfig
sh                          r7785rp_defconfig
mips                         tb0226_defconfig
arm                            qcom_defconfig
arm                      jornada720_defconfig
m68k                        mvme147_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                       maple_defconfig
mips                     decstation_defconfig
arm                        trizeps4_defconfig
powerpc                  iss476-smp_defconfig
xtensa                  cadence_csp_defconfig
powerpc                        warp_defconfig
xtensa                  audio_kc705_defconfig
m68k                           sun3_defconfig
sh                               alldefconfig
openrisc                            defconfig
arc                      axs103_smp_defconfig
arc                        nsimosci_defconfig
sh                             shx3_defconfig
csky                             alldefconfig
sh                        sh7763rdp_defconfig
m68k                       m5249evb_defconfig
m68k                             alldefconfig
ia64                            zx1_defconfig
ia64                                defconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                          pcm027_defconfig
powerpc                    gamecube_defconfig
arm                       spear13xx_defconfig
powerpc                     tqm8560_defconfig
mips                       rbtx49xx_defconfig
powerpc                 mpc8272_ads_defconfig
arm                                 defconfig
s390                             alldefconfig
mips                   sb1250_swarm_defconfig
arm                         shannon_defconfig
arm                         s3c2410_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                          allmodconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
