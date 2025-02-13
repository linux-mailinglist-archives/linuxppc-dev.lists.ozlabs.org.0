Return-Path: <linuxppc-dev+bounces-6149-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A72F1A339D7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2025 09:21:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ytp6Z08VMz30TH;
	Thu, 13 Feb 2025 19:21:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739434869;
	cv=none; b=iSrjZWny+AksFH1lS3D5LKuL0CoKkx6upDl/g2kJaB59ElxsuEo3N3XLnKMLBbN/JsOtjMoiDAhSBfA4yx3a7LM/fd/rCQfQMjoBAUlcGaPofTQGk8HryabZACLqmrB52/eBbxcpEAWT8cCZPcS6j3swnETlpnuY04kBbHz3kl5ZgbCNM0wqute5Xetlwt4j6NO15g7X5BOYncj4z3T2AC+tqcwhtExDt37mkHXWHedmLyCN6k5hyohOdinQHdarw2zNyUtGHNmo8voYNVGqcVTN7p8Wtzvz982tIimL4PhsclbSVfO3XpGzWeKf1ICC+tzJji1EAhQQJJi+hDvaLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739434869; c=relaxed/relaxed;
	bh=lOBPbeaUYJ+AYywxMVUWOoy0qz2AJlcrjy9UjjJYx3s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kqnrHKSY6APoKgvMJVOSQUT8HMj4BWcBGVuMX+SxRFVdF0MW4t+HIXJLtjb4uK5lS4Yshqk1WIGQ40wVwTTM4RAq7yvHZGmz+zjzCU2lJTigNJpg+KmLgtOodQ+DUmRu1eUBIaBdIe7JVR6bL2CIqtn87zrq+KKtyFbvcDykUMnMmn9bImLksbkD1L70aRWwiKMqWTaPNDZ37RsCwMbQmk64N4lcKCJmUQDx7KXYDtBPJ8IMBiTuEBIACAGtsRpdaKqUbOtTg7r7+Xd18u+eZNDpN+DFqezIQQE3vfxDKpMM0lJFwWUvYvb3yzCOv8pJ2VwHDCyTAafPcTHinAtbhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mkZDRWWm; dkim-atps=neutral; spf=pass (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mkZDRWWm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ytp6V4DRXz30ML
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 19:21:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739434866; x=1770970866;
  h=date:from:to:cc:subject:message-id;
  bh=sRm1ttq43/tYzhhTy8MQqlNstau457y/Ml+4LTXyseY=;
  b=mkZDRWWmeZ3KSiVnTXX1a0/p4U/0pGr51qlH5t438p7ivgpVxNus+K4o
   D59B6qCa56NZtY1BYkqDpR8uLOx1Hds/hmPbl8RO1M909VvDdKhxfCWbH
   jV3gktuQN6wBCNBzolk74pus/tPKrSPBqaA/IxwxZdtu+9HWN684Pn0b8
   jvvGIdrrZo78r39L06cuglWCQ/EcJlCyhpfxprxqcBgj5BDWXGkO7UJnc
   TLSVbPDfey6VqorOWC/WMIsgLPm/aBcl8zhFNSSQXRKp9UHIae7i9C+0t
   5OowwD2/9VxEonmNeIjRVl8Is+5MViz4mLIiCjJ1VdAt+COBLEfRGkvZ0
   Q==;
X-CSE-ConnectionGUID: P7M6rq9tQZuX5BDwFs74yA==
X-CSE-MsgGUID: 6WbRfu03Q72y96B7kIAcCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39989480"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="39989480"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 00:21:01 -0800
X-CSE-ConnectionGUID: VnJriayOSauxfhxlpgh6Nw==
X-CSE-MsgGUID: Za5ws8qeT26q2rmB4XB6Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113259986"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Feb 2025 00:20:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiUSv-0016mt-0c;
	Thu, 13 Feb 2025 08:20:57 +0000
Date: Thu, 13 Feb 2025 16:20:39 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:fixes-test] BUILD SUCCESS
 d262a192d38e527faa5984629aabda2e0d1c4f54
Message-ID: <202502131633.gCE0Ulmd-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: d262a192d38e527faa5984629aabda2e0d1c4f54  powerpc/code-patching: Fix KASAN hit by not flagging text patching area as VM_ALLOC

elapsed time: 1373m

