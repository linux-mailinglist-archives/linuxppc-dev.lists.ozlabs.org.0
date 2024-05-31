Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 449328D6491
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 16:31:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B7PeScBW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrQYM4VLLz3cnR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 00:31:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B7PeScBW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrQXZ4YlTz3cVM
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 00:31:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717165872; x=1748701872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JvE95VldL4Wm6uxSEGwGimYI1FBYwpi2JYmljsv3ZAA=;
  b=B7PeScBWvp8LyW/x9Sgi1zd3KrQkViy28VzoQPAQ52Ze+41Qc190BN19
   yFyBTC4l9FGkAQtbr2sE/EE6czdW3Q8aGe3Fm9c/ixffV67Huwi9//DdA
   idxSruQ+Bk12rjf3WgrvbjlV2X85014UJprSkObuPnwM8A5It8Wp3Pf7T
   JS2A7mtOAcNU9EUHhvxoPcZD7AxqdY7u9BcckInXHVVk5kF6s2tVSrVMn
   moZWsRsvNBeNUGksY0olCVImljKt2rQywZsdz7XkmIaxEmLJlWblSOyO4
   tDycltVIsB6h2xAw+qgTXohwwQQ6EGU7oLoaga0bZ7HKgBCCJYz7b3S7Z
   g==;
X-CSE-ConnectionGUID: L+1o6W3IRmuAA91SFrUv0Q==
X-CSE-MsgGUID: EIGteJ3nRnq/uBdR/ILzqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="36242699"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="36242699"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 07:31:06 -0700
X-CSE-ConnectionGUID: 0FTBQ/SASnC/QvwnryK7fA==
X-CSE-MsgGUID: KgUFmX8zTD2bMRaXcoAYwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="73666970"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 07:30:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sD3HS-0000000CUNA-19F6;
	Fri, 31 May 2024 17:30:54 +0300
Date: Fri, 31 May 2024 17:30:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 1/6] ASoC: codecs: Remove unused of_gpio.h
Message-ID: <ZlnfHWx3uPzCoJwX@smile.fi.intel.com>
References: <20240530230037.1156253-2-andriy.shevchenko@linux.intel.com>
 <202405311428.tzsBMIPs-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405311428.tzsBMIPs-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: imx@lists.linux.dev, alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Xiubo Li <Xiubo.Lee@gmail.com>, llvm@lists.linux.dev, Marco Felsch <m.felsch@pengutronix.de>, linux-kernel@vger.kernel.org, Kevin Lu <kevin-lu@ti.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, Rob Herring <robh@kernel.org>, Takashi Iwai <tiwai@suse.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, linux-rockchip@lists.infradead.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Baojun Xu <baojun.xu@ti.com>, Shenghao Ding <shenghao-ding@ti.com>, James Schulman <james.schulman@cirrus.com>, Alper Nebi Yasak <alpernebiyasak@gmail.com>, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, oe-kbuild-all@lists.linux.dev, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, Weidong Wang <wangweidong.a@awinic.com>, David Rhodes <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@
 gmail.com>, Chancel Liu <chancel.liu@nxp.com>, Banajit Goswami <bgoswami@quicinc.com>, patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 31, 2024 at 02:42:33PM +0800, kernel test robot wrote:
> Hi Andy,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on broonie-sound/for-next]
> [also build test ERROR on shawnguo/for-next rockchip/for-next linus/master v6.10-rc1 next-20240529]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/ASoC-codecs-Remove-unused-of_gpio-h/20240531-070350
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> patch link:    https://lore.kernel.org/r/20240530230037.1156253-2-andriy.shevchenko%40linux.intel.com
> patch subject: [PATCH v1 1/6] ASoC: codecs: Remove unused of_gpio.h
> config: i386-buildonly-randconfig-006-20240531 (https://download.01.org/0day-ci/archive/20240531/202405311428.tzsBMIPs-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311428.tzsBMIPs-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405311428.tzsBMIPs-lkp@intel.com/

My gosh, the whoever wrote the GPIO code in that driver has no clue what they
are doing. It's a pure mess.

-- 
With Best Regards,
Andy Shevchenko


