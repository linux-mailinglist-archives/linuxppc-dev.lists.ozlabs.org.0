Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3982589691
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Aug 2022 05:32:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LyvRq5z65z3c6K
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Aug 2022 13:32:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RprGXzxF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RprGXzxF;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LyvR81ydbz2xbC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Aug 2022 13:31:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659583908; x=1691119908;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lEG+9sk6aFn1DS+5MnCe3WAzpLAl8SayGDWghuMKT2c=;
  b=RprGXzxFJ0zNmo2YFQPqrF/kQg5yF5STWDYqvcLohI61H/o4E8wsfPPp
   uKB/e3FDLH0iLR3y978TidNWEF2i4WAOv8/JcKuLqMeS4Fp1/fYTi8H6S
   ytU5FWGIyZb0rsJf5GE/GaYS6vEjd3pdu54gf7jX+fWuAuOIZWzwdtwpg
   /Y0ZvoFBEA5tExsNLmpi9lLMacULmoIP5RBKhO132OoHHPObjkVOHLvvY
   KGUPekA60m1R7aJQudxFQ+b3welI5mggGzJM0e3g99Po8QyQWTgmGxsup
   0TkH8+gkv8m7LuipQaa16JEdvHpWQQAll/KgZ0HHASWBq5CX95zerbJKy
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="290603604"
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; 
   d="scan'208";a="290603604"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 20:31:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; 
   d="scan'208";a="662349792"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Aug 2022 20:31:37 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJRaC-000HzL-2N;
	Thu, 04 Aug 2022 03:31:36 +0000
Date: Thu, 04 Aug 2022 11:31:06 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 4cfa6ff24a9744ba484521c38bea613134fbfcb3
Message-ID: <62eb3d7a.7TxpNBqDyPN+9FHs%lkp@intel.com>
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
branch HEAD: 4cfa6ff24a9744ba484521c38bea613134fbfcb3  powerpc/64e: Fix kexec build error

elapsed time: 714m

configs tested: 92
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
powerpc                           allnoconfig
mips                             allyesconfig
i386                                defconfig
powerpc                          allmodconfig
m68k                             allmodconfig
x86_64                        randconfig-a015
i386                          randconfig-a016
i386                             allyesconfig
i386                          randconfig-a014
x86_64                              defconfig
i386                          randconfig-a012
ia64                             allmodconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a006
x86_64                        randconfig-a002
i386                          randconfig-a001
arc                              allyesconfig
arm                                 defconfig
i386                          randconfig-a005
alpha                            allyesconfig
x86_64                        randconfig-a004
i386                          randconfig-a003
m68k                             allyesconfig
arc                  randconfig-r043-20220803
sh                               allmodconfig
x86_64                               rhel-8.3
riscv                randconfig-r042-20220803
x86_64                           allyesconfig
s390                 randconfig-r044-20220803
arm                              allyesconfig
arm64                            allyesconfig
sh                   secureedge5410_defconfig
arm                      footbridge_defconfig
sh                          landisk_defconfig
i386                          randconfig-c001
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
powerpc                      ep88xc_defconfig
sparc                       sparc32_defconfig
sh                     magicpanelr2_defconfig
sparc64                          alldefconfig
loongarch                           defconfig
loongarch                         allnoconfig
sparc                               defconfig
sh                           se7780_defconfig
mips                     loongson1b_defconfig
powerpc                      makalu_defconfig
sh                          sdk7780_defconfig
arm                            qcom_defconfig
m68k                       m5208evb_defconfig
sh                          polaris_defconfig
arc                                 defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
m68k                         amcore_defconfig
powerpc                 linkstation_defconfig
xtensa                         virt_defconfig
arm                        multi_v7_defconfig
sh                          rsk7264_defconfig

clang tested configs:
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
x86_64                        randconfig-a005
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a004
i386                          randconfig-a002
hexagon              randconfig-r041-20220803
i386                          randconfig-a006
hexagon              randconfig-r045-20220803
x86_64                        randconfig-k001
arm                         hackkit_defconfig
powerpc                        fsp2_defconfig
mips                      maltaaprp_defconfig
arm                       mainstone_defconfig
arm                       spear13xx_defconfig
mips                           ip22_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
