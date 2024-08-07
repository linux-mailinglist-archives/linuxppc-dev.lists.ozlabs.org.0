Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A773494AE4A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 18:41:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SA2Au33N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfGCx4W3nz3dDy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 02:41:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SA2Au33N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfGCD59Qqz2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 02:41:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723048873; x=1754584873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4h5RvzUHfWFOedWWLMmqE+khKK848X9NVyUEjTPnYMo=;
  b=SA2Au33NvytrvOPOWQb7YOijaJ4KfXndoTV7caVi3ObnrihGj/J41qJf
   x/SYcmV/IqPIXT0oN6plef5G39wyuN8rZNWKE6SPpQ0wPg9UhL+qXCum3
   8FNxhB3AM9RtYFSlEuf5Sm8lYXsTMPRQEad7i8odjCsieAldeBWyuU9Lm
   PpPks5V5v9FeQrWNoDmSOBnA9z4FyfZLp44/yVVojah6AB1yRIf1IMXY3
   E5lPJRrFaqk4YmelE5fk0dboaEBNvjp60Nqf2fDuiVpD108nSteDW61Z3
   adUF1KzPu+VM06H3BstIfNMyXfbIBemt1pBDW5FdxHjGFIBEMUQ4XVJNn
   g==;
X-CSE-ConnectionGUID: 33uxCZkFTDy8Y7m2vHdkMQ==
X-CSE-MsgGUID: lA29fO39R3OmE9w/gG3I+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="32534696"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="32534696"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 09:41:07 -0700
X-CSE-ConnectionGUID: oje+9h1LQQ6ES8HD5dwD4g==
X-CSE-MsgGUID: 8xgeh91mSDq9bHZDnaf5+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="56581731"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 07 Aug 2024 09:41:04 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbjif-0005Ye-2d;
	Wed, 07 Aug 2024 16:41:01 +0000
Date: Thu, 8 Aug 2024 00:40:54 +0800
From: kernel test robot <lkp@intel.com>
To: Baruch Siach <baruch@tkos.co.il>, Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 1/3] dma: improve DMA zone selection
Message-ID: <202408080035.rXXbb5Yc-lkp@intel.com>
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
config: csky-randconfig-001-20240807 (https://download.01.org/0day-ci/archive/20240808/202408080035.rXXbb5Yc-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080035.rXXbb5Yc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080035.rXXbb5Yc-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: dma_direct_optimal_gfp_mask+0x46 (section: .text) -> memblock_end_of_DRAM (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: sg_page.isra.0+0x1c (section: .text) -> memblock_end_of_DRAM (section: .init.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/clk-imxrt1050.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
