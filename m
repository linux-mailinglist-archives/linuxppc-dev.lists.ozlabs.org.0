Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C47594A773
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 14:05:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hbDcOs5+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf85228MNz3d8F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 22:05:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hbDcOs5+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wf84H6hCBz3cQP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 22:04:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723032288; x=1754568288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GLRNF2HuoLjUQ6w4jpeRIInoZ8CgfoqNgjV1++re138=;
  b=hbDcOs5+P2s5yqXx4T62FYrYd+jnLSMU9vWBWP5UjSGk8BCqMpbSMgGj
   Eyd9T3E7XClmP7uUL6aOYFKmfDxVVTk3x+2RQ1SRgsfOfAQl0UWKFEKbv
   zwd2MdgO1BQPhuv7N3rYt510pUl+Ncv0ILfKmc0Qx7CaCXXLZRTxt34iU
   7Rnj+xBTWIfQXL1pWQJcss7l3xH2ObYNrhtN7NOtQyW5imFQUn4R4bH1t
   j+0DpFsbGudWDcHFo1UZuRVXXJUCpouAhIIIa9cV46Xw+eDeA95LvpkH/
   C2mgqdczmBUvI6j+1i3JkBGWCa/84OGxw4s4oDGN+moMtr8F5b+uVxFq+
   Q==;
X-CSE-ConnectionGUID: xI6Xro5xS0m9vbpECmjS6A==
X-CSE-MsgGUID: 0eYqIGhaTOumN5Dmmoqx6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="46501032"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="46501032"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 05:04:41 -0700
X-CSE-ConnectionGUID: C1Hv3b0wQkGnZhuTvKV2xg==
X-CSE-MsgGUID: WCCbT51kQy6D3mvYnNd/Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="60956213"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 07 Aug 2024 05:04:39 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbfOm-0005Lo-1T;
	Wed, 07 Aug 2024 12:04:18 +0000
Date: Wed, 7 Aug 2024 20:04:12 +0800
From: kernel test robot <lkp@intel.com>
To: Baruch Siach <baruch@tkos.co.il>, Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 1/3] dma: improve DMA zone selection
Message-ID: <202408071931.W1GA8Ee2-lkp@intel.com>
References: <5200f289af1a9b80dfd329b6ed3d54e1d4a02876.1722578375.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5200f289af1a9b80dfd329b6ed3d54e1d4a02876.1722578375.git.baruch@tkos.co.il>
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
Cc: linux-s390@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Ramon Fried <ramon@neureality.ai>, Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Baruch,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8400291e289ee6b2bf9779ff1c83a291501f017b]

url:    https://github.com/intel-lab-lkp/linux/commits/Baruch-Siach/dma-improve-DMA-zone-selection/20240803-074651
base:   8400291e289ee6b2bf9779ff1c83a291501f017b
patch link:    https://lore.kernel.org/r/5200f289af1a9b80dfd329b6ed3d54e1d4a02876.1722578375.git.baruch%40tkos.co.il
patch subject: [PATCH v5 1/3] dma: improve DMA zone selection
config: i386-randconfig-063-20240807 (https://download.01.org/0day-ci/archive/20240807/202408071931.W1GA8Ee2-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408071931.W1GA8Ee2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408071931.W1GA8Ee2-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: __dma_direct_alloc_pages+0xcc (section: .text.__dma_direct_alloc_pages) -> memblock (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: __dma_direct_alloc_pages+0xd2 (section: .text.__dma_direct_alloc_pages) -> memblock (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: swiotlb_alloc_pool+0xa0 (section: .text.swiotlb_alloc_pool) -> memblock (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: swiotlb_alloc_pool+0xa6 (section: .text.swiotlb_alloc_pool) -> memblock (section: .init.data)
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/bpf/preload/bpf_preload.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
