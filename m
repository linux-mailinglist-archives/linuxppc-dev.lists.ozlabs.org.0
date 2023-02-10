Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 848DA6916F8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 03:59:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCdjy3H3Cz3f54
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 13:59:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ULtZrf1U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ULtZrf1U;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCdhy62tRz3bZv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 13:58:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675997907; x=1707533907;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bD4wP7yBCLk+q/qTw4V9H8yAGrNVhE9hcOqbF5MmXHA=;
  b=ULtZrf1U+1NWUWTSPIgiXQASai6S7CjFmnPdrFfnyPWYSQxqzDDDAQvj
   xIJogGl7+SC4Kmyr3M1V4LC4jeF6EVUqnDRY6tD8gjdOqC3AIDElnHP46
   CfpV6/TTz3hkvqEATasu79JP3yqioe6tZY3sra76A2pIFxSvjqKS3RRmo
   Be+w/DCdcHNXu18B/pp+ltk5lo6/PmU+JGyaNcgQtDH0tIqQoIjpsdW2A
   4PUx11grbMjMHCiMNdcMXNwkdvCztUKn3tYVVG7Qr6hEVBUiNCPlDEpXw
   OxxAD5TmcY/36AuEHLBD+U7X5c++ZnbOa5m79V9olpZWhXXbTXm6ftz/G
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="310684568"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="310684568"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 18:58:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="736586551"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="736586551"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Feb 2023 18:58:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQJc7-0005Tg-1G;
	Fri, 10 Feb 2023 02:58:15 +0000
Date: Fri, 10 Feb 2023 10:58:12 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 6acecfa485d3de955c35a18730c106ddf1e7600e
Message-ID: <63e5b2c4.GTkwxAQMq8mdPrPO%lkp@intel.com>
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
branch HEAD: 6acecfa485d3de955c35a18730c106ddf1e7600e  powerpc/kcsan: Add KCSAN Support

elapsed time: 747m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
powerpc                           allnoconfig
arc                                 defconfig
x86_64                            allnoconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
sh                               allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                               rhel-8.3
ia64                             allmodconfig
x86_64                        randconfig-a006
x86_64                           allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                           rhel-8.3-bpf
i386                          randconfig-a016
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
i386                          randconfig-a005
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20230209
arm                  randconfig-r046-20230209
x86_64                        randconfig-a004
i386                          randconfig-a014
x86_64                        randconfig-a013
i386                                defconfig
i386                          randconfig-a012
x86_64                        randconfig-a011
x86_64                        randconfig-a002
x86_64                        randconfig-a015
arm                                 defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig

clang tested configs:
s390                 randconfig-r044-20230209
i386                          randconfig-a006
i386                          randconfig-a002
i386                          randconfig-a004
hexagon              randconfig-r045-20230209
hexagon              randconfig-r041-20230209
x86_64                        randconfig-a016
riscv                randconfig-r042-20230209
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
