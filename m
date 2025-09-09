Return-Path: <linuxppc-dev+bounces-11902-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6B5B4A12E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 07:14:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLX7G5M4wz3050;
	Tue,  9 Sep 2025 15:14:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757394874;
	cv=none; b=dsrLuycUXxsOtjON5sWZl6gmoIDZDd7hEMkf5W0PUnXJVv1Yww4ihq/9BJnsm8v4oelrhMYwjNOkCK+EH8Fm8+0jP4OVZAQLBa9xrlkTvOqXQTDH2zMReuPwzlDujwSkqvOEvbPgp99B6i90s6lOi+KkhruF+0ZxnDj4fxbzXMU9lcL/gIm+4C27DTKZEC4ouAXbHBu+aCutgGGMkFY2hhqfTBCiVKDKlAMKlI0dg8RMdCL2auRXYf3JbKiKr93R2mvyZtNrtB9vXJQbj+YPfU4r0946Teq3ZkmY9ziGesPCqSDoLwOw5dPLRotmU3IXaS0ur06WKMd8fSnQOIYkkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757394874; c=relaxed/relaxed;
	bh=EVvGptOJSpllcTci4jtpc1ArM7yF9qxGKgwzZJ5X9yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3m6Iz+vQVG+YUKGOqFCVgmsm2caDEoJf5oTAV5fleJ39uiNhoSQntJwZoxKr2MIhgHF5CcTqTHB365uWJIJRwmcfZ6UPZgkWxBAEbPihET38G/L/49dQv1grB3m/2NlYX/+/tBjKZksZdjonUhHJfQK05aVMNd5q/EYUS+payxM58Oikr4oizklHiiFPxrOU1Ogo4kFiYl1hqNVrLyY8Jd3AYM2vpXVdir52L7yLZE8RzaC+Ay2Bm9WLH5aTMQOzrYhw4lJs695fB/ay7ro9WFbldnNrFvKnp8qreJCQLDG+QpjLDd9Fu7xv7gb8lYFQYDAiuqDnqznFYnT2UssFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dlgqEn3H; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dlgqEn3H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLX7C6nZVz2yxN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 15:14:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757394872; x=1788930872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hH3ZezytTq51Qj9BKKfC0R83WETDH4xFeT3UqMzhB/w=;
  b=dlgqEn3HYYiouvNgGYzpjbHlbnJgl24m+a0frrHGRckuRiz/8JjksGlO
   fJ1JacvVy8NIARcFYBkaugXrt+mB0+NRlrz+gBfBuPXZqt/HhuXPlb5nh
   z+ZaAkCc1y+ViCLYlaXajLeo84csjesv50KGnw22AGokJpesALf2EgrJs
   dODYZ6k9HC6vHyG1w1yujtxn6anlU5dWOduTtws5wdwvjG/H7UO5qq3yi
   6n4AsSnxQMqv0XWEOAq+D1fux/wRVWIBl6F74V8VkqB6Ne3z+yPmtfPMe
   vDpL3/DF4/jPNyubXtzCFthLHXpTuhmGjcyPX4mvwwJY+eiEpFjgyrpeD
   A==;
X-CSE-ConnectionGUID: DsBZm6jiRMSFc3zBmcDWHQ==
X-CSE-MsgGUID: JMk4WaI0QceSv0V0Nf3EnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="70287781"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="70287781"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 22:14:27 -0700
X-CSE-ConnectionGUID: zU82kBGmQj2jLq6KBnXuMA==
X-CSE-MsgGUID: vTdDNb+WQASILktnygxmKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="172912681"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Sep 2025 22:14:24 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvqgQ-0004Sx-04;
	Tue, 09 Sep 2025 05:14:22 +0000
Date: Tue, 9 Sep 2025 13:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, msuchanek@suse.de, mahesh@linux.ibm.com,
	tyreld@linux.ibm.com, hbabu@us.ibm.com, haren@linux.ibm.com,
	shashank.gowda@in.ibm.com, bjking1@linux.ibm.com
Subject: Re: [PATCH v6 3/9] powerpc/pseries: Add papr-hvpipe char driver for
 HVPIPE interfaces
Message-ID: <202509091256.nwELaisA-lkp@intel.com>
References: <20250908030458.1139163-4-haren@linux.ibm.com>
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
In-Reply-To: <20250908030458.1139163-4-haren@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Haren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.17-rc5 next-20250908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Define-papr-hvpipe-ioctl/20250908-110839
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250908030458.1139163-4-haren%40linux.ibm.com
patch subject: [PATCH v6 3/9] powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces
config: powerpc64-randconfig-r111-20250909 (https://download.01.org/0day-ci/archive/20250909/202509091256.nwELaisA-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250909/202509091256.nwELaisA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091256.nwELaisA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse:     expected restricted __poll_t
   arch/powerpc/platforms/pseries/papr-hvpipe.c:121:24: sparse:     got int

vim +121 arch/powerpc/platforms/pseries/papr-hvpipe.c

   108	
   109	/*
   110	 * The user space waits for the payload to receive.
   111	 * The hypervisor sends HVPIPE event message to the partition
   112	 * when the payload is available. The event handler wakeup FD
   113	 * depends on the source ID in the message event.
   114	 */
   115	static __poll_t papr_hvpipe_handle_poll(struct file *filp,
   116			struct poll_table_struct *wait)
   117	{
   118		struct hvpipe_source_info *src_info = filp->private_data;
   119	
   120		if (!src_info)
 > 121			return -EIO;
   122	
   123		return 0;
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

