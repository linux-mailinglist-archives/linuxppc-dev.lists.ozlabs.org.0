Return-Path: <linuxppc-dev+bounces-4672-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43704A017E2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jan 2025 03:54:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YQhjC0Jkpz30Nl;
	Sun,  5 Jan 2025 13:54:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736045646;
	cv=none; b=cBP5FIznDjt6DYbP97cPTJFa/LaIogOi15c8AKNDnXGcdbtIaJs8jPsT7QA3zB10PgxEaazcmzDJp0hFO2VDHrbF1jy5NULDUOnr0Pz5s9SBIqfpR5KkONeag8m57q50oOUghnhh0ooLNkbuimBF0ynmeUtkK97I6QQoy1okzlIrSCdz60UWf2jW0Jb1ND+3sIGCs7al9hpEg1oJaQ7zLcH12ag6RRYZYFlrTt3DuAO8wem/wTr/qNGAPIUXY2xP3uapC6oAXpqXyr4Jtv4ajsIAvS8MWxrdgSr6c7KQkUzOLyghk67X7cAqjyOJG/xsqNdiH+AXSkUV5GDl8Qaqmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736045646; c=relaxed/relaxed;
	bh=hhmVbYVaSUwafglPZY8UxYbOoBMEIiVg4tImqlo0oY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MT/g2YZMx3cIjamHkrVedGG48mT7AEuYex6QBaJH14XQfxgFqM5/kDqFB2vECSx0s0ywJWjEnGDbfD/Uh+fe/nI8z5kFxtV0OYcFvwxidIESi1LFKFpTrkxMF8dXoI8hBUlddu74giBSbJGsvamk6Gx75lJdeWECbENkkh7TvexARi+sO6OqnZjQQjVxOniV9Lr12QUREMoyA8QvYsVpU8IpWmBdMZbPqEJMC6B1k8qj4gmuUopD4tZhs5V+gUVOeheSZXPZIvc51UjXM1CAigkCfaOxajDeMBgzp3aUwpe5hjFFgJwtzDDMO9u++NT9u9aFeiv9wlpNrmTF2lTIlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lJ/6I7Hz; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lJ/6I7Hz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YQhj812YJz2yN2
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jan 2025 13:54:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736045644; x=1767581644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rY/aPCU1+vTru7w2Gb1RhVYhXvSRZj/O3GNHrH/M8i0=;
  b=lJ/6I7HzbHXaxw/r76fwE2p33SlY1OZBPjlC1QaeGYdlpyC6NCPEsKhd
   dhYBb0Yyxn1++SvdkRBSbMTbBav+JHQDRXZJlgQrleq7EnwYVuAcxcn7Q
   CWypz6kMdibq6GXePBejS+Oww4ajzpgT9V0EulWee3DtLf+HhfKU9QmOf
   dys6CfaP2jU72HUUNHmByOnWHtNEs9ZlzbF+SYuzOv1uqZfr0oBqex+Z3
   2qBQkb1usiTqhWhANxgNp09NP4ZlIb63UK/k4KP5iZz81+eFgZCiwcD0Z
   qwdxfmFWNYbmEavFvQDESN/iuEKAvqwwt7PBOUrF0kgmPjoZ54ep0i6aO
   g==;
X-CSE-ConnectionGUID: S/2MmBX0S1SH+qGy5AwWCw==
X-CSE-MsgGUID: G3jBjTsNRumfTe0pX7Gvkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="46812852"
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="46812852"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 18:53:56 -0800
X-CSE-ConnectionGUID: 0J8AoNZhQaSHL9cN7stF3w==
X-CSE-MsgGUID: IbGw47S0Qm60FO2YXIaEOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="139441945"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Jan 2025 18:53:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUGly-000BPn-2s;
	Sun, 05 Jan 2025 02:53:50 +0000
Date: Sun, 5 Jan 2025 10:53:24 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
	hbabu@us.ibm.com, haren@linux.ibm.com
Subject: Re: [PATCH 1/6] powerpc/pseries: Define common functions for RTAS
 sequence HCALLs
