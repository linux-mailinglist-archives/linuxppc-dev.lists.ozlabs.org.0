Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7C221967E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 05:10:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2Ll85X7XzDqnn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 13:10:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2LgH0716zDqqK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 13:06:50 +1000 (AEST)
IronPort-SDR: zcqEM0TOIpS2HTHfE7cEakGMDsPsK+3GfrkTZ4ZRrjoe9FVC2Am5OtaS+6JmEwuNYEbVMhdWf2
 m2u2PCt7FVkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="136162047"
X-IronPort-AV: E=Sophos;i="5.75,330,1589266800"; d="scan'208";a="136162047"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 20:06:48 -0700
IronPort-SDR: 7C1J5XzaoTabRCcl/N9J/fc9Cv8V1Gpvtdpze2+OdgWoYlhnpbyP4CE5Gpps80VxspmkKgp8cd
 GaII97ZXdOiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,330,1589266800"; d="scan'208";a="314813560"
Received: from lkp-server01.sh.intel.com (HELO 6136dd46483e) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 08 Jul 2020 20:06:47 -0700
Received: from kbuild by 6136dd46483e with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jtMta-0000Ng-Ii; Thu, 09 Jul 2020 03:06:46 +0000
Date: Thu, 09 Jul 2020 11:05:49 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 71d6070a8e0e0a1ed82365544f97b86475cb161e
Message-ID: <5f06898d.5O261/ryGx4ctP87%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  merge
branch HEAD: 71d6070a8e0e0a1ed82365544f97b86475cb161e  Automatic merge of 'master', 'next' and 'fixes' (2020-07-08 23:12)

elapsed time: 828m

configs tested: 113
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
xtensa                         virt_defconfig
parisc                            allnoconfig
mips                      pic32mzda_defconfig
arm                       netwinder_defconfig
openrisc                 simple_smp_defconfig
powerpc                      pasemi_defconfig
arm                        cerfcube_defconfig
xtensa                          iss_defconfig
sh                           se7343_defconfig
arm                          ixp4xx_defconfig
sh                           se7780_defconfig
m68k                             alldefconfig
arc                      axs103_smp_defconfig
arm                          prima2_defconfig
sh                           sh2007_defconfig
mips                      maltaaprp_defconfig
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
openrisc                         allyesconfig
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
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200708
i386                 randconfig-a001-20200708
i386                 randconfig-a006-20200708
i386                 randconfig-a005-20200708
i386                 randconfig-a004-20200708
i386                 randconfig-a003-20200708
i386                 randconfig-a011-20200708
i386                 randconfig-a015-20200708
i386                 randconfig-a014-20200708
i386                 randconfig-a016-20200708
i386                 randconfig-a012-20200708
i386                 randconfig-a013-20200708
x86_64               randconfig-a001-20200708
x86_64               randconfig-a006-20200708
x86_64               randconfig-a003-20200708
x86_64               randconfig-a002-20200708
x86_64               randconfig-a004-20200708
x86_64               randconfig-a005-20200708
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
