Return-Path: <linuxppc-dev+bounces-6746-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDFBA50378
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 16:29:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7GgS098bz3c5W;
	Thu,  6 Mar 2025 02:29:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741188563;
	cv=none; b=fOyd/zIxoklHqPVVftGzh7Lt6tgaopQEZmHzM+4Hyr9TdoIUqfb522PdFjLLGFv/XX34hvbg5QuLwgWAkdwg182qcNEes9dBd91PW8rQEqZ2mcPuAo0BJjQnQTeMcoRtI5CfMq6EgPOsaGvha9pFlL5b/TAUq7+xHD4pHEOCHrZU5H53+xMbzxaM0EwF37WM4LybV9UMsWNdMBAmG5imZAWY3mC6OWzsf6gi8HoCDA4P8ulfnMe459wyOF1shPgtey9QpUGE8jOFmoiGFu9yOqXZHy6PqZ7FXz6hfESkG9Y017dD1lu1nvTu8HYcIrYUlpnag9uoqd8UsKpeofm+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741188563; c=relaxed/relaxed;
	bh=5QdVZDT79DfdSF1GXZ6K9ChcbKQE0Jar6pMlDySpAs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/tFhqwp4J5sbNIMxoqAE2yEy1VlsELXGqFOvfZj46pmm4iD/ML/F/p1ZcUwqIVscgBpHUTVzU4JnYRCkfAQ70QoMEadYoS4WC952J+SUOloRACjCy+bV2+rS1SDl67wYDnv+XRYOh6KdUjkwfqbYSYG5jO8VGBsS01a4Gszl5HvYkq0JR76gs2YQ+89WnwbMiJYSs8/JxqHcmx2t/LtApn5ZPSpV3h/H3fUFBuyRvofHofYAhgZpQJOewYFaHjV+HLt19ZcczdUU5dA+rEpuRZI/VViAuq8IDFpgwiU6XGGnb1nHy9Umcnddx55iRkidQhYb98RyCHgKnwxSASaaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xx1dMPoj; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xx1dMPoj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7GgP2hDZz3c1Q
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Mar 2025 02:29:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741188562; x=1772724562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=brd6qryqI2OqJ10VAvgsstU48fVOEBGewa4UW9hHXTM=;
  b=Xx1dMPojwIaIAihFI4hRiNN6uI4zVPW5QTAmJyogcRJcWxmHiSFcvk1S
   Sm/k1mVuJayh414klL27bXzhBR050JwyvXJBQJzbadldi680Cr9VaJwuB
   00QbX9O8ZNMe/40tIn8ghmpZSUMlcikFMBIwzv8tvhchYYy9+gT7h9Bj6
   VwzPMyrqbLSJV441n76Yw1+P+F8PVPryvYq09LAY6v++a6qjvaXCRN6we
   3WyGbT3ba0ZxuDA82KHTNh3SCpI5Ko6zDKD+mDvv3TnO+s9yiwJtWtLb5
   oB2NkGJdcNWyryhy9KT4wefJdvcWcLxnsYy3fj0hxypTHI+LiLjLBi3Fy
   w==;
X-CSE-ConnectionGUID: JDmdu/GTQhq3hghV4XdIiA==
X-CSE-MsgGUID: AF1EadwxTMSM6+s5Yk3D+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42064429"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="42064429"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 07:29:15 -0800
X-CSE-ConnectionGUID: pndPWfs6QyOmC1DOheMvlg==
X-CSE-MsgGUID: 7knxXuWqScyOLLQ9jGacrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119640346"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 05 Mar 2025 07:29:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpqgG-000L9W-3A;
	Wed, 05 Mar 2025 15:29:08 +0000
Date: Wed, 5 Mar 2025 23:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH v2 1/4] powerpc/perf/core-book3s: Avoid loading platform
 pmu driver during dump kernel
Message-ID: <202503052346.eTbppObo-lkp@intel.com>
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
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Madhavan,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Madhavan-Srinivasan/powerpc-perf-hv-24x7-Avoid-loading-hv-24x7-during-dump-kernel/20250302-022531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250301182310.6832-1-maddy%40linux.ibm.com
patch subject: [PATCH v2 1/4] powerpc/perf/core-book3s: Avoid loading platform pmu driver during dump kernel
config: powerpc64-randconfig-001-20250305 (https://download.01.org/0day-ci/archive/20250305/202503052346.eTbppObo-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503052346.eTbppObo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503052346.eTbppObo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/perf/core-book3s.c:2599:6: error: call to undeclared function 'is_kdump_kernel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2599 |         if (is_kdump_kernel() || is_fadump_active())
         |             ^
   1 error generated.


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

