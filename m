Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 589934D2609
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 02:28:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCvj81XYHz3bNs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 12:28:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VcN2Ghyc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VcN2Ghyc; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCvhV68SRz2x9R
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 12:27:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646789276; x=1678325276;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=aLQ+XDvAenEfBQXN17KQ81NBYCLyeYvt0Nz13ZkYvhc=;
 b=VcN2GhycCy0Xt3uAiupS1lgARNfot+KXJ631xFtO8p+eUIIKiyB0cYTG
 nWWJhGvV1mvlpUdbOSk3Nn9x9rPVL2b3Z6ujCt25ebUycrb9DgdKU2eP+
 +DIT8ONDTVinXmRlsIHFb4ubezxMX2hIDhRg8RGmT8oTyEUwaoJfBZUGV
 1drzlgDuQ3SJJOi0XkjEPyoXBQIsYdiUXUn54zeLZjZj0H00MMI2HhHL8
 iGDAZ3a2OqsmX2lS2ALa0zX+AdayqI6uKvXr7JlTxO5e9PjrVxNgURoc1
 eSVX5eQbF/9mstaf+nTbd6bO3qiIFqq6hiA8qIU2WbFzGM5j+a9TDLuDw A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="235467705"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="235467705"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 17:26:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="643861177"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 08 Mar 2022 17:26:46 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nRl6D-0002KL-HW; Wed, 09 Mar 2022 01:26:45 +0000
Date: Wed, 09 Mar 2022 09:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS 1a76e520ee1831a81dabf8a9a58c6453f700026e
Message-ID: <62280226.0YSQTbe+PMjenb/I%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 1a76e520ee1831a81dabf8a9a58c6453f700026e  powerpc/64e: Tie PPC_BOOK3E_64 to PPC_FSL_BOOK3E

elapsed time: 724m

configs tested: 128
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
powerpc                    klondike_defconfig
sh                   secureedge5410_defconfig
openrisc                 simple_smp_defconfig
m68k                          multi_defconfig
powerpc                         ps3_defconfig
parisc                              defconfig
mips                     loongson1b_defconfig
m68k                        m5307c3_defconfig
powerpc64                           defconfig
xtensa                  cadence_csp_defconfig
powerpc                  storcenter_defconfig
arm                         vf610m4_defconfig
sh                        sh7757lcr_defconfig
nios2                         3c120_defconfig
sh                          r7785rp_defconfig
parisc                generic-64bit_defconfig
powerpc                     rainier_defconfig
sh                           se7722_defconfig
m68k                             alldefconfig
arm                         s3c6400_defconfig
arm                         cm_x300_defconfig
sh                   sh7724_generic_defconfig
h8300                    h8300h-sim_defconfig
m68k                        stmark2_defconfig
sh                          rsk7201_defconfig
arm                          pxa3xx_defconfig
xtensa                    xip_kc705_defconfig
sh                           se7721_defconfig
powerpc                 mpc834x_itx_defconfig
um                           x86_64_defconfig
m68k                       m5249evb_defconfig
arm                            hisi_defconfig
riscv                               defconfig
sh                           se7206_defconfig
xtensa                          iss_defconfig
ia64                                defconfig
arm                  randconfig-c002-20220308
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
arc                  randconfig-r043-20220308
riscv                randconfig-r042-20220308
s390                 randconfig-r044-20220308
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
riscv                randconfig-c006-20220308
powerpc              randconfig-c003-20220308
i386                          randconfig-c001
arm                  randconfig-c002-20220308
mips                 randconfig-c004-20220308
mips                        workpad_defconfig
mips                       lemote2f_defconfig
powerpc                    ge_imp3a_defconfig
mips                         tb0219_defconfig
arm                           spitz_defconfig
x86_64                           allyesconfig
arm                         hackkit_defconfig
mips                        omega2p_defconfig
arm                         orion5x_defconfig
powerpc                      walnut_defconfig
arm                          pcm027_defconfig
arm                          imote2_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220308
hexagon              randconfig-r041-20220308

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
