Return-Path: <linuxppc-dev+bounces-4654-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F4FA010A3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jan 2025 00:05:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPzh35QJWz2yvk;
	Sat,  4 Jan 2025 10:05:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735945539;
	cv=none; b=VzMy+v/avj8BWyN+c6vOi50sR7THGEjGsZp0Ndcpt3XbtnnEC0NPXLPBkTojPlf9ZwT68cgWN7FuhLqFSIhHQUr26noLL5ZApg30lr43ZPl6otLk7PwIc3yPzSvEdW16qfjOx49TlAgg52Zl0m9r56wg+2MgIs4spkGoU2REvei1+Sg6lH1CJBqckmjGt+c63Vuem908e2Nq5YKlEzV4qqpzoNXVkcWQ/dkKSjfw8phLDbNp6ZEBM5YohoRUHNdAueceL47OdSZ2Mqaqcp0Gk9PtPI8LZ0Ryurp5pA+HUpINorliid1EqJSK6LtjXiwCwwajE7aOZKuRXR1c/fqyIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735945539; c=relaxed/relaxed;
	bh=O7RAVM2Jap9AxkPfk1ESF2bd5G3cTNQQh7YWx/xRHgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wak1osnDCoVDSoPhFeMcRxA7v0/maJe9TqoZwUFkUfNYMflI7xvraJmQOZjHSO2/YBoWPF3QCSeS+YCkffMmwlzowESHLfb/WJXCMsE9pdOKMlrYOe8jHFI5tduwwvEqM+XMgsmwZl38rvyMy1u4rT8+6IbzwxtkfNp9Zj7KIO6ZEaywTW9NC8kAwD4qnQohS0a5WqjAaOTxvZ9tfMOUxkTyeCMW050D+pTy1f1nSCI308ZfjhOI5b/yjYFZX2F99ud7SAG6NRH/N/dv6GyIgDW+EFOPOtRemOpDBO8L4VPb6PxSoi0AqFoUznOkRWXePEkJ0LmpegW3AXG70BRM7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f0i7rqcV; dkim-atps=neutral; spf=pass (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f0i7rqcV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPzh05SxVz2yGZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jan 2025 10:05:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735945538; x=1767481538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B8W+q9xxGmRh9DkOnC+lZU+X1RSdxitAqgxldKE5xgg=;
  b=f0i7rqcV0KGkPmHkRTb7zMjru6rn0CjqWyJWm/lFJGgRIKRVALBk7iq6
   u7C8gDc9VWBqd22gsB03iBc7j8bErmdUTzFrqev5HMvTMBTDkBXcVONuv
   6CJ5bDHs237TUJ7nnkapHfNRgdjuwuHuQpMErXe4Z9G3TDw9ouysmeoYi
   6vTcKIZ4qUoFWHKN5tv3VFNGaefZIZevAnebZEV9EVcvah1zGjev64Ygh
   qZiUrD4LR9VYNIEADanyfDyaIMFU+TzudLKNT4h80Wto4onPJj+FYG85V
   sHaHde61QkX+ESBw+b714aMkf/+p++JQ7ziPU5WB4f+DQt4aHY9UDFfWN
   w==;
X-CSE-ConnectionGUID: DJWGNQ0bSaCA+SiJYktLBQ==
X-CSE-MsgGUID: TVS25ZJWQ2+m/cBUPzP0Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36343362"
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="36343362"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 15:05:29 -0800
X-CSE-ConnectionGUID: VkR9Cq0ISJukE/I8kQdvBQ==
X-CSE-MsgGUID: Q8W+7y/DSROwbGJBnMWuyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="102417339"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jan 2025 15:05:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTqjM-000APz-29;
	Fri, 03 Jan 2025 23:05:24 +0000
Date: Sat, 4 Jan 2025 07:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, mpe@ellerman.id.au,
	maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, sshegde@linux.ibm.com, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] powerpc: Enable dynamic preemption
Message-ID: <202501040657.5tSQad1Y-lkp@intel.com>
References: <20250102191856.499424-2-sshegde@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102191856.499424-2-sshegde@linux.ibm.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Shrikanth,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[cannot apply to powerpc/fixes linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shrikanth-Hegde/powerpc-Enable-dynamic-preemption/20250103-032131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250102191856.499424-2-sshegde%40linux.ibm.com
patch subject: [PATCH v2 1/1] powerpc: Enable dynamic preemption
config: powerpc-randconfig-r072-20250104 (https://download.01.org/0day-ci/archive/20250104/202501040657.5tSQad1Y-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501040657.5tSQad1Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501040657.5tSQad1Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:7:
   In file included from include/linux/rhashtable-types.h:12:
   In file included from include/linux/alloc_tag.h:11:
   In file included from include/linux/preempt.h:79:
>> arch/powerpc/include/asm/preempt.h:8:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
       8 | DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
         | ^
         | int
>> arch/powerpc/include/asm/preempt.h:8:25: error: a parameter list without types is only allowed in a function definition
       8 | DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
         |                         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/powerpc/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \


vim +/int +8 arch/powerpc/include/asm/preempt.h

     6	
     7	#if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
   > 8	DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
     9	#endif
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

