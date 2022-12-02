Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D59063FD8A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 02:15:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNZkT1lvCz3cMs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 12:15:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g9OXswjM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g9OXswjM;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNZgc5j5nz3bdr
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 12:13:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669943581; x=1701479581;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/sdiNXryiTeFTbRvJvB6IK5xnYPIc/JoxWfb4ed3wJI=;
  b=g9OXswjMf8T+u6G2HRqa3ce88COvvtbJXOWMhXa5EDcXrcCoyQfvoKmL
   ELsEuaE1n1FRHJriapCat5bYEYQUXzsupj4ibFxXDfJQXzLYoDpuv/G8t
   SDzH/tW5ECxo4PhaDWidaERf8QcuxKejh08Jmo0gt3LPCm3w+4k3P7Cfq
   XxQxIlEJGfwb/0uMwhG+QwXtTIEnH453fJpt59RWvq4blSS8uJkGjBFDq
   fK5APmyrfKwX4/2kNc4ZMjQ2OO4wyX2gq3HzAp7np1lDMrcaExv88+5H5
   JvOy0VHIv9cHVAXK7kMYmBISwUVHgllFtUOq/qnYR23Gg6Jqo+IvgbURG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="299211447"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; 
   d="scan'208";a="299211447"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2022 17:12:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="708292993"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; 
   d="scan'208";a="708292993"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Dec 2022 17:12:49 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p0ubg-000D64-36;
	Fri, 02 Dec 2022 01:12:48 +0000
Date: Fri, 02 Dec 2022 09:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD REGRESSION
 3604661f206238a0295df53e38b7986a91c00cc4
Message-ID: <63895102.kcGIRx6yG2wDv9HT%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 3604661f206238a0295df53e38b7986a91c00cc4  Merge branch 'topic/qspinlock' into next

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202212020435.DR1CHxrP-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

lockdep.c:(.text.lockdep_register_key+0x174): undefined reference to `queued_spin_lock_slowpath'
rtas.c:(.text.lock_rtas+0xc0): undefined reference to `queued_spin_lock_slowpath'
rtas.c:(.text.rtas_give_timebase+0xd0): undefined reference to `queued_spin_lock_slowpath'
rtas.c:(.text.rtas_take_timebase+0xc4): undefined reference to `queued_spin_lock_slowpath'
traps.c:(.text.oops_begin+0x10c): undefined reference to `queued_spin_lock_slowpath'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- powerpc-allmodconfig
    |-- lockdep.c:(.text.lockdep_register_key):undefined-reference-to-queued_spin_lock_slowpath
    |-- rtas.c:(.text.lock_rtas):undefined-reference-to-queued_spin_lock_slowpath
    |-- rtas.c:(.text.rtas_give_timebase):undefined-reference-to-queued_spin_lock_slowpath
    |-- rtas.c:(.text.rtas_take_timebase):undefined-reference-to-queued_spin_lock_slowpath
    `-- traps.c:(.text.oops_begin):undefined-reference-to-queued_spin_lock_slowpath

elapsed time: 726m

configs tested: 50
configs skipped: 2

gcc tested configs:
arc                                 defconfig
powerpc                           allnoconfig
alpha                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
s390                             allmodconfig
s390                                defconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
m68k                             allyesconfig
s390                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
ia64                             allmodconfig
x86_64                               rhel-8.3
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
arc                  randconfig-r043-20221201
riscv                randconfig-r042-20221201
s390                 randconfig-r044-20221201
i386                          randconfig-a003
x86_64                            allnoconfig
i386                          randconfig-a001
i386                          randconfig-a005
i386                             allyesconfig
i386                                defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016

clang tested configs:
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
hexagon              randconfig-r041-20221201
hexagon              randconfig-r045-20221201
i386                          randconfig-a004
i386                          randconfig-a002
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
