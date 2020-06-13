Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8721F8169
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 08:56:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49kT015kD2zDqw9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 16:56:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49kSs20l2RzDr1F
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jun 2020 16:50:13 +1000 (AEST)
IronPort-SDR: 6EhEGtBo2CiaJPrAMQrP6FcEe7t0ms/9Wp8NubRJhfadUA1eSgnowiLAKmFreQVfw54oVqbTPU
 GJ6r62cQfb+Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 23:50:11 -0700
IronPort-SDR: y+1SP2Fo4xuAF72Bk0K1gtK/csN2Ru99OJ6Opzv1yZOAX4SBFvmPyaEXvgCqbDLy7TXvI3ODAN
 Kg3cVps+X2Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,506,1583222400"; d="scan'208";a="315595585"
Received: from lkp-server02.sh.intel.com (HELO de5642daf266) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2020 23:50:09 -0700
Received: from kbuild by de5642daf266 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jjzzV-0000Fz-89; Sat, 13 Jun 2020 06:50:09 +0000
Date: Sat, 13 Jun 2020 14:49:30 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes] BUILD SUCCESS e881bfaf5a5f409390973e076333281465f2b0d9
Message-ID: <5ee476fa.JvL5Wf5tBaPeINXY%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  fixes
branch HEAD: e881bfaf5a5f409390973e076333281465f2b0d9  KVM: PPC: Fix nested guest RC bits update

elapsed time: 512m

configs tested: 108
configs skipped: 111

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
s390                       zfcpdump_defconfig
arc                        vdk_hs38_defconfig
arm                          moxart_defconfig
arc                           tb10x_defconfig
openrisc                         allyesconfig
arm                           efm32_defconfig
powerpc                     pq2fads_defconfig
arm                          tango4_defconfig
c6x                        evmc6472_defconfig
arm                          ixp4xx_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a006-20200612
i386                 randconfig-a002-20200612
i386                 randconfig-a001-20200612
i386                 randconfig-a004-20200612
i386                 randconfig-a005-20200612
i386                 randconfig-a003-20200612
x86_64               randconfig-a001-20200612
x86_64               randconfig-a003-20200612
x86_64               randconfig-a002-20200612
x86_64               randconfig-a006-20200612
x86_64               randconfig-a005-20200612
x86_64               randconfig-a004-20200612
x86_64               randconfig-a015-20200613
x86_64               randconfig-a011-20200613
x86_64               randconfig-a016-20200613
x86_64               randconfig-a014-20200613
x86_64               randconfig-a012-20200613
x86_64               randconfig-a013-20200613
i386                 randconfig-a015-20200612
i386                 randconfig-a011-20200612
i386                 randconfig-a014-20200612
i386                 randconfig-a016-20200612
i386                 randconfig-a013-20200612
i386                 randconfig-a012-20200612
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
