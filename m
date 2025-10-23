Return-Path: <linuxppc-dev+bounces-13176-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C64DBFEBD6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 02:25:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csRdj2fMxz30RJ;
	Thu, 23 Oct 2025 11:25:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761179145;
	cv=none; b=MZ9YbChSR8LxubDnMeJ4Vp235uqJ/KdyeMkbXxW4z7YklqlmsTbA3hYqnoJHwv3z7/aAabvnp9XNk73uwpVnBbSX4H869fegwMmktZdAMU4L/nBe4ujxS80fEFmMEiPP1mLHYOC3Fs/2Z4a5RonXUagLYtktyBaEq5ipzOvtnyk34JB6+j+05o9W5HOz3v90QNRMce4qgK3yUd3H2yI3z57KhPDlpzfhxGoZf/IfQe7ZcHlcB6TviLqXX7O8ylX9fDrq1PcyN5c2Jx6jdLQGFyLP3DbCLDV6DS3bKE4eUNzjT6tLvDOw0ufx4/9maEqt3kSnFF19gJ7WM3j/KRrgAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761179145; c=relaxed/relaxed;
	bh=UTdw5fNqYeaCXOptGdXixaHSTv4+nhlrdRr9P7TERSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Do7qvz9vvRW9MjDLpdGO1CTN5TEYYxVuROfsL7rNzw5SA1iSVRu4fN/R2T/za596YpAqK75B+gRcUtQEuRtgV1H62Y8wCidexDMsXuWpjvep1gcgxVbmAixet7Z4asC0JqXbYVGYYnFTPCZ+uKRqYlz3EjZMnVkG62hPZotXD0UgfBQhusih32wx2pC6+bEBREhGSup3va25FKQSH2Df3F8E8PI81JCi04xQYH4HTXH8U9KHl87S6jPCDxWsQ0c6jjH52r81nCU3xA1L1IF0EoHGXkh19cxTS4Wu7WLqgHu7NmJ+KYAUEwZJrRqDh9TFosykGjHO9PY+OtnzU6na1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GNYA9iep; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GNYA9iep;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csRdf0TnPz306d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 11:25:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761179142; x=1792715142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u39zB8DoqW+d3c/PCARd9B+XH0IAT0xW8YupK0LYr/Y=;
  b=GNYA9iepq0dyLnSLw3C6WiviFzOAzSTOH5TduY3eveEbz6O4wA4PwXhH
   qCU/czZwI2/Sbw/6f/9g8rsqnd0yiF6ObCghbi0AVsY+XscZBWuKS+N6q
   LzPRLfAVQL75GzIL8AcViZcvAE4lBqG3KuWxAdbgRvxYukd1SxiNC+l4b
   CvtGPMhpB+XjC3H5njWvsV2ZRWeDqCe+qZsgicCfJwuvxliCHk20YbkNe
   RxpOeKJ4Wab9GFFouUm9ZBeuFhJ0RZJO/qxOwhPCL1wvGdfGZ2ARSW102
   j5EjkZn4YldpbaPkBY9mzhn+dS22mKX1t3D5slwfM5NSri8GSVfQHo8Jc
   g==;
X-CSE-ConnectionGUID: +foo12xxR3W4fkiAF+2heQ==
X-CSE-MsgGUID: csSNJX2URKW/YUsgjA4ezQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63377099"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="63377099"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 17:25:36 -0700
X-CSE-ConnectionGUID: MH3z9HdyQJaZJhSDY1AjMg==
X-CSE-MsgGUID: 0jCOLzenRni+yqQbQuYPvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="183231508"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Oct 2025 17:25:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBj91-000CrB-23;
	Thu, 23 Oct 2025 00:25:31 +0000
Date: Thu, 23 Oct 2025 08:24:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: Re: [PATCH] powerpc/kdump: Add support for crashkernel CMA
 reservation
Message-ID: <202510230817.h1gNa0VV-lkp@intel.com>
References: <20251022102531.657147-1-sourabhjain@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022102531.657147-1-sourabhjain@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Sourabh,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.18-rc2 next-20251022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/powerpc-kdump-Add-support-for-crashkernel-CMA-reservation/20251022-182711
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20251022102531.657147-1-sourabhjain%40linux.ibm.com
patch subject: [PATCH] powerpc/kdump: Add support for crashkernel CMA reservation
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20251023/202510230817.h1gNa0VV-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230817.h1gNa0VV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230817.h1gNa0VV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/setup-common.c: In function 'setup_arch':
>> arch/powerpc/kernel/setup-common.c:1004:9: error: implicit declaration of function 'kdump_cma_reserve'; did you mean 'kvm_cma_reserve'? [-Wimplicit-function-declaration]
    1004 |         kdump_cma_reserve();
         |         ^~~~~~~~~~~~~~~~~
         |         kvm_cma_reserve


vim +1004 arch/powerpc/kernel/setup-common.c

   976	
   977		/* Print various info about the machine that has been gathered so far. */
   978		print_system_info();
   979	
   980		klp_init_thread_info(&init_task);
   981	
   982		setup_initial_init_mm(_stext, _etext, _edata, _end);
   983		/* sched_init() does the mmgrab(&init_mm) for the primary CPU */
   984		VM_WARN_ON(cpumask_test_cpu(smp_processor_id(), mm_cpumask(&init_mm)));
   985		cpumask_set_cpu(smp_processor_id(), mm_cpumask(&init_mm));
   986		inc_mm_active_cpus(&init_mm);
   987		mm_iommu_init(&init_mm);
   988	
   989		irqstack_early_init();
   990		exc_lvl_early_init();
   991		emergency_stack_init();
   992	
   993		mce_init();
   994		smp_release_cpus();
   995	
   996		initmem_init();
   997	
   998		/*
   999		 * Reserve large chunks of memory for use by CMA for kdump, fadump, KVM and
  1000		 * hugetlb. These must be called after initmem_init(), so that
  1001		 * pageblock_order is initialised.
  1002		 */
  1003		fadump_cma_init();
> 1004		kdump_cma_reserve();

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

