Return-Path: <linuxppc-dev+bounces-546-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6628495FBC0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 23:34:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wt3q86jn0z2y2B;
	Tue, 27 Aug 2024 07:34:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724708084;
	cv=none; b=C1ra6YaQsnucWuFNtQGclLlhGChIXEO+YfXzgfa5Na+Gdh0fHPGZ3NzdYsKNiDIXbHpZu6tFtOLowA9UlhK+1juydDP4xBc+SP86rQ6mYr6YT8ZyLw5adNCouTR6Kc+piZaTeVhTGlOCzY302GTP2IM+O9FRh6E8mfki7POsIrJHfWvEa54uuSqMP5oV2s9g24ClYiwi5Nhii9lmb4nlUCBDy3bgjVvrxCEnZFR9n0oFtpgyp5lJCnhOu+9HM/zMZZb2Q1Lb5AuQHMk6gC/b8TMZqgAUXXEhQ3k7QHyWSUjCj/Q90IliHNFRmSEMx/Xfv7eSxoRJhRYY2Gz+DUSakA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724708084; c=relaxed/relaxed;
	bh=bZWi0sBVauqF3xYQQ7yr3PyIB/9JFhx2aXtLXo/icDI=;
	h=DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-IronPort-AV:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=M0ynF3ncIKBmScDdgte6QqJffFCA+PKgbhf7BXPcbKVF+JX/Sz88zd8yGN+Y1Kea/tFB8vxPNHw8nAMzEwz+jyF6TKYLs8si+dEn6dOmF1/Pdo7vXOwTd0hlPQccPZgKW/ecbrXprwMGur8pbbvqlhZd9UXk22dVtqmJvU7tI7U0LHvdesZ0ePY6Xyq2efAfTHHjDia9+3Y3cS1uEMOhT+Y4CzRRbeNG0u9kzfp0uUZrKS5zyHftP/w4jZU6hWOrwVgtyvextISF/Gm3rFMqMD4Gh0gXt4RF1EZljWMaYAVSH9ajESEMOVDx+Ra5E9Px65r2MKP0Ks+2GhPuN9qH1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UPQl6Gnq; dkim-atps=neutral; spf=pass (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UPQl6Gnq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wt3q70x7fz2xxm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 07:34:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724708083; x=1756244083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f6QVJ7gqPlOJSdYw6NwfRnwjtN71dpr2Yeva23qqdXQ=;
  b=UPQl6GnqEi/l77rMAtEGlPeTpVUOaeoA6Rx7MBaUrOVTcu62gP3blsI5
   34IKWgxKUuUES8HGOMMfc8HF3+0ByTDibex1UtFzOjheTk9fvWI9MUXL8
   PuQLuLMJcxosbkNefZTSyfgsBTWVdkZIZSNak4PAW6JCL/sJO8Z/Ya225
   CKucz9+8grL6P9JbZ9bg8DxZsAHqLsKBM/zO0lcYKduGQe34SY2lncDWE
   6Jj+h2AvtK6kMRXhwTGeAWE1ALKuYOGd7/qlfbRzC7TNsxF/NDxYckCfP
   6ZLzNb2ZvJXFOCSknDCcegOc6ZfnaA5UKDE78oZENERBj/eckhhU9OYrK
   Q==;
X-CSE-ConnectionGUID: JKBWUgjSQteuA+iHV37uYQ==
X-CSE-MsgGUID: 0MkeGpKqRJKYGZ0qG7WLfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23025217"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="23025217"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 14:34:36 -0700
X-CSE-ConnectionGUID: eZLAVeVBSbC/mqEo8Mbbug==
X-CSE-MsgGUID: QnvKqTknQ4GeCeBOqGKUpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="66801034"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Aug 2024 14:34:30 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sihM4-000Hcg-1d;
	Mon, 26 Aug 2024 21:34:28 +0000
Date: Tue, 27 Aug 2024 05:34:16 +0800
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
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 07/17] mm: Define VM_DROPPABLE for powerpc/32
Message-ID: <202408270553.2S5d14Ar-lkp@intel.com>
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
[also build test WARNING on powerpc/fixes shuah-kselftest/next shuah-kselftest/fixes linus/master v6.11-rc5 next-20240826]
[cannot apply to crng-random/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/asm-generic-unaligned-h-Extract-common-header-for-vDSO/20240826-103525
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/315e3a268b165b6edad7dcb723b0d8a506a56c4e.1724309198.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH v2 07/17] mm: Define VM_DROPPABLE for powerpc/32
config: um-randconfig-r122-20240826 (https://download.01.org/0day-ci/archive/20240827/202408270553.2S5d14Ar-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408270553.2S5d14Ar-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408270553.2S5d14Ar-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/debug_page_ref.c: note: in included file (through include/trace/events/page_ref.h):
>> include/trace/events/mmflags.h:168:5: sparse: sparse: undefined preprocessor identifier 'VM_DROPPABLE'
>> include/trace/events/mmflags.h:168:21: sparse: sparse: undefined preprocessor identifier 'VM_NONE'
   mm/debug_page_ref.c: note: in included file (through include/trace/events/page_ref.h, include/trace/define_trace.h, include/trace/events/page_ref.h):
>> include/trace/events/mmflags.h:168:5: sparse: sparse: undefined preprocessor identifier 'VM_DROPPABLE'
>> include/trace/events/mmflags.h:168:21: sparse: sparse: undefined preprocessor identifier 'VM_NONE'
   mm/debug_page_ref.c: note: in included file (through include/trace/events/page_ref.h, include/trace/trace_events.h, include/trace/define_trace.h, ...):
   include/trace/events/mmflags.h:169:10: sparse: sparse: preprocessor token IF_HAVE_VM_DROPPABLE redefined
   mm/debug_page_ref.c: note: in included file (through include/trace/events/page_ref.h):
   include/trace/events/mmflags.h:171:10: sparse: this was the original definition

vim +/VM_DROPPABLE +168 include/trace/events/mmflags.h

   167	
 > 168	#if VM_DROPPABLE != VM_NONE
   169	# define IF_HAVE_VM_DROPPABLE(flag, name) {flag, name},
   170	#else
   171	# define IF_HAVE_VM_DROPPABLE(flag, name)
   172	#endif
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

