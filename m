Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3AF4805F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 05:32:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JNM8N4Kfwz3c65
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 15:32:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GEydf/Cb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GEydf/Cb; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNM7j15Qxz2yV7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Dec 2021 15:31:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640665921; x=1672201921;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=IKeaJLl6EQ4rLbj1rQZgbi5UOCp8h3qCZnj6nKvpDpw=;
 b=GEydf/CbswIcQ18rG5lzh8zrOiY35Ocn0IX8eRDg8B9DeE3xMks61Yh2
 LKNVbOgMotNpAwLgGVF/qgbO1acYexb3ypZ4055Ja3SBJyHpbiNqe3pQ9
 85lnA9xyucRl+wHYtFOiuUtewJftYnpx00yuvMAEAyLpdAY5wgaOjD+8F
 Ur1EGnRTa7lIBQyBMmToIyIQEOiO4jElJI49lxfiYVtMPNjqpdlYDAUlo
 lSHABAofOnAYUvPibdwpm/GWBGSRDL8zIC5BFnKYDsWRAR9d/VO1GvWH2
 oMHm9t6jbluKFoNRbtePvbgLrE3RXZGtBNEfeW9rEFgET0V0Qpb4wtarw w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="241524382"
X-IronPort-AV: E=Sophos;i="5.88,241,1635231600"; d="scan'208";a="241524382"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2021 20:30:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,241,1635231600"; d="scan'208";a="468033883"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 27 Dec 2021 20:30:50 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n248P-0007EI-Be; Tue, 28 Dec 2021 04:30:49 +0000
Date: Tue, 28 Dec 2021 12:30:11 +0800
From: kernel test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: [powerpc:next-test 127/179] include/linux/compiler_types.h:335:45:
 error: call to '__compiletime_assert_34' declared with attribute error:
 BUILD_BUG failed
Message-ID: <202112281204.Rr4j6o5h-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   beeac538c366cd2828092adecd1edab28326c55b
commit: 0faf20a1ad1647c0fc0f5a367c71e5e84deaf899 [127/179] powerpc/64s/interrupt: Don't enable MSR[EE] in irq handlers unless perf is in use
config: powerpc-randconfig-r021-20211227 (https://download.01.org/0day-ci/archive/20211228/202112281204.Rr4j6o5h-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=0faf20a1ad1647c0fc0f5a367c71e5e84deaf899
        git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
        git fetch --no-tags powerpc next-test
        git checkout 0faf20a1ad1647c0fc0f5a367c71e5e84deaf899
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   arch/powerpc/include/asm/hw_irq.h: In function 'do_hard_irq_enable':
>> include/linux/compiler_types.h:335:45: error: call to '__compiletime_assert_34' declared with attribute error: BUILD_BUG failed
     335 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:316:25: note: in definition of macro '__compiletime_assert'
     316 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:335:9: note: in expansion of macro '_compiletime_assert'
     335 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/hw_irq.h:483:9: note: in expansion of macro 'BUILD_BUG'
     483 |         BUILD_BUG();
         |         ^~~~~~~~~


vim +/__compiletime_assert_34 +335 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  321  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  322  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  323  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  324  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  325  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  326   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  327   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  328   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  329   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  330   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  331   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  332   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  333   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  334  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @335  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  336  

:::::: The code at line 335 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
