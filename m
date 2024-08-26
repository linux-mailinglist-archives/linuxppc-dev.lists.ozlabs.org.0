Return-Path: <linuxppc-dev+bounces-528-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5C295EDC2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 11:54:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsmGk1jk4z2yDs;
	Mon, 26 Aug 2024 19:54:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724666046;
	cv=none; b=c0B/OoIBXSTEWDCxFXBtpAQfcXoKUzbkm5t0guYiiS+h28fiFlH5QrZLZVTLPOP0JepgyuFbGNfYuo2Xd54M10SZLQAqFg2l2e3pEPBMEzSxxqduyJuI3kGwZlW9pur41Ew5XOoLj6pN6/70pfVBg2Zs9rawiu6R2VFZtAbd7mQfyh+U6hmXUd0E8r1kZm2pvGWyQy6Pg3xTdSY5kLBZ6yQ6Zm7WaUrtnIrmafezuIAUNd1EPg06bPJUfDwnvQWyqbrcT9PIhE3hcjZNx4ZwUGrkVdrKGttO/JoO9kSVycaPWm27Ie29M5C27RS1vlJ6NJ2vguOVVR+twG/dmB3QSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724666046; c=relaxed/relaxed;
	bh=H3kzh6l/AbeSVjK0SL1Y8MRSQ2X5wXqeHMrpvFdyPY4=;
	h=DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-IronPort-AV:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MjUX8QYiVeHKKbVpnCxdh1j+1pZQrE+FrrA0Lu6wx9gswvLY9dU547noG8gEfafY0ojwuBe5uPw51LZ1O2DI4XnrT8A+xrUvZrVH2WslyPWNVqK+48T5nyGCMBkLrV307kImsk847+hdFNJd4/6HVUXD0UpDn8tft0noeSF9POgimotxInTbXuLfMZYRP7iJfGhfE+dr2p2B3hesm9oKNeB9gqkwLBCjzRRvGbufCwLqJZGVls5LZ+vietd9zAAAP31hdiuQPWjkB019hJ6C7MekBmgaVMChwGhcgE4eIaMfKDPUCIaupuQN2Qzm85zeuAG07357dXlRwIVXg8VQgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G99CtR7j; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G99CtR7j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsmGh4sr8z2yDj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 19:54:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724666045; x=1756202045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vcYdnQgyCRay33ToVuzJbo8c+h90tN2Lwg3BJDUr05I=;
  b=G99CtR7jngrqlpYDI7N+yZSAJazIxKltaEHjxu/lPTk4j25Wz0qb6QeU
   Ku1NJkrYzU+iBH1krFbW/QUHkg6etmOyuB/gRcWRUH44+bPnpIuYcBzdS
   2sQdH5cOty4WPOnqa0S9mB8LYbsf2nu/SfP5Oblm2hsIfCIHDxCx7YXGv
   0a8ScbgE/vQN1zQzw3rUnCWYU4ZeagPXWURtTFPhOY0O5oYyTlXZp4Gw2
   tL9iY1BGgvTfJ5FjfRnC+gS2pW/h9JNbAq3y3ZWnR1bcVg9zrR3rmrKEE
   k3VJlMSUSRph226pcPEss/Q8R9LkEaZIYD4swB7C/mULjUaGE32tlzBZR
   w==;
X-CSE-ConnectionGUID: ZIcm3/6FQvev8WjYyCMNaQ==
X-CSE-MsgGUID: XeeWidUcTUy1avnQwr+ZqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="48467937"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="48467937"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 02:53:59 -0700
X-CSE-ConnectionGUID: UmlrG8MtTlybU7QDnnFdgA==
X-CSE-MsgGUID: uey+g6LCQp2NzzOVcPT78w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="93193023"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Aug 2024 02:53:53 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siWQ2-000Gql-0l;
	Mon, 26 Aug 2024 09:53:50 +0000
Date: Mon, 26 Aug 2024 17:53:25 +0800
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
Message-ID: <202408261757.D4gOewE9-lkp@intel.com>
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
[also build test WARNING on powerpc/fixes shuah-kselftest/next shuah-kselftest/fixes crng-random/master linus/master v6.11-rc5 next-20240823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/asm-generic-unaligned-h-Extract-common-header-for-vDSO/20240826-103525
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/315e3a268b165b6edad7dcb723b0d8a506a56c4e.1724309198.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH v2 07/17] mm: Define VM_DROPPABLE for powerpc/32
config: x86_64-buildonly-randconfig-002-20240826 (https://download.01.org/0day-ci/archive/20240826/202408261757.D4gOewE9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408261757.D4gOewE9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408261757.D4gOewE9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/events/page_ref.h:11,
                    from mm/debug_page_ref.c:6:
>> include/trace/events/mmflags.h:168:5: warning: "VM_DROPPABLE" is not defined, evaluates to 0 [-Wundef]
     168 | #if VM_DROPPABLE != VM_NONE
         |     ^~~~~~~~~~~~
>> include/trace/events/mmflags.h:168:21: warning: "VM_NONE" is not defined, evaluates to 0 [-Wundef]
     168 | #if VM_DROPPABLE != VM_NONE
         |                     ^~~~~~~
   In file included from include/trace/events/page_ref.h:11,
                    from include/trace/define_trace.h:95,
                    from include/trace/events/page_ref.h:135:
>> include/trace/events/mmflags.h:168:5: warning: "VM_DROPPABLE" is not defined, evaluates to 0 [-Wundef]
     168 | #if VM_DROPPABLE != VM_NONE
         |     ^~~~~~~~~~~~
>> include/trace/events/mmflags.h:168:21: warning: "VM_NONE" is not defined, evaluates to 0 [-Wundef]
     168 | #if VM_DROPPABLE != VM_NONE
         |                     ^~~~~~~
   In file included from include/trace/events/page_ref.h:11,
                    from include/trace/trace_events.h:94,
                    from include/trace/define_trace.h:102:
>> include/trace/events/mmflags.h:169: warning: "IF_HAVE_VM_DROPPABLE" redefined
     169 | # define IF_HAVE_VM_DROPPABLE(flag, name) {flag, name},
         | 
   include/trace/events/mmflags.h:171: note: this is the location of the previous definition
     171 | # define IF_HAVE_VM_DROPPABLE(flag, name)
         | 


vim +/VM_DROPPABLE +168 include/trace/events/mmflags.h

   167	
 > 168	#if VM_DROPPABLE != VM_NONE
 > 169	# define IF_HAVE_VM_DROPPABLE(flag, name) {flag, name},
   170	#else
   171	# define IF_HAVE_VM_DROPPABLE(flag, name)
   172	#endif
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

