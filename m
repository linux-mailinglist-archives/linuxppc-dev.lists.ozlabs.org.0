Return-Path: <linuxppc-dev+bounces-4474-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 471C89FC65A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Dec 2024 20:25:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YJMCh0m7yz2xrJ;
	Thu, 26 Dec 2024 06:25:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735154704;
	cv=none; b=ILN8HLwbyBMVpxbrWJIeM9u1e+S0e0XdohKrfa6bJnY4ClyMGpNcacoL0Rlt4LizB6GUUOH+a/5CVUQfHgvWzV1eKBPwhqE0PkO0/j6BzlvXlpmlChw7uNHcaBU9xP807D6Cf9flVIhFrdnlkUZ+zzX43alwMoH1rMaB0FbyUeMnG9ySOS72PFQo49rbTUX/D9NjfInFl7gz/yCzDrdzoOSt2WMA7enepwpwCcic7cr5ihbzLqGOjIbYvOK0C7P24hBEU+obekYeQ7/qzOyZkXxGYMKuVm5n/TQ/q42FrSJZefaqW12TntTco0qLfwfDms7j1NwyxVix0qe6kkoJhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735154704; c=relaxed/relaxed;
	bh=sAKje8vnWFUvamcBNqsJkUo8qcb3jV80tpO85GShyGY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MHwV2sRZdfryWNhDss4HevZ35M1rkDtqaxEFn7cXOF5dfvxXUX8UEwvdD3rIffwcLQgXZvVyzkq/9E44ehx75Bdk3/CaaBrgt4E8DTMCI/nx9nDMBwXx9P1iQIXFKL+3URZLY3vuxD75H4d8aTKyYtNsGJ/T+UCvwyTCpRYVo4BBIagtcJk6DuQZWPQ7LlJm7z8VitFRmzbTw8f7XpVGB9YRb+DVgHMvJSbBUWW0d4SRG7j1zGUq7Zgf6Qzc4C2l6UUExa1GcG4o5sv+gxXFib5ut2EYAALOy0ZFyT5YfFwJmGBhZiVxXFLZhe53soxaqDNjrC8Lb+7MnqV2uA1Fqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ID6pzRjK; dkim-atps=neutral; spf=pass (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ID6pzRjK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YJMCc64zKz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Dec 2024 06:24:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735154701; x=1766690701;
  h=date:from:to:cc:subject:message-id;
  bh=EuE4K+smUDKy3Jbg3j40uXldyJd3AiDh98ArO6j8j4Q=;
  b=ID6pzRjKVZqIyVBddgtj8Yn3aATtR8Nw+kuJ0bJVG34bFwY9YxDn/Mpb
   bNr3CRBUZVs59D3N1gVRcGZINeP2Ec98Qk7hLWofypQ+SynMTOE3k5pfH
   fg0cGFfy7mD3Iich7/1R4VYMjrzlYRvrdo4mvcNEQwq58CBWhLp318bhf
   6945/GXB3COgehdsHuQokZqCLwFczN3yAIzcqfFhGX2Uh5+6lzZd8K/g/
   qlQRdvFQOgT0g08KNhb2VP+2N/6W3XRFr+eQzrNlVqN+OhlPxTXPmjVER
   WyT7TzuwXcaSUnInMJmPgUNV2sbpIxVE2N+wbCmDLVK8XsouYkRLKJ988
   w==;
X-CSE-ConnectionGUID: Kqw8fvIJSC+sPmrQ6j1J/A==
X-CSE-MsgGUID: BoIbj8kNRQO+afQgbnZ82Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35498288"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="35498288"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 11:24:54 -0800
X-CSE-ConnectionGUID: p1uU2tGMStCOUocWIHak7w==
X-CSE-MsgGUID: xo73UnfpQuG4rS/CKUT+8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="100278371"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Dec 2024 11:24:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQWzy-00026S-3C;
	Wed, 25 Dec 2024 19:24:50 +0000
Date: Thu, 26 Dec 2024 03:24:44 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 624bb7ffe55cc39582f0a063f17958673aa2ca1a
Message-ID: <202412260330.dveisoM5-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 624bb7ffe55cc39582f0a063f17958673aa2ca1a  Automatic merge of 'fixes' into merge (2024-12-25 10:04)

elapsed time: 876m

configs tested: 194
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    gcc-13.2.0
arc                   randconfig-001-20241225    gcc-13.2.0
arc                   randconfig-002-20241225    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                         lpc32xx_defconfig    gcc-14.2.0
arm                         mv78xx0_defconfig    clang-20
arm                             pxa_defconfig    gcc-14.2.0
arm                   randconfig-001-20241225    gcc-14.2.0
arm                   randconfig-002-20241225    gcc-14.2.0
arm                   randconfig-003-20241225    gcc-14.2.0
arm                   randconfig-004-20241225    gcc-14.2.0
arm                           u8500_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241225    gcc-14.2.0
arm64                 randconfig-002-20241225    clang-16
arm64                 randconfig-003-20241225    gcc-14.2.0
arm64                 randconfig-004-20241225    clang-16
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241225    gcc-14.2.0
csky                  randconfig-002-20241225    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241225    clang-20
hexagon               randconfig-002-20241225    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241225    gcc-12
i386        buildonly-randconfig-002-20241225    gcc-12
i386        buildonly-randconfig-003-20241225    clang-19
i386        buildonly-randconfig-004-20241225    gcc-12
i386        buildonly-randconfig-005-20241225    gcc-11
i386        buildonly-randconfig-006-20241225    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241226    clang-19
i386                  randconfig-002-20241226    clang-19
i386                  randconfig-003-20241226    clang-19
i386                  randconfig-004-20241226    clang-19
i386                  randconfig-005-20241226    clang-19
i386                  randconfig-006-20241226    clang-19
i386                  randconfig-007-20241226    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241225    gcc-14.2.0
loongarch             randconfig-002-20241225    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
m68k                           sun3_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-20
mips                            gpr_defconfig    clang-20
mips                      maltaaprp_defconfig    clang-20
nios2                            alldefconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241225    gcc-14.2.0
nios2                 randconfig-002-20241225    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241225    gcc-14.2.0
parisc                randconfig-002-20241225    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                          g5_defconfig    clang-20
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc                   motionpro_defconfig    clang-20
powerpc               randconfig-001-20241225    gcc-14.2.0
powerpc               randconfig-002-20241225    clang-20
powerpc               randconfig-003-20241225    gcc-14.2.0
powerpc64             randconfig-001-20241225    gcc-14.2.0
powerpc64             randconfig-002-20241225    clang-16
powerpc64             randconfig-003-20241225    clang-18
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241225    gcc-14.2.0
riscv                 randconfig-001-20241226    gcc-12
riscv                 randconfig-002-20241225    gcc-14.2.0
riscv                 randconfig-002-20241226    gcc-12
s390                             alldefconfig    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241225    clang-20
s390                  randconfig-001-20241226    gcc-12
s390                  randconfig-002-20241225    clang-19
s390                  randconfig-002-20241226    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                               j2_defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    clang-20
sh                            migor_defconfig    gcc-14.2.0
sh                    randconfig-001-20241225    gcc-14.2.0
sh                    randconfig-001-20241226    gcc-12
sh                    randconfig-002-20241225    gcc-14.2.0
sh                    randconfig-002-20241226    gcc-12
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241225    gcc-14.2.0
sparc                 randconfig-001-20241226    gcc-12
sparc                 randconfig-002-20241225    gcc-14.2.0
sparc                 randconfig-002-20241226    gcc-12
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241225    gcc-14.2.0
sparc64               randconfig-001-20241226    gcc-12
sparc64               randconfig-002-20241225    gcc-14.2.0
sparc64               randconfig-002-20241226    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241225    clang-20
um                    randconfig-001-20241226    gcc-12
um                    randconfig-002-20241225    gcc-12
um                    randconfig-002-20241226    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241225    gcc-12
x86_64      buildonly-randconfig-002-20241225    gcc-12
x86_64      buildonly-randconfig-003-20241225    clang-19
x86_64      buildonly-randconfig-004-20241225    clang-19
x86_64      buildonly-randconfig-005-20241225    clang-19
x86_64      buildonly-randconfig-006-20241225    gcc-12
x86_64                              defconfig    gcc-11
x86_64                randconfig-001-20241226    clang-19
x86_64                randconfig-002-20241226    clang-19
x86_64                randconfig-003-20241226    clang-19
x86_64                randconfig-004-20241226    clang-19
x86_64                randconfig-005-20241226    clang-19
x86_64                randconfig-006-20241226    clang-19
x86_64                randconfig-007-20241226    clang-19
x86_64                randconfig-008-20241226    clang-19
x86_64                randconfig-071-20241226    clang-19
x86_64                randconfig-072-20241226    clang-19
x86_64                randconfig-073-20241226    clang-19
x86_64                randconfig-074-20241226    clang-19
x86_64                randconfig-075-20241226    clang-19
x86_64                randconfig-076-20241226    clang-19
x86_64                randconfig-077-20241226    clang-19
x86_64                randconfig-078-20241226    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241225    gcc-14.2.0
xtensa                randconfig-001-20241226    gcc-12
xtensa                randconfig-002-20241225    gcc-14.2.0
xtensa                randconfig-002-20241226    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

