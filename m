Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CDD487088
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 03:36:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVS5c6tQSz3bVW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 13:36:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cnqmNBBL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cnqmNBBL; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVS4x0ZJrz2yg5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 13:35:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641522945; x=1673058945;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Q5HVxQi3Ll0nzUHixVfyc7gjV9YCUO58F5Jo+fCxWjA=;
 b=cnqmNBBLD+DKC4rUMzJJh545pplCRbqgi63kAjySQCO/Kd0tfRUq0rw6
 VO9EiASgXV4Vfi3aD9xU6SGSJjRJ2j9faEIHOoZf8C2LluasKggtfQdBx
 ghsjh/c/nJsVX/m+rpmSsJL5Kt+fRswgUC61IvFtFw6cPG1C7qKjmyz1Z
 PIywGKCJBTsU+Wf6qbKcviQPEaVLsQ1OeFzc2FRYcFalJiRl2/tgXEoMv
 lVl8KvuF61e5Uw1b+VC3Bzr56AjqyQMYBoEk9dDn9IfPqXIYDLY58ex5G
 wdlGOiG9hLMeAKCXFavQm3dyWZDKJJjBOvhYU9Ihjj2h3gTqftTJjnoMy g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="242586883"
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; d="scan'208";a="242586883"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 18:34:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; d="scan'208";a="621744764"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 06 Jan 2022 18:34:38 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n5f5R-000IBU-Tb; Fri, 07 Jan 2022 02:34:37 +0000
Date: Fri, 07 Jan 2022 10:33:40 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS f1aa0e47c29268776205698f2453dc07fab49855
Message-ID: <61d7a684.WO72EMR0pWnYnObT%lkp@intel.com>
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
branch HEAD: f1aa0e47c29268776205698f2453dc07fab49855  powerpc/xmon: Dump XIVE information for online-only processors.

elapsed time: 721m

configs tested: 122
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
i386                 randconfig-c001-20220106
s390                       zfcpdump_defconfig
arm                     eseries_pxa_defconfig
powerpc                    adder875_defconfig
sh                        sh7785lcr_defconfig
powerpc                    klondike_defconfig
m68k                          atari_defconfig
m68k                          multi_defconfig
sh                        sh7763rdp_defconfig
sh                            shmin_defconfig
sh                           se7705_defconfig
powerpc                      tqm8xx_defconfig
sh                           se7206_defconfig
powerpc64                        alldefconfig
arc                          axs101_defconfig
powerpc                     taishan_defconfig
sh                        edosk7705_defconfig
sh                          r7780mp_defconfig
mips                      loongson3_defconfig
ia64                      gensparse_defconfig
openrisc                    or1ksim_defconfig
xtensa                  cadence_csp_defconfig
sh                         ap325rxa_defconfig
powerpc                      ep88xc_defconfig
m68k                        m5407c3_defconfig
mips                         cobalt_defconfig
sh                           se7721_defconfig
mips                            gpr_defconfig
arm                  randconfig-c002-20220106
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a012-20220106
x86_64               randconfig-a015-20220106
x86_64               randconfig-a014-20220106
x86_64               randconfig-a013-20220106
x86_64               randconfig-a011-20220106
x86_64               randconfig-a016-20220106
i386                 randconfig-a012-20220106
i386                 randconfig-a016-20220106
i386                 randconfig-a014-20220106
i386                 randconfig-a015-20220106
i386                 randconfig-a011-20220106
i386                 randconfig-a013-20220106
s390                 randconfig-r044-20220106
arc                  randconfig-r043-20220106
riscv                randconfig-r042-20220106
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
x86_64                                  kexec

clang tested configs:
mips                 randconfig-c004-20220106
arm                  randconfig-c002-20220106
i386                 randconfig-c001-20220106
riscv                randconfig-c006-20220106
powerpc              randconfig-c003-20220106
x86_64               randconfig-c007-20220106
s390                 randconfig-c005-20220106
arm                  colibri_pxa300_defconfig
mips                       lemote2f_defconfig
mips                         tb0219_defconfig
powerpc                 xes_mpc85xx_defconfig
s390                             alldefconfig
mips                           ip28_defconfig
mips                      bmips_stb_defconfig
i386                 randconfig-a003-20220106
i386                 randconfig-a005-20220106
i386                 randconfig-a004-20220106
i386                 randconfig-a006-20220106
i386                 randconfig-a002-20220106
i386                 randconfig-a001-20220106
x86_64               randconfig-a005-20220106
x86_64               randconfig-a001-20220106
x86_64               randconfig-a004-20220106
x86_64               randconfig-a006-20220106
x86_64               randconfig-a002-20220106
x86_64               randconfig-a003-20220106

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
