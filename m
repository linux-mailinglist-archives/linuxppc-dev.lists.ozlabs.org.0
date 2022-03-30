Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0394EBC70
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 10:13:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSzjK4pXdz2yPJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 19:13:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iWCG3MO8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iWCG3MO8; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSzhg2Lfgz2xY6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 19:13:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648628003; x=1680164003;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=L5cBxTR6pKFOFoybDGqy6AWXdNA1zib1r+Vinxc6OJE=;
 b=iWCG3MO8eZKSdfQuyDFds4yzdsld3hBfQsqH6jy5D3J7K6l+bV7BKXGx
 U3gFvHOJljLS69Rqe3czqtUPeeTPEojydeqF9ufpvfs/tIYN49IFzk6D9
 r+j115Sv/ucX44QCM751vFLeKRzFWOGoCoe1946k2qZ2XklKH+YhjOWVm
 Rv7Oq41yC21ycFCaDGDg3dQhLVyo7ZH2qJ2ZC4f3Kn+D0VVmBP1UC1oIg
 mp/xOj3eUW1XtjFevQ8gosRmWzbaQ6uURQussn1eo3nGRCkwwZ2WMaTH8
 v1jrSd5Dmp+53IabtwAgzBv6ErtqhCU/Ju3nO/t5+D9UioZmIy5rlVX4C A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259665939"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="259665939"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 01:12:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="837031898"
Received: from lkp-server02.sh.intel.com (HELO 7a008980c4ea) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 30 Mar 2022 01:12:13 -0700
Received: from kbuild by 7a008980c4ea with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nZTR7-000045-4s; Wed, 30 Mar 2022 08:12:13 +0000
Date: Wed, 30 Mar 2022 16:12:06 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS af41d2866f7d75bbb38d487f6ec7770425d70e45
Message-ID: <624410d6.WZPncr7okEIw8+Pg%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: af41d2866f7d75bbb38d487f6ec7770425d70e45  powerpc/64: Fix build failure with allyesconfig in book3s_64_entry.S

elapsed time: 967m

configs tested: 137
configs skipped: 136

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc              randconfig-c003-20220330
i386                          randconfig-c001
sh                      rts7751r2d1_defconfig
arm                        realview_defconfig
arm                         assabet_defconfig
alpha                               defconfig
xtensa                           allyesconfig
sh                           se7619_defconfig
sh                          lboxre2_defconfig
powerpc                      pasemi_defconfig
arm                       imx_v6_v7_defconfig
parisc64                         alldefconfig
mips                         tb0226_defconfig
arm                        clps711x_defconfig
arm                            xcep_defconfig
arm                          badge4_defconfig
arm                             pxa_defconfig
ia64                             allmodconfig
arc                                 defconfig
i386                                defconfig
arm                        cerfcube_defconfig
openrisc                    or1ksim_defconfig
m68k                       m5249evb_defconfig
powerpc                      ppc40x_defconfig
arm                            qcom_defconfig
mips                         db1xxx_defconfig
sh                          sdk7786_defconfig
powerpc                         wii_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                  randconfig-c002-20220327
arm                  randconfig-c002-20220329
arm                  randconfig-c002-20220330
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20220328
x86_64               randconfig-a003-20220328
x86_64               randconfig-a004-20220328
x86_64               randconfig-a002-20220328
x86_64               randconfig-a005-20220328
x86_64               randconfig-a006-20220328
i386                 randconfig-a001-20220328
i386                 randconfig-a003-20220328
i386                 randconfig-a006-20220328
i386                 randconfig-a005-20220328
i386                 randconfig-a004-20220328
i386                 randconfig-a002-20220328
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
mips                 randconfig-c004-20220329
x86_64                        randconfig-c007
mips                 randconfig-c004-20220327
arm                  randconfig-c002-20220327
arm                  randconfig-c002-20220329
riscv                randconfig-c006-20220327
powerpc              randconfig-c003-20220327
powerpc              randconfig-c003-20220329
riscv                randconfig-c006-20220329
i386                          randconfig-c001
mips                 randconfig-c004-20220330
powerpc              randconfig-c003-20220330
riscv                randconfig-c006-20220330
arm                  randconfig-c002-20220330
mips                        workpad_defconfig
powerpc                    socrates_defconfig
mips                           rs90_defconfig
powerpc                   lite5200b_defconfig
powerpc                     kilauea_defconfig
riscv                            alldefconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a016-20220328
x86_64               randconfig-a012-20220328
x86_64               randconfig-a011-20220328
x86_64               randconfig-a014-20220328
x86_64               randconfig-a013-20220328
x86_64               randconfig-a015-20220328
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
i386                 randconfig-a015-20220328
i386                 randconfig-a016-20220328
i386                 randconfig-a011-20220328
i386                 randconfig-a012-20220328
i386                 randconfig-a014-20220328
i386                 randconfig-a013-20220328
riscv                randconfig-r042-20220328
hexagon              randconfig-r045-20220329
hexagon              randconfig-r045-20220328
hexagon              randconfig-r045-20220327
hexagon              randconfig-r041-20220327
hexagon              randconfig-r041-20220329
hexagon              randconfig-r041-20220328

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
