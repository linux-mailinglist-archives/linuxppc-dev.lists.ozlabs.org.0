Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E212624CD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 04:08:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmQRF5DsMzDqCx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 12:08:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmQNP6rvHzDqKl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 12:05:56 +1000 (AEST)
IronPort-SDR: BMtVAAILBlI0IMQyxCIfuXa36/X9rAflwYSBIlLn01CxIze45Ywt5gMylweOqGU47KqeowgtpI
 KDXYJd0nLNMg==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="137772557"
X-IronPort-AV: E=Sophos;i="5.76,408,1592895600"; d="scan'208";a="137772557"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 19:05:54 -0700
IronPort-SDR: yElna7TQwbXIEov4GMlTAMUngd4Pmt7ojX9VYvdd/PvXGX4JGHzmND9M9wOUQM8wdpzQhujNf0
 sE3sWDra1GyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,408,1592895600"; d="scan'208";a="304319680"
Received: from lkp-server01.sh.intel.com (HELO fc0154cbc871) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 08 Sep 2020 19:05:51 -0700
Received: from kbuild by fc0154cbc871 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kFpUd-0000Jh-0k; Wed, 09 Sep 2020 02:05:51 +0000
Date: Wed, 09 Sep 2020 10:05:31 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 952478355a3e375c9bc70a8f237900bf88c3f531
Message-ID: <5f58386b.qpIkOIP1umzxJg5N%lkp@intel.com>
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
branch HEAD: 952478355a3e375c9bc70a8f237900bf88c3f531  Automatic merge of 'master', 'next' and 'fixes' (2020-09-08 10:21)

elapsed time: 745m

configs tested: 169
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
mips                           ip27_defconfig
arm                   milbeaut_m10v_defconfig
alpha                               defconfig
arc                              alldefconfig
m68k                        m5272c3_defconfig
mips                 decstation_r4k_defconfig
mips                           ip28_defconfig
mips                          malta_defconfig
powerpc                       holly_defconfig
arm                        mvebu_v7_defconfig
arc                     nsimosci_hs_defconfig
sh                        sh7763rdp_defconfig
sh                          r7785rp_defconfig
mips                           rs90_defconfig
m68k                       m5275evb_defconfig
arm                          exynos_defconfig
mips                malta_kvm_guest_defconfig
m68k                        m5407c3_defconfig
c6x                              allyesconfig
mips                            gpr_defconfig
sh                           se7780_defconfig
powerpc                           allnoconfig
m68k                            q40_defconfig
arm                            zeus_defconfig
sh                           se7705_defconfig
riscv                    nommu_k210_defconfig
arm                       spear13xx_defconfig
sh                   secureedge5410_defconfig
um                            kunit_defconfig
sh                           se7721_defconfig
arm                          moxart_defconfig
mips                     cu1000-neo_defconfig
arc                            hsdk_defconfig
powerpc                          allmodconfig
s390                                defconfig
powerpc                      ppc6xx_defconfig
arm                         hackkit_defconfig
powerpc                 linkstation_defconfig
arm                      footbridge_defconfig
xtensa                              defconfig
mips                         tb0287_defconfig
mips                      bmips_stb_defconfig
arm                             rpc_defconfig
mips                        nlm_xlr_defconfig
m68k                        stmark2_defconfig
mips                         rt305x_defconfig
arm                         s3c2410_defconfig
riscv                            allmodconfig
arm                         shannon_defconfig
c6x                        evmc6457_defconfig
arm                            pleb_defconfig
powerpc                         ps3_defconfig
arc                        vdk_hs38_defconfig
arm                        trizeps4_defconfig
powerpc                  mpc885_ads_defconfig
sh                         apsh4a3a_defconfig
arc                          axs101_defconfig
sh                        apsh4ad0a_defconfig
s390                       zfcpdump_defconfig
arm                       mainstone_defconfig
powerpc                      ppc64e_defconfig
sh                            shmin_defconfig
mips                           ci20_defconfig
powerpc                          allyesconfig
arm                        magician_defconfig
arm                         assabet_defconfig
m68k                            mac_defconfig
xtensa                       common_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
x86_64               randconfig-a006-20200907
x86_64               randconfig-a004-20200907
x86_64               randconfig-a003-20200907
x86_64               randconfig-a005-20200907
x86_64               randconfig-a001-20200907
x86_64               randconfig-a002-20200907
i386                 randconfig-a004-20200908
i386                 randconfig-a005-20200908
i386                 randconfig-a006-20200908
i386                 randconfig-a002-20200908
i386                 randconfig-a001-20200908
i386                 randconfig-a003-20200908
i386                 randconfig-a004-20200907
i386                 randconfig-a005-20200907
i386                 randconfig-a006-20200907
i386                 randconfig-a002-20200907
i386                 randconfig-a003-20200907
i386                 randconfig-a001-20200907
i386                 randconfig-a004-20200909
i386                 randconfig-a005-20200909
i386                 randconfig-a006-20200909
i386                 randconfig-a002-20200909
i386                 randconfig-a001-20200909
i386                 randconfig-a003-20200909
x86_64               randconfig-a013-20200908
x86_64               randconfig-a016-20200908
x86_64               randconfig-a011-20200908
x86_64               randconfig-a012-20200908
x86_64               randconfig-a015-20200908
x86_64               randconfig-a014-20200908
i386                 randconfig-a016-20200907
i386                 randconfig-a015-20200907
i386                 randconfig-a011-20200907
i386                 randconfig-a013-20200907
i386                 randconfig-a014-20200907
i386                 randconfig-a012-20200907
i386                 randconfig-a016-20200908
i386                 randconfig-a015-20200908
i386                 randconfig-a011-20200908
i386                 randconfig-a013-20200908
i386                 randconfig-a014-20200908
i386                 randconfig-a012-20200908
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20200908
x86_64               randconfig-a006-20200908
x86_64               randconfig-a003-20200908
x86_64               randconfig-a001-20200908
x86_64               randconfig-a005-20200908
x86_64               randconfig-a002-20200908
x86_64               randconfig-a013-20200909
x86_64               randconfig-a016-20200909
x86_64               randconfig-a011-20200909
x86_64               randconfig-a012-20200909
x86_64               randconfig-a015-20200909
x86_64               randconfig-a014-20200909
x86_64               randconfig-a013-20200907
x86_64               randconfig-a011-20200907
x86_64               randconfig-a016-20200907
x86_64               randconfig-a012-20200907
x86_64               randconfig-a015-20200907
x86_64               randconfig-a014-20200907

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
