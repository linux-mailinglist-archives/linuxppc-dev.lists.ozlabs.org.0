Return-Path: <linuxppc-dev+bounces-4124-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B4A9F1C88
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2024 05:31:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y9Cvb1ZZDz2yRP;
	Sat, 14 Dec 2024 15:31:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734150683;
	cv=none; b=U9GXV6W9r/t7RjgmWk7r+zh1ZUVzpG7sWpy+ujBuARGc+qORPdpFI4qriTSoAVhtdyanFnTni3yKYZDhQA0RY6xw47/PeS0qgO3sh6c0mHIAJO2Q68gGjU+uYq3ZXdNrwc3HQrjbW8jnfM76ysrkJKbC9Q45qkRQLDMeEZWfaJMIFqpMQH10yB5kDAN04bpbx6rp2Y9GkD0/yQ5ZZTbdEeXGGigm3quUV/Jg6BFgFmYLVaQHOfkLjWTYS8HT7gBlIa4bMUeq16lPosoQIIYKh//dO9Pu9m4dKpeNDyydIGMKV0LQUcAc0O4+1hZGwqH9CPiMeKMvI4vHb/8WQ3lu8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734150683; c=relaxed/relaxed;
	bh=92B/Xm+Qj1hFa62gI5zPBSr7q1WkE9flRF7+7BdPYuk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TX6vsVgzxmOkotyVzVK0XPPkkP3Jo987K9R4aSGiDFAtkY+YLuhhqVK1/PpuuJWLUt54TM2qTlqB3wZRt/TJvXqkd4J216e/V5jxXUUyb/h9qgHagbyd2TY/Oho/pKUqf64CjZD0dD4u+MJxNajqg/WslfVmu1805piPF3fWs3a+2MhAfK4sJJ4gMNCTQ+xRerqREoAXYxn7NEjwBDHYHgl3K5WxgfBRaeG5v7WlERjTQAnGGAOhN6gkSsTEJCYS1yUatKEY75XFI6mb+oWuyiC9GSRXllIVRlLZPPOjB2EOruY1nMU6/c8uAJpKzjFYva0kq0F6vNHnH1lQtqHtrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FJZQ22AH; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FJZQ22AH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y9CvY6Mjjz2yF7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2024 15:31:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734150682; x=1765686682;
  h=date:from:to:cc:subject:message-id;
  bh=eLfwkfbrpUj5rSil3zW+kf0sfZYwt/+kA3hh/hbJd4g=;
  b=FJZQ22AH5bKc6hfG1E66SpXalCCSpEjWUTyLBlC3kA/IsBe0fmCxk5gL
   MSGqn06dC/uJEjIKdIz2kglo8VuPPsIRlX/qUn9CxVZnJ8UTvm8hU3ee6
   uxXC6nIylgdc+7JBDlS84c4ZjbZXRQ0/qaD1+15pgkWPmqOWOjI+LmFT8
   hLPGl0XQ828Ym1jdiCHtjrddt0PLlmkgSXAhh6AiLz6Z/1q3hUAQYxR6I
   Jb1Uyf1t3TxlO8q6275IMdl/mcTcXpEBUbHya5G1eiOHPfy8OToB0qXuA
   v1Rt6JUnZ6bE+DpEJCDpavvA2ERtNUCXEI/vKzgqr288+DV7JgBsEpJL0
   Q==;
X-CSE-ConnectionGUID: y6SX+jxeT2CXpBN2oACOeA==
X-CSE-MsgGUID: gcAIwHrtRl2DQxcg6Bs9BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="52129779"
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="52129779"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 20:31:19 -0800
X-CSE-ConnectionGUID: mF/nnQkGRwq2SbBgyYFLaw==
X-CSE-MsgGUID: b4UecHbpROWOei3nsfjVIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97149192"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Dec 2024 20:31:18 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMJoB-000Chr-2G;
	Sat, 14 Dec 2024 04:31:15 +0000
Date: Sat, 14 Dec 2024 12:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next-test] BUILD SUCCESS
 f117051514c33c43b7e0c517e0ae9e0189e884da
Message-ID: <202412141252.gRfH1i3v-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: f117051514c33c43b7e0c517e0ae9e0189e884da  scsi/cxlflash: Deprecate driver

elapsed time: 1465m

configs tested: 64
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20241213    gcc-13.2.0
arc                  randconfig-002-20241213    gcc-13.2.0
arm                  randconfig-001-20241213    clang-16
arm                  randconfig-002-20241213    clang-18
arm                  randconfig-003-20241213    gcc-14.2.0
arm                  randconfig-004-20241213    clang-18
arm64                randconfig-001-20241213    gcc-14.2.0
arm64                randconfig-002-20241213    gcc-14.2.0
arm64                randconfig-003-20241213    clang-18
arm64                randconfig-004-20241213    gcc-14.2.0
csky                 randconfig-001-20241213    gcc-14.2.0
csky                 randconfig-002-20241213    gcc-14.2.0
hexagon              randconfig-001-20241213    clang-20
hexagon              randconfig-002-20241213    clang-20
i386       buildonly-randconfig-001-20241213    clang-19
i386       buildonly-randconfig-002-20241213    gcc-12
i386       buildonly-randconfig-003-20241213    gcc-12
i386       buildonly-randconfig-004-20241213    clang-19
i386       buildonly-randconfig-005-20241213    gcc-12
i386       buildonly-randconfig-006-20241213    gcc-12
loongarch            randconfig-001-20241213    gcc-14.2.0
loongarch            randconfig-002-20241213    gcc-14.2.0
m68k                       m5407c3_defconfig    gcc-14.2.0
nios2                randconfig-001-20241213    gcc-14.2.0
nios2                randconfig-002-20241213    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20241213    gcc-14.2.0
parisc               randconfig-002-20241213    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20241213    gcc-14.2.0
powerpc              randconfig-002-20241213    clang-20
powerpc              randconfig-003-20241213    gcc-14.2.0
powerpc64            randconfig-001-20241213    gcc-14.2.0
powerpc64            randconfig-002-20241213    gcc-14.2.0
powerpc64            randconfig-003-20241213    gcc-14.2.0
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20241213    gcc-14.2.0
riscv                randconfig-002-20241213    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-20
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20241213    gcc-14.2.0
s390                 randconfig-002-20241213    clang-19
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20241213    gcc-14.2.0
sh                   randconfig-002-20241213    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20241213    gcc-14.2.0
sparc                randconfig-002-20241213    gcc-14.2.0
sparc64              randconfig-001-20241213    gcc-14.2.0
sparc64              randconfig-002-20241213    gcc-14.2.0
um                               allnoconfig    clang-18
um                   randconfig-001-20241213    gcc-12
um                   randconfig-002-20241213    clang-16
x86_64     buildonly-randconfig-001-20241213    gcc-12
x86_64     buildonly-randconfig-002-20241213    gcc-12
x86_64     buildonly-randconfig-003-20241213    gcc-12
x86_64     buildonly-randconfig-004-20241213    gcc-12
x86_64     buildonly-randconfig-005-20241213    gcc-12
x86_64     buildonly-randconfig-006-20241213    clang-19
xtensa               randconfig-001-20241213    gcc-14.2.0
xtensa               randconfig-002-20241213    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

