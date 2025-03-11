Return-Path: <linuxppc-dev+bounces-6877-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02037A5B9DD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 08:33:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBlqg3Y0Rz3bmN;
	Tue, 11 Mar 2025 18:33:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741678415;
	cv=none; b=h5zux9cPZDCUcnp5Ru0C/E9qRa1JSM+0f3AvuEqY3Vj8zPUe5T8Qe1vZ2Vs7KCC9jAsm77C5tmqk6mRjLLSGrKp9DtoBhlCFpz4EXjfuynjhfqBv7AMUH0NTEqKmXNGoreWmFfYD8FBBamZe68OouugFwKwPbBzOXSvIpFlYlu4IGhIo96qin8aU75JIlfRv9Ic7/sF0JKR8fRrrii/4NLytT/Oas0Ey0s+IUslIigbSPXM8qV6a3nvtkJWQivIsP9GOX42/LdCcE+RNXvLzVeKmhm4YZrRfrFlbD9ZiSR+zeDGqKJ1ivSRdagibqwahbxY+9p8bezYStFekHueQfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741678415; c=relaxed/relaxed;
	bh=MYDAm0HJLjznDghykeCZ61JVOtfYGi+IS7z3BcCiIPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQIa0S74RYjF6B090XJVrr2TRaDApvMSGS2oL9dXRkwTOdXLTxLIdsRhV0+5Q4PQ16EqUTmvQNHbSbHfXTtLoahycIzXXDoS/3HdppBpXwNY+GiMvvDjxSXhIViGnQ3y1cfDXwuqlPUWSguMoQ3jgOFoHbJ1x78N8wrflh2rf8XV/FxoGF9jREdsBnxlr3zYWzGfsjOTn/lO+wnG5iUgjRMGIoI7RRR+BZz9dvt8awec9get/XMGw0VE0tIyYXEibrX06tVOaZ+yf4bvkUC6CXIgXqfAl3wOL/YNu6wJVmwvtwdJ9UPN2MVhaljaQF8P7ddFyGPdisCpU1QkG8/SMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=coxerVde; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=coxerVde;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBlqc6pcpz3bmJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 18:33:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741678413; x=1773214413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bvZK6cFi7goNewHU3vBg2XkUUKxvFEMMbFjetmDHRJ0=;
  b=coxerVdeEra7Sw2wv5ov2xviVa63+wvby2FBurDf7j8065BxBvRO9HAZ
   pTPEB7IXoZmFNh3D7vYZOsPg33nYOZf81pnbAEwoBolxfu50HWdoxrrcs
   RdFo38VjhwdFywXNNisGJaMkIYVsYnmJ7pirPqprn6AEFchFh76haBFLP
   gSYDv21OosrcpcV4DHT1uwJhMLuJhA8kfvkZ6kwq1Tn+akp7PA7ajxRCg
   igUo5LaMmxyQO4fQjTGLCuOe5QlivI+oX0JS+NfADwqyvWxlbeUrhX60O
   9sdiVspQi7CKFySuKWuZ+sKVc3osD9G27ggTCcF4EmSYoHIzgc+9ZF/eP
   Q==;
X-CSE-ConnectionGUID: r+QuY4etQtWAA5vQk9c4iA==
X-CSE-MsgGUID: nrFxmXFjRzqrN3U58R/ChA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="60107135"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="60107135"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 00:33:29 -0700
X-CSE-ConnectionGUID: K+SKXOAgTtCjRvj0qjFCWA==
X-CSE-MsgGUID: DKPZBBEzSQC0oJzI/CQg0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="120467675"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 11 Mar 2025 00:33:25 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tru79-0006SC-1F;
	Tue, 11 Mar 2025 07:33:23 +0000
Date: Tue, 11 Mar 2025 15:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, msuchanek@suse.de, mahesh@linux.ibm.com,
	tyreld@linux.ibm.com, hbabu@us.ibm.com, haren@linux.ibm.com,
	sv@linux.ibm.com
Subject: Re: [PATCH v7 1/7] powerpc/pseries: Define common functions for RTAS
 sequence calls
