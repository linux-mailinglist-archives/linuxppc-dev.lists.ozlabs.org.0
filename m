Return-Path: <linuxppc-dev+bounces-6891-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9619A5BF0A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 12:31:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBs6Y2CC1z3bqM;
	Tue, 11 Mar 2025 22:31:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741692709;
	cv=none; b=k4vdrXSdIoR7OGPayKsG5/KQM8nj214cT0WOeiDt6oTgX2zpoVe/P2BzowNYXxZrJFdMGGKlhf78OycKlWAdkoEbIPPpFoOm31NlHCRma4VrWjP510y+U4JpIJBS8qETF3agUghgQBvhc+8AJxFa6jfJTQL14LKaV8CWOYXyTugoGomTqbeZsv4WTxiWrRMUx1YVn/vC2zQzKXnNZlbWeCUnmAa+fGFL/RyXNwGa6yfP+4nTscr7jgpkWnFKaLMvk7dNO/q3dXOulplJFiqenC4BWG+9xjMkx2xCeDSfeqVi19kiobCm8Fp3Tig82I48xtnptkPQQCG7U0UYqyHm0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741692709; c=relaxed/relaxed;
	bh=Tha1HeM1oZokR4SggwKeVRt27eTH3Ju7wEEJCXN6XDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ic7Wp7nMm0Ys+Kx6vp27HBvDFf5tJDBnBSXyc2KAcZQG4/79bCilG8RnVvdxHeuYfTru5+hAayH/EUAEEDCY6pWdaJhOJh3CGdHqIAfXHk2EdbbOQTocyKQQt1xBCUt5GP25L3G1JnBx2HBXzbP57y9DR/LQ1Lciambb7gdf4ahlvm+/3yG9EiXAWQYe4EDknjGTKDTtrRbEck9E5f5YAtSY1c5OnxcmfEtSp51D0sUZ0NAs8GHOP2JFda/Syj0k133i+vjvLGH7DysFryYS09g7XYp1LYs46xff/5Z4XbiSY8Mrgz/kIb7+DXNMsuUBBnYdZjsPxL/6B54PkmFmkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gw6eAUgO; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gw6eAUgO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBs6T0Dt9z3bpx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 22:31:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741692705; x=1773228705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q4yzyZmUTCUmQKvJikZ41lz3PwHG+1gpcmxBdqweinI=;
  b=Gw6eAUgOULx+Hu7+6ekfwClgXsW+gWNSBC6NGmp2f2iZUkN4k946iOog
   tfVd1FSCXg1p7SWnGjBqEjWW6nBRLVLfiiL5NE4RTmwBmtuvgVghCO2SP
   VFeyxm+6Q/QiVADkKdAm5bwP4HzZN8oTjJpT48VSl2VpKU1YkEdXwNuDq
   DdwDVZGVV7RfxNgbMSoGeVl1X4fqCFW9AkagSAxqVhlHo9wDDzZseG0IE
   zjtwFaqDmAAnHoAj3ePdYewJZvoc+V/leuoQv73+qlOUFF+qshdZ33MHh
   BJYF34X5in3w41i1m2deamZ7h74qgoZRqKfr3dAVvIAAKSTXrwZ8iqEDr
   A==;
X-CSE-ConnectionGUID: e4GoCj5yQcS51BJ4cY2ReA==
X-CSE-MsgGUID: Gf7TFZeUT1uXpEoejidKqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="65182163"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="65182163"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 04:31:39 -0700
X-CSE-ConnectionGUID: f0K9stodQnC6IHVBGe50SQ==
X-CSE-MsgGUID: DN5oiFz4Q7yvMJOLdYBv8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="124897104"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 11 Mar 2025 04:31:36 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trxpe-0006c2-08;
	Tue, 11 Mar 2025 11:31:34 +0000
Date: Tue, 11 Mar 2025 19:31:23 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, msuchanek@suse.de, mahesh@linux.ibm.com,
	tyreld@linux.ibm.com, hbabu@us.ibm.com, haren@linux.ibm.com,
	sv@linux.ibm.com
Subject: Re: [PATCH v7 7/7] powerpc/pseries: Add a char driver for
 physical-attestation RTAS
Message-ID: <202503111945.ijp4Nbkl-lkp@intel.com>
References: <20250309213916.762116-8-haren@linux.ibm.com>
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
In-Reply-To: <20250309213916.762116-8-haren@linux.ibm.com>
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
patch link:    https://lore.kernel.org/r/20250309213916.762116-8-haren%40linux.ibm.com
patch subject: [PATCH v7 7/7] powerpc/pseries: Add a char driver for physical-attestation RTAS
config: powerpc64-randconfig-r072-20250311 (https://download.01.org/0day-ci/archive/20250311/202503111945.ijp4Nbkl-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503111945.ijp4Nbkl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503111945.ijp4Nbkl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/papr-phy-attest.c:137: warning: Function parameter or struct member 'seq' not described in 'phy_attest_sequence_begin'


vim +137 arch/powerpc/platforms/pseries/papr-phy-attest.c

   121	
   122	/*
   123	 * Internal physical-attestation sequence APIs. A physical-attestation
   124	 * sequence is a series of calls to get ibm,physical-attestation
   125	 * for a given attestation command. The sequence ends when an error
   126	 * is encountered or all data for the attestation command has been
   127	 * returned.
   128	 */
   129	
   130	/**
   131	 * phy_attest_sequence_begin() - Begin a response data for attestation
   132	 * command retrieval sequence.
   133	 *
   134	 * Context: May sleep.
   135	 */
   136	static void phy_attest_sequence_begin(struct papr_rtas_sequence *seq)
 > 137	{
   138		struct rtas_phy_attest_params *param;
   139	
   140		/*
   141		 * We could allocate the work area before acquiring the
   142		 * function lock, but that would allow concurrent requests to
   143		 * exhaust the limited work area pool for no benefit. So
   144		 * allocate the work area under the lock.
   145		 */
   146		mutex_lock(&rtas_ibm_physical_attestation_lock);
   147		param =  (struct rtas_phy_attest_params *)seq->params;
   148		param->work_area = rtas_work_area_alloc(SZ_4K);
   149		memcpy(rtas_work_area_raw_buf(param->work_area), &param->cmd,
   150				param->cmd_len);
   151		param->sequence = 1;
   152		param->status = 0;
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

