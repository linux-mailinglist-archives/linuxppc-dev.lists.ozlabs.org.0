Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07018492C61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 18:30:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdbQD5yKgz30NB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 04:30:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N4w7lW6J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=dave.hansen@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=N4w7lW6J; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdbPb1kh4z2y0B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jan 2022 04:29:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642526995; x=1674062995;
 h=to:cc:references:from:subject:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=k4eJH2zoU91Kl9uf4FCGcvt/8O88IEchGIaQVuOy/n8=;
 b=N4w7lW6JT5xN1b5ges7sZYr4xMqW+wqS4hycp5P1VEBImYxPc4R69nWx
 e8R9sdto2HM5h9YpgwGwDPawrmN+mXtDk5oMU81kU6vGt6vpvHBQTGy3T
 g8Uzqf3D7Uq1GDhXv9z70XTO2X9sZp7Or8AfxWOoJ8XqD+Bu6N9sY2GnF
 IrO6ZlemqnDpF6WJ0X7jrI3WQ9EShb7o4FX1jkYuMrkN8nAQComVZsj/u
 EYP0HCZJO2sMyprA7QMsnCgAP1ilyLhtwI1rytQFLAeRRd1h2EZ3u78nB
 QYOx/J8SjsnX5qusLZ9BbVeqxgzup48cHnAr8y8/sK5+CtTNNx2f/vMSB g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="308207848"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="308207848"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 09:28:49 -0800
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="764657295"
Received: from ssrikan2-mobl2.amr.corp.intel.com (HELO [10.209.52.128])
 ([10.209.52.128])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 09:28:47 -0800
To: Nicholas Piggin <npiggin@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, Kefeng Wang <wangkefeng.wang@huawei.com>,
 x86@kernel.org
References: <20211227145903.187152-1-wangkefeng.wang@huawei.com>
 <20211227145903.187152-4-wangkefeng.wang@huawei.com>
 <70ff58bc-3a92-55c2-2da8-c5877af72e44@intel.com>
 <3858de1f-cdbc-ff52-2890-4254d0f48b0a@huawei.com>
 <31a75f95-6e6e-b640-2d95-08a95ea8cf51@intel.com>
 <1642472965.lgfksp6krp.astroid@bobo.none>
From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v2 3/3] x86: Support huge vmalloc mappings
Message-ID: <4488d39f-0698-7bfd-b81c-1e609821818f@intel.com>
Date: Tue, 18 Jan 2022 09:28:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1642472965.lgfksp6krp.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/17/22 6:46 PM, Nicholas Piggin wrote:
>> This all sounds very fragile to me.  Every time a new architecture would
>> get added for huge vmalloc() support, the developer needs to know to go
>> find that architecture's module_alloc() and add this flag.
> This is documented in the Kconfig.
> 
>  #
>  #  Archs that select this would be capable of PMD-sized vmaps (i.e.,
>  #  arch_vmap_pmd_supported() returns true), and they must make no assumptions
>  #  that vmalloc memory is mapped with PAGE_SIZE ptes. The VM_NO_HUGE_VMAP flag
>  #  can be used to prohibit arch-specific allocations from using hugepages to
>  #  help with this (e.g., modules may require it).
>  #
>  config HAVE_ARCH_HUGE_VMALLOC
>          depends on HAVE_ARCH_HUGE_VMAP
>          bool
> 
> Is it really fair to say it's *very* fragile? Surely it's reasonable to 
> read the (not very long) documentation ad understand the consequences for
> the arch code before enabling it.

Very fragile or not, I think folks are likely to get it wrong.  It would
be nice to have it default *everyone* to safe and slow and make *sure*
they go look at the architecture modules code itself before enabling
this for modules.

Just from that Kconfig text, I don't think I'd know off the top of my
head what do do for x86, or what code I needed to go touch.
