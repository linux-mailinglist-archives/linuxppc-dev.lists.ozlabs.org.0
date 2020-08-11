Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A42F1242004
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 20:58:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BR2Dc2MwRzDqRk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 04:58:56 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BR2Bl0cRWzDq9p
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 04:57:18 +1000 (AEST)
IronPort-SDR: Se+2sN0GzuUT+ZnEZvcp37p8+B5SX9lJYwwe95QO0tGlqucXAN/6W0CbcQQm7Kry0TLz1Sl4YT
 kLfM9f/ULm3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9710"; a="141424536"
X-IronPort-AV: E=Sophos;i="5.76,301,1592895600"; d="scan'208";a="141424536"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 11:57:15 -0700
IronPort-SDR: U9wLodk5UMYVKmBXmwrUXguVPWGLv4+81E56DTqdHqBw+l0cUKH0pvUNLmFQuT9aUaRipStY00
 lM9oz4IpF1eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,301,1592895600"; d="scan'208";a="439137839"
Received: from lkp-server01.sh.intel.com (HELO 71729f5ca340) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 11 Aug 2020 11:57:14 -0700
Received: from kbuild by 71729f5ca340 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k5ZST-0000ig-D3; Tue, 11 Aug 2020 18:57:13 +0000
Date: Wed, 12 Aug 2020 02:57:07 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS f04b169e953c4db1a3a3c1d23eea09c726f01ee5
Message-ID: <5f32ea03.ISCes8k+sOyhi4Kj%lkp@intel.com>
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
branch HEAD: f04b169e953c4db1a3a3c1d23eea09c726f01ee5  Automatic merge of 'master', 'next' and 'fixes' (2020-08-11 14:12)

elapsed time: 872m

configs tested: 66
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
ia64                             allyesconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20200811
i386                 randconfig-a002-20200811
i386                 randconfig-a003-20200811
i386                 randconfig-a004-20200811
i386                 randconfig-a005-20200811
i386                 randconfig-a006-20200811
i386                 randconfig-a016-20200811
i386                 randconfig-a011-20200811
i386                 randconfig-a015-20200811
i386                 randconfig-a013-20200811
i386                 randconfig-a012-20200811
i386                 randconfig-a014-20200811
x86_64               randconfig-a006-20200811
x86_64               randconfig-a001-20200811
x86_64               randconfig-a003-20200811
x86_64               randconfig-a005-20200811
x86_64               randconfig-a004-20200811
x86_64               randconfig-a002-20200811
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
