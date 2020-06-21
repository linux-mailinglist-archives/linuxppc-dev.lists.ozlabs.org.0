Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BC7202812
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jun 2020 04:59:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49qHLV1y2wzDqbG
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jun 2020 12:58:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49qHDj1Q8pzDqfB
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Jun 2020 12:53:51 +1000 (AEST)
IronPort-SDR: GoH23A7IRMp3klDawW6VlJxUBmaOkqQJcCHQvrKxTQX3+bUq2Swnq17cwxmbG1zibWteY++W2M
 1dZ1Aaek/xgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9658"; a="130841688"
X-IronPort-AV: E=Sophos;i="5.75,261,1589266800"; d="scan'208";a="130841688"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2020 19:53:48 -0700
IronPort-SDR: vYF23kJhNGdp/qKejqduBhkyrN8lv7sB0cHEh4wwK6kiboH5omv06RnFi71Z79wmgeAIkgXxyz
 gJn9kDuZsLUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,261,1589266800"; d="scan'208";a="478030600"
Received: from lkp-server02.sh.intel.com (HELO 3aa54c81372e) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 20 Jun 2020 19:53:47 -0700
Received: from kbuild by 3aa54c81372e with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jmq78-0001xQ-Am; Sun, 21 Jun 2020 02:53:46 +0000
Date: Sun, 21 Jun 2020 10:52:55 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes] BUILD SUCCESS c0e1c8c22bebecef40097c80c1c74492ff96d081
Message-ID: <5eeecb87.VDyQl0I1Y+uEB+gP%lkp@intel.com>
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
branch HEAD: c0e1c8c22bebecef40097c80c1c74492ff96d081  powerpc/8xx: Provide ptep_get() with 16k pages

elapsed time: 836m

configs tested: 141
configs skipped: 13

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
arm                         s3c6400_defconfig
m68k                       bvme6000_defconfig
arm                         mv78xx0_defconfig
sh                          r7780mp_defconfig
s390                             allyesconfig
csky                                defconfig
powerpc                     mpc5200_defconfig
mips                         rt305x_defconfig
riscv                    nommu_virt_defconfig
arm                         s5pv210_defconfig
arm                        mini2440_defconfig
sh                                  defconfig
arm                       mainstone_defconfig
m68k                       m5475evb_defconfig
powerpc                          g5_defconfig
mips                      pistachio_defconfig
arm                        trizeps4_defconfig
s390                             allmodconfig
microblaze                        allnoconfig
arm                          gemini_defconfig
m68k                        m5407c3_defconfig
arm                        oxnas_v6_defconfig
m68k                        mvme16x_defconfig
mips                        qi_lb60_defconfig
x86_64                              defconfig
arc                              alldefconfig
s390                              allnoconfig
arc                        nsimosci_defconfig
mips                     cu1000-neo_defconfig
sh                   secureedge5410_defconfig
arm                           u8500_defconfig
sh                        edosk7705_defconfig
arm                        spear3xx_defconfig
h8300                            allmodconfig
sh                               j2_defconfig
arm                           h5000_defconfig
sh                          rsk7201_defconfig
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
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200621
i386                 randconfig-a002-20200621
i386                 randconfig-a003-20200621
i386                 randconfig-a001-20200621
i386                 randconfig-a005-20200621
i386                 randconfig-a004-20200621
i386                 randconfig-a002-20200619
i386                 randconfig-a006-20200619
i386                 randconfig-a001-20200619
i386                 randconfig-a004-20200619
i386                 randconfig-a005-20200619
i386                 randconfig-a003-20200619
x86_64               randconfig-a012-20200621
x86_64               randconfig-a011-20200621
x86_64               randconfig-a013-20200621
x86_64               randconfig-a014-20200621
x86_64               randconfig-a015-20200621
x86_64               randconfig-a016-20200621
i386                 randconfig-a011-20200619
i386                 randconfig-a015-20200619
i386                 randconfig-a014-20200619
i386                 randconfig-a013-20200619
i386                 randconfig-a016-20200619
i386                 randconfig-a012-20200619
i386                 randconfig-a013-20200621
i386                 randconfig-a016-20200621
i386                 randconfig-a012-20200621
i386                 randconfig-a014-20200621
i386                 randconfig-a015-20200621
i386                 randconfig-a011-20200621
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allmodconfig
um                               allyesconfig
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
