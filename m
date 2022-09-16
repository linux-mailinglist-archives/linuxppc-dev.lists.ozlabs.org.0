Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EFD5BA846
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 10:33:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTS5T5h8lz3btQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 18:33:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cvligz4t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cvligz4t;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTS4m5Ccfz301Y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 18:32:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663317176; x=1694853176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xGgjhAsy9aewdt6Oyjp9sfp0i8+YgO6kNWmQgpk1LjE=;
  b=Cvligz4tZjunNI9ic3VBCYCtU7kPyehLpMKI6jBb8m7Jr2IzgSNYH5LT
   HEYu3X3veO5Bzv/9AgUX8tYVleXT7k47qGKnyxuebEX5056dJDUS/+1fN
   qTqtOCAI7zRWaCJei4eZd0kLh5GOmLAKRZ3OdHL//pxHXSV3JamrZ//V7
   7Z6G8LbM1KpJzxnrC6/+EuN+qroqoEW2uyUrIyTarZXi2yMPPOWNHdrcC
   vVq+vyQ9tc9q1tbQgmMGxMtARSUKzw7oQwUjB2ZYUQPGNL7kKbOWyfsT8
   drD5OeT1WoEkrfDpvVGB/mDYsinmydw/+0xV5QGGppwCbIfktsQ9KixUm
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="360684875"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="360684875"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 01:32:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="686055213"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Sep 2022 01:32:44 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZ6mB-0001bI-2Q;
	Fri, 16 Sep 2022 08:32:43 +0000
