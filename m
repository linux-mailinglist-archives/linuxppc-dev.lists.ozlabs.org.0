Return-Path: <linuxppc-dev+bounces-2073-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE469995CD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 01:40:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPmTz6Fznz3brN;
	Fri, 11 Oct 2024 10:40:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728603655;
	cv=none; b=G9QnnTX1fk6of1xoyp4Sa0qmC6ELs5sTUets4X2y6JXGXVT0DhZkcSo4F1+u4iXbo4JJeQmlgCY39H3EQ+YOYFZiLSF7thsjt7DO0QYJPZqAP8Xllst0II2r2MrqdmbXmur4cltbACU82XFaFQVUD75rGKX2zOx9/Sdn8wHhFJkmv7aT8foqAp/Eh4MO3SktfFWeVgyuwcm9ueUTuqTKkNjWYtHmqGpWcJMiJ2lZ/Iouiii8aCnwF5VXS06CGdF6Y7LNsmNnKNVBplAo+i1KGHnm+HNtX3KDFr+9UytyGvErSfBoRb5TDVP6XUF9HhgB9x7/rO9OogpFO9SD/hS+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728603655; c=relaxed/relaxed;
	bh=PXRDfWHQZarR5O9zeqIq2T4aPxYkzoGywRKeRNgDhAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V08FlHiLcaNJanO8VUsDilWvGv+wDRZj45rLtCOLar25DuIMmef75Mr/8O/P0Y+UAKiuE66emoo1Eig6ypK0JRILH47RVIwO8cfU+HmsOLcniXigtZ4wzeDaN28q7K63GjxjTc2SUw0PtDKSg61lWuAiET7RPfJzJkchCkFoWnPIeFtGVrj8o9go53YaHDVGkJw5b40s36/0xySDqD2pb4mgzb9LHcXwlGv1Ylj8MrngK0PvvmZuotQmnal5cI+mxoNXjECGYXdNW/mdQ5Y0bzoBuJibz/o6GcrGzb51sk+uIyyYjfkK6zvuipj6Rh0fsclYM504zaHl9v0V4hjv1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IAmYFP60; dkim-atps=neutral; spf=pass (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IAmYFP60;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPmTw6K21z3bmH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 10:40:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728603653; x=1760139653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iGGlFY2rrvyG4+iAA/qO6ZG9WmpdD1GQIKwf3ap0s6M=;
  b=IAmYFP60syUPW70VlW1/4QcBIIqrbGB3oD7K/1tw1dBJmuY95Ne2AGMH
   6MccYEfgurqvO4hsOemCaP2N/l2/kufXVqFvTJEIH/ok7TYckrqJfjBk+
   Cof/jyzov3Zis0BU2H4jtJ/XrMC4nvRUeDDs3U4RlNEn7loVcAJprHgcg
   +WtP5wkQkaAyz6xx36NEAELzTBO6mhJz4CrPJJRxH1FpLcPdCg1zWCZq1
   3NvmlYOG+TBFcZOKoCI0ww1HSjohLx5ULvSXKejx9HP/Z3ZfEUgG82Tc6
   8TpRoXm952sYYXlbH1T8UQNx1W66/ubHGgnb/R6YtRT3kjYtiNa4eGGsl
   Q==;
X-CSE-ConnectionGUID: DtxsC5c6QcG+MgjcLadSsg==
X-CSE-MsgGUID: DhbQUh11QsG7bucJSl6Gbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28081162"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="28081162"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 16:40:46 -0700
X-CSE-ConnectionGUID: HszBBIMRTr6Xau5a/ruJOA==
X-CSE-MsgGUID: yugHOdlDQkiylavkANyiSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="81347586"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Oct 2024 16:40:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz2lp-000BPx-04;
	Thu, 10 Oct 2024 23:40:37 +0000
Date: Fri, 11 Oct 2024 07:39:57 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] ftrace: Make ftrace_regs abstract from direct use
Message-ID: <202410110707.OaEI6wYh-lkp@intel.com>
References: <20241007204743.41314f1d@gandalf.local.home>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007204743.41314f1d@gandalf.local.home>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Steven,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20241004]
[cannot apply to s390/features arm64/for-next/core powerpc/next powerpc/fixes linus/master v6.12-rc2 v6.12-rc1 v6.11 v6.12-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/ftrace-Make-ftrace_regs-abstract-from-direct-use/20241008-084930
base:   next-20241004
patch link:    https://lore.kernel.org/r/20241007204743.41314f1d%40gandalf.local.home
patch subject: [PATCH] ftrace: Make ftrace_regs abstract from direct use
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241011/202410110707.OaEI6wYh-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410110707.OaEI6wYh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410110707.OaEI6wYh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/openrisc/include/generated/asm/ftrace.h:1,
                    from include/linux/ftrace.h:23,
                    from include/linux/perf_event.h:52,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from init/main.c:21:
>> include/asm-generic/ftrace.h:5: error: unterminated #ifndef
       5 | #ifndef __ASM_GENERIC_FTRACE_H__


vim +5 include/asm-generic/ftrace.h

38f5bf84bd588a GuanXuetao 2011-01-15 @5  #ifndef __ASM_GENERIC_FTRACE_H__
38f5bf84bd588a GuanXuetao 2011-01-15  6  #define __ASM_GENERIC_FTRACE_H__
38f5bf84bd588a GuanXuetao 2011-01-15  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

