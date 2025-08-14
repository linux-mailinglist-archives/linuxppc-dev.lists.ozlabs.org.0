Return-Path: <linuxppc-dev+bounces-10974-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCA2B25E4B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 10:05:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2d8W3C8hz30W5;
	Thu, 14 Aug 2025 18:05:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755158731;
	cv=none; b=IR8j/SP/g6UbicjyH56f/gYDTrr35mQaIlRXQsQmssOuffm3l584kcB0si0nJ205z0YKcitMk+b+i+aR6Rg8zoPPbQUYoFj0u91MImjKqRhwt3+NusaGo3WUy2GkcTQefrOPlk0iTcVJh6Esn7fQIFJu+c14QtWan0r+a8JEfqV39JP3VqeFuyq53/xk1xaVpbWosFbOb8QUvgakkyivJPDsMR/aexfP3Wg8nYkTls5NFt1Y9OtpJHeIvQsebex5KM4R32vfPGp/tjVYwGL3csC7Wrh+k+4hKpLRLBIMo9sS2rDK+M3plxgADIfBIrKLIB1dPIvdOwfcMc5dz0O5Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755158731; c=relaxed/relaxed;
	bh=UkEIOAJZy49RtSHVT4A6P2SXS+pyQeLLJ5XAcWpwXA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mC5aSqAfmUv25XL2wTAxamZKRn61koGvSIwkdpzQuFwuXAxpct45qaspJLXeaSzE5CT51GzcjYr93oM1y6d9mZZQ0bfOHGbURsMMXCQr8BRbsIqHL8ICDW5X5oEcstuZnLuKUm53vPktTCgtrC7PEiTRu17uQEoRqTeQszp/6SqIwLfojh0IGY5yldime9OV7lDRhLKG3FM2fBlNG/CbMUeAUJRVDfau8vDX7w1vHd61KSXFQKvM0jGoWJL39QOttsFh7RfhgTqC2a4WeMwRsazSfzp7BAAWSWp1hNS/eZadT3XUWBGY3fxWHau0UopmeLe1DVBXni4B9/NOLC8VVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aVhxAHt6; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aVhxAHt6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2d8V18LTz30VR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 18:05:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755158730; x=1786694730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5cPIVXM0nkCET4mfTMJk5eQOYlHUtDVZOyK2tRL3s7U=;
  b=aVhxAHt6egDnY4VVmRZ+SrDJhLY20QSFwhrGNaeGxhBrciHtW8etHkGk
   FrSVt+rFfTDAiqNFB57njPyOyqR+U5RNfxn73KCZwV/7WcKZZ1j4ECpq+
   PByK5AG1AumTYBHjR3fDoBJyIZAkDoyQ4wgQzClZF2V8OqBfcp6VCwrQe
   2F+X1PqSjUAdfGMe8/Eoytlz8+qJZW6q4UP4jFS2k206GcGGO2VGMEq39
   2v3yKxEqcX4vHtHKMCZLvB7v8fwnMwRIgKzRBuBne6U0a2ePPzgJoEVbK
   nM6xk8A5/VMs6cMC0QMT4QVB/XcQP1OHzyxifM/No7zr+2bRgJtcxm+fs
   w==;
X-CSE-ConnectionGUID: mfPVxixpTPSOyoDLZC8e8g==
X-CSE-MsgGUID: +roHEdo1RWCAh5H44mIAwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57372651"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57372651"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 01:05:26 -0700
X-CSE-ConnectionGUID: DDCZwDm7QaSoaweUXg1M6A==
X-CSE-MsgGUID: uMzmV2T2TFe/bu5sz1uy2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="190399976"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 14 Aug 2025 01:05:19 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umSxZ-000Ajc-1M;
	Thu, 14 Aug 2025 08:05:17 +0000
