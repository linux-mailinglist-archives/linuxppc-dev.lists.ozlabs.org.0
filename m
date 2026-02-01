Return-Path: <linuxppc-dev+bounces-16487-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qTD/Ak1Pf2kLnwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16487-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Feb 2026 14:04:13 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF069C5F4E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Feb 2026 14:04:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f3qh653RKz2yDk;
	Mon, 02 Feb 2026 00:04:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769951046;
	cv=none; b=LFDyhKc+RZmp72oTmCqJK4h8LnUOUGpgu3t39I4VKICar78ArtHYyyePmM+/0qDUTNOCkwGHd10+roszzxK3KEKNTZEeOVJxaOvn4qIPUR1bFOItOSm2K5eR7UpgyS8fnzlCyJxJr/TLRoP0+InXjBT+8X3FkWhzQiFXwvy5a+dZUcj3mXN4zuf0UQkNXp5eJ0IlN6oihmscWr2KP06BLH3aUH85XYJy9ZrnqRTsXgu0ZNVPrP6LXzaoMJijFrzTdcuOfT1NmNdbkhkm+gW3UiCDZPSmGpIEHSeoQYwogB+6U7oO+LrMK6ma2zrSjZw1DBGdwkTgo1eIzvieTPX8Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769951046; c=relaxed/relaxed;
	bh=k1PWc9/54O7DPE1urxqdZHaylpF5xEjc39oqRVstw+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yf+YsAbMjQcSLpOcYvcUOtYA/Ha+1m7wNj1OkZozQmJC0BncIpVYFXnNeRdkQQrBKxUKne8CeTKuqBKgoKsVvARIL1vnr1Mn1nxM1Ei5pbGbWWpQjwapmagMxW6CmYABcxRR80T78nO102cdY5l1I2V1MyVwEypUVp2D9lcPj2CPGu56B+iqxa/Hs+ovHmLScyME1yLmkCCxsgj4COnLc035i0ajc83NUtT1IxlPqOr0FLaVJ2ASMULaD6nUWeb9XLXwiRa0rneVdU1YWowVIv+Ph0g7NFLtyvkemJsCi+ugtmRGkaLfV+G3pKcm2E4oe0dSAAAPAvyT8SzrI6pxhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bWZp6jyI; dkim-atps=neutral; spf=pass (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bWZp6jyI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f3qh404Kdz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 00:04:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769951044; x=1801487044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JxRbL3UiA7chywZx7s/1NhqsSsDE4+0tIBI21pQzhp8=;
  b=bWZp6jyIWdQ65SHcqDq6Wx4qyZixX+JQc2OIF0MxK2jzYExeZEiVqctd
   GvriDA0BjXCEPWoL8q5dr6vu/h5c5oOnx7rtN5oUP4Y1jgDSnT/fJ76X0
   xeK3DYmapoBFYNCVGoQd00nqNMkvzq5/PX9EbD09k5i7UWwuHJ+WQlSQv
   iFCgMC+bDspBLSyddN/HcxsyAnvnAFaVP72TXyZ3c0pswFwYqSophsDX4
   1fGQ87OOBBhc79ptJTFIx3K7gorwpO4TX06V20y/foJdjLNz4mD++9ReG
   GaAhVY5+hNwqorY7B1Fb2AQ/5jALe1lIkMgf6HEhcoAy8vChtgfH1qTYw
   Q==;
X-CSE-ConnectionGUID: h7U32uVnSAS2GVJgPV6VbQ==
X-CSE-MsgGUID: 34dee3KtRMifTEfmTGd1Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="70149725"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="70149725"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 05:03:58 -0800
X-CSE-ConnectionGUID: 3kWg8PvUTxuKPPw4OIctOQ==
X-CSE-MsgGUID: TrdnJnaNRvGEGGazG0k4kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="209048462"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Feb 2026 05:03:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmX7F-00000000elw-1KtL;
	Sun, 01 Feb 2026 13:03:49 +0000
Date: Sun, 1 Feb 2026 21:03:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, balbirs@nvidia.com,
	matthew.brost@intel.com, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
	lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
	mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
	linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org,
	jgg@ziepe.ca, Felix.Kuehling@amd.com, jniethe@nvidia.com,
	jhubbard@nvidia.com, maddy@linux.ibm.com, mpe@ellerman.id.au
Subject: Re: [PATCH v5 13/13] mm: Remove device private pages from the
 physical address space
Message-ID: <202602012037.jpAjBFBa-lkp@intel.com>
References: <20260130111050.53670-14-jniethe@nvidia.com>
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
In-Reply-To: <20260130111050.53670-14-jniethe@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16487-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:jniethe@nvidia.com,m:linux-mm@kvack.org,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url]
X-Rspamd-Queue-Id: BF069C5F4E
X-Rspamd-Action: no action

