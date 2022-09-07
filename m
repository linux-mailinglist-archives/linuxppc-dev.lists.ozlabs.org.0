Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 785B25B0F0D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 23:23:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNFby2JsLz3bkn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 07:23:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=omGfrsh2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=omGfrsh2;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNFbL2bybz305d
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 07:22:53 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 2D411CE1DB0;
	Wed,  7 Sep 2022 21:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8137C433D6;
	Wed,  7 Sep 2022 21:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1662585767;
	bh=gxMGpmoNCeRaJ1bjDJWBLm6Nn6Ybto9MKRxMg9yg0CM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=omGfrsh2M987hhabKX/032BRuB7di5tlViD/uI57wqu8oWbhfgtnlGmVMjaRwJCmx
	 kVvQhLcqICUIPAxfihnqj3Mfg57B9aC5b3hSZyTig+15RyUEzu6SJw2gHPDJZm6YvL
	 6S8uwjZ7hZ2KxjsppNkkhbu6CrLiMkpu9JK0SLLg=
Date: Wed, 7 Sep 2022 14:22:46 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yang Shi <shy828301@gmail.com>
Subject: Re: [v2 PATCH 1/2] mm: gup: fix the fast GUP race against THP
 collapse
Message-Id: <20220907142246.c7d6f55e1b56fba3e16d974b@linux-foundation.org>
In-Reply-To: <20220907180144.555485-1-shy828301@gmail.com>
References: <20220907180144.555485-1-shy828301@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: david@redhat.com, jhubbard@nvidia.com, hughd@google.com, linux-kernel@vger.kernel.org, peterx@redhat.com, linux-mm@kvack.org, jgg@nvidia.com, aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed,  7 Sep 2022 11:01:43 -0700 Yang Shi <shy828301@gmail.com> wrote:

> Since general RCU GUP fast was introduced in commit 2667f50e8b81 ("mm:
> introduce a general RCU get_user_pages_fast()"), a TLB flush is no longer
> sufficient to handle concurrent GUP-fast in all cases, it only handles
> traditional IPI-based GUP-fast correctly.  On architectures that send
> an IPI broadcast on TLB flush, it works as expected.  But on the
> architectures that do not use IPI to broadcast TLB flush, it may have
> the below race:
> 
>    CPU A                                          CPU B
> THP collapse                                     fast GUP
>                                               gup_pmd_range() <-- see valid pmd
>                                                   gup_pte_range() <-- work on pte
> pmdp_collapse_flush() <-- clear pmd and flush
> __collapse_huge_page_isolate()
>     check page pinned <-- before GUP bump refcount
>                                                       pin the page
>                                                       check PTE <-- no change
> __collapse_huge_page_copy()
>     copy data to huge page
>     ptep_clear()
> install huge pmd for the huge page
>                                                       return the stale page
> discard the stale page
> 
> The race could be fixed by checking whether PMD is changed or not after
> taking the page pin in fast GUP, just like what it does for PTE.  If the
> PMD is changed it means there may be parallel THP collapse, so GUP
> should back off.
> 
> Also update the stale comment about serializing against fast GUP in
> khugepaged.
> 
> Fixes: 2667f50e8b81 ("mm: introduce a general RCU get_user_pages_fast()")

Is this not worth a -stable backport?
