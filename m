Return-Path: <linuxppc-dev+bounces-15544-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FBFD12DB3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 14:37:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqYMq72wDz2yRC;
	Tue, 13 Jan 2026 00:37:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768225047;
	cv=none; b=n0j898UTIAV1vA0TGsytQ2iv+nbGiz7VoY0rCiJsYv57m6lkd0OLS0IhCAlGGSx8KkOrIBvPMrqjBVvi5AKJjhYC/sWrQTQOfItUiAgZgYyLeSwO6qvGxp4+EgKn/9jnH+1FNTIMYVLNbOOzIgClIiyT8jtAr7dhVM/5319rqGJ2CboNWjeno5iZdgP4lVj/dsDgQCkktAC+5+wWZq0gPdltPPsZEMuL3qKCjJx+VIzSnDD1dYzVzMSQdcqldBRHL/4O35DPUFAeo0QIqF+foMqRXyzyud8+QL4eIUpOsS9Z1cAycGpmJq5iZRzfjyfCmDh0WbnG2xxjV7xa1/EhOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768225047; c=relaxed/relaxed;
	bh=bLo3Abz9wAwu25esY4s8FeJ9KMDvXVIZnqcKTN+SMTE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=olgPb4OiYR4BX9VkmeiQ11gfxb2118saW2EijAD6sttFdT1c/xJ8zS0B3L/iQPn17ADman11Y7ojs6ssludu2KHVXZMj4yMM2YBLv8nEPaNC9fmnau7OgBMysIXYltwXkpAw5vYgml7m+hO1GDd9DW9jd8BO2r5rxfUKCStvA7B8wE2MQ3Ld1J2NJnTW0Bry8n6Aghao0BbzubOl6C1dAU5kDQO3/pkujEYtwRMA7mw/qiHvbklN6w/mvikYy0aucVArFiqOeNfWNMObtYokem07VyA36w/OfUvmBfnSIs48rdiD3ziQ0/rRVXr/JzbbUVl0tIkcXTA+gphFHxyqOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mg/4RwW7; dkim-atps=neutral; spf=pass (client-ip=209.85.221.52; helo=mail-wr1-f52.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mg/4RwW7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.52; helo=mail-wr1-f52.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqYMp2nkbz2yQJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 00:37:25 +1100 (AEDT)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-430f57cd471so3127570f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 05:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768224982; x=1768829782; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLo3Abz9wAwu25esY4s8FeJ9KMDvXVIZnqcKTN+SMTE=;
        b=Mg/4RwW7bikqfDQyB3Lufpp7ZttnBi+2ZgYbDhQCeRKQQkJoXOBdW/WiXMd1HTEyP1
         wWmdBY7s3nDv8T6pRjyYQ/4a+XUouQGhKwbYisn0cCLiuoJ0TB1Yym1oqXW42Af9Pglr
         iyLBUkFk26kGTpI7fa2ih6YbADZKlfaDCcCcbnKg4LRMkQIZJS9Ps+OJ0X5zvFsb/wsB
         73JaEQQk6qnb2/WyMBHSh/PixGUI2f2wXJFFWfcEmmqJHuYVYkkoZU+HnvAstx3WlOIG
         qgiRtKzN/LR2zco9LUVQBV1jVLdnRAjRVbeCA/jd/VGyJdN1e0zJkoUN8mCwc9WuZlmy
         wD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768224982; x=1768829782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bLo3Abz9wAwu25esY4s8FeJ9KMDvXVIZnqcKTN+SMTE=;
        b=mGEX2agxnBjNsk7EW2s0S6Ze98aYue/xJ99ZaFR08XG/KeUkjtycl38WVWYU7ZWfgW
         kZUQHlL64LcmHzYLh+Wdb57D8YsKwPHYXxWNscIfHraRs028P8Q7sXFVpCAA6A0bt4mh
         nnlrTekiKjZu/vZGpcrmE55o8KJ9iocHb5LNUmrHFhXEcat4lVYlH3J8/zF2ifnajbWG
         owWi76d5BaaUy6paWUs8OmOlI2AtTdOZk63/siReGHuQiqJg1Q6llhj1Rdpe5BGAyGqm
         dg60NB1zBh+q6m4FWm8Mpqi18x22wMXWY9hBltJBWg5H3g6ENlXqPLxUcJMAW9Uwgi25
         8xag==
X-Forwarded-Encrypted: i=1; AJvYcCVdZthm8IJ/vEu5dH6vUICQsJSoHIvvEivZydlgB8iuE0s3FKOqtQ/zxxmijQqdT9eugh1lup63nU0W0Fg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx2Xs4WrLkN8OlOSm/MGJr6uWJ6/8s44bBYJOOsf0WxQfWd1i5L
	OBi/3TM1b5FR/0VgtQd2l01SV5/hT+Ql5J17D4vizaGzQbgM0V3pIuox
X-Gm-Gg: AY/fxX7z2LSJzCpCoH8YXkYAw/j0FgcyNK4njiSZD2+bHf4yCWeRhNSUSi8WyRG+/1F
	2lQhCHccv/LO3jIgwXE4k9Vwh4gr877ghHoqhzUZB6J6CRiVFpkwhaQ0JJXEDjFXYzzlVclu2Rz
	vv6KGayUMoRgLwFSFSbJkNKW4dszWlAoNNi54eM230bdiHvdvjEzOgP3AzRk66tHn39u8Cw9SBT
	In1HkbIMPfiQca7YJal/2mJ/qTT82U8DDsdDP8tMProLGAD45N458J2EPiwwsYpHFr4pnLIAJ9i
	+vV04BZ5hCfULBzWYWdrQVccntIn6G89Z+6Cvm0nWBeiGj6GKYMJkSgSgsBpPZBknWhNDvfuw5A
	hV13aNUchAjzWK52P45xBKxLk/aZg5jDrfRmnnOJI5A3pgjrbSFFEdw0JSl/H7sg6povJFGoLQh
	hDQ0JmCqLlqY/otmjVUKzGAIYABxSgkWweovn1ii4P+qDpKM0L2etv
X-Google-Smtp-Source: AGHT+IGyxiv2XFt49Pj+G/FCKb6Do+/qO1fvIxMUjWKWGTcpTcAtASoZtqcJMaJZUWyMrmC4TwCROg==
X-Received: by 2002:a05:6000:40c9:b0:430:fafd:f1d2 with SMTP id ffacd0b85a97d-432c3628374mr22009793f8f.11.1768224982426;
        Mon, 12 Jan 2026 05:36:22 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9afsm41054434f8f.24.2026.01.12.05.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 05:36:22 -0800 (PST)
Date: Mon, 12 Jan 2026 13:36:20 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy
 Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <20260112133620.2863e1d6@pumpkin>
In-Reply-To: <09de87bc-d952-41e7-9657-852c2924aaa7@arm.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-4-ryan.roberts@arm.com>
	<20260104230136.7aaf8886@pumpkin>
	<20260107140533.2b3c46a1@pumpkin>
	<09de87bc-d952-41e7-9657-852c2924aaa7@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 12 Jan 2026 12:26:26 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> On 07/01/2026 14:05, David Laight wrote:
> > On Sun, 4 Jan 2026 23:01:36 +0000
> > David Laight <david.laight.linux@gmail.com> wrote:
...
> > I've trimmed the initialiser - it is very boring.
> > The code to create the initialiser is actually slightly smaller than it is.
> > Doable by hand provided you can do 128bit shift and xor without making
> > any mistakes.
> > 
> > I've just done a quick search through the kernel sources and haven't found
> > many uses of prandom_u32_state() outside of test code.
> > There is sched_rng() which uses a per-cpu rng to throw a 1024 sized die.
> > bpf also has a per-cpu one for 'unprivileged user space'.
> > net/sched/sch_netem.c seems to use one - mostly for packet loss generation.
> > 
> > Since the randomize_kstack code is now using a per-task rng (initialised
> > by clone?) that could be used instead of all the others provided they
> > are run when 'current' is valid.
> > 
> > But the existing prandom_u32_state() needs a big health warning that
> > four outputs leak the entire state.
> > That is fixable by changing the last line to:
> >         return state->s1 + state->s2 + state->s3 + state->s4;
> > That only affects the output value, the period is unchanged.  
> 
> Hi David,
> 
> This all seems interesting, but I'm not clear that it is a blocker for this
> series. As I keep saying, we only use 6 bits for offset randmization so it is
> trival to brute force, regardless of how easy it is to recover the prng state.
> 
> Perhaps we can decouple these 2 things and make them independent:
> 
>  - this series, which is motivated by speeding up syscalls on arm64; given 6
>    bits is not hard to brute force, spending a lot of cycles calculating those
>    bits is unjustified.
> 
>  - Your observation that that the current prng could be improved to make
>    recoving it's state harder.
> 
> What do you think?

They are separate.
I should have a 'mostly written' patch series for prandom_u32_state().

If you unconditionally add a per-task prng there are a few places that could
use it instead of a per-cpu one.
It could be 'perturbed' during task switch - eg by:
	s->s1 = (s->s1 ^ something) | 2;
(The 2 stops the new value being 0 or 1, losing 1 bit wont be significant.)

This one is much nearer 'ready' and has an obvious impact.

	David

> 
> Thanks,
> Ryan
> 
> 
> > 
> > 	David
> > 
> >   
> 


