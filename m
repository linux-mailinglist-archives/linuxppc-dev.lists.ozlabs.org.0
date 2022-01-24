Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AAB4976CA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 01:45:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jhrr86b1hz3bTd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 11:45:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kBceFHXz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JhrqT4hdhz2yZ6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 11:45:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kBceFHXz; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JhrqS3pTyz4xgt;
 Mon, 24 Jan 2022 11:45:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1642985109;
 bh=tp6JYemoNdZGn43ti2MS8I410+xtbYfaBn5wp63glbw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=kBceFHXzghLTbJrgAle/Q5ZWg0uPHDLvwgArIqAa8IUiIZ0lDWvKyWbYRFSsX6jiH
 5Xmi1q0SGWB4ITAmVbVWQgbrJ3Z8TZUz1vIVIccN29cexuh3B1LvLgr0AGyDmee7jK
 zbDWWiUKPBKaexCV5eJ5sj1IQoo7PgytDxVjmru6dYcBzk0SMetNz/b13z5movnR07
 /VqwrHAb2BZGFzWsEVaYMDfKhPXfWcit+56UScyofqAsEoMc2O+/srJG3pSlwSuX7l
 cTYUR35FkiiK3R8zQCQwrgprvUnbceOK4tPdJCOinTrKh/acFC5JahPauwJ5RR4CXj
 IbR5spFcVvaDw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>, akpm@linux-foundation.org,
 david@redhat.com, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 2/2] powerpc/fadump: opt out from freeing pages on
 cma activation failure
In-Reply-To: <20220117075246.36072-3-hbathini@linux.ibm.com>
References: <20220117075246.36072-1-hbathini@linux.ibm.com>
 <20220117075246.36072-3-hbathini@linux.ibm.com>
Date: Mon, 24 Jan 2022 11:45:05 +1100
Message-ID: <874k5ut10u.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: mike.kravetz@oracle.com, mahesh@linux.ibm.com, sourabhjain@linux.ibm.com,
 osalvador@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini <hbathini@linux.ibm.com> writes:
> With commit a4e92ce8e4c8 ("powerpc/fadump: Reservationless firmware
> assisted dump"), Linux kernel's Contiguous Memory Allocator (CMA)
> based reservation was introduced in fadump. That change was aimed at
> using CMA to let applications utilize the memory reserved for fadump
> while blocking it from being used for kernel pages. The assumption
> was, even if CMA activation fails for whatever reason, the memory
> still remains reserved to avoid it from being used for kernel pages.
> But commit 072355c1cf2d ("mm/cma: expose all pages to the buddy if
> activation of an area fails") breaks this assumption as it started
> exposing all pages to buddy allocator on CMA activation failure.
> It led to warning messages like below while running crash-utility
> on vmcore of a kernel having above two commits:
>
>   crash: seek error: kernel virtual address: <from reserved region>
>
> To fix this problem, opt out from exposing pages to buddy allocator
> on CMA activation failure for fadump reserved memory.
>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> ---
>
> Changes in v3:
> * Added Acked-by tag from David.
>
>
>  arch/powerpc/kernel/fadump.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index d03e488cfe9c..d0ad86b67e66 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -112,6 +112,12 @@ static int __init fadump_cma_init(void)
>  		return 1;
>  	}
>  
> +	/*
> +	 *  If CMA activation fails, keep the pages reserved, instead of
> +	 *  exposing them to buddy allocator. Same as 'fadump=nocma' case.
> +	 */
> +	cma_reserve_pages_on_error(fadump_cma);
> +
>  	/*
>  	 * So we now have successfully initialized cma area for fadump.
>  	 */
> -- 
> 2.34.1