Date: Thu, 14 Aug 2025 16:04:59 +0800
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
Subject: Re: [PATCH 19/19] perf: Garbage-collect event_init checks
Message-ID: <202508141524.QVgoOKMD-lkp@intel.com>
References: <ace3532a8a438a96338bf349a27636d8294c7111.1755096883.git.robin.murphy@arm.com>
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
In-Reply-To: <ace3532a8a438a96338bf349a27636d8294c7111.1755096883.git.robin.murphy@arm.com>
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
patch link:    https://lore.kernel.org/r/ace3532a8a438a96338bf349a27636d8294c7111.1755096883.git.robin.murphy%40arm.com
patch subject: [PATCH 19/19] perf: Garbage-collect event_init checks
config: i386-randconfig-003-20250814 (https://download.01.org/0day-ci/archive/20250814/202508141524.QVgoOKMD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141524.QVgoOKMD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508141524.QVgoOKMD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/events/intel/uncore_snb.c:905:24: warning: unused variable 'hwc' [-Wunused-variable]
     905 |         struct hw_perf_event *hwc = &event->hw;
         |                               ^~~
   1 warning generated.


vim +/hwc +905 arch/x86/events/intel/uncore_snb.c

92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  896  
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  897  /*
9aae1780e7e81e arch/x86/events/intel/uncore_snb.c                Kan Liang               2018-05-03  898   * Keep the custom event_init() function compatible with old event
9aae1780e7e81e arch/x86/events/intel/uncore_snb.c                Kan Liang               2018-05-03  899   * encoding for free running counters.
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  900   */
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  901  static int snb_uncore_imc_event_init(struct perf_event *event)
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  902  {
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  903  	struct intel_uncore_pmu *pmu;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  904  	struct intel_uncore_box *box;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30 @905  	struct hw_perf_event *hwc = &event->hw;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  906  	u64 cfg = event->attr.config & SNB_UNCORE_PCI_IMC_EVENT_MASK;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  907  	int idx, base;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  908  
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  909  	pmu = uncore_event_to_pmu(event);
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  910  	/* no device found for this pmu */
3f710be02ea648 arch/x86/events/intel/uncore_snb.c                Kan Liang               2025-01-08  911  	if (!pmu->registered)
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  912  		return -ENOENT;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  913  
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  914  	/* check only supported bits are set */
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  915  	if (event->attr.config & ~SNB_UNCORE_PCI_IMC_EVENT_MASK)
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  916  		return -EINVAL;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  917  
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  918  	box = uncore_pmu_to_box(pmu, event->cpu);
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  919  	if (!box || box->cpu < 0)
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  920  		return -EINVAL;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  921  
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  922  	event->cpu = box->cpu;
1f2569fac6c6dd arch/x86/events/intel/uncore_snb.c                Thomas Gleixner         2016-02-22  923  	event->pmu_private = box;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  924  
e64cd6f73ff5a7 arch/x86/events/intel/uncore_snb.c                David Carrillo-Cisneros 2016-08-17  925  	event->event_caps |= PERF_EV_CAP_READ_ACTIVE_PKG;
e64cd6f73ff5a7 arch/x86/events/intel/uncore_snb.c                David Carrillo-Cisneros 2016-08-17  926  
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  927  	event->hw.idx = -1;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  928  	event->hw.last_tag = ~0ULL;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  929  	event->hw.extra_reg.idx = EXTRA_REG_NONE;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  930  	event->hw.branch_reg.idx = EXTRA_REG_NONE;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  931  	/*
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  932  	 * check event is known (whitelist, determines counter)
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  933  	 */
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  934  	switch (cfg) {
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  935  	case SNB_UNCORE_PCI_IMC_DATA_READS:
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  936  		base = SNB_UNCORE_PCI_IMC_DATA_READS_BASE;
9aae1780e7e81e arch/x86/events/intel/uncore_snb.c                Kan Liang               2018-05-03  937  		idx = UNCORE_PMC_IDX_FREERUNNING;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  938  		break;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  939  	case SNB_UNCORE_PCI_IMC_DATA_WRITES:
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  940  		base = SNB_UNCORE_PCI_IMC_DATA_WRITES_BASE;
9aae1780e7e81e arch/x86/events/intel/uncore_snb.c                Kan Liang               2018-05-03  941  		idx = UNCORE_PMC_IDX_FREERUNNING;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  942  		break;
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  943  	case SNB_UNCORE_PCI_IMC_GT_REQUESTS:
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  944  		base = SNB_UNCORE_PCI_IMC_GT_REQUESTS_BASE;
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  945  		idx = UNCORE_PMC_IDX_FREERUNNING;
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  946  		break;
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  947  	case SNB_UNCORE_PCI_IMC_IA_REQUESTS:
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  948  		base = SNB_UNCORE_PCI_IMC_IA_REQUESTS_BASE;
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  949  		idx = UNCORE_PMC_IDX_FREERUNNING;
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  950  		break;
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  951  	case SNB_UNCORE_PCI_IMC_IO_REQUESTS:
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  952  		base = SNB_UNCORE_PCI_IMC_IO_REQUESTS_BASE;
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  953  		idx = UNCORE_PMC_IDX_FREERUNNING;
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  954  		break;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  955  	default:
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  956  		return -EINVAL;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  957  	}
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  958  
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  959  	/* must be done before validate_group */
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  960  	event->hw.event_base = base;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  961  	event->hw.idx = idx;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  962  
8041ffd36f42d8 arch/x86/events/intel/uncore_snb.c                Kan Liang               2019-02-27  963  	/* Convert to standard encoding format for freerunning counters */
8041ffd36f42d8 arch/x86/events/intel/uncore_snb.c                Kan Liang               2019-02-27  964  	event->hw.config = ((cfg - 1) << 8) | 0x10ff;
8041ffd36f42d8 arch/x86/events/intel/uncore_snb.c                Kan Liang               2019-02-27  965  
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  966  	/* no group validation needed, we have free running counters */
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  967  
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  968  	return 0;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  969  }
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  970  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

