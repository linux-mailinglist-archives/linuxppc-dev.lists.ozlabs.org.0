Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A196665EB5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 16:05:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsWF90yd7z3ch2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 02:05:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O3lzztQC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O3lzztQC;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsWDD28qJz3bXL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 02:04:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673449452; x=1704985452;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EzS1rB5u3ceqYsklUrERUyt8ti7VxoUVVF6gIp+8zZU=;
  b=O3lzztQCvSfVCNDnaivSp77Z19NW1gmudkJmqyQGwYiNZjSfPTUjHuZV
   SYa9KG72PU8ChRXYyKjtCS9tnc4fNt2IxkCgMulS0bOkTnUPjg3Wabrqr
   XeZSaNi7Z3rce12Q0DK2ejRMQY6tGFRHEvzNZDBxuzkPoHXb1oKi8rHD7
   +AKEDH9Gqgw5AoL4flDeN1CSPJQwh9MVTEjkHpw/vmRYvYe2e8R4HBHX3
   CCmyKQgSYxo1ULY2toUXj0iSFFCHdhFLhkEXY2VEXFybxs8SAHYUZNDzp
   fdh/pnW24snP3HAyeIDpY+C4Tlh5o+MbKO1hDqwomOphxP53rfLo+DjQl
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="387898206"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="387898206"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 07:03:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="720752962"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="720752962"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 11 Jan 2023 07:03:39 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pFcde-0009G0-16;
	Wed, 11 Jan 2023 15:03:38 +0000
Date: Wed, 11 Jan 2023 23:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 55f63ce760d3914cff221c193f1032537af141f5
Message-ID: <63becfc1.NNwewcbyHSRu8FLU%lkp@intel.com>
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
branch HEAD: 55f63ce760d3914cff221c193f1032537af141f5  Automatic merge of 'master' into merge (2023-01-09 11:31)

elapsed time: 1518m

configs tested: 60
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
powerpc                           allnoconfig
x86_64                              defconfig
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
m68k                             allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
arc                              allyesconfig
x86_64                               rhel-8.3
alpha                            allyesconfig
m68k                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                           allyesconfig
i386                                defconfig
arc                  randconfig-r043-20230110
s390                 randconfig-r044-20230110
x86_64                        randconfig-a013
riscv                randconfig-r042-20230110
x86_64                        randconfig-a011
arm                                 defconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a015
x86_64                        randconfig-a006
x86_64                        randconfig-a004
arm64                            allyesconfig
arm                              allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
sh                               allmodconfig
mips                             allyesconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
powerpc                          allmodconfig
s390                             allyesconfig
i386                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
ia64                             allmodconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
hexagon              randconfig-r041-20230110
arm                  randconfig-r046-20230110
x86_64                        randconfig-a014
hexagon              randconfig-r045-20230110
x86_64                        randconfig-a012
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a016
x86_64                        randconfig-a003
i386                          randconfig-a015
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