Hi Jordan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 344db0fba38920be64a429c64a8ca0531572896c]

url:    https://github.com/intel-lab-lkp/linux/commits/Jordan-Niethe/mm-migrate_device-Introduce-migrate_pfn_from_page-helper/20260130-191416
base:   344db0fba38920be64a429c64a8ca0531572896c
patch link:    https://lore.kernel.org/r/20260130111050.53670-14-jniethe%40nvidia.com
patch subject: [PATCH v5 13/13] mm: Remove device private pages from the physical address space
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260201/202602012037.jpAjBFBa-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602012037.jpAjBFBa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602012037.jpAjBFBa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:1071:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1071 |                 if (IS_ERR(r))
         |                     ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:1075:6: note: uninitialized use occurs here
    1075 |         if (ret) {
         |             ^~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:1071:3: note: remove the 'if' if its condition is always true
    1071 |                 if (IS_ERR(r))
         |                 ^~~~~~~~~~~~~~
    1072 |                         ret = PTR_ERR(r);
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c:1035:9: note: initialize the variable 'ret' to silence this warning
    1035 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +1071 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_migrate.c

  1028	
  1029	int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
  1030	{
  1031		struct amdgpu_kfd_dev *kfddev = &adev->kfd;
  1032		struct dev_pagemap *pgmap;
  1033		unsigned long size;
  1034		void *r;
  1035		int ret;
  1036	
  1037		/* Page migration works on gfx9 or newer */
  1038		if (amdgpu_ip_version(adev, GC_HWIP, 0) < IP_VERSION(9, 0, 1))
  1039			return -EINVAL;
  1040	
  1041		if (adev->apu_prefer_gtt)
  1042			return 0;
  1043	
  1044		pgmap = &kfddev->pgmap;
  1045		memset(pgmap, 0, sizeof(*pgmap));
  1046	
  1047		/* TODO: register all vram to HMM for now.
  1048		 * should remove reserved size
  1049		 */
  1050		size = ALIGN(adev->gmc.real_vram_size, 2ULL << 20);
  1051		if (adev->gmc.xgmi.connected_to_cpu) {
  1052			pgmap->range.start = adev->gmc.aper_base;
  1053			pgmap->range.end = adev->gmc.aper_base + adev->gmc.aper_size - 1;
  1054			pgmap->type = MEMORY_DEVICE_COHERENT;
  1055		} else {
  1056			pgmap->nr_pages = size / PAGE_SIZE;
  1057			pgmap->type = MEMORY_DEVICE_PRIVATE;
  1058		}
  1059	
  1060		pgmap->nr_range = 1;
  1061		pgmap->ops = &svm_migrate_pgmap_ops;
  1062		pgmap->owner = SVM_ADEV_PGMAP_OWNER(adev);
  1063		pgmap->flags = 0;
  1064		/* Device manager releases device-specific resources, memory region and
  1065		 * pgmap when driver disconnects from device.
  1066		 */
  1067		if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
  1068			ret = devm_memremap_device_private_pagemap(adev->dev, pgmap);
  1069		} else {
  1070			r = devm_memremap_pages(adev->dev, pgmap);
> 1071			if (IS_ERR(r))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

