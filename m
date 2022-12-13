Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 488B564ABF3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 01:04:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWJdj0lxGz2xBF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 11:04:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ESPDmFFe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ESPDmFFe;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWJcj5zH9z300l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 11:03:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670889830; x=1702425830;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bzyWzbbzY0+/8ISEOvcGeLkLRwaKhhHoSk9swWOYmBY=;
  b=ESPDmFFe0yxy7n5ROgWJaR2exI+De+sPdWVSjuwQACyvWLRXPXgbe5PW
   /fWFLIiRWWLOcqde7Zkqxzvdpgwv/Zj2rhw+F72smK19X4WkXy02CrrOO
   Ewx7PUClCnaG/inq8ovOA8K3jwI6BJtsFh/A56wp4pK+4LyEU66n2eJFy
   tEm4/OCfk73SBszpzsb/u1YFhV5Kg7Gxa5iFULgZQWyCpy5LNp53spuzY
   zuhBBHPX6c4ixiFZFOIQUfB9urmspgLK9rDtH+rV1b8NGFspEtEZdP8GZ
   oFqlSpCa9uASvVP79YRdeciR3lipRnMrqgEKoUjchK6tZL9gx8DZOYJMN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="318026291"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; 
   d="scan'208";a="318026291"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2022 16:03:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="822674838"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; 
   d="scan'208";a="822674838"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Dec 2022 16:03:39 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p4slm-0003yj-2Q;
	Tue, 13 Dec 2022 00:03:38 +0000
Date: Tue, 13 Dec 2022 08:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 825eada7717cd75424d2b5f00cf754ed97d62d87
Message-ID: <6397c13a.RnlWSakOCtXnWlRs%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 825eada7717cd75424d2b5f00cf754ed97d62d87  powerpc/64: Set default CPU in Kconfig

elapsed time: 721m

configs tested: 67
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                          rhel-8.3-func
s390                                defconfig
x86_64                          rhel-8.3-rust
x86_64                    rhel-8.3-kselftests
s390                             allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
sh                               allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
ia64                             allmodconfig
x86_64                           rhel-8.3-bpf
i386                 randconfig-a013-20221212
i386                 randconfig-a014-20221212
i386                 randconfig-a012-20221212
i386                 randconfig-a011-20221212
i386                 randconfig-a015-20221212
i386                 randconfig-a016-20221212
x86_64                               rhel-8.3
i386                                defconfig
x86_64                              defconfig
arm                                 defconfig
x86_64               randconfig-a013-20221212
x86_64               randconfig-a015-20221212
x86_64               randconfig-a012-20221212
x86_64               randconfig-a016-20221212
x86_64               randconfig-a014-20221212
x86_64               randconfig-a011-20221212
x86_64                           allyesconfig
riscv                randconfig-r042-20221212
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig
arc                  randconfig-r043-20221211
arc                  randconfig-r043-20221212
arm                  randconfig-r046-20221211
s390                 randconfig-r044-20221212

clang tested configs:
i386                 randconfig-a002-20221212
x86_64               randconfig-a002-20221212
x86_64               randconfig-a001-20221212
i386                 randconfig-a003-20221212
i386                 randconfig-a001-20221212
x86_64               randconfig-a004-20221212
x86_64               randconfig-a003-20221212
x86_64               randconfig-a006-20221212
i386                 randconfig-a004-20221212
x86_64               randconfig-a005-20221212
i386                 randconfig-a006-20221212
i386                 randconfig-a005-20221212
arm                  randconfig-r046-20221212
riscv                randconfig-r042-20221211
hexagon              randconfig-r045-20221211
hexagon              randconfig-r041-20221211
hexagon              randconfig-r045-20221212
s390                 randconfig-r044-20221211
hexagon              randconfig-r041-20221212

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