Date: Fri, 16 Sep 2022 16:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/6] powerpc/64: Add support for out-of-line static calls
Message-ID: <202209161627.bZaVohGQ-lkp@intel.com>
References: <20220916062330.430468-6-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916062330.430468-6-bgray@linux.ibm.com>
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
Cc: christophe.leroy@c-s.fr, kbuild-all@lists.01.org, ajd@linux.ibm.com, peterz@infradead.org, npiggin@gmail.com, jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, Benjamin Gray <bgray@linux.ibm.com>, ardb@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Benjamin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on next-20220915]
[cannot apply to linus/master v6.0-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gray/Out-of-line-static-calls-for-powerpc64-ELF-V2/20220916-142951
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20220916/202209161627.bZaVohGQ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f76701ac48849394d2a140d87c4263e796f4920f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Gray/Out-of-line-static-calls-for-powerpc64-ELF-V2/20220916-142951
        git checkout f76701ac48849394d2a140d87c4263e796f4920f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/ kernel/trace/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-review/Benjamin-Gray/Out-of-line-static-calls-for-powerpc64-ELF-V2/20220916-142951 HEAD d2702454a6382dfec6e4f47e4c3e49f70bec7049 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/static_call.h:139,
                    from include/linux/tracepoint.h:22,
                    from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:88,
                    from arch/powerpc/kernel/syscalls.c:19:
>> arch/powerpc/include/asm/static_call.h:94:2: error: #error "Unsupported ABI"
      94 | #error "Unsupported ABI"
         |  ^~~~~
--
   In file included from include/linux/static_call.h:139,
                    from arch/powerpc/kernel/irq.c:55:
>> arch/powerpc/include/asm/static_call.h:94:2: error: #error "Unsupported ABI"
      94 | #error "Unsupported ABI"
         |  ^~~~~
>> arch/powerpc/include/asm/static_call.h:97:73: error: expected ')' before string constant
      97 | #define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)       __PPC_SCT(name, "b " #func)
         |                                                                         ^~~~
   include/linux/static_call.h:233:9: note: in expansion of macro 'ARCH_DEFINE_STATIC_CALL_TRAMP'
     233 |         ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:325:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
     325 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:328:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     328 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:57:9: note: in expansion of macro 'DEFINE_TRACE'
      57 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   arch/powerpc/include/asm/trace.h:29:1: note: in expansion of macro 'DEFINE_EVENT'
      29 | DEFINE_EVENT(ppc64_interrupt_class, irq_entry,
         | ^~~~~~~~~~~~
>> arch/powerpc/include/asm/static_call.h:97:73: error: expected ')' before string constant
      97 | #define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)       __PPC_SCT(name, "b " #func)
         |                                                                         ^~~~
   include/linux/static_call.h:233:9: note: in expansion of macro 'ARCH_DEFINE_STATIC_CALL_TRAMP'
     233 |         ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:325:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
     325 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:328:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     328 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:57:9: note: in expansion of macro 'DEFINE_TRACE'
      57 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   arch/powerpc/include/asm/trace.h:36:1: note: in expansion of macro 'DEFINE_EVENT'
      36 | DEFINE_EVENT(ppc64_interrupt_class, irq_exit,
         | ^~~~~~~~~~~~
>> arch/powerpc/include/asm/static_call.h:97:73: error: expected ')' before string constant
      97 | #define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)       __PPC_SCT(name, "b " #func)
         |                                                                         ^~~~
   include/linux/static_call.h:233:9: note: in expansion of macro 'ARCH_DEFINE_STATIC_CALL_TRAMP'
     233 |         ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:325:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
     325 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:328:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     328 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:57:9: note: in expansion of macro 'DEFINE_TRACE'
      57 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   arch/powerpc/include/asm/trace.h:43:1: note: in expansion of macro 'DEFINE_EVENT'
      43 | DEFINE_EVENT(ppc64_interrupt_class, timer_interrupt_entry,
         | ^~~~~~~~~~~~
>> arch/powerpc/include/asm/static_call.h:97:73: error: expected ')' before string constant
      97 | #define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)       __PPC_SCT(name, "b " #func)
         |                                                                         ^~~~
   include/linux/static_call.h:233:9: note: in expansion of macro 'ARCH_DEFINE_STATIC_CALL_TRAMP'
     233 |         ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:325:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
     325 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:328:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     328 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:57:9: note: in expansion of macro 'DEFINE_TRACE'
      57 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   arch/powerpc/include/asm/trace.h:50:1: note: in expansion of macro 'DEFINE_EVENT'
      50 | DEFINE_EVENT(ppc64_interrupt_class, timer_interrupt_exit,
         | ^~~~~~~~~~~~
>> arch/powerpc/include/asm/static_call.h:97:73: error: expected ')' before string constant
      97 | #define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)       __PPC_SCT(name, "b " #func)
         |                                                                         ^~~~
   include/linux/static_call.h:233:9: note: in expansion of macro 'ARCH_DEFINE_STATIC_CALL_TRAMP'
     233 |         ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:325:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
     325 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:328:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     328 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:9: note: in expansion of macro 'DEFINE_TRACE'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   arch/powerpc/include/asm/trace.h:167:1: note: in expansion of macro 'TRACE_EVENT'
     167 | TRACE_EVENT(hash_fault,
         | ^~~~~~~~~~~
>> arch/powerpc/include/asm/static_call.h:97:73: error: expected ')' before string constant
      97 | #define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)       __PPC_SCT(name, "b " #func)
         |                                                                         ^~~~
   include/linux/static_call.h:233:9: note: in expansion of macro 'ARCH_DEFINE_STATIC_CALL_TRAMP'
     233 |         ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:325:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
     325 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:328:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     328 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:9: note: in expansion of macro 'DEFINE_TRACE'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   arch/powerpc/include/asm/trace.h:188:1: note: in expansion of macro 'TRACE_EVENT'
     188 | TRACE_EVENT(tlbie,
         | ^~~~~~~~~~~
>> arch/powerpc/include/asm/static_call.h:97:73: error: expected ')' before string constant
      97 | #define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)       __PPC_SCT(name, "b " #func)
         |                                                                         ^~~~
   include/linux/static_call.h:233:9: note: in expansion of macro 'ARCH_DEFINE_STATIC_CALL_TRAMP'
     233 |         ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:325:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
     325 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:328:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     328 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:9: note: in expansion of macro 'DEFINE_TRACE'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   arch/powerpc/include/asm/trace.h:220:1: note: in expansion of macro 'TRACE_EVENT'
     220 | TRACE_EVENT(tlbia,
         | ^~~~~~~~~~~
   arch/powerpc/include/asm/static_call.h:99:73: error: expected ')' before string constant
      99 | #define ARCH_DEFINE_STATIC_CALL_RET0_TRAMP(name)        __PPC_SCT(name, "b 1f")
         |                                                                         ^~~~~~
   include/linux/static_call.h:247:9: note: in expansion of macro 'ARCH_DEFINE_STATIC_CALL_RET0_TRAMP'
     247 |         ARCH_DEFINE_STATIC_CALL_RET0_TRAMP(name)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/kernel/irq.c:223:1: note: in expansion of macro 'DEFINE_STATIC_CALL_RET0'
     223 | DEFINE_STATIC_CALL_RET0(ppc_get_irq, *ppc_md.get_irq);
         | ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/static_call.h:139,
                    from arch/powerpc/kernel/static_call.c:7:
>> arch/powerpc/include/asm/static_call.h:94:2: error: #error "Unsupported ABI"
      94 | #error "Unsupported ABI"
         |  ^~~~~
   arch/powerpc/kernel/static_call.c: In function 'ppc_function_toc':
>> arch/powerpc/kernel/static_call.c:16:29: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      16 |                 u64 addr = ((u64) func + si1) + si2;
         |                             ^
>> arch/powerpc/kernel/static_call.c:21:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      21 |                         return (void*)addr;
         |                                ^
   arch/powerpc/kernel/static_call.c: In function 'get_inst_addr':
>> arch/powerpc/kernel/static_call.c:52:51: error: 'PPC_SCT_INST_KERNEL' undeclared (first use in this function)
      52 |         return tramp + (core_kernel_text(tramp) ? PPC_SCT_INST_KERNEL : PPC_SCT_INST_MODULE);
         |                                                   ^~~~~~~~~~~~~~~~~~~
   arch/powerpc/kernel/static_call.c:52:51: note: each undeclared identifier is reported only once for each function it appears in
>> arch/powerpc/kernel/static_call.c:52:73: error: 'PPC_SCT_INST_MODULE' undeclared (first use in this function)
      52 |         return tramp + (core_kernel_text(tramp) ? PPC_SCT_INST_KERNEL : PPC_SCT_INST_MODULE);
         |                                                                         ^~~~~~~~~~~~~~~~~~~
   arch/powerpc/kernel/static_call.c: In function 'get_ret0_addr':
>> arch/powerpc/kernel/static_call.c:56:51: error: 'PPC_SCT_RET0_KERNEL' undeclared (first use in this function)
      56 |         return tramp + (core_kernel_text(tramp) ? PPC_SCT_RET0_KERNEL : PPC_SCT_RET0_MODULE);
         |                                                   ^~~~~~~~~~~~~~~~~~~
>> arch/powerpc/kernel/static_call.c:56:73: error: 'PPC_SCT_RET0_MODULE' undeclared (first use in this function)
      56 |         return tramp + (core_kernel_text(tramp) ? PPC_SCT_RET0_KERNEL : PPC_SCT_RET0_MODULE);
         |                                                                         ^~~~~~~~~~~~~~~~~~~
   arch/powerpc/kernel/static_call.c: In function 'get_data_addr':
>> arch/powerpc/kernel/static_call.c:60:51: error: 'PPC_SCT_DATA_KERNEL' undeclared (first use in this function)
      60 |         return tramp + (core_kernel_text(tramp) ? PPC_SCT_DATA_KERNEL : PPC_SCT_DATA_MODULE);
         |                                                   ^~~~~~~~~~~~~~~~~~~
>> arch/powerpc/kernel/static_call.c:60:73: error: 'PPC_SCT_DATA_MODULE' undeclared (first use in this function)
      60 |         return tramp + (core_kernel_text(tramp) ? PPC_SCT_DATA_KERNEL : PPC_SCT_DATA_MODULE);
         |                                                                         ^~~~~~~~~~~~~~~~~~~
   arch/powerpc/kernel/static_call.c: In function 'get_ret0_addr':
   arch/powerpc/kernel/static_call.c:57:1: error: control reaches end of non-void function [-Werror=return-type]
      57 | }
         | ^
   arch/powerpc/kernel/static_call.c: In function 'get_inst_addr':
   arch/powerpc/kernel/static_call.c:53:1: error: control reaches end of non-void function [-Werror=return-type]
      53 | }
         | ^
   arch/powerpc/kernel/static_call.c: In function 'get_data_addr':
   arch/powerpc/kernel/static_call.c:61:1: error: control reaches end of non-void function [-Werror=return-type]
      61 | }
         | ^
   cc1: some warnings being treated as errors
--
   In file included from include/linux/static_call.h:139,
                    from include/linux/tracepoint.h:22,
                    from include/trace/events/sched.h:10,
                    from kernel/trace/ftrace.c:39:
>> arch/powerpc/include/asm/static_call.h:94:2: error: #error "Unsupported ABI"
      94 | #error "Unsupported ABI"
         |  ^~~~~
   kernel/trace/ftrace.c:299:5: warning: no previous prototype for '__register_ftrace_function' [-Wmissing-prototypes]
     299 | int __register_ftrace_function(struct ftrace_ops *ops)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:342:5: warning: no previous prototype for '__unregister_ftrace_function' [-Wmissing-prototypes]
     342 | int __unregister_ftrace_function(struct ftrace_ops *ops)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:4044:15: warning: no previous prototype for 'arch_ftrace_match_adjust' [-Wmissing-prototypes]
    4044 | char * __weak arch_ftrace_match_adjust(char *str, const char *search)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/static_call.h:139,
                    from include/linux/tracepoint.h:22,
                    from kernel/trace/trace.h:12,
                    from kernel/trace/trace.c:53:
>> arch/powerpc/include/asm/static_call.h:94:2: error: #error "Unsupported ABI"
      94 | #error "Unsupported ABI"
         |  ^~~~~
   kernel/trace/trace.c: In function 'trace_check_vprintf':
   kernel/trace/trace.c:3846:17: warning: function 'trace_check_vprintf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    3846 |                 trace_seq_vprintf(&iter->seq, iter->fmt, ap);
         |                 ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:3913:17: warning: function 'trace_check_vprintf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    3913 |                 trace_seq_vprintf(&iter->seq, p, ap);
         |                 ^~~~~~~~~~~~~~~~~
--
   In file included from include/linux/static_call.h:139,
                    from include/linux/tracepoint.h:22,
                    from kernel/trace/trace.h:12,
                    from kernel/trace/trace_output.h:6,
                    from kernel/trace/trace_output.c:15:
>> arch/powerpc/include/asm/static_call.h:94:2: error: #error "Unsupported ABI"
      94 | #error "Unsupported ABI"
         |  ^~~~~
   kernel/trace/trace_output.c: In function 'trace_output_raw':
   kernel/trace/trace_output.c:332:9: warning: function 'trace_output_raw' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     332 |         trace_seq_vprintf(s, trace_event_format(iter, fmt), ap);
         |         ^~~~~~~~~~~~~~~~~
--
   In file included from include/linux/static_call.h:139,
                    from include/linux/tracepoint.h:22,
                    from kernel/trace/trace.h:12,
                    from kernel/trace/trace_preemptirq.c:13:
>> arch/powerpc/include/asm/static_call.h:94:2: error: #error "Unsupported ABI"
      94 | #error "Unsupported ABI"
         |  ^~~~~
>> arch/powerpc/include/asm/static_call.h:97:73: error: expected ')' before string constant
      97 | #define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)       __PPC_SCT(name, "b " #func)
         |                                                                         ^~~~
   include/linux/static_call.h:233:9: note: in expansion of macro 'ARCH_DEFINE_STATIC_CALL_TRAMP'
     233 |         ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:325:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
     325 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:328:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     328 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:57:9: note: in expansion of macro 'DEFINE_TRACE'
      57 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/events/preemptirq.h:36:1: note: in expansion of macro 'DEFINE_EVENT'
      36 | DEFINE_EVENT(preemptirq_template, irq_disable,
         | ^~~~~~~~~~~~
>> arch/powerpc/include/asm/static_call.h:97:73: error: expected ')' before string constant
      97 | #define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)       __PPC_SCT(name, "b " #func)
         |                                                                         ^~~~
   include/linux/static_call.h:233:9: note: in expansion of macro 'ARCH_DEFINE_STATIC_CALL_TRAMP'
     233 |         ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:325:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
     325 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:328:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     328 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:57:9: note: in expansion of macro 'DEFINE_TRACE'
      57 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/events/preemptirq.h:40:1: note: in expansion of macro 'DEFINE_EVENT'
      40 | DEFINE_EVENT(preemptirq_template, irq_enable,
         | ^~~~~~~~~~~~
   kernel/trace/trace_preemptirq.c:88:16: warning: no previous prototype for 'trace_hardirqs_on_caller' [-Wmissing-prototypes]
      88 | __visible void trace_hardirqs_on_caller(unsigned long caller_addr)
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_preemptirq.c:103:16: warning: no previous prototype for 'trace_hardirqs_off_caller' [-Wmissing-prototypes]
     103 | __visible void trace_hardirqs_off_caller(unsigned long caller_addr)
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/static_call.h:139,
                    from include/linux/tracepoint.h:22,
                    from kernel/trace/trace.h:12,
                    from kernel/trace/trace_osnoise.c:27:
>> arch/powerpc/include/asm/static_call.h:94:2: error: #error "Unsupported ABI"
      94 | #error "Unsupported ABI"
         |  ^~~~~
>> arch/powerpc/include/asm/static_call.h:97:73: error: expected ')' before string constant
      97 | #define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)       __PPC_SCT(name, "b " #func)
         |                                                                         ^~~~
   include/linux/static_call.h:233:9: note: in expansion of macro 'ARCH_DEFINE_STATIC_CALL_TRAMP'
     233 |         ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:325:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
     325 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:328:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     328 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:9: note: in expansion of macro 'DEFINE_TRACE'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/events/osnoise.h:9:1: note: in expansion of macro 'TRACE_EVENT'
       9 | TRACE_EVENT(thread_noise,
         | ^~~~~~~~~~~
>> arch/powerpc/include/asm/static_call.h:97:73: error: expected ')' before string constant
      97 | #define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)       __PPC_SCT(name, "b " #func)
         |                                                                         ^~~~
   include/linux/static_call.h:233:9: note: in expansion of macro 'ARCH_DEFINE_STATIC_CALL_TRAMP'
     233 |         ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:325:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
     325 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:328:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     328 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:9: note: in expansion of macro 'DEFINE_TRACE'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/events/osnoise.h:37:1: note: in expansion of macro 'TRACE_EVENT'
      37 | TRACE_EVENT(softirq_noise,
         | ^~~~~~~~~~~
>> arch/powerpc/include/asm/static_call.h:97:73: error: expected ')' before string constant
      97 | #define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)       __PPC_SCT(name, "b " #func)
         |                                                                         ^~~~
   include/linux/static_call.h:233:9: note: in expansion of macro 'ARCH_DEFINE_STATIC_CALL_TRAMP'
     233 |         ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:325:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
     325 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:328:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     328 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:9: note: in expansion of macro 'DEFINE_TRACE'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/events/osnoise.h:63:1: note: in expansion of macro 'TRACE_EVENT'
      63 | TRACE_EVENT(irq_noise,
         | ^~~~~~~~~~~
>> arch/powerpc/include/asm/static_call.h:97:73: error: expected ')' before string constant
      97 | #define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)       __PPC_SCT(name, "b " #func)
         |                                                                         ^~~~
   include/linux/static_call.h:233:9: note: in expansion of macro 'ARCH_DEFINE_STATIC_CALL_TRAMP'
     233 |         ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:325:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
     325 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:328:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     328 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:9: note: in expansion of macro 'DEFINE_TRACE'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/events/osnoise.h:92:1: note: in expansion of macro 'TRACE_EVENT'
      92 | TRACE_EVENT(nmi_noise,
         | ^~~~~~~~~~~
>> arch/powerpc/include/asm/static_call.h:97:73: error: expected ')' before string constant
      97 | #define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)       __PPC_SCT(name, "b " #func)
         |                                                                         ^~~~
   include/linux/static_call.h:233:9: note: in expansion of macro 'ARCH_DEFINE_STATIC_CALL_TRAMP'
     233 |         ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:325:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
     325 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:328:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     328 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:9: note: in expansion of macro 'DEFINE_TRACE'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/events/osnoise.h:114:1: note: in expansion of macro 'TRACE_EVENT'
     114 | TRACE_EVENT(sample_threshold,
         | ^~~~~~~~~~~
..


vim +94 arch/powerpc/include/asm/static_call.h

    92	
    93	#else /* !CONFIG_PPC64_ELF_ABI_V2 && !PPC32 */
  > 94	#error "Unsupported ABI"
    95	#endif /* CONFIG_PPC64_ELF_ABI_V2 */
    96	
  > 97	#define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)	__PPC_SCT(name, "b " #func)
    98	#define ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)	__PPC_SCT(name, "blr")
    99	#define ARCH_DEFINE_STATIC_CALL_RET0_TRAMP(name)	__PPC_SCT(name, "b 1f")
   100	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
