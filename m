Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6094F0F5D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 08:28:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KX17Z57Chz3bp0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 16:28:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j6hNSDwS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=j6hNSDwS; dkim-atps=neutral
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KX16x0ZLcz2xm2
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Apr 2022 16:28:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649053689; x=1680589689;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=2p/oHJv3IZaUNND0rDp4Lfk4ZO6Y3ObMIv51ygU2r7M=;
 b=j6hNSDwSy5jI2qivJ8h1jXDlkEIGD9pBtZGbmxI9z4uVRR6sAnaqGQH7
 unfmbj5SIAighjMQCdHQ6rW+CNRJhVF7EvVPcWkKIH1vABoWUvc7NypQF
 kVRhXX/vfHPQkPpNCj5Wp5DVJC4/wyztSQDmOBexWurAaehe01TdRbNy7
 5GNLz+ghxf1tOOC4KoAPIIiSA0Yuf6Rt8zcvsyG31gPlwxkTcFLdjSLzk
 csn9Trua/lXpIkG7ioBckJKhi3CUjlGttMlyFMlFiR864cDxgwfCt5E4z
 dQZbO7XfY5C8skuWA6dIIWO1QK6GOoHHbaIEkDw5g1yVNtU30r8qvvS0S A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10306"; a="321143883"
X-IronPort-AV: E=Sophos;i="5.90,233,1643702400"; d="scan'208";a="321143883"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2022 23:27:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,233,1643702400"; d="scan'208";a="721535213"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 03 Apr 2022 23:27:03 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nbGB4-0001jd-OT;
 Mon, 04 Apr 2022 06:27:02 +0000
Date: Mon, 04 Apr 2022 14:26:47 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 7f921a2d6c93051b6002dbb7c1781f1fa5b88cce
Message-ID: <624a8fa7.npCvsPdLqfyZOVFW%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 7f921a2d6c93051b6002dbb7c1781f1fa5b88cce  KVM: PPC: Move kvmhv_on_pseries() into kvm_ppc.h

elapsed time: 726m

configs tested: 148
configs skipped: 139

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
arm                          gemini_defconfig
mips                        vocore2_defconfig
powerpc                           allnoconfig
sh                          rsk7269_defconfig
sh                 kfr2r09-romimage_defconfig
parisc64                         alldefconfig
powerpc                    klondike_defconfig
arm                          simpad_defconfig
arm                           stm32_defconfig
parisc                           alldefconfig
alpha                               defconfig
sh                             sh03_defconfig
powerpc                     taishan_defconfig
ia64                        generic_defconfig
arc                            hsdk_defconfig
sh                     sh7710voipgw_defconfig
arm                        oxnas_v6_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                      ppc6xx_defconfig
arm                        spear6xx_defconfig
parisc                generic-64bit_defconfig
x86_64                              defconfig
sh                         ecovec24_defconfig
sh                              ul2_defconfig
powerpc                     stx_gp3_defconfig
arc                              allyesconfig
riscv                    nommu_k210_defconfig
sh                   sh7770_generic_defconfig
arm                         cm_x300_defconfig
m68k                       m5208evb_defconfig
arm                        shmobile_defconfig
sparc                            allyesconfig
mips                           ip32_defconfig
sh                            hp6xx_defconfig
powerpc                     tqm8548_defconfig
m68k                        mvme147_defconfig
powerpc                        cell_defconfig
sh                          rsk7201_defconfig
sh                      rts7751r2d1_defconfig
arm                          pxa910_defconfig
i386                 randconfig-c001-20220404
x86_64               randconfig-c001-20220404
arm                  randconfig-c002-20220404
arm                  randconfig-c002-20220403
x86_64                        randconfig-c001
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
nios2                               defconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a015-20220404
x86_64               randconfig-a011-20220404
x86_64               randconfig-a014-20220404
x86_64               randconfig-a016-20220404
x86_64               randconfig-a012-20220404
x86_64               randconfig-a013-20220404
i386                 randconfig-a014-20220404
i386                 randconfig-a013-20220404
i386                 randconfig-a016-20220404
i386                 randconfig-a015-20220404
i386                 randconfig-a011-20220404
i386                 randconfig-a012-20220404
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
i386                          randconfig-c001
powerpc              randconfig-c003-20220403
riscv                randconfig-c006-20220403
mips                 randconfig-c004-20220403
arm                  randconfig-c002-20220403
powerpc                     mpc5200_defconfig
powerpc                      katmai_defconfig
mips                   sb1250_swarm_defconfig
arm                         socfpga_defconfig
mips                          ath25_defconfig
powerpc                    ge_imp3a_defconfig
x86_64                           allyesconfig
powerpc                  mpc866_ads_defconfig
mips                       rbtx49xx_defconfig
arm                        magician_defconfig
powerpc                     tqm8560_defconfig
powerpc                    socrates_defconfig
powerpc                 mpc8272_ads_defconfig
x86_64               randconfig-a006-20220404
x86_64               randconfig-a002-20220404
x86_64               randconfig-a001-20220404
x86_64               randconfig-a005-20220404
x86_64               randconfig-a003-20220404
x86_64               randconfig-a004-20220404
i386                 randconfig-a006-20220404
i386                 randconfig-a002-20220404
i386                 randconfig-a001-20220404
i386                 randconfig-a004-20220404
i386                 randconfig-a003-20220404
i386                 randconfig-a005-20220404
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220403
riscv                randconfig-r042-20220403
hexagon              randconfig-r041-20220403
hexagon              randconfig-r045-20220404
hexagon              randconfig-r041-20220404

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
