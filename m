Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 751DF2E288A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Dec 2020 19:19:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1yyx220VzDqWF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Dec 2020 05:19:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1yw26BQhzDqMK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Dec 2020 05:17:05 +1100 (AEDT)
IronPort-SDR: GAkOvewnUlhM5N63Zjtn3d8zqBSwgNhDVzMZn5TcaQFRVokrO5D3hwJIRn2vJMl4MYLTaMk0Km
 0PeTWzFbw6NQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9845"; a="175394212"
X-IronPort-AV: E=Sophos;i="5.78,444,1599548400"; d="scan'208";a="175394212"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2020 10:17:02 -0800
IronPort-SDR: n1G7HbOvJorrVTE6gOXNhjVpj4Qzp8bav7uQlJ3M+9Ox740GOQWVdB+Fus5MT9LYoO3bvDByFX
 i/Qi7NUq02dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,444,1599548400"; d="scan'208";a="346624605"
Received: from lkp-server02.sh.intel.com (HELO 4242b19f17ef) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 24 Dec 2020 10:17:01 -0800
Received: from kbuild by 4242b19f17ef with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1ksVAa-00016j-GW; Thu, 24 Dec 2020 18:17:00 +0000
Date: Fri, 25 Dec 2020 02:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 b9b8c8d3b4101788dd2c9ff5137baf7801a8f563
Message-ID: <5fe4dae0.00rSin6JmmCY2FJT%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  fixes-test
branch HEAD: b9b8c8d3b4101788dd2c9ff5137baf7801a8f563  powerpc/32s: Fix RTAS machine check with VMAP stack

elapsed time: 959m

configs tested: 53
configs skipped: 112

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                mpc7448_hpc2_defconfig
mips                     cu1830-neo_defconfig
m68k                         amcore_defconfig
arc                           tb10x_defconfig
powerpc                     tqm8540_defconfig
sh                          rsk7201_defconfig
powerpc                    adder875_defconfig
powerpc                 mpc832x_mds_defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20201223
x86_64               randconfig-a006-20201223
x86_64               randconfig-a002-20201223
x86_64               randconfig-a004-20201223
x86_64               randconfig-a003-20201223
x86_64               randconfig-a005-20201223
x86_64               randconfig-a015-20201224
x86_64               randconfig-a014-20201224
x86_64               randconfig-a016-20201224
x86_64               randconfig-a012-20201224
x86_64               randconfig-a013-20201224
x86_64               randconfig-a011-20201224
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20201223
x86_64               randconfig-a014-20201223
x86_64               randconfig-a016-20201223
x86_64               randconfig-a012-20201223
x86_64               randconfig-a013-20201223
x86_64               randconfig-a011-20201223

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
