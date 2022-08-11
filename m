Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C68E858F5FB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 04:51:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3BBw26zfz305Z
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 12:51:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AFXYS/y+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AFXYS/y+;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3BBF1G47z2xXS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 12:50:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660186229; x=1691722229;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YtLhif0txWUNvcsyYYuc6+945h2vbWOMlgiF/QyPRd8=;
  b=AFXYS/y+4ezc2OGOgMyYx83G5IIiIVwigA072sjmHMNStwy6mqI8lnAF
   DpEIO7H718FF4wKDdCOnAJX8LfQ/Yjkik+9wIaxmTC79bTnO+wgPnQLld
   S5Y5Kw9pkWMd8iPFrtxN9PG8/toWdeirMGEc40d+QWAsgEKbS7sM+QgqM
   XQpoQSWH6i/Q1K5VYQv4tUnLRcSiIvB9RZUya8vcgsMmp5wqTWy9orF0e
   4aHc7BBam4HtW14v23OBELLtD3dkQ2cyv2qHZeuiDNgyHXkNwoSvxqbxb
   BjHQ3Hh8fKf1U5oYLCREjn6200f7nMB35pJCLS25u6Ickhvvio+GcWgGu
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="292033958"
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="292033958"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2022 19:50:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="555966148"
Received: from lkp-server02.sh.intel.com (HELO 5d6b42aa80b8) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Aug 2022 19:50:17 -0700
Received: from kbuild by 5d6b42aa80b8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLyH2-00010Q-1K;
	Thu, 11 Aug 2022 02:50:16 +0000
Date: Thu, 11 Aug 2022 10:49:45 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 83ee9f23763a432a4077bf20624ee35de87bce99
Message-ID: <62f46e49.RCOGkofS/BOeTncZ%lkp@intel.com>
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
branch HEAD: 83ee9f23763a432a4077bf20624ee35de87bce99  powerpc/kexec: Fix build failure from uninitialised variable

elapsed time: 1196m

configs tested: 47
configs skipped: 116

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
csky                              allnoconfig
riscv                             allnoconfig
i386                             allyesconfig
i386                                defconfig
mips                             allyesconfig
sh                               allmodconfig
arc                        vdk_hs38_defconfig
sh                          landisk_defconfig
sh                          kfr2r09_defconfig
csky                             alldefconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
mips                           jazz_defconfig
arm                        mvebu_v7_defconfig
sh                     magicpanelr2_defconfig
arm                        oxnas_v6_defconfig
arm                           sunxi_defconfig
powerpc                         ps3_defconfig
m68k                             alldefconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220810
hexagon              randconfig-r041-20220810
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
