Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E49614FE345
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 15:56:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd6hs6zhSz3bcC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 23:56:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sn8oJyjL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Sn8oJyjL; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd6h86pJHz2xXB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 23:56:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649771769; x=1681307769;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=x0bmk5tKu6uMP/lTUy0JV72ct/HVtXnVg6vzAKAeu4E=;
 b=Sn8oJyjLTswPKQEsdrQJKZSwmlNch39no9DtpAqKExzgi+AlNWV0Yz8e
 miF3akidXP9U3LcKVBCv+eXND87auLkR3pwlUlCkepVXXU7W1NOMzthLi
 dlPQVfvIXXXabklwkFUpetHnatMg8VykN59FBDzXc37iXdnRK1HafCOru
 Fif/AHJtyBzzI85cSxomJZW0VxhgbPS+gbFTMUeBpT5cEOEl1XX19XrUG
 88UrN6eG6ZN7VcfG8OpeVizBewL0ufGt0rRoPZ3TZ+3d+fSdropM/9pNv
 c3A21PKV3BudxhmL/mxrAVGWJA2KejksZB4dyN51ZJCy2tmuk1Zng83+R A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="259974223"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; d="scan'208";a="259974223"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 06:55:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; d="scan'208";a="644733592"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Apr 2022 06:54:59 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1neGyw-0002tD-HD;
 Tue, 12 Apr 2022 13:54:58 +0000
Date: Tue, 12 Apr 2022 21:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 83d8a0d166119de813cad27ae7d61f54f9aea707
Message-ID: <62558490.gDyQYKtXjLIzZKWf%lkp@intel.com>
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
branch HEAD: 83d8a0d166119de813cad27ae7d61f54f9aea707  Automatic merge of 'master' into merge (2022-04-11 23:56)

elapsed time: 1324m

configs tested: 125
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220411
arm                            lart_defconfig
arc                           tb10x_defconfig
arm                          gemini_defconfig
i386                                defconfig
sh                               alldefconfig
sh                 kfr2r09-romimage_defconfig
arm                       imx_v6_v7_defconfig
arm                          pxa3xx_defconfig
m68k                       m5475evb_defconfig
xtensa                          iss_defconfig
parisc64                         alldefconfig
arm                        realview_defconfig
sh                          sdk7780_defconfig
powerpc                     ep8248e_defconfig
powerpc                      bamboo_defconfig
powerpc                     stx_gp3_defconfig
mips                  decstation_64_defconfig
powerpc                     mpc83xx_defconfig
xtensa                  cadence_csp_defconfig
sh                          rsk7203_defconfig
mips                         cobalt_defconfig
nios2                            alldefconfig
ia64                      gensparse_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                      jornada720_defconfig
openrisc                         alldefconfig
x86_64               randconfig-c001-20220411
arm                  randconfig-c002-20220411
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a016-20220411
x86_64               randconfig-a012-20220411
x86_64               randconfig-a013-20220411
x86_64               randconfig-a014-20220411
x86_64               randconfig-a015-20220411
x86_64               randconfig-a011-20220411
i386                 randconfig-a015-20220411
i386                 randconfig-a011-20220411
i386                 randconfig-a016-20220411
i386                 randconfig-a012-20220411
i386                 randconfig-a013-20220411
i386                 randconfig-a014-20220411
riscv                randconfig-r042-20220411
arc                  randconfig-r043-20220411
s390                 randconfig-r044-20220411
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
powerpc              randconfig-c003-20220411
arm                  randconfig-c002-20220411
x86_64               randconfig-c007-20220411
i386                 randconfig-c001-20220411
mips                 randconfig-c004-20220411
s390                 randconfig-c005-20220411
riscv                randconfig-c006-20220411
powerpc                 mpc832x_mds_defconfig
arm                        multi_v5_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                     mpc512x_defconfig
hexagon                             defconfig
powerpc                 mpc832x_rdb_defconfig
arm                          imote2_defconfig
arm                          pxa168_defconfig
arm                           sama7_defconfig
x86_64               randconfig-a003-20220411
x86_64               randconfig-a004-20220411
x86_64               randconfig-a006-20220411
x86_64               randconfig-a001-20220411
x86_64               randconfig-a002-20220411
x86_64               randconfig-a005-20220411
i386                 randconfig-a003-20220411
i386                 randconfig-a005-20220411
i386                 randconfig-a001-20220411
i386                 randconfig-a006-20220411
i386                 randconfig-a004-20220411
i386                 randconfig-a002-20220411
hexagon              randconfig-r041-20220411
hexagon              randconfig-r045-20220411

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
