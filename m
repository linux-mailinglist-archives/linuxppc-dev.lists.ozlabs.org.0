Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5345F5841
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 18:26:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjKhv60Vbz3cB8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 03:26:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GhHnIvX1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GhHnIvX1;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjKgx35yCz3bYM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 03:26:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664987165; x=1696523165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G0QJA+L7g7MsXFOFjec34vb6SoO7o1ppQXbhc16bfV0=;
  b=GhHnIvX13SmOcDp4CrXEjXcwANK20f9tWRMqpWnr86+wSSZKU4tLcI4m
   kgmGVKroxgpR1DMTMbVEjdEQ1dfUN12OeAEnsZHBlSn0ms63h2o7caqTl
   dlW2gdOVIAKWQHf5cN8aJfI8U8WZRVQtUsLNo5pGTTlphPuM2pa/OGVnD
   Lc+n5SHPu9y2/kVw1w2jAXyXBtn6BxwwpuPSxa7JnVUfL8Ve0teIPkQwr
   U9654QqQjmzKtwPNVwUAwX+gatrT0MFVNP1Mv4WGGl446HBGUy4gLbNBW
   4FsTqwzd/W0uDrcmEUIBFeKRt/90lK04oRbpE3Sz4DyFZRoMLr4zxdw/j
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="286414786"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; 
   d="scan'208";a="286414786"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2022 09:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="728715252"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; 
   d="scan'208";a="728715252"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 05 Oct 2022 09:25:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1og7DW-002jhc-2z;
	Wed, 05 Oct 2022 19:25:54 +0300
Date: Wed, 5 Oct 2022 19:25:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 1/2] device property: Introduce
 fwnode_device_is_compatible() helper
Message-ID: <Yz2wEiOdAs3Xyz3H@smile.fi.intel.com>
References: <20221005143812.33503-1-andriy.shevchenko@linux.intel.com>
 <202210052318.prrotB47-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202210052318.prrotB47-lkp@intel.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, kbuild-all@lists.01.org, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Daniel Scally <djrscally@gmail.com>, linux-acpi@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 06, 2022 at 12:05:43AM +0800, kernel test robot wrote:
> Hi Andy,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on soc/for-next]
> [also build test ERROR on linus/master v6.0 next-20221005]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/device-property-Introduce-fwnode_device_is_compatible-helper/20221005-223919
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
> config: powerpc-allnoconfig
> compiler: powerpc-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/b930d58084d15cbf92f0cd490ad05e843991bd8e
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Andy-Shevchenko/device-property-Introduce-fwnode_device_is_compatible-helper/20221005-223919
>         git checkout b930d58084d15cbf92f0cd490ad05e843991bd8e
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>

Thanks, v2, which already had been sent, should fix all these.

-- 
With Best Regards,
Andy Shevchenko