configs tested: 158
configs skipped: 116

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250213    gcc-14.2.0
arc                   randconfig-002-20250213    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                                 defconfig    gcc-14.2.0
arm                   randconfig-001-20250213    gcc-14.2.0
arm                   randconfig-002-20250213    gcc-14.2.0
arm                   randconfig-003-20250213    gcc-14.2.0
arm                   randconfig-004-20250213    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250213    gcc-14.2.0
arm64                 randconfig-002-20250213    gcc-14.2.0
arm64                 randconfig-003-20250213    gcc-14.2.0
arm64                 randconfig-004-20250213    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250213    clang-21
csky                  randconfig-002-20250213    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250213    clang-21
hexagon               randconfig-002-20250213    clang-21
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20250213    clang-19
i386        buildonly-randconfig-002-20250213    clang-19
i386        buildonly-randconfig-003-20250213    clang-19
i386        buildonly-randconfig-004-20250213    clang-19
i386        buildonly-randconfig-005-20250213    clang-19
i386        buildonly-randconfig-006-20250213    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20250213    clang-19
i386                  randconfig-002-20250213    clang-19
i386                  randconfig-003-20250213    clang-19
i386                  randconfig-004-20250213    clang-19
i386                  randconfig-005-20250213    clang-19
i386                  randconfig-006-20250213    clang-19
i386                  randconfig-007-20250213    clang-19
i386                  randconfig-011-20250213    gcc-12
i386                  randconfig-012-20250213    gcc-12
i386                  randconfig-013-20250213    gcc-12
i386                  randconfig-014-20250213    gcc-12
i386                  randconfig-015-20250213    gcc-12
i386                  randconfig-016-20250213    gcc-12
i386                  randconfig-017-20250213    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250213    clang-21
loongarch             randconfig-002-20250213    clang-21
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250213    clang-21
nios2                 randconfig-002-20250213    clang-21
openrisc                          allnoconfig    clang-21
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-21
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250213    clang-21
parisc                randconfig-002-20250213    clang-21
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250212    gcc-14.2.0
powerpc               randconfig-001-20250213    clang-21
powerpc               randconfig-002-20250212    clang-16
powerpc               randconfig-002-20250213    clang-21
powerpc               randconfig-003-20250212    gcc-14.2.0
powerpc               randconfig-003-20250213    clang-21
powerpc64             randconfig-001-20250212    clang-16
powerpc64             randconfig-001-20250213    clang-21
powerpc64             randconfig-002-20250212    gcc-14.2.0
powerpc64             randconfig-002-20250213    clang-21
powerpc64             randconfig-003-20250212    gcc-14.2.0
powerpc64             randconfig-003-20250213    clang-21
riscv                             allnoconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250213    clang-21
riscv                 randconfig-002-20250213    clang-21
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250213    clang-21
s390                  randconfig-002-20250213    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250213    clang-21
sh                    randconfig-002-20250213    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250213    clang-21
sparc                 randconfig-002-20250213    clang-21
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250213    clang-21
sparc64               randconfig-002-20250213    clang-21
um                                allnoconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250213    clang-21
um                    randconfig-002-20250213    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250213    gcc-12
x86_64      buildonly-randconfig-002-20250213    gcc-12
x86_64      buildonly-randconfig-003-20250213    gcc-12
x86_64      buildonly-randconfig-004-20250213    gcc-12
x86_64      buildonly-randconfig-005-20250213    gcc-12
x86_64      buildonly-randconfig-006-20250213    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250213    clang-19
x86_64                randconfig-002-20250213    clang-19
x86_64                randconfig-003-20250213    clang-19
x86_64                randconfig-004-20250213    clang-19
x86_64                randconfig-005-20250213    clang-19
x86_64                randconfig-006-20250213    clang-19
x86_64                randconfig-007-20250213    clang-19
x86_64                randconfig-008-20250213    clang-19
x86_64                randconfig-071-20250213    gcc-12
x86_64                randconfig-072-20250213    gcc-12
x86_64                randconfig-073-20250213    gcc-12
x86_64                randconfig-074-20250213    gcc-12
x86_64                randconfig-075-20250213    gcc-12
x86_64                randconfig-076-20250213    gcc-12
x86_64                randconfig-077-20250213    gcc-12
x86_64                randconfig-078-20250213    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250213    clang-21
xtensa                randconfig-002-20250213    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

