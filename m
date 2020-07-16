Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7411B221DA1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 09:51:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6mfC3BBRzDqpy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 17:51:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6mc50K5zzDqlR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 17:49:18 +1000 (AEST)
IronPort-SDR: xk3iiR1FmggiP3hoa3nWCwXNmWxoxIu4dHRFpkgUDav40Qrqy4YTskfuQlS+wN9yoTsIO6okMs
 +I0nspmln+fA==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="167468131"
X-IronPort-AV: E=Sophos;i="5.75,358,1589266800"; d="scan'208";a="167468131"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 00:49:14 -0700
IronPort-SDR: ZEIpYJcDyJVRAM8Bb19QjPwhj1dnPWqBakLds1RLgIacIult9FExRLgjkhcJCjWg+4kZSA3nYt
 7dh4rnWez/AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,358,1589266800"; d="scan'208";a="270495452"
Received: from lkp-server02.sh.intel.com (HELO 02dcbd16d3ea) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 16 Jul 2020 00:49:13 -0700
Received: from kbuild by 02dcbd16d3ea with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jvydk-00006C-Qv; Thu, 16 Jul 2020 07:49:12 +0000
Date: Thu, 16 Jul 2020 15:47:37 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 58a4eb09c4aebaaffa8b4517c71543a41539c096
Message-ID: <5f100619.6AcduvpjXDNMKo5l%lkp@intel.com>
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
branch HEAD: 58a4eb09c4aebaaffa8b4517c71543a41539c096  Automatic merge of 'master', 'next' and 'fixes' (2020-07-15 23:12)

elapsed time: 1031m

configs tested: 94
configs skipped: 4

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
arc                          axs101_defconfig
c6x                        evmc6457_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                    gamecube_defconfig
arm                          lpd270_defconfig
mips                          malta_defconfig
riscv                               defconfig
c6x                        evmc6474_defconfig
arm                        clps711x_defconfig
arm                           corgi_defconfig
riscv                            allyesconfig
arm                         orion5x_defconfig
arm                          moxart_defconfig
powerpc                    amigaone_defconfig
m68k                         apollo_defconfig
sh                        edosk7705_defconfig
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
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a016-20200715
i386                 randconfig-a011-20200715
i386                 randconfig-a015-20200715
i386                 randconfig-a012-20200715
i386                 randconfig-a013-20200715
i386                 randconfig-a014-20200715
riscv                             allnoconfig
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
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
