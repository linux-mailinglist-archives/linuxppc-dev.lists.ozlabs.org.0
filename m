Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A8F36D0F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 05:47:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVPhg0GLvz30D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 13:47:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVPhH6dzgz2xg6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 13:46:52 +1000 (AEST)
IronPort-SDR: qhoWv+Ab85VKlBnVWfzcF5RpreLB8u+cWFqnj0CMuArfFmMCBYbXjArK/XAHNN7W2o1HcqHnua
 D2wKn+3vgKAw==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="196203087"
X-IronPort-AV: E=Sophos;i="5.82,257,1613462400"; d="scan'208";a="196203087"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 20:46:48 -0700
IronPort-SDR: zwdPyXvv95ifaeJ2CIqOQ4FAGuTYqPwcCPdMM0/oecY8Ol/PVX2HbUpfl+/v0FFZuA1OXi9KsY
 v2MI3C41qvfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,257,1613462400"; d="scan'208";a="526341414"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2021 20:46:47 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lbb9z-0006v2-03; Wed, 28 Apr 2021 03:46:47 +0000
Date: Wed, 28 Apr 2021 11:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 1b628dbc3ccb0b51963fcb3c60b57daac21dc016
Message-ID: <6088da6a.ZJxXHaEisex5KoXN%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 1b628dbc3ccb0b51963fcb3c60b57daac21dc016  Automatic merge of 'master' into merge (2021-04-27 23:47)

elapsed time: 814m

configs tested: 131
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
mips                        maltaup_defconfig
mips                           rs90_defconfig
powerpc                     mpc83xx_defconfig
microblaze                          defconfig
openrisc                 simple_smp_defconfig
mips                        bcm47xx_defconfig
h8300                            alldefconfig
sh                 kfr2r09-romimage_defconfig
arm                        spear6xx_defconfig
powerpc                          g5_defconfig
m68k                          sun3x_defconfig
m68k                        m5272c3_defconfig
arm                  colibri_pxa300_defconfig
xtensa                    xip_kc705_defconfig
sh                         apsh4a3a_defconfig
arm                           stm32_defconfig
s390                             alldefconfig
mips                      maltaaprp_defconfig
powerpc                    amigaone_defconfig
sh                   sh7724_generic_defconfig
ia64                          tiger_defconfig
mips                        jmr3927_defconfig
arm                            xcep_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                      chrp32_defconfig
powerpc                     powernv_defconfig
sh                         microdev_defconfig
arm                            mmp2_defconfig
mips                           ip22_defconfig
arm                          moxart_defconfig
arm                          pcm027_defconfig
arm                           tegra_defconfig
xtensa                       common_defconfig
sh                           se7721_defconfig
powerpc                   bluestone_defconfig
arm                       mainstone_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                     tqm8548_defconfig
sh                               alldefconfig
m68k                       m5475evb_defconfig
mips                      fuloong2e_defconfig
sh                          sdk7780_defconfig
arm                        keystone_defconfig
h8300                     edosk2674_defconfig
xtensa                         virt_defconfig
sh                          rsk7203_defconfig
microblaze                      mmu_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210426
i386                 randconfig-a002-20210426
i386                 randconfig-a001-20210426
i386                 randconfig-a006-20210426
i386                 randconfig-a004-20210426
i386                 randconfig-a003-20210426
i386                 randconfig-a005-20210427
i386                 randconfig-a002-20210427
i386                 randconfig-a001-20210427
i386                 randconfig-a006-20210427
i386                 randconfig-a004-20210427
i386                 randconfig-a003-20210427
x86_64               randconfig-a015-20210426
x86_64               randconfig-a016-20210426
x86_64               randconfig-a011-20210426
x86_64               randconfig-a014-20210426
x86_64               randconfig-a012-20210426
x86_64               randconfig-a013-20210426
i386                 randconfig-a014-20210426
i386                 randconfig-a012-20210426
i386                 randconfig-a011-20210426
i386                 randconfig-a013-20210426
i386                 randconfig-a015-20210426
i386                 randconfig-a016-20210426
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210426
x86_64               randconfig-a004-20210426
x86_64               randconfig-a001-20210426
x86_64               randconfig-a006-20210426
x86_64               randconfig-a005-20210426
x86_64               randconfig-a003-20210426

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
