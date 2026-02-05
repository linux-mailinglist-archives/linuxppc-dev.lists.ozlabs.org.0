Return-Path: <linuxppc-dev+bounces-16622-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJcOH/nHhGk45QMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16622-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 17:40:25 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 702F4F5574
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 17:40:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6NHm3Clkz2yFb;
	Fri, 06 Feb 2026 03:40:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770309620;
	cv=none; b=doPqYCF4QxsBpZNreg3Xu7NM0038KIQEBBMnaXfDpargOB7TpVR5AOl0q4xcZLPDMWcxQbPLro2Mq+Bi+wvAp+xViFbKIrKRSCGpOI3r9u80YoyXap2026m5fDdwONopONQfP4mQ5H2NdYuK31MxaQGU+/OHxDeYYVjisU/IStSv/FzQro8k/x9ArURfdojsUSbVT7qRmBuPT97HDvx/kvcIXT5Dv+cv7JGB7oQO+Mmc4mnNnMAM9jAS1IDtuNBrnota/xOF5uijtjLm9YIzh1wB1UDTqondIZt/miu9RfypssDQlQTubaFvsOjk9Nxssx4dBvdBxHrq4m/QTgnQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770309620; c=relaxed/relaxed;
	bh=QgL8whsFpDPHx9obYZ/kXfpQ6fUbMkyQUf1DSjylsew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzVWJiImq5CrLEi7brFwLLi1TtxvOzW2+sA6UY9tHaekPqbyLCCKUVrZMTkDh07wF/hzVJUU+XhOwy0pzmxlKqbmQgW9IvRp6a7y8Up+0lmkGyKj6UqrUOC7TJYpWw5wrxYjCOGXGkG2vI8+oBEUikUI3WErGplPjwJiJy4PuFyw5h5qQqke68RNjq5+U+hSVX85FhPKXnOcacEN/DQsyE5SoIzcVMU41xeziiRTrQXeioLrNAtvME4GrcN8PdK3qJtyjlzY8k6cD4YofFqsBVTi3HNDZSWo8K4/P0ZElXQAlHjIHQvAW6l3TG/XS+EJrSUhlwH1N00ol/GNPNZxkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WNl4uzZt; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WNl4uzZt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6NHj51Ztz2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 03:40:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770309619; x=1801845619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qifjVohAwoQbELn/0XpFtemnQ2ErMQPvwk66pleBzvk=;
  b=WNl4uzZttdjyXLzL7hAHrhQTvNE3HMTV7C8QLSKv/FKBV6r1CtORlUEU
   hCFzsTNd8kIX4aT8OcBpyzrSjzEpBR9hkHYqd8ejzwwylJhccC0I+8hM7
   AeHPS3E/oOAOAyrHJqcoXxxeg64cJw+yuTA4rIle9jamJEKq03C7aBKGZ
   Z7RTSdp7/6aytno5uyHp2nk6LEWvQB1GqpmxmsRWAWwpvQ20zvdjFJVEW
   cmvHWQe7BhEKB1kba4RL5Uu5wN8WDNB6/eLE3HX3TIHUft/dAI6IKZEAN
   7KPYpO2TDStSFmLtXZkgUglV7s2/0WGbNUo2NTRyEFHutw6dAE8QlC2hn
   A==;
X-CSE-ConnectionGUID: 16Z3Y9VPQ9Wxf/vHIGKKgQ==
X-CSE-MsgGUID: 1R3zfRNmT5e/5E/pX7eGsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="94158741"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="94158741"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 08:40:13 -0800
X-CSE-ConnectionGUID: 57yKVgOzQGefTv4/z/HjLw==
X-CSE-MsgGUID: uhZGgVX5QxS+TXPSN0UFGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="210409824"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.142])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 08:40:10 -0800
Date: Thu, 5 Feb 2026 18:40:08 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, kees@kernel.org, andy@kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, lilinjie8@huawei.com,
	liaohua4@huawei.com
Subject: Re: [PATCH 2/2] powerpc/text-patching: Fix possible
 stringop-overread compilation error
Message-ID: <aYTH6A2rZQ4Ky-PL@smile.fi.intel.com>
References: <20260205100517.292858-1-xieyuanbin1@huawei.com>
 <20260205100517.292858-2-xieyuanbin1@huawei.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260205100517.292858-2-xieyuanbin1@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16622-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,lists.ozlabs.org,vger.kernel.org,huawei.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:xieyuanbin1@huawei.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:kees@kernel.org,m:andy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:lilinjie8@huawei.com,m:liaohua4@huawei.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 702F4F5574
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 06:05:17PM +0800, Xie Yuanbin wrote:

First of all, when sending a series, always add a cover letter to explain
dependencies, goal, and how to route the series via the respective tree(s),
et cetera.

> For strnlen(), if the compiler detects that the maxlen argument exceeds
> the valid memory size of the input string object, a compilation error may
> occur.
> 
> For lastest linux-next source, changing ppc_kallsyms_lookup_name() to
> __always_inline,

So, there is no issue in upstream without the mentioned change, right?

> using default ppc64_defconfig, and setting
> CONFIG_EXPERT=y, CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2=n,
> CONFIG_CC_OPTIMIZE_FOR_SIZE=y. Then, when using gcc-15 for compilation,
> the following error will be triggered:
> ```log
>   CC      arch/powerpc/kernel/optprobes.o
> In file included from ./arch/powerpc/include/asm/kprobes.h:24,
>                  from ./include/linux/kprobes.h:31,
>                  from arch/powerpc/kernel/optprobes.c:8:
> In function ‘ppc_kallsyms_lookup_name’,
>     inlined from ‘arch_prepare_optimized_kprobe’ at arch/powerpc/kernel/optprobes.c:209:21:
> ./arch/powerpc/include/asm/text-patching.h:232:13: error: ‘strnlen’ specified bound 512 exceeds source size 19 [-Werror=stringop-overread]
>   232 |         if (strnlen(name, KSYM_NAME_LEN) >= KSYM_NAME_LEN)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In function ‘ppc_kallsyms_lookup_name’,
>     inlined from ‘arch_prepare_optimized_kprobe’ at arch/powerpc/kernel/optprobes.c:210:22:
> ./arch/powerpc/include/asm/text-patching.h:232:13: error: ‘strnlen’ specified bound 512 exceeds source size 13 [-Werror=stringop-overread]
>   232 |         if (strnlen(name, KSYM_NAME_LEN) >= KSYM_NAME_LEN)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> ```
> 
> Refer to the implementation of fortify's strnlen(). If the string length
> is a compile-time constant, do not call the strnlen() function.

I don't with the first patch this is a correct approach.
But I let others to comment, I assume Kees knows better
what's this and how it can be fixed without exporting
special macros.

-- 
With Best Regards,
Andy Shevchenko



