Return-Path: <linuxppc-dev+bounces-6887-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 175C6A5BC71
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 10:39:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBpdC3qYWz3bnB;
	Tue, 11 Mar 2025 20:39:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741685983;
	cv=none; b=elswQ76VVeQaQWELum6Z6m+bZj/7GBgkz7QzpiK7BrPvXiy4CkAUdbwQT7p33pPPkZheMsh85wKsXFh0dfZJIa3+8uz1TriQMt9MBaTQSRR12r51QTerW7AxqLFdSPY0IncHkMhlijSGXckF+RBJSfZdgeA2ADQtrgkb8ZiIO+Iu3TkNgHDRGvFf+j08uuAgmT++b4JgbD5PHFxfY+K5hOEZnVfeZCOCkN5XBgCgjyvuRLEKhEpPvANFkPysGKp1gqaQYwM7qLnVKTRfXQN7//8uNfPTS8V4e7h4MnQtQ/qkqKVE03XkZEJejQGFKwi/5JicDfUmwHjv0o4N5bkGyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741685983; c=relaxed/relaxed;
	bh=102wf9qd2ao6CQWIkgU3BxaLpSqzYGDhMeXtkxNmqtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOhEz0FvGEXsk+9b8RMctc1dxf5XQqj3agY90BCRm4lv/F2SIuKCBU/RMT/lW2vuczR+8YCDEKmOlA6nyQR1VOpbBYG78X/A0JnkZoLfY83JtwX/yKqcW7XkoZGTefbl3p3nVLmBHsdRWO7zQBeKu8y7md2KPPYvtkyCvIjr6oHXfbvRXy0TaQvZ5ZcPVRgiH3y8hH/wi6Yf/+CxqKGQaGKHGGub9aD0U4h6GY90CN06Rwhqhrt5N8xag8p8rFusos5AByhYMIr8K10IcLlJOcjixA15IQ+6MPaF4jnJ/TjdBTMN2UlizO1zLbXwVkZhlIc1ulJffv1Q2YCGsahB1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ipymuPYV; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ipymuPYV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBpd925szz3blv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 20:39:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741685981; x=1773221981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W+ThvGzyags0oy0GD0f6DFZf/gVocxjUqYpDIHny/is=;
  b=ipymuPYVxkiEP+3Az1xhzR/jFxBWOdcMtDTVC9P4BfRFs/1XMUwisw/h
   YLZ6rJDY22Gt8UrI68A+NDZE/RRfevtc5AYjZK7O77db8f6AfHaCYRvf1
   pp/9myqY9Deq9E4WKegoN7rQjBKjpGGrR4PcrqUGVvPsfVPYcdbexV0rX
   2hOyXKpDii5pou1UWjqqwLaMT7By9dgEtai48V6qhYHc9sk4niYwssB42
   Z8hnFU3AMgS26vGei/mogDsOVRRSXLBfuPzOGD/JY5Bv8xk1/koHLq95Q
   Wpz0fNUU1mMIiR4IboS4EeH+x8ilDcnrYERYlE2oZsA/quNip8PODqi0Y
   Q==;
X-CSE-ConnectionGUID: LbV7JIMcROCoIIybwuJYeA==
X-CSE-MsgGUID: p5Q+EzwrRRuRHk8c9xD2OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="53356860"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="53356860"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 02:39:35 -0700
X-CSE-ConnectionGUID: zmlavfLxSxOrlhQRGn1sdw==
X-CSE-MsgGUID: q1Pg65+qTAGO+/rVHn6w4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="121176978"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 11 Mar 2025 02:39:32 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trw57-0006XE-0P;
	Tue, 11 Mar 2025 09:39:26 +0000
Date: Tue, 11 Mar 2025 17:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, msuchanek@suse.de, mahesh@linux.ibm.com,
	tyreld@linux.ibm.com, hbabu@us.ibm.com, haren@linux.ibm.com,
	sv@linux.ibm.com
Subject: Re: [PATCH v7 3/7] powerpc/pseries: Add papr-indices char driver for
 ibm,get-indices
Message-ID: <202503111710.tsPk3Snj-lkp@intel.com>
References: <20250309213916.762116-4-haren@linux.ibm.com>
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
In-Reply-To: <20250309213916.762116-4-haren@linux.ibm.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Haren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.14-rc6]
[cannot apply to next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Define-common-functions-for-RTAS-sequence-calls/20250310-054319
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250309213916.762116-4-haren%40linux.ibm.com
patch subject: [PATCH v7 3/7] powerpc/pseries: Add papr-indices char driver for ibm,get-indices
config: powerpc64-randconfig-r072-20250311 (https://download.01.org/0day-ci/archive/20250311/202503111710.tsPk3Snj-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503111710.tsPk3Snj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503111710.tsPk3Snj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/papr-indices.c:124: warning: Function parameter or struct member 'seq' not described in 'indices_sequence_begin'


vim +124 arch/powerpc/platforms/pseries/papr-indices.c

   110	
   111	/*
   112	 * Internal indices sequence APIs. A sequence is a series of calls to
   113	 * ibm,get-indices for a given location code. The sequence ends when
   114	 * an error is encountered or all indices for the input has been
   115	 * returned.
   116	 */
   117	
   118	/**
   119	 * indices_sequence_begin() - Begin a indices retrieval sequence.
   120	 *
   121	 * Context: May sleep.
   122	 */
   123	static void indices_sequence_begin(struct papr_rtas_sequence *seq)
 > 124	{
   125		struct rtas_get_indices_params  *param;
   126	
   127		param = (struct rtas_get_indices_params *)seq->params;
   128		/*
   129		 * We could allocate the work area before acquiring the
   130		 * function lock, but that would allow concurrent requests to
   131		 * exhaust the limited work area pool for no benefit. So
   132		 * allocate the work area under the lock.
   133		 */
   134		mutex_lock(&rtas_ibm_get_indices_lock);
   135		param->work_area = rtas_work_area_alloc(RTAS_GET_INDICES_BUF_SIZE);
   136		param->next = 1;
   137		param->status = 0;
   138	}
   139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

