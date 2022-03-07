Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E54AB4D07B9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 20:30:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KC7p75jLqz3cBM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 06:30:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c4N3Z/5/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=c4N3Z/5/; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KC7kf68w7z3bWt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 06:27:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646681228; x=1678217228;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=hjZqcV9fu9fOMXd8SjJmVyw7XbCb6chMVySugpWberQ=;
 b=c4N3Z/5/ZdXDFdsg21sAdARubcCZ0FhnjsO7ZI7eiLjRhtIUJj5nRxDO
 BfjEE1yJcjSdwM7XazwX15X15BRlssPL84GldCKs6aC6EuQRxn/Qs8wvZ
 fwpxRpx5Zy3wlXbBpSYcxNzm1IpbILOXv0dS7bMi5hEB4b/l14Fq8H3Ls
 A9AaqofWU90QwVAo1unsiOtJlV6JtMbieofjlMoNDeVeGoBmQE7vw08oJ
 7sUvSWFTNLLrCnmhkwS5u7R2hyzpm6ufCog3VOKhjZGDbmYZOihfsHI+V
 W2ZchsCSqdgiLdSgyE2YQ55HrZ2d9oGevLTP+XO0PAOaTHDwrDFeakcFg Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="241919228"
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="241919228"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 11:26:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="495171144"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 07 Mar 2022 11:26:02 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nRIzZ-0000dv-BG; Mon, 07 Mar 2022 19:26:01 +0000
Date: Tue, 08 Mar 2022 03:25:24 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/ppc-kvm] BUILD SUCCESS
 e40b38a41ce916d6a3a4751d59a01b6c0c03afd0
Message-ID: <62265c24./javdFiicFAAMm74%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
branch HEAD: e40b38a41ce916d6a3a4751d59a01b6c0c03afd0  KVM: PPC: Book3S HV: remove unnecessary casts

elapsed time: 761m

configs tested: 74
configs skipped: 113

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                     pq2fads_defconfig
um                             i386_defconfig
ia64                          tiger_defconfig
m68k                        m5272c3_defconfig
arm                        multi_v7_defconfig
powerpc                    amigaone_defconfig
sh                           se7724_defconfig
arm                           tegra_defconfig
xtensa                         virt_defconfig
mips                         db1xxx_defconfig
arm                      jornada720_defconfig
powerpc                    klondike_defconfig
arm                         vf610m4_defconfig
arm                          exynos_defconfig
arm                  randconfig-c002-20220307
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20220307
x86_64               randconfig-a004-20220307
x86_64               randconfig-a005-20220307
x86_64               randconfig-a001-20220307
x86_64               randconfig-a003-20220307
x86_64               randconfig-a002-20220307
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20220307
i386                 randconfig-c001-20220307
powerpc              randconfig-c003-20220307
riscv                randconfig-c006-20220307
mips                 randconfig-c004-20220307
arm                  randconfig-c002-20220307
s390                 randconfig-c005-20220307
arm                       imx_v4_v5_defconfig
x86_64                           allyesconfig
mips                     cu1000-neo_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                   microwatt_defconfig
powerpc                          allmodconfig
mips                           rs90_defconfig
powerpc                     tqm8540_defconfig
powerpc                      ppc64e_defconfig
i386                 randconfig-a012-20220307
i386                 randconfig-a013-20220307
i386                 randconfig-a015-20220307
i386                 randconfig-a011-20220307
i386                 randconfig-a014-20220307
i386                 randconfig-a016-20220307
hexagon              randconfig-r045-20220307
riscv                randconfig-r042-20220307
hexagon              randconfig-r041-20220307

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
