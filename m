Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4FB91A694
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 14:33:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k+s8HSiB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8ydl6DWZz3cWf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 22:32:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k+s8HSiB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8yd121m6z3cCM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 22:32:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719491543; x=1751027543;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OKTTvpkgfT9N6byPGMlzyaEOXMNds9nVvX79L7haZ/k=;
  b=k+s8HSiBJu7S1UfU9sc+ixUmdZvLTmMtXzJS1fgWxTX19uFXYz63rYjq
   rUZUg/ZvzHM/+DAvx23G7iSW2D/2WfVKGKgUcgA7gL9M73zA8vrQFG6m9
   UsC65EO1zigQwuZlPo3+1W5p6K7kSVL+yGTmgRnfIW2DY+IrpaIuuBkF5
   /Lexx1rkeaUI/UPF8yETRa0jWmQOd7CMXq7iHy86NpkwRRI131N1zIf1a
   7CaKaNsQmBHc210xgkTvJcEadYdBm50t2cHbf4OKwWRH1FErXv9hpSHTt
   aOURHCFXK+LING9mpfRcyPvM16UKnic/yx51WO4scaPdVnXMYTZJdw4fl
   Q==;
X-CSE-ConnectionGUID: jjeJX+43TKGTcJw2Czte2Q==
X-CSE-MsgGUID: EqqNkLG0SwyKQbQ+14KmWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="20496216"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="20496216"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 05:32:16 -0700
X-CSE-ConnectionGUID: gbPP9sXfTaqdaHoiKlKISQ==
X-CSE-MsgGUID: 6+vERKVyTDaAINbam3ihBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="44773483"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Jun 2024 05:32:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMoIM-000GC6-1i;
	Thu, 27 Jun 2024 12:32:10 +0000
Date: Thu, 27 Jun 2024 20:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jialong Yang <jialong.yang@shingroup.cn>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH v1 1/2] powerpc/mmiotrace: Add MMIO Tracing tool for
 PowerPC
