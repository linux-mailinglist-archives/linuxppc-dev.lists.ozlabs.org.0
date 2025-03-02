Return-Path: <linuxppc-dev+bounces-6598-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D56ADA4B0E5
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Mar 2025 11:14:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5HqT3TWMz30RG;
	Sun,  2 Mar 2025 21:14:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740910469;
	cv=none; b=jjgIwEEAmXhiGtJx9uzFsYFGt7uazmo3laVTv5CEXamljkBnUU8CkN78H3EQND6UGZcxR/AU2Xsz2l9JJvGzZLfURPs+gyTUYhJRU1aTo+oZ69sZvYpeYiRMgQVLwAuzBsqDKibo5WEowwgPggtKwZOeNkYFnDrjKMMWqfbSpr/Hui4fSiiSPvYoK4J7fjV+VOA5K33T+2J1JcPCBw122NHf9PoW4DpN7y8z3G7ehRIyIqwhRiWZpOK8fYqw66XBLeMEb4ltbmNNBcgih/lhX1XNuAxHhUAjdzcpUtApzR2RMQIT8YVnoYrsgSP7U7ULz/sjxsXQanfh2ORBl6D2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740910469; c=relaxed/relaxed;
	bh=IVvXupNW/sWy3XIuy3+yfkxn0uIvYltZ95OZyciM4+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2T/7fQgMH4eie5OdjyNdTSMj/XqvLGsKtxPha25VfbxaV9I3IRrd4fvSBMXT9zfFbsdoJlA2XZk7d07BVxx9GNPjNCgasq5giMY+fqhX4qmF7NyLmt3hNN3seAfzGPlFyZcpDeGo84fsNp6LJQCghD7/LHqJ6XTGXmAg5cHPAEOXUY4aN4t1G0X+Cz8Waz9bDXdNfoQ5neP5kN7lpletA80s7YRBwST9JjGpjXYxK9VYs44R+lDzrVMOYVFg22FgQD66cwNlBYG0MwJT9kv5aO7Xpi9BYU2nJiZ0rbcRbcqK6JBL+2NGfwlejVQDBCHRIHDQgav7UQw98Bi+osnzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fioWX4J3; dkim-atps=neutral; spf=pass (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fioWX4J3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5HqR15ccz303B
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Mar 2025 21:14:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740910467; x=1772446467;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JdTNwd1U8jreQAVVLAvpSDE+3S5NhoVQU4glg3o7XwQ=;
  b=fioWX4J3KAIiuVw296TpEZkAfKuZykWz1hvffm05JQxEFpqt84iz1OUw
   uJn6/K3x0LDTyoMFwA/6GZI0pzEszXecEyTtv6QXmypQvEhL7AgJoTwHf
   m8tsNQf9c0VbQMsl0PT1BGU4VnSg8zO2RwN/Lgz/aC5MWfTdW10fEzngN
   BRUfsredbhMAYwLC0pCeI5+F4AqDRz6cPmCmZYv0nCY228a5vplsnbpzt
   1iKrn4StxdmUU7GnB1EEWrWAOnGMBKlFsFjFAwaa7VSajaBwoGauQCQKc
   JMdZHNz4t7mCYcuYmXF02gixH+hbdkEHEEPZC0raHRs+xHW/Qzm3chfz/
   g==;
X-CSE-ConnectionGUID: yDk33W07SJiTtB0OcUol+w==
X-CSE-MsgGUID: bqqco7oWQGeUEHVcZ9PP0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41036623"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="41036623"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 02:14:22 -0800
X-CSE-ConnectionGUID: Ysau1Y99QEugJM8OB4AptQ==
X-CSE-MsgGUID: nRMYbUFGSWalvFl0NVpWFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118643300"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 02 Mar 2025 02:14:20 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1togKv-000HEo-2s;
	Sun, 02 Mar 2025 10:14:17 +0000
Date: Sun, 2 Mar 2025 18:13:28 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH v2 1/4] powerpc/perf/core-book3s: Avoid loading platform
 pmu driver during dump kernel
Message-ID: <202503021712.eVdjymsT-lkp@intel.com>
References: <20250301182310.6832-1-maddy@linux.ibm.com>
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
In-Reply-To: <20250301182310.6832-1-maddy@linux.ibm.com>
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Madhavan,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Madhavan-Srinivasan/powerpc-perf-hv-24x7-Avoid-loading-hv-24x7-during-dump-kernel/20250302-022531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250301182310.6832-1-maddy%40linux.ibm.com
patch subject: [PATCH v2 1/4] powerpc/perf/core-book3s: Avoid loading platform pmu driver during dump kernel
config: powerpc64-randconfig-001-20250302 (https://download.01.org/0day-ci/archive/20250302/202503021712.eVdjymsT-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021712.eVdjymsT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021712.eVdjymsT-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/perf/core-book3s.c: In function 'init_ppc64_pmu':
>> arch/powerpc/perf/core-book3s.c:2599:13: error: implicit declaration of function 'is_kdump_kernel' [-Wimplicit-function-declaration]
    2599 |         if (is_kdump_kernel() || is_fadump_active())
         |             ^~~~~~~~~~~~~~~


vim +/is_kdump_kernel +2599 arch/powerpc/perf/core-book3s.c

  2587	
  2588	static int __init init_ppc64_pmu(void)
  2589	{
  2590		if (cpu_has_feature(CPU_FTR_HVMODE) && pmu_override) {
  2591			pr_warn("disabling perf due to pmu_override= command line option.\n");
  2592			on_each_cpu(do_pmu_override, NULL, 1);
  2593			return 0;
  2594		}
  2595	
  2596		/*
  2597		 * If the dump kernel is active, skip loading these drivers
  2598		 */
> 2599		if (is_kdump_kernel() || is_fadump_active())
  2600			return 0;
  2601	
  2602		/* run through all the pmu drivers one at a time */
  2603		if (!init_power5_pmu())
  2604			return 0;
  2605		else if (!init_power5p_pmu())
  2606			return 0;
  2607		else if (!init_power6_pmu())
  2608			return 0;
  2609		else if (!init_power7_pmu())
  2610			return 0;
  2611		else if (!init_power8_pmu())
  2612			return 0;
  2613		else if (!init_power9_pmu())
  2614			return 0;
  2615		else if (!init_power10_pmu())
  2616			return 0;
  2617		else if (!init_power11_pmu())
  2618			return 0;
  2619		else if (!init_ppc970_pmu())
  2620			return 0;
  2621		else
  2622			return init_generic_compat_pmu();
  2623	}
  2624	early_initcall(init_ppc64_pmu);
  2625	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

