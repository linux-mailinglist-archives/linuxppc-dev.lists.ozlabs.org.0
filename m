Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8B02E6DA3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Dec 2020 04:32:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D4g3M5TZhzDqFY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Dec 2020 14:32:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=prkubl66; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D4g1g4MRPzDq9p
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Dec 2020 14:31:17 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id b8so6613064plx.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Dec 2020 19:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=96UXaeOlfR1Q5+tTEnga5fScpJmHKA3DSdXvEcGqAHw=;
 b=prkubl66lIi/GgR/wP2FgRAKmNw8Bg1Qki2S0fnVxx7x7FobnN7KbgmoYRMuSYuhdL
 ZNF6RuxjghqQ3Tsc45xC4FmIhdrI7F3+QKx3lo7FQ3e6xo6jugcvwDjAtQD/+wdEsQji
 xBZFCqd1tz0BDNby5Qzt7JH4Q9f8TenHXok/NJw3NL0xoj1g1rmYBXz9KPqPQh3ceNig
 b0ceQRC6DdkLgl7ZWs1Iy+uOphCpO8N+Nts8XZOJLASCrZsKbQKgUYCOfMqUxvPbd2mw
 dumWFpJW5di66qpB25bWboSpSNvUXaxEG2ToWF4C4/yV3DsR0wn0nPKdvkcJ9XG0WgSR
 MYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=96UXaeOlfR1Q5+tTEnga5fScpJmHKA3DSdXvEcGqAHw=;
 b=KKrjyLyMDlYz4YtVWWYrLUruj/0LKJyUK69+1NYj68K955q1FDfpomoq7suo4V1ecK
 qsGfZPKitu7H1m/U9P9WLaLh+yc+NGP/u0girFv1AGKHa15VUMCMgBWhKML1+Ts6/8Pz
 CgO3ojxSGN93HQ4csETCjrQMnTp5z5F0tkzA/s0O0TVKW3QOrqGvGDHEASrDnHos4qJt
 UAa8rx2KfChE6ApPJaBJ3qwJxD6HcJlCY9klYT4VnDCgEhjRflkkEl2L683IrVsa2nNK
 ya6Q8aIJjzAKcEnLRkszStcUQZsjvIv0VZAJ+r/aM6zD5w+7bMVBcRPRh+ljsPZCqEhU
 LZRw==
X-Gm-Message-State: AOAM533Kgeje4UJiSQR2tEgbc1sTSdGMZsWcRLZUOWwuArHVsGR4qdfJ
 a2mItrLwLrSfspd1TvqvMUo=
X-Google-Smtp-Source: ABdhPJy5Cp6FEUhm9tRoIQwa5tlkz7MkfEmj0P0PUAmAYPzJvqxnVKoLR4KS6GMs4rxkqs0h/maH8A==
X-Received: by 2002:a17:902:eb0c:b029:db:c0d6:6289 with SMTP id
 l12-20020a170902eb0cb02900dbc0d66289mr47514422plb.12.1609212674478; 
 Mon, 28 Dec 2020 19:31:14 -0800 (PST)
Received: from localhost (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id w27sm33493195pfq.104.2020.12.28.19.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Dec 2020 19:31:13 -0800 (PST)
Date: Tue, 29 Dec 2020 13:31:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC please help] membarrier: Rewrite sync_core_before_usermode()
To: Andy Lutomirski <luto@kernel.org>
References: <bf59ecb5487171a852bcc8cdd553ec797aedc485.1609093476.git.luto@kernel.org>
 <1609199804.yrsu9vagzk.astroid@bobo.none>
 <CALCETrX4v1KEf6ikVtFg6juh3Z_esJ-+6PLT1A21JJeTVh2k8g@mail.gmail.com>
In-Reply-To: <CALCETrX4v1KEf6ikVtFg6juh3Z_esJ-+6PLT1A21JJeTVh2k8g@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1609212362.g5jhvfarip.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Arnd Bergmann <arnd@arndb.de>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 Will Deacon <will@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andy Lutomirski's message of December 29, 2020 10:36 am:
> On Mon, Dec 28, 2020 at 4:11 PM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>
>> Excerpts from Andy Lutomirski's message of December 28, 2020 4:28 am:
>> > The old sync_core_before_usermode() comments said that a non-icache-sy=
ncing
>> > return-to-usermode instruction is x86-specific and that all other
>> > architectures automatically notice cross-modified code on return to
>> > userspace.  Based on my general understanding of how CPUs work and bas=
ed on
>> > my atttempt to read the ARM manual, this is not true at all.  In fact,=
 x86
>> > seems to be a bit of an anomaly in the other direction: x86's IRET is
>> > unusually heavyweight for a return-to-usermode instruction.
>>
>> "sync_core_before_usermode" as I've said says nothing to arch, or to the
>> scheduler, or to membarrier.
>=20
> Agreed.  My patch tries to fix this.  I agree that the name is bad and
> could be improved further.  We should define what
> membarrier(...SYNC_CORE) actually does and have arch hooks to make it
> happen.
>=20
>> > So let's drop any pretense that we can have a generic way implementati=
on
>> > behind membarrier's SYNC_CORE flush and require all architectures that=
 opt
>> > in to supply their own.  This means x86, arm64, and powerpc for now.  =
Let's
>> > also rename the function from sync_core_before_usermode() to
>> > membarrier_sync_core_before_usermode() because the precise flushing de=
tails
>> > may very well be specific to membarrier, and even the concept of
>> > "sync_core" in the kernel is mostly an x86-ism.
>>
>> The concept of "sync_core" (x86: serializing instruction, powerpc: conte=
xt
>> synchronizing instruction, etc) is not an x86-ism at all. x86 just wante=
d
>> to add a serializing instruction to generic code so it grew this nasty A=
PI,
>> but the concept applies broadly.
>=20
> I mean that the mapping from the name "sync_core" to its semantics is
> x86 only.  The string "sync_core" appears in the kernel only in
> arch/x86, membarrier code, membarrier docs, and a single SGI driver
> that is x86-only.  Sure, the idea of serializing things is fairly
> generic, but exactly what operations serialize what, when things need
> serialization, etc is quite architecture specific.

Okay, well yes it's x86 only in name, I was more talking about the=20
concept.

> Heck, on 486 you serialize the instruction stream with JMP.

x86-specific aside, I did think the semantics of a "serializing=20
instruction" was reasonably well architected in x86. Sure it could do=20
other things as well, but if you executed a serializing instruction,
then you had a decent set of guarantees (e.g., what you might want
for code modification).

>=20
>> > +static inline void membarrier_sync_core_before_usermode(void)
>> > +{
>> > +     /*
>> > +      * XXX: I know basically nothing about powerpc cache management.
>> > +      * Is this correct?
>> > +      */
>> > +     isync();
>>
>> This is not about memory ordering or cache management, it's about
>> pipeline management. Powerpc's return to user mode serializes the
>> CPU (aka the hardware thread, _not_ the core; another wrongness of
>> the name, but AFAIKS the HW thread is what is required for
>> membarrier). So this is wrong, powerpc needs nothing here.
>=20
> Fair enough.  I'm happy to defer to you on the powerpc details.  In
> any case, this just illustrates that we need feedback from a person
> who knows more about ARM64 than I do.
>=20

Thanks,
Nick
