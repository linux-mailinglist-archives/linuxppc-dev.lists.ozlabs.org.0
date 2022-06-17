Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 403CD54EE94
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 02:55:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPLDS0p8lz3cgH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 10:55:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jjTvPgLl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jjTvPgLl;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPLCn1jW4z3bm2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 10:54:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655427269; x=1686963269;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JL3IwxdaXwvQ37l8IsAuF/B8QblsXH0aBI6R+1r28t8=;
  b=jjTvPgLlW903FtkHdgRTZfBM+tA/Gwbm7Ofh25vGJMZ2jz0o39qUgDhV
   PHswfH+xgxITFn4m8l6MlpLcWGIT1wF1C4F8AfJu3ZAHwimUYLBnZuHgw
   HgsPU6EtsVwRDioRFVZXe6UuCUTkIFnrGy6Oa6OihOJmxG8lUF3cgNsJh
   EBbyPFI0HCXWcRVa40szeq7vXbBW7lj25mMAsmIxY6TFMqJB5rOQScyDJ
   /SzMQB0owF9BBrWdKyp3xJYmcPn/us7jaf4LkYgo4uoZIS9hF6vG2yvcf
   wNfDlm649GqcJJILKo6/XC0i3UIYKuyyi+CGWW2l5XGvV0wtOikhZKUQh
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="278185440"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="278185440"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 17:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="576319534"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Jun 2022 17:54:22 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o20Fh-000OwL-Ss;
	Fri, 17 Jun 2022 00:54:21 +0000
Date: Fri, 17 Jun 2022 08:53:37 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 028de148fa5a5465ed75d39ea79ad8ebd1b35e2f
Message-ID: <62abd091.W1zGWZI6HnIzwzLw%lkp@intel.com>
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
branch HEAD: 028de148fa5a5465ed75d39ea79ad8ebd1b35e2f  powerpc: Enable execve syscall exit tracepoint

elapsed time: 736m

configs tested: 124
configs skipped: 93

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
arm64                               defconfig
i386                          randconfig-c001
powerpc                 mpc85xx_cds_defconfig
s390                          debug_defconfig
m68k                          amiga_defconfig
mips                  maltasmvp_eva_defconfig
sh                   secureedge5410_defconfig
arm                         lubbock_defconfig
powerpc                         ps3_defconfig
arm                             pxa_defconfig
sh                ecovec24-romimage_defconfig
mips                            ar7_defconfig
xtensa                generic_kc705_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                           sama5_defconfig
m68k                        stmark2_defconfig
sh                          landisk_defconfig
sh                             shx3_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     tqm8548_defconfig
xtensa                         virt_defconfig
arm                        clps711x_defconfig
arm                           sunxi_defconfig
mips                       capcella_defconfig
nios2                         10m50_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                   sh7770_generic_defconfig
mips                         cobalt_defconfig
sh                          urquell_defconfig
sparc                               defconfig
m68k                          hp300_defconfig
s390                                defconfig
arc                        vdk_hs38_defconfig
powerpc                      pcm030_defconfig
powerpc                    klondike_defconfig
sh                           se7780_defconfig
powerpc                      tqm8xx_defconfig
mips                            gpr_defconfig
arm                      integrator_defconfig
powerpc                     pq2fads_defconfig
arm                        mvebu_v7_defconfig
arc                            hsdk_defconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
mips                          ath79_defconfig
arm                        multi_v5_defconfig
arm                          ep93xx_defconfig
arm                        mvebu_v5_defconfig
arm                          collie_defconfig
powerpc                     tqm5200_defconfig
mips                           ip22_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
riscv                randconfig-r042-20220616
hexagon              randconfig-r041-20220616
hexagon              randconfig-r045-20220616
s390                 randconfig-r044-20220616

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
