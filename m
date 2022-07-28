Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D1D583BE6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 12:18:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ltmp12XDBz3053
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 20:18:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B27jpFtG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B27jpFtG;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtmnL0lsbz2xHg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 20:18:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659003494; x=1690539494;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6qk4pNnPevfDk4PRvM20l4ZjvIBDDrA4ORJIjawOD3g=;
  b=B27jpFtG2h92pM0DhHAyognufBOJv3hdU/ki0gQo0SK2dHgHscrneT7A
   lFQrEl1Hlk7BmFxc5pYybcGXg3x/mkc/8VXTMEjD0OA3WUAhPSLU+0JJe
   Ae7IHzjhIcCM+C2L0DMnT9YdZcQ8cZ2rLIY0tDE+6CSgVIjbBOTSWwamT
   8tJJ7E9ECypPtebPLeSlk5lP01voEHVdWscnsSpzx+BtjiY0VsE3h84xR
   Ddo2nAAFCP8QT5wqJ2sfeoW5AbaIrwt+prLjTmnkSqr7epAf8dn09Dlcn
   NkQxwA+W9dQDtsV7WnRVV3CIogD6ABtWjF3UQp2PPsxE/Sb3u82roINKq
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="289247240"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="289247240"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 03:18:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="743047036"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2022 03:18:03 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oH0ag-0009te-3D;
	Thu, 28 Jul 2022 10:18:03 +0000
Date: Thu, 28 Jul 2022 18:17:46 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 7485dc1511cd16711cec686bd3ebfd80d327a9f6
Message-ID: <62e2624a.Tsjh0iJmjctFJZ3I%lkp@intel.com>
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
branch HEAD: 7485dc1511cd16711cec686bd3ebfd80d327a9f6  powerpc/ci: Clang 44x build is broken

elapsed time: 1161m

configs tested: 57
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                  randconfig-r043-20220727
i386                                defconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
i386                             allyesconfig
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
csky                              allnoconfig
arc                               allnoconfig
sh                               allmodconfig
alpha                             allnoconfig
riscv                             allnoconfig
alpha                            allyesconfig
arc                              allyesconfig
x86_64                              defconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
hexagon              randconfig-r045-20220727
hexagon              randconfig-r041-20220727
riscv                randconfig-r042-20220727
x86_64                        randconfig-a001
s390                 randconfig-r044-20220727
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a006
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
