Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8E88AAF2C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 15:18:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kk5mT5I7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLZwB5hdsz3d24
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 23:18:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kk5mT5I7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLZvQ2SXqz3cXF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 23:17:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C253619D9;
	Fri, 19 Apr 2024 13:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C79C072AA;
	Fri, 19 Apr 2024 13:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713532669;
	bh=P3USWEZSPy10m4QVgX4E7XO5g3Xx+Ubf4LMQr2KdyCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kk5mT5I7gsbHbYbsEWHu9NNp+2wXKQavfy5cllFObb5io4ETLYs1kvPmh/s4KHS4G
	 qQ5Y8p2yVQU9b1iRl6GgjWZTsXflEnzvm6iBOmEi8hnjT5vvoU5J+O5+kpj4WbFI0w
	 q8R8QfrLr3LHtcbPo8hV7/kBqryNZ7L6FBHFgX+rPjDj9CLZLhDNQbFncSrvnjHGdP
	 K4wTX/u7ecsJQjfCd2lf4hf1PVGFRl7Tk0Mc5ImI7AGLl+uUi2iUWc75/YS1AAZxt1
	 3MF2iBePRNKEbtWQqPNbn0MduFQ2Y7OvGTMB6MXL4oTLmIIDxCdR3lYu3XZTxqfIHP
	 3HFaJYYyS94Vw==
Date: Fri, 19 Apr 2024 14:17:44 +0100
From: Will Deacon <will@kernel.org>
To: Rohan McLure <rmclure@linux.ibm.com>
Subject: Re: [PATCH] asm-generic/mmiowb: Mark accesses to fix KCSAN warnings
Message-ID: <20240419131744.GB3148@willie-the-truck>
References: <20240404043855.640578-2-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404043855.640578-2-rmclure@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, gautam@linux.ibm.com, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 04, 2024 at 03:38:53PM +1100, Rohan McLure wrote:
> Prior to this patch, data races are detectable by KCSAN of the following
> forms:
> 
> [1] Asynchronous calls to mmiowb_set_pending() from an interrupt context
>     or otherwise outside of a critical section
> [2] Interrupted critical sections, where the interrupt will itself
>     acquire a lock
> 
> In case [1], calling context does not need an mmiowb() call to be
> issued, otherwise it would do so itself. Such calls to
> mmiowb_set_pending() are either idempotent or no-ops.
> 
> In case [2], irrespective of when the interrupt occurs, the interrupt
> will acquire and release its locks prior to its return, nesting_count
> will continue balanced. In the worst case, the interrupted critical
> section during a mmiowb_spin_unlock() call observes an mmiowb to be
> pending and afterward is interrupted, leading to an extraneous call to
> mmiowb(). This data race is clearly innocuous.
> 
> Resolve KCSAN warnings of type [1] by means of READ_ONCE, WRITE_ONCE.
> As increments and decrements to nesting_count are balanced by interrupt
> contexts, resolve type [2] warnings by simply revoking instrumentation,
> with data_race() rather than READ_ONCE() and WRITE_ONCE(), the memory
> consistency semantics of plain-accesses will still lead to correct
> behaviour.
> 
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
> Reported-by: Gautam Menghani <gautam@linux.ibm.com>
> Tested-by: Gautam Menghani <gautam@linux.ibm.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Previously discussed here:
> https://lore.kernel.org/linuxppc-dev/20230510033117.1395895-4-rmclure@linux.ibm.com/
> But pushed back due to affecting other architectures. Reissuing, to
> linuxppc-dev, as it does not enact a functional change.
> ---
>  include/asm-generic/mmiowb.h | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/include/asm-generic/mmiowb.h b/include/asm-generic/mmiowb.h
> index 5698fca3bf56..f8c7c8a84e9e 100644
> --- a/include/asm-generic/mmiowb.h
> +++ b/include/asm-generic/mmiowb.h
> @@ -37,25 +37,28 @@ static inline void mmiowb_set_pending(void)
>  	struct mmiowb_state *ms = __mmiowb_state();
>  
>  	if (likely(ms->nesting_count))
> -		ms->mmiowb_pending = ms->nesting_count;
> +		WRITE_ONCE(ms->mmiowb_pending, ms->nesting_count);
>  }
>  
>  static inline void mmiowb_spin_lock(void)
>  {
>  	struct mmiowb_state *ms = __mmiowb_state();
> -	ms->nesting_count++;
> +
> +	/* Increment need not be atomic. Nestedness is balanced over interrupts. */
> +	data_race(ms->nesting_count++);
>  }
>  
>  static inline void mmiowb_spin_unlock(void)
>  {
>  	struct mmiowb_state *ms = __mmiowb_state();
> +	u16 pending = READ_ONCE(ms->mmiowb_pending);
>  
> -	if (unlikely(ms->mmiowb_pending)) {
> -		ms->mmiowb_pending = 0;
> +	WRITE_ONCE(ms->mmiowb_pending, 0);

Why are you changing this store to be unconditional?

Will
