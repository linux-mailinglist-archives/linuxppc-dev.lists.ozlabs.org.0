Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5301E71B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 02:39:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Y5Kk3sKrzDqZ2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 10:39:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Y5J52kB0zDqJB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 10:37:34 +1000 (AEST)
IronPort-SDR: DYR9253uCr+8Fk0whK52RPX/pBPO1q7bcBO/8hQpZfkeN86FCQ6+0X/OiCMqyyPFv1mR0aj/Fc
 MhVLbXsaCpMA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 17:37:31 -0700
IronPort-SDR: HimxHNGMWQh0OtUVQeFL2vuvmY/Ghh+77fiH2QpoeKFxXdyrzonYcrW3VvSmecg5O8z0VRvjXO
 DJCkt+FV3+/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,446,1583222400"; d="scan'208";a="376548550"
Received: from lkp-server02.sh.intel.com (HELO 5e8f22f9921b) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 28 May 2020 17:37:30 -0700
Received: from kbuild by 5e8f22f9921b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jeT1d-0000Cz-Hn; Fri, 29 May 2020 00:37:29 +0000
Date: Fri, 29 May 2020 08:37:19 +0800
From: kbuild test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 bc26d22277c297c35013700e40f276e37b991980
Message-ID: <5ed0593f.rWqCo5BBb7LLXgrs%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  next-test
branch HEAD: bc26d22277c297c35013700e40f276e37b991980  powerpc/pseries: Update hv-24x7 information after migration

Warning in current branch:

kernel/events/hw_breakpoint.c:216:12: warning: no previous prototype for 'arch_reserve_bp_slot' [-Wmissing-prototypes]
kernel/events/hw_breakpoint.c:221:13: warning: no previous prototype for 'arch_release_bp_slot' [-Wmissing-prototypes]

Warning ids grouped by kconfigs:

recent_errors
|-- i386-allnoconfig
|   |-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_release_bp_slot
|   `-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_reserve_bp_slot
|-- i386-allyesconfig
|   |-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_release_bp_slot
|   `-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_reserve_bp_slot
|-- i386-debian-10.3
|   |-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_release_bp_slot
|   `-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_reserve_bp_slot
|-- i386-defconfig
|   |-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_release_bp_slot
|   `-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_reserve_bp_slot
|-- i386-randconfig-c001-20200526
|   |-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_release_bp_slot
|   `-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_reserve_bp_slot
|-- sh-allmodconfig
|   |-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_release_bp_slot
|   `-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_reserve_bp_slot
|-- sh-allnoconfig
|   |-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_release_bp_slot
|   `-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_reserve_bp_slot
`-- x86_64-randconfig-c002-20200526
    |-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_release_bp_slot
    `-- kernel-events-hw_breakpoint.c:warning:no-previous-prototype-for-arch_reserve_bp_slot

elapsed time: 3491m

configs tested: 79
configs skipped: 1

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
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
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
xtensa                              defconfig
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
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                              allnoconfig
s390                                defconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                               allyesconfig
um                                allnoconfig
um                                  defconfig
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
