Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5243A5BAFCB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 17:00:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTch841ckz3c7N
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 01:00:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cf7GTDdA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cf7GTDdA;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTcgV6139z30M8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Sep 2022 01:00:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663340407; x=1694876407;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fD2Cbig6rKcuHgd4UVWeodUg+GxE80VrsHBcNV2aaXg=;
  b=Cf7GTDdA4bWaJRu81iHHv6HaPy67nhM5N58bKJxDh8tb7Tpoo/IMmPFp
   ENPvX6uTJFw4YhabZyG1EXCJuxtzQ2GW854469MglgmfdWAx48KBHWKnb
   qAjk/5oxYSwEUP49S30nn5ZhD7y9vuhccyMtQURahkKjWtpIAPYhcTWxx
   b3hvDoenLbsL31JJHYXoWtPpjg9Qe9Ku0vQo5UtbQvpJFkxLa8Tp6SagA
   4X+dKhg5Iq0kAyZKcZ1goDuN6BhiXX+9JnOw4qxoRh8HYvyr9KJvD+c3Y
   qh2JVw2tdMAhifwQlXJpuwZcwpRJj0ug6c4B8vLs4Gp/DmeSIFYT8jyjU
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="278736138"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="278736138"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 08:00:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="568858948"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Sep 2022 07:59:59 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZCow-0001rF-2k;
	Fri, 16 Sep 2022 14:59:58 +0000
Date: Fri, 16 Sep 2022 22:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 22c3e7df0ad978658f6b5fbea580bb4ffdb520b0
Message-ID: <63248f52.iUo4l4OKkblNOsnc%lkp@intel.com>
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
branch HEAD: 22c3e7df0ad978658f6b5fbea580bb4ffdb520b0  Automatic merge of 'master' into merge (2022-09-15 09:28)

elapsed time: 726m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
i386                                defconfig
alpha                               defconfig
i386                          randconfig-a001
x86_64                              defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a013
x86_64                        randconfig-a002
x86_64                               rhel-8.3
powerpc                           allnoconfig
i386                          randconfig-a003
x86_64                           allyesconfig
x86_64                        randconfig-a011
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a006
riscv                randconfig-r042-20220915
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
arc                  randconfig-r043-20220915
s390                 randconfig-r044-20220915
i386                             allyesconfig
x86_64                          rhel-8.3-func
s390                                defconfig
sh                               allmodconfig
i386                          randconfig-a005
mips                             allyesconfig
x86_64                        randconfig-a015
x86_64                         rhel-8.3-kunit
powerpc                          allmodconfig
s390                             allmodconfig
m68k                             allmodconfig
i386                          randconfig-a014
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
alpha                            allyesconfig
i386                          randconfig-a012
i386                          randconfig-a016
arc                              allyesconfig
s390                             allyesconfig
m68k                             allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220915
i386                          randconfig-a002
x86_64                        randconfig-a001
hexagon              randconfig-r041-20220915
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a006
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a004
i386                          randconfig-a011
i386                          randconfig-a015
s390                 randconfig-r044-20220916
hexagon              randconfig-r045-20220916
riscv                randconfig-r042-20220916
hexagon              randconfig-r041-20220916

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
