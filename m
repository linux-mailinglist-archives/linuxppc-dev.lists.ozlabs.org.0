Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D6D51B69D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 05:33:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtznD4sHzz3bqy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 13:33:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CempdiwV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CempdiwV; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtzmX60Crz301s
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 13:32:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651721581; x=1683257581;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Ymgw1EUPj2bmB7a+Q/4QlFT+3ktbaqGEJUOQn5KyZgU=;
 b=CempdiwVI9V3rK1NZVSEjf4LCtcPJII0NSKuTvYV2FADveaAJBiEUxia
 LoO+pI6OBPfUl9JucKuETG4pqG2eE14VCpJcelgrft2RI0K9Aw/EDrYXo
 0psMreVJVmM3uzSh801dMY6qck5UbBIldtvPnfCfz2Fr6I+mhtwIrxmrw
 ph4pN2Y9thTiIy4orlCz7Dw+4zmfrTbw3r89+bj5PHriNAWpx4Uue1fuC
 t3v1M4P4R/BU1b2Vr3fG9dUihy4mMeRkiiyfBDfh2I2orYy51bVJ4Ndg+
 872f3Sj+qZJ6sWF9dAt7KRXyyQkH7PYqmH9saPJMnNXoohc+oOujRbnNf g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="354410017"
X-IronPort-AV: E=Sophos;i="5.91,200,1647327600"; d="scan'208";a="354410017"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 20:31:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,200,1647327600"; d="scan'208";a="517323675"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 04 May 2022 20:31:50 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nmSDV-000C1r-9k;
 Thu, 05 May 2022 03:31:49 +0000
Date: Thu, 05 May 2022 11:31:26 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 6d65028eb67dbb7627651adfc460d64196d38bd8
Message-ID: <6273450e.zHsq+PJX/x/xfv9i%lkp@intel.com>
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
branch HEAD: 6d65028eb67dbb7627651adfc460d64196d38bd8  powerpc/vdso: Fix incorrect CFI in gettimeofday.S

elapsed time: 732m

configs tested: 104
configs skipped: 112

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                          randconfig-c001
arc                 nsimosci_hs_smp_defconfig
m68k                          sun3x_defconfig
powerpc                      cm5200_defconfig
powerpc                     taishan_defconfig
m68k                           sun3_defconfig
powerpc                      pcm030_defconfig
parisc                           allyesconfig
m68k                       m5249evb_defconfig
mips                           ip32_defconfig
powerpc                     asp8347_defconfig
powerpc                     sequoia_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                         cobalt_defconfig
openrisc                  or1klitex_defconfig
mips                         bigsur_defconfig
arm                         assabet_defconfig
arc                     nsimosci_hs_defconfig
arm                        mini2440_defconfig
microblaze                      mmu_defconfig
arc                            hsdk_defconfig
m68k                             allyesconfig
arc                                 defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220501
x86_64               randconfig-c001-20220502
i386                 randconfig-c001-20220502
arm                  randconfig-c002-20220502
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a006-20220502
x86_64               randconfig-a002-20220502
x86_64               randconfig-a001-20220502
x86_64               randconfig-a004-20220502
x86_64               randconfig-a005-20220502
x86_64               randconfig-a003-20220502
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220501
arc                  randconfig-r043-20220502
s390                 randconfig-r044-20220501
riscv                randconfig-r042-20220501
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
powerpc                      katmai_defconfig
mips                           rs90_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220501
hexagon              randconfig-r041-20220501

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
