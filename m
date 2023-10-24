Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6527D46F8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 07:39:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YY80uaCz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SF18f21lpz3cN4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 16:39:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YY80uaCz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SF17p2tmXz2xdb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 16:38:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698125926; x=1729661926;
  h=date:from:to:cc:subject:message-id;
  bh=mt1j+SpSwMeJ4c2qV5NbOb0qCUt0Y5+bGdaxMr1yS/Q=;
  b=YY80uaCzjVPxensSdSb/7mzWCZ/adL8FSye/8EUakFpXbdEpaCx7h7+8
   1pj+xT6tuhfTmUqL2OUobHARkotTClJPs8Tr5YKnizYsGB0y95OzYWm/p
   Tx3uIQ4K9Syceedd50C69Waq5soWo4VXSLloaFTcHVYJ+cZenITnvNaO2
   NjTMDEYRxCZgTfcBSwqqIa4d9xMwbbJfnXprL7Q5/tvDgIHMfLAybUUDx
   StWeyM/SquyQHtKnlBZBoCFeE5KhKsH1RxGQzHT2w7BbY4K/oQNsLcRt5
   bqVlNA2jslbO2Fd8n9CJ6U9S/k72sGGWZUU3+irSGr1UaltJME8N5eq/5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="473216863"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="473216863"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 22:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="1089734499"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="1089734499"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Oct 2023 22:38:41 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvA7j-0007bd-0h;
	Tue, 24 Oct 2023 05:38:39 +0000
Date: Tue, 24 Oct 2023 13:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/ppc-kvm] BUILD SUCCESS
 b7bce570430e42229fb63f775fcbb10f38b83c71
Message-ID: <202310241337.zsxxsl7Z-lkp@intel.com>
User-Agent: s-nail v14.9.24
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
branch HEAD: b7bce570430e42229fb63f775fcbb10f38b83c71  powerpc/kvm: Force cast endianness of KVM shared regs

elapsed time: 3099m

configs tested: 156
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231022   gcc  
arc                   randconfig-001-20231023   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231023   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231023   gcc  
i386         buildonly-randconfig-002-20231023   gcc  
i386         buildonly-randconfig-003-20231023   gcc  
i386         buildonly-randconfig-004-20231023   gcc  
i386         buildonly-randconfig-005-20231023   gcc  
i386         buildonly-randconfig-006-20231023   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231023   gcc  
i386                  randconfig-002-20231023   gcc  
i386                  randconfig-003-20231023   gcc  
i386                  randconfig-004-20231023   gcc  
i386                  randconfig-005-20231023   gcc  
i386                  randconfig-006-20231023   gcc  
i386                  randconfig-011-20231023   gcc  
i386                  randconfig-012-20231023   gcc  
i386                  randconfig-013-20231023   gcc  
i386                  randconfig-014-20231023   gcc  
i386                  randconfig-015-20231023   gcc  
i386                  randconfig-016-20231023   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231022   gcc  
loongarch             randconfig-001-20231023   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                          g5_defconfig   clang
powerpc                        icon_defconfig   clang
powerpc                      makalu_defconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   clang
powerpc                 mpc8315_rdb_defconfig   clang
powerpc                    sam440ep_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20231023   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231023   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231023   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231023   gcc  
x86_64       buildonly-randconfig-002-20231023   gcc  
x86_64       buildonly-randconfig-003-20231023   gcc  
x86_64       buildonly-randconfig-004-20231023   gcc  
x86_64       buildonly-randconfig-005-20231023   gcc  
x86_64       buildonly-randconfig-006-20231023   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231023   gcc  
x86_64                randconfig-002-20231023   gcc  
x86_64                randconfig-003-20231023   gcc  
x86_64                randconfig-004-20231023   gcc  
x86_64                randconfig-005-20231023   gcc  
x86_64                randconfig-006-20231023   gcc  
x86_64                randconfig-011-20231023   gcc  
x86_64                randconfig-012-20231023   gcc  
x86_64                randconfig-013-20231023   gcc  
x86_64                randconfig-014-20231023   gcc  
x86_64                randconfig-015-20231023   gcc  
x86_64                randconfig-016-20231023   gcc  
x86_64                randconfig-071-20231023   gcc  
x86_64                randconfig-072-20231023   gcc  
x86_64                randconfig-073-20231023   gcc  
x86_64                randconfig-074-20231023   gcc  
x86_64                randconfig-075-20231023   gcc  
x86_64                randconfig-076-20231023   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
