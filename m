Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1848610751
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 03:36:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mz4sN6Mb8z3cHG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 12:36:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PsMbOGhL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PsMbOGhL;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mz4rP5LH6z3bjr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 12:36:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666920965; x=1698456965;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wa4X0CcpxywLPNOBTaDbb32Oi0niCJTm8EbnPBgUfOQ=;
  b=PsMbOGhLZCSaogiE6unqpmfqrSsM1qlVS/DqnA3UqV5b2B77plea2Ihz
   hFnslmlMm31uK2RlpskeYTpJW9uhqpik9aB/Jlb/i58PokqVmXQiUUXTv
   MJRXI4pRDIxW8lIP/dqD1G1wE5sG4Laz8geBzWwF0Z7oGgrQ5ntKGb/YA
   pw73ZlyE3VDfqqAwgwFiPoFq3l2yj//Ap/MJM8jeblhG1hNOOhq3e3Rnw
   vDIf50Zte7AmNm2EmZrVlXtqvj0+PAskDUB4ovdwS6qNCUMfHw6oIY0iC
   T9zcP3rlYxQfS8U6WrHnplSF3BoOPuigN2idb5hXTzN8q8OZzPX5Cw65S
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="335021263"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; 
   d="scan'208";a="335021263"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2022 18:35:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="610575661"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; 
   d="scan'208";a="610575661"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Oct 2022 18:35:56 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ooEHr-0009LB-2d;
	Fri, 28 Oct 2022 01:35:55 +0000
Date: Fri, 28 Oct 2022 09:35:20 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 eb05539de71d4784705d3e502d951ac17fea05e3
Message-ID: <635b31d8.P+r2qi+Yd+vrf4Rz%lkp@intel.com>
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
branch HEAD: eb05539de71d4784705d3e502d951ac17fea05e3  Automatic merge of 'fixes' into merge (2022-10-27 22:29)

elapsed time: 724m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                             allyesconfig
s390                                defconfig
arm                                 defconfig
x86_64                           rhel-8.3-syz
um                             i386_defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
um                           x86_64_defconfig
x86_64                              defconfig
m68k                             allmodconfig
alpha                            allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
m68k                             allyesconfig
i386                                defconfig
arm                              allyesconfig
arc                  randconfig-r043-20221027
sh                               allmodconfig
arm64                            allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                           allyesconfig
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
i386                             allyesconfig
i386                          randconfig-a005
ia64                             allmodconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a006

clang tested configs:
hexagon              randconfig-r041-20221027
riscv                randconfig-r042-20221027
i386                          randconfig-a002
hexagon              randconfig-r045-20221027
i386                          randconfig-a004
s390                 randconfig-r044-20221027
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
