Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 513875F1C02
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Oct 2022 13:37:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MflSd2swFz3cFd
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Oct 2022 21:37:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FOMwUVZG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FOMwUVZG;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MflRy2kMNz2yxd
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Oct 2022 21:36:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664624206; x=1696160206;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+D2By2mNP0TyWBQjWuTmcAVJtSpQvHaNWhiTKJUsnmM=;
  b=FOMwUVZGDVlB6xsNdIXjc1mmcODU4WMJI5QSAL/q3V3GTZStX/jL+Ej7
   UqVv/zQZCAMPkJMleNmrdSnljajysBnO1VKa68X7JOBj0jx3cNZBCpde5
   LtDg8xzS8gouhQIXBF+hoIwDd3T69YqEfA5OiEmMG/nPAA/pE5ni3+m73
   vmT7CqG1MCuT1DCsX7Vej7nQwSBGA5ccZ/zwCltSF/POwIPcH/xh9GvrW
   ugQVye1pDMwY6jbWcRxN61GMJfZ9BDhuy5n5A5loMDGJTBC0EOqKcCSq/
   tXwBCKHtix887rE22eAhKmFIvhNJjTBB7jk9OtWM6DC4PXqcL76opYCrG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="282085569"
X-IronPort-AV: E=Sophos;i="5.93,360,1654585200"; 
   d="scan'208";a="282085569"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2022 04:36:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="653842470"
X-IronPort-AV: E=Sophos;i="5.93,360,1654585200"; 
   d="scan'208";a="653842470"
Received: from lkp-server01.sh.intel.com (HELO 14cc182da2d0) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Oct 2022 04:36:28 -0700
Received: from kbuild by 14cc182da2d0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oeanD-0002BT-1l;
	Sat, 01 Oct 2022 11:36:27 +0000
Date: Sat, 01 Oct 2022 19:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 8535a1afff0f4f568eb589f3795a930ef3d483b0
Message-ID: <63382630.Xo1ue4I71n3D9LlC%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 8535a1afff0f4f568eb589f3795a930ef3d483b0  powerpc/pseries: Add firmware details to the hardware description

elapsed time: 1557m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
sh                               allmodconfig
s390                             allyesconfig
powerpc                           allnoconfig
x86_64                              defconfig
x86_64                               rhel-8.3
um                           x86_64_defconfig
um                             i386_defconfig
x86_64               randconfig-a002-20220926
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a001-20220926
m68k                             allmodconfig
x86_64               randconfig-a003-20220926
arc                              allyesconfig
x86_64                           rhel-8.3-syz
mips                             allyesconfig
i386                                defconfig
alpha                            allyesconfig
x86_64               randconfig-a004-20220926
powerpc                          allmodconfig
x86_64               randconfig-a006-20220926
x86_64                          rhel-8.3-func
x86_64               randconfig-a005-20220926
x86_64                    rhel-8.3-kselftests
arm                                 defconfig
i386                 randconfig-a001-20220926
m68k                             allyesconfig
i386                 randconfig-a004-20220926
i386                 randconfig-a002-20220926
i386                 randconfig-a003-20220926
i386                 randconfig-a006-20220926
arc                  randconfig-r043-20220925
i386                 randconfig-a005-20220926
s390                 randconfig-r044-20220925
arc                  randconfig-r043-20220926
riscv                randconfig-r042-20220925
arm                              allyesconfig
arm64                            allyesconfig
i386                             allyesconfig
ia64                             allmodconfig

clang tested configs:
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a012-20220926
i386                 randconfig-a016-20220926
x86_64               randconfig-a014-20220926
i386                 randconfig-a011-20220926
riscv                randconfig-r042-20220926
hexagon              randconfig-r045-20220925
i386                 randconfig-a014-20220926
hexagon              randconfig-r041-20220925
i386                 randconfig-a013-20220926
x86_64               randconfig-a016-20220926
i386                 randconfig-a012-20220926
hexagon              randconfig-r041-20220926
x86_64               randconfig-a015-20220926
i386                 randconfig-a015-20220926
hexagon              randconfig-r045-20220926
s390                 randconfig-r044-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
