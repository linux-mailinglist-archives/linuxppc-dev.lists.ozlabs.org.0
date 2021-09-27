Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5A44194DE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 15:12:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJ32x3cWWz2yQy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 23:12:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bCCOJ57P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=150.107.74.76; helo=gandalf.ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=bCCOJ57P; 
 dkim-atps=neutral
X-Greylist: delayed 18809 seconds by postgrey-1.36 at boromir;
 Mon, 27 Sep 2021 23:12:04 AEST
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJ32D2rFgz2xr9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep 2021 23:12:03 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HJ3286WM8z4xZJ;
 Mon, 27 Sep 2021 23:12:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1632748321;
 bh=/6NGyTxf3yZzS/6VpTsWCSMws0EAQCWdVr1eBk3RItQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bCCOJ57PVuxKBr/+8rzursr0M58poo2U8UYU8FmOa4Ve+xeh2oVXaK/weC5cayqC8
 0wfzCG3XkzUK6Cq3uln4S1u7XiI8Y5zls2oXnDdU8s8sTYlXG0ip+mYiZXMrDsr0Ms
 rgvGcz2IfqStO+q38lKNaAq/EqUyLMic0uWxcIB0J9CzMKYaZF+8ecEHf3d0bQmkvS
 aHG/dFXj/TlPCuEGMseSTg3CjjKQ3HmJ7K6YllqzxrwuI16j2tZXrTHkJAF1Jps4OY
 umzjNyJWrNKJ+gqjI+Y3AiPuqS0/WkO+2lgBODADFgP+K/n+6PQi6QF0+aN0U1U7KW
 vJ+X8XhJSUtPA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Andrew Morton
 <akpm@linux-foundation.org>, arnd@arndb.de
Subject: Re: [PATCH 1/3] mm: Make generic arch_is_kernel_initmem_freed() do
 what it says
In-Reply-To: <0b55650058a5bf64f7d74781871a1ada2298c8b4.1632491308.git.christophe.leroy@csgroup.eu>
References: <0b55650058a5bf64f7d74781871a1ada2298c8b4.1632491308.git.christophe.leroy@csgroup.eu>
Date: Mon, 27 Sep 2021 23:11:56 +1000
Message-ID: <87h7e6kvs3.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Commit 7a5da02de8d6 ("locking/lockdep: check for freed initmem in
> static_obj()") added arch_is_kernel_initmem_freed() which is supposed
> to report whether an object is part of already freed init memory.
>
> For the time being, the generic version of arch_is_kernel_initmem_freed()
> always reports 'false', allthough free_initmem() is generically called
> on all architectures.
>
> Therefore, change the generic version of arch_is_kernel_initmem_freed()
> to check whether free_initmem() has been called. If so, then check
> if a given address falls into init memory.
>
> In order to use function init_section_contains(), the fonction is
> moved at the end of asm-generic/section.h
>
> Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  include/asm-generic/sections.h | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
> index d16302d3eb59..d1e5bb2c6b72 100644
> --- a/include/asm-generic/sections.h
> +++ b/include/asm-generic/sections.h
> @@ -172,4 +158,21 @@ static inline bool is_kernel_rodata(unsigned long addr)
>  	       addr < (unsigned long)__end_rodata;
>  }
>  
> +/*
> + * Check if an address is part of freed initmem. This is needed on architectures
> + * with virt == phys kernel mapping, for code that wants to check if an address
> + * is part of a static object within [_stext, _end]. After initmem is freed,
> + * memory can be allocated from it, and such allocations would then have
> + * addresses within the range [_stext, _end].
> + */
> +#ifndef arch_is_kernel_initmem_freed
> +static inline int arch_is_kernel_initmem_freed(unsigned long addr)
> +{
> +	if (system_state < SYSTEM_RUNNING)
> +		return 0;
> +
> +	return init_section_contains((void *)addr, 1);
> +}
> +#endif

This will return an incorrect result for a short period during boot
won't it?

See init/main.c:

static int __ref kernel_init(void *unused)
{
	...
	free_initmem();			<- memory is freed here
	mark_readonly();

	/*
	 * Kernel mappings are now finalized - update the userspace page-table
	 * to finalize PTI.
	 */
	pti_finalize();

	system_state = SYSTEM_RUNNING;


After free_initmem() we have address ranges that are now freed initmem,
but arch_is_kernel_initmem_freed() continues to return 0 (false) for all
addresses, until we update system_state.

Possibly that doesn't matter for any of the current callers, but it
seems pretty dicey to me.

cheers
