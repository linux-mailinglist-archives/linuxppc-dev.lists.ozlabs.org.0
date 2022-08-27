Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEAC5A3374
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 03:28:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDzcG45CNz3bTZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 11:28:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LSMvFNSA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LSMvFNSA;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDzbd1NCRz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Aug 2022 11:27:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661563677; x=1693099677;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=f+cDxwb3s4Kx3XgE7MYI6tKW5loC1CQI7D2oJ7qGg7U=;
  b=LSMvFNSAUBuRTsOzeqqtY6caU3PCc2YCc8z3AamadGm7SfPBU6zNIJXd
   SJO3kWlxf48fNjodlJJSt+FAkuVQq24WHaUUq9uoN+z9xi4t6iJmLU4io
   mWqLUchOhR/WKMeIfvIqs1n6IU332N+1Sbz4xroqT/D4Vs0CzpzHYYbCh
   DsaraGPQTxlDqLaPmZ8qE6EyTLd7RokbxmFF852Ek+HlJp3/0VusMgtwq
   JnkYUJhjoJmzOCaDIr5+q88m/5UoZghNB4TkcN1h5UKKBzPIX7VjaI2+/
   So6M0THGYsvwQQY2rNJgaCyqIwfPNReZli4IzAQeLNHMN7AsH5Txntipl
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="320735313"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="320735313"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2022 18:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="610743638"
Received: from lkp-server01.sh.intel.com (HELO 71b0d3b5b1bc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 26 Aug 2022 18:27:31 -0700
Received: from kbuild by 71b0d3b5b1bc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oRkbi-0000pC-3A;
	Sat, 27 Aug 2022 01:27:30 +0000
Date: Sat, 27 Aug 2022 09:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 fd20b60aea6a37788f2f761af405b41c6c34473b
Message-ID: <630972e0.jNWfaLhChM2KlFlB%lkp@intel.com>
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
branch HEAD: fd20b60aea6a37788f2f761af405b41c6c34473b  powerpc/82xx: remove spidev node from mgcoge

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- powerpc-randconfig-r031-20220825
    |-- drivers-dma-ppc4xx-adma.c:warning:expecting-prototype-for-ppc440spe_adma_device_estimate().-Prototype-was-for-ppc440spe_adma_estimate()-instead
    |-- drivers-dma-ppc4xx-adma.c:warning:expecting-prototype-for-ppc440spe_adma_pq_zero_sum_set_dest().-Prototype-was-for-ppc440spe_adma_pqzero_sum_set_dest()-instead
    `-- drivers-dma-ppc4xx-adma.c:warning:expecting-prototype-for-ppc440spe_rxor_set_region_data().-Prototype-was-for-ppc440spe_rxor_set_region()-instead

elapsed time: 722m

configs tested: 131
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
loongarch                         allnoconfig
alpha                               defconfig
arc                                 defconfig
loongarch                           defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a006
um                             i386_defconfig
i386                                defconfig
powerpc                           allnoconfig
um                           x86_64_defconfig
i386                          randconfig-a001
s390                                defconfig
i386                          randconfig-a003
s390                             allmodconfig
i386                          randconfig-a016
x86_64                              defconfig
powerpc                          allmodconfig
x86_64                        randconfig-a002
i386                          randconfig-a012
sh                               allmodconfig
alpha                            allyesconfig
x86_64                               rhel-8.3
m68k                             allyesconfig
x86_64                        randconfig-a015
arm                                 defconfig
i386                          randconfig-a005
mips                             allyesconfig
m68k                             allmodconfig
i386                          randconfig-a014
arc                              allyesconfig
s390                             allyesconfig
x86_64                           allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a013
x86_64                        randconfig-a011
arm64                            allyesconfig
i386                             allyesconfig
arm                              allyesconfig
nios2                               defconfig
nios2                            allyesconfig
arc                  randconfig-r043-20220824
riscv                randconfig-r042-20220824
parisc                           allyesconfig
s390                 randconfig-r044-20220826
parisc64                            defconfig
arc                  randconfig-r043-20220823
parisc                              defconfig
s390                 randconfig-r044-20220824
arc                  randconfig-r043-20220825
riscv                randconfig-r042-20220826
arc                  randconfig-r043-20220826
ia64                             allmodconfig
riscv                               defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
s390                       zfcpdump_defconfig
sh                ecovec24-romimage_defconfig
powerpc                 mpc8540_ads_defconfig
arm                           sama5_defconfig
sh                        apsh4ad0a_defconfig
openrisc                    or1ksim_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
i386                          randconfig-c001
powerpc                          allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
sh                          landisk_defconfig
sh                          rsk7203_defconfig
parisc                generic-32bit_defconfig
arm                            xcep_defconfig
openrisc                  or1klitex_defconfig
ia64                            zx1_defconfig
sh                           se7343_defconfig
m68k                          multi_defconfig
sh                           se7780_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220827
sh                           se7206_defconfig
sh                               j2_defconfig
powerpc                     mpc83xx_defconfig
alpha                            alldefconfig
mips                          rb532_defconfig

clang tested configs:
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a002
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a015
i386                          randconfig-a006
i386                          randconfig-a004
i386                          randconfig-a011
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
hexagon              randconfig-r041-20220825
hexagon              randconfig-r041-20220823
hexagon              randconfig-r045-20220825
hexagon              randconfig-r041-20220824
s390                 randconfig-r044-20220823
riscv                randconfig-r042-20220825
hexagon              randconfig-r045-20220824
riscv                randconfig-r042-20220823
hexagon              randconfig-r045-20220826
hexagon              randconfig-r045-20220823
hexagon              randconfig-r041-20220826
s390                 randconfig-r044-20220825
hexagon              randconfig-r045-20220827
riscv                randconfig-r042-20220827
hexagon              randconfig-r041-20220827
s390                 randconfig-r044-20220827
arm                                 defconfig
arm                         bcm2835_defconfig
x86_64                        randconfig-k001
powerpc                  mpc885_ads_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
