Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EC58C34DF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 May 2024 04:23:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VXWLBZrH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VcRHZ4J14z3cXN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 May 2024 12:23:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VXWLBZrH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VcRGn4Mv0z30Wb
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 May 2024 12:22:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715480562; x=1747016562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hbioi7V1f1cZXo2yMQSfPzaaf4jKs+4bV23oY9X2zb4=;
  b=VXWLBZrHg+nxIiikOKjDVehW3+emtDLqzmzcVtV2byVGxQmH2B60CNUc
   g/OmHE8rmYap/nJEYVllEEZ+q01r/EivLvgQ9QH6y2YCR7Jma+nOOlz34
   Xk9dcxgD4m2W+O5Yw/oQ5Lb+Q+dKe89uhI7TUywQdS/5LIviZdAs3rXRx
   2xvKFwxdlXtWjibNN4PTrCuN75DaAxPckREgpPYmFcylSW81kxWcOypVU
   VA2XXxzE3+hrqQZTOGDaVXNJCW9aMcQ41SEH++XnPNeT5AXPjVmFF41FA
   MAfSCqTjG6xB5+GZO5QStDQ51/slGPZ019Kr5gcdhwgf0FfMIawNLhG0p
   w==;
X-CSE-ConnectionGUID: kIrtM0vWQFuxNtdRZNvPEg==
X-CSE-MsgGUID: Kl7PnV8nTCq6XnjNNEd5cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="11485872"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="11485872"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 19:22:35 -0700
X-CSE-ConnectionGUID: dUm2vO+XTl2OKDpjlv/KbA==
X-CSE-MsgGUID: h833Yx6DRkCYmhL9HkX1Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="34541891"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 May 2024 19:22:33 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5yr9-00084F-0a;
	Sun, 12 May 2024 02:22:31 +0000
Date: Sun, 12 May 2024 10:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: Anjali K <anjalik@linux.ibm.com>, mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/perf: set cpumode flags using sample address in
 the PPMU_ARCH_31 case
Message-ID: <202405121056.KfeNJMXV-lkp@intel.com>
References: <20240511075344.1393631-1-anjalik@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240511075344.1393631-1-anjalik@linux.ibm.com>
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
Cc: anjalik@linux.ibm.com, kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Anjali,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dd5a440a31fae6e459c0d6271dddd62825505361]

url:    https://github.com/intel-lab-lkp/linux/commits/Anjali-K/powerpc-perf-set-cpumode-flags-using-sample-address-in-the-PPMU_ARCH_31-case/20240511-202416
base:   dd5a440a31fae6e459c0d6271dddd62825505361
patch link:    https://lore.kernel.org/r/20240511075344.1393631-1-anjalik%40linux.ibm.com
patch subject: [PATCH] powerpc/perf: set cpumode flags using sample address in the PPMU_ARCH_31 case
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240512/202405121056.KfeNJMXV-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405121056.KfeNJMXV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405121056.KfeNJMXV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/perf/core-book3s.c: In function 'perf_get_misc_flags':
>> arch/powerpc/perf/core-book3s.c:270:13: warning: unused variable 'marked' [-Wunused-variable]
     270 |         int marked = mmcra & MMCRA_SAMPLE_ENABLE;
         |             ^~~~~~


vim +/marked +270 arch/powerpc/perf/core-book3s.c

1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  265  
98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  266  static inline u32 perf_get_misc_flags(struct pt_regs *regs)
98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  267  {
33904054b40832 arch/powerpc/perf/core-book3s.c    Michael Ellerman       2013-04-25  268  	bool use_siar = regs_use_siar(regs);
d9f7088dd6d885 arch/powerpc/perf/core-book3s.c    Athira Rajeev          2020-10-21  269  	unsigned long mmcra = regs->dsisr;
d9f7088dd6d885 arch/powerpc/perf/core-book3s.c    Athira Rajeev          2020-10-21 @270  	int marked = mmcra & MMCRA_SAMPLE_ENABLE;
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  271  	unsigned long siar = mfspr(SPRN_SIAR);
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  272  	unsigned long addr;
98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  273  
75382aa72f0682 arch/powerpc/perf/core-book3s.c    Anton Blanchard        2012-06-26  274  	if (!use_siar)
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  275  		return perf_flags_from_msr(regs);
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  276  
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  277  	/*
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  278  	 * If we don't have flags in MMCRA, rather than using
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  279  	 * the MSR, we intuit the flags from the address in
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  280  	 * SIAR which should give slightly more reliable
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  281  	 * results
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  282  	 */
cbda6aa10bd2d9 arch/powerpc/perf/core-book3s.c    Michael Ellerman       2013-05-15  283  	if (ppmu->flags & PPMU_NO_SIPR) {
a2391b35f1d9d5 arch/powerpc/perf/core-book3s.c    Madhavan Srinivasan    2016-12-24  284  		if (is_kernel_addr(siar))
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  285  			return PERF_RECORD_MISC_KERNEL;
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  286  		return PERF_RECORD_MISC_USER;
1ce447b90f3e71 arch/powerpc/perf/core-book3s.c    Benjamin Herrenschmidt 2012-03-26  287  	}
98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  288  
7abb840b496f83 arch/powerpc/kernel/perf_event.c   Michael Neuling        2009-10-14  289  	/* PR has priority over HV, so order below is important */
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  290  	if (regs_sipr(regs)) {
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  291  		if (!(ppmu->flags & PPMU_ARCH_31))
7abb840b496f83 arch/powerpc/kernel/perf_event.c   Michael Neuling        2009-10-14  292  			return PERF_RECORD_MISC_USER;
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  293  	} else if (regs_sihv(regs) && (freeze_events_kernel != MMCR0_FCHV))
cdd6c482c9ff9c arch/powerpc/kernel/perf_event.c   Ingo Molnar            2009-09-21  294  		return PERF_RECORD_MISC_HYPERVISOR;
5682c460264149 arch/powerpc/perf/core-book3s.c    Michael Ellerman       2013-04-25  295  
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  296  	/*
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  297  	 * Check the address in SIAR to identify the
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  298  	 * privilege levels since the SIER[MSR_HV, MSR_PR]
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  299  	 * bits are not set correctly in power10 sometimes
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  300  	 */
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  301  	if (ppmu->flags & PPMU_ARCH_31) {
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  302  		addr = siar ? siar : regs->nip;
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  303  		if (!is_kernel_addr(addr))
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  304  			return PERF_RECORD_MISC_USER;
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  305  	}
c1c4353f6493af arch/powerpc/perf/core-book3s.c    Anjali K               2024-05-11  306  
7abb840b496f83 arch/powerpc/kernel/perf_event.c   Michael Neuling        2009-10-14  307  	return PERF_RECORD_MISC_KERNEL;
98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  308  }
98fb1807b97e3e arch/powerpc/kernel/perf_counter.c Paul Mackerras         2009-06-17  309  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
