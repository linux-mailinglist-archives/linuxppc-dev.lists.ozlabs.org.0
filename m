Return-Path: <linuxppc-dev+bounces-10530-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A362B19009
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Aug 2025 23:04:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bvb1L0nkQz30WY;
	Sun,  3 Aug 2025 07:04:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754168694;
	cv=none; b=OGPy8IzATSBn01R0q7LBibeoX+48rpsNKhSH5FBlNd8aebtt5qVeKPUJw31YjKHPwUlKUgb59Di/6SqdyaaQ6Lcdj9C5IdrPAypo0iJiDWUG8q8ZiVey9dvzx816EjvLoo1JbedIGUruhNg9NZsbC6FLwdLi9wiKvFOQTZY2j2tLbS2oqRGrwjMG2ntPgm1PVfrtyuU/7qo732I4SwRUWS1brMo+xb3E46UlvrM+3om/Cby96LzydGabb3WuPhdI8DQIMVPaP/TSGs2GAwnTTlPtFUyBfXtw2vJt3417CaPcYuElawY33duZhm/vQZJSBnHFJdrNgaTeN1pMDIWuMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754168694; c=relaxed/relaxed;
	bh=x8OaUwsyAGStKw7rx7F71EQaw+X3F3SWPbi0re5OKek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gr+JezwSVadW/wyjBfshKprNqA31niPgnR7AfGEU51S6inI7X5RwXm1BZVTEHh7/4gE7/LlUeXqhZDryrou6BbeB3sKOVUlv4yOqqHDr/GX7pdkP5q5Tta7NtaIA2fkvJvnFfP3d1cuLba+IUDd1WY8sLqNk7Ty050V5e8XeC7bm/S12BBZzFabRVVa3jCGk1i8U10sma6FdnQnqMGbhQ2LWrOluTfOv/Yi9P8ZHt5XDPBUCeZcnRix8sdSfirKQGGIfOZvQvFFxQ87Jtlf596yPTEGYTZ1Q/JxAjX69cOd5uCAi3FhN7Wep7unHQnM30AcMQX1qErXSDFU/wCi69w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HF+7sDH9; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HF+7sDH9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bvb1H64zxz30Vr
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Aug 2025 07:04:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754168692; x=1785704692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HVCw/ums2+GbSs2nNoNRXRXxNNLaozl5ohYBKWjGkFM=;
  b=HF+7sDH9JCN+TdeMkuohl69iBKilmME9q4cA5tedRExsvA4bq7hj14qb
   f+Jj2tiw19N1xa3YR6pxi9S+sVeUd5hmew4xBHC84XfkEmaS+5CWcwXxD
   jokk/WkxiADmcGds8gBbAP/VNgklpx595IDHNZtckRz3k9NvTeCd/T2M+
   gfpCgHTOOAWtXJaUEEMfWzK5KgMnTxj2UfSGPHlAxCdEU5ITBMWyoDZun
   GFcsmytIqWz6JbrrnURYFtOewnPk3ORdFUnUnrxs0hWdLQGDI9xAk59rx
   FQSJ/sIuHRq+HpdvZ6djGiXNjrEQobSB94wfY+SyCgzAi0y0uoZXk1JIC
   w==;
X-CSE-ConnectionGUID: R38++lDdQJe3Bxtk8dyCRg==
X-CSE-MsgGUID: rltilodNQeuai9rIbyCldA==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="79033275"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="79033275"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 14:04:46 -0700
X-CSE-ConnectionGUID: X+apVM/tT5+7iem5KDZ/vg==
X-CSE-MsgGUID: Xqd3NhdMSHKhb2aNzkvJSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168293533"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Aug 2025 14:04:43 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiJPF-0005bY-18;
	Sat, 02 Aug 2025 21:04:41 +0000
Date: Sun, 3 Aug 2025 05:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	maddy@linux.ibm.com, mpe@ellerman.id.au, msuchanek@suse.de,
	mahesh@linux.ibm.com, tyreld@linux.ibm.com, hbabu@us.ibm.com,
	haren@linux.ibm.com
Subject: Re: [PATCH 7/9] powerpc/pseries: Enable HVPIPE event message
 interrupt
Message-ID: <202508030428.qmzSb9kN-lkp@intel.com>
References: <20250802024121.955274-8-haren@linux.ibm.com>
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
In-Reply-To: <20250802024121.955274-8-haren@linux.ibm.com>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Haren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes v6.16]
[cannot apply to linus/master next-20250801]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Define-papr-hvpipe-ioctl/20250802-104715
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250802024121.955274-8-haren%40linux.ibm.com
patch subject: [PATCH 7/9] powerpc/pseries: Enable HVPIPE event message interrupt
config: powerpc64-randconfig-001-20250803 (https://download.01.org/0day-ci/archive/20250803/202508030428.qmzSb9kN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508030428.qmzSb9kN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508030428.qmzSb9kN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/papr-hvpipe.c:698:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     698 |         if (!enable_hvpipe_IRQ()) {
         |             ^~~~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/pseries/papr-hvpipe.c:710:9: note: uninitialized use occurs here
     710 |         return ret;
         |                ^~~
   arch/powerpc/platforms/pseries/papr-hvpipe.c:698:2: note: remove the 'if' if its condition is always true
     698 |         if (!enable_hvpipe_IRQ()) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/pseries/papr-hvpipe.c:676:9: note: initialize the variable 'ret' to silence this warning
     676 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +698 arch/powerpc/platforms/pseries/papr-hvpipe.c

   673	
   674	static int __init papr_hvpipe_init(void)
   675	{
   676		int ret;
   677	
   678		if (!of_find_property(rtas.dev, "ibm,hypervisor-pipe-capable",
   679			NULL))
   680			return -ENODEV;
   681	
   682		if (!rtas_function_implemented(RTAS_FN_IBM_SEND_HVPIPE_MSG) ||
   683			!rtas_function_implemented(RTAS_FN_IBM_RECEIVE_HVPIPE_MSG))
   684			return -ENODEV;
   685	
   686		papr_hvpipe_work = kzalloc(sizeof(struct work_struct), GFP_ATOMIC);
   687		if (!papr_hvpipe_work)
   688			return -ENOMEM;
   689	
   690		INIT_WORK(papr_hvpipe_work, papr_hvpipe_work_fn);
   691	
   692		papr_hvpipe_wq = alloc_ordered_workqueue("papr hvpipe workqueue", 0);
   693		if (!papr_hvpipe_wq) {
   694			ret = -ENOMEM;
   695			goto out;
   696		}
   697	
 > 698		if (!enable_hvpipe_IRQ()) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

