Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 222A58C0C77
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 10:21:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Erzciyk8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZlN24Ljmz3cY9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 18:21:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Erzciyk8;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZlMJ5FmHz3bpp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 18:20:44 +1000 (AEST)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4VZlM90x0mz4x2d
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 18:20:37 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4VZlM90tHpz4x2g; Thu,  9 May 2024 18:20:37 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Erzciyk8;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at gandalf; Thu, 09 May 2024 18:20:35 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4VZlM75Vj3z4x2d
	for <linuxppc-dev@ozlabs.org>; Thu,  9 May 2024 18:20:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715242836; x=1746778836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rfIO8lJj0lXHYo9PCZQmMJv0qnkv0F8SDNvbnW97iZU=;
  b=Erzciyk8449RkccgtOFiPILLiEXKm1jtkJR0zuvtBfQ+6MGwWiKneFPS
   +T5ZFGoIyYRxXReXqacTwq4CKzA1O5TnpHUnbYDitPi+61JY5jL7KyruX
   Flce1RK0SUaoUKkPMFV1aWZuW7kclxdY/YGfAF1JVI8TtHHrtmjGvNpJc
   yZJkeLqTOuP0N3eCsunWomWK//ONs6I1aTnpZKEJ/or6OfTruuTMrzJ/U
   UXgfdM38yhNCHDAFYuUSvQClFk6Q2gDOve6IcVqY52eLnPh9JTPEpKtqN
   gC5x9GzbvOE/6OxSXml0PgPjpyGxVnz3pvWygv618/ox/EOtitwudANeH
   Q==;
X-CSE-ConnectionGUID: Gdc5BOx3SLi9lvzTr8RNHw==
X-CSE-MsgGUID: iqRNSIQERcSFcvcLtBvnaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11360645"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="11360645"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 01:19:08 -0700
X-CSE-ConnectionGUID: pIg6tOTnTZKNLnqcZF5wGg==
X-CSE-MsgGUID: DW3w5ZBcQSaNsbdunh9Wpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="60340457"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 May 2024 01:19:05 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4yzX-0004dG-2R;
	Thu, 09 May 2024 08:19:03 +0000
Date: Thu, 9 May 2024 16:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH 1/2] powerpc/kexec_file: fix extra size calculation for
 kexec FDT
Message-ID: <202405091617.IRRnTyRE-lkp@intel.com>
References: <20240508130558.1939304-2-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508130558.1939304-2-sourabhjain@linux.ibm.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, oe-kbuild-all@lists.linux.dev, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sourabh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240508]
[cannot apply to powerpc/next powerpc/fixes linus/master v6.9-rc7 v6.9-rc6 v6.9-rc5 v6.9-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/powerpc-kexec_file-fix-extra-size-calculation-for-kexec-FDT/20240508-211003
base:   next-20240508
patch link:    https://lore.kernel.org/r/20240508130558.1939304-2-sourabhjain%40linux.ibm.com
patch subject: [PATCH 1/2] powerpc/kexec_file: fix extra size calculation for kexec FDT
config: powerpc64-randconfig-002-20240509 (https://download.01.org/0day-ci/archive/20240509/202405091617.IRRnTyRE-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240509/202405091617.IRRnTyRE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405091617.IRRnTyRE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/kexec/file_load_64.c:852: warning: Function parameter or struct member 'rmem' not described in 'kexec_extra_fdt_size_ppc64'


vim +852 arch/powerpc/kexec/file_load_64.c

2377c92e37fe97 Hari Bathini 2021-02-04  843  
33f2cc0a2e90f7 Hari Bathini 2024-02-26  844  /**
33f2cc0a2e90f7 Hari Bathini 2024-02-26  845   * kexec_extra_fdt_size_ppc64 - Return the estimated additional size needed to
33f2cc0a2e90f7 Hari Bathini 2024-02-26  846   *                              setup FDT for kexec/kdump kernel.
33f2cc0a2e90f7 Hari Bathini 2024-02-26  847   * @image:                      kexec image being loaded.
33f2cc0a2e90f7 Hari Bathini 2024-02-26  848   *
33f2cc0a2e90f7 Hari Bathini 2024-02-26  849   * Returns the estimated extra size needed for kexec/kdump kernel FDT.
33f2cc0a2e90f7 Hari Bathini 2024-02-26  850   */
f2c160891d3206 Sourabh Jain 2024-05-08  851  unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image, struct crash_mem *rmem)
33f2cc0a2e90f7 Hari Bathini 2024-02-26 @852  {
f2c160891d3206 Sourabh Jain 2024-05-08  853  	struct device_node *dn;
f2c160891d3206 Sourabh Jain 2024-05-08  854  	unsigned int cpu_nodes, extra_size = 0;
33f2cc0a2e90f7 Hari Bathini 2024-02-26  855  
33f2cc0a2e90f7 Hari Bathini 2024-02-26  856  	// Budget some space for the password blob. There's already extra space
33f2cc0a2e90f7 Hari Bathini 2024-02-26  857  	// for the key name
33f2cc0a2e90f7 Hari Bathini 2024-02-26  858  	if (plpks_is_available())
33f2cc0a2e90f7 Hari Bathini 2024-02-26  859  		extra_size += (unsigned int)plpks_get_passwordlen();
33f2cc0a2e90f7 Hari Bathini 2024-02-26  860  
f2c160891d3206 Sourabh Jain 2024-05-08  861  	/* Get the number of CPU nodes in the current device tree */
f2c160891d3206 Sourabh Jain 2024-05-08  862  	for_each_node_by_type(dn, "cpu") {
f2c160891d3206 Sourabh Jain 2024-05-08  863  		cpu_nodes++;
f2c160891d3206 Sourabh Jain 2024-05-08  864  	}
f2c160891d3206 Sourabh Jain 2024-05-08  865  
f2c160891d3206 Sourabh Jain 2024-05-08  866  	/* Consider extra space for CPU nodes added since the boot time */
f2c160891d3206 Sourabh Jain 2024-05-08  867  	if (cpu_nodes > boot_cpu_node_count)
f2c160891d3206 Sourabh Jain 2024-05-08  868  		extra_size += (cpu_nodes - boot_cpu_node_count) * cpu_node_size();
f2c160891d3206 Sourabh Jain 2024-05-08  869  
f2c160891d3206 Sourabh Jain 2024-05-08  870  	/* Consider extra space for reserved memory ranges if any */
f2c160891d3206 Sourabh Jain 2024-05-08  871  	if (rmem->nr_ranges > 0)
f2c160891d3206 Sourabh Jain 2024-05-08  872  		extra_size += sizeof(struct fdt_reserve_entry) * rmem->nr_ranges;
f2c160891d3206 Sourabh Jain 2024-05-08  873  
f2c160891d3206 Sourabh Jain 2024-05-08  874  	return extra_size + kdump_extra_fdt_size_ppc64(image, cpu_nodes);
33f2cc0a2e90f7 Hari Bathini 2024-02-26  875  }
33f2cc0a2e90f7 Hari Bathini 2024-02-26  876  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
