Return-Path: <linuxppc-dev+bounces-2291-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B846C99F19E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 17:42:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSdf42mtgz3bkL;
	Wed, 16 Oct 2024 02:42:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729006972;
	cv=none; b=fyaTicJe9Ro6ccNqldsXWhnAPVC8V+C/bV7FyFFr2P1c5uwLfoAsrnNmVaNhY7W6Re7K+wiYZcmJmS4OjtxlhVQ8n9GYOpxh3ysU1Jd5RS78LW250FaUynJ7UiBGo/xEybdn3shQQT9Q8JmA+6eX2omJp4JdxZqxDGqVqRe7a0MzIrFLpw0FIabymVxuV6AQBed3UTrdGuw2qQJNE7ShKuXfmTxo0eivRfx8d8eJjzgNAD1qS1WN0cwQbcjlcZCZiKUVaf7J+8gKsFjgyQYehptaQwkHhQVerPfeH0r7UVnQ19+/u4/H9FSmni8FQ5bBiW6iUi/pCZWSlnNkrnqckA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729006972; c=relaxed/relaxed;
	bh=5H/4jrpzEyuEt3kkgW2rzE95+U5CN+zHY8J92IEceQs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RnVt/ygcwvoI/kLxflE/kdNszFiNOdH6x+wdTJesx48ur7j3dH73uR1kL3FYjhsIzAz31PC76Iv1vsYtHvUSZpPcTLaNIwQTpqiJZ29/f2srG5I/NZwbQoZjcArTEWDQxxTAhUFwgE58CuhBDchmhRz0bnNXp6HUhOkx+PczM/Tty5AwJmCo5WwvhKZrMy4x607lS4YjrBA/v/dAh0TdTV88+ysNjwES7k7zqn7VJGaTeAP/0eQ4OJpl1R4KypfN7VvzXST+omE83fd5yi/QS2bbWJ6SPm3TqQTbF7DpR5vI9+Yu7rR7fIk3kKobOcYg+xUWr7TOmuekSpIDjcN7yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GiXQec4K; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jFaXijGn; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GiXQec4K;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jFaXijGn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSdf26jYgz3bdV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 02:42:50 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1729006965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5H/4jrpzEyuEt3kkgW2rzE95+U5CN+zHY8J92IEceQs=;
	b=GiXQec4KIUemYmVODSScu73AVombrDmG8VUbAJKZShgmdIAdcfs2J+YVBKJKYi3RZcc+bC
	qHkUKgdfbIxUBbXweF6uq8x83c2lLLOesPzggE0g5GDfw9UoJF2QfNzPSqo/4fO+i9wPhw
	Ts3KTs88ILz55bFF+T/uXspaK++r2xVEEdPnwiVKWwZzT+PrkK2N2o4WPiS+o5+U3fQNW6
	bzy2MveXPXQ7EgKejHvPAQUIem/p9bMRaCX8SAQoB0gZ3qKt+NsQqtuHFx2R5rYoUpBTiT
	1yPHZQx7q61zLq8Jq130AQq6Tf6yALBVtegj7ah1ElyUf0MkI2USS926DT4HiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1729006965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5H/4jrpzEyuEt3kkgW2rzE95+U5CN+zHY8J92IEceQs=;
	b=jFaXijGnUW7agtJYmEaw7GIwMRCW0DOWvFkos7ahgGegcTj32/ZgxAMlBgYwFQBmcqrGzr
	q05ZtNoF7tAtDBBg==
To: Luming Yu <luming.yu@shingroup.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, jialong.yang@shingroup.cn,
 luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: Re: [PATCH 6/7] powerpc/entry: factout irqentry-state
In-Reply-To: <E6FB8D32FAAFC3BE+20241012035621.1245-8-luming.yu@shingroup.cn>
References: <20241012035621.1245-3-luming.yu@shingroup.cn>
 <E6FB8D32FAAFC3BE+20241012035621.1245-8-luming.yu@shingroup.cn>
Date: Tue, 15 Oct 2024 17:42:45 +0200
Message-ID: <87ed4he5je.ffs@tglx>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Oct 12 2024 at 11:56, Luming Yu wrote:

> To have lowlevel paca.h include high level entry-common.h cause
> include file dependency mess. Split irqentry-state.h to have
> the irqentry_state.h can be included in low level paca.h

What's the rationale for this?

> Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
> ---
>  arch/powerpc/include/asm/paca.h |  2 ++
>  arch/powerpc/kernel/interrupt.c |  2 ++
>  include/linux/entry-common.h    | 24 ------------------------
>  include/linux/irqentry-state.h  | 28 ++++++++++++++++++++++++++++

This is not how it works. Split the include file in a first step and
then make changes to the PPC side.

> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
> index d95ab85f96ba..6521171469f2 100644
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -352,30 +352,6 @@ void irqentry_enter_from_user_mode(struct pt_regs *regs);
>   */
>  void irqentry_exit_to_user_mode(struct pt_regs *regs);
>  
> -#ifndef irqentry_state
> -/**
> - * struct irqentry_state - Opaque object for exception state storage
> - * @exit_rcu: Used exclusively in the irqentry_*() calls; signals whether the
> - *            exit path has to invoke ct_irq_exit().
> - * @lockdep: Used exclusively in the irqentry_nmi_*() calls; ensures that
> - *           lockdep state is restored correctly on exit from nmi.
> - *
> - * This opaque object is filled in by the irqentry_*_enter() functions and
> - * must be passed back into the corresponding irqentry_*_exit() functions
> - * when the exception is complete.
> - *
> - * Callers of irqentry_*_[enter|exit]() must consider this structure opaque
> - * and all members private.  Descriptions of the members are provided to aid in
> - * the maintenance of the irqentry_*() functions.
> - */
> -typedef struct irqentry_state {
> -	union {
> -		bool	exit_rcu;
> -		bool	lockdep;
> -	};
> -} irqentry_state_t;
> -#endif
> -
>  /**
>   * irqentry_enter - Handle state tracking on ordinary interrupt entries
>   * @regs:	Pointer to pt_regs of interrupted context
> diff --git a/include/linux/irqentry-state.h b/include/linux/irqentry-state.h
> new file mode 100644
> index 000000000000..d4ddeb1c6ab6
> --- /dev/null
> +++ b/include/linux/irqentry-state.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __LINUX_IRQENTRYCOMMON_H
> +#define __LINUX_IRQENTRYCOMMON_H

The guards reflect the header file name and are not randomly chosen strings.

But aside of that. How is any of this supposed to compile?

You move the typedef into a separate header and then nothing (except
powerpc) includes it. Oh well.

Thanks,

        tglx

