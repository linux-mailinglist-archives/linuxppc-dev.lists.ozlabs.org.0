Return-Path: <linuxppc-dev+bounces-5370-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 647A3A15A9E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2025 01:51:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZdMH5NxLz30Tf;
	Sat, 18 Jan 2025 11:51:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737161467;
	cv=none; b=JTHBxuzTXrEwDUdWmOUkrbLdB78WH9nAy16W5cOHmRculv1W2lG36dYgU45Z8LghX3eBD87cMEMCQgTN3M4tr0S5fDetsbVZRTw3VzgxfD1GKszA75f/oJGYvSabVDUTCwo7bUD3xhCNqCX75jo9b5b0Kh3S5wlcWgZGlmwvqvzSFdhCAv8OPtQ22pCYJdDfEggutBMVtXI8k+d0EJgg9YilEWXl59tcRlrGGEk08Es7qbjSJBMFNqwhGnfBMLgH1Teyzb5Hcut9X5arRBhIgugtr34fkA3SiG/DjvtcVwVWN7EIkbxlF+WJkTIhQOo7oigCId7/pvU5d8yVE4bmuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737161467; c=relaxed/relaxed;
	bh=HZxv7f/6HJeVnmkEPWEM+93yzhJ27/vRuWgS6z66sbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBsml87G1HK4yAk0c5XUKnjigy6+adws83Ln9vBvdkhuQdeRbUbiHvXAxwQ0Vz0YJv+agi1Y9OTT7y8PrErwR+wEtR6ZEAJ4xzmiWSuHVjj6Rt/ujfHLd1Klelo5yNrjlecpId136YSRHjdeDzGv/A0S8CT+RhM5chdSIvARqx/XPDDb6upDPSq4YQg58sEEwFsJurEy7Di4KiFxQ6inkBMD5iR7k6SIsIeEC9l0tSEwlmsYp8uKwZ69/zJhqFwGAJWeshB6LEXkLIOsAR0Wm6q33s4cYY+2dADPVX+//kqb6DQh6RjmbHgU20s6kHfi13agum1hg/DsY6a9YKTglA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mPnx1GeE; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mPnx1GeE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZdMD4gR1z30CD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 11:51:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737161465; x=1768697465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Df6ej1tCyXg56NNvjtKkzsF5rj4/9kNo8BV7BwxC7VY=;
  b=mPnx1GeENK+4++MvGfs1Kvpu0dg6nm0cqJ+vvGuNNMmAsEGCfKB2X2ge
   zTjzd3JbYy+f17/OCRafcbGcwbLRT7m2sPBhoxUS1DX2EIDy3ELtAnLo9
   WIf3YcliAn/YNkRZcJJTOxOq0VyQ/Wi/LqPRALQGbiE/svT1klcaIq7Y9
   kmX+0Q8xazeAZQiVrd5goKYDWjUAxpIzsotBsQYWiCO5mIGeoMK9dyW/P
   gHCs8vRAg+Xel8ButRZEUbYJzjwfhYuNcdjcFWnXZ4C2W3dyYYbWqfnx1
   JBoQAoFMIetJl/k2TKY0uiX/ZnNBojdkOGCbgN0cUCJlxhdi0p8Dcc0gk
   w==;
X-CSE-ConnectionGUID: okDmFTvjSierohlPT6mBvQ==
X-CSE-MsgGUID: B9Y5LfevTgepLA6DDujG8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37301765"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="37301765"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 16:50:59 -0800
X-CSE-ConnectionGUID: kcU7d6K/QReQ8YrlEo721g==
X-CSE-MsgGUID: PV0tdzRkReiOFsSceAFk/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129217243"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jan 2025 16:50:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYx38-000Tt9-2d;
	Sat, 18 Jan 2025 00:50:54 +0000
Date: Sat, 18 Jan 2025 08:50:40 +0800
From: kernel test robot <lkp@intel.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	hbathini@linux.ibm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
	disgoel@linux.vnet.ibm.com
Subject: Re: [PATCH 1/2] arch/powerpc/perf: Check the instruction type before
 creating sample with perf_mem_data_src
