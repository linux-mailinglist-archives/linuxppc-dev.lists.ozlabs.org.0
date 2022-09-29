Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5265EED37
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 07:27:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdMM41P38z3cB7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 15:27:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G53LzP0z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G53LzP0z;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdMLQ6XYRz2xHN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 15:27:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664429231; x=1695965231;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aMaF+dT0nOb454XLZkS5Ti3iFV/PyJKBC3vW46MUT44=;
  b=G53LzP0zYdxB0CT/KC9dCekw9rQQoC8cGdHfpbue7UtfquH/qATD0yHh
   Mdv2xuRu4NGyYLR5Sjd33eGLnaLsygzeIaWmSxFFvun8F6fT4Ek5izDBc
   2RMbDx+ilrnRQlYIZVEeWpmYcqgJXyzeUomtotzOcFoxJXR4ighrT4N0d
   V68QIiIz7nIl4Fvggdm/t6dZoTYwNsdS97fMBHiWumSqi9JRWtsSLzxGh
   XBbFoPAyMpbVLZUVPkfgAx8duyhfvb1F3kkZ1AyAP5E5ybWMgUIfS+XOk
   EwAvkZ+VD5tvBZSLXe0mOcqTznWEBVw5oPmix3jafWJ3ViyBzpCNyvgvu
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="302709539"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; 
   d="scan'208";a="302709539"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2022 22:27:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="599854946"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; 
   d="scan'208";a="599854946"
Received: from lkp-server01.sh.intel.com (HELO 6126f2790925) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Sep 2022 22:27:04 -0700
Received: from kbuild by 6126f2790925 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1odm4d-0000e2-21;
	Thu, 29 Sep 2022 05:27:03 +0000
Date: Thu, 29 Sep 2022 13:26:35 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 6bd7ff497b4af13ea3d53781ffca7dc744dbb4da
Message-ID: <63352c8b.IfLY0cFryp8hsCtl%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 6bd7ff497b4af13ea3d53781ffca7dc744dbb4da  powerpc/udbg: Remove extern function prototypes

elapsed time: 853m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
powerpc                           allnoconfig
mips                             allyesconfig
s390                             allmodconfig
s390                                defconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                              defconfig
i386                                defconfig
s390                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                               rhel-8.3
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20220927
x86_64                        randconfig-a015
arm                                 defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
riscv                randconfig-r042-20220927
s390                 randconfig-r044-20220927
i386                             allyesconfig
m68k                             allmodconfig
i386                          randconfig-a001
arc                              allyesconfig
i386                          randconfig-a003
alpha                            allyesconfig
m68k                             allyesconfig
i386                          randconfig-a005
arm64                            allyesconfig
arm                              allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
ia64                             allmodconfig

clang tested configs:
i386                 randconfig-a011-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a012-20220926
x86_64                        randconfig-a012
i386                 randconfig-a016-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a014-20220926
hexagon              randconfig-r045-20220927
x86_64                        randconfig-a014
hexagon              randconfig-r041-20220927
x86_64                        randconfig-a016
i386                          randconfig-a004
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
