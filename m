Return-Path: <linuxppc-dev+bounces-6601-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D77A4B186
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Mar 2025 13:22:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5Lfj5kKDz30RK;
	Sun,  2 Mar 2025 23:22:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740918125;
	cv=none; b=hp16vRHbNRUeh6KGL1NL3pEWv0Qc47ImOrGaohaJ7zRl2u0IsyVxTp9YHeDBXEXXjYtDPfFcZNPJT0xNv9WZWzjifcrBD8QxIlaS9QoPTc22BQXeU3Bm3q7dZuuurFdZA4kzrY6P6nS1SPhRnfBOwRaK31xkaKRxWjCPDXhaH9vGZRRvLARnYEAdVhA+Iu6H/7an1hZCgwtV1HwOMoOUhuhiA0Qt9ZMomh+Q92/iOOks0YngUPlN9FC01SP/uO/odx9K8bgA7PHwWbQS6v7V+9O+f/cHr5NjqlXHXTzMi24UFxvGMwhmeQRL7s62yKBTKvf4iTkCB/enUg2IlZ0FGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740918125; c=relaxed/relaxed;
	bh=iCw2iAGQNbionFP+vEf9G+6TlzxpygBnweapx5ssfds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQbWUEMKr4XcDVUM423tyvSDbc7mRe/5nF8UNlCdhrhj0d5YcxlLpZqkTWbyISnVShpd2q9Of4Sz0eBRvQyHvniZYeclvA5N4Ll1doWNG+OIZxIdlHPB8XuRyFaRYDXH5a+kGhO/HqYOkiyjWxQ/tH/iukApC6xJYzed4fnjy3gt6Xe1UA2WR5zqnXVtRHkps7iVFebfJCcSva7dDbtoA2AlTBDwSsmCp4Pv+4eu2CnZBd0IrPTc3NO2nWR6UFO9rs1MdhADyqkSqyrz4dKC3a7raP9ao6zxjmqgz6pIfPvts7iRBlBkMO2VzzTi+0VTfKpuD9hOX4gRHPHBk7BL5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hiz3S4Nf; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hiz3S4Nf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5Lfg2mJCz30Kg
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Mar 2025 23:22:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740918124; x=1772454124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wzb+4pU9ZdQc6+4ohAFUv71ZHfQ1Fd1f9jz7upZaoq8=;
  b=Hiz3S4Nf0Fi5H5dc2bFR+6axUsA31LCPdcJoPq1yGHon6VMbQwJVmlj9
   wcGmgQhi2+HCjG5FW7ZrGdG9Ayue/oKtTpucZbMUgNx/2rm2LUD3IHdJe
   dowCKvR1nfB+rwz1vSxa0lvYSb3nbeFuHquepHCSVVM+PmsZkW6GnEKLP
   Lw48gYpPAWefiur8df55jedjgVP6edI/3wY4kdudQND65EXjFt80wAkFC
   URpdcF/odnDuxjjbXvmzXUomCZikRJ/yK4XZHWM+5EuRI4spvA6LwgTTH
   GFXysBGS3MFvd8GVMbKqRIAe4dABAJGBpexsgyijjFpfli4kbqPhzWdiF
   w==;
X-CSE-ConnectionGUID: 0tU8ihKpTQiVSpuxwwAShQ==
X-CSE-MsgGUID: 6vt3m6qtT5ids0prLU5P7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="67169530"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="67169530"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 04:21:59 -0800
X-CSE-ConnectionGUID: qorzma/WRtaeiCrnZqDR6w==
X-CSE-MsgGUID: dmb2fraNSLS5/23ECwns9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118664369"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 02 Mar 2025 04:21:57 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toiKB-000HJi-2m;
	Sun, 02 Mar 2025 12:21:43 +0000
Date: Sun, 2 Mar 2025 20:20:39 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH v2 2/4] powerpc/perf/hv-24x7: Avoid loading hv-24x7
 during dump kernel
Message-ID: <202503021908.Ed1gO0Gi-lkp@intel.com>
References: <20250301182310.6832-2-maddy@linux.ibm.com>
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
In-Reply-To: <20250301182310.6832-2-maddy@linux.ibm.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Madhavan,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Madhavan-Srinivasan/powerpc-perf-hv-24x7-Avoid-loading-hv-24x7-during-dump-kernel/20250302-022531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250301182310.6832-2-maddy%40linux.ibm.com
patch subject: [PATCH v2 2/4] powerpc/perf/hv-24x7: Avoid loading hv-24x7 during dump kernel
config: powerpc64-randconfig-001-20250302 (https://download.01.org/0day-ci/archive/20250302/202503021908.Ed1gO0Gi-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021908.Ed1gO0Gi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021908.Ed1gO0Gi-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/perf/hv-24x7.c: In function 'hv_24x7_init':
>> arch/powerpc/perf/hv-24x7.c:1701:13: error: implicit declaration of function 'is_kdump_kernel' [-Wimplicit-function-declaration]
    1701 |         if (is_kdump_kernel() || is_fadump_active())
         |             ^~~~~~~~~~~~~~~


vim +/is_kdump_kernel +1701 arch/powerpc/perf/hv-24x7.c

  1693	
  1694	static int hv_24x7_init(void)
  1695	{
  1696		int r;
  1697		unsigned long hret;
  1698		unsigned int pvr = mfspr(SPRN_PVR);
  1699		struct hv_perf_caps caps;
  1700	
> 1701		if (is_kdump_kernel() || is_fadump_active())
  1702			return 0;
  1703	
  1704		if (!firmware_has_feature(FW_FEATURE_LPAR)) {
  1705			pr_debug("not a virtualized system, not enabling\n");
  1706			return -ENODEV;
  1707		}
  1708	
  1709		/* POWER8 only supports v1, while POWER9 only supports v2. */
  1710		if (PVR_VER(pvr) == PVR_POWER8 || PVR_VER(pvr) == PVR_POWER8E ||
  1711		    PVR_VER(pvr) == PVR_POWER8NVL)
  1712			interface_version = 1;
  1713		else {
  1714			interface_version = 2;
  1715	
  1716			/* SMT8 in POWER9 needs to aggregate result elements. */
  1717			if (threads_per_core == 8)
  1718				aggregate_result_elements = true;
  1719		}
  1720	
  1721		hret = hv_perf_caps_get(&caps);
  1722		if (hret) {
  1723			pr_debug("could not obtain capabilities, not enabling, rc=%ld\n",
  1724					hret);
  1725			return -ENODEV;
  1726		}
  1727	
  1728		hv_page_cache = kmem_cache_create("hv-page-4096", 4096, 4096, 0, NULL);
  1729		if (!hv_page_cache)
  1730			return -ENOMEM;
  1731	
  1732		/* sampling not supported */
  1733		h_24x7_pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
  1734	
  1735		r = create_events_from_catalog(&event_group.attrs,
  1736					   &event_desc_group.attrs,
  1737					   &event_long_desc_group.attrs);
  1738	
  1739		if (r)
  1740			return r;
  1741	
  1742		/* init cpuhotplug */
  1743		r = hv_24x7_cpu_hotplug_init();
  1744		if (r)
  1745			return r;
  1746	
  1747		r = perf_pmu_register(&h_24x7_pmu, h_24x7_pmu.name, -1);
  1748		if (r)
  1749			return r;
  1750	
  1751		read_24x7_sys_info();
  1752	
  1753		return 0;
  1754	}
  1755	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

