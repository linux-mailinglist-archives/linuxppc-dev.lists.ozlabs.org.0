Return-Path: <linuxppc-dev+bounces-3983-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 206869ECE6C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 15:19:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7d5M3NKwz2yNR;
	Thu, 12 Dec 2024 01:19:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733926759;
	cv=none; b=C60SMonFzFxjH+zHPViBUIUDuUFOREjyJMJ4ej0z3m1ClKuAxNMGY9LEbnQJ6Xndvp8dz4Un3JimJyc3+4Djf2RS/HgruBfn8wlbtaqSZnQqIYQHE2/Qg1ruJPbPbXyRm6tT4S23oXDT+qkeSdS2T3xqhibjvX6bHi3Wlc18rUljBeNGOPyL5iAFOtuDPzSqifQWFirkn1dX3x3BTSoocyEKrHUXSJFEpDdabG04euMOn2ewu3diPRA3N1VDimtjXvnjymQVZ5WwD7srZrdPuYrRkTA4PlNf6NrbiTwlf9RXv0YUXO1oeH5C9NTVor7SH4BPnEMYgEhw9fogPfOqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733926759; c=relaxed/relaxed;
	bh=XwQQ3x8zvRTDshwJQNsTE1iolV5XC7jkIWrcp2laFsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+YDZYZoTmTpFd9H83hQNA6alfUKgyTqp23+6dZDdMU4Nn842GmGVN2if8B4TNGsuaY2ihgdBDHfarWGvPvPDOHR7d25P3xxMhNFc3dvjS2MqALHBWvlSnlSBEzMToEQDHozTTKxZ2U9dGnNOS08Uig0f32wPNfgbLB/svPK4ngzUmSvcSQRq19kAoNC3b/2NxiiNTSk1FizQ9Hr/9t+V2E/mwKiFfCUPaZO6x00Su9hU8Hpre1Ezj0ioaLImQVwSe/5LOvB6JcOHC95H3EMRzbW/lpuERRNvSsdX7oP34UgLezfgHMqhDZorcyve0x8Vv2H6TpfOvL2klpmO9OjJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XRANGyju; dkim-atps=neutral; spf=pass (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XRANGyju;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7d5J2CwDz2yGT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 01:19:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733926756; x=1765462756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n/bW5X2P50IWGPskV8bddp7mr3+Mz84TOOqK8/Bw/oE=;
  b=XRANGyju2YnmPhXq/r3YpeLOv2FqyDRo9RH/12dtzm/QLiG54YlByl3r
   29ZE6JxHPnJrEmUDeUrEIUajK58JMkKiAb4xHw50EkQslKfk5niZLVlbJ
   mkR2zx9CeLbLebtQ52mlG3h5siZfYDVEbBB2QT/lCysc42/sh+m5YM1E9
   8b5s20tY+WPmEGv5OYbW1MX5qynyZArvT2KNmRbXFbq2ELcJWH+E08Fy0
   yID/tj8Q9TB6vJEUwgJ6YqnaADuXJY+pQYpeNu6cMGrhIGBy2LCN9qe6J
   KOileb6LvHhx6MuTrMiNfxCSzkiD57axtbO38LgK4nPvYL7i5cpu9t64c
   w==;
X-CSE-ConnectionGUID: Wt3KMw5XRm6ClB1m6arUMw==
X-CSE-MsgGUID: s1UY9tMOSOmZZ/EdBmr5UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38239161"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38239161"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 06:19:09 -0800
X-CSE-ConnectionGUID: V+dO8e6fQuaP7J/uGnbsQg==
X-CSE-MsgGUID: 0Hp/6ujnREedJDCTms2R+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="95885459"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Dec 2024 06:19:07 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLNYO-0006jh-1F;
	Wed, 11 Dec 2024 14:19:04 +0000
Date: Wed, 11 Dec 2024 22:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
	arnd@arndb.de, deller@gmx.de, simona@ffwll.ch, airlied@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
Message-ID: <202412112135.pzFeIjEo-lkp@intel.com>
References: <20241210142329.660801-2-tzimmermann@suse.de>
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
In-Reply-To: <20241210142329.660801-2-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]
[also build test ERROR on staging/staging-next staging/staging-linus drm/drm-next drm-exynos/exynos-drm-next linus/master v6.13-rc2 next-20241211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-Fix-recursive-dependencies-wrt-BACKLIGHT_CLASS_DEVICE/20241210-222618
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20241210142329.660801-2-tzimmermann%40suse.de
patch subject: [PATCH 1/3] fbdev: Fix recursive dependencies wrt BACKLIGHT_CLASS_DEVICE
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20241211/202412112135.pzFeIjEo-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412112135.pzFeIjEo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412112135.pzFeIjEo-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/video/fbdev/aty/radeon_backlight.o: in function `radeonfb_bl_init':
>> radeon_backlight.c:(.text+0x424): undefined reference to `backlight_device_register'
   loongarch64-linux-ld: drivers/video/fbdev/aty/radeon_backlight.o: in function `radeonfb_bl_exit':
>> radeon_backlight.c:(.text+0x560): undefined reference to `backlight_device_unregister'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

