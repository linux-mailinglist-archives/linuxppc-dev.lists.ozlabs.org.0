Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D966650C34
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 13:54:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NbKQk01Wsz3c7s
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 23:54:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y5L27qPe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y5L27qPe;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NbKPm4CG1z2xl2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Dec 2022 23:53:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671454396; x=1702990396;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=94aUqKfC+bxRV8tDPD0TzmeHDKV39RcV3U7WhDU0NV0=;
  b=Y5L27qPe26DzumPm+i9bJKDIzlKqLoVfuAlQYEupfT3kvRDpjk4OSfSg
   ri0q6xCPYe/ytyO98bmUWxCGBimFRXeUxtu0SN96KRcd+4zzoRDPRF8xV
   CQz2SN7zhENk7Y0hKgW06/AzOILucx8rO+qrJe4j6F4ybt97bnNfn0zwE
   XAJctr8hybkoBGYzlb9Xs8GqfmVYOxK63AF2gkWWvR3DRcpxJlcipYVbF
   5JTa2A0QIogzeBs2I8AJxubJGTj+WoP6YgpB+xNq++GYrcXn/Fg1vO1V9
   ReYTiASEq0lF/FCSoeFyZJrc4Jx0uzAT9CUGXT2rdWbpK8f/j+RdJXUZn
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="383684062"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="383684062"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2022 04:53:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="652685611"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="652685611"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 19 Dec 2022 04:53:07 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p7Fdi-0008iF-16;
	Mon, 19 Dec 2022 12:53:06 +0000
Date: Mon, 19 Dec 2022 20:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 11af322e07122d71e49f25998ae52b6d83932bba
Message-ID: <63a05e85.YfCoz6Q/9RE/Zhr3%lkp@intel.com>
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
branch HEAD: 11af322e07122d71e49f25998ae52b6d83932bba  Automatic merge of 'master' into merge (2022-12-19 11:22)

elapsed time: 724m

configs tested: 82
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
powerpc                           allnoconfig
um                           x86_64_defconfig
x86_64                              defconfig
i386                 randconfig-a001-20221219
i386                 randconfig-a003-20221219
i386                 randconfig-a002-20221219
arc                                 defconfig
i386                                defconfig
x86_64               randconfig-a002-20221219
x86_64                            allnoconfig
i386                 randconfig-a004-20221219
x86_64               randconfig-a006-20221219
s390                             allmodconfig
i386                 randconfig-a005-20221219
alpha                            allyesconfig
riscv                randconfig-r042-20221218
i386                 randconfig-a006-20221219
x86_64                           rhel-8.3-syz
arc                  randconfig-r043-20221219
sh                               allmodconfig
x86_64                               rhel-8.3
x86_64               randconfig-a003-20221219
arm                  randconfig-r046-20221219
m68k                             allyesconfig
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
alpha                               defconfig
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
s390                                defconfig
m68k                             allmodconfig
x86_64                         rhel-8.3-kunit
arc                  randconfig-r043-20221218
arc                              allyesconfig
x86_64               randconfig-a001-20221219
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
s390                             allyesconfig
x86_64               randconfig-a004-20221219
s390                 randconfig-r044-20221218
mips                             allyesconfig
x86_64               randconfig-a005-20221219
arm                                 defconfig
powerpc                          allmodconfig
arm                        cerfcube_defconfig
powerpc                     ep8248e_defconfig
i386                             allyesconfig
arm                         cm_x300_defconfig
xtensa                          iss_defconfig
arc                          axs103_defconfig
ia64                                defconfig
sh                          rsk7201_defconfig
sh                          rsk7269_defconfig
powerpc                 mpc837x_mds_defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
arm                  randconfig-r046-20221218
x86_64                          rhel-8.3-rust
hexagon              randconfig-r045-20221219
hexagon              randconfig-r041-20221219
powerpc                     ppa8548_defconfig
hexagon              randconfig-r045-20221218
riscv                randconfig-r042-20221219
i386                 randconfig-a014-20221219
x86_64               randconfig-a011-20221219
x86_64               randconfig-a016-20221219
x86_64               randconfig-a012-20221219
x86_64               randconfig-a014-20221219
hexagon              randconfig-r041-20221218
x86_64               randconfig-a015-20221219
i386                 randconfig-a012-20221219
x86_64               randconfig-a013-20221219
i386                 randconfig-a013-20221219
arm                         s5pv210_defconfig
i386                 randconfig-a015-20221219
i386                 randconfig-a016-20221219
i386                 randconfig-a011-20221219
s390                 randconfig-r044-20221219
powerpc                   bluestone_defconfig
arm                         shannon_defconfig
mips                           ip28_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
