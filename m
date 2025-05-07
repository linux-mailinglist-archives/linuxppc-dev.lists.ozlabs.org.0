Return-Path: <linuxppc-dev+bounces-8379-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C7EAADDC8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 13:53:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZstvQ3R5Wz2y8W;
	Wed,  7 May 2025 21:53:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746618818;
	cv=none; b=IEZxsu/+FInS5ftrzzGgD+CIIVDLnzLmh3TvKcAJ8Aooso0Uu1b3FDyLRJu30Ipmy8HswSP5C/3OSb9azYTqfb1Z7yla4L8y2PWrh0iODL0uofyhAHyosdZBcHdwSxPJestxS0YeRVdzG4HRPoNZTDfIU8KEstIGPwKxb0t/UQnyaegE2EKgXrZqpkuwXJeZkJDW25hvzu7PprNXyfuQ07gSyGHex5QdxYcrIel8DcfQcg3Gi002YFtpzzmeMn7hYN3aQvULRtSNi1Pws5zsOmJfmKsBx344kjtn/2Vc70RA1bs4lxOAG2Yj7sTuUTKDu3aKBHyN3rpmpuOHuMWzcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746618818; c=relaxed/relaxed;
	bh=e2to3al3zB/dCSwNER/F7O+X5fTG8/d0mwyMmqNC3Z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROcri+vHlrEEl3Ld7ZkMVYwfAo7PtSEiJuLX13RyYnr+edNQYdhoPWCdwaIozRvCDiRHtcICo7/+aaxs/gIHaX99boe0TFrk72B8DG+gz1pnAYGz/4LHI/4HD1y3+mEjLfQhcQKPbZHxhpR53DUFHL9s4N/hGUekkwSsQ7fA79iFWGhTvXiFfB+iP5TTP9cOh7Zv7wXyueody0Zhm9izcvMZFV2mZO/uUYRSyG/wmnEaa8wg+WNXRG7ePkZkVbIQKpObX/eC2pNRBQSmMixhtZAJfYobxJdGJAWZe87qMhJYlLGRP/kaYlIrCRc+1gX0ZBJL2d40/EROho40pSo17A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TBDv5P01; dkim-atps=neutral; spf=pass (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TBDv5P01;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZstvN1TJPz2xrL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 21:53:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746618817; x=1778154817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=72Scb1V0hycsXKAsGR/ifXYu2GLLvEtvC8pJoVQX4Zo=;
  b=TBDv5P01BxzNg9HC3QympmgsJdEN4uNwwwLYQMIcazEydYF6u5Dr1BUS
   8PS2leV37XOuKSM5UgMwJ2+LzhvcbtHuTNb7tu25jlo5/i24XfcaRgIjD
   KCzEux3dUKXi1VEWFLEaAfVgEcAdUb9WG4gxMEew/b1E0CtqIZOXbPuvK
   rQzZBYBKdSl0gK9k4fWyL4PiwlHSvwbhEM9+vOtef06kE7XlXG7MuZESR
   9sHzlzMszlLlSvSwbVheIs0BEMNoIK5bRi1v614pZp+VZ/uTuvalis0aI
   ckHE/cLMZVrBr6OBZ91OBAq8vDeAoY7WD7loJhYRrcU0nMTqlg3X09W66
   A==;
X-CSE-ConnectionGUID: sjINpQ5CQ1Gxf/GG29AXiQ==
X-CSE-MsgGUID: XQL/E9frR4C6z35+UjeJEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59332539"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="59332539"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 04:53:31 -0700
X-CSE-ConnectionGUID: LhlCLecGS0Kjox3SYmsO2w==
X-CSE-MsgGUID: pWiazrmQTcC6g3fF7eWhUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135898621"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 May 2025 04:53:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCdL4-0007il-1W;
	Wed, 07 May 2025 11:53:26 +0000
Date: Wed, 7 May 2025 19:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, npiggin@gmail.com,
	naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH 3/6] powerpc/perf:make isa207_pmu_format_group struct
 static
Message-ID: <202505071909.iZZsdCTI-lkp@intel.com>
References: <20250422131040.374427-4-maddy@linux.ibm.com>
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
In-Reply-To: <20250422131040.374427-4-maddy@linux.ibm.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Madhavan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes powerpc/topic/ppc-kvm linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Madhavan-Srinivasan/powerpc-kvm-Fix-sparse-warning/20250422-211309
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250422131040.374427-4-maddy%40linux.ibm.com
patch subject: [PATCH 3/6] powerpc/perf:make isa207_pmu_format_group struct static
config: powerpc64-randconfig-002-20250424 (https://download.01.org/0day-ci/archive/20250507/202505071909.iZZsdCTI-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071909.iZZsdCTI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071909.iZZsdCTI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/perf/isa207-common.c:40:37: warning: unused variable 'isa207_pmu_format_group' [-Wunused-const-variable]
      40 | static const struct attribute_group isa207_pmu_format_group = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/isa207_pmu_format_group +40 arch/powerpc/perf/isa207-common.c

    39	
  > 40	static const struct attribute_group isa207_pmu_format_group = {
    41		.name = "format",
    42		.attrs = isa207_pmu_format_attr,
    43	};
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

