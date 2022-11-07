Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD8661F23E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 12:56:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5V7Q5sjkz3dty
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 22:56:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fT5DMmJk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fT5DMmJk;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5V6T6Qggz2yZf
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 22:55:27 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id l6so10367090pjj.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Nov 2022 03:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afWeJt0HDznlds/jZYjMUEN0vdEomf1RrI4iXElukdY=;
        b=fT5DMmJkYpJBVKWicZNZ6/0KVPE5VWnEwD0sTFcwMAPGrJYEEwd3jIGtawJaijGU8V
         6QV1kv6gNZE/RkZgO9ZOoc+P5olktEODjK4jR9QWbfGotfjEXeW3Y1AAW+RBhYyZjRTA
         wJ+UtXhWAGlgIFDDwEbuJRrr4i5GbrSzxtqY1VKqzD1/CApLxa4/S4TyRBjrha0mYfX4
         TL4k1/a3lVPc7b9gn2m0thmFcCNAc14sopRCBq4OBLzlSbyKiQRfYBX5z6+ybn64dWal
         /rRk8+oXfoGtijgIR5kke9xqwBVTHfzWnna84gz2UZOdL/4GSDWPk4zEEyzVn6g5ARFP
         00Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=afWeJt0HDznlds/jZYjMUEN0vdEomf1RrI4iXElukdY=;
        b=XVTl/r3wrdJg8N1diMjddUbR22BICMM3kBsFgirdOHfMLAfJ5yaG+01XZg1fKYYZ+g
         J791HDi8GhIG7X0N8x4KWWFBYkbxc2CgXUwZohtfPVvbJsL77NSHON/AO0zFGYayIwVq
         vhkXG4GfVWK2ldqxNxd4W/jGi8RWz4SANcYijVFIsiSYIoiRaEnS9y7YbjUOJyPCC9rU
         Seb0DJBMKMfRmfYP4TiuXYQbCWzEcghx9NanG4O6ziCaBEKzGIbvLEvrqHFktlBOVV8P
         szkGgKjrCh3D1hipBKyt0994malI/K5HEpzWj6tFBN/ADuqUPWzDXFsrnffKPHa0rEP2
         +w8Q==
X-Gm-Message-State: ACrzQf2wnwgQtZxBCARa1G2ZN1ecQ5EwAhGum5AAZcNHyvAiEI8u3sts
	4wQq5nyn6l13/Wfx64Y1W3JgXuQvNYQ=
X-Google-Smtp-Source: AMsMyM4Y2OeljrZf5dd0GUqHWIkDIoc2StuB59vaILD1TWXeQGX2laSY5lvaq+CWXjhYtAiePc+13w==
X-Received: by 2002:a17:90b:1d4d:b0:213:98e7:3b3 with SMTP id ok13-20020a17090b1d4d00b0021398e703b3mr50425650pjb.197.1667822124823;
        Mon, 07 Nov 2022 03:55:24 -0800 (PST)
Received: from localhost (203-221-202-134.tpgi.com.au. [203.221.202.134])
        by smtp.gmail.com with ESMTPSA id e3-20020aa798c3000000b0056b9d9e2521sm4479066pfm.177.2022.11.07.03.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 03:55:24 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Nov 2022 21:55:20 +1000
Message-Id: <CO61LKT08CEN.1Z82PR57MIPHD@bobo>
Subject: Re: [PATCH] powerpc: Interrupt handler stack randomisation
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20221025033807.1413688-1-rmclure@linux.ibm.com>
In-Reply-To: <20221025033807.1413688-1-rmclure@linux.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Oct 25, 2022 at 1:38 PM AEST, Rohan McLure wrote:
> Stack frames used by syscall handlers support random offsets as of
> commit f4a0318f278d (powerpc: add support for syscall stack randomization=
).
> Implement the same for general interrupt handlers, by applying the
> random stack offset and then updating this offset from within the
> DEFINE_INTERRUPT_HANDLER macros.
>
> Applying this offset perturbs the layout of interrupt handler stack
> frames, rendering to the kernel stack more difficult to control by means
> of user invoked interrupts.

Can you randomise the irq/softirq stacks as well with a patch 2?

_Probably_ don't have to do another mftb for those AFAICS. Hard irq
should be driven by one of these handlers (including in the irq replay
case). Softirq fast path is driven from irq_exit() from the async
irq handlers, so that should be pretty well randomized. Softirq
slowpath is done by ksoftirqd using its own stack, so nothing to
be done there.

>
> Link: https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-May/243238.htm=
l
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/interrupt.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/=
asm/interrupt.h
> index 4745bb9998bd..b7f7beff4e13 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -68,6 +68,7 @@
> =20
>  #include <linux/context_tracking.h>
>  #include <linux/hardirq.h>
> +#include <linux/randomize_kstack.h>
>  #include <asm/cputime.h>
>  #include <asm/firmware.h>
>  #include <asm/ftrace.h>
> @@ -448,9 +449,12 @@ interrupt_handler long func(struct pt_regs *regs)			=
\
>  	long ret;							\
>  									\
>  	__hard_RI_enable();						\
> +	add_random_kstack_offset();					\
>  									\
>  	ret =3D ____##func (regs);					\
>  									\
> +	choose_random_kstack_offset(mftb());				\
> +									\
>  	return ret;							\
>  }									\
>  NOKPROBE_SYMBOL(func);							\
> @@ -480,9 +484,11 @@ static __always_inline void ____##func(struct pt_reg=
s *regs);		\
>  interrupt_handler void func(struct pt_regs *regs)			\
>  {									\
>  	interrupt_enter_prepare(regs);					\
> +	add_random_kstack_offset();					\
>  									\
>  	____##func (regs);						\
>  									\
> +	choose_random_kstack_offset(mftb());				\
>  	interrupt_exit_prepare(regs);					\
>  }									\
>  NOKPROBE_SYMBOL(func);							\

Hmm. It uses per-cpu data, so it actually can't be used for all
interrupt types, HMI and MCE because they're real-mode. SLB because
that might take an SLB fault, and maybe not hash faults either because
they might fault again I think?

You'd have to change the core code to let us put the offset in the paca.
Not sure if 32-bit has any such restrictions (e.g., does 32s need
MSR[RI] enabled before accessing per-cpu data?)

If you can do that that then I'd also put it as the first thing in
the func(), because the enter_prepare code can call non-trivial code
(e.g., irq_enter / nmi_enter).

Thnaks,
Nick

