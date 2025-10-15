Return-Path: <linuxppc-dev+bounces-12877-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B410BDC64D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 06:02:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmcqv18PXz3cdn;
	Wed, 15 Oct 2025 15:02:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760500971;
	cv=none; b=O6LLwmLBmVx3KZ7FFQ1JGT7v+fBPK+wx8G9v3UPASyVNHVPDStlGeMNZ3LY+Ke/TRSuAB9SEwjEjZ84gvMtwYrM1gknNGgiWCnAz+S9ROoNw01Ut3FSbXbHGdp5pEh9GSR16W0TyTzbhju4lvcVWCJUVB3WXwQlO5vK2UjmTCTPHYU+A5VrFaaJPPEwPUNG9ZcdAaH8XtGxOWdfVvgkb6wqVViXuhuYv2sZQBLbUnU8os/1kUCr4vYCzO7xE/L0c+xHT+FJ1S5ZbiazY4s8ETtKJai09wJ61hrEXwIAPd3iMMRaw0eDyhPqTxC5D8iCNIZ/wiGEncbesgZqXfAkMGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760500971; c=relaxed/relaxed;
	bh=hfucgX8ssmEAuSCdZ/Lp7P4GlVmuSbno7gcO+6splP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VtesQ9jw0rnxtXHzMjtYukzxz+76B4DiXF6b+wh8mRiRoUyfhNQVJEn98dyHqol65uhU02YgFxonqmDjkjcFRyC0vWY8PaUtn0Aif1p+t7ytLRTi7kP0JVMob35FOkDQOHmnOaB2n/JQ1ZxvQF6DmBnV31wDfyBTDzTjHAK9HC3fBdydkQlrj6Vkt3lRzel9jb3HtonFslqM7bHAoa1YLn0gRQZJOIPD8wV9ygZPRQOmQQMWojOU0fBvBXDYYUazJlzbwqdLTJfV/PrJY48OwnZU/rIYk/FL8mCSslLoCXZwCxoFgKVaveQbUFqkiqgxwIXnWPZb94ryC73CAomUzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DbGQeBCm; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DbGQeBCm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmcqr4XRJz3cdR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 15:02:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760500968; x=1792036968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IPYoc3DHk1NL/YolvyR0cWS69iUjEEZ5j0JF14Po0+4=;
  b=DbGQeBCmAGAdvsPy1H7KIT4nCpB+esDwTlbd+/0/BEE4mOzYEapAwXcH
   7+9U2uFKVQJj2IPP+lklmxdUFCqIZcsW5z3DRXO5rAAM1a70mOl1ZAWLI
   tdezIvbRRtYqjn7SIk489tmJk8s8GMwcDzqseJdlgUiffTpZGu9HLbxqM
   Qyh3JqsmgPyhtnxscHOAHDPpCXgTDTC7zwmfv6/ezP8BCiitrkULqaHW7
   1phEq9hzM+V6aWfcYsfZSs6hdRcVZz1YO1KR42ePNBnwmEPFs7GXuUojc
   OtUu62FtV5vnwU4OgJoY99LxsGsLHmHJhJ1Lcun238DVsenqrnhSMLReG
   Q==;
X-CSE-ConnectionGUID: O6BrlSWwRpy7mA00yMBJ3Q==
X-CSE-MsgGUID: y3JORLqjQOmmMAxb0W0SpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="66318624"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="66318624"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 21:02:43 -0700
X-CSE-ConnectionGUID: NvEnqguAR3Kd7fzemWuaVg==
X-CSE-MsgGUID: CSuUhS57SgWXI2/is1sSHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="181733557"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 14 Oct 2025 21:02:40 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8shN-0003QH-2q;
	Wed, 15 Oct 2025 04:01:40 +0000
Date: Wed, 15 Oct 2025 11:53:45 +0800
From: kernel test robot <lkp@intel.com>
To: Donet Tom <donettom@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Donet Tom <donettom@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] drivers/base/node: Fold register_node() into
 register_one_node()
Message-ID: <202510151130.JYajIJuM-lkp@intel.com>
References: <910853c9dd61f7a2190a56cba101e73e9c6859be.1760097207.git.donettom@linux.ibm.com>
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
In-Reply-To: <910853c9dd61f7a2190a56cba101e73e9c6859be.1760097207.git.donettom@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Donet,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on powerpc/fixes linus/master v6.18-rc1 next-20251014]
[cannot apply to driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus powerpc/next tip/x86/mm rppt-memblock/for-next rppt-memblock/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Donet-Tom/drivers-base-node-Fold-register_node-into-register_one_node/20251015-000850
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/910853c9dd61f7a2190a56cba101e73e9c6859be.1760097207.git.donettom%40linux.ibm.com
patch subject: [PATCH v2 1/2] drivers/base/node: Fold register_node() into register_one_node()
config: s390-randconfig-001-20251015 (https://download.01.org/0day-ci/archive/20251015/202510151130.JYajIJuM-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510151130.JYajIJuM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510151130.JYajIJuM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/base/node.c:889 function parameter 'nid' not described in 'register_node'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

