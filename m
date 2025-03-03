Return-Path: <linuxppc-dev+bounces-6611-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B433AA4B76E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 06:10:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5n1q2dNGz30Tx;
	Mon,  3 Mar 2025 16:10:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740978607;
	cv=none; b=JS2Ea41C57ts7t+x8HfXIPsM7t/vhmO1ab1/dTYgSMKdCA249sP7Fgg4NZRZkIiOvQFOpjyRDWGWDqFt1/9gdAh8dJk71MmDpmkE7b7Hj5pB/2+QH1s5p+Sut9vvEMFz9f7bdAOl+Z/f+i09ey53+WUHwqyRu+VuFBISHDVc0QnsI8bhr3iWX6Gws4JE8t+nY8981mKt0qddGG1TdNREBeNwocTnwOoIic1pTtYmytfpcij1+SIDPbA5mcNQWu3dawALYxm+t+5C2vbsuCUNap8ozemy6DIIIeOA3e7kBp0LDdZDTRsmSrh0xwG5DR/H9L+eu/ACyt8FUp0Slfv8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740978607; c=relaxed/relaxed;
	bh=YknnoN0j7S7pPFA2hutM9nkOYUWDXUqngYgivZbEaJc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mFZPymJiQ963XtQnSBTBoR0IpJVw6DdUVHR4Jbkz5tZyBeHwxsgYMTtw0LEGJ3/dEY6IkcldZa5b2yJbDseG94cdor13hAqPhlsmuHPf6Jli0gTwF6XxFDEmMBNmT/4CBy7HR5OW5/IYJq9KOl4+KahmhHb5BzFh6FmMn1n16rPiKxElNRhbJ+HBy/anRn5JUMs/EjhOrRtojqSSATciMRqCADgSEIXFuWHlk6CyB8OkK1DjEcCE5triZev3ZDxZtaSIg4BEMd9l8ING2ptwfN2ohAXIbNHY6oEHonkLmjwpdD/P5nQZ2LL7geDg/M0OYakUb9ESflOswPmbFI1FHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TbPJud8U; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TbPJud8U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5n1n0HGhz30CF
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 16:10:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740978605; x=1772514605;
  h=date:from:to:cc:subject:message-id;
  bh=/cIPL3F8DjBB06pnmPvlN7tHjeGD0rcolRyp24VumzE=;
  b=TbPJud8UBbL/cFZeledtM6NrNX4nDoNrPZ3Ifp2e23i3CKwYj62v8sNa
   NDEshfeoGIC5Nb3axAjb4Hk1EylKYUgR74y8G7WrstTKKpj80JURo2Iml
   zDppZ7+w2U+E9pheeQA+amGvfbb5MkhBST1CEHmSjDM7hV03uIqheUQbB
   1/R5OzRTHF+n9ffvKuhu0gkdy7cS5aO+vrwWSwibPr0S0ikrE4efflyyN
   j4wx/dn0VJavkm8Zcq1JBRN0rJyZpvi1vMoUiUuVjD+dWZu3YFlETnufD
   IxgszqPwYan5FzVJxqo2cmxcEgm0pXK5g5FQVF37t6Du5HMTVcAvGwVeZ
   Q==;
X-CSE-ConnectionGUID: 1MUrGVWqQISJMxAj111ZDw==
X-CSE-MsgGUID: 0C4DfAErRkC4Z5wTFpppbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41962079"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="41962079"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 21:10:00 -0800
X-CSE-ConnectionGUID: wtwmSrcVS9CjjVnKJgW76g==
X-CSE-MsgGUID: 8NOoJC9nTRqvhRyLzBa5Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="117645059"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 02 Mar 2025 21:09:59 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toy3r-000Hxh-2j;
	Mon, 03 Mar 2025 05:09:53 +0000
Date: Mon, 03 Mar 2025 13:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 1304f486dbf1f455c9abe284c155747be90043b3
Message-ID: <202503031303.2S9hMQWZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
branch HEAD: 1304f486dbf1f455c9abe284c155747be90043b3  Automatic merge of 'next' into merge (2025-03-02 10:01)

elapsed time: 1441m

configs tested: 135
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                          axs103_defconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                            hsdk_defconfig    gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-13.2.0
arc                   randconfig-001-20250302    gcc-13.2.0
arc                   randconfig-002-20250302    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-21
arm                            mps2_defconfig    clang-15
arm                   randconfig-001-20250302    gcc-14.2.0
arm                   randconfig-002-20250302    clang-21
arm                   randconfig-003-20250302    gcc-14.2.0
arm                   randconfig-004-20250302    clang-21
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250302    clang-18
arm64                 randconfig-002-20250302    gcc-14.2.0
arm64                 randconfig-003-20250302    gcc-14.2.0
arm64                 randconfig-004-20250302    clang-16
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250302    gcc-14.2.0
csky                  randconfig-002-20250302    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250302    clang-21
hexagon               randconfig-002-20250302    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250302    gcc-12
i386        buildonly-randconfig-002-20250302    clang-19
i386        buildonly-randconfig-003-20250302    gcc-12
i386        buildonly-randconfig-004-20250302    gcc-12
i386        buildonly-randconfig-005-20250302    gcc-12
i386        buildonly-randconfig-006-20250302    gcc-12
i386                                defconfig    clang-19
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250302    gcc-14.2.0
loongarch             randconfig-002-20250302    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-16
mips                          eyeq5_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250302    gcc-14.2.0
nios2                 randconfig-002-20250302    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250302    gcc-14.2.0
parisc                randconfig-002-20250302    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                       ebony_defconfig    clang-18
powerpc                    gamecube_defconfig    clang-16
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250302    gcc-14.2.0
powerpc               randconfig-002-20250302    gcc-14.2.0
powerpc               randconfig-003-20250302    clang-16
powerpc64             randconfig-001-20250302    gcc-14.2.0
powerpc64             randconfig-002-20250302    gcc-14.2.0
powerpc64             randconfig-003-20250302    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250302    clang-21
riscv                 randconfig-002-20250302    clang-16
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250302    clang-17
s390                  randconfig-002-20250302    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250302    gcc-14.2.0
sh                    randconfig-002-20250302    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250302    gcc-14.2.0
sparc                 randconfig-002-20250302    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250302    gcc-14.2.0
sparc64               randconfig-002-20250302    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250302    gcc-12
um                    randconfig-002-20250302    clang-16
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250302    clang-19
x86_64      buildonly-randconfig-002-20250302    clang-19
x86_64      buildonly-randconfig-003-20250302    gcc-12
x86_64      buildonly-randconfig-004-20250302    gcc-12
x86_64      buildonly-randconfig-005-20250302    gcc-12
x86_64      buildonly-randconfig-006-20250302    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250302    gcc-14.2.0
xtensa                randconfig-002-20250302    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

