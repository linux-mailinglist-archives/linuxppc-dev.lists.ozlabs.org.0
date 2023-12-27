Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F98381F253
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 23:17:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YY/meQwZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0mG5656wz3cHF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 09:17:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YY/meQwZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0mFC6wSYz2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 09:16:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703715377; x=1735251377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=haSiWioFdYEaX5edVIPAkdNi0T7Z1JIzVo0tNJKrw5k=;
  b=YY/meQwZrrh47L1m03VXekIbZOBBN1aOFQoEdBWyFRe3BvJgTKd0zYFY
   lEC4zLgW6r6HJcbBl4rb8Rzdcjj1DIdbtjusPi6EoHw2GfjBW9unaCi1u
   XxLxI7vK1McjmB7zsUunk7d2gCaY7cU2TF1jGzqPBOoRlJy5xZrHbYvQS
   p94IygxECDM0o9QvLeaOEuUXDLtN2g9hE6OF7vn+QA+jVzeUVYm/X7VRn
   asba+9/AFVODVeWPQjvrVC7pJ7wcLpfTJlauKHc/vuXPmY8sjteeYitPO
   s0jCSa7ArBowgx/UsAkW2eSKlkEOsUk87N4vblWQ4rQmAWT786cpS9gFy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3781403"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="3781403"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 11:53:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="844246204"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="844246204"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 27 Dec 2023 11:53:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIZy1-000FiJ-0C;
	Wed, 27 Dec 2023 19:53:25 +0000
Date: Thu, 28 Dec 2023 03:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: Pingfan Liu <kernelfans@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCHv10 2/3] powerpc/kernel: Extend arrays' size to make room
 for a hole in cpu_possible_mask
Message-ID: <202312280350.GpyKSrB6-lkp@intel.com>
References: <20231227024126.12424-1-kernelfans@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231227024126.12424-1-kernelfans@gmail.com>
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
Cc: Baoquan He <bhe@redhat.com>, Pingfan Liu <piliu@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Ming Lei <ming.lei@redhat.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, oe-kbuild-all@lists.linux.dev, Hari Bathini <hbathini@linux.ibm.com>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Pingfan,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.7-rc7 next-20231222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pingfan-Liu/powerpc-kernel-Remove-check-on-paca_ptrs_size/20231227-104412
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20231227024126.12424-1-kernelfans%40gmail.com
patch subject: [PATCHv10 2/3] powerpc/kernel: Extend arrays' size to make room for a hole in cpu_possible_mask
config: powerpc-iss476-smp_defconfig (https://download.01.org/0day-ci/archive/20231228/202312280350.GpyKSrB6-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231228/202312280350.GpyKSrB6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312280350.GpyKSrB6-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: arch/powerpc/kernel/setup-common.o: in function `smp_setup_cpu_maps':
>> arch/powerpc/kernel/setup-common.c:440:(.init.text+0x6a): undefined reference to `paca_last_cpu_num'
>> powerpc-linux-ld: arch/powerpc/kernel/setup-common.c:440:(.init.text+0x72): undefined reference to `paca_last_cpu_num'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +440 arch/powerpc/kernel/setup-common.c

   413	
   414	/**
   415	 * setup_cpu_maps - initialize the following cpu maps:
   416	 *                  cpu_possible_mask
   417	 *                  cpu_present_mask
   418	 *
   419	 * Having the possible map set up early allows us to restrict allocations
   420	 * of things like irqstacks to nr_cpu_ids rather than NR_CPUS.
   421	 *
   422	 * We do not initialize the online map here; cpus set their own bits in
   423	 * cpu_online_mask as they come up.
   424	 *
   425	 * This function is valid only for Open Firmware systems.  finish_device_tree
   426	 * must be called before using this.
   427	 *
   428	 * While we're here, we may as well set the "physical" cpu ids in the paca.
   429	 *
   430	 * NOTE: This must match the parsing done in early_init_dt_scan_cpus.
   431	 */
   432	void __init smp_setup_cpu_maps(void)
   433	{
   434		struct device_node *dn;
   435		int cpu = 0;
   436		int nthreads = 1;
   437	
   438		DBG("smp_setup_cpu_maps()\n");
   439	
 > 440		cpu_to_phys_id = memblock_alloc(paca_last_cpu_num * sizeof(u32),
   441						__alignof__(u32));
   442		if (!cpu_to_phys_id)
   443			panic("%s: Failed to allocate %zu bytes align=0x%zx\n",
   444			      __func__, nr_cpu_ids * sizeof(u32), __alignof__(u32));
   445	
   446		for_each_node_by_type(dn, "cpu") {
   447			const __be32 *intserv;
   448			__be32 cpu_be;
   449			int j, len;
   450	
   451			DBG("  * %pOF...\n", dn);
   452	
   453			intserv = of_get_property(dn, "ibm,ppc-interrupt-server#s",
   454					&len);
   455			if (intserv) {
   456				DBG("    ibm,ppc-interrupt-server#s -> %lu threads\n",
   457				    (len / sizeof(int)));
   458			} else {
   459				DBG("    no ibm,ppc-interrupt-server#s -> 1 thread\n");
   460				intserv = of_get_property(dn, "reg", &len);
   461				if (!intserv) {
   462					cpu_be = cpu_to_be32(cpu);
   463					/* XXX: what is this? uninitialized?? */
   464					intserv = &cpu_be;	/* assume logical == phys */
   465					len = 4;
   466				}
   467			}
   468	
   469			nthreads = len / sizeof(int);
   470	
   471			for (j = 0; j < nthreads && cpu < nr_cpu_ids; j++) {
   472				bool avail;
   473	
   474				DBG("    thread %d -> cpu %d (hard id %d)\n",
   475				    j, cpu, be32_to_cpu(intserv[j]));
   476	
   477				avail = of_device_is_available(dn);
   478				if (!avail)
   479					avail = !of_property_match_string(dn,
   480							"enable-method", "spin-table");
   481	
   482				set_cpu_present(cpu, avail);
   483				set_cpu_possible(cpu, true);
   484				cpu_to_phys_id[cpu] = be32_to_cpu(intserv[j]);
   485				cpu++;
   486			}
   487	
   488			if (cpu >= nr_cpu_ids) {
   489				of_node_put(dn);
   490				break;
   491			}
   492		}
   493	
   494		/* If no SMT supported, nthreads is forced to 1 */
   495		if (!cpu_has_feature(CPU_FTR_SMT)) {
   496			DBG("  SMT disabled ! nthreads forced to 1\n");
   497			nthreads = 1;
   498		}
   499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
