Return-Path: <linuxppc-dev+bounces-8469-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE3EAB0F1E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 11:38:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zv3pF6JGqz3bgr;
	Fri,  9 May 2025 19:38:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746783493;
	cv=none; b=hd2Q/uQJImZ1DpghLtZl+m43sicugBt7gCfl2oLlldyKGyVzZcASOVpavufCR7MZy9UkhLZXaR2TeC9ENyGl+b/knvRWHZVJsl8W/6aA/bhfycBcdoPCy7ZkcX7RrQiffbyKtKFibUcicQfYXKVR1f1qQ0SD/WL8SDN1YFP8yHU425m1q4pAvOZGZAFawOAJjvuHI0P9zqvEMnsYUO51aj14UfRc8/ErThiRiIHFkRnNyqNp6GkjHuQkUOeoKqV49cC2S3MAquWXXH3cZ/G4E3sUggarfrk5kTqNnqM1FQuOQAxnR87ISvIZCiXpLmySLS/PxMiimwN3ttP9bHyLZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746783493; c=relaxed/relaxed;
	bh=2Rz8D9bsjt9Lj8DX3PLX/z6JELaOfjGno+1+5mvyYRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBCiaLt6vckZjT1hwt1C8qLOnqrAZKDGF8j7gK9q9y/CYbXt/+t/Df4eud5WTrT0UVbvL6Oxp3dR/MoB/AByyCXJbv/nvJHozLhcwYoxD9J+Wc7gm4de2/3XeO5qBRoOLBU2o+Y5aNatQTGvc+4N7d11kTKUhZpFV1G+lyF6A5SOXtone7emnjyIIYeqTMs7k8FGw3QZhQZD0q+ErcttP/Omc9oTqOW9l8D3KOc9sq7vpXrMjyEXyNwdqZ/77ypdSJRaYbwSGJgEfnfKTskaNnyOvRpb0zVSt7pgKyMzYrS2Frms8H9H7dhg3oAybnBpG61coVqa/lYVFB6Es040Dw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IMFhgvn5; dkim-atps=neutral; spf=pass (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IMFhgvn5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zv3pC3DRGz3bgn
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 19:38:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746783491; x=1778319491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GKyHnY3Ghu2yiVf36Y/TrJp84COCpEcwGhvyMsI/YG8=;
  b=IMFhgvn5GudefjsAu8btV4xrszMe6A+WjH3rPQkwugOtbNWHkVE/j0Bs
   SArczmu9TpobNTWnwUZwVNfFoOGldiL6tlc5fqbj2TPatwAxlofbfnTWK
   gSSXXn4qZZW41zxyGq+2ZEecrOBgDA/RiztkD7BkWhATlNv23NPYCVFkG
   yTI6v8ppZWeAClB5zGWvQ+FX9fKaEfuwBNVCPi+SVL4qj4ZVudkg4/IfS
   CJfVbi2QeZV8HONADBal1Gtocb0C3Mku5naf3us1S2ACxaAZ6y2y0kqej
   NlsJwHEmCWqJ50PGwS3Ri1HyH4HOXWlg2UoDwbRSBlWUNJcmSeWog0KV3
   w==;
X-CSE-ConnectionGUID: E3cF6qYkSZCIt63WZNkv3Q==
X-CSE-MsgGUID: YXyD8uHHQaiH+bL7QYkFSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59268833"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="59268833"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 02:38:06 -0700
X-CSE-ConnectionGUID: 0/Te/Uk2TmuNkEJfgpnkUA==
X-CSE-MsgGUID: qb8DGivuQBW3TKbXJfOpfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136959750"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 May 2025 02:37:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDKAv-000BsO-1B;
	Fri, 09 May 2025 09:37:49 +0000
Date: Fri, 9 May 2025 17:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Burri <markus.burri@mt.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Markus Burri <markus.burri@mt.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Maciej Falkowski <maciej.falkowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Nuno Sa <nuno.sa@analog.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, linuxppc-dev@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: Re: [PATCH v4 4/6] gpio: fix potential out-of-bound write
Message-ID: <202505091754.285hHbr2-lkp@intel.com>
References: <20250508130612.82270-5-markus.burri@mt.com>
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
In-Reply-To: <20250508130612.82270-5-markus.burri@mt.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Markus,

kernel test robot noticed the following build errors:

[auto build test ERROR on b4432656b36e5cc1d50a1f2dc15357543add530e]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Burri/iio-backend-fix-out-of-bound-write/20250508-211644
base:   b4432656b36e5cc1d50a1f2dc15357543add530e
patch link:    https://lore.kernel.org/r/20250508130612.82270-5-markus.burri%40mt.com
patch subject: [PATCH v4 4/6] gpio: fix potential out-of-bound write
config: x86_64-buildonly-randconfig-003-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091754.285hHbr2-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091754.285hHbr2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091754.285hHbr2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-virtuser.c:404:6: error: use of undeclared identifier 'size'; did you mean 'ksize'?
     404 |         if (size >= sizeof(buf))
         |             ^~~~
         |             ksize
   include/linux/slab.h:491:8: note: 'ksize' declared here
     491 | size_t ksize(const void *objp);
         |        ^
   1 error generated.


vim +404 drivers/gpio/gpio-virtuser.c

   393	
   394	static ssize_t gpio_virtuser_direction_do_write(struct file *file,
   395							const char __user *user_buf,
   396							size_t count, loff_t *ppos,
   397							bool atomic)
   398	{
   399		struct gpio_virtuser_line_data *data = file->private_data;
   400		struct gpio_desc *desc = data->ad.desc;
   401		char buf[32], *trimmed;
   402		int ret, dir, val = 0;
   403	
 > 404		if (size >= sizeof(buf))
   405			return -EINVAL;
   406	
   407		ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
   408		if (ret < 0)
   409			return ret;
   410	
   411		buf[ret] = '\0';
   412	
   413		trimmed = strim(buf);
   414	
   415		if (strcmp(trimmed, "input") == 0) {
   416			dir = 1;
   417		} else if (strcmp(trimmed, "output-high") == 0) {
   418			dir = 0;
   419			val = 1;
   420		} else if (strcmp(trimmed, "output-low") == 0) {
   421			dir = val = 0;
   422		} else {
   423			return -EINVAL;
   424		}
   425	
   426		if (!atomic)
   427			ret = gpio_virtuser_set_direction(desc, dir, val);
   428		else
   429			ret = gpio_virtuser_set_direction_atomic(desc, dir, val);
   430		if (ret)
   431			return ret;
   432	
   433		return count;
   434	}
   435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

