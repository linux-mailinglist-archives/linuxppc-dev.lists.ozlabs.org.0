Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E69682B6B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 12:30:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5jX34r3Cz3cfD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 22:30:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QXlW1sT9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5jW75wwDz3c9L
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 22:29:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QXlW1sT9;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P5jW74CV6z4xGq;
	Tue, 31 Jan 2023 22:29:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1675164563;
	bh=NnQ/+7z5SMl6uK9Zj36jZeianm1WKv/tY3HfF7fjKHk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QXlW1sT9DHdYmuo1fUNcHXvrhRD/7Q7jxWNBKHuPwu/npf7VY6X7BowtvEqkNThlu
	 JqtG054GXXucP/eLzz1T166FPAf1VrAGr+JaGdWw86bVcNJGMmhpd77K32uGmso7Qe
	 z/5kNddc1jjsTIkZwpJqvgPUS8B6ybOOcnZeQHy0f9tBXPUGaR+Nd71SCwGmFzqkD6
	 dqtq2NEac55ASA94T7YDV9cQ2GjRo058t/Lz2gLVPwRIBpyuRqBxQuKKvVWN34MVxp
	 EiXLTiY9PVfPziNFXoVWwtWLR4jJjy0RjiLPylHThX/eJCu+1zuYQUNBB5TkmSQBEX
	 1Ja6qv5Farjiw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/mce: log the error for all unrecoverable errors
In-Reply-To: <20230127182943.73073-1-ganeshgr@linux.ibm.com>
References: <20230127182943.73073-1-ganeshgr@linux.ibm.com>
Date: Tue, 31 Jan 2023 22:29:23 +1100
Message-ID: <87bkmfeycs.fsf@mpe.ellerman.id.au>
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
> For all unrecoverable errors we are missing to log the
> error, Since machine_check_log_err() is not getting called
> for unrecoverable errors.
>
> Raise irq work in save_mce_event() for unrecoverable errors,
> So that we log the error from MCE event handling block in
> timer handler.

But the patch also removes the irq work raise from machine_check_ue_event().

That's currently done unconditionally, regardless of the disposition. So
doesn't this change also drop logging of recoverable UEs?

Maybe that's OK, but the change log should explain it.

> Log without this change
>
>  MCE: CPU27: machine check (Severe)  Real address Load/Store (foreign/control memory) [Not recovered]
>  MCE: CPU27: PID: 10580 Comm: inject-ra-err NIP: [0000000010000df4]
>  MCE: CPU27: Initiator CPU
>  MCE: CPU27: Unknown
>
> Log with this change
>
>  MCE: CPU24: machine check (Severe)  Real address Load/Store (foreign/control memory) [Not recovered]
>  MCE: CPU24: PID: 1589811 Comm: inject-ra-err NIP: [0000000010000e48]
>  MCE: CPU24: Initiator CPU
>  MCE: CPU24: Unknown
>  RTAS: event: 5, Type: Platform Error (224), Severity: 3
>
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> ---
> V2: Rephrasing the commit message.
> ---
>  arch/powerpc/kernel/mce.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
> index 6c5d30fba766..a1cb2172eb7b 100644
> --- a/arch/powerpc/kernel/mce.c
> +++ b/arch/powerpc/kernel/mce.c
> @@ -131,6 +131,13 @@ void save_mce_event(struct pt_regs *regs, long handled,
>  	if (mce->error_type == MCE_ERROR_TYPE_UE)
>  		mce->u.ue_error.ignore_event = mce_err->ignore_event;
>  
> +	/*
> +	 * Raise irq work, So that we don't miss to log the error for
> +	 * unrecoverable errors.
> +	 */
> +	if (mce->disposition == MCE_DISPOSITION_NOT_RECOVERED)
> +		mce_irq_work_queue();
> +
>  	if (!addr)
>  		return;
>  
> @@ -235,7 +242,6 @@ static void machine_check_ue_event(struct machine_check_event *evt)
>  	       evt, sizeof(*evt));
>  
>  	/* Queue work to process this event later. */

This comment is meaningless without the function call it's commenting
about, ie. the comment should be removed too.

> -	mce_irq_work_queue();
>  }
>  

cheers
