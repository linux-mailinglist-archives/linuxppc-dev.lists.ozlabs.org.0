Return-Path: <linuxppc-dev+bounces-14368-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 547ECC708C0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 18:57:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBThT18l5z3dKS;
	Thu, 20 Nov 2025 04:57:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763575033;
	cv=none; b=nEw1xuwJQn6HQ4yGlHwcvsJlF9GmFxjQXQYJbqh7s18PZrMvokLXSkFIe1MYyCoU92JhuP/jXQnju9Gl49pLgZTX5a0d5LD8Qga0zgklQwJsEnFCLjlUlem97o1BUrADf0tCYyX0dSIgSa61mvau4dZbiOkY8bCtnkDCM2I/b/RPVii6ez2HEqra0X5mRP8xh44BxYAfHbtBp/yG//fd21NUodw+pIl4XbontKM/rvcjcsDvWwYGu3xsh+9S6rxDj/nPtGu465Ru/c30b/E9AKlgziIssl3AFnXkp/+o15dVCUcifNPNW93oFz3StLmADmwa1k+uDQ35CUkGGON54A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763575033; c=relaxed/relaxed;
	bh=SCqIKcsbVAvX/DFeGFKc7d0lwiR7NZ7qoM25+GzyYZs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U9dUOwGXb8ApCkE8pbG+ubnPBwe9CuAu4LgA4oilSZCDPc6t0ntVDtUZWJNHcpv8H41nBJcDw+otVDf6m9yGYL9sbWxMFr7IjsC19RWJE9edTtXrfZ5OH1zyL3BQEbFxKXcPRW1pu9iTUlwS9VAbc2x/oFHeTp4TY7QWd+e4AU9nQ+UdjEXzv3Lj/qfE356GRRWGOWNTk9Z+tjoxHW0XwyxKMPwNQeXuNR0F8UkAbOshNUbY87sqm2HU69oAFbdfTVMbTKVNeqg/TndHEAnW5vmFEhiEVUZjQfigOz/dFcsyiyNwRPfLjaJ1A7K5mXYRa9BPwlP5Xd0Wlq7vCKZF4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Pxx1wpLO; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rx6GdwtQ; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Pxx1wpLO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rx6GdwtQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBThS1R9Wz3dJq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Nov 2025 04:57:12 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763575022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SCqIKcsbVAvX/DFeGFKc7d0lwiR7NZ7qoM25+GzyYZs=;
	b=Pxx1wpLOV5LMlqWqdMIfJvcaWjqnBW5V/74A0ru3o4aV+hIouMaUq2yIK5FzA5NgQxhHNn
	Nesug9FDXlWLNKTW6Cle8jZ77YR1MBdKIqKU4QLPsbRvv5ztUCPH6Q3wt8FeCJKzzWy/iy
	dWZBbhcyqR5VaBfvS/dEakGAEsx83gPRE/81pW4q8hLaGXjI9mbWlJfjX8glS+fMMxKAgY
	UYhlho+0K9sN+rdvqnJmE2Ww8WYFFvJ+JTCZhvD/XS1gG5cU/U0St2VWTYS7eo/Qetr7dD
	7bBAKqr+uT2oJ9SRHaQMXkgdXg2qZUvarU/YmD2MHRaHvwgXu+kCnNaVCVPxvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763575022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SCqIKcsbVAvX/DFeGFKc7d0lwiR7NZ7qoM25+GzyYZs=;
	b=rx6GdwtQ9y8S8dro1uf28mrjBLvbD8eY1auP4KI13Q3iMThqOuYNtsKyV2Rn83kj/XcqHr
	xSqL1HDqr38FrFDw==
To: Shrikanth Hegde <sshegde@linux.ibm.com>, Mukesh Kumar Chaurasiya
 <mkchauras@linux.ibm.com>, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com
Cc: christophe.leroy@csgroup.eu, oleg@redhat.com, kees@kernel.org,
 luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
 thuth@redhat.com, akpm@linux-foundation.org, macro@orcam.me.uk,
 ldv@strace.io, deller@gmx.de, charlie@rivosinc.com, bigeasy@linutronix.de,
 segher@kernel.crashing.org, thomas.weissschuh@linutronix.de,
 menglong8.dong@gmail.com, ankur.a.arora@oracle.com, peterz@infradead.org,
 namcao@linutronix.de, kan.liang@linux.intel.com, mingo@kernel.org,
 atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com, coltonlewis@google.com,
 rppt@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] Generic IRQ entry/exit support for powerpc
In-Reply-To: <5a2678a6-66e5-4c15-b95a-ce9f977f79e5@linux.ibm.com>
References: <20251102115358.1744304-1-mkchauras@linux.ibm.com>
 <5a2678a6-66e5-4c15-b95a-ce9f977f79e5@linux.ibm.com>
Date: Wed, 19 Nov 2025 18:57:01 +0100
Message-ID: <87ms4hlxci.ffs@tglx>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 07 2025 at 21:53, Shrikanth Hegde wrote:
> On 11/2/25 5:23 PM, Mukesh Kumar Chaurasiya wrote:
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index ce59431f977c..c7cf9a3f1202 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -118,16 +118,18 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>                  regs->exit_flags |= _TIF_RESTOREALL;
>          }
>   
> -again:
> +       local_irq_disable();
> +
> +       user_exit_irqoff();
>          syscall_exit_to_user_mode(regs);
>   
> -       user_enter_irqoff();
> -       if (!prep_irq_for_enabled_exit(true)) {
> -               user_exit_irqoff();
> -               local_irq_enable();
> -               local_irq_disable();
> -               goto again;
> -       }
> +again:
> +       if (!prep_irq_for_enabled_exit(true)) {
> +               local_irq_enable();
> +               local_irq_disable();
> +               goto again;
> +       }
> +

This does not look right at all.

          syscall_exit_to_user_mode(regs)
                syscall_exit_to_user_mode_work()
                exit_to_user_mode()
                   user_exit_irqoff()

What you really want to do here is:

 again:
	syscall_exit_to_user_mode_work(regs);
 
	exit_to_user_mode(regs);
 	if (!prep_irq_for_enabled_exit(true)) {
        	// Re-establishes the full state required
                // to restart
		enter_from_user_mode(regs);
 		local_irq_enable();
 		local_irq_disable();
 		goto again;

That should cure it. Same issue in the other places.

Thanks,

        tglx

