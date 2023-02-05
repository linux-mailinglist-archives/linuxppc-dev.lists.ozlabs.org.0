Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D21F68AFCD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 13:58:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8qFV23HKz3bg9
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 23:58:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BWqjY3fS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BWqjY3fS;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8qDW75K0z3bW2
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 23:57:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675601852; x=1707137852;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QwFVIeB5GIwIbYo7hDdu6i+DzOM4qRxurj8uRWgrXiw=;
  b=BWqjY3fSmrFbbtlC77g1L5+FZb8U9OPHvB9otaUB41cLtRd9BoyGuvyT
   jOQ0VOnWLxhFNnwyNUUtIeNPhpCkK6uJ8tMU8LFIfpRSV2Y9BVxcfuh+c
   DMaqTv9cwmftCrD41gwU5DuDZViZN6PU0Lo49ZWsmWdAIKOeELAg6mov4
   9FZUQYOWTAW5NokFbVQbLQLjBL0LsBFLSPqviBAODbnEd073uBF1Ds3be
   8CV6drLBSxgkj04JfNqiyAbCiA1CVMlRyc83I8O2AFr2bwNwrI/Iw/Wwn
   jyycICJJbQqI7N8PKR9sv2NVF7DJXmQUpKeVQu7MQ3WDy1704FksnwGdb
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="330337373"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="330337373"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 04:57:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="840110008"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="840110008"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Feb 2023 04:57:20 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOea7-00020w-1e;
	Sun, 05 Feb 2023 12:57:19 +0000
Date: Sun, 05 Feb 2023 20:57:14 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes] BUILD SUCCESS
 1665c027afb225882a5a0b014c45e84290b826c2
Message-ID: <63dfa7aa.xwCU+AO2RfrXH+PC%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes
branch HEAD: 1665c027afb225882a5a0b014c45e84290b826c2  powerpc/64s: Reconnect tlb_flush() to hash__tlb_flush()

elapsed time: 723m

configs tested: 14
configs skipped: 108

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3

clang tested configs:
riscv                randconfig-r042-20230205
s390                 randconfig-r044-20230205
hexagon              randconfig-r045-20230205
hexagon              randconfig-r041-20230205
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
