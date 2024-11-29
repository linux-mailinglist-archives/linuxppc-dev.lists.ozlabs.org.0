Return-Path: <linuxppc-dev+bounces-3614-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EBA9DE9FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2024 16:53:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y0Hlf1D0bz2yjb;
	Sat, 30 Nov 2024 02:53:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732895614;
	cv=none; b=M1D7ejvtkUTNUAsAAX3Rb/BnIXd7nAnVPEZhJEonorO5rLpF67uMRoX2/fc7oHDZ5FVajbdbCPCQG3cnT9QaWHZS8WTu4kME7ZyY+sFmOJ4yLC50gNGTxjpVbusjcSbvZtWlE1syNnIGBylJXPQP7BdBE+S6JWeQ8qJhCUSr+i8l6eCp06dAXK02KhEGdp/oJitaIJUhnzgUg6MADr/0IxFqGzge+WNZ68YQaMjTG/eNG91hG8UQmyufJZy85GQ5yUvgvT0Q5ZVxD+3uNnY1TjUEqz8t/KsmciAby8z2AKpfI0UQ2R3ED/q1LFYVrqQ3+B8/ovaSvNfFZlPhT4+hTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732895614; c=relaxed/relaxed;
	bh=DXyddUB8eJnWuEwivU7INwEW+4pYQy/GVcGWWNGuTHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U50vyvQzGauI5ejkTCDSaGKqRpRnVhEpTCHGBQDv4aa/nhpUDa5aLgLHMT42y6zmXSjBRt5pLwpqY1bSlesdsAPzzMQCu3bNgqkLF0npix2tnTGzrxO+vBnothebNlxEi/fJYdQbc9apsKVII8pIUjIZzBK/K1W6qMqU15LckLzaYwk1SlWi3zEaXAIzh8rWwllUWaI7QZkqtfaL1pyRCZfETPT3gzbxwHBLmnpybiVGf0qm46r/xrfJNJWudLOEC1lKk3Phtf+a3dTjGdsXdvY9OFavWW7+k/QgUrPlPbyxY0A/Qw3YAOCvagAYmAvoRnqBZRJhoEwMnTavbYrpPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mw3vQX5j; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mw3vQX5j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y0HlZ3GKsz2yNJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2024 02:53:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732895611; x=1764431611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X8kdzcem7IoN9L8/nNtQOwRxzQErlTl262LyjmQLTLs=;
  b=Mw3vQX5jTbi6koSPWnTFbgedtbrsVuLDm9Jl7DZetZ0XJpzL3vPgzZMJ
   9TAzZOjDR5jCG8Zgj3DAJ9FGqqb2+QA64+Ds8R+abS+xFZZ6y8jYBdSko
   2FlQ/P/ltKjrIYxVALxexWCNiC1uoWiRjCIWkZ7WUCUrQiyJVrqa0QCTR
   85k9StVwAvXQuZBpN0UEWfyL0bYlN62A4LVKFHuyYdf/n9Ao+Xk2ym6N9
   o5BwxO//ETv0AYxRH1DQiDVx8SPKO+ltwPXOev/BGjzJeXj0RvU8IgN/s
   ZUMzyncmA58l6i9A9dGN009x+moJX/EZJMubDYj5GBkP2KXSjC3L3bQ6V
   A==;
X-CSE-ConnectionGUID: NB54csQAS2S6nnitxnFR3w==
X-CSE-MsgGUID: +GdQNAvOSfOIiVbNi8wrhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="36802615"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="36802615"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 07:53:25 -0800
X-CSE-ConnectionGUID: 7//IIXS5QRGX+aRBQ6lUBQ==
X-CSE-MsgGUID: tJhAP9U8QW+LzJR0JKxV6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="96596770"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Nov 2024 07:53:17 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH3Ix-0000TX-0E;
	Fri, 29 Nov 2024 15:53:15 +0000
Date: Fri, 29 Nov 2024 23:53:07 +0800
From: kernel test robot <lkp@intel.com>
To: Eliav Farber <farbere@amazon.com>, linux@armlinux.org.uk,
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
	maddy@linux.ibm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, tglx@linutronix.de, ebiederm@xmission.com,
	akpm@linux-foundation.org, bhe@redhat.com, hbathini@linux.ibm.com,
	sourabhjain@linux.ibm.com, adityag@linux.ibm.com,
	songshuaishuai@tinylab.org, takakura@valinux.co.jp,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	kexec@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, jonnyc@amazon.com
Subject: Re: [PATCH v4 1/2] kexec: Consolidate
 machine_kexec_mask_interrupts() implementation
