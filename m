Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 750F29305CD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2024 15:56:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fQ0DkTym;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WLqkM0YnLz3cZR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2024 23:56:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fQ0DkTym;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WLqjc4dKKz30Wf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2024 23:55:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720878932; x=1752414932;
  h=date:from:to:cc:subject:message-id;
  bh=Ohiywx5Va1euIU22k84Bpe3bRuX2oURP9h7RrwGmGPM=;
  b=fQ0DkTymqiAlkSIpgHUfAfnqq+soP7y+y2ifU188cAzQeBrqHysF3gki
   t6/UCP2ZXIro7bMMV2gSaxczjne49naBO9g8VZzHW/funVbToz+1RSoPs
   oJaAp5NLiHUH2A2yAa5Jhtp2GjtEQ5nb3djFPIUWUCL9nnSmWLOYS7yDE
   0+odgKitvH15Ozw70Mx4qEFoQpMBKqMRs2Y6wKbBwTto1BaKxsbvFobmm
   WBUfF+8d8a45jZ2rZy6ibOOADMyZoCU0I62sAsj0OgwOskKc1v0ZnYki5
   LC78QHnqtLlMQXXGekCzPY08WXMgLHtytyEC3VKZizHdYFUquF3GHv3jA
   A==;
X-CSE-ConnectionGUID: iP4hUxgqRc6m+Z2rn9/fig==
X-CSE-MsgGUID: o0Dt5p/KQym9bepZd1d2lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="21227855"
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="21227855"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 06:55:27 -0700
X-CSE-ConnectionGUID: ewUYxJLHT+uo18BeEEKZIg==
X-CSE-MsgGUID: 7IzkxlWjTeGx36ckNSFzxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="54122552"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Jul 2024 06:55:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSdDf-000cDq-12;
	Sat, 13 Jul 2024 13:55:23 +0000
Date: Sat, 13 Jul 2024 21:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 582b0e554593e530b1386eacafee6c412c5673cc
Message-ID: <202407132127.P7NmjtUg-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 582b0e554593e530b1386eacafee6c412c5673cc  Automatic merge of 'next' into merge (2024-07-12 22:47)

elapsed time: 1456m

