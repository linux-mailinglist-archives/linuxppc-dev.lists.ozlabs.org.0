Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBE95FD374
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 05:09:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnvdP68Bhz3dsk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 14:09:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PaMHnLoZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PaMHnLoZ;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnvbQ2Bm5z302k
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 14:07:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665630482; x=1697166482;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=12J12KRvx3Qjlz+8opvx3G+tlCbNGbW8w5vkDxlkI0w=;
  b=PaMHnLoZWIcObjHS0l3crmh3RU6eZsY+1BWxy3QWYeo3Z7Qqm76xZafg
   /bpTKVcmjcmVJUkGmMpev2oaS3Qm2AUkbSd/RYhwQkYh6z2V8JOvYr38C
   9FEamdRzqoIlJLJQUdiNjAFYAnB5Hk8EF5flOfXx4BR+BqBtbxd6r/Fdc
   N5gSXMyT3TPJhCjEaa2tIR91R/P6WbQzpCuNg7ieMNZKhdEu9mJUz++YY
   2jpsplOcAxPFE4NTW6V3uZh+kha3vtH770WzkFmWtoeamOQuWXsGtFS9v
   v+uc2SYrMU5I+MVWzyyZlRFYWEYDvDNUrN4aZuj04mT2yh2ycJtRoI7oH
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="366965846"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="366965846"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2022 20:07:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="660163117"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="660163117"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Oct 2022 20:07:44 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oioZU-0004Xt-0D;
	Thu, 13 Oct 2022 03:07:44 +0000
Date: Thu, 13 Oct 2022 11:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 0c4c772cd7717acd0e466154ca733eea38895af0
Message-ID: <634780e7.Ei9HCtXPlO8AIkZz%lkp@intel.com>
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
branch HEAD: 0c4c772cd7717acd0e466154ca733eea38895af0  Automatic merge of 'fixes' into merge (2022-10-13 00:56)

elapsed time: 727m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
riscv                randconfig-r042-20221012
arc                  randconfig-r043-20221012
x86_64                              defconfig
arc                                 defconfig
s390                 randconfig-r044-20221012
alpha                               defconfig
powerpc                           allnoconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a013
mips                             allyesconfig
x86_64                        randconfig-a011
powerpc                          allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
s390                             allmodconfig
x86_64                        randconfig-a015
s390                                defconfig
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
arc                              allyesconfig
sh                               allmodconfig
x86_64                    rhel-8.3-kselftests
alpha                            allyesconfig
arm                                 defconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a005
x86_64                        randconfig-a006
i386                                defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
s390                             allyesconfig
i386                             allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20221012
hexagon              randconfig-r041-20221012
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
