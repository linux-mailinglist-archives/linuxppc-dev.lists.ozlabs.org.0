Return-Path: <linuxppc-dev+bounces-15279-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4A8CF4368
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 15:47:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlHFv4grBz2yCL;
	Tue, 06 Jan 2026 01:47:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767624451;
	cv=none; b=dnd5adzNGlj9uUMv8nssy2r9iUNhRP0Yxc3mOzfU9PJ8eYQCbXz2IYxcQSLLU5ui2x60+GfODB47zLvWrhb/pb2uEuWaDWmHCTE3kaj2OPyfkkLTOzFQjHrWGDtFg7/odfilobQWLrI2zYknywbcSL0HlOnbbs5LcT7m+QzrOHONHohJ4HdE0cLeg27BDnnhvb3VjC9ZWmtr4AnErH9WB2vthrRpe4T7547PwcNjpFKC1q3A+V4Xpy7m6Cg2K8lEFNcZXsT7xeK/27ebPbAfuQrD3hP05+5ik4sC6TJ33os78Pz+lUTIkxKumuTwxlfouxg5Mbb/DNcKGerVfaLdRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767624451; c=relaxed/relaxed;
	bh=XSwPcNo8o0N6KCcNlfNXq5S6yUSOj9uBi5hsA/QPZGo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NLoa3jrMHhvee3bCpWK2VdetOcsda2pLIWBWzbDoxpTuxbXnFX8NCHwek7ahPI3ZwAJp9Yg7Y4d4ncGEBEt9h/9l1O1rvtI7GKbMPCcnGaxCgeHVHqa/nJXXKCqW9VUa1PU4a8uMkUz3IBUsGR42ioblMX1lSrfuCEtV9HT7eCWlgkNFRNNDADXZwZl0aT4Cn7pn9TMBn9fncIhwnontdBsOdgfQl/QiM9Votvf75Kh07bzHR18n6i/CEFKBfujV5Yscce00yqOAHh60hVfW1edBXI60YcqXHlsKx87h6sjslgy1e7tJV1KWOaWEhIVIT0hqFsX0tRT6pD3ujSMe6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CDaAna8Q; dkim-atps=neutral; spf=pass (client-ip=209.85.128.51; helo=mail-wm1-f51.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CDaAna8Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.51; helo=mail-wm1-f51.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlHFs2qgJz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 01:47:28 +1100 (AEDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso126796575e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 06:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767624348; x=1768229148; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSwPcNo8o0N6KCcNlfNXq5S6yUSOj9uBi5hsA/QPZGo=;
        b=CDaAna8QZIMruoLv6V/FrsoKnie5RnR6EHmixszThD7OFtgE2hufkQ3S5+cveKPPdA
         qJJo2BF6QZc5+kFPUX57+vW92PUqXTrtcVQICX2SlfXv0OiahMz90IIGRRQnd9UeVeks
         fecG35yYBm4LvBn+JPLK7nUK6KPvQhMsev2ymw7KMd1l+6wSr6vWVfjbK1zrGpsgvgc3
         6sTF1lkqLfgdqbrUCBm9n1iPUFGueOorC5K6IL4qjLRrj4M06U4egxEcoPiANYcxikDE
         3C0Rt8yutJtpzYMktfJ/FTG8GWYKssKk+ldgzEnt2assJ4CFQndirqlnnK89fnZ4mxZa
         +X0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767624348; x=1768229148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XSwPcNo8o0N6KCcNlfNXq5S6yUSOj9uBi5hsA/QPZGo=;
        b=m3fE7GS/JpDPo1YIPULXtjP+6ZW0Dz6HCduNH/AfxR/b+eGZ1vb4WKLTlGUHdYMSgG
         oXc7Gw00oUpwJXjpKzT2VucWQ6dDYlUScDZYO0Ft8vB21hxvSIQXv5tIWNMLkn8YWGL/
         1atepG9nXQaiwdv04EgM0b8Mvy3vDqHq7D8KcZg2MnsawzFoUyGOQvLGF/Ea6b3FXQYR
         /+aK0twoKAjCJxG6V8jxlPoj/yIx0ZX7+zggr4fVU0uPvTqWHWGIR1JusinEnVMgq5Vc
         N23CQdvXOHiF1qCLGWoo1jyacRsL0QC5fhkSi7epEC3lQTwSwOAnnWk7kY1Xid0KZcC7
         qsAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXiD+0RkqUqzqZPTAcGssvaOv+sP9PUaoYb/K7BJ0EAcU2f2z3YFMtjSfnfGU8nsPlLNiZMrM0FnmzPHM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YygOMgizowOBVoR+u1+ELuXbGzj2Z/CjgYHO3jxPIhZMAjU6ZYX
	wWxl1lwwsWUqiw5QIde6J1sBECHZcjpm4m+rbEX4wQB1hgZKUEAoEtFn
X-Gm-Gg: AY/fxX58lAqDsskQsG5OvNcRcIPD70KVuQoFWWBAA/aavcWblyOqRyz5R0/WTDCiPF0
	RpTBLemF1b2fznWcdiMr3krmxtu73g5aUOTKGuKJvfKV3EsEaOfIFwAgr2Fxi+7Y/0o5WnE/b8p
	p+/N6f+5NpNB4eCQZukNYqKlVop6CdX9VEpCau5zxvUZQz47/VIeU+HHHIQsJ0VJqYq85Cqmj15
	rHpX4lOE1E9jEhi+6SSz7Pgi9ffKuvow9VQv4FnfoPI7hiTSmeuLW6zHsdxRO+ozw/dkXyTmwGt
	jqOCe0KgVRCg8sR3EYZwmVzytEMqpyrOtfa0XIPCvtIW6jrvbkCAdcsM5Oj8oHsU7VdLD/Ks68A
	RPSpljlzanKioMTUfGeY1I4YjMj3Yxie8VlJf/XnL+VUxVI9TD4+LH9qMzrFEXvPE0PnRtoi+6T
	QGIe470od5BNVf6/2hlP0r3iMOwib21xywI9tFAmaA8YZQ99okHA73v3CcTWxkQQ8=
X-Google-Smtp-Source: AGHT+IEzQJ2d8LdW+ZAISEQqtjJZ6hu3kCqntkmy/4NpDB13AhMox7IMuU26/rlmQkOaOYroxoA3pQ==
X-Received: by 2002:a05:600c:1991:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-47d195aa354mr674903875e9.32.1767624347886;
        Mon, 05 Jan 2026 06:45:47 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452c69sm195826845e9.9.2026.01.05.06.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:45:47 -0800 (PST)
Date: Mon, 5 Jan 2026 14:45:45 +0000
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
Message-ID: <20260105144545.45f2b0ba@pumpkin>
In-Reply-To: <60c5d7b1-1ab7-490c-8cb8-dfd50cf23856@arm.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-4-ryan.roberts@arm.com>
	<20260104230136.7aaf8886@pumpkin>
	<60c5d7b1-1ab7-490c-8cb8-dfd50cf23856@arm.com>
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

On Mon, 5 Jan 2026 11:05:18 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> On 04/01/2026 23:01, David Laight wrote:
> > On Fri,  2 Jan 2026 13:11:54 +0000
> > Ryan Roberts <ryan.roberts@arm.com> wrote:
> >   
> >> Previously different architectures were using random sources of
> >> differing strength and cost to decide the random kstack offset. A number
> >> of architectures (loongarch, powerpc, s390, x86) were using their
> >> timestamp counter, at whatever the frequency happened to be. Other
> >> arches (arm64, riscv) were using entropy from the crng via
> >> get_random_u16().
> >>
> >> There have been concerns that in some cases the timestamp counters may
> >> be too weak, because they can be easily guessed or influenced by user
> >> space. And get_random_u16() has been shown to be too costly for the
> >> level of protection kstack offset randomization provides.
> >>
> >> So let's use a common, architecture-agnostic source of entropy; a
> >> per-cpu prng, seeded at boot-time from the crng. This has a few
> >> benefits:
> >>
> >>   - We can remove choose_random_kstack_offset(); That was only there to
> >>     try to make the timestamp counter value a bit harder to influence
> >>     from user space.
> >>
> >>   - The architecture code is simplified. All it has to do now is call
> >>     add_random_kstack_offset() in the syscall path.
> >>
> >>   - The strength of the randomness can be reasoned about independently
> >>     of the architecture.
> >>
> >>   - Arches previously using get_random_u16() now have much faster
> >>     syscall paths, see below results.
> >>
> >> There have been some claims that a prng may be less strong than the
> >> timestamp counter if not regularly reseeded. But the prng has a period
> >> of about 2^113. So as long as the prng state remains secret, it should
> >> not be possible to guess. If the prng state can be accessed, we have
> >> bigger problems.  
> > 
> > If you have 128 bits of output from consecutive outputs I think you
> > can trivially determine the full state using (almost) 'school boy' maths
> > that could be done on pencil and paper.
> > (Most of the work only has to be done once.)
> > 
> > The underlying problem is that the TAUSWORTHE() transformation is 'linear'
> > So that TAUSWORTHE(x ^ y) == TAUSWORTHE(x) ^ TAUSWORTHE(y).
> > (This is true of a LFSR/CRC and TOUSWORTH() is doing some subset of CRCs.)
> > This means that each output bit is the 'xor' of some of the input bits.
> > The four new 'state' values are just xor of the the bits of the old ones.
> > The final xor of the four states gives a 32bit value with each bit just
> > an xor of some of the 128 state bits.
> > Get four consecutive 32 bit values and you can solve the 128 simultaneous
> > equations (by trivial substitution) and get the initial state.
> > The solution gives you the 128 128bit constants for:
> > 	u128 state = 0;
> > 	u128 val = 'value returned from 4 calls';
> > 	for (int i = 0; i < 128; i++)
> > 		state |= parity(const128[i] ^ val) << i;  
> 
> What is const128[] here?

Some values you prepared earlier :-)

> > You done need all 32bits, just accumulate 128 bits.  
> > So if you can get the 5bit stack offset from 26 system calls you know the
> > value that will be used for all the subsequent calls.  
> 
> It's not immediately obvious to me how user space would do this, but I'll take
> it on faith that it may be possible.

It shouldn't be possible, but anything that leaks a stack address would
give it away.
It is also pretty much why you care about the cycle length of the PRNG.
(If the length is short a rogue application can remember all the values.)

> > 
> > Simply changing the final line to use + not ^ makes the output non-linear
> > and solving the equations a lot harder.  
> 
> There has been pushback on introducing new primitives [1] but I don't think
> that's a reason not to considder it.

That is a more general issue with the PRNG.
ISTR it was true for the previous version that explicitly used four CRC.
Jason should know more about whether the xor are a good idea.

> 
> [1] https://lore.kernel.org/all/aRyppb8PCxFKVphr@zx2c4.com/
> 
> > 
> > I might sit down tomorrow and see if I can actually code it...  
> 
> Thanks for the analysis! I look forward to seeing your conclusion... although
> I'm not sure I'll be qualified to evaluate it mathematically.

I need to drag out the brian cells from when I learnt about CRC (actually
relating to burst error correction) over 40 years ago...
 
> FWIW, I previously had a go at various schemes using siphash to calculate some
> random bits. I found it to be significantly slower than this prng. I've so far
> taken the view that 6 bits of randomness is not much of a defence against brute
> force so we really shouldn't be spending too many cycles to generate the bits.
> If we can get to approach to work, I think that's best.

Indeed.
A single 32bit CRC using (crc + (crc >> 16)) & 0x3f could be 'good enough'.
Especially if the value is 'perturbed' during (say) context switch.
The '16' might need adjusting for the actual CRC, especially if TAUSWORTHE()
is used - you don't want the value to match one of the shifts it uses.

prandom_u32_state() is defined as:
#define TAUSWORTHE(s, a, b, c, d) ((s & c) << d) ^ (((s << a) ^ s) >> b)
	state->s1 = TAUSWORTHE(state->s1,  6U, 13U, 4294967294U, 18U);
	state->s2 = TAUSWORTHE(state->s2,  2U, 27U, 4294967288U,  2U);
	state->s3 = TAUSWORTHE(state->s3, 13U, 21U, 4294967280U,  7U);
	state->s4 = TAUSWORTHE(state->s4,  3U, 12U, 4294967168U, 13U);
	return (state->s1 ^ state->s2 ^ state->s3 ^ state->s4);
This is equivalent to:
#define TAUSWORTHE(s, a, b, c, d) ((s & ~c) << d) ^ (s >> a) ^ (s >> b)
	state->s1 = TAUSWORTHE(state->s1,  7, 13,   1, 18);
	state->s2 = TAUSWORTHE(state->s2, 25, 27,   7,  2);
	state->s3 = TAUSWORTHE(state->s3,  8, 21,  15,  7);
	state->s4 = TAUSWORTHE(state->s4,  9, 12, 127, 13);
which makes it clear that some low bits of each 's' get discarded reducing
the length of each CRC to (I think) 31, 29, 28 and 25.
Since 'b + d' matches the bits discarded by 'c', two of those shifts are
actually just a rotate, so there isn't really much 'bit stirring' going on.

By comparison CRC-16 (for hdlc comms like x25, isdn and ss7) reduces to:
u32 crc_step(u32 crc, u8 byte_val)
{
    u8 t = crc ^ byte_val;
    t = (t ^ t << 4);
    return crc >> 8 ^ t << 8 ^ t << 3 ^ t >> 4;
}
Much more 'stirring'.

	David



