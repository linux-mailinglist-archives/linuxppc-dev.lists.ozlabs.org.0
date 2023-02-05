Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F2868AFCF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 13:59:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8qGW3J68z3f40
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 23:59:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EoAElvgw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EoAElvgw;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8qDY2JYcz3bW2
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 23:57:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675601853; x=1707137853;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XGzm/yAEB31v5EKlWeqAHFCUdOmkCJv7jCuO2Xo/BPU=;
  b=EoAElvgw1uKJDuNgxrZAzT/9hEdW/k4jr4EHCm3D/2QiipDbafqnELuW
   1WqqNrVD5ZBj6K1U7kPI0WWB0e13/fmR/kbKI4fl5mB4jfxSBqJhh4fp/
   KZHMp0u61KoJ+KsQWvHTcNnPMAbBmIOP6/g1BJSdaOhXu7ti1clhuIypv
   bOP/Swp5fDLq/FQoVdLKacDlKnGeZr3w8TO7WW0zpYh6xU6KpgAWOuTm1
   4Ld/YGuOaqLe3Rr4xZQJHBJt0ERUt6mwSYYCAvPUenI18pTViiK2E0ToE
   xKbxWfRfWpkaERQI8E43gs8tbrEwLX8DQ2HZZvy8T3SL9lWob2FC36LRa
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="330337375"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="330337375"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 04:57:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="840110009"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="840110009"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Feb 2023 04:57:20 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOea7-00020u-1b;
	Sun, 05 Feb 2023 12:57:19 +0000
Date: Sun, 05 Feb 2023 20:57:12 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 e33416fca8a2313b8650bd5807aaf34354d39a4c
Message-ID: <63dfa7a8.l9GgMLOjb70eBORa%lkp@intel.com>
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
branch HEAD: e33416fca8a2313b8650bd5807aaf34354d39a4c  powerpc: Don't select ARCH_WANTS_NO_INSTR

elapsed time: 723m

configs tested: 20
configs skipped: 108

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
riscv                randconfig-r042-20230205
s390                 randconfig-r044-20230205
hexagon              randconfig-r045-20230205
hexagon              randconfig-r041-20230205
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