Message-ID: <202503111557.y6cdjLzI-lkp@intel.com>
References: <20250309213916.762116-2-haren@linux.ibm.com>
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
In-Reply-To: <20250309213916.762116-2-haren@linux.ibm.com>
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
patch link:    https://lore.kernel.org/r/20250309213916.762116-2-haren%40linux.ibm.com
patch subject: [PATCH v7 1/7] powerpc/pseries: Define common functions for RTAS sequence calls
config: powerpc64-randconfig-r072-20250311 (https://download.01.org/0day-ci/archive/20250311/202503111557.y6cdjLzI-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503111557.y6cdjLzI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503111557.y6cdjLzI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/papr-vpd.c:127: warning: Function parameter or struct member 'seq' not described in 'vpd_sequence_begin'
--
>> arch/powerpc/platforms/pseries/papr-rtas-common.c:171: warning: Excess function parameter 'param' description in 'papr_rtas_retrieve'
>> arch/powerpc/platforms/pseries/papr-rtas-common.c:208: warning: Excess function parameter 'param' description in 'papr_rtas_setup_file_interface'
>> arch/powerpc/platforms/pseries/papr-rtas-common.c:255: warning: Function parameter or struct member 'status' not described in 'papr_rtas_sequence_should_stop'
>> arch/powerpc/platforms/pseries/papr-rtas-common.c:255: warning: Function parameter or struct member 'init_state' not described in 'papr_rtas_sequence_should_stop'


vim +127 arch/powerpc/platforms/pseries/papr-vpd.c

514f6ff4369a30b Nathan Lynch 2023-12-12  113  
514f6ff4369a30b Nathan Lynch 2023-12-12  114  /*
514f6ff4369a30b Nathan Lynch 2023-12-12  115   * Internal VPD sequence APIs. A VPD sequence is a series of calls to
514f6ff4369a30b Nathan Lynch 2023-12-12  116   * ibm,get-vpd for a given location code. The sequence ends when an
514f6ff4369a30b Nathan Lynch 2023-12-12  117   * error is encountered or all VPD for the location code has been
514f6ff4369a30b Nathan Lynch 2023-12-12  118   * returned.
514f6ff4369a30b Nathan Lynch 2023-12-12  119   */
514f6ff4369a30b Nathan Lynch 2023-12-12  120  
514f6ff4369a30b Nathan Lynch 2023-12-12  121  /**
514f6ff4369a30b Nathan Lynch 2023-12-12  122   * vpd_sequence_begin() - Begin a VPD retrieval sequence.
514f6ff4369a30b Nathan Lynch 2023-12-12  123   *
514f6ff4369a30b Nathan Lynch 2023-12-12  124   * Context: May sleep.
514f6ff4369a30b Nathan Lynch 2023-12-12  125   */
c657e2672fb8b67 Haren Myneni 2025-03-09  126  static void vpd_sequence_begin(struct papr_rtas_sequence *seq)
514f6ff4369a30b Nathan Lynch 2023-12-12 @127  {
c657e2672fb8b67 Haren Myneni 2025-03-09  128  	struct rtas_ibm_get_vpd_params *vpd_params;
514f6ff4369a30b Nathan Lynch 2023-12-12  129  	/*
514f6ff4369a30b Nathan Lynch 2023-12-12  130  	 * Use a static data structure for the location code passed to
514f6ff4369a30b Nathan Lynch 2023-12-12  131  	 * RTAS to ensure it's in the RMA and avoid a separate work
514f6ff4369a30b Nathan Lynch 2023-12-12  132  	 * area allocation. Guarded by the function lock.
514f6ff4369a30b Nathan Lynch 2023-12-12  133  	 */
514f6ff4369a30b Nathan Lynch 2023-12-12  134  	static struct papr_location_code static_loc_code;
514f6ff4369a30b Nathan Lynch 2023-12-12  135  
c657e2672fb8b67 Haren Myneni 2025-03-09  136  	vpd_params =  (struct rtas_ibm_get_vpd_params *)seq->params;
514f6ff4369a30b Nathan Lynch 2023-12-12  137  	/*
514f6ff4369a30b Nathan Lynch 2023-12-12  138  	 * We could allocate the work area before acquiring the
514f6ff4369a30b Nathan Lynch 2023-12-12  139  	 * function lock, but that would allow concurrent requests to
514f6ff4369a30b Nathan Lynch 2023-12-12  140  	 * exhaust the limited work area pool for no benefit. So
514f6ff4369a30b Nathan Lynch 2023-12-12  141  	 * allocate the work area under the lock.
514f6ff4369a30b Nathan Lynch 2023-12-12  142  	 */
514f6ff4369a30b Nathan Lynch 2023-12-12  143  	mutex_lock(&rtas_ibm_get_vpd_lock);
c657e2672fb8b67 Haren Myneni 2025-03-09  144  	static_loc_code = *(struct papr_location_code *)vpd_params->loc_code;
c657e2672fb8b67 Haren Myneni 2025-03-09  145  	vpd_params =  (struct rtas_ibm_get_vpd_params *)seq->params;
c657e2672fb8b67 Haren Myneni 2025-03-09  146  	vpd_params->work_area = rtas_work_area_alloc(SZ_4K);
c657e2672fb8b67 Haren Myneni 2025-03-09  147  	vpd_params->loc_code = &static_loc_code;
c657e2672fb8b67 Haren Myneni 2025-03-09  148  	vpd_params->sequence = 1;
c657e2672fb8b67 Haren Myneni 2025-03-09  149  	vpd_params->status = 0;
514f6ff4369a30b Nathan Lynch 2023-12-12  150  }
514f6ff4369a30b Nathan Lynch 2023-12-12  151  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

