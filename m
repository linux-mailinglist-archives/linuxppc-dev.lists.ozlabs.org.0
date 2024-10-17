Return-Path: <linuxppc-dev+bounces-2340-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FE69A1EDB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 11:48:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTjh200RZz3bdS;
	Thu, 17 Oct 2024 20:48:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729158497;
	cv=none; b=fmgqk6M0tQ8v4e7I+yWhI38acEiMPCQICuGndFgMA7I24qxWs82hyGsd1XX9VY5wrcV/EDBeaJBo3zh1a1t3VmHIqySGyRT7W3On2SRvLmvynWO9g5ccNBjSdVuseCIrg0RT9WPe7QZ6DasrRhAWohZr3AynAevVOXBWEnNvPghwXxcy7fj1KvAd2leWRLcbMr/+Qame2dGdNbTaYOMuGj2esqn0od6MxVFwFmFgiVNO6zDwF98Qhtt1cqiNt/4eD6TZjz0CQUD9IJnhi/w/hOWUY8pVdPLZBGKZaYwtUQduDPoYsF6Ye+SR+UM0DrrnhmvRWcKod5Vg7uRhHP8Bpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729158497; c=relaxed/relaxed;
	bh=ANVcqo0JUqFM5NYnbnJc0xb2DJhQ5TOJXlOQAU1u8R4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mIn6Irmx3JoPl28/FckViYU7O0WnYzHc9lZRKVBrHIbeQ4UunrJO4UpysfyUvCSZ1+iwYOIpdwzI4lr/ctYBM34NxHPgkbiGL5KveFJ+LrZ+7iceMpmdpdO+EMkEXQNDdLKtZdQqGb2ZMcQvz80KAnzJUqZ27W/QDAlru+/saiTJ6rnboDVbTwafFj/vD++mTTBbhWFRZmvF7zFDlsNn6uUMLGYWTkbYPm2I9hvdlpDIOhH+2fCeeV8TFarwxdWPCkSRdNTJRcbDi/H9ASFC3vWlXVbhp1/YFdhUgA0HMVHnw0PN29g7qJTGIGWwVO4CRyUpi4hNhzPO9saJ/zXe3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a7750hak; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a7750hak;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTjh04YPjz3bcP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 20:48:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729158496; x=1760694496;
  h=date:from:to:cc:subject:message-id;
  bh=/JBprVP+sRdXQNwvvi9O6zuQvwWFYYyrJjgBPIH7Mzk=;
  b=a7750hakQEX9xvDFz8zs7ssisLtGcN86OiFz/4U5qNaoZufaFLQ4cbWe
   LVyrvsdBUVZrVh9qlLfSr0DkooXPqKJ0TwGXHKM4yuHoDqwO1HI5bwjsY
   qFz3fUslxleEhNoW6CDHlhz12t/ln2rN2pwpHd+wl8VZxnDFG2ywigw0y
   hyVbrZF39kVLnMOsqb7i1mru7nMdXxJBw6IqMDYNQVW4Cx3AyCnXTchAq
   TLD1X5PjILucUGrN2CrY5UPJQJER2ggROBTt/ENy8M7/Vn0KS5T2QriMN
   nSazS08dQ8qapJCbP+sHSJowjQVvEtuJ7bV6u3+jHwCYMZ9egBzOOD47M
   A==;
X-CSE-ConnectionGUID: UxsiZfafRr2pmxqnVmOuPg==
X-CSE-MsgGUID: uvxA+FSnQgq3+/JBdiTFtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="46131359"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="46131359"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 02:48:12 -0700
X-CSE-ConnectionGUID: ClqWOuTVRC2311VX2Ybdjw==
X-CSE-MsgGUID: SPmj2ymLSE6lWgFovLpZig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78156065"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Oct 2024 02:48:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1N73-000M8R-2M;
	Thu, 17 Oct 2024 09:48:09 +0000
Date: Thu, 17 Oct 2024 17:47:44 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 99e7a16007479504d952db810d5d9aba34f038ec
Message-ID: <202410171736.uccdVlK5-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 99e7a16007479504d952db810d5d9aba34f038ec  Automatic merge of 'master' into merge (2024-10-14 14:45)

elapsed time: 1296m

configs tested: 130
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                            hsdk_defconfig    gcc-14.1.0
arc                    vdk_hs38_smp_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                         axm55xx_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                            mmp2_defconfig    gcc-14.1.0
arm                       spear13xx_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241017    clang-18
i386        buildonly-randconfig-002-20241017    clang-18
i386        buildonly-randconfig-003-20241017    clang-18
i386        buildonly-randconfig-004-20241017    clang-18
i386        buildonly-randconfig-005-20241017    clang-18
i386        buildonly-randconfig-006-20241017    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241017    clang-18
i386                  randconfig-002-20241017    clang-18
i386                  randconfig-003-20241017    clang-18
i386                  randconfig-004-20241017    clang-18
i386                  randconfig-005-20241017    clang-18
i386                  randconfig-006-20241017    clang-18
i386                  randconfig-011-20241017    clang-18
i386                  randconfig-012-20241017    clang-18
i386                  randconfig-013-20241017    clang-18
i386                  randconfig-014-20241017    clang-18
i386                  randconfig-015-20241017    clang-18
i386                  randconfig-016-20241017    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                       bvme6000_defconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        m5407c3_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           ip28_defconfig    gcc-14.1.0
mips                          rb532_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                      rts7751r2d1_defconfig    gcc-14.1.0
sh                             sh03_defconfig    gcc-14.1.0
sh                   sh7724_generic_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241017    gcc-12
x86_64      buildonly-randconfig-002-20241017    gcc-12
x86_64      buildonly-randconfig-003-20241017    gcc-12
x86_64      buildonly-randconfig-004-20241017    gcc-12
x86_64      buildonly-randconfig-005-20241017    gcc-12
x86_64      buildonly-randconfig-006-20241017    gcc-12
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241017    gcc-12
x86_64                randconfig-002-20241017    gcc-12
x86_64                randconfig-003-20241017    gcc-12
x86_64                randconfig-004-20241017    gcc-12
x86_64                randconfig-005-20241017    gcc-12
x86_64                randconfig-006-20241017    gcc-12
x86_64                randconfig-011-20241017    gcc-12
x86_64                randconfig-012-20241017    gcc-12
x86_64                randconfig-013-20241017    gcc-12
x86_64                randconfig-014-20241017    gcc-12
x86_64                randconfig-015-20241017    gcc-12
x86_64                randconfig-016-20241017    gcc-12
x86_64                randconfig-071-20241017    gcc-12
x86_64                randconfig-072-20241017    gcc-12
x86_64                randconfig-073-20241017    gcc-12
x86_64                randconfig-074-20241017    gcc-12
x86_64                randconfig-075-20241017    gcc-12
x86_64                randconfig-076-20241017    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                         virt_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

