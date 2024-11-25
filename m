Return-Path: <linuxppc-dev+bounces-3553-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9756D9D8A90
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2024 17:44:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xxs4Z1Ycdz2yFB;
	Tue, 26 Nov 2024 03:44:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732553086;
	cv=none; b=ajkJGqVdMnULWbB8XVtsw6iovPLfDXzJqIY155vGK3GE5fUPz3g1wN07NOhD4hfEtOCd51kBlqglMX2ME8FMsj2EP/CbwNnMaVduzZBrm8o4VESvey3mx91eoOthefOMvAj3UJJVyz+P7odhu2R9ep/E5YXnVqQO9IdSWLxpeg7oAKrdbDSlzxU1HOgwMbVq8qZ54TIA9QsHCTgyeX2PAMXZEAEZQ22B1fnlX3vmDrDzT0BelEdT6iWSP7WDfSqgfJXQ5ZOFPAWd4MSWN4Jn9YgW56JsJGyCRbzCGsteQMWqc2pPYWNvqlOs9U8s4S1yVg6VAeWzar5IKuaQiv8n5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732553086; c=relaxed/relaxed;
	bh=Mu12+s+mrAQSB4HZAcHOl/EmR/skfR4+KF9NfZ8vBXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asJu0JqRHMt0Gg3EQcavxBvdFCcCrEaLiYtAAN4FepEcFt7WugOKJzpngRnPGgim4f4Ud/+6JucreA2FoUZzuWdHIDitwv5oVNeckZE61k3ZNgFDoj8yaYYTl+lkLAFj0WsnXNVe+QxnXIlj7k7FWABdcN2bCAGUSkG9LZEWDl55oamsBhQHDxvzqOv5TyOADRmR9WWBArbLO0tCWFs132L4f6lak/SEMHRlhQ7He9apmDu9UrDsGGch4rr4tE4xnfFNnz8wFvT+i+unEuz5rda68FcrU2jxSIPHb/icPqfCn0bkjM1wEKaaBEWMrDpxLFf6zw54aaLt5yeiUEmI+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MJ8QvMQB; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MJ8QvMQB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xxs4W23mQz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 03:44:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732553082; x=1764089082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qGZQS7FcAB/UyIGtfCnfdxY4J+dkVBrjNgPot3Tg9UU=;
  b=MJ8QvMQBHGspEg2TTwoy279DuVpXYp6IN8D9LOSMVPZBwf1wVQtKNkZf
   ILSoaJYrzPSm/++CxZr0Ti2/wjVCtf+8BX0mhau1tOz9DtL62oOoLH7Ma
   fsfnLDG2MHmzSWgEXLj6bPIF4YWLdfs56ZFIHkUBu6zkCBJGydPe8D3nK
   3lq77iB6P/X1ELs6pgcEY/m50lsFGYuEMlRhlTjP6ofx0W/OvGJwVc8ED
   DdWCXyXYmJXItghyxPkqhsTICrJo90eUfH1YrZqFJ8/+O64SmmXMeJDQE
   wFyC/3WLZmeQCCjR/W9VS1hjS7JxspXvCXZ//XzX/XT6fluU7hZ4jyRkx
   g==;
X-CSE-ConnectionGUID: t6qwaSE7TSa206IUtTeSyA==
X-CSE-MsgGUID: vWNEZSVUR3CwuHKupDscUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32800241"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="32800241"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 08:44:29 -0800
X-CSE-ConnectionGUID: qRb3L2/GQ/CikwDougXocg==
X-CSE-MsgGUID: gLFjNOJaQL2e6gP9WmUCGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="91221279"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Nov 2024 08:44:28 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFcCH-0006bt-12;
	Mon, 25 Nov 2024 16:44:25 +0000
Date: Tue, 26 Nov 2024 00:43:44 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, mpe@ellerman.id.au,
	npiggin@gmail.com, maddy@linux.ibm.com, msuchanek@suse.de,
	tyreld@linux.ibm.com, hbabu@us.ibm.com, haren@linux.ibm.com
Subject: Re: [PATCH] powerpc/pseries: Add papr-platform-dump character driver
 for dump retrieval
Message-ID: <202411260057.wrWAIl67-lkp@intel.com>
References: <20241124052040.239813-1-haren@linux.ibm.com>
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
In-Reply-To: <20241124052040.239813-1-haren@linux.ibm.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Haren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.12 next-20241125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Add-papr-platform-dump-character-driver-for-dump-retrieval/20241125-112816
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20241124052040.239813-1-haren%40linux.ibm.com
patch subject: [PATCH] powerpc/pseries: Add papr-platform-dump character driver for dump retrieval
config: powerpc64-randconfig-001-20241125 (https://download.01.org/0day-ci/archive/20241126/202411260057.wrWAIl67-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411260057.wrWAIl67-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411260057.wrWAIl67-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/papr-platform-dump.c:51: warning: Function parameter or struct member 'dump_tag_hi' not described in 'ibm_platform_dump_params'
>> arch/powerpc/platforms/pseries/papr-platform-dump.c:51: warning: Function parameter or struct member 'dump_tag_lo' not described in 'ibm_platform_dump_params'
>> arch/powerpc/platforms/pseries/papr-platform-dump.c:51: warning: Function parameter or struct member 'sequence_hi' not described in 'ibm_platform_dump_params'
>> arch/powerpc/platforms/pseries/papr-platform-dump.c:51: warning: Function parameter or struct member 'sequence_lo' not described in 'ibm_platform_dump_params'
>> arch/powerpc/platforms/pseries/papr-platform-dump.c:51: warning: Function parameter or struct member 'bytes_ret_hi' not described in 'ibm_platform_dump_params'
>> arch/powerpc/platforms/pseries/papr-platform-dump.c:51: warning: Function parameter or struct member 'bytes_ret_lo' not described in 'ibm_platform_dump_params'
>> arch/powerpc/platforms/pseries/papr-platform-dump.c:51: warning: Excess struct member 'dump_tag' description in 'ibm_platform_dump_params'
>> arch/powerpc/platforms/pseries/papr-platform-dump.c:51: warning: Excess struct member 'sequence' description in 'ibm_platform_dump_params'
>> arch/powerpc/platforms/pseries/papr-platform-dump.c:51: warning: Excess struct member 'written' description in 'ibm_platform_dump_params'


vim +51 arch/powerpc/platforms/pseries/papr-platform-dump.c

    25	
    26	/**
    27	 * struct ibm_platform_dump_params - Parameters (in and out) for
    28	 *                                              ibm,platform-dump
    29	 * @work_area:	In: work area buffer for results.
    30	 * @buf_length:	In: work area buffer length in bytes
    31	 * @dump_tag:	In: Dump_Tag representing an id of the dump being processed
    32	 * @sequence:	In: Sequence number. Out: Next sequence number.
    33	 * @written:	Out: Bytes written by ibm,platform-dump to @work_area.
    34	 * @status:	Out: RTAS call status.
    35	 * @list:	Maintain the list of dumps are in progress. Can retrieve
    36	 *		multiple dumps with different dump IDs at the same time,
    37	 *		but not with the same dump ID. This list is used to
    38	 *		determine whether the dump for the same ID is in progress.
    39	 */
    40	struct ibm_platform_dump_params {
    41		struct rtas_work_area	*work_area;
    42		u32			buf_length;
    43		u32			dump_tag_hi;
    44		u32			dump_tag_lo;
    45		u32			sequence_hi;
    46		u32			sequence_lo;
    47		u32			bytes_ret_hi;
    48		u32			bytes_ret_lo;
    49		s32			status;
    50		struct list_head	list;
  > 51	};
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

