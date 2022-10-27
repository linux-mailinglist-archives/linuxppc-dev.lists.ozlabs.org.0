Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D100060EE16
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 04:53:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MyVc84rz3z3c8C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 13:53:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mVbIO1VQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mVbIO1VQ;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MyVbD64dJz3bm6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 13:52:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666839161; x=1698375161;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1JIDE3rveBxf9oqvlNLx3kjnmVhkmYAWkY3ZRbdGFss=;
  b=mVbIO1VQV5tBea16LI7tV6XzE5tDa+3dP2PIDSaOibs3VyP2xer3nX9K
   jc+XL3HXW+EzCSb+sTRDftMe8FtGrFK80ChHqeTSVnbo+qL9pOjQo+c6j
   g7hc0dkRJZxBLOegyui5NIo+h8H3R4au4yC5Osu2iwVDLcusnbqoxQnGF
   9toNbknR6MpB/P+fcgKy+7BJuhBmy3s99Tk2l20GsBLMf92SC60zJgM4M
   kj1r+fhIR6rc0itnicSl3ys1YoCJsYHKTUktGU8k8WHUgT4vaEkOjfLkm
   MXihg44YURUQt32Q4IEKaAgstWTofevyGpnhTbOpEqhB6dWl0Zvct2W7M
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="309810221"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="309810221"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 19:52:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="961461896"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="961461896"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Oct 2022 19:52:30 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ont0P-0008A5-1l;
	Thu, 27 Oct 2022 02:52:29 +0000
Date: Thu, 27 Oct 2022 10:52:05 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes] BUILD SUCCESS
 e59b3399fde5e173b026d4952b215043e77b4521
Message-ID: <6359f255.5lxgwDR4R6GhoSHi%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes
branch HEAD: e59b3399fde5e173b026d4952b215043e77b4521  KVM: PPC: BookS PR-KVM and BookE do not support context tracking

elapsed time: 724m

configs tested: 73
configs skipped: 108

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arm                        keystone_defconfig
powerpc                     stx_gp3_defconfig
arm                         axm55xx_defconfig
powerpc                     redwood_defconfig
sh                      rts7751r2d1_defconfig
mips                        vocore2_defconfig
mips                             allyesconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
arm                           h5000_defconfig
m68k                          hp300_defconfig
alpha                            alldefconfig
ia64                             allmodconfig
arc                  randconfig-r043-20221026
s390                 randconfig-r044-20221026
riscv                randconfig-r042-20221026
m68k                            q40_defconfig
arm                           imxrt_defconfig
arm                         assabet_defconfig
arm                          gemini_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
mips                            ar7_defconfig
arc                            hsdk_defconfig
arm                             ezx_defconfig
sh                            migor_defconfig
nios2                         3c120_defconfig
sparc                               defconfig
arc                              alldefconfig
arm                            pleb_defconfig
mips                      maltasmvp_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
arm                          pxa168_defconfig
powerpc                 mpc8560_ads_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
powerpc                      pmac32_defconfig
mips                      bmips_stb_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
