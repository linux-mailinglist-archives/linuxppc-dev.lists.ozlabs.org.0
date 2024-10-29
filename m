Return-Path: <linuxppc-dev+bounces-2688-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E7D9B4FF3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 17:57:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdGdq0FCTz2yY0;
	Wed, 30 Oct 2024 03:57:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730221054;
	cv=none; b=BchgtGvEGVfMUbD/GtLGy4yT+u/71htof42xEZkMSiIm8x3NGeAFpzti1I+NLVzcEq4f0pR08JZ9wFSlrH7Bd0HZT3mRLbvm0QH9LD4TGaY/VZLmV0saPMjRsmT4M9OhJyTwN9LvbOg6uk816cVlzMirs4AU6nec383W/namQQwxFzBK1wnKRO2fmxmSr+3XuSLqjEP81xdfFP8Mi8u1kL7PNZ081KNrUMHdT1CHbU4s8wZgssIvgRHD4Xonn65kjZgSVcg/r5FMJjhzZE0KCB+xXwXPqe2i5ZwigF/yxBUS5UL9TxsZSF8AiWccj76N+C3/E7QMV71RhYXhJBI3FA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730221054; c=relaxed/relaxed;
	bh=WrGZOKUjRc+2pcLK32A/65sDR1Y1URfA+MqUgtN9IhY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gYDHCQVnaN9JfPF5WFfgdHalWYKEp7km+6oE+Rb89ebSfANnLbKchInVAp0SX6Vb/2cWuxxjFR5WfjVaByU7qkwrzk+PcWR/nRcKWzNQNNCYgl//tEkOF4Zm6cyZlKh9sqclChodxi7u5ZVNg4Tqa+yJWdue0PjrTVY+LIgF1mBc6O/JO6SfbXxQHN64isNFmdaQU2CHtDX1ufJunNh2iPjfTz1i9BQ3gBUfcRwftiqj9U5VmqRiyz//Lqrb7pR0j9BYXvlb9QbdQXwUOvn5xuphfLQGki7Z8nYbtWp9lS/deOvw1/KXsl4MrGV00bFqHO5FhuhEEJPDo6PhPW27Ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GN43dFgc; dkim-atps=neutral; spf=pass (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GN43dFgc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdGdm2K9Dz2yXm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 03:57:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730221052; x=1761757052;
  h=date:from:to:cc:subject:message-id;
  bh=Vw0fe1TBXYx4XXB+j0K2Pl6ePWLjD0kC4iE89ZtoboI=;
  b=GN43dFgcIpArRJZZGL6I6ELGDdZpwJt7Eh+7/kRN7FIA2E2PcZNOq3lT
   7LsvQSlpBfmomU/jsALHhzytjScpaZOMG4cg3UG3s9qXmzNCPndtFCvDi
   IIUxS7BTLoslcAXIxbDP9mE9jxql9Ee+3DC+GnmiCxnpuSGHC18+uTxju
   xOMN+9zDR7T98vF6iOid44gY3gSR9DD27dxEdYzu5Eed1KTjwaexz3GSX
   E0LLVc3f14fCWVCz21gKa2g7iZL8DBDK+GQHc4DBr7mQYt2QYyJN2702q
   7E5y9q6CBDj8GntqZbv5R3hJSuEl7MWosIskmFWekO8ug37BCF+qM0ElG
   w==;
X-CSE-ConnectionGUID: 29CvBkDcRQWInE2NymxBWQ==
X-CSE-MsgGUID: m6uGlg+GQoybwOM+jDczvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="41279305"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="41279305"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 09:57:21 -0700
X-CSE-ConnectionGUID: U4HHBEu5Rq6YkHJgYnLUVw==
X-CSE-MsgGUID: PGy6k3NuQna1Bzex5uRCbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="86796769"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Oct 2024 09:57:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5pWt-000duu-2m;
	Tue, 29 Oct 2024 16:57:15 +0000
Date: Wed, 30 Oct 2024 00:56:39 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 f2535cf29e1a1aa8ffb1690e1d6257b48af2b21a
Message-ID: <202410300030.PBLucSPY-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
branch HEAD: f2535cf29e1a1aa8ffb1690e1d6257b48af2b21a  Automatic merge of 'next' into merge (2024-10-29 13:24)

elapsed time: 833m

configs tested: 65
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha          allnoconfig    gcc-14.1.0
alpha         allyesconfig    clang-20
arc           allmodconfig    clang-20
arc            allnoconfig    gcc-14.1.0
arc           allyesconfig    clang-20
arm           allmodconfig    clang-20
arm            allnoconfig    gcc-14.1.0
arm           allyesconfig    clang-20
arm64         allmodconfig    clang-20
arm64          allnoconfig    gcc-14.1.0
csky           allnoconfig    gcc-14.1.0
hexagon       allmodconfig    clang-20
hexagon        allnoconfig    gcc-14.1.0
hexagon       allyesconfig    clang-20
i386          allmodconfig    clang-19
i386          allmodconfig    gcc-12
i386           allnoconfig    clang-19
i386           allnoconfig    gcc-12
i386          allyesconfig    clang-19
i386          allyesconfig    gcc-12
i386             defconfig    clang-19
loongarch     allmodconfig    gcc-14.1.0
loongarch      allnoconfig    gcc-14.1.0
m68k          allmodconfig    gcc-14.1.0
m68k           allnoconfig    gcc-14.1.0
m68k          allyesconfig    gcc-14.1.0
microblaze    allmodconfig    gcc-14.1.0
microblaze     allnoconfig    gcc-14.1.0
microblaze    allyesconfig    gcc-14.1.0
mips           allnoconfig    gcc-14.1.0
nios2          allnoconfig    gcc-14.1.0
openrisc       allnoconfig    clang-20
openrisc      allyesconfig    gcc-14.1.0
parisc        allmodconfig    gcc-14.1.0
parisc         allnoconfig    clang-20
parisc        allyesconfig    gcc-14.1.0
powerpc       allmodconfig    gcc-14.1.0
powerpc        allnoconfig    clang-20
powerpc       allyesconfig    gcc-14.1.0
riscv         allmodconfig    gcc-14.1.0
riscv          allnoconfig    clang-20
riscv         allyesconfig    gcc-14.1.0
s390          allmodconfig    clang-20
s390          allmodconfig    gcc-14.1.0
s390           allnoconfig    clang-20
s390          allyesconfig    gcc-14.1.0
sh            allmodconfig    gcc-14.1.0
sh             allnoconfig    gcc-14.1.0
sh            allyesconfig    gcc-14.1.0
sparc         allmodconfig    gcc-14.1.0
um            allmodconfig    clang-20
um             allnoconfig    clang-20
um            allyesconfig    clang-20
x86_64         allnoconfig    clang-19
x86_64        allyesconfig    clang-19
x86_64           defconfig    clang-19
x86_64           defconfig    gcc-11
x86_64               kexec    clang-19
x86_64               kexec    gcc-12
x86_64            rhel-8.3    gcc-12
x86_64        rhel-8.3-bpf    clang-19
x86_64      rhel-8.3-kunit    clang-19
x86_64        rhel-8.3-ltp    clang-19
x86_64       rhel-8.3-rust    clang-19
xtensa         allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

