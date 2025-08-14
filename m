Return-Path: <linuxppc-dev+bounces-10968-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0BAB25B01
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 07:44:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2Z1m1BBpz30T9;
	Thu, 14 Aug 2025 15:44:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755150268;
	cv=none; b=M4+I/R32RBURtECOzRH5zPDVl4UlFdHJI5KCYrtaoAaSu1AVVLZEd70yt7ASBsD70L8iCViHgrMp6z67AYM/q5RHfL07ZGutMqegpWlH45OUYriMSkhULYFW25LcWtgOY8JuSgMVMp8el9NxFW3y5G5DRmLF2UYAOSr/WtSCwMXUN5LKkygDZ7GJRzmia2ikc48qwOil4OSTr4r1D4nhxkfzzrE5aOweiRAwzpBMB2w3+UIzQAYZwh+ZUbhzxup9w5tpOG9d+MWVNl2jH2WAM3QkO8qp3rsr25HLO6b4qOEs/cvETNuSDBZcPe5v7fWwHMFjObGbupuDIO94rrXYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755150268; c=relaxed/relaxed;
	bh=/WiZMEh+83nC/Nb7MrCulBVj5masp7auALNWiYYBtSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KujuN88jftbXhFcvLjeH/ercvhv8Naz6MRNxNjmCSTmrVVQSsszGa6EkJbvwXR15zurjXWPdNxBnY4OY/zFp4zah1sB9oQnbo4ods0HXgeQO8aaCsD7JtW2/bC8cZhj2etp/ma6wo9IOrgVFom/9Jtg5O5CsqYplJjlQmELMiD+4YAFb9ABO3IJvvSU+iq8sJwucZqSn6Aq79hkmUPZikGxofMLGtwaDI+E1SzuEm35IJa/5EQ+rWJr62HMJz053WIwbWoM54Xm0vTDwL2XQIUbavaAKj3nCNxR8AIkSUw2c2fmoqD8KdRBH8qICZnQ7ax/Dr8JARyepcXY0jyFpMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BD3H0z+i; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BD3H0z+i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2Z1j5jCjz2yhX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 15:44:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755150266; x=1786686266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g6R08dRtzi78aEFReCyHEuWUNRmsPZO1Bp8+EA825f0=;
  b=BD3H0z+i2GaFvwBFVTBAL91F1iXVlFAMgq0nGQrpif6ItXWHZvfKzkRz
   vJlj+YU3VhFWdNkCiZMa2j07T9vRzTNU81DcDuLsb62tG3mtOR+vX+guu
   gVKel8Su7dlL18kLQ4Ds98iMRWqLtVb8WQlPRFrbRkjFF8DlF0pV5ekQv
   xrwcC3b1P6BFRUIPy0AtEtdwf2R5RriucVZ+b4cKi6FHxqzz6siFgZFrF
   t9xjPmuhWLJAjnlZVfuKWEqNj+H5Bg8g40dbmc2J4nQqZdi/9VbNlhS+U
   rGt+su2xAEk9X9wCJ++LihF3czOwmMYHyoaucpz3Y7KsZmHhr3SumpwF0
   Q==;
X-CSE-ConnectionGUID: 2Xo8Qe37RCS/90qqtYOjlw==
X-CSE-MsgGUID: czo9P2kUSZCX+wYxJ0ha6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68063298"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="68063298"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 22:44:20 -0700
X-CSE-ConnectionGUID: EW+xK8OMTcegzO0PV9/IwQ==
X-CSE-MsgGUID: DyMXdD5CQGikV6ws5RD5Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="170876883"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 13 Aug 2025 22:44:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umQkr-000AcW-2Z;
	Thu, 14 Aug 2025 05:44:08 +0000
Date: Thu, 14 Aug 2025 13:43:14 +0800
From: kernel test robot <lkp@intel.com>
To: Robin Murphy <robin.murphy@arm.com>, mingo@redhat.com, will@kernel.org,
	mark.rutland@arm.com, acme@kernel.org, namhyung@kernel.org,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 13/19] perf: Add helper for checking grouped events
