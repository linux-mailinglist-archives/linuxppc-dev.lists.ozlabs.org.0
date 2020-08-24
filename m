Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4950224F15F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 05:10:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BZcYr1KspzDqQY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 13:10:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BZcVY16K4zDqQF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Aug 2020 13:07:14 +1000 (AEST)
IronPort-SDR: nWWRqbSrvCqC3NvkpGcFBb8JMMwaoecJfDnlEFuZvi4wOqBWO3ETGz5XrDFwgIUei4d1EfFzWj
 f5Bsw0ooqdTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="153422758"
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; d="scan'208";a="153422758"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2020 20:07:11 -0700
IronPort-SDR: pmpOw+Xa88+3uST/3nbwxSnOswjOOwCOK+iyAn4oXsGBRhfshdhvb5jzUSlsOIkf3UBfZidh8A
 pOIf91eoI1Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; d="scan'208";a="328335002"
Received: from lkp-server01.sh.intel.com (HELO 91ed66e1ca04) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 23 Aug 2020 20:07:09 -0700
Received: from kbuild by 91ed66e1ca04 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kA2pA-0002Mr-V7; Mon, 24 Aug 2020 03:07:08 +0000
Date: Mon, 24 Aug 2020 11:06:18 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 3829b105d464789815a333dd34ceac63cfe9bd22
Message-ID: <5f432eaa.0dGIR0c59CL6wyuZ%lkp@intel.com>
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
branch HEAD: 3829b105d464789815a333dd34ceac63cfe9bd22  Automatic merge of 'master', 'next' and 'fixes' (2020-08-23 21:44)

elapsed time: 846m

configs tested: 107
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
powerpc                    amigaone_defconfig
arm                          tango4_defconfig
sh                            shmin_defconfig
arm                           tegra_defconfig
arm                            mps2_defconfig
arm64                            alldefconfig
arc                             nps_defconfig
arm                          ep93xx_defconfig
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
