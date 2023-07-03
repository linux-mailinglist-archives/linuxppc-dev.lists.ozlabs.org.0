Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1342774558F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 08:42:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=orPFhELO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvbvf6w48z3btj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 16:42:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=orPFhELO;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qvbtn1rrGz30f9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 16:41:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1688366505;
	bh=SN/rqNOkg+BIF6QEZthBWLDM9wkNG/KuvshHNv3WAaU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=orPFhELO3x8zhKRBvFINPr9F22tOnD/GhNoegEV88m1K6gEhq++oIuYIWchaBYwLE
	 WlJV8fZ8rjUF/79SjbaS1A5B+IdxU8KGoM8POcfmbBWwTjEhVWNL0NUCcR2GKjmgmr
	 mQvcvy7CQEk4cJllSjWqMSsjQLt5tPshjs7kP4vyvs9NTDrxaAGmIIwh/LDiI/6nPs
	 sb+CJzgj+jjQNmT71spEfLqrIilpqBoUF6Isc3/ujiB3RXg4oa/qPeOSwwi6CYa/5D
	 1VZDebBZZbGruRDJhAAEllFwQ+scA7gqasszGYYE+4Qo5dzYTleeTuuBxeFe1uU3pF
	 kd0UIeWQgBslg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Qvbtc66BSz4wqX;
	Mon,  3 Jul 2023 16:41:44 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gautam Menghani <gautam@linux.ibm.com>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu
Subject: Re: [PATCH] arch/powerpc: Remove unnecessary endian conversion code
 in XICS
In-Reply-To: <20230630055628.17790-1-gautam@linux.ibm.com>
References: <20230630055628.17790-1-gautam@linux.ibm.com>
Date: Mon, 03 Jul 2023 16:41:41 +1000
Message-ID: <878rbxwl7e.fsf@mail.lhotse>
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
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gautam Menghani <gautam@linux.ibm.com> writes:
> Remove an unnecessary piece of code that does an endianness conversion but
> does not use the result. The following warning was reported by Clang's
> static analyzer:
>
> arch/powerpc/sysdev/xics/ics-opal.c:114:2: warning: Value stored to
> 'server' is never read [deadcode.DeadStores]
>         server = be16_to_cpu(oserver);
>
> As the result of endianness conversion is never used, delete the line
> and fix the warning.
>
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
>  arch/powerpc/sysdev/xics/ics-opal.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/powerpc/sysdev/xics/ics-opal.c b/arch/powerpc/sysdev/xics/ics-opal.c
> index 6cfbb4fac7fb..5fe73dabab79 100644
> --- a/arch/powerpc/sysdev/xics/ics-opal.c
> +++ b/arch/powerpc/sysdev/xics/ics-opal.c
> @@ -111,7 +111,6 @@ static int ics_opal_set_affinity(struct irq_data *d,
>  		       __func__, d->irq, hw_irq, rc);
>  		return -1;
>  	}
> -	server = be16_to_cpu(oserver);
>  
>  	wanted_server = xics_get_irq_server(d->irq, cpumask, 1);
>  	if (wanted_server < 0) {

My first question with a patch like this is always going to be "how did
the code end up like this?"

Has the code changed and this assignment became unused? If so the commit
that did that should be identified.

If the code has always been like this that's also useful to know. Or
something else happened for it to end up this way :)

The second question will be "is there actually a bug here?". ie. should
server actually be used, and the bug is not that it's a dead assignment
but rather that server is not where it should be.

cheers
