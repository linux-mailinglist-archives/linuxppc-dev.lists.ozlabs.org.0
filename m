Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC2A5AC84B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 02:41:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLV866SJBz3blf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 10:41:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aTwBjB1z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Two or more type TXT spf records found.) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aTwBjB1z;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLV7V2hGfz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 10:41:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662338470; x=1693874470;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4Xb+iIi0rfjZ4NY4JGvVClt/BbUxvagfNkPnHcs4ZCI=;
  b=aTwBjB1z5iSyHlAnRrVAyWXIrrIa0q25PBMToD6v1wQnc78Qj8Q/PuMi
   wAZGtaN0fBQeNrd5CUulUlfuvUMwsmg5snMSA9qyjrUl32c2Ebe2FX+4a
   wmipDDOAUwtM0vmDKkcy1kmqhm7YPoOOcXCGd0fAA8hXTnMtU/OW2IAoY
   XcV1gj+gNch00Xd9NmaKuS8qH+lfVvMYqglm/4ktrKH6gMw3ses03FA3h
   aZ/Q1oH1F219HElzgoI4+wfoQiYP94sltN28lIVTaWs+8VGbh+wa1ukCc
   p4/p6yoPTRAg2eWDW7rqmGe8IRdIewW/S3ttHOZmR2AIA2Dogrd3PlxmN
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="296284652"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="296284652"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2022 17:40:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="681870968"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 04 Sep 2022 17:40:58 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oV0Ac-0003aQ-0D;
	Mon, 05 Sep 2022 00:40:58 +0000
Date: Mon, 05 Sep 2022 08:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 34e409068721173d8a0fc8b844b5edc79559980d
Message-ID: <63154567.3rskipSpBKyi3IGr%lkp@intel.com>
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
branch HEAD: 34e409068721173d8a0fc8b844b5edc79559980d  Automatic merge of 'next' into merge (2022-09-04 21:16)

elapsed time: 720m

configs tested: 62
configs skipped: 22

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
mips                           jazz_defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
sh                           se7750_defconfig
sh                               j2_defconfig
sh                           se7712_defconfig
m68k                          multi_defconfig
arm                          pxa910_defconfig
sh                         ecovec24_defconfig
i386                          randconfig-a014
x86_64                        randconfig-a006
powerpc                       holly_defconfig
ia64                                defconfig
x86_64                           rhel-8.3-syz
csky                              allnoconfig
x86_64                           rhel-8.3-kvm
i386                          randconfig-a012
arc                  randconfig-r043-20220904
i386                          randconfig-a016
loongarch                        alldefconfig
mips                       bmips_be_defconfig
arm                         assabet_defconfig
riscv                randconfig-r042-20220904
s390                 randconfig-r044-20220904
i386                          randconfig-c001
arc                              allyesconfig
i386                             alldefconfig
ia64                          tiger_defconfig
sh                         apsh4a3a_defconfig
powerpc                         ps3_defconfig
arm                         nhk8815_defconfig
ia64                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
arm                            mmp2_defconfig
arm                          collie_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a011
i386                          randconfig-a013
hexagon              randconfig-r045-20220904
i386                          randconfig-a015
arm                      pxa255-idp_defconfig
powerpc                          g5_defconfig
hexagon              randconfig-r041-20220904
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
