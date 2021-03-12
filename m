Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1124E338D39
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 13:39:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dxlkb0YBtz3dKC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 23:39:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxlkG68QWz3cTv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 23:39:16 +1100 (AEDT)
IronPort-SDR: QSjTi/I/qa1sOBu5mUmEpNJ9/Vso04Cz9v6WWmBpUwTtjq6KN8lNs0ashtWgcWxJ6vj5FmhoIg
 ODmS4mW6ib9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="273869087"
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; d="scan'208";a="273869087"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 04:39:13 -0800
IronPort-SDR: /CLS2JotSBQOwYO3erue3rUPsxwvOAQS3Wjfr6kCvgwGT+fDa0TmIO4K0g9VLZ/FXAxog6FW93
 IJmMiX9444Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; d="scan'208";a="431934168"
Received: from lkp-server02.sh.intel.com (HELO ce64c092ff93) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 12 Mar 2021 04:39:10 -0800
Received: from kbuild by ce64c092ff93 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lKh4P-0001Lu-PR; Fri, 12 Mar 2021 12:39:09 +0000
Date: Fri, 12 Mar 2021 20:38:24 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS b38521e8bebde04fa31001435ed77a93f83d896e
Message-ID: <604b60c0.+BZmsamcRzkHPGTc%lkp@intel.com>
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
branch HEAD: b38521e8bebde04fa31001435ed77a93f83d896e  Automatic merge of 'fixes' into merge (2021-03-12 11:02)

elapsed time: 729m

configs tested: 147
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc836x_rdk_defconfig
mips                        qi_lb60_defconfig
powerpc                     tqm8555_defconfig
openrisc                 simple_smp_defconfig
powerpc                     stx_gp3_defconfig
powerpc                      pmac32_defconfig
powerpc                     mpc512x_defconfig
powerpc                     kilauea_defconfig
powerpc                      ppc44x_defconfig
sh                        edosk7705_defconfig
nds32                            alldefconfig
powerpc                    socrates_defconfig
sh                           se7712_defconfig
arm                          collie_defconfig
riscv                               defconfig
powerpc                    ge_imp3a_defconfig
sh                             sh03_defconfig
arm                             mxs_defconfig
sh                        dreamcast_defconfig
arm                          ixp4xx_defconfig
h8300                               defconfig
arc                          axs101_defconfig
sh                   sh7724_generic_defconfig
m68k                         apollo_defconfig
arm                         lpc32xx_defconfig
m68k                          multi_defconfig
powerpc                     mpc5200_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                      ep88xc_defconfig
sh                        sh7763rdp_defconfig
arm                        neponset_defconfig
powerpc                      tqm8xx_defconfig
arm                       cns3420vb_defconfig
arc                        nsim_700_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                 mpc832x_rdb_defconfig
arm64                            alldefconfig
sh                          r7785rp_defconfig
arc                           tb10x_defconfig
arm                        keystone_defconfig
arm                        trizeps4_defconfig
sparc                               defconfig
parisc                generic-64bit_defconfig
mips                          malta_defconfig
m68k                        mvme147_defconfig
powerpc                      ppc40x_defconfig
powerpc                     tqm8548_defconfig
arm                         s3c6400_defconfig
mips                        nlm_xlr_defconfig
arm                          iop32x_defconfig
sparc                       sparc32_defconfig
powerpc                 mpc836x_mds_defconfig
xtensa                generic_kc705_defconfig
powerpc                     tqm5200_defconfig
sparc                            allyesconfig
arc                        nsimosci_defconfig
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
i386                             allyesconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210311
i386                 randconfig-a005-20210311
i386                 randconfig-a003-20210311
i386                 randconfig-a002-20210311
i386                 randconfig-a004-20210311
i386                 randconfig-a006-20210311
x86_64               randconfig-a011-20210312
x86_64               randconfig-a016-20210312
x86_64               randconfig-a013-20210312
x86_64               randconfig-a014-20210312
x86_64               randconfig-a015-20210312
x86_64               randconfig-a012-20210312
i386                 randconfig-a013-20210311
i386                 randconfig-a016-20210311
i386                 randconfig-a011-20210311
i386                 randconfig-a014-20210311
i386                 randconfig-a015-20210311
i386                 randconfig-a012-20210311
i386                 randconfig-a013-20210312
i386                 randconfig-a016-20210312
i386                 randconfig-a011-20210312
i386                 randconfig-a015-20210312
i386                 randconfig-a014-20210312
i386                 randconfig-a012-20210312
x86_64               randconfig-a006-20210311
x86_64               randconfig-a001-20210311
x86_64               randconfig-a005-20210311
x86_64               randconfig-a002-20210311
x86_64               randconfig-a003-20210311
x86_64               randconfig-a004-20210311
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210312
x86_64               randconfig-a001-20210312
x86_64               randconfig-a005-20210312
x86_64               randconfig-a003-20210312
x86_64               randconfig-a002-20210312
x86_64               randconfig-a004-20210312
x86_64               randconfig-a011-20210311
x86_64               randconfig-a016-20210311
x86_64               randconfig-a013-20210311
x86_64               randconfig-a015-20210311
x86_64               randconfig-a014-20210311
x86_64               randconfig-a012-20210311

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
