Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7ED39EA67
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 01:50:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzVVB0fJbz3071
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 09:50:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=asVX63aw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=asVX63aw; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzVTc3gY2z2yhd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 09:49:40 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56A56610E7;
 Mon,  7 Jun 2021 23:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1623109775;
 bh=wxUVyz8qev8tVhu8PQWcp+37ij3S9w/4BeA7vonLCSk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=asVX63awTfqg/iMMlsQL0INhiGLCFajgpBC0a1YCIfWFg/m2ij2+9NeD5Q5ip2hTT
 TAAVAn85Gr+4WdPiHXwr6HZhgU3/9wd+ld+G27FnFkb+JtAFkzEnmbfbBfq53rBeKg
 MzmrWw6bOnh6JWFKPU8ptpSBevb3gFf+L8saSdT8=
Date: Mon, 7 Jun 2021 16:49:34 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 1/4] lazy tlb: introduce lazy mm refcount helper
 functions
Message-Id: <20210607164934.d453adcc42473e84beb25db3@linux-foundation.org>
In-Reply-To: <20210605014216.446867-2-npiggin@gmail.com>
References: <20210605014216.446867-1-npiggin@gmail.com>
 <20210605014216.446867-2-npiggin@gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
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
Cc: linux-arch@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andy Lutomirski <luto@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat,  5 Jun 2021 11:42:13 +1000 Nicholas Piggin <npiggin@gmail.com> wrote:

> Add explicit _lazy_tlb annotated functions for lazy mm refcounting.
> This makes lazy mm references more obvious, and allows explicit
> refcounting to be removed if it is not used.
> 
> ...
>
> --- a/kernel/kthread.c
> +++ b/kernel/kthread.c
> @@ -1314,14 +1314,14 @@ void kthread_use_mm(struct mm_struct *mm)
>  	WARN_ON_ONCE(!(tsk->flags & PF_KTHREAD));
>  	WARN_ON_ONCE(tsk->mm);
>  
> +	mmgrab(mm);
> +
>  	task_lock(tsk);
>  	/* Hold off tlb flush IPIs while switching mm's */
>  	local_irq_disable();
>  	active_mm = tsk->active_mm;
> -	if (active_mm != mm) {
> -		mmgrab(mm);
> +	if (active_mm != mm)
>  		tsk->active_mm = mm;
> -	}

Looks like a functional change.  What's happening here?