Message-ID: <202411292312.KnEWhcVS-lkp@intel.com>
References: <20241129113119.26669-2-farbere@amazon.com>
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
In-Reply-To: <20241129113119.26669-2-farbere@amazon.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Eliav,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes tip/irq/core arm64/for-next/core linus/master v6.12 next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eliav-Farber/kexec-Consolidate-machine_kexec_mask_interrupts-implementation/20241129-193342
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20241129113119.26669-2-farbere%40amazon.com
patch subject: [PATCH v4 1/2] kexec: Consolidate machine_kexec_mask_interrupts() implementation
config: i386-buildonly-randconfig-002-20241129 (https://download.01.org/0day-ci/archive/20241129/202411292312.KnEWhcVS-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411292312.KnEWhcVS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411292312.KnEWhcVS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/kexec_core.c:9:
   In file included from include/linux/btf.h:8:
   In file included from include/linux/bpfptr.h:6:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/kexec_core.c:43:
>> include/linux/irqdesc.h:68:25: error: field has incomplete type 'struct irq_common_data'
      68 |         struct irq_common_data  irq_common_data;
         |                                 ^
   include/linux/irqdesc.h:68:9: note: forward declaration of 'struct irq_common_data'
      68 |         struct irq_common_data  irq_common_data;
         |                ^
>> include/linux/irqdesc.h:69:19: error: field has incomplete type 'struct irq_data'
      69 |         struct irq_data         irq_data;
         |                                 ^
   include/linux/irqdesc.h:69:9: note: forward declaration of 'struct irq_data'
      69 |         struct irq_data         irq_data;
         |                ^
   include/linux/irqdesc.h:71:2: error: unknown type name 'irq_flow_handler_t'; did you mean 'irq_handler_t'?
      71 |         irq_flow_handler_t      handle_irq;
         |         ^~~~~~~~~~~~~~~~~~
         |         irq_handler_t
   include/linux/interrupt.h:104:23: note: 'irq_handler_t' declared here
     104 | typedef irqreturn_t (*irq_handler_t)(int, void *);
         |                       ^
   In file included from kernel/kexec_core.c:43:
>> include/linux/irqdesc.h:139:26: error: incomplete definition of type 'struct irq_data'
     139 |         return container_of(data->common, struct irq_desc, irq_common_data);
         |                             ~~~~^
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/irqdesc.h:69:9: note: forward declaration of 'struct irq_data'
      69 |         struct irq_data         irq_data;
         |                ^
>> include/linux/irqdesc.h:139:26: error: incomplete definition of type 'struct irq_data'
     139 |         return container_of(data->common, struct irq_desc, irq_common_data);
         |                             ~~~~^
   include/linux/container_of.h:20:30: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                     ^~~
   include/linux/compiler_types.h:464:63: note: expanded from macro '__same_type'
     464 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/irqdesc.h:69:9: note: forward declaration of 'struct irq_data'
      69 |         struct irq_data         irq_data;
         |                ^
>> include/linux/irqdesc.h:139:26: error: incomplete definition of type 'struct irq_data'
     139 |         return container_of(data->common, struct irq_desc, irq_common_data);
         |                             ~~~~^
   include/linux/container_of.h:21:23: note: expanded from macro 'container_of'
      21 |                       __same_type(*(ptr), void),                        \
         |                                     ^~~
   include/linux/compiler_types.h:464:63: note: expanded from macro '__same_type'
     464 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/irqdesc.h:69:9: note: forward declaration of 'struct irq_data'
      69 |         struct irq_data         irq_data;
         |                ^
>> include/linux/irqdesc.h:173:23: error: too few arguments to function call, expected 2, have 1
     173 |         desc->handle_irq(desc);
         |         ~~~~~~~~~~~~~~~~     ^
   include/linux/irqdesc.h:208:8: error: unknown type name 'irq_flow_handler_t'; did you mean 'irq_handler_t'?
     208 |                                           irq_flow_handler_t handler)
         |                                           ^~~~~~~~~~~~~~~~~~
         |                                           irq_handler_t
   include/linux/interrupt.h:104:23: note: 'irq_handler_t' declared here
     104 | typedef irqreturn_t (*irq_handler_t)(int, void *);
         |                       ^
   In file included from kernel/kexec_core.c:43:
   include/linux/irqdesc.h:230:6: error: unknown type name 'irq_flow_handler_t'; did you mean 'irq_handler_t'?
     230 |                                  irq_flow_handler_t handler, const char *name)
         |                                  ^~~~~~~~~~~~~~~~~~
         |                                  irq_handler_t
   include/linux/interrupt.h:104:23: note: 'irq_handler_t' declared here
     104 | typedef irqreturn_t (*irq_handler_t)(int, void *);
         |                       ^
   In file included from kernel/kexec_core.c:43:
   include/linux/irqdesc.h:236:6: error: incomplete definition of type 'struct irq_data'
     236 |         data->chip = (struct irq_chip *)chip;
         |         ~~~~^
   include/linux/irqdesc.h:69:9: note: forward declaration of 'struct irq_data'
      69 |         struct irq_data         irq_data;
         |                ^
