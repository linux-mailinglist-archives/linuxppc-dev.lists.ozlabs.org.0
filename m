Return-Path: <linuxppc-dev+bounces-15384-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30496CFE277
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 15:06:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmVFv0XCrz2yFh;
	Thu, 08 Jan 2026 01:06:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767794802;
	cv=none; b=LuPfaD9Nqodx7z7TV51mUmQdSS39TYFP9BO7r8Ri1osNYRy5piiEjbomAeHIfeDqgZG+VrfH9TX+bJYmInRQ1TDGATxDK/0ii02jhs801D9gXRQlHpbnrjhHPa03yZ4OutdfnG2GwmHvGC6IviVYU2MA+uQKxm4/zWsuzSteJbrTeH7JYTjB3AJ3enX2vekU8ZKWxhoBBvHC5PQTRJCxxrdyUmmqXlQunCsbjK4GPIU0M8SSvc1JSn+VQ66WSmQmLHMLbhDNu7Gps3vMrLjnoJx329VNmDkn1H1yI+UXhgW/B+VcWJfvhTPAZbSstclyE6SPtewFhjPu8h05YnpNXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767794802; c=relaxed/relaxed;
	bh=nTerFL81XHMixYnvh7u2MldwUCD+ZWdDPLrHKRPjXbw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PD2Vjdj60Dtk0J+XpSLHhB5ZGxQmQcAqnfKXh7/QUDIGH47Akk0WQh6rMy/XoewTAp9nibtE3etpu5ZkkwOd04aG7WoInJkZZ6xuxlY4z2YYGX+m9hi31ARgKTY0JoLHdZUgpQ6cVllA5/JKALpakw2eQw2cEzvkRgPt7csFXxmM5xAObUmp0bPLaCS2VGf+C9yzBkNWOXNMTTJE2LmkG4bAjhfQ9+X3PfQCIb8ssJl69077rbMnqql6GIwSpUfsAPQR7ogscdosbOP2/wie0Xa3cGBrOrHVFcKK/B4hoIETTgBh/6sifhGrCzPnaUnQ/Prb/r7iLdk13JrDWN/6Ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lHJmZ/fv; dkim-atps=neutral; spf=pass (client-ip=209.85.128.43; helo=mail-wm1-f43.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lHJmZ/fv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.43; helo=mail-wm1-f43.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmVFs0zTfz2xZK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 01:06:39 +1100 (AEDT)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47d493a9b96so12922445e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 06:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767794737; x=1768399537; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTerFL81XHMixYnvh7u2MldwUCD+ZWdDPLrHKRPjXbw=;
        b=lHJmZ/fvrFwuMRQv6NvA9pUiB0NsPefm4+DEI15PjCze/Ez3LCzdEGACw4RlMgmtbV
         Lf/nRqSvkl39drCafXhxK0Kix8FMfJU7mK352x6c7m2VJCO0u3cIcB4rIiGlR54bWTny
         atwcW3JoORrkF2vJ83/OjkEMlk4GFcjb9r+G8YNZXNpGN7HURJQPRbC0fH9xVSx4XyLc
         ynwu6XVe3uON14lFuNwVFjc/+ci1fyjJbmmgokpSMQ48CD1F1Opf9GpTY96OUAJZAbkW
         RHQ5GiQoh9vCfjhJshGmEZWvbDjb7aCFWpheOqr0ZAEXH9bWZcNl6ccoTY1XhmHGDXLi
         5SZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767794737; x=1768399537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nTerFL81XHMixYnvh7u2MldwUCD+ZWdDPLrHKRPjXbw=;
        b=i63jQUzXCfSKHPVKQPcCvDWpA7MHm95ntE5nCf+FHUxSC9P5culbsZp4ip5jLw/leY
         QoqdP7lP9NqMwkSZvkhYz2KQljnQKVmqhRERLkPe6v8pfDtCuba0Q6+/4SDWDj6zO6DS
         83ME8hC5rLiFgrTnkG6XEaS5PrsyhQXw5gkar7PF2BhX67wQ4P8sTP6lBkwmurHRm9Nb
         VLyTzM21cf51EBhYMFWL0U5+gllHywpYRXRdgUhre7SmIUbpc+0Ma04tVcSlIL40NGQc
         7s8qi0zxxZT2cMtsI+aL4CTqfx60Nzf5NK/ofg4FaH56rjbD4wAjwnUUquV4bN34E/MB
         kfvg==
X-Forwarded-Encrypted: i=1; AJvYcCUbaN35rl1qKqbFXGquK4yEVlNS/nKYnM6ODLYt2SC/3+BhF0wN77wHCriaQiuUNJYTa56HODZjZpwFknE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxIArzJVI5unK/gR/SgwNZSQYFInLYfhJaC/0BG+MuaxMFP3ZRN
	K1Cod5xBq04bqId+S/O/BI6TMG3sm0CDFLNtF3P3zoRTdW2bn4OO+s78
X-Gm-Gg: AY/fxX6yHRy4Jnug6nE+fzMsekRzEzS0tqxL/SRbYa7YgKFfVMvvx9cb1idDr2M+9Ne
	UUWldpgcT2Evv1RnSP5LS8sbT2qs01Cs8pQGCjbAvHXdvpc98ZW0gtzGy6RIOWO0kl+TYoFNhgI
	fM8UIHkvDTXLjRiDdmPZvb/qJ+/ZCa35Rc0pgt9/R/TPuuR5gUoOHO7V6hkuM01dZ5cNDWb/Fvn
	/PGjUW6ZWPM12B+rQN0zEFS3FdVTY7bemqlSbPS7R6UfSZa2X/RqFhLlUzDSrI7/87uNwbW41aU
	TMBuebyz4Lio8cAqGEfP8x7WWXD25tMB4CD/3wiTVdaHftJZtafuPxY9czG7TgqX5YWW92nQ6X5
	U8WB2OfzLsnvFSD87G2cqqNy+ZImKsy66hh/W2123pbUxrna+UxFkRk4TiIiVf1pKQNeZuVqnsh
	W3mvwD+D9OIa0oClwIMZzpo5pV7WzM91cf8moEmmJPRhfrNjeLF3g/
X-Google-Smtp-Source: AGHT+IFJHEaZoRkhHw4zj9EBxNV/rp8ncSP4Ef47XQLiJPMu3j1wMm2BAE3otGmVGJMIybtQwjSgsQ==
X-Received: by 2002:a05:600c:8b6d:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-47d84b4a7b4mr30796025e9.35.1767794736254;
        Wed, 07 Jan 2026 06:05:36 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d87167832sm13555455e9.7.2026.01.07.06.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:05:35 -0800 (PST)
Date: Wed, 7 Jan 2026 14:05:33 +0000
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
Message-ID: <20260107140533.2b3c46a1@pumpkin>
In-Reply-To: <20260104230136.7aaf8886@pumpkin>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-4-ryan.roberts@arm.com>
	<20260104230136.7aaf8886@pumpkin>
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

On Sun, 4 Jan 2026 23:01:36 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Fri,  2 Jan 2026 13:11:54 +0000
> Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
> > Previously different architectures were using random sources of
> > differing strength and cost to decide the random kstack offset. A number
> > of architectures (loongarch, powerpc, s390, x86) were using their
> > timestamp counter, at whatever the frequency happened to be. Other
> > arches (arm64, riscv) were using entropy from the crng via
> > get_random_u16().
> > 
> > There have been concerns that in some cases the timestamp counters may
> > be too weak, because they can be easily guessed or influenced by user
> > space. And get_random_u16() has been shown to be too costly for the
> > level of protection kstack offset randomization provides.
> > 
> > So let's use a common, architecture-agnostic source of entropy; a
> > per-cpu prng, seeded at boot-time from the crng. This has a few
> > benefits:
> > 
> >   - We can remove choose_random_kstack_offset(); That was only there to
> >     try to make the timestamp counter value a bit harder to influence
> >     from user space.
> > 
> >   - The architecture code is simplified. All it has to do now is call
> >     add_random_kstack_offset() in the syscall path.
> > 
> >   - The strength of the randomness can be reasoned about independently
> >     of the architecture.
> > 
> >   - Arches previously using get_random_u16() now have much faster
> >     syscall paths, see below results.
> > 
> > There have been some claims that a prng may be less strong than the
> > timestamp counter if not regularly reseeded. But the prng has a period
> > of about 2^113. So as long as the prng state remains secret, it should
> > not be possible to guess. If the prng state can be accessed, we have
> > bigger problems.  
> 
> If you have 128 bits of output from consecutive outputs I think you
> can trivially determine the full state using (almost) 'school boy' maths
> that could be done on pencil and paper.
> (Most of the work only has to be done once.)
> 
> The underlying problem is that the TAUSWORTHE() transformation is 'linear'
> So that TAUSWORTHE(x ^ y) == TAUSWORTHE(x) ^ TAUSWORTHE(y).
> (This is true of a LFSR/CRC and TOUSWORTH() is doing some subset of CRCs.)
> This means that each output bit is the 'xor' of some of the input bits.
> The four new 'state' values are just xor of the the bits of the old ones.
> The final xor of the four states gives a 32bit value with each bit just
> an xor of some of the 128 state bits.
> Get four consecutive 32 bit values and you can solve the 128 simultaneous
> equations (by trivial substitution) and get the initial state.
> The solution gives you the 128 128bit constants for:
> 	u128 state = 0;
> 	u128 val = 'value returned from 4 calls';
> 	for (int i = 0; i < 128; i++)
> 		state |= parity(const128[i] ^ val) << i;
> You don't need all 32bits, just accumulate 128 bits.  
> So if you can get the 5bit stack offset from 26 system calls you know the
> value that will be used for all the subsequent calls.

Some of the state bits don't get used, so you only need 123 bits.
The stack offset is 6 bits - so you need the values from 19 calls.

> Simply changing the final line to use + not ^ makes the output non-linear
> and solving the equations a lot harder.
> 
> I might sit down tomorrow and see if I can actually code it...

Finally done:

#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

typedef unsigned int u32;
typedef unsigned long long u64;
typedef unsigned __int128 u128;

struct rnd_state { u32 s1; u32 s2; u32 s3; u32 s4; };
u32 prandom_u32_state(struct rnd_state *state)
{
#define TAUSWORTHE(s, a, b, c, d) ((s & c) << d) ^ (((s << a) ^ s) >> b)
        state->s1 = TAUSWORTHE(state->s1,  6U, 13U, 4294967294U, 18U);
        state->s2 = TAUSWORTHE(state->s2,  2U, 27U, 4294967288U,  2U);
        state->s3 = TAUSWORTHE(state->s3, 13U, 21U, 4294967280U,  7U);
        state->s4 = TAUSWORTHE(state->s4,  3U, 12U, 4294967168U, 13U);

        return (state->s1 ^ state->s2 ^ state->s3 ^ state->s4);
}

#define X(n, hi, lo) [n] = (u128)0x##hi << 64 | 0x##lo
u128 map[128] = {
        X(  1, 23acb122e4a76, e206c3f6fe435cb6),
	...
        X(127, 00d3276d8a76a, e560d1975675be24) };

u128 parity_128(u128 v)                 
{                               
        return __builtin_parityll(v) ^ __builtin_parityll(v >> 64);
}

int main(int argc, char **argv)
{
        struct rnd_state s = {};
        u128 s0, v, r = 0;

        read(open("/dev/urandom", O_RDONLY), &s, sizeof s);
        // Remove low bits that get masked by the (s & c) term.
        s.s1 &= ~1; s.s2 &= ~7; s.s3 &= ~15; s.s4 &= ~127;
        s0 = (((u128)s.s4 << 32 | s.s3) << 32 | s.s2) << 32 | s.s1;
        v = prandom_u32_state(&s);
        v |= (u128)prandom_u32_state(&s) << 32;
        v |= (u128)prandom_u32_state(&s) << 64;
        v |= (u128)prandom_u32_state(&s) << 96;

        for (int n = 0; n < 128; n++)
                r |= parity_128(v & map[n]) << n;

        printf("%016llx%016llx\n", (u64)(s0 >> 64), (u64)s0);
        printf("values%s match\n", r == s0 ? "" : " do not");

        return r != s0;
}

I've trimmed the initialiser - it is very boring.
The code to create the initialiser is actually slightly smaller than it is.
Doable by hand provided you can do 128bit shift and xor without making
any mistakes.

I've just done a quick search through the kernel sources and haven't found
many uses of prandom_u32_state() outside of test code.
There is sched_rng() which uses a per-cpu rng to throw a 1024 sized die.
bpf also has a per-cpu one for 'unprivileged user space'.
net/sched/sch_netem.c seems to use one - mostly for packet loss generation.

Since the randomize_kstack code is now using a per-task rng (initialised
by clone?) that could be used instead of all the others provided they
are run when 'current' is valid.

But the existing prandom_u32_state() needs a big health warning that
four outputs leak the entire state.
That is fixable by changing the last line to:
        return state->s1 + state->s2 + state->s3 + state->s4;
That only affects the output value, the period is unchanged.

	David



