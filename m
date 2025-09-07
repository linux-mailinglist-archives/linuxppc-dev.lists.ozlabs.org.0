Return-Path: <linuxppc-dev+bounces-11847-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBFBB47954
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Sep 2025 09:28:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cKMBr3WyJz30Lt;
	Sun,  7 Sep 2025 17:28:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757230116;
	cv=none; b=jY4982orZQy50qEGQG5gxoKMnL0GSAAKq743Cb6x2M48HT6CIK5zCp0WmKLUVTSBlZ4bxaexfobVsicAhMVcOsFUwIIiKHdYeDuATwZTX2xbq+Hw+Kv1CIqReuY9Z1M4fFFhc5EnqybZ3wTkdZ8+svTdX7HMeGQGZ4hEAHeTjfs3mH/63XyrMANFZcuMu2V+ylKliKuLWQeEzs+yawFdIeeTP4yy4Lz2+6vxZEuu39LV70sObM32MWAx1FxcU/OMCBp9RAQBH4/zYnreP9NPSlYLIsUum9uGQ6hTPwHxiWdUCUOBZi7tNXC91E5f0X97ZdD1b6JbGgfw/nKFogseZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757230116; c=relaxed/relaxed;
	bh=EbnImvGmsNpjvAuQD0XQBjWlNA/kq/DbLFRzf41D8kE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOt2w/3/qc2DyenHG+PfS+8EYMNOw9gtWC8iMkW3lfvNWylr8gUe88iGknwiYEXgfzmiUGtmrily/6Z147wnWff8ooRiQMZYs1pVqnVsuuwMcbnVacAxKhWR7Xbgtc5R6ykwbdWG4p/IE5/YlpepG5V2RL13ryM/tjvSeyoELL2EuzxZdks6xjn2AYRuiplg+r5sxQRaWGZukspl8+5lZW8q9gbrqxG30VUx/vknk/ARcYwlJjGHCkrrjDOC/aOWdQ+DwdwkcuI7hd65t4EBA53vopJ+nOVATzdGZTn1z6foIDV7tAy2pRQHyl0c4Z4EI2YcNTEFdgMZvmikXm2Ntw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kgpsaLwD; dkim-atps=neutral; spf=pass (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kgpsaLwD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cKMBn75Wmz306S
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Sep 2025 17:28:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757230114; x=1788766114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=19lTElotOYS8K01ze9bNW8yLV/5lKaQW5fSC/H9rmg0=;
  b=kgpsaLwDeGKS3wI8Uc98DEyVhXreULNf0T476vbJO74MHVF4+W+I4qJk
   vnlxmBuAkNfimALD0WMmgakMvt2pTQV0NdgvAYMYkwj3kjYeYGWR3BAV9
   EO4oIEaBOszriqNnf2ICO9k79kpNyCu7HHCSPtpP7AA27ShE3ThfrE51N
   D82SMpwT4KYl/zhnDrxx8AFznB5aR7qAlaYLngOV6D/J1Ja9YJv2Rnkw7
   aQ8IN1NE7Tm2n3SXWBcZnkfbMaoJVhL0W1LIRB3pXeTa8SBycb4LRona5
   STxpQft0SSHd9loog1RyIcO8N3Eyailrlz19D64EJhdWhxZegN04vChGe
   w==;
X-CSE-ConnectionGUID: yd/e2jyjSAOfAgPWKrrjlw==
X-CSE-MsgGUID: moQ2WTN9Q6i9jqI5Isd9ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="58728729"
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="58728729"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 00:28:30 -0700
X-CSE-ConnectionGUID: webw3IrAS9qctFSe10u1pQ==
X-CSE-MsgGUID: eTY3oN07TjWs1psnpdSdeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="176862096"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Sep 2025 00:28:26 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uv9p2-000271-2O;
	Sun, 07 Sep 2025 07:28:24 +0000
Date: Sun, 7 Sep 2025 15:27:31 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, msuchanek@suse.de, mahesh@linux.ibm.com,
	tyreld@linux.ibm.com, hbabu@us.ibm.com, haren@linux.ibm.com,
	shashank.gowda@in.ibm.com, bjking1@linux.ibm.com
Subject: Re: [PATCH v5 3/9] powerpc/pseries: Add papr-hvpipe char driver for
 HVPIPE interfaces
Message-ID: <202509071522.62SUglTH-lkp@intel.com>
References: <20250906155308.705926-4-haren@linux.ibm.com>
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
In-Reply-To: <20250906155308.705926-4-haren@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Haren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Define-papr-hvpipe-ioctl/20250906-235556
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250906155308.705926-4-haren%40linux.ibm.com
patch subject: [PATCH v5 3/9] powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces
config: powerpc64-randconfig-r123-20250907 (https://download.01.org/0day-ci/archive/20250907/202509071522.62SUglTH-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250907/202509071522.62SUglTH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509071522.62SUglTH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/pseries/papr-hvpipe.c:149:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   arch/powerpc/platforms/pseries/papr-hvpipe.c:149:33: sparse:     expected restricted __poll_t ( *poll )( ... )
   arch/powerpc/platforms/pseries/papr-hvpipe.c:149:33: sparse:     got unsigned int ( * )( ... )

vim +149 arch/powerpc/platforms/pseries/papr-hvpipe.c

   144	
   145	static const struct file_operations papr_hvpipe_handle_ops = {
   146		.read		=	papr_hvpipe_handle_read,
   147		.write		=	papr_hvpipe_handle_write,
   148		.release	=	papr_hvpipe_handle_release,
 > 149		.poll		=	papr_hvpipe_handle_poll,
   150	};
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

