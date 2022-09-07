Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 647C25AF8DC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 02:10:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMjML06nnz3bqv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 10:10:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W16AaxYj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Two or more type TXT spf records found.) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W16AaxYj;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMjLg0Pc2z2xJD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 10:09:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662509403; x=1694045403;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=h9zKEDTpIHgZPoufnLRdNUlOfPwoMNldZEhVgitJKSc=;
  b=W16AaxYjJqXIbkon306b1pnPSq/d0p4JlYB5Y3S3SxwigU9+p4qcrxPR
   y4wq6VXn86+PlDYyovc57xEF42nE3ejR6bWs2o+pvHSzqWvUeZaKfwyIK
   vJKQNNKwNSaN4vsEwQc/UOhFm+8leyOmv9TOcNmOy8qbloJs5fd/MnhwB
   enTQ4LtaKogktCrWxOb5uR3TaomN6gzjm63K4Cd20IK+LtI8sK48GxpbB
   UZ4ng0yQLNew42DrAvIUQdkPVY9YFpg1v3lBpVNooqWs5bd3GBNzHbCsP
   NVYzTjKCm0vebNUgrrpcnENUZczKQs+jKBfAHVIA8KsCJYxQMkTvD6rPt
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="276480247"
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; 
   d="scan'208";a="276480247"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 17:09:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; 
   d="scan'208";a="644382454"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 06 Sep 2022 17:09:52 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oVidc-0005oT-0q;
	Wed, 07 Sep 2022 00:09:52 +0000
Date: Wed, 07 Sep 2022 08:09:35 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 33a92cf0fa6e2f07c1d1a0338abc86d85803f630
Message-ID: <6317e13f.cbl8f1i29Rg/oQ6k%lkp@intel.com>
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
branch HEAD: 33a92cf0fa6e2f07c1d1a0338abc86d85803f630  Automatic merge of 'master' into merge (2022-09-05 10:06)

elapsed time: 734m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220906
riscv                randconfig-r042-20220906
powerpc                           allnoconfig
s390                 randconfig-r044-20220906
i386                                defconfig
x86_64                              defconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allmodconfig
x86_64                               rhel-8.3
sh                               allmodconfig
m68k                             allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
mips                             allyesconfig
i386                          randconfig-a001
powerpc                          allmodconfig
i386                          randconfig-a003
x86_64                           allyesconfig
x86_64                        randconfig-a015
i386                          randconfig-a005
i386                          randconfig-a014
x86_64                          rhel-8.3-func
i386                          randconfig-a012
x86_64                         rhel-8.3-kunit
i386                          randconfig-a016
x86_64                        randconfig-a004
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a002
x86_64                    rhel-8.3-kselftests
i386                             allyesconfig
x86_64                           rhel-8.3-syz
arm                                 defconfig
x86_64                        randconfig-a006
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220906
hexagon              randconfig-r045-20220906
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
