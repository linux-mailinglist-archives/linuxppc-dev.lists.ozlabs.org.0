Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 923AA58B802
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 21:55:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M0Y9k2pdSz3bkn
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Aug 2022 05:55:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZxXNzDAm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZxXNzDAm;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M0Y936yrVz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Aug 2022 05:55:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659815720; x=1691351720;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RdCFktxzttG+huFdHkNFmWpDiP/7keAl1+nCq3epCMs=;
  b=ZxXNzDAmNyeiplWDSrhChS9ZAzpfeod3f5JoqiHifZNsuZE75Qrr55Zz
   +zvXSxe4L+yAGoJgFRgBBN2cWfvkogA2IE0EWghbPjclgokfW6PxxhZsQ
   AnxyELZGjbGsqWu6RCqiCj9JoF9Zl8ZUM2ZbLA2h+BQDNm9TFZgUJ2n6N
   Syms/D/BOFr/H63q/DQbVpWq2c3M4zQj3ZfRF2TJPRxXZECXy0t7rzJA4
   sb3lAGR7PO2pipbZh9IroTVvKYAyItDpI8vwgDQQjAn74lKozuYpiU/m4
   VCLTwFH1mZ/sJz3VM5Uxph78dSYCiok0iZmCwxZTU5RZaGEG5DZAK0/rj
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10431"; a="273436483"
X-IronPort-AV: E=Sophos;i="5.93,217,1654585200"; 
   d="scan'208";a="273436483"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2022 12:55:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,217,1654585200"; 
   d="scan'208";a="632391239"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Aug 2022 12:55:07 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oKPt4-000KdF-1V;
	Sat, 06 Aug 2022 19:55:06 +0000
Date: Sun, 07 Aug 2022 03:54:58 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 ff1ed171e05c971652a0ede3d716997de8ee41c9
Message-ID: <62eec712.yHFGXdE8y8n0eBVW%lkp@intel.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: ff1ed171e05c971652a0ede3d716997de8ee41c9  Automatic merge of 'next' into merge (2022-08-06 16:50)

elapsed time: 719m

configs tested: 79
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a005
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a015
x86_64                        randconfig-a002
x86_64                        randconfig-a013
x86_64                           allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a006
x86_64                        randconfig-a004
i386                                defconfig
i386                          randconfig-a016
arc                  randconfig-r043-20220806
arm                                 defconfig
i386                          randconfig-a012
m68k                             allmodconfig
arc                              allyesconfig
riscv                randconfig-r042-20220805
alpha                            allyesconfig
i386                             allyesconfig
s390                 randconfig-r044-20220805
i386                          randconfig-a014
arc                  randconfig-r043-20220805
m68k                             allyesconfig
powerpc                           allnoconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
arc                               allnoconfig
alpha                             allnoconfig
arm                          pxa910_defconfig
sh                           sh2007_defconfig
riscv                             allnoconfig
nios2                         10m50_defconfig
csky                              allnoconfig
powerpc                      mgcoge_defconfig
powerpc                       maple_defconfig
arm                      integrator_defconfig
arm                            zeus_defconfig
sh                        edosk7705_defconfig
sh                          rsk7201_defconfig
powerpc                      chrp32_defconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
mips                        vocore2_defconfig
arm                      footbridge_defconfig
powerpc                         wii_defconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a012
i386                          randconfig-a006
x86_64                        randconfig-a005
x86_64                        randconfig-a016
i386                          randconfig-a015
hexagon              randconfig-r041-20220806
hexagon              randconfig-r045-20220806
s390                 randconfig-r044-20220806
hexagon              randconfig-r041-20220805
riscv                randconfig-r042-20220806
i386                          randconfig-a013
hexagon              randconfig-r045-20220805
i386                          randconfig-a011
arm                             mxs_defconfig
mips                      malta_kvm_defconfig
riscv                          rv32_defconfig
arm                         lpc32xx_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
