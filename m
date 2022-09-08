Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 564ED5B11EE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 03:12:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNLhD1YdLz3c5D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 11:12:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IhbvUOCD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Two or more type TXT spf records found.) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IhbvUOCD;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNLgX1NDzz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 11:11:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662599512; x=1694135512;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0eagfYImLscdif0xe1cmYSy4j5skJGh+krCOMoUyNMc=;
  b=IhbvUOCDMo7o5qpM3J/ZBslE5DrrRBh01b27WcQCX1/ttxfJgOYKYCC0
   uYW3lTZgm20F+J2cUCBg6WK6EPwtRpVgCmY8V4XKfZVghvWtKmp8EWy2n
   6gbWpGW3LRcYoFlDfVgkJdG1LaQL7O0vy9C2tLnT74ghqZZmXdFk8O4bV
   pPJU7SCbeX5T/HTj/8GkkrvRxf198dD7frjb/wWS1KHd4zuZjPSfaH9oq
   j97x6vtg8oOIBJoL5B1fpW/mVEUs2NIIPd/SqMwrPgTbbWmClo9ziokJQ
   KEjv0q2R2Q11L2pB5DER/Yl4T5z/ePd9/2sJz4jpjOY+DsyneWpeVpVuU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="294619281"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; 
   d="scan'208";a="294619281"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 18:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; 
   d="scan'208";a="683033784"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 07 Sep 2022 18:11:41 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oW64z-0007Bp-0y;
	Thu, 08 Sep 2022 01:11:41 +0000
Date: Thu, 08 Sep 2022 09:11:30 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 5f22270db76e8f1726b4287f6c0032d2ad1b9c52
Message-ID: <63194142.XPJGX2O/zPnWY31D%lkp@intel.com>
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
branch HEAD: 5f22270db76e8f1726b4287f6c0032d2ad1b9c52  powerpc/pseries: Fix plpks crash on non-pseries

elapsed time: 729m

configs tested: 112
configs skipped: 107

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                             allyesconfig
i386                                defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
powerpc                    sam440ep_defconfig
m68k                          amiga_defconfig
powerpc                      tqm8xx_defconfig
m68k                        stmark2_defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
xtensa                         virt_defconfig
ia64                         bigsur_defconfig
arm                        keystone_defconfig
sh                  sh7785lcr_32bit_defconfig
m68k                          multi_defconfig
arm                             pxa_defconfig
arc                          axs103_defconfig
mips                           gcw0_defconfig
parisc64                         alldefconfig
sparc                               defconfig
sh                     sh7710voipgw_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                             allnoconfig
arm                        cerfcube_defconfig
powerpc                      arches_defconfig
openrisc                 simple_smp_defconfig
powerpc                     asp8347_defconfig
sparc                            alldefconfig
i386                             alldefconfig
powerpc                     ep8248e_defconfig
m68k                          hp300_defconfig
m68k                        m5272c3_defconfig
arm                          exynos_defconfig
arm                          pxa3xx_defconfig
arm                         s3c6400_defconfig
powerpc                     stx_gp3_defconfig
arm64                            alldefconfig
sh                           se7722_defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
sh                             sh03_defconfig
sh                           se7750_defconfig
s390                             allmodconfig
xtensa                       common_defconfig
i386                          randconfig-c001
sh                          r7785rp_defconfig
arm                          iop32x_defconfig
powerpc                     mpc83xx_defconfig
xtensa                generic_kc705_defconfig
csky                                defconfig
um                                  defconfig
sh                            titan_defconfig
arm                            mps2_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
sh                          r7780mp_defconfig
arm                            qcom_defconfig
ia64                          tiger_defconfig
arc                              alldefconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
riscv                randconfig-r042-20220907
hexagon              randconfig-r041-20220907
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-k001
powerpc                     tqm8540_defconfig
arm                           spitz_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                           ip22_defconfig
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
