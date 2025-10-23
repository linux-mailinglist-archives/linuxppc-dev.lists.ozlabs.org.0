Return-Path: <linuxppc-dev+bounces-13178-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C512BFEE3E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 04:03:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csTpZ5BwKz30RJ;
	Thu, 23 Oct 2025 13:03:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761185014;
	cv=none; b=Kb82svWtvuCAqoIfdvEkEWqYaafc8Hyid+doPvKh17HtazYS3lnrRIylNJAGR0cvvUw2cbZRyqTF7FJiH+OIbxqVbH9cep0eOg+UsLeVJ3499W0SeHdSTnVTzlZ9WXTUSKZt9v/pbs2XGElZfxP51JmaOpFdUdQhQ+t2FjZSU21ks1ZlIHyinyiBp4mW9X3VNkAcmU9IhQHmgmWHOoqZcsHurmBER1rwfOiddoz8gx7V0kQHYRY5fjvAQB9csmMaK+hSIszwumc+ENOITfTYX+/xz/Dai+zQXwYbyWvgy9LDtNdCPOVGVdxmbu/IaYkajN9b613ibxQ9WESVSaewlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761185014; c=relaxed/relaxed;
	bh=EMOEiAsYmfOuMiQNSmdsiWNNvvlkIE8VKAtlrh9Keb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZ5555v7SWZYLc+aiPEXVRfaw4Vh5u4KxKb/FI+/WTeByeWCbRCE7Wy46Nhq3DFGvtcEeiTb76Sp9S5s4yKC+8oL4tBcEuL54EfylC9A5T9r9BILbpuI9BnRinqqxqiFmO3h9ni7BKgZVQQeuwaM5Hu+pQoFKZIi0fbDgBSCmyN4XKb6WFtgT/a6ZLlBMZZ6/bPir7bdV8/kfBs6mjGE/P3SjIiwvQIM4iyHbPSTHf7vc5j3sQICGGae7a8IQgTMcG7635N0tOyCHej06/RYflFw2PME4r75WzEQS4iCRRMh3b3VLHaUIoVjZNJyWT1b1tOxEPO8bb8+YvfcOMLSvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BE2GKljw; dkim-atps=neutral; spf=pass (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BE2GKljw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csTpX1xLmz304l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 13:03:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761185012; x=1792721012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YwSrUGOxOaKXPdeTsvwuuKTRFdGcmVg+sPi5rrY3W8g=;
  b=BE2GKljwf2+ERdVvMqWHfU9PlmhWsGbeuEqK2SKHFHr/woxjfohITSrm
   5gorUp7X6vRKY6POMsUAHWV4COqPEzDic9dKnxNPucE4W4NRfAANqSbZG
   EsMmBLogaq1YwvujnkyQAWLs0FwQpjkf7Dj8tbQ+8NuGRbtId+1izBNJR
   gWLa7VbBXLTbT0bpW2BmuuahFSD7cn1o8C98ALWPpzQ22Uh2BeN/XNvm4
   Dxf/znrOWKnC6jg/IZCPHtHQz61yVF+ep4+keggXSAjJt0kRI+01wjlsf
   jjzdw2Tbp7meBNqR7j8jTFyqtg9kqvYP7z1t1WTH7HlvN02QnQ5KZGo9a
   g==;
X-CSE-ConnectionGUID: 6HkUoVYFRQ+GM0vKxKeI6g==
X-CSE-MsgGUID: +c32oX7BRdi0E9G0mBEDyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65960629"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="65960629"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 19:03:28 -0700
X-CSE-ConnectionGUID: ZOnzMz2wQbG8PC8sssel7A==
X-CSE-MsgGUID: 8iXx2VtIQnapVrtkHT+3Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="207687763"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Oct 2025 19:03:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBkfj-000Cv3-0V;
	Thu, 23 Oct 2025 02:03:23 +0000
Date: Thu, 23 Oct 2025 10:03:19 +0800
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
Message-ID: <202510230903.b7vsK8xg-lkp@intel.com>
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
config: powerpc64-randconfig-002-20251023 (https://download.01.org/0day-ci/archive/20251023/202510230903.b7vsK8xg-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230903.b7vsK8xg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230903.b7vsK8xg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kexec/core.c:136:13: error: redefinition of 'kdump_cma_reserve'
     136 | void __init kdump_cma_reserve(void)
         |             ^~~~~~~~~~~~~~~~~
   In file included from include/linux/kexec.h:38,
                    from arch/powerpc/kexec/core.c:10:
   arch/powerpc/include/asm/kexec.h:61:20: note: previous definition of 'kdump_cma_reserve' was here
      61 | static inline void kdump_cma_reserve(void) { }
         |                    ^~~~~~~~~~~~~~~~~


vim +/kdump_cma_reserve +136 arch/powerpc/kexec/core.c

   135	
 > 136	void __init kdump_cma_reserve(void)
   137	{
   138		if (cma_size)
   139			reserve_crashkernel_cma(cma_size);
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