configs tested: 196
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240713   gcc-13.2.0
arc                   randconfig-002-20240713   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         at91_dt_defconfig   clang-19
arm                     davinci_all_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                       imx_v4_v5_defconfig   gcc-13.2.0
arm                      integrator_defconfig   gcc-13.2.0
arm                       omap2plus_defconfig   gcc-14.1.0
arm                          pxa168_defconfig   gcc-13.2.0
arm                             pxa_defconfig   gcc-13.2.0
arm                   randconfig-001-20240713   gcc-13.2.0
arm                   randconfig-002-20240713   gcc-13.2.0
arm                   randconfig-003-20240713   gcc-13.2.0
arm                   randconfig-004-20240713   gcc-13.2.0
arm                        realview_defconfig   clang-19
arm                             rpc_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240713   gcc-13.2.0
arm64                 randconfig-002-20240713   gcc-13.2.0
arm64                 randconfig-003-20240713   gcc-13.2.0
arm64                 randconfig-004-20240713   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240713   gcc-13.2.0
csky                  randconfig-002-20240713   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240713   clang-18
i386         buildonly-randconfig-002-20240713   clang-18
i386         buildonly-randconfig-003-20240713   clang-18
i386         buildonly-randconfig-004-20240713   clang-18
i386         buildonly-randconfig-005-20240713   clang-18
i386         buildonly-randconfig-006-20240713   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240713   clang-18
i386                  randconfig-002-20240713   clang-18
i386                  randconfig-003-20240713   clang-18
i386                  randconfig-004-20240713   clang-18
i386                  randconfig-005-20240713   clang-18
i386                  randconfig-006-20240713   clang-18
i386                  randconfig-011-20240713   clang-18
i386                  randconfig-012-20240713   clang-18
i386                  randconfig-013-20240713   clang-18
i386                  randconfig-014-20240713   clang-18
i386                  randconfig-015-20240713   clang-18
i386                  randconfig-016-20240713   clang-18
loongarch                        alldefconfig   gcc-14.1.0
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240713   gcc-13.2.0
loongarch             randconfig-002-20240713   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         apollo_defconfig   gcc-13.2.0
m68k                       bvme6000_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                           sun3_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                     loongson1b_defconfig   gcc-14.1.0
mips                      loongson3_defconfig   clang-19
mips                      malta_kvm_defconfig   gcc-14.1.0
mips                malta_qemu_32r6_defconfig   clang-19
mips                      maltasmvp_defconfig   gcc-14.1.0
mips                        maltaup_defconfig   clang-19
mips                        omega2p_defconfig   gcc-13.2.0
mips                           rs90_defconfig   clang-19
nios2                         3c120_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240713   gcc-13.2.0
nios2                 randconfig-002-20240713   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240713   gcc-13.2.0
parisc                randconfig-002-20240713   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                     akebono_defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                     asp8347_defconfig   clang-19
powerpc                 canyonlands_defconfig   clang-19
powerpc                       eiger_defconfig   clang-19
powerpc                    gamecube_defconfig   gcc-13.2.0
powerpc                    ge_imp3a_defconfig   gcc-13.2.0
powerpc                   motionpro_defconfig   gcc-14.1.0
powerpc                     mpc512x_defconfig   clang-19
powerpc                     mpc5200_defconfig   gcc-14.1.0
powerpc                 mpc8313_rdb_defconfig   gcc-13.2.0
powerpc                 mpc834x_itx_defconfig   gcc-13.2.0
powerpc                      ppc44x_defconfig   clang-19
powerpc               randconfig-001-20240713   gcc-13.2.0
powerpc               randconfig-002-20240713   gcc-13.2.0
powerpc               randconfig-003-20240713   gcc-13.2.0
powerpc                     tqm8555_defconfig   clang-19
powerpc                        warp_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240713   gcc-13.2.0
powerpc64             randconfig-002-20240713   gcc-13.2.0
powerpc64             randconfig-003-20240713   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_k210_defconfig   gcc-14.1.0
riscv                 randconfig-001-20240713   gcc-13.2.0
riscv                 randconfig-002-20240713   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240713   gcc-13.2.0
s390                  randconfig-002-20240713   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                         ap325rxa_defconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                ecovec24-romimage_defconfig   gcc-14.1.0
sh                    randconfig-001-20240713   gcc-13.2.0
sh                    randconfig-002-20240713   gcc-13.2.0
sh                          sdk7780_defconfig   gcc-13.2.0
sh                             shx3_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240713   gcc-13.2.0
sparc64               randconfig-002-20240713   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240713   gcc-13.2.0
um                    randconfig-002-20240713   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240713   clang-18
x86_64       buildonly-randconfig-002-20240713   clang-18
x86_64       buildonly-randconfig-003-20240713   clang-18
x86_64       buildonly-randconfig-004-20240713   clang-18
x86_64       buildonly-randconfig-005-20240713   clang-18
x86_64       buildonly-randconfig-006-20240713   clang-18
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240713   clang-18
x86_64                randconfig-002-20240713   clang-18
x86_64                randconfig-003-20240713   clang-18
x86_64                randconfig-004-20240713   clang-18
x86_64                randconfig-005-20240713   clang-18
x86_64                randconfig-006-20240713   clang-18
x86_64                randconfig-011-20240713   clang-18
x86_64                randconfig-012-20240713   clang-18
x86_64                randconfig-013-20240713   clang-18
x86_64                randconfig-014-20240713   clang-18
x86_64                randconfig-015-20240713   clang-18
x86_64                randconfig-016-20240713   clang-18
x86_64                randconfig-071-20240713   clang-18
x86_64                randconfig-072-20240713   clang-18
x86_64                randconfig-073-20240713   clang-18
x86_64                randconfig-074-20240713   clang-18
x86_64                randconfig-075-20240713   clang-18
x86_64                randconfig-076-20240713   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240713   gcc-13.2.0
xtensa                randconfig-002-20240713   gcc-13.2.0
xtensa                    xip_kc705_defconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