Message-ID: <202508141353.JZWHsrYP-lkp@intel.com>
References: <b05607c3ce0d3ce52de1784823ef9f6de324283c.1755096883.git.robin.murphy@arm.com>
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
In-Reply-To: <b05607c3ce0d3ce52de1784823ef9f6de324283c.1755096883.git.robin.murphy@arm.com>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Robin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.17-rc1 next-20250814]
[cannot apply to perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Robin-Murphy/perf-arm-cmn-Fix-event-validation/20250814-010626
base:   linus/master
patch link:    https://lore.kernel.org/r/b05607c3ce0d3ce52de1784823ef9f6de324283c.1755096883.git.robin.murphy%40arm.com
patch subject: [PATCH 13/19] perf: Add helper for checking grouped events
config: i386-randconfig-003-20250814 (https://download.01.org/0day-ci/archive/20250814/202508141353.JZWHsrYP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141353.JZWHsrYP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508141353.JZWHsrYP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/events/amd/ibs.c:264:6: warning: unused variable 'ret' [-Wunused-variable]
     264 |         int ret;
         |             ^~~
   1 warning generated.


vim +/ret +264 arch/x86/events/amd/ibs.c

d20610c19b4a22 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-02-05  258  
b716916679e720 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-09-21  259  static int perf_ibs_init(struct perf_event *event)
b716916679e720 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-09-21  260  {
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  261  	struct hw_perf_event *hwc = &event->hw;
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  262  	struct perf_ibs *perf_ibs;
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  263  	u64 config;
7c2128235eff99 arch/x86/events/amd/ibs.c                Ravi Bangoria  2023-06-20 @264  	int ret;
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  265  
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  266  	perf_ibs = get_ibs_pmu(event->attr.type);
2fad201fe38ff9 arch/x86/events/amd/ibs.c                Ravi Bangoria  2023-05-04  267  	if (!perf_ibs)
2fad201fe38ff9 arch/x86/events/amd/ibs.c                Ravi Bangoria  2023-05-04  268  		return -ENOENT;
2fad201fe38ff9 arch/x86/events/amd/ibs.c                Ravi Bangoria  2023-05-04  269  
450bbd493d436f arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-03-12  270  	config = event->attr.config;
450bbd493d436f arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-03-12  271  
450bbd493d436f arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-03-12  272  	if (event->pmu != &perf_ibs->pmu)
b716916679e720 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-09-21  273  		return -ENOENT;
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  274  
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  275  	if (config & ~perf_ibs->config_mask)
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  276  		return -EINVAL;
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  277  
0f9e0d7928d8e8 arch/x86/events/amd/ibs.c                Namhyung Kim   2023-11-30  278  	if (has_branch_stack(event))
0f9e0d7928d8e8 arch/x86/events/amd/ibs.c                Namhyung Kim   2023-11-30  279  		return -EOPNOTSUPP;
0f9e0d7928d8e8 arch/x86/events/amd/ibs.c                Namhyung Kim   2023-11-30  280  
d29e744c71673a arch/x86/events/amd/ibs.c                Namhyung Kim   2024-12-03  281  	/* handle exclude_{user,kernel} in the IRQ handler */
d29e744c71673a arch/x86/events/amd/ibs.c                Namhyung Kim   2024-12-03  282  	if (event->attr.exclude_host || event->attr.exclude_guest ||
d29e744c71673a arch/x86/events/amd/ibs.c                Namhyung Kim   2024-12-03  283  	    event->attr.exclude_idle)
d29e744c71673a arch/x86/events/amd/ibs.c                Namhyung Kim   2024-12-03  284  		return -EINVAL;
d29e744c71673a arch/x86/events/amd/ibs.c                Namhyung Kim   2024-12-03  285  
d29e744c71673a arch/x86/events/amd/ibs.c                Namhyung Kim   2024-12-03  286  	if (!(event->attr.config2 & IBS_SW_FILTER_MASK) &&
d29e744c71673a arch/x86/events/amd/ibs.c                Namhyung Kim   2024-12-03  287  	    (event->attr.exclude_kernel || event->attr.exclude_user ||
d29e744c71673a arch/x86/events/amd/ibs.c                Namhyung Kim   2024-12-03  288  	     event->attr.exclude_hv))
d29e744c71673a arch/x86/events/amd/ibs.c                Namhyung Kim   2024-12-03  289  		return -EINVAL;
d29e744c71673a arch/x86/events/amd/ibs.c                Namhyung Kim   2024-12-03  290  
ccec93f5de464b arch/x86/events/amd/ibs.c                Robin Murphy   2025-08-13  291  	/*
ccec93f5de464b arch/x86/events/amd/ibs.c                Robin Murphy   2025-08-13  292  	 * Grouping of IBS events is not possible since IBS can have only
ccec93f5de464b arch/x86/events/amd/ibs.c                Robin Murphy   2025-08-13  293  	 * one event active at any point in time.
ccec93f5de464b arch/x86/events/amd/ibs.c                Robin Murphy   2025-08-13  294  	 */
ccec93f5de464b arch/x86/events/amd/ibs.c                Robin Murphy   2025-08-13  295  	if (in_hardware_group(event))
ccec93f5de464b arch/x86/events/amd/ibs.c                Robin Murphy   2025-08-13  296  		return -EINVAL;
7c2128235eff99 arch/x86/events/amd/ibs.c                Ravi Bangoria  2023-06-20  297  
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  298  	if (hwc->sample_period) {
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  299  		if (config & perf_ibs->cnt_mask)
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  300  			/* raw max_cnt may not be set */
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  301  			return -EINVAL;
88c7bcad71c83f arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  302  
b2fc7b282bf7c1 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  303  		if (event->attr.freq) {
b2fc7b282bf7c1 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  304  			hwc->sample_period = perf_ibs->min_period;
b2fc7b282bf7c1 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  305  		} else {
88c7bcad71c83f arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  306  			/* Silently mask off lower nibble. IBS hw mandates it. */
6accb9cf760804 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-04-02  307  			hwc->sample_period &= ~0x0FULL;
b2fc7b282bf7c1 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  308  			if (hwc->sample_period < perf_ibs->min_period)
b2fc7b282bf7c1 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  309  				return -EINVAL;
b2fc7b282bf7c1 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  310  		}
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  311  	} else {
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  312  		u64 period = 0;
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  313  
e1e7844ced88f9 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  314  		if (event->attr.freq)
e1e7844ced88f9 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  315  			return -EINVAL;
e1e7844ced88f9 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  316  
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  317  		if (perf_ibs == &perf_ibs_op) {
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  318  			period = (config & IBS_OP_MAX_CNT) << 4;
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  319  			if (ibs_caps & IBS_CAPS_OPCNTEXT)
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  320  				period |= config & IBS_OP_MAX_CNT_EXT_MASK;
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  321  		} else {
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  322  			period = (config & IBS_FETCH_MAX_CNT) << 4;
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  323  		}
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  324  
db98c5faf8cb35 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  325  		config &= ~perf_ibs->cnt_mask;
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  326  		event->attr.sample_period = period;
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  327  		hwc->sample_period = period;
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  328  
b2fc7b282bf7c1 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  329  		if (hwc->sample_period < perf_ibs->min_period)
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  330  			return -EINVAL;
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  331  	}
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  332  
d20610c19b4a22 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-02-05  333  	if (perf_ibs_ldlat_event(perf_ibs, event)) {
d20610c19b4a22 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-02-05  334  		u64 ldlat = event->attr.config1 & 0xFFF;
d20610c19b4a22 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-02-05  335  
d20610c19b4a22 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-02-05  336  		if (ldlat < 128 || ldlat > 2048)
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  337  			return -EINVAL;
d20610c19b4a22 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-02-05  338  		ldlat >>= 7;
d20610c19b4a22 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-02-05  339  
d20610c19b4a22 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-02-05  340  		config |= (ldlat - 1) << 59;
d20610c19b4a22 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-02-05  341  		config |= IBS_OP_L3MISSONLY | IBS_OP_LDLAT_EN;
d20610c19b4a22 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-02-05  342  	}
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  343  
6accb9cf760804 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-04-02  344  	/*
6accb9cf760804 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-04-02  345  	 * If we modify hwc->sample_period, we also need to update
6accb9cf760804 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-04-02  346  	 * hwc->last_period and hwc->period_left.
6accb9cf760804 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-04-02  347  	 */
6accb9cf760804 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-04-02  348  	hwc->last_period = hwc->sample_period;
6accb9cf760804 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-04-02  349  	local64_set(&hwc->period_left, hwc->sample_period);
6accb9cf760804 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-04-02  350  
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  351  	hwc->config_base = perf_ibs->msr;
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  352  	hwc->config = config;
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  353  
b716916679e720 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-09-21  354  	return 0;
b716916679e720 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-09-21  355  }
b716916679e720 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-09-21  356  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

