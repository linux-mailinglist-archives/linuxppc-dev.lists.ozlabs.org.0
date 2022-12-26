Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C944656534
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Dec 2022 22:55:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ngs5d2fmjz3c6R
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Dec 2022 08:55:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HIJYh6pS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HIJYh6pS;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ngs4h5RGSz2xtv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Dec 2022 08:54:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672091652; x=1703627652;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LcDeqoeQVQnFDY3jF+hFvVOJPiviZWPNvp0zbrDM73E=;
  b=HIJYh6pS/m5mCKRKhH9FNsMwaZWDmeauRJaHseVg9YfCYbcVCm/DUv5V
   mWH8afYh7EhwMkcfnxCZAxMmIHDRP58T99Bg1E/wh6SY1df4Zmt2TIE4N
   wbQMF+3AehtfBl7pOSzMXNH7i4Meiz8MAY4f5oLL6nWZAXkywc6rSEmM5
   CxAulkQ+STO7A3eJfiOfLVo3ja0KIXUOEAbHdS5Ef2A7PkfDqZ4i6hnXa
   5P+dgJ3Tz/FKSDa4ohxbGMPfRbXQJfvB6bgSm3lxJnmj2IGMiRTDGvWEK
   s+JOSfQkWiPdLmIxiVw9Xm1D2fyCJqELIsiL+tryb4FZ0i/SOnedT56Zq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="406875677"
X-IronPort-AV: E=Sophos;i="5.96,276,1665471600"; 
   d="scan'208";a="406875677"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2022 13:54:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="654840880"
X-IronPort-AV: E=Sophos;i="5.96,276,1665471600"; 
   d="scan'208";a="654840880"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 26 Dec 2022 13:54:01 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p9vQ0-000Eg1-1k;
	Mon, 26 Dec 2022 21:54:00 +0000
Date: Tue, 27 Dec 2022 05:53:55 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 10d7f30201f3ebe724c30ab2cc0d9d1b9684146c
Message-ID: <63aa17f3.s3yRH6x+TsQfxvkf%lkp@intel.com>
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
branch HEAD: 10d7f30201f3ebe724c30ab2cc0d9d1b9684146c  Automatic merge of 'master' into merge (2022-12-26 20:31)

elapsed time: 722m

configs tested: 85
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
powerpc                           allnoconfig
i386                 randconfig-a012-20221226
s390                             allmodconfig
i386                 randconfig-a011-20221226
i386                 randconfig-a013-20221226
s390                                defconfig
i386                 randconfig-a014-20221226
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
i386                 randconfig-a016-20221226
i386                                defconfig
x86_64                         rhel-8.3-kunit
i386                 randconfig-a015-20221226
x86_64                           rhel-8.3-kvm
s390                             allyesconfig
arm                  randconfig-r046-20221225
arc                  randconfig-r043-20221225
arc                  randconfig-r043-20221226
sh                               allmodconfig
riscv                randconfig-r042-20221226
s390                 randconfig-r044-20221226
mips                             allyesconfig
ia64                             allmodconfig
powerpc                          allmodconfig
i386                             allyesconfig
x86_64                          rhel-8.3-func
x86_64               randconfig-a014-20221226
x86_64               randconfig-a013-20221226
x86_64               randconfig-a011-20221226
x86_64                              defconfig
x86_64               randconfig-a012-20221226
x86_64                    rhel-8.3-kselftests
arm                                 defconfig
x86_64               randconfig-a015-20221226
x86_64               randconfig-a016-20221226
arm                              allyesconfig
arm64                            allyesconfig
x86_64                               rhel-8.3
powerpc                     rainier_defconfig
sh                ecovec24-romimage_defconfig
arm                        multi_v7_defconfig
x86_64                           allyesconfig
x86_64                            allnoconfig
m68k                             allyesconfig
parisc                           alldefconfig
arm                          badge4_defconfig
m68k                             allmodconfig
powerpc                     mpc83xx_defconfig
alpha                            allyesconfig
sh                          rsk7201_defconfig
arc                              allyesconfig
mips                     decstation_defconfig
arm                            zeus_defconfig
powerpc                       eiger_defconfig
s390                       zfcpdump_defconfig
sh                           se7751_defconfig

clang tested configs:
i386                 randconfig-a001-20221226
i386                 randconfig-a003-20221226
i386                 randconfig-a002-20221226
hexagon              randconfig-r045-20221225
i386                 randconfig-a006-20221226
hexagon              randconfig-r041-20221225
i386                 randconfig-a005-20221226
i386                 randconfig-a004-20221226
hexagon              randconfig-r041-20221226
arm                  randconfig-r046-20221226
s390                 randconfig-r044-20221225
hexagon              randconfig-r045-20221226
riscv                randconfig-r042-20221225
x86_64                          rhel-8.3-rust
x86_64               randconfig-a002-20221226
x86_64               randconfig-a003-20221226
x86_64               randconfig-a001-20221226
x86_64               randconfig-a004-20221226
x86_64               randconfig-a005-20221226
x86_64               randconfig-a006-20221226
arm                         orion5x_defconfig
powerpc                      ppc44x_defconfig
mips                     loongson2k_defconfig
powerpc                     mpc5200_defconfig
arm                        vexpress_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
