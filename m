Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6259832601D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 10:36:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dn4KB2lptz3cy4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 20:35:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=MXkFn+z7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=MXkFn+z7; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dn4Jg4kr7z3cXh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 20:35:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=W1YHXCHuslkzyplkfwCtvRWbMC7QKmPwyjme1/hkYgs=; b=MXkFn+z70vlh7OF/fD0z+fkPLh
 eLDE/4SKXciycwprcA7cHjJdKwwSP3Zm/IJx4qbmBPocxZbgDF2/177Jsj+KpsehtT9lC272xEaZj
 7/oeV9+wShxG3eYnPd6YpfVs97emH/xhhFUhWGmT8Ygu26Rn1qvRM0DC2a+GDKiOJwWX46WBLqPa1
 +YPgX2SydBUB4ABu5k/hDcGUOdBHsqdCR9ff9sfcWpbSwiW7h7BJhiTSK+6wgItxycLiUbp9taHi5
 svI+ngNDg4Z6cE6eAftyAjZS4Mewyt3jBMWf31aP1ktoz759F5y8UN7TzqJZqqmemiNXkokdXv2HK
 +XADsZ4Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFZWn-0004uu-DI; Fri, 26 Feb 2021 09:35:17 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B7B5F30504E;
 Fri, 26 Feb 2021 10:35:14 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 776942D9ACDCE; Fri, 26 Feb 2021 10:35:14 +0100 (CET)
Date: Fri, 26 Feb 2021 10:35:14 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2] powerpc/perf: Fix handling of privilege level checks
 in perf interrupt context
Message-ID: <YDjA0giNnkfHeYM5@hirez.programming.kicks-ass.net>
References: <1614247839-1428-1-git-send-email-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614247839-1428-1-git-send-email-atrajeev@linux.vnet.ibm.com>
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
Cc: maddy@linux.ibm.com, omosnace@redhat.com, acme@kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 25, 2021 at 05:10:39AM -0500, Athira Rajeev wrote:
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 4b4319d8..c8be44c 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -222,7 +222,7 @@ static inline void perf_get_data_addr(struct perf_event *event, struct pt_regs *
>  	if (!(mmcra & MMCRA_SAMPLE_ENABLE) || sdar_valid)
>  		*addrp = mfspr(SPRN_SDAR);
>  
> -	if (is_kernel_addr(mfspr(SPRN_SDAR)) && perf_allow_kernel(&event->attr) != 0)
> +	if (is_kernel_addr(mfspr(SPRN_SDAR)) && event->attr.exclude_kernel)
>  		*addrp = 0;
>  }
>  
> @@ -507,7 +507,7 @@ static void power_pmu_bhrb_read(struct perf_event *event, struct cpu_hw_events *
>  			 * addresses, hence include a check before filtering code
>  			 */
>  			if (!(ppmu->flags & PPMU_ARCH_31) &&
> -				is_kernel_addr(addr) && perf_allow_kernel(&event->attr) != 0)
> +			    is_kernel_addr(addr) && event->attr.exclude_kernel)
>  				continue;
>  
>  			/* Branches are read most recent first (ie. mfbhrb 0 is

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
