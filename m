Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D695ABD35
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 07:15:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MKNKH0nTlz3bY3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 15:15:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IKbQ8BXm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Two or more type TXT spf records found.) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IKbQ8BXm;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MKNJb6bHXz2xmr
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 15:15:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662182112; x=1693718112;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=X9snSktDGjzCaop2wIqxiU+SiqyMbokGJMQJjsYh4/M=;
  b=IKbQ8BXmshBvjukIAlJi0lXPTVpmVH7GbXSa3EdAY32OXqsUOEAbzy6x
   9dBGwIDv0f9d+RNJRFuifI8iTmjJTYtLkZZ/OV0fLYVbVawwAuMGU+KXL
   1kpTrcmGcbG5VSxiY5itWWBhxm5qiSQKVkl/y58nGEA0eKfg4YFJyqoP9
   vSAIYAdC5vfNYzGh8TZimGX3hzLkZPC4bxoNrfHJzFyw3byCURnxNh21I
   QP59+evAG7FaOoSyyuL9gR4mpd+VAdxnbfyETH5dsGian9a5tTcb5QgbX
   4hmo4y8AnEq2qzlZ/2AxYgHE9hIh7U5vjxD25cGWOZVek49UiTtB2C1zH
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="276530643"
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="276530643"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 22:14:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="681502804"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 02 Sep 2022 22:14:51 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oULUY-00016n-1U;
	Sat, 03 Sep 2022 05:14:50 +0000
Date: Sat, 03 Sep 2022 13:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 0e7991d4acafa88d5771c0227971996c00a55325
Message-ID: <6312e2ba.e84qIWSPfIlSikM3%lkp@intel.com>
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
branch HEAD: 0e7991d4acafa88d5771c0227971996c00a55325  powerpc/mm/64s: Drop p4d_leaf()

elapsed time: 933m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220901
i386                          randconfig-a001
i386                          randconfig-a003
m68k                             allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a013
arc                              allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a005
alpha                            allyesconfig
i386                          randconfig-a014
sh                               allmodconfig
x86_64                        randconfig-a011
m68k                             allyesconfig
i386                          randconfig-a012
mips                             allyesconfig
i386                          randconfig-a016
x86_64                        randconfig-a015
x86_64                              defconfig
i386                                defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                               rhel-8.3
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
i386                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220901
i386                          randconfig-a002
hexagon              randconfig-r041-20220901
i386                          randconfig-a004
riscv                randconfig-r042-20220901
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a015
s390                 randconfig-r044-20220901
i386                          randconfig-a006
i386                          randconfig-a011
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
