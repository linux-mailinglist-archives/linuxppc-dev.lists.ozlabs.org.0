Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FFB5BAFCC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 17:01:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTchp6d8Dz3cfS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 01:01:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U9YVjbUD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U9YVjbUD;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTcgV5ylRz30Ly
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Sep 2022 01:00:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663340407; x=1694876407;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=f5rKd1GhEEhjzVOQzXcMvgypZFDGlgjFw+rKwpzH5Mo=;
  b=U9YVjbUDF42D6BoswM0YdpHaJW7fdclhJWQFpcH+mczSAG0UhHxXug8q
   KddPQfkC8pcXJ3JvxLuNqWuESJqHpWGvnLg8BbUYHdHi0szn/akK2yNkc
   3Ov9ASNhVlQ2PSuGuYxO7j/zZr8bP9ftdroyIB3yoS7QxDDYdabdryAad
   e1hfpuGqn29XVUjg4kqlQSKn8NTX/OVILUd0wjShA2/fle3jct0l/PDIE
   qYoClCinY9NdShTNB451RjiAovGTMrDyR9jm9ihZyhsNDfJ+18IudUuLA
   p0u3ungkO5Us1igcNjgWrGwF6lBc9yO/Ix7h5o0ATCcRionaTpRXtWxtK
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="297731064"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="297731064"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 08:00:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="686164767"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Sep 2022 07:59:59 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZCow-0001rA-2N;
	Fri, 16 Sep 2022 14:59:58 +0000
Date: Fri, 16 Sep 2022 22:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 f88aabad33ea22be2ce1c60d8901942e4e2a9edb
Message-ID: <63248f5c.fMe9N5Q2zw6r56+W%lkp@intel.com>
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
branch HEAD: f88aabad33ea22be2ce1c60d8901942e4e2a9edb  Revert "powerpc/rtas: Implement reentrant rtas call"

elapsed time: 725m

configs tested: 138
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
um                             i386_defconfig
um                           x86_64_defconfig
arm                                 defconfig
m68k                             allyesconfig
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
x86_64                           allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
s390                             allyesconfig
x86_64                        randconfig-a004
i386                          randconfig-a005
x86_64                        randconfig-a002
i386                                defconfig
riscv                randconfig-r042-20220915
x86_64                        randconfig-a006
arc                  randconfig-r043-20220915
powerpc                           allnoconfig
powerpc                          allmodconfig
s390                 randconfig-r044-20220915
mips                             allyesconfig
i386                             allyesconfig
arm                              allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
arm64                            allyesconfig
x86_64                        randconfig-a015
sh                               allmodconfig
ia64                             allmodconfig
x86_64                        randconfig-c001
i386                          randconfig-c001
arm                  randconfig-c002-20220916
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
i386                          randconfig-a016
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
loongarch                           defconfig
loongarch                         allnoconfig
powerpc                      bamboo_defconfig
arm64                               defconfig
powerpc                      pcm030_defconfig
arm                        mini2440_defconfig
powerpc                  iss476-smp_defconfig
sh                          r7785rp_defconfig
powerpc                        cell_defconfig
xtensa                generic_kc705_defconfig
mips                      maltasmvp_defconfig
arc                        nsim_700_defconfig
m68k                            q40_defconfig
sh                            titan_defconfig
arm                        realview_defconfig
arm                         assabet_defconfig
arm                         nhk8815_defconfig
powerpc                    amigaone_defconfig
arm                        oxnas_v6_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
mips                        bcm47xx_defconfig
arc                           tb10x_defconfig
arc                          axs101_defconfig
openrisc                       virt_defconfig
sh                        sh7763rdp_defconfig
m68k                             alldefconfig
powerpc                      cm5200_defconfig
arc                              alldefconfig
powerpc                     stx_gp3_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                       m5475evb_defconfig
powerpc                      pasemi_defconfig
arm                       aspeed_g5_defconfig
arm                           h3600_defconfig
openrisc                    or1ksim_defconfig
s390                       zfcpdump_defconfig
sh                          kfr2r09_defconfig
alpha                            alldefconfig
arc                      axs103_smp_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
xtensa                    xip_kc705_defconfig
mips                    maltaup_xpa_defconfig
ia64                             allyesconfig
arm                              allmodconfig
m68k                                defconfig
ia64                                defconfig
mips                             allmodconfig
mips                  decstation_64_defconfig
s390                          debug_defconfig
powerpc                     rainier_defconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
hexagon              randconfig-r045-20220915
x86_64                        randconfig-a001
hexagon              randconfig-r041-20220915
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
s390                 randconfig-r044-20220916
hexagon              randconfig-r045-20220916
riscv                randconfig-r042-20220916
hexagon              randconfig-r041-20220916
arm                          sp7021_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     mpc512x_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
