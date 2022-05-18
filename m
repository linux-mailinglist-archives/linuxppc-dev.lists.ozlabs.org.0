Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B050B52B077
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 04:22:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2xZc4RLwz3by3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 12:22:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=irHXcq84;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=irHXcq84; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2xYw3DmFz3bjq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 12:21:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652840484; x=1684376484;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=uywjbggpeseay136CuWJdtjRHPw2A1O6QwkQvD6L5Ws=;
 b=irHXcq84tWkHGx6IGa/0kv9hsUcestIDqlzq+AL0fG4qIT3FRe1dpjzF
 Wf0yDrteqCg2O2vZZ/ZB6UQAkhYBaCY04JlCS0mv7BziqYPA9i7YWoGSn
 xxzNorPlM+5O1IDxYMIpm7yCTJdcKI4x4naSB8DYVhIPNe6svCC5I4UC/
 dZmiV76+fkuN04xRqGoDLOjPBLOk3S80OnhfKMRsQl0RNHjjFG5RtdR35
 HuPwge9A+GJfSb8IB8Sky2giDIwEq6Dk3tU8504BH+HkEol/4TeWDANPG
 vAPkJbAvOzu/voQ1eqkUxs231R4L5RI1Lctxpd5t1XSMHAtJd9UdpjHBY A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="271562215"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="271562215"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 19:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="523269914"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 17 May 2022 19:20:12 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nr9IJ-0001hX-Ng;
 Wed, 18 May 2022 02:20:11 +0000
Date: Wed, 18 May 2022 10:19:24 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/ppc-kvm] BUILD SUCCESS
 2852ebfa10afdcefff35ec72c8da97141df9845c
Message-ID: <628457ac.ZiJZ8y+f3FxhjQVF%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
branch HEAD: 2852ebfa10afdcefff35ec72c8da97141df9845c  KVM: PPC: Book3S HV Nested: L2 LPCR should inherit L1 LPES setting

elapsed time: 724m

configs tested: 119
configs skipped: 104

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220516
m68k                        m5407c3_defconfig
m68k                             allmodconfig
sparc                       sparc64_defconfig
mips                            ar7_defconfig
s390                             allyesconfig
sh                           se7712_defconfig
arm                          pxa3xx_defconfig
sh                           se7206_defconfig
sh                   sh7724_generic_defconfig
m68k                       m5249evb_defconfig
arm                           h5000_defconfig
sh                           se7724_defconfig
powerpc                 mpc85xx_cds_defconfig
riscv             nommu_k210_sdcard_defconfig
m68k                       m5208evb_defconfig
sh                             sh03_defconfig
sh                ecovec24-romimage_defconfig
sh                          r7780mp_defconfig
powerpc                       ppc64_defconfig
arc                        nsimosci_defconfig
powerpc                     pq2fads_defconfig
sh                         ecovec24_defconfig
mips                            gpr_defconfig
m68k                       bvme6000_defconfig
arm                  randconfig-c002-20220516
x86_64               randconfig-c001-20220516
ia64                                defconfig
m68k                             allyesconfig
m68k                                defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a012-20220516
x86_64               randconfig-a016-20220516
x86_64               randconfig-a011-20220516
x86_64               randconfig-a014-20220516
x86_64               randconfig-a013-20220516
x86_64               randconfig-a015-20220516
i386                 randconfig-a016-20220516
i386                 randconfig-a013-20220516
i386                 randconfig-a015-20220516
i386                 randconfig-a012-20220516
i386                 randconfig-a014-20220516
i386                 randconfig-a011-20220516
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
s390                 randconfig-r044-20220516
riscv                randconfig-r042-20220516
arc                  randconfig-r043-20220516
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
powerpc              randconfig-c003-20220516
riscv                randconfig-c006-20220516
mips                 randconfig-c004-20220516
arm                  randconfig-c002-20220516
x86_64               randconfig-c007-20220516
i386                 randconfig-c001-20220516
s390                 randconfig-c005-20220516
mips                         tb0287_defconfig
powerpc                      ppc44x_defconfig
powerpc                    mvme5100_defconfig
arm                     davinci_all_defconfig
i386                 randconfig-a001-20220516
i386                 randconfig-a003-20220516
i386                 randconfig-a005-20220516
i386                 randconfig-a004-20220516
i386                 randconfig-a006-20220516
i386                 randconfig-a002-20220516
x86_64               randconfig-a001-20220516
x86_64               randconfig-a006-20220516
x86_64               randconfig-a003-20220516
x86_64               randconfig-a005-20220516
x86_64               randconfig-a002-20220516
x86_64               randconfig-a004-20220516
hexagon              randconfig-r045-20220516
hexagon              randconfig-r041-20220516

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
