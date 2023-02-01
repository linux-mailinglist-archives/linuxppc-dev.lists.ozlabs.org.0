Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CCC685C29
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 01:29:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P62qG2wv1z3cfB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 11:29:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nVnnqVa+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nVnnqVa+;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P62pL0xL8z3bhx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 11:28:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675211322; x=1706747322;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HrhAGtIJd788n5n1e2K0hj/AG50esvEDB4w6/+ljcD8=;
  b=nVnnqVa+ZEN6bLs4eNiQmU6XE7rWpB6lVQeXOCCaMo7188dQKDKTzGAn
   IUmCt3JhyVZVnRsYOmfzBtsQX3HOF2Hg11FyBHrHFPv4X37tg3vWX4UBU
   y2flmV9pwiV2/DSfIPgKUBNBOKuF8rr+n4+oOENqMBvS1S3ZDY6FYI1TO
   wJUqwSNGE1IdS2V29tClMpGu+Ly0eEFiTJRr+r3w1yisqCHfK+JDsxU3u
   cJlzu878XXQs9Ef3XBXGTxMbT5Luma6ja7O7vqeQ9DeMrCYLguEVn8aBG
   /VmHU78tH9V6fNpoq5FsWpXMxF/NNjdSgaK7N9p+N9IDsO0IFGGkYOWme
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="308345053"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="308345053"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 16:28:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="910108007"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="910108007"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 31 Jan 2023 16:28:33 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN0zI-0004qI-1B;
	Wed, 01 Feb 2023 00:28:32 +0000
Date: Wed, 01 Feb 2023 08:28:19 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 37e5bf9657c8af85b91dda79c14eee5b7e0406d7
Message-ID: <63d9b223.o6BR3YA/7nNtKtlv%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 37e5bf9657c8af85b91dda79c14eee5b7e0406d7  powerpc/64s: Reconnect tlb_flush() to hash__tlb_flush()

elapsed time: 745m

configs tested: 69
configs skipped: 106

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig
i386                 randconfig-a003-20230130
i386                 randconfig-a001-20230130
i386                 randconfig-a004-20230130
i386                 randconfig-a006-20230130
i386                 randconfig-a002-20230130
i386                 randconfig-a005-20230130
x86_64                    rhel-8.3-kselftests
arc                              allyesconfig
i386                             allyesconfig
i386                                defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                            allnoconfig
ia64                             allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
sh                               allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64               randconfig-a006-20230130
x86_64               randconfig-a004-20230130
x86_64               randconfig-a005-20230130
x86_64               randconfig-a002-20230130
x86_64               randconfig-a001-20230130
x86_64               randconfig-a003-20230130
arm                                 defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64                          rhel-8.3-func
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arm                              allyesconfig
i386                          randconfig-c001

clang tested configs:
hexagon              randconfig-r045-20230130
s390                 randconfig-r044-20230130
riscv                randconfig-r042-20230129
hexagon              randconfig-r041-20230129
hexagon              randconfig-r045-20230129
hexagon              randconfig-r041-20230130
riscv                randconfig-r042-20230130
s390                 randconfig-r044-20230129
x86_64               randconfig-a014-20230130
x86_64               randconfig-a015-20230130
x86_64               randconfig-a016-20230130
x86_64               randconfig-a013-20230130
x86_64               randconfig-a011-20230130
x86_64               randconfig-a012-20230130
i386                 randconfig-a014-20230130
i386                 randconfig-a013-20230130
i386                 randconfig-a015-20230130
i386                 randconfig-a016-20230130
i386                 randconfig-a012-20230130
i386                 randconfig-a011-20230130
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
