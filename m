Return-Path: <linuxppc-dev+bounces-13177-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9B9BFEDCC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 03:40:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csTHw0lFvz30RJ;
	Thu, 23 Oct 2025 12:40:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761183627;
	cv=none; b=iXTbksjCV+dgrXOrm1FgzHEDey7iRDzaJyu2ytdyTo2nfWSUF9Zu8eVBnch3bt43cT21qsNGKS+YbyoGTrTj12K5i7E4+UcMddwe0cN4i2UnFI5IiDmdPQ8GGTC9QviJNyAOF2eOzozu+bzI5vpzE15+CLX6cbsGc1FRDuvNh9c6zw7nkrplNpI/JOCF5BVOzF4THacSpRI5ix8mxzh6Ne2yUZ6dYsp0lG5VqlvutlfHiw8pAt4bLlV3rv8ZOetmA6TWfTv1d4Abyj0xymvGv7N9xJ0S5dK+JQWnPPF1j9to5xDOxt44dlBcmXhADTJADbkkWkXSYy8BIdfYN8cDyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761183627; c=relaxed/relaxed;
	bh=lzV9xt3KSmoIZr5cfsgBBpVWIXhPumClDZoob6Mok5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NXzXH20+6zYjVeO618n2ZGI70oOT86DNeaJSw59k9vGCFPHjkoQNCAJZa2cMepID0SJuiapRlzr2wRtRJ49oUEBxX+bQ3LdHrxwppsQ20z7j1Ax2FKYpMqmKGPpwjYUdAxn2Tzzkz6GkJmz/v/x9HG76stOFlmcYCv3QQ/0Th8pyXFoQblX/9KtuHZ9s7nZYY2zIm6TC2osqoj/Pf52per/CSaoi4GarMmiWEavQpZPsSEOGa8ygbruaUuUJvqDY1dU6/Ck46vBaiscDA2vaOqLI6ilJgt6sgMxSE9ja65Ug3UHm53sc1/le/L528SBwPqkUvwZtc14NFn03RbQ4HQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iZQdZ8t3; dkim-atps=neutral; spf=temperror (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iZQdZ8t3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csTHs06h9z2ypw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 12:40:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761183625; x=1792719625;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oZkGvsa5fOiEdUhyhVdjRJC8Ui90zAcPhXfTsGvKsJY=;
  b=iZQdZ8t3WBgTAmQ1l4J52fzrDvDeOGRwyrautMZOceAK3/7u+uU7AVj7
   +hhHzAu4xiLGTh88K0Yz0G4TEKFdMpxSaEBUtBR64Y8CetFlID+ZqGu5k
   HMk6ziHkftZoEaSSkv/9U6cf41C9wc65FuxFHqdDKTu5aONYOJsZD2uPx
   OJeKp5A6zhwoIxyJYZjj7MmHCm52HbX/FdMUzTMBjgDFoLJ/ZO9EVCz3Q
   dZyC7zKAkvueAKqG0gtJy8osB+kT/2LMUxFblx8xG2jviS0mASPvf+k0o
   t8ke/0OUipAvutFFo8vOtqLHbkGz1eG9aMCFoJ4UI7GSgtszz0bN6xjVg
   A==;
X-CSE-ConnectionGUID: j46bueVVTtKGQHGbxf80fg==
X-CSE-MsgGUID: qg4kRWSqTcuEON8vIbFRwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80781922"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="80781922"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 18:40:00 -0700
X-CSE-ConnectionGUID: 9BYK8rGERRifXgAcMX3gSQ==
X-CSE-MsgGUID: XNMn9wNMQnS5RFWw3f8RJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="183725148"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Oct 2025 18:39:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBkJ1-000Ctf-14;
	Thu, 23 Oct 2025 01:39:55 +0000
Date: Thu, 23 Oct 2025 09:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: Re: [PATCH] powerpc/kdump: Add support for crashkernel CMA
 reservation
Message-ID: <202510230923.E37rbvtF-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.18-rc2 next-20251022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/powerpc-kdump-Add-support-for-crashkernel-CMA-reservation/20251022-182711
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20251022102531.657147-1-sourabhjain%40linux.ibm.com
patch subject: [PATCH] powerpc/kdump: Add support for crashkernel CMA reservation
config: powerpc-randconfig-002-20251023 (https://download.01.org/0day-ci/archive/20251023/202510230923.E37rbvtF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230923.E37rbvtF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230923.E37rbvtF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/kexec/core.c:37:27: warning: unused variable 'cma_size' [-Wunused-variable]
      37 | static unsigned long long cma_size;
         |                           ^~~~~~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +/cma_size +37 arch/powerpc/kexec/core.c

    35	
    36	
  > 37	static unsigned long long cma_size;
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

