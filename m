Return-Path: <linuxppc-dev+bounces-12943-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA62EBE2B94
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Oct 2025 12:21:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnPBM4vh6z3bjb;
	Thu, 16 Oct 2025 21:21:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760610091;
	cv=none; b=TQGNPepWjkFDivo2KZ/6AsgPAKombSVaD6SW3V3r3YT1jPC29ffbWZhml2XJUOXHvzBMrdMw9TBxnH5Nj5esTJoZcoiI8ThMUDF2RB8eWNlVR9wnj48E7PJgVgDm3F5zrNMHl6+7A1o1k0dDvXuy2URB9MsYEZxGMeL07IKHMovjbcWz8EgS3iXEnShzwhapi3hDE0qzxVOpDhHMzmrUUNRL4pqU1MbDc2iy1YoSkpIb81tE01zLutuikCzRaep4pmFj7S/8K1VYDYTyWF+s9OqwipJBkGYm9PB4711MolZpY6GHc1rlSgTsH1KPxnlwpATHp3Jx6LHkj63BshSj4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760610091; c=relaxed/relaxed;
	bh=RBEJTZa0rzt3IWvu8qcS7giolaWyu68EiniB6RcjFus=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vun/dbxTyrI9gREA0Ms5d0B0Do8SvTDZqLUOOKF/eTovDOZjhN7AjcfbYQ1GM+wUsD63J2Uj5omhO2RHTQeh9R/85YXc869tVtVHJKhgCNpeTLeyQu9cp+/8E984A725uSwJv6BIIcxzf06MY8gjCcaTxJ/IfvoVq59101OV3dzJ5gAwgK4sDK3sGhbXhEPnhNeEBkR2wqvoHOfgGJqpcGYNHUAY+5/d7CBLjy9qkv0RvINOt54gHLOD4pqa3D/BOeFjAB8M30sE8MENadvq5AwDHXieLF7EDNFgl1nt5Cs9lc47CnZwFh0ulq+MkjAwXkivk18NWrpmE+MoQMIM4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iDlrLHwO; dkim-atps=neutral; spf=pass (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iDlrLHwO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnPBK0np8z2yqq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 21:21:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760610089; x=1792146089;
  h=date:from:to:cc:subject:message-id;
  bh=bMV1L39922sQkezEvNkScDgIytGFbZSrydft+ZlFldo=;
  b=iDlrLHwOexfDSgO/5anB8ndMxa1hLL5JgQ7kprXtIRD8RpE5fB/GIRVU
   ma+w8wnSUUmgnTrEdZaQZOeYQiuFKcEd4aumnH0a5aVgElHw/WfU0h8vc
   kmeV3gZbizW1GZeWw9kSQaXf55LKwYGjz1dFX/1g0R+TBRUbVxa57p09z
   ppAtdY2yexl5+487XV6JmIP/q7OF51n40VpHOToGHszTNbjBqW5pY3V3w
   q9FJQOHL1R+15Gs9YqV+FXW9fll6cnxY+bZXUkFc9h4lditAQmzLSlOi6
   HtAqhLdUcAOES6lyYjx+Jil+lD/2bchzRjaVMdYnnOy1mu8Oja5EvK8+1
   g==;
X-CSE-ConnectionGUID: SR78fXkwR5mGQ0914XDzXQ==
X-CSE-MsgGUID: +QGwF6RfRkmd7RZjkIf+NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62698000"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="62698000"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 03:21:22 -0700
X-CSE-ConnectionGUID: R48IDz17Smy6UfHxfHLGsg==
X-CSE-MsgGUID: tx70ZDHqRvSV88gjL5gDmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="186687426"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 16 Oct 2025 03:21:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9L6l-0004h7-1T;
	Thu, 16 Oct 2025 10:21:19 +0000
Date: Thu, 16 Oct 2025 18:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 a297f72c4951fc34e347371a31a6a48160bc67d4
Message-ID: <202510161824.bD9iJ0Wp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: a297f72c4951fc34e347371a31a6a48160bc67d4  Automatic merge of 'fixes' into merge (2025-10-15 15:25)

elapsed time: 1408m

configs tested: 251
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20251015    gcc-8.5.0
arc                   randconfig-001-20251016    clang-22
arc                   randconfig-002-20251015    gcc-8.5.0
arc                   randconfig-002-20251016    clang-22
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                          pxa3xx_defconfig    clang-22
arm                   randconfig-001-20251015    clang-22
arm                   randconfig-001-20251016    clang-22
arm                   randconfig-002-20251015    clang-22
arm                   randconfig-002-20251016    clang-22
arm                   randconfig-003-20251015    gcc-8.5.0
arm                   randconfig-003-20251016    clang-22
arm                   randconfig-004-20251015    clang-22
arm                   randconfig-004-20251016    clang-22
arm                       spear13xx_defconfig    gcc-15.1.0
arm                           sunxi_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251015    clang-22
arm64                 randconfig-001-20251016    clang-22
arm64                 randconfig-002-20251015    gcc-13.4.0
arm64                 randconfig-002-20251016    clang-22
arm64                 randconfig-003-20251015    clang-22
arm64                 randconfig-003-20251016    clang-22
arm64                 randconfig-004-20251015    clang-22
arm64                 randconfig-004-20251016    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251015    gcc-15.1.0
csky                  randconfig-001-20251016    clang-22
csky                  randconfig-002-20251015    gcc-9.5.0
csky                  randconfig-002-20251016    clang-22
hexagon                          alldefconfig    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251015    clang-22
hexagon               randconfig-001-20251016    clang-22
hexagon               randconfig-002-20251015    clang-19
hexagon               randconfig-002-20251016    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251015    gcc-13
i386        buildonly-randconfig-001-20251016    clang-20
i386        buildonly-randconfig-002-20251015    gcc-14
i386        buildonly-randconfig-002-20251016    clang-20
i386        buildonly-randconfig-003-20251015    clang-20
i386        buildonly-randconfig-003-20251016    clang-20
i386        buildonly-randconfig-004-20251015    clang-20
i386        buildonly-randconfig-004-20251016    clang-20
i386        buildonly-randconfig-005-20251015    clang-20
i386        buildonly-randconfig-005-20251016    clang-20
i386        buildonly-randconfig-006-20251015    clang-20
i386        buildonly-randconfig-006-20251016    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251016    clang-20
i386                  randconfig-002-20251016    clang-20
i386                  randconfig-003-20251016    clang-20
i386                  randconfig-004-20251016    clang-20
i386                  randconfig-005-20251016    clang-20
i386                  randconfig-006-20251016    clang-20
i386                  randconfig-007-20251016    clang-20
i386                  randconfig-011-20251016    gcc-14
i386                  randconfig-012-20251016    gcc-14
i386                  randconfig-013-20251016    gcc-14
i386                  randconfig-014-20251016    gcc-14
i386                  randconfig-015-20251016    gcc-14
i386                  randconfig-016-20251016    gcc-14
i386                  randconfig-017-20251016    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251015    gcc-15.1.0
loongarch             randconfig-001-20251016    clang-22
loongarch             randconfig-002-20251015    gcc-15.1.0
loongarch             randconfig-002-20251016    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                          sun3x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251015    gcc-8.5.0
nios2                 randconfig-001-20251016    clang-22
nios2                 randconfig-002-20251015    gcc-8.5.0
nios2                 randconfig-002-20251016    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251015    gcc-9.5.0
parisc                randconfig-001-20251016    clang-22
parisc                randconfig-002-20251015    gcc-8.5.0
parisc                randconfig-002-20251016    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20251015    gcc-15.1.0
powerpc               randconfig-001-20251016    clang-22
powerpc               randconfig-002-20251015    gcc-12.5.0
powerpc               randconfig-002-20251016    clang-22
powerpc               randconfig-003-20251015    clang-22
powerpc               randconfig-003-20251016    clang-22
powerpc64             randconfig-001-20251015    clang-22
powerpc64             randconfig-002-20251015    clang-22
powerpc64             randconfig-002-20251016    clang-22
powerpc64             randconfig-003-20251015    gcc-13.4.0
powerpc64             randconfig-003-20251016    clang-22
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251015    gcc-10.5.0
riscv                 randconfig-001-20251016    gcc-10.5.0
riscv                 randconfig-002-20251015    clang-22
riscv                 randconfig-002-20251016    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251015    gcc-12.5.0
s390                  randconfig-001-20251016    gcc-10.5.0
s390                  randconfig-002-20251015    clang-22
s390                  randconfig-002-20251016    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251015    gcc-11.5.0
sh                    randconfig-001-20251016    gcc-10.5.0
sh                    randconfig-002-20251015    gcc-11.5.0
sh                    randconfig-002-20251016    gcc-10.5.0
sh                             sh03_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251015    gcc-8.5.0
sparc                 randconfig-001-20251016    gcc-10.5.0
sparc                 randconfig-002-20251015    gcc-13.4.0
sparc                 randconfig-002-20251016    gcc-10.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251015    clang-22
sparc64               randconfig-001-20251016    gcc-10.5.0
sparc64               randconfig-002-20251015    gcc-11.5.0
sparc64               randconfig-002-20251016    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251015    clang-22
um                    randconfig-001-20251016    gcc-10.5.0
um                    randconfig-002-20251015    clang-22
um                    randconfig-002-20251016    gcc-10.5.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251015    clang-20
x86_64      buildonly-randconfig-001-20251016    gcc-12
x86_64      buildonly-randconfig-002-20251015    gcc-14
x86_64      buildonly-randconfig-002-20251016    gcc-12
x86_64      buildonly-randconfig-003-20251015    clang-20
x86_64      buildonly-randconfig-003-20251016    gcc-12
x86_64      buildonly-randconfig-004-20251015    clang-20
x86_64      buildonly-randconfig-004-20251016    gcc-12
x86_64      buildonly-randconfig-005-20251015    gcc-14
x86_64      buildonly-randconfig-005-20251016    gcc-12
x86_64      buildonly-randconfig-006-20251015    gcc-13
x86_64      buildonly-randconfig-006-20251016    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251016    clang-20
x86_64                randconfig-002-20251016    clang-20
x86_64                randconfig-003-20251016    clang-20
x86_64                randconfig-004-20251016    clang-20
x86_64                randconfig-005-20251016    clang-20
x86_64                randconfig-006-20251016    clang-20
x86_64                randconfig-007-20251016    clang-20
x86_64                randconfig-008-20251016    clang-20
x86_64                randconfig-071-20251016    gcc-14
x86_64                randconfig-072-20251016    gcc-14
x86_64                randconfig-073-20251016    gcc-14
x86_64                randconfig-074-20251016    gcc-14
x86_64                randconfig-075-20251016    gcc-14
x86_64                randconfig-076-20251016    gcc-14
x86_64                randconfig-077-20251016    gcc-14
x86_64                randconfig-078-20251016    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251015    gcc-9.5.0
xtensa                randconfig-001-20251016    gcc-10.5.0
xtensa                randconfig-002-20251015    gcc-15.1.0
xtensa                randconfig-002-20251016    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

