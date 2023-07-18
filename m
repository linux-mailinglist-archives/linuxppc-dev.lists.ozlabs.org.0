Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05882757252
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 05:31:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HGUx2eqf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4kyh6kJgz30h8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 13:31:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HGUx2eqf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4kxl2SqRz2yVX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 13:31:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689651068; x=1721187068;
  h=date:from:to:cc:subject:message-id;
  bh=ATix8w2R9LytWNP04dskjJ0g091AoBfp1d/K/DZSk+0=;
  b=HGUx2eqfH8DubXqYihVUWd5QvB15tqzDkWhkaVx85jgQRcFW5p6m2pmw
   z/gMKbJ9Cr6XoGPSE86O+diPVxll+xViEm4X7O+q45ZZiLruN8AYuedAm
   3BB4H9eZ80x7KyX7diKN8HwqcOp0gqvLr9oB4aQPdJiQt6Ym8Nearhgmt
   lkCeAsn2WsfNCFxSptQCsMTI88rdIzHi5EXbQK2YnO96Z9w9GhbhRO9P8
   +fBbq/79EKOLPP6EC7D6SWLxx9vIpY367Y4VItdVHWkm3hzfI9TJ7XsAC
   hAvKlRZYAHbVZmOe039mrWYqenS26xMzP5iW2FykyLudwpc2KOgQ8GA+F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="350960301"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="350960301"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 20:30:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="847550414"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="847550414"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Jul 2023 20:30:47 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLbQE-00009u-29;
	Tue, 18 Jul 2023 03:30:46 +0000
Date: Tue, 18 Jul 2023 11:30:26 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 b059dfc41139ee194c9127b89dbea02afa409443
Message-ID: <202307181124.VgDvtGZB-lkp@intel.com>
User-Agent: s-nail v14.9.24
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: b059dfc41139ee194c9127b89dbea02afa409443  powerpc/64: Enable accelerated crypto algorithms in defconfig

elapsed time: 796m

configs tested: 38
configs skipped: 145

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                              allyesconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                        realview_defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
mips                             allmodconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     asp8347_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                       maple_defconfig   gcc  
powerpc                      ppc40x_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc              randconfig-r023-20230717   gcc  
powerpc              randconfig-r026-20230717   gcc  
sh                          lboxre2_defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
x86_64                           allyesconfig   gcc  
x86_64               randconfig-x002-20230717   gcc  
x86_64               randconfig-x003-20230717   gcc  
x86_64               randconfig-x004-20230717   gcc  
x86_64               randconfig-x005-20230717   gcc  
x86_64               randconfig-x006-20230717   gcc  
x86_64               randconfig-x011-20230717   clang
x86_64               randconfig-x012-20230717   clang
x86_64               randconfig-x013-20230717   clang
x86_64               randconfig-x014-20230717   clang
x86_64               randconfig-x015-20230717   clang
x86_64               randconfig-x016-20230717   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
