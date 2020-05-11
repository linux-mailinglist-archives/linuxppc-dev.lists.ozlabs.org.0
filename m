Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4124D1CDD61
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 16:38:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LNpJ3j1PzDqLC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 00:38:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LJtN13J5zDqCW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 21:41:29 +1000 (AEST)
IronPort-SDR: rs7XGB6iR9kL8A4NIJO3b+BkR91vFFrKq1AyfBnA6IHiN8HU2WkHKM+PQVz5yi05pQ5Y9c4tHz
 vpHW44BWjA+g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 04:41:27 -0700
IronPort-SDR: WeT49FkmuUV1kgy+U0QXWAljyTdf2aVhTFoPE/paiskdaQNxbsAYlTIHV15Bm6IaOb1s0d86dk
 s/ge28b94lsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,379,1583222400"; d="scan'208";a="251133916"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 11 May 2020 04:41:25 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jY6oH-000B1n-57; Mon, 11 May 2020 19:41:25 +0800
Date: Mon, 11 May 2020 19:40:56 +0800
From: kbuild test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS 1f12096aca212af8fad3ef58d5673cde691a1452
Message-ID: <5eb939c8.7e3SreYdjAltAxbx%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  next
branch HEAD: 1f12096aca212af8fad3ef58d5673cde691a1452  Merge the lockless page table walk rework into next

elapsed time: 5675m

configs tested: 178
configs skipped: 1

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
sparc                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
um                                  defconfig
sparc64                             defconfig
c6x                              allyesconfig
i386                             allyesconfig
mips                             allmodconfig
s390                             allmodconfig
m68k                              allnoconfig
m68k                                defconfig
alpha                               defconfig
arc                              allyesconfig
um                                allnoconfig
s390                              allnoconfig
alpha                            allyesconfig
sh                               allmodconfig
openrisc                            defconfig
openrisc                         allyesconfig
sh                                allnoconfig
xtensa                           allyesconfig
riscv                               defconfig
mips                              allnoconfig
parisc                           allyesconfig
i386                              allnoconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                           sun3_defconfig
nios2                               defconfig
nios2                            allyesconfig
c6x                               allnoconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
microblaze                        allnoconfig
mips                             allyesconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20200507
x86_64               randconfig-a006-20200507
x86_64               randconfig-a002-20200507
x86_64               randconfig-a005-20200508
x86_64               randconfig-a003-20200508
x86_64               randconfig-a001-20200508
x86_64               randconfig-a006-20200508
x86_64               randconfig-a004-20200508
x86_64               randconfig-a002-20200508
x86_64               randconfig-a005-20200511
x86_64               randconfig-a003-20200511
x86_64               randconfig-a006-20200511
x86_64               randconfig-a004-20200511
x86_64               randconfig-a001-20200511
x86_64               randconfig-a002-20200511
i386                 randconfig-a005-20200509
i386                 randconfig-a004-20200509
i386                 randconfig-a003-20200509
i386                 randconfig-a002-20200509
i386                 randconfig-a001-20200509
i386                 randconfig-a006-20200509
i386                 randconfig-a006-20200510
i386                 randconfig-a005-20200510
i386                 randconfig-a003-20200510
i386                 randconfig-a001-20200510
i386                 randconfig-a004-20200510
i386                 randconfig-a002-20200510
i386                 randconfig-a006-20200511
i386                 randconfig-a005-20200511
i386                 randconfig-a003-20200511
i386                 randconfig-a001-20200511
i386                 randconfig-a004-20200511
i386                 randconfig-a002-20200511
i386                 randconfig-a005-20200508
i386                 randconfig-a004-20200508
i386                 randconfig-a003-20200508
i386                 randconfig-a002-20200508
i386                 randconfig-a001-20200508
i386                 randconfig-a006-20200508
i386                 randconfig-a005-20200507
i386                 randconfig-a004-20200507
i386                 randconfig-a001-20200507
i386                 randconfig-a002-20200507
i386                 randconfig-a003-20200507
i386                 randconfig-a006-20200507
x86_64               randconfig-a015-20200507
x86_64               randconfig-a014-20200507
x86_64               randconfig-a012-20200507
x86_64               randconfig-a013-20200507
x86_64               randconfig-a011-20200507
x86_64               randconfig-a016-20200507
x86_64               randconfig-a014-20200508
x86_64               randconfig-a012-20200508
x86_64               randconfig-a016-20200508
x86_64               randconfig-a016-20200510
x86_64               randconfig-a012-20200510
x86_64               randconfig-a015-20200510
x86_64               randconfig-a013-20200510
x86_64               randconfig-a014-20200510
x86_64               randconfig-a011-20200510
x86_64               randconfig-a015-20200509
x86_64               randconfig-a014-20200509
x86_64               randconfig-a011-20200509
x86_64               randconfig-a013-20200509
x86_64               randconfig-a012-20200509
x86_64               randconfig-a016-20200509
x86_64               randconfig-a016-20200511
x86_64               randconfig-a012-20200511
x86_64               randconfig-a014-20200511
i386                 randconfig-a012-20200507
i386                 randconfig-a016-20200507
i386                 randconfig-a014-20200507
i386                 randconfig-a011-20200507
i386                 randconfig-a015-20200507
i386                 randconfig-a013-20200507
i386                 randconfig-a012-20200509
i386                 randconfig-a014-20200509
i386                 randconfig-a016-20200509
i386                 randconfig-a011-20200509
i386                 randconfig-a013-20200509
i386                 randconfig-a015-20200509
i386                 randconfig-a012-20200511
i386                 randconfig-a016-20200511
i386                 randconfig-a014-20200511
i386                 randconfig-a011-20200511
i386                 randconfig-a013-20200511
i386                 randconfig-a015-20200511
i386                 randconfig-a012-20200508
i386                 randconfig-a014-20200508
i386                 randconfig-a016-20200508
i386                 randconfig-a011-20200508
i386                 randconfig-a013-20200508
i386                 randconfig-a015-20200508
i386                 randconfig-a012-20200510
i386                 randconfig-a016-20200510
i386                 randconfig-a014-20200510
i386                 randconfig-a011-20200510
i386                 randconfig-a013-20200510
i386                 randconfig-a015-20200510
riscv                            allyesconfig
riscv                             allnoconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                                defconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
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
