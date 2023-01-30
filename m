Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03513681E74
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 23:54:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5Nm35jn3z3bZ4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 09:54:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D388m7wK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D388m7wK;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5Nl674fPz2xjR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 09:53:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675119219; x=1706655219;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SucGDUkQXuFigoKccPR2aRL0mzpQNrBsccQRJszbDVs=;
  b=D388m7wKJGa4Ccq/t9XzAlkBKEph7JlePugOk8DncAd8yCaypH4uSjCl
   EEHm6js6gOTlgNbIAPXzko7d7VzpNeBoC3vJXHQiYrsvWeR/h+uerK6Gq
   X4fTnuWafWVnP/4qdBxlalZTDJn6lMWyCAFPA2XQhkwGYZCfclQ1tTgy2
   5Pm8YNuGcKYARwP0Dm7uCtDUy6VEC9r4seK6wR73zDrpOFA8LsWpxhRws
   b7alxTdRkB8hgmgh+KDmSa4rI+9Kn8QdqLfblU7YWZYkDtSHMMkhHA1WA
   FpzRMSEUEMrJZIC3NatjN8w4eOK9sR7RVlneb+hk3BNoO9BizRhOLNsK8
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="355015526"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="355015526"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 14:53:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="993052828"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="993052828"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jan 2023 14:53:27 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMd1d-0003wu-3A;
	Mon, 30 Jan 2023 22:53:21 +0000
Date: Tue, 31 Jan 2023 06:53:07 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 ca272751ba18ca8f137af631cbc9f3f987fab6e3
Message-ID: <63d84a53.LwXRWnOhcgrX36eW%lkp@intel.com>
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
branch HEAD: ca272751ba18ca8f137af631cbc9f3f987fab6e3  Automatic merge of 'master' into merge (2023-01-30 12:27)

elapsed time: 720m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64               randconfig-a001-20230130
x86_64               randconfig-a003-20230130
x86_64               randconfig-a004-20230130
x86_64               randconfig-a002-20230130
x86_64                            allnoconfig
x86_64                              defconfig
x86_64               randconfig-a006-20230130
arc                  randconfig-r043-20230129
x86_64               randconfig-a005-20230130
x86_64                               rhel-8.3
arm                  randconfig-r046-20230129
i386                 randconfig-a002-20230130
i386                 randconfig-a001-20230130
i386                 randconfig-a004-20230130
i386                 randconfig-a003-20230130
i386                                defconfig
arm                  randconfig-r046-20230130
arc                  randconfig-r043-20230130
arm                                 defconfig
arc                                 defconfig
m68k                             allyesconfig
x86_64                           allyesconfig
i386                 randconfig-a005-20230130
m68k                             allmodconfig
i386                 randconfig-a006-20230130
s390                             allmodconfig
arc                              allyesconfig
alpha                               defconfig
alpha                            allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
s390                                defconfig
sh                               allmodconfig
arm64                            allyesconfig
ia64                             allmodconfig
s390                             allyesconfig
x86_64                           rhel-8.3-syz
arm                              allyesconfig
x86_64                           rhel-8.3-kvm
i386                             allyesconfig
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
mips                             allyesconfig
powerpc                          allmodconfig

clang tested configs:
hexagon              randconfig-r041-20230129
x86_64               randconfig-a014-20230130
hexagon              randconfig-r045-20230130
hexagon              randconfig-r041-20230130
x86_64               randconfig-a012-20230130
hexagon              randconfig-r045-20230129
x86_64               randconfig-a013-20230130
s390                 randconfig-r044-20230129
x86_64               randconfig-a011-20230130
s390                 randconfig-r044-20230130
riscv                randconfig-r042-20230129
x86_64                          rhel-8.3-rust
riscv                randconfig-r042-20230130
x86_64               randconfig-a016-20230130
x86_64               randconfig-a015-20230130
i386                 randconfig-a013-20230130
i386                 randconfig-a012-20230130
i386                 randconfig-a014-20230130
i386                 randconfig-a011-20230130
i386                 randconfig-a015-20230130
i386                 randconfig-a016-20230130

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
