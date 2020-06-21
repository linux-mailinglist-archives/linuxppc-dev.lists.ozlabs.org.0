Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA6D202809
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jun 2020 04:55:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49qHGR0PCtzDqfP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jun 2020 12:55:27 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49qHDh6mvJzDqYj
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Jun 2020 12:53:51 +1000 (AEST)
IronPort-SDR: tkYmx+QVLzM+FD6uYLeFg5DYyHxMTX5VqMIB0KkQD0PmAEPMasOBhEiZNoSM38PYPBEIlm8Yal
 amN6F8hmzfPw==
X-IronPort-AV: E=McAfee;i="6000,8403,9658"; a="140960412"
X-IronPort-AV: E=Sophos;i="5.75,261,1589266800"; d="scan'208";a="140960412"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2020 19:53:48 -0700
IronPort-SDR: GH/TMMBQYnaxF5iQTrZfyg0eo3ThqOTLlLTDItJEFhY5Tmdh/h2A1QCrgIReYyKTvnxCgb2Zow
 /G482uNxnm4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,261,1589266800"; d="scan'208";a="310570202"
Received: from lkp-server02.sh.intel.com (HELO 3aa54c81372e) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 20 Jun 2020 19:53:46 -0700
Received: from kbuild by 3aa54c81372e with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jmq78-0001xS-B7; Sun, 21 Jun 2020 02:53:46 +0000
Date: Sun, 21 Jun 2020 10:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 4885fd794229380fe6d6f5913d9f13670593a627
Message-ID: <5eeecb85.IC69FCyryTtAPIBd%lkp@intel.com>
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
branch HEAD: 4885fd794229380fe6d6f5913d9f13670593a627  Automatic merge of 'master', 'next' and 'fixes' (2020-06-20 22:28)

elapsed time: 859m

configs tested: 152
configs skipped: 12

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
mips                             allyesconfig
arm                      footbridge_defconfig
sh                   sh7770_generic_defconfig
arm                         mv78xx0_defconfig
arm                          ixp4xx_defconfig
arm                         s3c6400_defconfig
m68k                       bvme6000_defconfig
mips                           ip27_defconfig
powerpc                 mpc8272_ads_defconfig
arm                           spitz_defconfig
m68k                        stmark2_defconfig
sh                          r7780mp_defconfig
s390                             allyesconfig
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
arc                      axs103_smp_defconfig
mips                         db1xxx_defconfig
riscv                            alldefconfig
m68k                            mac_defconfig
ia64                      gensparse_defconfig
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
sh                               j2_defconfig
arm                           h5000_defconfig
h8300                            allmodconfig
arc                              allyesconfig
nds32                             allnoconfig
arc                        nsim_700_defconfig
arm                   milbeaut_m10v_defconfig
arm                         orion5x_defconfig
sh                          rsk7201_defconfig
powerpc                  mpc866_ads_defconfig
arc                    vdk_hs38_smp_defconfig
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
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
xtensa                              defconfig
arc                                 defconfig
sh                               allmodconfig
sh                                allnoconfig
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
i386                 randconfig-a013-20200620
i386                 randconfig-a016-20200620
i386                 randconfig-a012-20200620
i386                 randconfig-a014-20200620
i386                 randconfig-a015-20200620
i386                 randconfig-a011-20200620
x86_64               randconfig-a004-20200620
x86_64               randconfig-a002-20200620
x86_64               randconfig-a003-20200620
x86_64               randconfig-a005-20200620
x86_64               randconfig-a001-20200620
x86_64               randconfig-a006-20200620
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