>> include/linux/irqdesc.h:243:35: error: use of undeclared identifier 'IRQ_NO_BALANCING_MASK'
     243 |         return irq_check_status_bit(irq, IRQ_NO_BALANCING_MASK);
         |                                          ^
>> include/linux/irqdesc.h:248:35: error: use of undeclared identifier 'IRQ_PER_CPU'; did you mean 'MEM_PERCPU'?
     248 |         return irq_check_status_bit(irq, IRQ_PER_CPU);
         |                                          ^~~~~~~~~~~
         |                                          MEM_PERCPU
   include/linux/bpf.h:650:2: note: 'MEM_PERCPU' declared here
     650 |         MEM_PERCPU              = BIT(4 + BPF_BASE_TYPE_BITS),
         |         ^
   In file included from kernel/kexec_core.c:43:
>> include/linux/irqdesc.h:253:35: error: use of undeclared identifier 'IRQ_PER_CPU_DEVID'
     253 |         return irq_check_status_bit(irq, IRQ_PER_CPU_DEVID);
         |                                          ^
   kernel/kexec_core.c:1098:24: error: incomplete definition of type 'struct irq_chip'
    1098 |                 if (check_eoi && chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
         |                                  ~~~~^
   include/linux/irqdesc.h:152:22: note: forward declaration of 'struct irq_chip'
     152 | static inline struct irq_chip *irq_desc_get_chip(struct irq_desc *desc)
         |                      ^
   kernel/kexec_core.c:1098:37: error: call to undeclared function 'irqd_irq_inprogress'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1098 |                 if (check_eoi && chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
         |                                                   ^
   kernel/kexec_core.c:1099:8: error: incomplete definition of type 'struct irq_chip'
    1099 |                         chip->irq_eoi(&desc->irq_data);
         |                         ~~~~^
   include/linux/irqdesc.h:152:22: note: forward declaration of 'struct irq_chip'
     152 | static inline struct irq_chip *irq_desc_get_chip(struct irq_desc *desc)
         |                      ^
   kernel/kexec_core.c:1101:11: error: incomplete definition of type 'struct irq_chip'
    1101 |                 if (chip->irq_mask)
         |                     ~~~~^
   include/linux/irqdesc.h:152:22: note: forward declaration of 'struct irq_chip'
     152 | static inline struct irq_chip *irq_desc_get_chip(struct irq_desc *desc)
         |                      ^
   kernel/kexec_core.c:1102:8: error: incomplete definition of type 'struct irq_chip'
    1102 |                         chip->irq_mask(&desc->irq_data);
         |                         ~~~~^
   include/linux/irqdesc.h:152:22: note: forward declaration of 'struct irq_chip'
     152 | static inline struct irq_chip *irq_desc_get_chip(struct irq_desc *desc)
         |                      ^
   kernel/kexec_core.c:1104:11: error: incomplete definition of type 'struct irq_chip'
    1104 |                 if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
         |                     ~~~~^
   include/linux/irqdesc.h:152:22: note: forward declaration of 'struct irq_chip'
     152 | static inline struct irq_chip *irq_desc_get_chip(struct irq_desc *desc)
         |                      ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


vim +68 include/linux/irqdesc.h

86d2a2f51fbada Bitao Hu                  2024-04-11   31  
e144710b302525 Thomas Gleixner           2010-10-01   32  /**
e144710b302525 Thomas Gleixner           2010-10-01   33   * struct irq_desc - interrupt descriptor
0d0b4c866bcce6 Jiang Liu                 2015-06-01   34   * @irq_common_data:	per irq and chip data passed down to chip functions
e144710b302525 Thomas Gleixner           2010-10-01   35   * @kstat_irqs:		irq stats per cpu
770767787c2304 Geert Uytterhoeven        2011-04-10   36   * @handle_irq:		highlevel irq-events handler
e144710b302525 Thomas Gleixner           2010-10-01   37   * @action:		the irq action chain
80ebc420ec59a7 Yunfeng Ye                2019-09-18   38   * @status_use_accessors: status information
dbec07bac614a6 Thomas Gleixner           2011-02-07   39   * @core_internal_state__do_not_mess_with_it: core internal status information
e144710b302525 Thomas Gleixner           2010-10-01   40   * @depth:		disable-depth, for nested irq_disable() calls
0911f124bf5535 Geert Uytterhoeven        2011-04-10   41   * @wake_depth:		enable depth, for multiple irq_set_irq_wake() callers
030fc443aef663 Waiman Long               2019-02-12   42   * @tot_count:		stats field for non-percpu irqs
e144710b302525 Thomas Gleixner           2010-10-01   43   * @irq_count:		stats field to detect stalled irqs
e144710b302525 Thomas Gleixner           2010-10-01   44   * @last_unhandled:	aging timer for unhandled count
e144710b302525 Thomas Gleixner           2010-10-01   45   * @irqs_unhandled:	stats field for spurious unhandled interrupts
1e77d0a1ed7417 Thomas Gleixner           2013-03-07   46   * @threads_handled:	stats field for deferred spurious detection of threaded handlers
a359f757965aaf Ingo Molnar               2021-03-22   47   * @threads_handled_last: comparator field for deferred spurious detection of threaded handlers
e144710b302525 Thomas Gleixner           2010-10-01   48   * @lock:		locking for SMP
770767787c2304 Geert Uytterhoeven        2011-04-10   49   * @affinity_hint:	hint to user space for preferred irq affinity
cd7eab44e9946c Ben Hutchings             2011-01-19   50   * @affinity_notify:	context for notification of affinity changes
e144710b302525 Thomas Gleixner           2010-10-01   51   * @pending_mask:	pending rebalanced interrupts
b5faba21a6805c Thomas Gleixner           2011-02-23   52   * @threads_oneshot:	bitfield to handle shared oneshot threads
e144710b302525 Thomas Gleixner           2010-10-01   53   * @threads_active:	number of irqaction threads currently running
e144710b302525 Thomas Gleixner           2010-10-01   54   * @wait_for_threads:	wait queue for sync_irq to wait for threaded handlers
cab303be91dc47 Thomas Gleixner           2014-08-28   55   * @nr_actions:		number of installed actions on this descriptor
cab303be91dc47 Thomas Gleixner           2014-08-28   56   * @no_suspend_depth:	number of irqactions on a irq descriptor with
cab303be91dc47 Thomas Gleixner           2014-08-28   57   *			IRQF_NO_SUSPEND set
cab303be91dc47 Thomas Gleixner           2014-08-28   58   * @force_resume_depth:	number of irqactions on a irq descriptor with
cab303be91dc47 Thomas Gleixner           2014-08-28   59   *			IRQF_FORCE_RESUME set
425a5072dcd1bd Thomas Gleixner           2015-12-13   60   * @rcu:		rcu head for delayed free
ecb3f394c5dba8 Craig Gallek              2016-09-13   61   * @kobj:		kobject used to represent this struct in sysfs
9114014cf4e6df Thomas Gleixner           2017-06-29   62   * @request_mutex:	mutex to protect request/free before locking desc->lock
e144710b302525 Thomas Gleixner           2010-10-01   63   * @dir:		/proc/irq/ procfs entry
087cdfb662ae50 Thomas Gleixner           2017-06-20   64   * @debugfs_file:	dentry for the debugfs file
e144710b302525 Thomas Gleixner           2010-10-01   65   * @name:		flow handler name for /proc/interrupts output
e144710b302525 Thomas Gleixner           2010-10-01   66   */
e144710b302525 Thomas Gleixner           2010-10-01   67  struct irq_desc {
0d0b4c866bcce6 Jiang Liu                 2015-06-01  @68  	struct irq_common_data	irq_common_data;
e144710b302525 Thomas Gleixner           2010-10-01  @69  	struct irq_data		irq_data;
86d2a2f51fbada Bitao Hu                  2024-04-11   70  	struct irqstat __percpu	*kstat_irqs;
e144710b302525 Thomas Gleixner           2010-10-01  @71  	irq_flow_handler_t	handle_irq;
e144710b302525 Thomas Gleixner           2010-10-01   72  	struct irqaction	*action;	/* IRQ action list */
a6967caf00ebbb Thomas Gleixner           2011-02-10   73  	unsigned int		status_use_accessors;
dbec07bac614a6 Thomas Gleixner           2011-02-07   74  	unsigned int		core_internal_state__do_not_mess_with_it;
e144710b302525 Thomas Gleixner           2010-10-01   75  	unsigned int		depth;		/* nested irq disables */
e144710b302525 Thomas Gleixner           2010-10-01   76  	unsigned int		wake_depth;	/* nested wake enables */
1136b072896990 Thomas Gleixner           2019-02-08   77  	unsigned int		tot_count;
e144710b302525 Thomas Gleixner           2010-10-01   78  	unsigned int		irq_count;	/* For detecting broken IRQs */
e144710b302525 Thomas Gleixner           2010-10-01   79  	unsigned long		last_unhandled;	/* Aging timer for unhandled count */
e144710b302525 Thomas Gleixner           2010-10-01   80  	unsigned int		irqs_unhandled;
1e77d0a1ed7417 Thomas Gleixner           2013-03-07   81  	atomic_t		threads_handled;
1e77d0a1ed7417 Thomas Gleixner           2013-03-07   82  	int			threads_handled_last;
e144710b302525 Thomas Gleixner           2010-10-01   83  	raw_spinlock_t		lock;
31d9d9b6d83030 Marc Zyngier              2011-09-23   84  	struct cpumask		*percpu_enabled;
222df54fd8b764 Marc Zyngier              2016-04-11   85  	const struct cpumask	*percpu_affinity;
e144710b302525 Thomas Gleixner           2010-10-01   86  #ifdef CONFIG_SMP
e144710b302525 Thomas Gleixner           2010-10-01   87  	const struct cpumask	*affinity_hint;
cd7eab44e9946c Ben Hutchings             2011-01-19   88  	struct irq_affinity_notify *affinity_notify;
e144710b302525 Thomas Gleixner           2010-10-01   89  #ifdef CONFIG_GENERIC_PENDING_IRQ
e144710b302525 Thomas Gleixner           2010-10-01   90  	cpumask_var_t		pending_mask;
e144710b302525 Thomas Gleixner           2010-10-01   91  #endif
e144710b302525 Thomas Gleixner           2010-10-01   92  #endif
b5faba21a6805c Thomas Gleixner           2011-02-23   93  	unsigned long		threads_oneshot;
e144710b302525 Thomas Gleixner           2010-10-01   94  	atomic_t		threads_active;
e144710b302525 Thomas Gleixner           2010-10-01   95  	wait_queue_head_t       wait_for_threads;
cab303be91dc47 Thomas Gleixner           2014-08-28   96  #ifdef CONFIG_PM_SLEEP
cab303be91dc47 Thomas Gleixner           2014-08-28   97  	unsigned int		nr_actions;
cab303be91dc47 Thomas Gleixner           2014-08-28   98  	unsigned int		no_suspend_depth;
17f480342026e5 Rafael J. Wysocki         2015-02-27   99  	unsigned int		cond_suspend_depth;
cab303be91dc47 Thomas Gleixner           2014-08-28  100  	unsigned int		force_resume_depth;
cab303be91dc47 Thomas Gleixner           2014-08-28  101  #endif
e144710b302525 Thomas Gleixner           2010-10-01  102  #ifdef CONFIG_PROC_FS
e144710b302525 Thomas Gleixner           2010-10-01  103  	struct proc_dir_entry	*dir;
425a5072dcd1bd Thomas Gleixner           2015-12-13  104  #endif
087cdfb662ae50 Thomas Gleixner           2017-06-20  105  #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
087cdfb662ae50 Thomas Gleixner           2017-06-20  106  	struct dentry		*debugfs_file;
07557ccb8c83f3 Thomas Gleixner           2017-09-13  107  	const char		*dev_name;
087cdfb662ae50 Thomas Gleixner           2017-06-20  108  #endif
425a5072dcd1bd Thomas Gleixner           2015-12-13  109  #ifdef CONFIG_SPARSE_IRQ
425a5072dcd1bd Thomas Gleixner           2015-12-13  110  	struct rcu_head		rcu;
ecb3f394c5dba8 Craig Gallek              2016-09-13  111  	struct kobject		kobj;
e144710b302525 Thomas Gleixner           2010-10-01  112  #endif
9114014cf4e6df Thomas Gleixner           2017-06-29  113  	struct mutex		request_mutex;
293a7a0a165c4f Thomas Gleixner           2012-10-16  114  	int			parent_irq;
b6873807a7143b Sebastian Andrzej Siewior 2011-07-11  115  	struct module		*owner;
e144710b302525 Thomas Gleixner           2010-10-01  116  	const char		*name;
bc06a9e0874239 Shanker Donthineni        2023-05-19  117  #ifdef CONFIG_HARDIRQS_SW_RESEND
bc06a9e0874239 Shanker Donthineni        2023-05-19  118  	struct hlist_node	resend_node;
bc06a9e0874239 Shanker Donthineni        2023-05-19  119  #endif
e144710b302525 Thomas Gleixner           2010-10-01  120  } ____cacheline_internodealigned_in_smp;
e144710b302525 Thomas Gleixner           2010-10-01  121  
a899418167264c Thomas Gleixner           2015-07-05  122  #ifdef CONFIG_SPARSE_IRQ
a899418167264c Thomas Gleixner           2015-07-05  123  extern void irq_lock_sparse(void);
a899418167264c Thomas Gleixner           2015-07-05  124  extern void irq_unlock_sparse(void);
a899418167264c Thomas Gleixner           2015-07-05  125  #else
a899418167264c Thomas Gleixner           2015-07-05  126  static inline void irq_lock_sparse(void) { }
a899418167264c Thomas Gleixner           2015-07-05  127  static inline void irq_unlock_sparse(void) { }
e144710b302525 Thomas Gleixner           2010-10-01  128  extern struct irq_desc irq_desc[NR_IRQS];
e144710b302525 Thomas Gleixner           2010-10-01  129  #endif
e144710b302525 Thomas Gleixner           2010-10-01  130  
501e2db67fa426 Thomas Gleixner           2020-12-10  131  static inline unsigned int irq_desc_kstat_cpu(struct irq_desc *desc,
501e2db67fa426 Thomas Gleixner           2020-12-10  132  					      unsigned int cpu)
501e2db67fa426 Thomas Gleixner           2020-12-10  133  {
86d2a2f51fbada Bitao Hu                  2024-04-11  134  	return desc->kstat_irqs ? per_cpu(desc->kstat_irqs->cnt, cpu) : 0;
501e2db67fa426 Thomas Gleixner           2020-12-10  135  }
501e2db67fa426 Thomas Gleixner           2020-12-10  136  
7bbf1dd24b17b9 Jiang Liu                 2015-06-01  137  static inline struct irq_desc *irq_data_to_desc(struct irq_data *data)
7bbf1dd24b17b9 Jiang Liu                 2015-06-01  138  {
755d119a620497 Thomas Gleixner           2015-09-16 @139  	return container_of(data->common, struct irq_desc, irq_common_data);
7bbf1dd24b17b9 Jiang Liu                 2015-06-01  140  }
7bbf1dd24b17b9 Jiang Liu                 2015-06-01  141  
304adf8a8fff97 Jiang Liu                 2015-06-04  142  static inline unsigned int irq_desc_get_irq(struct irq_desc *desc)
304adf8a8fff97 Jiang Liu                 2015-06-04  143  {
304adf8a8fff97 Jiang Liu                 2015-06-04  144  	return desc->irq_data.irq;
304adf8a8fff97 Jiang Liu                 2015-06-04  145  }
304adf8a8fff97 Jiang Liu                 2015-06-04  146  
d9936bb3952a08 Thomas Gleixner           2011-03-11  147  static inline struct irq_data *irq_desc_get_irq_data(struct irq_desc *desc)
d9936bb3952a08 Thomas Gleixner           2011-03-11  148  {
d9936bb3952a08 Thomas Gleixner           2011-03-11  149  	return &desc->irq_data;
d9936bb3952a08 Thomas Gleixner           2011-03-11  150  }
d9936bb3952a08 Thomas Gleixner           2011-03-11  151  
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  152  static inline struct irq_chip *irq_desc_get_chip(struct irq_desc *desc)
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  153  {
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  154  	return desc->irq_data.chip;
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  155  }
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  156  
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  157  static inline void *irq_desc_get_chip_data(struct irq_desc *desc)
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  158  {
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  159  	return desc->irq_data.chip_data;
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  160  }
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  161  
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  162  static inline void *irq_desc_get_handler_data(struct irq_desc *desc)
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  163  {
af7080e040d223 Jiang Liu                 2015-06-01  164  	return desc->irq_common_data.handler_data;
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  165  }
a0cd9ca2b907d7 Thomas Gleixner           2011-02-10  166  
e144710b302525 Thomas Gleixner           2010-10-01  167  /*
e144710b302525 Thomas Gleixner           2010-10-01  168   * Architectures call this to let the generic IRQ layer
6584d84c3e504c Huang Shijie              2015-09-01  169   * handle an interrupt.
e144710b302525 Thomas Gleixner           2010-10-01  170   */
bd0b9ac405e179 Thomas Gleixner           2015-09-14  171  static inline void generic_handle_irq_desc(struct irq_desc *desc)
e144710b302525 Thomas Gleixner           2010-10-01  172  {
bd0b9ac405e179 Thomas Gleixner           2015-09-14 @173  	desc->handle_irq(desc);
e144710b302525 Thomas Gleixner           2010-10-01  174  }
e144710b302525 Thomas Gleixner           2010-10-01  175  
a3016b26ee6ee1 Marc Zyngier              2021-05-04  176  int handle_irq_desc(struct irq_desc *desc);
fe12bc2c996d3e Thomas Gleixner           2011-05-18  177  int generic_handle_irq(unsigned int irq);
509853f9e1e7b1 Sebastian Andrzej Siewior 2022-02-11  178  int generic_handle_irq_safe(unsigned int irq);
e144710b302525 Thomas Gleixner           2010-10-01  179  
e1c054918c6c7a Marc Zyngier              2021-05-12  180  #ifdef CONFIG_IRQ_DOMAIN
76ba59f8366f2d Marc Zyngier              2014-08-26  181  /*
76ba59f8366f2d Marc Zyngier              2014-08-26  182   * Convert a HW interrupt number to a logical one using a IRQ domain,
76ba59f8366f2d Marc Zyngier              2014-08-26  183   * and handle the result interrupt number. Return -EINVAL if
9626d18a20e166 Marc Zyngier              2021-05-04  184   * conversion failed.
76ba59f8366f2d Marc Zyngier              2014-08-26  185   */
8240ef50d48643 Marc Zyngier              2021-05-12  186  int generic_handle_domain_irq(struct irq_domain *domain, unsigned int hwirq);
6a164c64699984 Sebastian Andrzej Siewior 2022-05-09  187  int generic_handle_domain_irq_safe(struct irq_domain *domain, unsigned int hwirq);
0953fb263714e1 Mark Rutland              2021-10-20  188  int generic_handle_domain_nmi(struct irq_domain *domain, unsigned int hwirq);
76ba59f8366f2d Marc Zyngier              2014-08-26  189  #endif
76ba59f8366f2d Marc Zyngier              2014-08-26  190  
e144710b302525 Thomas Gleixner           2010-10-01  191  /* Test to see if a driver has successfully requested an irq */
f61ae4fb66a4f7 Thomas Gleixner           2015-08-02  192  static inline int irq_desc_has_action(struct irq_desc *desc)
e144710b302525 Thomas Gleixner           2010-10-01  193  {
a313357e704f26 Thomas Gleixner           2020-12-10  194  	return desc && desc->action != NULL;
f61ae4fb66a4f7 Thomas Gleixner           2015-08-02  195  }
f61ae4fb66a4f7 Thomas Gleixner           2015-08-02  196  
bbc9d21fc0071c Thomas Gleixner           2015-06-23  197  /**
bbc9d21fc0071c Thomas Gleixner           2015-06-23  198   * irq_set_handler_locked - Set irq handler from a locked region
bbc9d21fc0071c Thomas Gleixner           2015-06-23  199   * @data:	Pointer to the irq_data structure which identifies the irq
bbc9d21fc0071c Thomas Gleixner           2015-06-23  200   * @handler:	Flow control handler function for this interrupt
bbc9d21fc0071c Thomas Gleixner           2015-06-23  201   *
bbc9d21fc0071c Thomas Gleixner           2015-06-23  202   * Sets the handler in the irq descriptor associated to @data.
bbc9d21fc0071c Thomas Gleixner           2015-06-23  203   *
bbc9d21fc0071c Thomas Gleixner           2015-06-23  204   * Must be called with irq_desc locked and valid parameters. Typical
bbc9d21fc0071c Thomas Gleixner           2015-06-23  205   * call site is the irq_set_type() callback.
bbc9d21fc0071c Thomas Gleixner           2015-06-23  206   */
bbc9d21fc0071c Thomas Gleixner           2015-06-23  207  static inline void irq_set_handler_locked(struct irq_data *data,
bbc9d21fc0071c Thomas Gleixner           2015-06-23  208  					  irq_flow_handler_t handler)
bbc9d21fc0071c Thomas Gleixner           2015-06-23  209  {
bbc9d21fc0071c Thomas Gleixner           2015-06-23  210  	struct irq_desc *desc = irq_data_to_desc(data);
bbc9d21fc0071c Thomas Gleixner           2015-06-23  211  
bbc9d21fc0071c Thomas Gleixner           2015-06-23  212  	desc->handle_irq = handler;
bbc9d21fc0071c Thomas Gleixner           2015-06-23  213  }
bbc9d21fc0071c Thomas Gleixner           2015-06-23  214  
bbc9d21fc0071c Thomas Gleixner           2015-06-23  215  /**
bbc9d21fc0071c Thomas Gleixner           2015-06-23  216   * irq_set_chip_handler_name_locked - Set chip, handler and name from a locked region
bbc9d21fc0071c Thomas Gleixner           2015-06-23  217   * @data:	Pointer to the irq_data structure for which the chip is set
bbc9d21fc0071c Thomas Gleixner           2015-06-23  218   * @chip:	Pointer to the new irq chip
bbc9d21fc0071c Thomas Gleixner           2015-06-23  219   * @handler:	Flow control handler function for this interrupt
bbc9d21fc0071c Thomas Gleixner           2015-06-23  220   * @name:	Name of the interrupt
bbc9d21fc0071c Thomas Gleixner           2015-06-23  221   *
bbc9d21fc0071c Thomas Gleixner           2015-06-23  222   * Replace the irq chip at the proper hierarchy level in @data and
bbc9d21fc0071c Thomas Gleixner           2015-06-23  223   * sets the handler and name in the associated irq descriptor.
bbc9d21fc0071c Thomas Gleixner           2015-06-23  224   *
bbc9d21fc0071c Thomas Gleixner           2015-06-23  225   * Must be called with irq_desc locked and valid parameters.
bbc9d21fc0071c Thomas Gleixner           2015-06-23  226   */
bbc9d21fc0071c Thomas Gleixner           2015-06-23  227  static inline void
ef6e5d61eb7a0a Michael Walle             2022-07-06  228  irq_set_chip_handler_name_locked(struct irq_data *data,
ef6e5d61eb7a0a Michael Walle             2022-07-06  229  				 const struct irq_chip *chip,
bbc9d21fc0071c Thomas Gleixner           2015-06-23  230  				 irq_flow_handler_t handler, const char *name)
bbc9d21fc0071c Thomas Gleixner           2015-06-23  231  {
bbc9d21fc0071c Thomas Gleixner           2015-06-23  232  	struct irq_desc *desc = irq_data_to_desc(data);
bbc9d21fc0071c Thomas Gleixner           2015-06-23  233  
bbc9d21fc0071c Thomas Gleixner           2015-06-23  234  	desc->handle_irq = handler;
bbc9d21fc0071c Thomas Gleixner           2015-06-23  235  	desc->name = name;
ef6e5d61eb7a0a Michael Walle             2022-07-06 @236  	data->chip = (struct irq_chip *)chip;
bbc9d21fc0071c Thomas Gleixner           2015-06-23  237  }
bbc9d21fc0071c Thomas Gleixner           2015-06-23  238  
fdd029630434b4 Thomas Gleixner           2020-12-10  239  bool irq_check_status_bit(unsigned int irq, unsigned int bitmask);
fdd029630434b4 Thomas Gleixner           2020-12-10  240  
4ce413d1840b25 Will Deacon               2017-12-01  241  static inline bool irq_balancing_disabled(unsigned int irq)
e144710b302525 Thomas Gleixner           2010-10-01  242  {
fdd029630434b4 Thomas Gleixner           2020-12-10 @243  	return irq_check_status_bit(irq, IRQ_NO_BALANCING_MASK);
e144710b302525 Thomas Gleixner           2010-10-01  244  }
781295762defc7 Thomas Gleixner           2011-02-10  245  
4ce413d1840b25 Will Deacon               2017-12-01  246  static inline bool irq_is_percpu(unsigned int irq)
7f4a8e7b1943c1 Vinayak Kale              2013-12-04  247  {
fdd029630434b4 Thomas Gleixner           2020-12-10 @248  	return irq_check_status_bit(irq, IRQ_PER_CPU);
7f4a8e7b1943c1 Vinayak Kale              2013-12-04  249  }
7f4a8e7b1943c1 Vinayak Kale              2013-12-04  250  
4ce413d1840b25 Will Deacon               2017-12-01  251  static inline bool irq_is_percpu_devid(unsigned int irq)
08395c7f4d9f58 Julien Thierry            2017-10-13  252  {
fdd029630434b4 Thomas Gleixner           2020-12-10 @253  	return irq_check_status_bit(irq, IRQ_PER_CPU_DEVID);
08395c7f4d9f58 Julien Thierry            2017-10-13  254  }
08395c7f4d9f58 Julien Thierry            2017-10-13  255  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