Message-ID: <202501051055.oZDoR4fH-lkp@intel.com>
References: <20250104204652.388720-2-haren@linux.ibm.com>
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
In-Reply-To: <20250104204652.388720-2-haren@linux.ibm.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Haren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Define-common-functions-for-RTAS-sequence-HCALLs/20250105-045010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250104204652.388720-2-haren%40linux.ibm.com
patch subject: [PATCH 1/6] powerpc/pseries: Define common functions for RTAS sequence HCALLs
config: powerpc64-randconfig-002-20250105 (https://download.01.org/0day-ci/archive/20250105/202501051055.oZDoR4fH-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501051055.oZDoR4fH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501051055.oZDoR4fH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/papr-vpd.c:141: warning: Function parameter or struct member 'param' not described in 'vpd_sequence_begin'
>> arch/powerpc/platforms/pseries/papr-vpd.c:141: warning: Excess function parameter 'loc_code' description in 'vpd_sequence_begin'


vim +141 arch/powerpc/platforms/pseries/papr-vpd.c

514f6ff4369a30 Nathan Lynch 2023-12-12  121  
514f6ff4369a30 Nathan Lynch 2023-12-12  122  /*
514f6ff4369a30 Nathan Lynch 2023-12-12  123   * Internal VPD sequence APIs. A VPD sequence is a series of calls to
514f6ff4369a30 Nathan Lynch 2023-12-12  124   * ibm,get-vpd for a given location code. The sequence ends when an
514f6ff4369a30 Nathan Lynch 2023-12-12  125   * error is encountered or all VPD for the location code has been
514f6ff4369a30 Nathan Lynch 2023-12-12  126   * returned.
514f6ff4369a30 Nathan Lynch 2023-12-12  127   */
514f6ff4369a30 Nathan Lynch 2023-12-12  128  
514f6ff4369a30 Nathan Lynch 2023-12-12  129  /**
514f6ff4369a30 Nathan Lynch 2023-12-12  130   * vpd_sequence_begin() - Begin a VPD retrieval sequence.
514f6ff4369a30 Nathan Lynch 2023-12-12  131   * @seq:      Uninitialized sequence state.
514f6ff4369a30 Nathan Lynch 2023-12-12  132   * @loc_code: Location code that defines the scope of the VPD to return.
514f6ff4369a30 Nathan Lynch 2023-12-12  133   *
514f6ff4369a30 Nathan Lynch 2023-12-12  134   * Initializes @seq with the resources necessary to carry out a VPD
514f6ff4369a30 Nathan Lynch 2023-12-12  135   * sequence. Callers must pass @seq to vpd_sequence_end() regardless
514f6ff4369a30 Nathan Lynch 2023-12-12  136   * of whether the sequence succeeds.
514f6ff4369a30 Nathan Lynch 2023-12-12  137   *
514f6ff4369a30 Nathan Lynch 2023-12-12  138   * Context: May sleep.
514f6ff4369a30 Nathan Lynch 2023-12-12  139   */
5d8b0014124124 Haren Myneni 2025-01-04  140  static void vpd_sequence_begin(struct papr_rtas_sequence *seq, void *param)
514f6ff4369a30 Nathan Lynch 2023-12-12 @141  {
5d8b0014124124 Haren Myneni 2025-01-04  142  	struct rtas_ibm_get_vpd_params *vpd_params;
514f6ff4369a30 Nathan Lynch 2023-12-12  143  	/*
514f6ff4369a30 Nathan Lynch 2023-12-12  144  	 * Use a static data structure for the location code passed to
514f6ff4369a30 Nathan Lynch 2023-12-12  145  	 * RTAS to ensure it's in the RMA and avoid a separate work
514f6ff4369a30 Nathan Lynch 2023-12-12  146  	 * area allocation. Guarded by the function lock.
514f6ff4369a30 Nathan Lynch 2023-12-12  147  	 */
514f6ff4369a30 Nathan Lynch 2023-12-12  148  	static struct papr_location_code static_loc_code;
514f6ff4369a30 Nathan Lynch 2023-12-12  149  
514f6ff4369a30 Nathan Lynch 2023-12-12  150  	/*
514f6ff4369a30 Nathan Lynch 2023-12-12  151  	 * We could allocate the work area before acquiring the
514f6ff4369a30 Nathan Lynch 2023-12-12  152  	 * function lock, but that would allow concurrent requests to
514f6ff4369a30 Nathan Lynch 2023-12-12  153  	 * exhaust the limited work area pool for no benefit. So
514f6ff4369a30 Nathan Lynch 2023-12-12  154  	 * allocate the work area under the lock.
514f6ff4369a30 Nathan Lynch 2023-12-12  155  	 */
514f6ff4369a30 Nathan Lynch 2023-12-12  156  	mutex_lock(&rtas_ibm_get_vpd_lock);
5d8b0014124124 Haren Myneni 2025-01-04  157  	static_loc_code = *(struct papr_location_code *)param;
5d8b0014124124 Haren Myneni 2025-01-04  158  	vpd_params =  (struct rtas_ibm_get_vpd_params *)seq->params;
5d8b0014124124 Haren Myneni 2025-01-04  159  	vpd_params->work_area = rtas_work_area_alloc(SZ_4K);
5d8b0014124124 Haren Myneni 2025-01-04  160  	vpd_params->loc_code = &static_loc_code;
5d8b0014124124 Haren Myneni 2025-01-04  161  	vpd_params->sequence = 1;
5d8b0014124124 Haren Myneni 2025-01-04  162  	vpd_params->status = 0;
514f6ff4369a30 Nathan Lynch 2023-12-12  163  }
514f6ff4369a30 Nathan Lynch 2023-12-12  164  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