Message-ID: <202406271946.A6jwFfaY-lkp@intel.com>
References: <2bf90acf7d29641ba6643934ff8dbba897dbd2d9.1718873074.git.jialong.yang@shingroup.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bf90acf7d29641ba6643934ff8dbba897dbd2d9.1718873074.git.jialong.yang@shingroup.cn>
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
Cc: luming.yu@shingroup.cn, linux-kernel@vger.kernel.org, shenghui.qu@shingroup.cn, oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, Jialong Yang <jialong.yang@shingroup.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jialong,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.10-rc5 next-20240626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jialong-Yang/powerpc-mmiotrace-bind-ioremap-and-page-fault-to-active-mmiotrace/20240624-163027
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/2bf90acf7d29641ba6643934ff8dbba897dbd2d9.1718873074.git.jialong.yang%40shingroup.cn
patch subject: [PATCH v1 1/2] powerpc/mmiotrace: Add MMIO Tracing tool for PowerPC
config: powerpc-randconfig-r113-20240627 (https://download.01.org/0day-ci/archive/20240627/202406271946.A6jwFfaY-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240627/202406271946.A6jwFfaY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271946.A6jwFfaY-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/powerpc/mm/kmmio.c: In function 'pmd_mkinvalid':
>> arch/powerpc/mm/kmmio.c:140:16: error: implicit declaration of function '__pmd_raw' [-Werror=implicit-function-declaration]
     140 |         return __pmd_raw(pmd_raw(pmd) & ~cpu_to_be64(_PAGE_PRESENT | _PAGE_INVALID));
         |                ^~~~~~~~~
>> arch/powerpc/mm/kmmio.c:140:26: error: implicit declaration of function 'pmd_raw'; did you mean 'pmd_bad'? [-Werror=implicit-function-declaration]
     140 |         return __pmd_raw(pmd_raw(pmd) & ~cpu_to_be64(_PAGE_PRESENT | _PAGE_INVALID));
         |                          ^~~~~~~
         |                          pmd_bad
   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/powerpc/include/uapi/asm/byteorder.h:14,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/powerpc/include/asm/bitops.h:325,
                    from include/linux/bitops.h:63,
                    from include/linux/thread_info.h:27,
                    from arch/powerpc/include/asm/ptrace.h:342,
                    from arch/powerpc/include/asm/hw_irq.h:12,
                    from arch/powerpc/include/asm/irqflags.h:12,
                    from include/linux/irqflags.h:18,
                    from include/asm-generic/cmpxchg-local.h:6,
                    from arch/powerpc/include/asm/cmpxchg.h:755,
                    from arch/powerpc/include/asm/atomic.h:11,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from arch/powerpc/mm/kmmio.c:10:
>> arch/powerpc/mm/kmmio.c:140:70: error: '_PAGE_INVALID' undeclared (first use in this function); did you mean 'RPM_INVALID'?
     140 |         return __pmd_raw(pmd_raw(pmd) & ~cpu_to_be64(_PAGE_PRESENT | _PAGE_INVALID));
         |                                                                      ^~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:38:51: note: in definition of macro '__cpu_to_be64'
      38 | #define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
         |                                                   ^
   arch/powerpc/mm/kmmio.c:140:42: note: in expansion of macro 'cpu_to_be64'
     140 |         return __pmd_raw(pmd_raw(pmd) & ~cpu_to_be64(_PAGE_PRESENT | _PAGE_INVALID));
         |                                          ^~~~~~~~~~~
   arch/powerpc/mm/kmmio.c:140:70: note: each undeclared identifier is reported only once for each function it appears in
     140 |         return __pmd_raw(pmd_raw(pmd) & ~cpu_to_be64(_PAGE_PRESENT | _PAGE_INVALID));
         |                                                                      ^~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:38:51: note: in definition of macro '__cpu_to_be64'
      38 | #define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
         |                                                   ^
   arch/powerpc/mm/kmmio.c:140:42: note: in expansion of macro 'cpu_to_be64'
     140 |         return __pmd_raw(pmd_raw(pmd) & ~cpu_to_be64(_PAGE_PRESENT | _PAGE_INVALID));
         |                                          ^~~~~~~~~~~
   arch/powerpc/mm/kmmio.c: In function 'kmmio_handler':
>> arch/powerpc/mm/kmmio.c:318:32: error: 'struct pt_regs' has no member named 'softe'
     318 |         ctx->saved_softe = regs->softe;
         |                                ^~
   arch/powerpc/mm/kmmio.c:330:13: error: 'struct pt_regs' has no member named 'softe'
     330 |         regs->softe = IRQS_DISABLED; // soft interrupt
         |             ^~
>> arch/powerpc/mm/kmmio.c:332:9: error: 'local_paca' undeclared (first use in this function); did you mean 'local_lock'?
     332 |         local_paca->srr_valid = 0;
         |         ^~~~~~~~~~
         |         local_lock
   arch/powerpc/mm/kmmio.c: In function 'post_kmmio_handler':
   arch/powerpc/mm/kmmio.c:383:13: error: 'struct pt_regs' has no member named 'softe'
     383 |         regs->softe = ctx->saved_softe;
         |             ^~
   arch/powerpc/mm/kmmio.c: In function 'pmd_mkinvalid':
>> arch/powerpc/mm/kmmio.c:141:1: warning: control reaches end of non-void function [-Wreturn-type]
     141 | }
         | ^
   cc1: some warnings being treated as errors


