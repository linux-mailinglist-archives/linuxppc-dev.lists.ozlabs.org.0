Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 287EE8C808B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 07:07:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ok1b98yt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgZhN53z7z3cCt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 15:07:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ok1b98yt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgZgc53Z3z2yvv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 15:06:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715922397; x=1747458397;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iAeXwU+FDcTMei3N8LOX/9KrK4aB9Laf5Ujy5EX2FGo=;
  b=Ok1b98yt0NjjcEO5GDI7Px8jSEWmfAA+aqDbfGiuPI76pdFoauXk9mYz
   uoGjh0N1Ccg3sk5oZ3Wk0u2BfYi24DhfPIcUVF1XJ1jvDVce/fFvr1Mfd
   1oJ6gKVtDsuwszcfoEjbYlva9rG0rQ+9Bqepc5KmKrea/sxVDOs4vxu44
   U/EU6r+4H+P9ndmQ4TluelhBwdL7aGNtdMX4BRolj8jCgD0KHrCJ5E/WL
   tRaP2mq49Wqbh/QygKldlToiUgUiqMJLvIz1/sze+CrsuqpHBfr38ULm+
   kWSXhIGmF7yK8nKwrYOpEbl3RTtMlaklwP2+oUvtIuj1Rj5U9Shs0/4Zx
   A==;
X-CSE-ConnectionGUID: r6L5HC2zTDa+fuu8p3tK+g==
X-CSE-MsgGUID: qQPBKZQLRxKvsOr/taKFHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="34592858"
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="34592858"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 22:06:20 -0700
X-CSE-ConnectionGUID: g3J3dyehStKB3UGgLDqV9w==
X-CSE-MsgGUID: BfJyx6y1TWCjKfqqpHqoPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="69129355"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 May 2024 22:06:19 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7pmu-0000Eo-2g;
	Fri, 17 May 2024 05:06:03 +0000
Date: Fri, 17 May 2024 12:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Dubey <adubey@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] PowerPC: Replace kretprobe with rethook
Message-ID: <202405171203.CasoixJG-lkp@intel.com>
References: <20240516134646.1059114-1-adubey@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516134646.1059114-1-adubey@linux.ibm.com>
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
Cc: llvm@lists.linux.dev, npiggin@gmail.com, Abhishek Dubey <adubey@linux.ibm.com>, mhiramat@kernel.org, oe-kbuild-all@lists.linux.dev, naveen.n.rao@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Abhishek,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.9 next-20240516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhishek-Dubey/PowerPC-Replace-kretprobe-with-rethook/20240516-214818
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20240516134646.1059114-1-adubey%40linux.ibm.com
patch subject: [PATCH] PowerPC: Replace kretprobe with rethook
config: powerpc-asp8347_defconfig (https://download.01.org/0day-ci/archive/20240517/202405171203.CasoixJG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405171203.CasoixJG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405171203.CasoixJG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: arch_rethook_trampoline
   >>> referenced by stacktrace.c
   >>>               arch/powerpc/kernel/stacktrace.o:(arch_stack_walk_reliable) in archive vmlinux.a
   >>> referenced by stacktrace.c
   >>>               arch/powerpc/kernel/stacktrace.o:(arch_stack_walk_reliable) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
