Return-Path: <linuxppc-dev+bounces-3353-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A302E9D01FB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 04:49:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrcF45T25z2ykf;
	Sun, 17 Nov 2024 14:48:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731815336;
	cv=none; b=UDM77s3oYuwtTL0EDZzAcdBPYROx1+MtrYRHAO20hHkd1yPNiq+6sMCE1mvVL2/csF2Vz0kfDfEW1+OTsXAAy1UL6KzBcch60rq4Is+cWx+j4pKC+bjWH2ExQxUKtoD7IF/Ph+peis7KQrMwk14K7786M6hlu2tIDDQQDIpP3j3gqDiym28Bgr9uJ36x1HZkYXPkv3oxPGaajKb5BBIYKchhUa76XekO5k5nUDBqCKql2J6uyXAPo6lzQiOvmWnCRYle/GI5Ymnb7aVXD4lbaBbkkUorn2fmvOkdr+EI3PIwB2vEOlrZVzHmOO0v7/ihD2Qxm/ATecaech4R03A7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731815336; c=relaxed/relaxed;
	bh=PVBY1DSAtWFtb8/QwuIOnoQXvx1G+3kxZGAcbTLEEbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhaCt3yfQvr7PIHw5AOhgQSCiaChnGfYv6pKjMwXo4kr02MUZzEDfSGHPwF8XY3IsR64IChzGi5jIJuHIS5+euY8mpL2JXdbRX3ybxrpW47kuJBnFREpFB01ZZM69689x6fDCnarmyy62zwXAAN6rWpzZXprVfR4aLYVeQqYlSjbRSqyD/2TU+wnitAxsldHVaObqw3oxhDkG0HgDLbLsPRe0tU8j3J96aj9eqPvpYWgP6SGQcZo0zCs45nO+72YWBhl3juQ0zia9PECmfiRwlE2+T6Nb4/L9J/007jaQ0dst1868DmfVV4jdDV1lH19znmuRd8q6CAGC+HcDV007A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jWAR3KtA; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jWAR3KtA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrcF20061z2xvF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 14:48:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731815335; x=1763351335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SU4ZxkobQzJFaYo6lLfeiNErr6NI3r+NOqva1u4xrZ8=;
  b=jWAR3KtAtQma9NghM1qWDklqiR+4FHbX06/959dvTT22Ci36HXiiJUlk
   0iSJ6LlRN+SdO+EGDwo/GgVPooR/gwVoNYp85e/SuCha+ZciuUAYhdFjT
   Lm/fwr1lAs2F2QQz/t9afWEMo7VRmsX4XOJFnKKWOPw1mU3Blej2iudW8
   ioNIuwtvB9S1PYndqJkdWrc8E9S6Pu/RjvThrKMynyoUfidkb0lGEvA4P
   utaYsy3MEex7Hc7Pu6sctxQDKkvVzrWGlc6PZBACU4WNy/pVZwnU4hINh
   VMQ2Bxfhndgu8xxkwwqLglEqw/ijQpRb0X2l2YjWKYmlGPCJ240TXvZ5N
   Q==;
X-CSE-ConnectionGUID: OEWU/PhnSayyycO6eecnkg==
X-CSE-MsgGUID: rXN9YOs/RReCrR8NHRp6MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="35466408"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="35466408"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 19:48:48 -0800
X-CSE-ConnectionGUID: VuS+mxuWT86DTBpM0pcc2A==
X-CSE-MsgGUID: h2jnVQGwSji8O1nIwLxjMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="88906967"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Nov 2024 19:48:44 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCWHB-0001N7-2n;
	Sun, 17 Nov 2024 03:48:41 +0000
Date: Sun, 17 Nov 2024 11:48:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au,
	maddy@linux.ibm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
	disgoel@linux.ibm.com, hbathini@linux.ibm.com, adubey@linux.ibm.com,
	gautam@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] powerpc/perf: Add perf interface to expose vpa
 counters
Message-ID: <202411171117.Eq9JtACb-lkp@intel.com>
References: <20241114084013.1140010-1-kjain@linux.ibm.com>
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
In-Reply-To: <20241114084013.1140010-1-kjain@linux.ibm.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Kajol,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/topic/ppc-kvm]
[also build test WARNING on powerpc/next powerpc/fixes linus/master v6.12-rc7 next-20241115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kajol-Jain/docs-ABI-sysfs-bus-event_source-devices-vpa-pmu-Document-sysfs-event-format-entries-for-vpa_pmu/20241114-164451
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
patch link:    https://lore.kernel.org/r/20241114084013.1140010-1-kjain%40linux.ibm.com
patch subject: [PATCH 1/4] powerpc/perf: Add perf interface to expose vpa counters
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20241117/202411171117.Eq9JtACb-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171117.Eq9JtACb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171117.Eq9JtACb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/perf/vpa-pmu.c:10:
   In file included from include/linux/perf_event.h:50:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/perf/vpa-pmu.c:87:32: warning: overlapping comparisons always evaluate to false [-Wtautological-overlap-compare]
      87 |         if ((event->attr.config <= 0) && (event->attr.config > 3))
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +87 arch/powerpc/perf/vpa-pmu.c

    72	
    73	static int vpa_pmu_event_init(struct perf_event *event)
    74	{
    75		if (event->attr.type != event->pmu->type)
    76			return -ENOENT;
    77	
    78		/* it does not support event sampling mode */
    79		if (is_sampling_event(event))
    80			return -EOPNOTSUPP;
    81	
    82		/* no branch sampling */
    83		if (has_branch_stack(event))
    84			return -EOPNOTSUPP;
    85	
    86		/* Invalid event code */
  > 87		if ((event->attr.config <= 0) && (event->attr.config > 3))
    88			return -EINVAL;
    89	
    90		return 0;
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

