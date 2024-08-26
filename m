Return-Path: <linuxppc-dev+bounces-531-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F4395EE35
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 12:14:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsmjn69N2z2yHs;
	Mon, 26 Aug 2024 20:14:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724667245;
	cv=none; b=AqqtqnrRESKIcBAmvyQqwt8BhB6JTEa4XpjaXCV0f02E6LWZ4nDyNWIkoU6UFPrA0efkLbGaTz4jGlIC+o8RAccWwBTG5pFZ3AK/p6nYVmm+u2yxDJUa9uOEoG8cKRLK0cPoeVYF747pAz90c+NB/K41Pk0ySjyVQql8ecCkxl9y0kU9CrMC9YWilsV68bF/U+WALKE+Zhz6CVa2qPJ9aw+xoq89J70gTZZsWDgaX1e0eOudHDuwpcxeL2UoSeEZF6Iy+n80mGEp1zZMFQZaQ0eFpT3m80Q28NR8dZ6QpGahD7ekD/0UiXilWIP+sQG8yEtbtBtaEgiqrzcB3WQGvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724667245; c=relaxed/relaxed;
	bh=vJySdW5ihSZTUDOeVTzEi0Tigjxes51LIsI0vnT4hoE=;
	h=DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-IronPort-AV:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=m8tXL955ZXqz/lgqnNBI5u4Txn/jHVQCZEn8NI3c4ofZTamAHGgQpXLejksOTMETCPPZ/5zCYLO25Bb32Ypw9bWx6dU7s8glNuL7iUmUsnxdEXg+jx1Pg4OmcLTIBLv2I9G2b/UhXuZr/CPDj1Tc7VVrnp4Z3CMw8QANo/OGqBCxUwx7reiMU+wSjm4jn1psy6tP4kfEShrcxFOYy7MFeLNuWyfKTyrub6J/yOKOwVMdNw1wdZiDnsds34+go+Fjx/cyH4uwtXGd+bngN+tccpfU6n+LmEqjQRYyANiy2YHb1vPKLverS5BZJlzyAPxGnRblgcJqE8O48ewoGXfWbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TJfpWGQI; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TJfpWGQI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsmjm14WMz2xfb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 20:14:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724667244; x=1756203244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3OMh0I6YDGa+H54lyN0aZeKV/jasJN3FKzzG5FqwCZc=;
  b=TJfpWGQIvlFllLJGhGOzPGObmtOmVOnkf7kOA2pSwh5plBhAC50F6Lq0
   0WQOGGrzVvIw0MZyk4nyv1wcmfGuOlsR9wpExLC+omtla7X7AnlQX4RwJ
   U4hjAXqVeCTMqAAAaXQcGHtW+2eCP0TT5kLw8HFVm5CGmnvJeWik+8HM6
   qhCTd69eBLpdhKRkHFr9nBEOSYY4c+yU1mO4TPAazyrNU03GVkUro+Vrs
   m2Bs1SHGWKILNs/d0nthcDiXOKMtzXgrhoAwP3VwZ4Lnx/svgwShNLO8i
   YQBI9rwkLZtBCz56hySpJgt7OvkIsMbrY6ic83R90Bdj3GlSN9uEP/oH5
   A==;
X-CSE-ConnectionGUID: w1lRSj3uRfGFbwY3i4VvbQ==
X-CSE-MsgGUID: InB9bOtvQO6dVNQEd2ybyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="23257021"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="23257021"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 03:13:58 -0700
X-CSE-ConnectionGUID: j2hGswy3Tqa//Z8Y2y8Osg==
X-CSE-MsgGUID: FKbHAQ2HT1Woa5mT7v3qTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="62437513"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Aug 2024 03:13:53 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siWjO-000GsF-2m;
	Mon, 26 Aug 2024 10:13:50 +0000
Date: Mon, 26 Aug 2024 18:13:45 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 07/17] mm: Define VM_DROPPABLE for powerpc/32
Message-ID: <202408261734.UAvnH7Mv-lkp@intel.com>
References: <315e3a268b165b6edad7dcb723b0d8a506a56c4e.1724309198.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <315e3a268b165b6edad7dcb723b0d8a506a56c4e.1724309198.git.christophe.leroy@csgroup.eu>

Hi Christophe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes shuah-kselftest/next shuah-kselftest/fixes linus/master v6.11-rc5 next-20240823]
[cannot apply to crng-random/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/asm-generic-unaligned-h-Extract-common-header-for-vDSO/20240826-103525
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/315e3a268b165b6edad7dcb723b0d8a506a56c4e.1724309198.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH v2 07/17] mm: Define VM_DROPPABLE for powerpc/32
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240826/202408261734.UAvnH7Mv-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408261734.UAvnH7Mv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408261734.UAvnH7Mv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/debug_page_ref.c:6:
   In file included from include/trace/events/page_ref.h:11:
   include/trace/events/mmflags.h:168:5: warning: 'VM_DROPPABLE' is not defined, evaluates to 0 [-Wundef]
     168 | #if VM_DROPPABLE != VM_NONE
         |     ^
   include/trace/events/mmflags.h:168:21: warning: 'VM_NONE' is not defined, evaluates to 0 [-Wundef]
     168 | #if VM_DROPPABLE != VM_NONE
         |                     ^
   In file included from mm/debug_page_ref.c:6:
   In file included from include/trace/events/page_ref.h:135:
   In file included from include/trace/define_trace.h:95:
   In file included from include/trace/events/page_ref.h:11:
   include/trace/events/mmflags.h:168:5: warning: 'VM_DROPPABLE' is not defined, evaluates to 0 [-Wundef]
     168 | #if VM_DROPPABLE != VM_NONE
         |     ^
   include/trace/events/mmflags.h:168:21: warning: 'VM_NONE' is not defined, evaluates to 0 [-Wundef]
     168 | #if VM_DROPPABLE != VM_NONE
         |                     ^
   In file included from mm/debug_page_ref.c:6:
   In file included from include/trace/events/page_ref.h:135:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:94:
   In file included from include/trace/events/page_ref.h:11:
>> include/trace/events/mmflags.h:169:10: warning: 'IF_HAVE_VM_DROPPABLE' macro redefined [-Wmacro-redefined]
     169 | # define IF_HAVE_VM_DROPPABLE(flag, name) {flag, name},
         |          ^
   include/trace/events/mmflags.h:171:10: note: previous definition is here
     171 | # define IF_HAVE_VM_DROPPABLE(flag, name)
         |          ^
   5 warnings generated.


vim +/IF_HAVE_VM_DROPPABLE +169 include/trace/events/mmflags.h

7677f7fd8be766 Axel Rasmussen     2021-05-04  167  
41e2c674b334ed Christophe Leroy   2024-08-22 @168  #if VM_DROPPABLE != VM_NONE
9651fcedf7b92d Jason A. Donenfeld 2022-12-08 @169  # define IF_HAVE_VM_DROPPABLE(flag, name) {flag, name},
9651fcedf7b92d Jason A. Donenfeld 2022-12-08  170  #else
9651fcedf7b92d Jason A. Donenfeld 2022-12-08  171  # define IF_HAVE_VM_DROPPABLE(flag, name)
9651fcedf7b92d Jason A. Donenfeld 2022-12-08  172  #endif
9651fcedf7b92d Jason A. Donenfeld 2022-12-08  173  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

