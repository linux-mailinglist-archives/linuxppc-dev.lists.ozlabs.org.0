Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C82552E30C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 05:19:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4BmD11sQz3bld
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 13:19:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JA7j36IV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JA7j36IV; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4BlR6CFlz3bqG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 13:18:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653016740; x=1684552740;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=BSSGLXYY7s4CJS3l5on/a7IsLra+3kYMXtGzzN4EtfQ=;
 b=JA7j36IVd0bwTkLUBdFhhAFiuXAvp2JdLDAdddkKNyv+jjsAXUiq9WI5
 qMADHP0QgB+iZyQjhJdOoEi/uSAHtEymumCJkeSyqRZarXdM8+UZgNrlu
 sC8wMM69RPEkg8tQ/AmsODmZNaKlLEu8TRqj5lsGOPDgUULhE5sBOebYu
 JAbyNegmBE6CejxixBOoyNQJSEerWYB7fjueCTEXJVLZwrIgcKeLVpmXG
 t8MXtftoZmTLZGMwXxTLAMh4NY//6yfgokW4rDyOej9DWqSXu9fKUN45f
 lCHyertDAdg+w0V3VBOsRWxtuqw8WCYAAA6bGv4tyaTBVJQqzSw/FwuRA w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="254519226"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="254519226"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 20:18:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="557245954"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 19 May 2022 20:18:53 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nrtAC-0004EH-Th;
 Fri, 20 May 2022 03:18:52 +0000
Date: Fri, 20 May 2022 11:18:24 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/ppc-kvm] BUILD SUCCESS
 ad55bae7dc364417434b69dd6c30104f20d0f84d
Message-ID: <62870880.T3hRaycec9FWGWqf%lkp@intel.com>
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
branch HEAD: ad55bae7dc364417434b69dd6c30104f20d0f84d  KVM: PPC: Book3S HV: Fix vcore_blocked tracepoint

elapsed time: 736m

configs tested: 129
configs skipped: 105

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
arm64                               defconfig
i386                          randconfig-c001
m68k                           sun3_defconfig
mips                         bigsur_defconfig
xtensa                    smp_lx200_defconfig
powerpc                     mpc83xx_defconfig
s390                       zfcpdump_defconfig
arm                         axm55xx_defconfig
ia64                      gensparse_defconfig
mips                           ci20_defconfig
xtensa                          iss_defconfig
s390                             allyesconfig
powerpc                      pcm030_defconfig
sh                   sh7770_generic_defconfig
h8300                    h8300h-sim_defconfig
sh                        sh7763rdp_defconfig
powerpc                     sequoia_defconfig
sh                         microdev_defconfig
riscv                            allyesconfig
arm                      jornada720_defconfig
powerpc64                           defconfig
mips                       capcella_defconfig
powerpc                 linkstation_defconfig
powerpc                        warp_defconfig
h8300                            allyesconfig
powerpc                      ppc40x_defconfig
powerpc                      ep88xc_defconfig
h8300                       h8s-sim_defconfig
powerpc                 mpc834x_mds_defconfig
m68k                       m5208evb_defconfig
mips                  decstation_64_defconfig
m68k                       bvme6000_defconfig
arm                      footbridge_defconfig
sh                          sdk7786_defconfig
mips                 decstation_r4k_defconfig
um                             i386_defconfig
powerpc                     rainier_defconfig
sh                   secureedge5410_defconfig
arm                        realview_defconfig
sh                   rts7751r2dplus_defconfig
sh                          urquell_defconfig
m68k                          sun3x_defconfig
sh                        sh7757lcr_defconfig
ia64                                defconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc              randconfig-c003-20220519
x86_64                        randconfig-c007
riscv                randconfig-c006-20220519
mips                 randconfig-c004-20220519
i386                          randconfig-c001
arm                  randconfig-c002-20220519
mips                     loongson2k_defconfig
powerpc                     tqm8560_defconfig
hexagon                          alldefconfig
powerpc                       ebony_defconfig
riscv                          rv32_defconfig
powerpc                     tqm8540_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                 mpc8272_ads_defconfig
arm                         palmz72_defconfig
mips                            e55_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220519
riscv                randconfig-r042-20220519
hexagon              randconfig-r041-20220519

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
