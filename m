Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF481EEF9D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 04:49:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dRtZ3TwVzDqxH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 12:49:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dRrw4XZvzDqZj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 12:47:40 +1000 (AEST)
IronPort-SDR: +X6v+77UaVvDI8NtslV/ua6fxS07A2/BTKXDtJyi9eX/253XjMDhOR2UuHcoodi+tSFdwnGvrP
 nTtCDLDNfdnQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 19:47:37 -0700
IronPort-SDR: AKRe64k1zxlCBlaic+KJ8EHrjxlhlv9ZPF32S8p+xK2W/WoxhAbWQpjPOH9pDlS8OrWHYpCXgm
 QM664RcAjrww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,474,1583222400"; d="scan'208";a="304922115"
Received: from lkp-server02.sh.intel.com (HELO 85fa322b0eb2) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 04 Jun 2020 19:47:36 -0700
Received: from kbuild by 85fa322b0eb2 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jh2ON-00001n-II; Fri, 05 Jun 2020 02:47:35 +0000
Date: Fri, 05 Jun 2020 10:47:16 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 787e1419e6c96ab8641adb4391b8955bc2e76817
Message-ID: <5ed9b234.Jmy7wVZ8iQSMRU3u%lkp@intel.com>
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
branch HEAD: 787e1419e6c96ab8641adb4391b8955bc2e76817  Automatic merge of branch 'next' into merge

elapsed time: 861m

configs tested: 108
configs skipped: 8

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
mips                            ar7_defconfig
csky                             alldefconfig
sh                             shx3_defconfig
mips                        jmr3927_defconfig
xtensa                              defconfig
nios2                               defconfig
alpha                               defconfig
powerpc                  mpc866_ads_defconfig
mips                        workpad_defconfig
s390                             alldefconfig
sh                        sh7757lcr_defconfig
nds32                            alldefconfig
m68k                        m5407c3_defconfig
mips                          malta_defconfig
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
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
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
i386                 randconfig-a001-20200604
i386                 randconfig-a006-20200604
i386                 randconfig-a002-20200604
i386                 randconfig-a005-20200604
i386                 randconfig-a004-20200604
i386                 randconfig-a003-20200604
x86_64               randconfig-a011-20200604
x86_64               randconfig-a016-20200604
x86_64               randconfig-a013-20200604
x86_64               randconfig-a014-20200604
x86_64               randconfig-a012-20200604
x86_64               randconfig-a015-20200604
i386                 randconfig-a014-20200604
i386                 randconfig-a015-20200604
i386                 randconfig-a011-20200604
i386                 randconfig-a016-20200604
i386                 randconfig-a012-20200604
i386                 randconfig-a013-20200604
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
um                                  defconfig
um                               allyesconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
