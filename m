Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C83AD24F15D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 05:08:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BZcX760zhzDqRN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 13:08:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BZcVY2kMDzDqQG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Aug 2020 13:07:14 +1000 (AEST)
IronPort-SDR: qR7+XWHvPiS10fkZcz2svKaHS7Spm1y4wkS/t6GM/TgUiRYNbrjftmaUNrMNBBpLMXqA3m16lk
 inB9zz0OJsXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="155815191"
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; d="scan'208";a="155815191"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2020 20:07:10 -0700
IronPort-SDR: w/eox9c6cNrsiJ0S/QOoLcBmroD+nRc6iJsteLts3088sWiiO16fyvRj6Ya4QzDJLPXPEMI4yf
 8SJaFrcDg3+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; d="scan'208";a="338256537"
Received: from lkp-server01.sh.intel.com (HELO 91ed66e1ca04) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 23 Aug 2020 20:07:09 -0700
Received: from kbuild by 91ed66e1ca04 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kA2pA-0002Mo-R9; Mon, 24 Aug 2020 03:07:08 +0000
Date: Mon, 24 Aug 2020 11:06:22 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 02a4db8feb0e35a215b6b803bce0ab8a1fd32838
Message-ID: <5f432eae.tRITWjoO0GFkk6nt%lkp@intel.com>
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
branch HEAD: 02a4db8feb0e35a215b6b803bce0ab8a1fd32838  powerpc/64: Remove unused generic_secondary_thread_init()

elapsed time: 845m

configs tested: 112
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                       m5475evb_defconfig
m68k                       bvme6000_defconfig
m68k                           sun3_defconfig
powerpc                      chrp32_defconfig
arm                            qcom_defconfig
arm                         mv78xx0_defconfig
c6x                        evmc6457_defconfig
powerpc                      pasemi_defconfig
arm                            hisi_defconfig
arm                        spear3xx_defconfig
nds32                            alldefconfig
powerpc                     powernv_defconfig
sh                        apsh4ad0a_defconfig
arm                  colibri_pxa270_defconfig
mips                   sb1250_swarm_defconfig
arm                         shannon_defconfig
m68k                            q40_defconfig
ia64                         bigsur_defconfig
powerpc                      pmac32_defconfig
powerpc                     skiroot_defconfig
arc                            hsdk_defconfig
csky                             alldefconfig
riscv                    nommu_virt_defconfig
arm                        neponset_defconfig
h8300                            allyesconfig
sh                          polaris_defconfig
sh                          urquell_defconfig
powerpc                             defconfig
m68k                         apollo_defconfig
powerpc                          alldefconfig
arm                            pleb_defconfig
arm                            dove_defconfig
mips                      malta_kvm_defconfig
powerpc                          g5_defconfig
x86_64                           alldefconfig
arm                          ep93xx_defconfig
arm                         lpc32xx_defconfig
sh                             shx3_defconfig
powerpc                    amigaone_defconfig
arm                          tango4_defconfig
sh                            shmin_defconfig
arm                           tegra_defconfig
arm                            mps2_defconfig
arm64                            alldefconfig
arc                             nps_defconfig
um                           x86_64_defconfig
arm                       cns3420vb_defconfig
arm                        multi_v5_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20200823
x86_64               randconfig-a003-20200823
x86_64               randconfig-a005-20200823
x86_64               randconfig-a001-20200823
x86_64               randconfig-a006-20200823
x86_64               randconfig-a004-20200823
i386                 randconfig-a002-20200823
i386                 randconfig-a004-20200823
i386                 randconfig-a003-20200823
i386                 randconfig-a005-20200823
i386                 randconfig-a006-20200823
i386                 randconfig-a001-20200823
i386                 randconfig-a013-20200823
i386                 randconfig-a012-20200823
i386                 randconfig-a011-20200823
i386                 randconfig-a016-20200823
i386                 randconfig-a014-20200823
i386                 randconfig-a015-20200823
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
