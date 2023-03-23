Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 975766C63EB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 10:45:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj0nQ3YWVz3f72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 20:45:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IfN34u3F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj0mW5dSxz307T
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 20:44:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IfN34u3F;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pj0mP1g3Kz4whh;
	Thu, 23 Mar 2023 20:44:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1679564662;
	bh=S2amTGb3UtzvP4OYQU4Xe/khjrYKZ8NND2MoFoHeXOU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IfN34u3FSrM8D0tkh9jT80pdEQGxQdGHouQNheoJeBw9JFTIOwWMT8TUTx0P5jBcS
	 o+C+NpRIVvs2bFGJ+hc9bfBqSoWJ1ftVWV0Dgj5yKf6krRsuw1bP8SSJIcXWFk8rWI
	 uwecZJia4y1531cY2jmba15RVYdE1Re2Zwp3MWgErcXVH7Vd4hzKir3bEquEnJkaGI
	 /0q9QCoLKFGlfPjsGQJqLDBsl3goFlUoowzGUMjHrORNsxPGA1MuWemEYmK7HyEmwS
	 Hlb/mlRYoyEvAnHoVO3qCRyg9e9mZ5t55hvSJkd6HLIAaNzAP/5t8aB68hXAC3FNaE
	 u0TvYImMbTO8g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 8/8] powerpc/rtas: consume retry statuses in sys_rtas()
In-Reply-To: <20230220-rtas-queue-for-6-4-v1-8-010e4416f13f@linux.ibm.com>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
 <20230220-rtas-queue-for-6-4-v1-8-010e4416f13f@linux.ibm.com>
Date: Thu, 23 Mar 2023 20:44:20 +1100
Message-ID: <87pm8zu7ij.fsf@mpe.ellerman.id.au>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org> writes:
> From: Nathan Lynch <nathanl@linux.ibm.com>
>
> The kernel can handle retrying RTAS function calls in response to
> -2/990x in the sys_rtas() handler instead of relaying the intermediate
> status to user space.

This looks good in general.

One query ...

> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 47a2aa43d7d4..c330a22ccc70 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -1798,7 +1798,6 @@ static bool block_rtas_call(int token, int nargs,
>  /* We assume to be passed big endian arguments */
>  SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
>  {
> -	struct pin_cookie cookie;
>  	struct rtas_args args;
>  	unsigned long flags;
>  	char *buff_copy, *errbuf = NULL;
> @@ -1866,20 +1865,25 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
>  
>  	buff_copy = get_errorlog_buffer();
>  
> -	raw_spin_lock_irqsave(&rtas_lock, flags);
> -	cookie = lockdep_pin_lock(&rtas_lock);
> +	do {
> +		struct pin_cookie cookie;
>  
> -	rtas_args = args;
> -	do_enter_rtas(&rtas_args);
> -	args = rtas_args;
> +		raw_spin_lock_irqsave(&rtas_lock, flags);
> +		cookie = lockdep_pin_lock(&rtas_lock);
>  
> -	/* A -1 return code indicates that the last command couldn't
> -	   be completed due to a hardware error. */
> -	if (be32_to_cpu(args.rets[0]) == -1)
> -		errbuf = __fetch_rtas_last_error(buff_copy);
> +		rtas_args = args;
> +		do_enter_rtas(&rtas_args);
> +		args = rtas_args;
>  
> -	lockdep_unpin_lock(&rtas_lock, cookie);
> -	raw_spin_unlock_irqrestore(&rtas_lock, flags);
> +		/*
> +		 * Handle error record retrieval before releasing the lock.
> +		 */
> +		if (be32_to_cpu(args.rets[0]) == -1)
> +			errbuf = __fetch_rtas_last_error(buff_copy);
> +
> +		lockdep_unpin_lock(&rtas_lock, cookie);
> +		raw_spin_unlock_irqrestore(&rtas_lock, flags);
> +	} while (rtas_busy_delay(be32_to_cpu(args.rets[0])));

rtas_busy_delay_early() has the successive_ext_delays case that will
break out eventually. But if we keep getting plain RTAS_BUSY back from
RTAS I *think* this loop will never terminate?

To avoid that, and just as good manners, I think we should have a
fatal_signal_pending() check, and if that returns true we bail out of
the syscall with -EINTR ?

cheers
