Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73889584939
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 03:05:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lv8TZ348Vz2xmp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 11:05:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ucz0uf8D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ucz0uf8D;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lv8Sq0VdTz2xJ4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 11:05:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659056715; x=1690592715;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=a89cG/pAcKaVRLGEfxRvdj5i5n7RdVqbXEMDMaRsSjo=;
  b=Ucz0uf8D9Qe7hdJxUJkhwFL0sisRZuya8YfEFC1a962pjSfx3JPjw+id
   diLWaFSIc8qGLLMSZgEeBDSjAcG73bYh7SyoFevciy/QxOaZC/IICx8nv
   QGLKhT33QtKx2AkPEzGRmhrM2kRgiUBk6ybcJRd9IYThCF2KV+ndeSqbS
   qe/qAoLMl6qqfRDkm/d+QWKfICfyCh5IiI1wZWuCj90CNfiDwhCK7AliN
   lkPJPHp2+s383fZiOv677iSOJE4ql6IT4qKQF9eVKxmptnY9kEleHRQ4g
   wnsoq82WlCEN4JzcQ4nM8y8FPv/78+Pq3TZeH4g/VDi8GO37ikKrB1DNM
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="352661587"
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; 
   d="scan'208";a="352661587"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 18:05:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; 
   d="scan'208";a="660019645"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Jul 2022 18:05:02 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oHER3-000Aok-2D;
	Fri, 29 Jul 2022 01:05:01 +0000
Date: Fri, 29 Jul 2022 09:04:42 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 f4a0318f278d98d9492916722e85f258c2221f88
Message-ID: <62e3322a.F7ksVKsRyMgl5Ow3%lkp@intel.com>
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
branch HEAD: f4a0318f278d98d9492916722e85f258c2221f88  powerpc: add support for syscall stack randomization

elapsed time: 721m

configs tested: 98
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220728
riscv                randconfig-r042-20220728
s390                 randconfig-r044-20220728
i386                          randconfig-a016
i386                                defconfig
i386                          randconfig-a001
x86_64                        randconfig-a002
x86_64                        randconfig-a015
i386                             allyesconfig
powerpc                           allnoconfig
i386                          randconfig-a005
x86_64                        randconfig-a013
i386                          randconfig-a003
powerpc                          allmodconfig
i386                          randconfig-a014
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a011
x86_64                        randconfig-a006
mips                             allyesconfig
arm                                 defconfig
i386                          randconfig-a012
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a004
arm64                            allyesconfig
x86_64                          rhel-8.3-func
arm                              allyesconfig
x86_64                         rhel-8.3-kunit
ia64                             allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
s390                       zfcpdump_defconfig
openrisc                         alldefconfig
i386                          randconfig-c001
xtensa                  cadence_csp_defconfig
mips                           ip32_defconfig
arc                            hsdk_defconfig
sh                 kfr2r09-romimage_defconfig
sh                     sh7710voipgw_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                        m5407c3_defconfig
powerpc                     taishan_defconfig
sh                         ap325rxa_defconfig
powerpc                      tqm8xx_defconfig
arm                          lpd270_defconfig
x86_64                           allyesconfig
ia64                        generic_defconfig
sh                           se7343_defconfig
arm                            mps2_defconfig
openrisc                    or1ksim_defconfig
alpha                            allyesconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                 randconfig-c004-20220728
powerpc              randconfig-c003-20220728
nios2                               defconfig
m68k                            mac_defconfig

clang tested configs:
hexagon              randconfig-r045-20220728
hexagon              randconfig-r041-20220728
i386                          randconfig-a002
x86_64                        randconfig-a014
x86_64                        randconfig-a001
i386                          randconfig-a006
x86_64                        randconfig-a016
i386                          randconfig-a004
x86_64                        randconfig-a003
i386                          randconfig-a013
x86_64                        randconfig-a005
i386                          randconfig-a015
x86_64                        randconfig-a012
i386                          randconfig-a011
x86_64                        randconfig-k001
powerpc                     tqm5200_defconfig
powerpc                        fsp2_defconfig
powerpc                      katmai_defconfig
powerpc                   microwatt_defconfig
powerpc                      ppc64e_defconfig
mips                          rm200_defconfig
arm                  colibri_pxa270_defconfig
arm                      pxa255-idp_defconfig
powerpc                  mpc885_ads_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