Message-ID: <202501180825.LpRG6wYe-lkp@intel.com>
References: <20250113062818.33187-1-atrajeev@linux.vnet.ibm.com>
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
In-Reply-To: <20250113062818.33187-1-atrajeev@linux.vnet.ibm.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Athira,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.13-rc7 next-20250117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Athira-Rajeev/arch-powerpc-perf-Update-get_mem_data_src-function-to-use-saved-values-of-sier-and-mmcra-regs/20250113-143059
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250113062818.33187-1-atrajeev%40linux.vnet.ibm.com
patch subject: [PATCH 1/2] arch/powerpc/perf: Check the instruction type before creating sample with perf_mem_data_src
config: powerpc-gamecube_defconfig (https://download.01.org/0day-ci/archive/20250118/202501180825.LpRG6wYe-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180825.LpRG6wYe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180825.LpRG6wYe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/perf/core-book3s.c:2303:22: error: use of undeclared identifier 'ISA207_SIER_TYPE_MASK'
                   val = (regs->dar & ISA207_SIER_TYPE_MASK) >> ISA207_SIER_TYPE_SHIFT;
                                      ^
>> arch/powerpc/perf/core-book3s.c:2303:48: error: use of undeclared identifier 'ISA207_SIER_TYPE_SHIFT'
                   val = (regs->dar & ISA207_SIER_TYPE_MASK) >> ISA207_SIER_TYPE_SHIFT;
                                                                ^
   2 errors generated.


vim +/ISA207_SIER_TYPE_MASK +2303 arch/powerpc/perf/core-book3s.c

  2222	
  2223	#define PERF_SAMPLE_ADDR_TYPE  (PERF_SAMPLE_ADDR |		\
  2224					PERF_SAMPLE_PHYS_ADDR |		\
  2225					PERF_SAMPLE_DATA_PAGE_SIZE)
  2226	/*
  2227	 * A counter has overflowed; update its count and record
  2228	 * things if requested.  Note that interrupts are hard-disabled
  2229	 * here so there is no possibility of being interrupted.
  2230	 */
  2231	static void record_and_restart(struct perf_event *event, unsigned long val,
  2232				       struct pt_regs *regs)
  2233	{
  2234		u64 period = event->hw.sample_period;
  2235		s64 prev, delta, left;
  2236		int record = 0;
  2237	
  2238		if (event->hw.state & PERF_HES_STOPPED) {
  2239			write_pmc(event->hw.idx, 0);
  2240			return;
  2241		}
  2242	
  2243		/* we don't have to worry about interrupts here */
  2244		prev = local64_read(&event->hw.prev_count);
  2245		delta = check_and_compute_delta(prev, val);
  2246		local64_add(delta, &event->count);
  2247	
  2248		/*
  2249		 * See if the total period for this event has expired,
  2250		 * and update for the next period.
  2251		 */
  2252		val = 0;
  2253		left = local64_read(&event->hw.period_left) - delta;
  2254		if (delta == 0)
  2255			left++;
  2256		if (period) {
  2257			if (left <= 0) {
  2258				left += period;
  2259				if (left <= 0)
  2260					left = period;
  2261	
  2262				/*
  2263				 * If address is not requested in the sample via
  2264				 * PERF_SAMPLE_IP, just record that sample irrespective
  2265				 * of SIAR valid check.
  2266				 */
  2267				if (event->attr.sample_type & PERF_SAMPLE_IP)
  2268					record = siar_valid(regs);
  2269				else
  2270					record = 1;
  2271	
  2272				event->hw.last_period = event->hw.sample_period;
  2273			}
  2274			if (left < 0x80000000LL)
  2275				val = 0x80000000LL - left;
  2276		}
  2277	
  2278		write_pmc(event->hw.idx, val);
  2279		local64_set(&event->hw.prev_count, val);
  2280		local64_set(&event->hw.period_left, left);
  2281		perf_event_update_userpage(event);
  2282	
  2283		/*
  2284		 * Due to hardware limitation, sometimes SIAR could sample a kernel
  2285		 * address even when freeze on supervisor state (kernel) is set in
  2286		 * MMCR2. Check attr.exclude_kernel and address to drop the sample in
  2287		 * these cases.
  2288		 */
  2289		if (event->attr.exclude_kernel &&
  2290		    (event->attr.sample_type & PERF_SAMPLE_IP) &&
  2291		    is_kernel_addr(mfspr(SPRN_SIAR)))
  2292			record = 0;
  2293	
  2294		/*
  2295		 * SIER[46-48] presents instruction type of the sampled instruction.
  2296		 * In ISA v3.0 and before values "0" and "7" are considered reserved.
  2297		 * In ISA v3.1, value "7" has been used to indicate "larx/stcx".
  2298		 * Drop the sample if "type" has reserved values for this field with a
  2299		 * ISA version check.
  2300		 */
  2301		if (event->attr.sample_type & PERF_SAMPLE_DATA_SRC &&
  2302				ppmu->get_mem_data_src) {
> 2303			val = (regs->dar & ISA207_SIER_TYPE_MASK) >> ISA207_SIER_TYPE_SHIFT;
  2304			if (val == 0 || (val == 7 && !cpu_has_feature(CPU_FTR_ARCH_31))) {
  2305				record = 0;
  2306				atomic64_inc(&event->lost_samples);
  2307			}
  2308		}
  2309	
  2310		/*
  2311		 * Finally record data if requested.
  2312		 */
  2313		if (record) {
  2314			struct perf_sample_data data;
  2315	
  2316			perf_sample_data_init(&data, ~0ULL, event->hw.last_period);
  2317	
  2318			if (event->attr.sample_type & PERF_SAMPLE_ADDR_TYPE)
  2319				perf_get_data_addr(event, regs, &data.addr);
  2320	
  2321			if (event->attr.sample_type & PERF_SAMPLE_BRANCH_STACK) {
  2322				struct cpu_hw_events *cpuhw;
  2323				cpuhw = this_cpu_ptr(&cpu_hw_events);
  2324				power_pmu_bhrb_read(event, cpuhw);
  2325				perf_sample_save_brstack(&data, event, &cpuhw->bhrb_stack, NULL);
  2326			}
  2327	
  2328			if (event->attr.sample_type & PERF_SAMPLE_DATA_SRC &&
  2329							ppmu->get_mem_data_src) {
  2330				ppmu->get_mem_data_src(&data.data_src, ppmu->flags, regs);
  2331				data.sample_flags |= PERF_SAMPLE_DATA_SRC;
  2332			}
  2333	
  2334			if (event->attr.sample_type & PERF_SAMPLE_WEIGHT_TYPE &&
  2335							ppmu->get_mem_weight) {
  2336				ppmu->get_mem_weight(&data.weight.full, event->attr.sample_type);
  2337				data.sample_flags |= PERF_SAMPLE_WEIGHT_TYPE;
  2338			}
  2339			if (perf_event_overflow(event, &data, regs))
  2340				power_pmu_stop(event, 0);
  2341		} else if (period) {
  2342			/* Account for interrupt in case of invalid SIAR */
  2343			if (perf_event_account_interrupt(event))
  2344				power_pmu_stop(event, 0);
  2345		}
  2346	}
  2347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

