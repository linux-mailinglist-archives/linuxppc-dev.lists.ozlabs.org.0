Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD80638C78
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 15:41:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJcxt5vymz3f5s
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 01:41:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A2NQa8YG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A2NQa8YG;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJcwv5LNJz3dwn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 01:40:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669387247; x=1700923247;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FQy8FNd7y2ZtQcVJHpPTH1Yrn2uJbZ8xk0q6aarByFY=;
  b=A2NQa8YGFnZ+gKy3QO49AYwVTvo24qd/gL84Q3MTeblQzN9NqO/unG1j
   xyk4Y0sqw3OAZ+w8gl2jjBaNWQFVKEohvRXDZMkQBIn0jIcqfPYFUkxu9
   XpB9jwt3AQrOlvog7vxDF5P+LkYIBsTDcFLsZTvDnwjev6MilHtbgnz32
   CLdsmzo3aPQW0Fl5Gg19kYFxET0cjxMdeeIq5gYEO9tc4hq4VagYFKnIc
   GU7DbtWmJnAJJscgSU8F3ol9cESKNtpNfdrIFbP30ETZZQ7m3TUOdqUfL
   TIQdCCLqzJpCVk7dAMSWzwSM5YELIupyJ8SSJN26EIpBabyI4OhoTqZlS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="315650947"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="315650947"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2022 06:40:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="673559907"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="673559907"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 25 Nov 2022 06:40:26 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oyZsP-0005Dr-1f;
	Fri, 25 Nov 2022 14:40:25 +0000
Date: Fri, 25 Nov 2022 22:40:14 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 89d21e259a94f7d5582ec675aa445f5a79f347e4
Message-ID: <6380d3ce.ib3AbJ8YZNXz+c7y%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 89d21e259a94f7d5582ec675aa445f5a79f347e4  powerpc/bpf/32: Fix Oops on tail call tests

elapsed time: 1449m

configs tested: 77
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
arc                  randconfig-r043-20221124
ia64                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
arc                              allyesconfig
alpha                            allyesconfig
x86_64                            allnoconfig
m68k                             allyesconfig
i386                             allyesconfig
i386                                defconfig
x86_64                               rhel-8.3
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
sh                   sh7770_generic_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                 mpc837x_mds_defconfig
mips                         rt305x_defconfig
m68k                        stmark2_defconfig
m68k                             allmodconfig
sh                         ap325rxa_defconfig
xtensa                          iss_defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
powerpc                      ep88xc_defconfig
ia64                        generic_defconfig
arm                       multi_v4t_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sh                           se7206_defconfig
sh                        dreamcast_defconfig
arm                        shmobile_defconfig
powerpc                     tqm8548_defconfig
powerpc                    klondike_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig

clang tested configs:
riscv                randconfig-r042-20221124
hexagon              randconfig-r041-20221124
hexagon              randconfig-r045-20221124
s390                 randconfig-r044-20221124
x86_64                        randconfig-k001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
arm                        multi_v5_defconfig
powerpc                     pseries_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
