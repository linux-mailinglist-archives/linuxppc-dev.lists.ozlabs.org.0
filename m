Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B84B56601F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 02:48:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LcPDv096xz3c5s
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 10:48:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hYKA2DlK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hYKA2DlK;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LcPCZ3C5Pz2yJL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 10:47:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656982058; x=1688518058;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iNjvDSkXOZLzlqPjiGD3Luw9nckzkPoeKRVtUqP6/XE=;
  b=hYKA2DlKPvxtw2Mor6fFtsg4l+HLkaipaMGXg6wKxlzzTHSwSwklDe1I
   lCxUbz6nmv6nkxn9jyqq9DNhdwO7ToSaeGXF+WrocXBc6JfMlopswLQzE
   6QSiekM8HAT3tNw3uT/8HJpyM++R7BhuDxFA4L025lznngdVeMofKLogM
   OALLAz98CNCkr/59QVKC17+yYmLlW1/mhtk1mQgFa5W0oWxS4trQha6l5
   LHC1WOKCZzUlaW68advUH+gvHSazwCAGWvmxnlYOoc0eAsjHm5Hy/q6NH
   w6Mu8wGiqwOKN0tncccAsWfYTuO+C1MAwh3MddklWz4ztNgztkzAg7Rmh
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="369542501"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
   d="scan'208";a="369542501"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2022 17:47:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
   d="scan'208";a="919504785"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Jul 2022 17:47:32 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o8Wix-000IW1-Un;
	Tue, 05 Jul 2022 00:47:31 +0000
Date: Tue, 05 Jul 2022 08:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 887502826549caa7e4215fd9e628f48f14c0825a
Message-ID: <62c389ea.BwvftpPev3nv5TzY%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 887502826549caa7e4215fd9e628f48f14c0825a  powerpc/powernv: delay rng platform device creation until later in boot

elapsed time: 753m

configs tested: 83
configs skipped: 101

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
sparc                               defconfig
arm                          pxa3xx_defconfig
arc                              alldefconfig
arm                            xcep_defconfig
mips                       bmips_be_defconfig
m68k                         apollo_defconfig
s390                                defconfig
powerpc                      ep88xc_defconfig
sh                      rts7751r2d1_defconfig
sh                        dreamcast_defconfig
powerpc                 mpc834x_mds_defconfig
sh                   secureedge5410_defconfig
arm                      integrator_defconfig
sh                   rts7751r2dplus_defconfig
arm                         cm_x300_defconfig
m68k                        stmark2_defconfig
xtensa                         virt_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                       bvme6000_defconfig
sh                           se7722_defconfig
powerpc                     asp8347_defconfig
arm                            mps2_defconfig
powerpc                       ppc64_defconfig
powerpc                 linkstation_defconfig
powerpc                     tqm8548_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220703
arc                  randconfig-r043-20220703
s390                 randconfig-r044-20220703
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
i386                             allyesconfig
arm                       cns3420vb_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                              alldefconfig
mips                          ath25_defconfig
arm                         orion5x_defconfig
mips                         tb0287_defconfig
mips                     loongson2k_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220703
hexagon              randconfig-r041-20220703

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