vim +/__pmd_raw +140 arch/powerpc/mm/kmmio.c

   137	
   138	static inline pmd_t pmd_mkinvalid(pmd_t pmd)
   139	{
 > 140		return __pmd_raw(pmd_raw(pmd) & ~cpu_to_be64(_PAGE_PRESENT | _PAGE_INVALID));
 > 141	}
   142	
   143	static void clear_pmd_presence(pmd_t *pmd, bool clear, pmdval_t *old)
   144	{
   145		pmd_t new_pmd;
   146		pmdval_t v = pmd_val(*pmd);
   147	
   148		if (clear) {
   149			*old = v;
   150			new_pmd = pmd_mkinvalid(*pmd);
   151		} else {
   152			/* Presume this has been called with clear==true previously */
   153			new_pmd = __pmd(*old);
   154		}
   155		*pmd = new_pmd;
   156	}
   157	
   158	static void clear_pte_presence(pte_t *pte, bool clear, pteval_t *old, unsigned long addr)
   159	{
   160		pteval_t v = pte_val(*pte);
   161	
   162		if (clear) {
   163			*old = v;
   164			/* Nothing should care about address */
   165			pte_clear(&init_mm, addr, pte);
   166		} else {
   167			/* Presume this has been called with clear==true previously */
   168			set_pte_at(&init_mm, addr, pte, __pte(*old));
   169		}
   170	}
   171	
   172	static int clear_page_presence(struct kmmio_fault_page *f, bool clear)
   173	{
   174		unsigned int level;
   175		pte_t *pte = lookup_address(f->addr, &level);
   176	
   177		if (!pte) {
   178			pr_err("no pte for addr 0x%08lx\n", f->addr);
   179			return -1;
   180		}
   181	
   182		if (level == PMD_SHIFT)
   183			clear_pmd_presence((pmd_t *)pte, clear, &f->old_presence);
   184		else if (level == PAGE_SHIFT)
   185			clear_pte_presence(pte, clear, &f->old_presence, f->addr);
   186		else {
   187			pr_err("unexpected page level 0x%x.\n", level);
   188			return -1;
   189		}
   190	
   191		mmap_read_lock(&init_mm);
   192		struct vm_area_struct *vma = find_vma(&init_mm, f->addr);
   193	
   194		mmap_read_unlock(&init_mm);
   195	
   196		flush_tlb_page(vma, f->addr);
   197	
   198		return 0;
   199	}
   200	
   201	/*
   202	 * Mark the given page as not present. Access to it will trigger a fault.
   203	 *
   204	 * Struct kmmio_fault_page is protected by RCU and kmmio_lock, but the
   205	 * protection is ignored here. RCU read lock is assumed held, so the struct
   206	 * will not disappear unexpectedly. Furthermore, the caller must guarantee,
   207	 * that double arming the same virtual address (page) cannot occur.
   208	 *
   209	 * Double disarming on the other hand is allowed, and may occur when a fault
   210	 * and mmiotrace shutdown happen simultaneously.
   211	 */
   212	static int arm_kmmio_fault_page(struct kmmio_fault_page *f)
   213	{
   214		int ret;
   215	
   216		WARN_ONCE(f->armed, pr_fmt("kmmio page already armed.\n"));
   217		if (f->armed) {
   218			pr_warn("double-arm: addr 0x%08lx, ref %d, old %d\n",
   219				f->addr, f->count, !!f->old_presence);
   220		}
   221		ret = clear_page_presence(f, true);
   222		WARN_ONCE(ret < 0, pr_fmt("arming at 0x%08lx failed.\n"),
   223			  f->addr);
   224		f->armed = true;
   225		return ret;
   226	}
   227	
   228	/** Restore the given page to saved presence state. */
   229	static void disarm_kmmio_fault_page(struct kmmio_fault_page *f)
   230	{
   231		int ret = clear_page_presence(f, false);
   232	
   233		WARN_ONCE(ret < 0,
   234				KERN_ERR "kmmio disarming at 0x%08lx failed.\n", f->addr);
   235		f->armed = false;
   236	}
   237	
   238	/*
   239	 * This is being called from do_page_fault().
   240	 *
   241	 * We may be in an interrupt or a critical section. Also prefecthing may
   242	 * trigger a page fault. We may be in the middle of process switch.
   243	 * We cannot take any locks, because we could be executing especially
   244	 * within a kmmio critical section.
   245	 *
   246	 * Local interrupts are disabled, so preemption cannot happen.
   247	 * Do not enable interrupts, do not sleep, and watch out for other CPUs.
   248	 */
   249	/*
   250	 * Interrupts are disabled on entry as trap3 is an interrupt gate
   251	 * and they remain disabled throughout this function.
   252	 */
   253	int kmmio_handler(struct pt_regs *regs, unsigned long addr)
   254	{
   255		struct kmmio_context *ctx;
   256		struct kmmio_fault_page *faultpage;
   257		int ret = 0; /* default to fault not handled */
   258		unsigned long page_base = addr;
   259		unsigned int l;
   260		pte_t *pte = lookup_address(addr, &l);
   261	
   262		if (!pte)
   263			return -EINVAL;
   264		page_base &= page_level_mask(l);
   265	
   266		/*
   267		 * Hold the RCU read lock over single stepping to avoid looking
   268		 * up the probe and kmmio_fault_page again. The rcu_read_lock_sched()
   269		 * also disables preemption and prevents process switch during
   270		 * the single stepping. We can only handle one active kmmio trace
   271		 * per cpu, so ensure that we finish it before something else
   272		 * gets to run.
   273		 */
   274		rcu_read_lock_sched_notrace();
   275	
   276		faultpage = get_kmmio_fault_page(page_base);
   277		if (!faultpage) {
   278			/*
   279			 * Either this page fault is not caused by kmmio, or
   280			 * another CPU just pulled the kmmio probe from under
   281			 * our feet. The latter case should not be possible.
   282			 */
   283			goto no_kmmio;
   284		}
   285	
   286		ctx = this_cpu_ptr(&kmmio_ctx);
   287		if (ctx->active) {
   288			if (page_base == ctx->addr) {
   289				/*
   290				 * A second fault on the same page means some other
   291				 * condition needs handling by do_page_fault(), the
   292				 * page really not being present is the most common.
   293				 */
   294				pr_debug("secondary hit for 0x%08lx CPU %d.\n",
   295					 addr, smp_processor_id());
   296	
   297				if (!faultpage->old_presence)
   298					pr_info("unexpected secondary hit for address 0x%08lx on CPU %d.\n",
   299						addr, smp_processor_id());
   300			} else {
   301				/*
   302				 * Prevent overwriting already in-flight context.
   303				 * This should not happen, let's hope disarming at
   304				 * least prevents a panic.
   305				 */
   306				pr_emerg("recursive probe hit on CPU %d, for address 0x%08lx. Ignoring.\n",
   307					 smp_processor_id(), addr);
   308				pr_emerg("previous hit was at 0x%08lx.\n", ctx->addr);
   309				disarm_kmmio_fault_page(faultpage);
   310			}
   311			goto no_kmmio;
   312		}
   313		ctx->active++;
   314	
   315		ctx->fpage = faultpage;
   316		ctx->probe = get_kmmio_probe(page_base);
   317		ctx->saved_flags = (regs->msr & (MSR_SE | MSR_EE));
 > 318		ctx->saved_softe = regs->softe;
   319		ctx->addr = page_base;
   320	
   321		if (ctx->probe && ctx->probe->pre_handler)
   322			ctx->probe->pre_handler(ctx->probe, regs, addr);
   323	
   324		/*
   325		 * Enable single-stepping and disable interrupts for the faulting
   326		 * context. Local interrupts must not get enabled during stepping.
   327		 */
   328		regs->msr |= MSR_SE;         // single step
   329		regs->msr &= ~MSR_EE;        // hard interrupt
   330		regs->softe = IRQS_DISABLED; // soft interrupt
   331	
 > 332		local_paca->srr_valid = 0;
   333	
   334		/* Now we set present bit in PTE and single step. */
   335		disarm_kmmio_fault_page(ctx->fpage);
   336	
   337		/*
   338		 * If another cpu accesses the same page while we are stepping,
   339		 * the access will not be caught. It will simply succeed and the
   340		 * only downside is we lose the event. If this becomes a problem,
   341		 * the user should drop to single cpu before tracing.
   342		 */
   343	
   344		return 1; /* fault handled */
   345	
   346	no_kmmio:
   347		rcu_read_unlock_sched_notrace();
   348		return ret;
   349	}
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
