Return-Path: <linuxppc-dev+bounces-15199-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2FCCF172A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 00:02:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dktHp1QpQz2yG3;
	Mon, 05 Jan 2026 10:02:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767567766;
	cv=none; b=CQRrPg866tmXkgI4jr0sZ20iKVcRdwN0Mijx9qC6HXeQl4nbhHz5NOrpEpko6RkIlO6UjguttpG2BOp9FZX3Z+aPadHo5Lx1vxyR1Ykjb7aH/7Bd9NuLH0Ur8BlYA4ENHZkunuDT72BjioDVfH/m2x6/lfwweo0mNKmrm64SgbRlr80BrRRMaqWXy+8NED2mE0AwNEbwISoVJRFagB7ovw2ei/OpyU2x1MNiigzA6vE7buiWMAvrWWCKqY/VOQTcttGQDPVid0XV+6DbhqvZ3gHdJyWsjyqY2mRS1Q7ZbmCVL9tUY20N1jmRE2+ef59zIgXoVWTwxn68yqQMo5Yxvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767567766; c=relaxed/relaxed;
	bh=qjmKR/eiCoAVpyGnbyfS9wTkl7aiV0GxbUH0ODK6l+U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AMeL+bx6vT0QiMnAvaUD2AgEW0JOmihPrzRWmHO8Ald0NQ4pmeDshzy5CxcUXLddWzduzS5ZTpNikJBubyZaqPvmf3r8IW6Skt5P5e+4Qz1xF0Y7M4tWSQ3s1hflerZ+44zEF8OIa6xx5et7r/uScoJqXOf/lEsGdb5sDi6aJgOROuhxPFQiJ8v8QhzoTgGx/5aUBUgTJMITIZ7EZHJ07kN2aCHntYAqXCeLwfRhqbEjjRVwW6V+8B9LvLdYUdlRkb2D5+Rf3h1ygxTMH4A011d0i4x6FBsik9jLDZdpoyv7Xn2/cW3/7ptSgw8d6d9EGa3RzJf1MtR4Sx/E31aMfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fKM6ahj6; dkim-atps=neutral; spf=pass (client-ip=209.85.221.54; helo=mail-wr1-f54.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fKM6ahj6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.54; helo=mail-wr1-f54.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dktHm2Y3Jz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 10:02:43 +1100 (AEDT)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-431048c4068so709853f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Jan 2026 15:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767567700; x=1768172500; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjmKR/eiCoAVpyGnbyfS9wTkl7aiV0GxbUH0ODK6l+U=;
        b=fKM6ahj6xQTZloeUw7sLjdiGlaVw8gJADeDGr6TwqI/1lYjaILG46lRkpgelxeQywl
         +c5AqXACOH/oPg2hjFkJu1K2p8H3TTJA1RiQjOVnrtpz8NqRU62/cs/1iUrWXzvYuO6l
         PdqrYpps5YqRXVK19SZbrnugQfKBA4LXm+uRI0jbGHYlIxhiXE7iV++8POKCMTeDm8/K
         YFyWdgc6VzAIvFnTKmovcTE9EYFaCdt+h/nOG+BBoLv8Ed/t3pjkrn3GSIaAQwmVFLKb
         GDteVQfTam49oMuw4tTh1C5Ax4REmpiqhuWNpHUkW5DYSJxwdx4Cxg9AlHouuDKObome
         wvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767567700; x=1768172500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qjmKR/eiCoAVpyGnbyfS9wTkl7aiV0GxbUH0ODK6l+U=;
        b=PoAeCiYwW5uK8N4wOdDG7GrKYJU10SfKSmwh9aEUlw7he+kyHbuY6MsEPmOGPEhjyD
         KjPpiB9A1mkguFgbKx/ux0ntckjC6cZe8cnRg2ibjvhPzgUWT638rYM2tzPMOJkovQFs
         ystcDWqaQwCrmjm+MiMkY64KFCgV8cxhnCfK0d45IN2k3bpsZICiYdWttG8AoYcAVwht
         DdzwcreDUQcTPOVLkJtc5TJgICRXy1NZ4BdpQpJ8R6IPMnLLLtgtY63u55qtVzySwtjW
         2FEOlyeb9m5mrJST9q9ukYICtTS+VmAH5oYXLcEw46eOXtIlp9V37GkCwe2A90rg1NZY
         Gthw==
X-Forwarded-Encrypted: i=1; AJvYcCWwvC48k21VH82skwEOmsficgV92msvZT49LHTHbXsc+A88s7ILOfR7du9kCimvYu9CPFQFVhTip5rjt1E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxeBzVExZj2L2FKAOxJ1E784bSLMzwpq1EUdSsJtCbD843PC1Ws
	/+nbe1mcTKTVno+q0mk7YL9o7SgqYyWkImkE++EWiS8gw1dbnBjLkb+/
X-Gm-Gg: AY/fxX4Z/xxvDVYwjqEjJQF2+fYORG0/i+Ce/gQasT4aG126MbLe/Pyl2LtVd5eA39o
	Ua/vAhWhM23+LAIZhYeCxhAc+KonTfKZHKCamosV0atBOHl2mcL5+jzpIyAiHCJCp66d+KsakGE
	X4x8GeNPnSNuFgB5cIg/ILXvp0UjXK3E3owE9BW73jC7Tf3Sj88VxPxxgRXxTymiOSn8YqCShH/
	D2pGNDW21MIWPyqz6Ub7TkJ9YH9CqLumamNhTaS7jcfuQg8aLOZPjvhcNUAY20SCXmAKvGGEJEd
	rYHkDK3d23zWXcxALjLubT+QND8wWp4ugAn0RASR0KuGdsMOaewFR1+ezazI6FH2lmL/tJHfuCM
	NUXeXBrMp/K3AhUU4c4AguN3+okoyRemBs5C5vx/gvd7Ea3zhv2ddcjz+ZXbm6YYoDcQxRqkpgP
	zbGpvoyajO6g9vP17mbuUiGm5B1NNKvIkJcsof5Hkbj4XPxFQmwQTG
X-Google-Smtp-Source: AGHT+IEPxlgtmoJsOcbnrDXHkchjsFc7moeHiVQTpzEoBA2t+H1hGAq+A791EuxHgrzC5U6Ox/NHuQ==
X-Received: by 2002:a05:6000:3111:b0:430:fe6c:b1aa with SMTP id ffacd0b85a97d-432aa434e77mr7977363f8f.26.1767567699992;
        Sun, 04 Jan 2026 15:01:39 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227e0sm99650545f8f.17.2026.01.04.15.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 15:01:38 -0800 (PST)
Date: Sun, 4 Jan 2026 23:01:36 +0000
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
Message-ID: <20260104230136.7aaf8886@pumpkin>
In-Reply-To: <20260102131156.3265118-4-ryan.roberts@arm.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-4-ryan.roberts@arm.com>
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

On Fri,  2 Jan 2026 13:11:54 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> Previously different architectures were using random sources of
> differing strength and cost to decide the random kstack offset. A number
> of architectures (loongarch, powerpc, s390, x86) were using their
> timestamp counter, at whatever the frequency happened to be. Other
> arches (arm64, riscv) were using entropy from the crng via
> get_random_u16().
> 
> There have been concerns that in some cases the timestamp counters may
> be too weak, because they can be easily guessed or influenced by user
> space. And get_random_u16() has been shown to be too costly for the
> level of protection kstack offset randomization provides.
> 
> So let's use a common, architecture-agnostic source of entropy; a
> per-cpu prng, seeded at boot-time from the crng. This has a few
> benefits:
> 
>   - We can remove choose_random_kstack_offset(); That was only there to
>     try to make the timestamp counter value a bit harder to influence
>     from user space.
> 
>   - The architecture code is simplified. All it has to do now is call
>     add_random_kstack_offset() in the syscall path.
> 
>   - The strength of the randomness can be reasoned about independently
>     of the architecture.
> 
>   - Arches previously using get_random_u16() now have much faster
>     syscall paths, see below results.
> 
> There have been some claims that a prng may be less strong than the
> timestamp counter if not regularly reseeded. But the prng has a period
> of about 2^113. So as long as the prng state remains secret, it should
> not be possible to guess. If the prng state can be accessed, we have
> bigger problems.

If you have 128 bits of output from consecutive outputs I think you
can trivially determine the full state using (almost) 'school boy' maths
that could be done on pencil and paper.
(Most of the work only has to be done once.)

The underlying problem is that the TAUSWORTHE() transformation is 'linear'
So that TAUSWORTHE(x ^ y) == TAUSWORTHE(x) ^ TAUSWORTHE(y).
(This is true of a LFSR/CRC and TOUSWORTH() is doing some subset of CRCs.)
This means that each output bit is the 'xor' of some of the input bits.
The four new 'state' values are just xor of the the bits of the old ones.
The final xor of the four states gives a 32bit value with each bit just
an xor of some of the 128 state bits.
Get four consecutive 32 bit values and you can solve the 128 simultaneous
equations (by trivial substitution) and get the initial state.
The solution gives you the 128 128bit constants for:
	u128 state = 0;
	u128 val = 'value returned from 4 calls';
	for (int i = 0; i < 128; i++)
		state |= parity(const128[i] ^ val) << i;
You done need all 32bits, just accumulate 128 bits.  
So if you can get the 5bit stack offset from 26 system calls you know the
value that will be used for all the subsequent calls.

Simply changing the final line to use + not ^ makes the output non-linear
and solving the equations a lot harder.

I might sit down tomorrow and see if I can actually code it...

	David

 

