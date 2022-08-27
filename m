Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE7F5A3375
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 03:29:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDzdS0KHYz3cFH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 11:29:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FJDv4isI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FJDv4isI;
	dkim-atps=neutral
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir; Sat, 27 Aug 2022 11:29:00 AEST
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDzcr36kSz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Aug 2022 11:29:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661563740; x=1693099740;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GyHld2SP8O9jDRCeItCVPze4uJwtfc7QOZ5YpbxPbwk=;
  b=FJDv4isIo5KEDqIthMSXTAqsWdyuRdWucF5STZeA6hPIf/Z5xc55zZnU
   w2VkUnVrD/NP9TuTujQhQ6C84dvwReTmn5+SrQSWMwALXZ0YdI0Im7Ka0
   jYmFoVtua/Nf/IntEhlXdhMudNtA0Pr6Lrqifli2XYXOkl05aIU1RXA2Z
   tnRbbEUKJZMKO54ybZhzBd2enjypn85DP9CfsyHQAZM9bwaAAzZ/xZixz
   pfdRrtSvzBToCcVMj2/xp/qyIC7DmAsoI9G7wxzDCVh6mMSnm/7YdcFYZ
   IiH5+KT5kkpgLBt768bMUcithOV/XoCMTJYNAXa7OKIGwowSXzc74KgPX
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="275027931"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="275027931"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2022 18:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="736806633"
Received: from lkp-server01.sh.intel.com (HELO 71b0d3b5b1bc) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Aug 2022 18:27:31 -0700
Received: from kbuild by 71b0d3b5b1bc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oRkbi-0000p3-2z;
	Sat, 27 Aug 2022 01:27:30 +0000
Date: Sat, 27 Aug 2022 09:26:46 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 b3dc1b6cf64e35e4c1670e95069c0597aa071fa3
Message-ID: <630972d6.5GTdfYAX0DVMfZ0s%lkp@intel.com>
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
branch HEAD: b3dc1b6cf64e35e4c1670e95069c0597aa071fa3  Automatic merge of 'master' into merge (2022-08-22 13:34)

elapsed time: 722m

configs tested: 88
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
loongarch                         allnoconfig
powerpc                           allnoconfig
loongarch                           defconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
x86_64                              defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                               rhel-8.3
s390                                defconfig
s390                             allyesconfig
sh                               allmodconfig
x86_64                        randconfig-a002
i386                                defconfig
x86_64                           allyesconfig
arm                                 defconfig
powerpc                          allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a006
mips                             allyesconfig
x86_64                        randconfig-a013
arm                              allyesconfig
x86_64                        randconfig-a011
i386                          randconfig-a014
m68k                             allmodconfig
arm64                            allyesconfig
x86_64                        randconfig-a015
i386                          randconfig-a001
i386                          randconfig-a012
i386                          randconfig-a003
alpha                            allyesconfig
m68k                             allyesconfig
arc                              allyesconfig
i386                          randconfig-a016
i386                          randconfig-a005
i386                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
arc                  randconfig-r043-20220824
riscv                randconfig-r042-20220824
s390                 randconfig-r044-20220826
s390                 randconfig-r044-20220824
arc                  randconfig-r043-20220823
riscv                randconfig-r042-20220826
arc                  randconfig-r043-20220826
arc                  randconfig-r043-20220825
ia64                             allmodconfig
riscv                            allmodconfig
powerpc                          allyesconfig
riscv                            allyesconfig
riscv                               defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a012
i386                          randconfig-a011
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
hexagon              randconfig-r041-20220825
hexagon              randconfig-r041-20220823
hexagon              randconfig-r045-20220825
hexagon              randconfig-r041-20220824
hexagon              randconfig-r045-20220824
s390                 randconfig-r044-20220823
hexagon              randconfig-r045-20220826
hexagon              randconfig-r041-20220826
riscv                randconfig-r042-20220825
s390                 randconfig-r044-20220825
riscv                randconfig-r042-20220823
hexagon              randconfig-r045-20220823
hexagon              randconfig-r045-20220827
riscv                randconfig-r042-20220827
hexagon              randconfig-r041-20220827
s390                 randconfig-r044-20220827

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
