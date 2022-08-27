Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8B75A337D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 03:35:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDzm40Cr8z3c6p
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 11:35:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KZYXRIHQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KZYXRIHQ;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDzlV3Qt6z2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Aug 2022 11:34:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661564087; x=1693100087;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WiQLwPxsLd9IqDWnuou7wNVDGNmx/O5WKvgujzzilvg=;
  b=KZYXRIHQoc+i3eNBgiK7+agcAmr5qzPdm9AjC9VupqcIJyaFCwGYnmxi
   Frgbv/mA7XeFmZp1FJhehA2YgyPqcnGqxQL8JNudRYAgQGrs4QoiDlzq7
   TSPYYD/MZPTBW3iwJrKe32i0vEXwG1HpoZ0D9PDWbtcURSNSKYu4otWGZ
   BY/0hj/NADXB6ytggv54kWR+KPv2sCCwT/CsYNxW2l142BB0ajaVepmDe
   Ubb8FES6PnDBN0EbVr9ghs9FOEcuq/BPu4FVnvCp+EH3UB3sSFN85gcbT
   qANqEirITW/7DCHm5655htn6D3UFUsbD8xUnViZ7DZ6AhiqFQnyRkIoIV
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="281593537"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="281593537"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2022 18:34:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="753060096"
Received: from lkp-server01.sh.intel.com (HELO 71b0d3b5b1bc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2022 18:34:31 -0700
Received: from kbuild by 71b0d3b5b1bc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oRkiV-0000qB-12;
	Sat, 27 Aug 2022 01:34:31 +0000
Date: Sat, 27 Aug 2022 09:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 91926d8b7e71aaf5f84f0cf208fc5a8b7a761050
Message-ID: <6309746b.SYdoXCcJw6HQFcN+%lkp@intel.com>
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
branch HEAD: 91926d8b7e71aaf5f84f0cf208fc5a8b7a761050  powerpc/rtas: Fix RTAS MSR[HV] handling for Cell

elapsed time: 730m

configs tested: 96
configs skipped: 129

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
loongarch                           defconfig
loongarch                         allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
i386                                defconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                              defconfig
x86_64                               rhel-8.3
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arm64                            allyesconfig
powerpc                          allyesconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                          randconfig-c001
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
sh                          landisk_defconfig
arm                                 defconfig
arm                              allyesconfig
i386                             allyesconfig
x86_64                           allyesconfig
sparc                               defconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
s390                       zfcpdump_defconfig
xtensa                           allyesconfig
sh                ecovec24-romimage_defconfig
powerpc                 mpc8540_ads_defconfig
arm                           sama5_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sh                           se7206_defconfig
sh                               j2_defconfig
powerpc                     mpc83xx_defconfig
alpha                            alldefconfig
mips                          rb532_defconfig

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220827
riscv                randconfig-r042-20220827
hexagon              randconfig-r041-20220827
s390                 randconfig-r044-20220827
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a003
x86_64                        randconfig-a001
hexagon              randconfig-r045-20220825
hexagon              randconfig-r045-20220823
riscv                randconfig-r042-20220823
riscv                randconfig-r042-20220825
hexagon              randconfig-r041-20220823
hexagon              randconfig-r041-20220825
s390                 randconfig-r044-20220825
s390                 randconfig-r044-20220823
x86_64                        randconfig-k001
powerpc                  mpc885_ads_defconfig
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
