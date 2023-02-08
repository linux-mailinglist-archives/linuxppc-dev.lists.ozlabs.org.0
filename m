Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 660BC68EDCC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 12:21:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBcyn2BXgz3cdd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 22:21:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QkkUTtZi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBcxm3Ylrz3cNY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 22:21:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QkkUTtZi;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PBcxh2QvNz4x1h;
	Wed,  8 Feb 2023 22:20:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1675855257;
	bh=1PKX8H1EOhuFnZ0lUC/x8CwY6vh3C6E0fR/nFB98NtU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QkkUTtZiFMwPEe4df63eDoTSM7aDCXHruM+8donykYf21crz+MQYr1ZP/q73ACDQC
	 30YsNy01TuwnZE7cDeP1kXEqEwLAxYSX7I8THqrIdyn4JYWXUZDEK1MDQmWSgubDkt
	 W+qVd/9AtXFtecp1/wHMb2nt8Ka/KyhI1xuE0kWn6dTEUCxh3c4Vjt4fzsogwwHqTl
	 H9vuCTUK8lba10Ch3rA7zmWusVfUVgoLSYJJFqbM4zFcSikkMKCJ4P9elUPB3GwUY6
	 WHhW1zjmtFokVgn8BlBafXikm17u57Zm1F6OGEO6Cu8f9HjzF+jaxSYOBnoljCIa/F
	 /I1vWMl+CpTMg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Kajol
 Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, Mahesh
 J Salgaonkar <mahesh@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Nick Child <nnac123@linux.ibm.com>
Subject: Re: [PATCH v2 01/19] powerpc/rtas: handle extended delays safely in
 early boot
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v2-1-9aa6bd058063@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
 <20230125-b4-powerpc-rtas-queue-v2-1-9aa6bd058063@linux.ibm.com>
Date: Wed, 08 Feb 2023 22:20:55 +1100
Message-ID: <87ttzwwgh4.fsf@mpe.ellerman.id.au>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch via B4 Submission Endpoint <devnull+nathanl.linux.ibm.com@kernel.org> writes:
> From: Nathan Lynch <nathanl@linux.ibm.com>
>
> Some code that runs early in boot calls RTAS functions that can return
> -2 or 990x statuses, which mean the caller should retry. An example is
> pSeries_cmo_feature_init(), which invokes ibm,get-system-parameter but
> treats these benign statuses as errors instead of retrying.
>
> pSeries_cmo_feature_init() and similar code should be made to retry
> until they succeed or receive a real error, using the usual pattern:
>
> 	do {
> 		rc = rtas_call(token, etc...);
> 	} while (rtas_busy_delay(rc));
>
> But rtas_busy_delay() will perform a timed sleep on any 990x
> status. This isn't safe so early in boot, before the CPU scheduler and
> timer subsystem have initialized.
>
> The -2 RTAS status is much more likely to occur during single-threaded
> boot than 990x in practice, at least on PowerVM. This is because -2
> usually means that RTAS made progress but exhausted its self-imposed
> timeslice, while 990x is associated with concurrent requests from the
> OS causing internal contention. Regardless, according to the language
> in PAPR, the OS should be prepared to handle either type of status at
> any time.
>
> Add a fallback path to rtas_busy_delay() to handle this as safely as
> possible, performing a small delay on 990x. Include a counter to
> detect retry loops that aren't making progress and bail out.
>
> This was found by inspection and I'm not aware of any real
> failures. However, the implementation of rtas_busy_delay() before
> commit 38f7b7067dae ("powerpc/rtas: rtas_busy_delay() improvements")
> was not susceptible to this problem, so let's treat this as a
> regression.
>
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> Fixes: 38f7b7067dae ("powerpc/rtas: rtas_busy_delay() improvements")
> ---
>  arch/powerpc/kernel/rtas.c | 48 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 795225d7f138..ec2df09a70cf 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -606,6 +606,46 @@ unsigned int rtas_busy_delay_time(int status)
>  	return ms;
>  }
>  
> +/*
> + * Early boot fallback for rtas_busy_delay().
> + */
> +static bool __init rtas_busy_delay_early(int status)
> +{
> +	static size_t successive_ext_delays __initdata;
> +	bool ret;

I think the logic would be easier to read if this was called "wait", but
maybe that's just me.

> +	switch (status) {
> +	case RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX:
> +		/*
> +		 * In the unlikely case that we receive an extended
> +		 * delay status in early boot, the OS is probably not
> +		 * the cause, and there's nothing we can do to clear
> +		 * the condition. Best we can do is delay for a bit
> +		 * and hope it's transient. Lie to the caller if it
> +		 * seems like we're stuck in a retry loop.
> +		 */
> +		mdelay(1);
> +		ret = true;
> +		successive_ext_delays += 1;
> +		if (successive_ext_delays > 1000) {
> +			pr_err("too many extended delays, giving up\n");
> +			dump_stack();
> +			ret = false;

Shouldn't we zero successive_ext_delays here?

Otherwise a subsequent (possibly different) RTAS call will immediately
fail out here if it gets a single extended delay from RTAS, won't it?

> +		}
> +		break;
> +	case RTAS_BUSY:
> +		ret = true;
> +		successive_ext_delays = 0;
> +		break;
> +	default:
> +		ret = false;
> +		successive_ext_delays = 0;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
>  /**
>   * rtas_busy_delay() - helper for RTAS busy and extended delay statuses
>   *
> @@ -624,11 +664,17 @@ unsigned int rtas_busy_delay_time(int status)
>   * * false - @status is not @RTAS_BUSY nor an extended delay hint. The
>   *           caller is responsible for handling @status.
>   */
> -bool rtas_busy_delay(int status)
> +bool __ref rtas_busy_delay(int status)

Can you explain the __ref in the change log.

>  {
>  	unsigned int ms;
>  	bool ret;
>  
> +	/*
> +	 * Can't do timed sleeps before timekeeping is up.
> +	 */
> +	if (system_state < SYSTEM_SCHEDULING)
> +		return rtas_busy_delay_early(status);
> +
>  	switch (status) {
>  	case RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX:
>  		ret = true;
>

cheers
