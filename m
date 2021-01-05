Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0052EAFEE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 17:22:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9Hpd36RDzDqXM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jan 2021 03:22:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amacapital.net (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=luto@amacapital.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amacapital.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20150623.gappssmtp.com
 header.i=@amacapital-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=B4eaIy0X; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9HmY0yTGzDqW1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jan 2021 03:20:56 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id e2so160997pgi.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Jan 2021 08:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=YY+00AIRRtxJBsSmjelg+ZTD3PBDsqcfuNjtpAy6QDo=;
 b=B4eaIy0X/gcJ+6Vfog9DvYrA5lzlSG1wkFyLGirBvNF++rcgXb/U/8jhqrKJZpN6Ff
 0c8/ST4Y+qwjFXVzERQhJpi6yTRl3MeWGI52OW0gJiRDmDyMS9lrtLx5MMYGnO6m9nDj
 sJO8YD5Q0cHMp9+vJ7cFvE/kzbIMKBbVsXltojydDYvFaFlO4AT7V7PpJ8O7vDfqxTNv
 pX5bMba8hKh/rsPyD87PZAOoUfCCsdQzHoHE+jnjagNvEPIoUjiM2GyEikkEjDoZMdhr
 +I8KLgCyCzMrGsrIpyqBQr2zTMwcxmWNZzNXEWomxCEFyBeKPYoBx7R8MHsoobR+fvSI
 x3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=YY+00AIRRtxJBsSmjelg+ZTD3PBDsqcfuNjtpAy6QDo=;
 b=O9WzzR8OoUQ5+gap6D3KX5SrN/M4sjgPQPxiqpOFZ1bes7157ff8+kFZ87kv/DI8iP
 MMowo0qizbLsoWEgdUA2C0mEjJ2Z9mhXjwCQ+mDdS1NDqOtwjhhsMgP6sGL2M3V7dETn
 sHoA9S0Me8P2ueKklF7yZ5/0An/37IDHIfY3ffh3q2x5o/S4XgMN5UrK32ONNPG/Rshx
 GEkDHm04rC0sS7r0Y4590kjWWL5ji+Jrliptr7hPz/XUb6rPDuBXExKRHCoO1wj5BfqG
 SbP68in4Ib/N5V9pJ1n/L6vmfgEsKDps9spaB1F83uVFWdLRZCNWMuzFApMHgQ+asWtt
 8yNw==
X-Gm-Message-State: AOAM5319AsNVhtk71m8ySzbn01sozqRKy/aChpvODeAe75/kwp9Pr8xC
 CH3q1ih4bkqUzGbcXjS2hXT5OQ==
X-Google-Smtp-Source: ABdhPJxa5mdRi43w+JAj2QFqGTiJMOhmPhoSZTCD5EpNlZP1Ra7Be1Mha7b3xYN6GHbxzVuUSGXQhg==
X-Received: by 2002:aa7:954b:0:b029:19e:cb57:f3c with SMTP id
 w11-20020aa7954b0000b029019ecb570f3cmr253102pfq.51.1609863653323; 
 Tue, 05 Jan 2021 08:20:53 -0800 (PST)
Received: from ?IPv6:2601:646:c200:1ef2:1960:9abe:3fe9:fd99?
 ([2601:646:c200:1ef2:1960:9abe:3fe9:fd99])
 by smtp.gmail.com with ESMTPSA id y27sm131408pfr.78.2021.01.05.08.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 08:20:52 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC please help] membarrier: Rewrite sync_core_before_usermode()
Date: Tue, 5 Jan 2021 08:20:51 -0800
Message-Id: <7BFAB97C-1949-46A3-A1E2-DFE108DC7D5E@amacapital.net>
References: <20210105132623.GB11108@willie-the-truck>
In-Reply-To: <20210105132623.GB11108@willie-the-truck>
To: Will Deacon <will@kernel.org>
X-Mailer: iPhone Mail (18B121)
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
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Paul Mackerras <paulus@samba.org>, stable <stable@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Jan 5, 2021, at 5:26 AM, Will Deacon <will@kernel.org> wrote:
>=20
> =EF=BB=BFHi Andy,
>=20
> Sorry for the slow reply, I was socially distanced from my keyboard.
>=20
>> On Mon, Dec 28, 2020 at 04:36:11PM -0800, Andy Lutomirski wrote:
>> On Mon, Dec 28, 2020 at 4:11 PM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>>> +static inline void membarrier_sync_core_before_usermode(void)
>>>> +{
>>>> +     /*
>>>> +      * XXX: I know basically nothing about powerpc cache management.
>>>> +      * Is this correct?
>>>> +      */
>>>> +     isync();
>>>=20
>>> This is not about memory ordering or cache management, it's about
>>> pipeline management. Powerpc's return to user mode serializes the
>>> CPU (aka the hardware thread, _not_ the core; another wrongness of
>>> the name, but AFAIKS the HW thread is what is required for
>>> membarrier). So this is wrong, powerpc needs nothing here.
>>=20
>> Fair enough.  I'm happy to defer to you on the powerpc details.  In
>> any case, this just illustrates that we need feedback from a person
>> who knows more about ARM64 than I do.
>=20
> I think we're in a very similar boat to PowerPC, fwiw. Roughly speaking:
>=20
>  1. SYNC_CORE does _not_ perform any cache management; that is the
>     responsibility of userspace, either by executing the relevant
>     maintenance instructions (arm64) or a system call (arm32). Crucially,
>     the hardware will ensure that this cache maintenance is broadcast
>     to all other CPUs.

Is this guaranteed regardless of any aliases?  That is, if I flush from one C=
PU at one VA and then execute the same physical address from another CPU at a=
 different VA, does this still work?

>=20
>  2. Even with all the cache maintenance in the world, a CPU could have
>     speculatively fetched stale instructions into its "pipeline" ahead of
>     time, and these are _not_ flushed by the broadcast maintenance instruc=
tions
>     in (1). SYNC_CORE provides a means for userspace to discard these stal=
e
>     instructions.
>=20
>  3. The context synchronization event on exception entry/exit is
>     sufficient here. The Arm ARM isn't very good at describing what it
>     does, because it's in denial about the existence of a pipeline, but
>     it does have snippets such as:
>=20
>    (s/PE/CPU/)
>       | For all types of memory:
>       | The PE might have fetched the instructions from memory at any time=

>       | since the last Context synchronization event on that PE.
>=20
>     Interestingly, the architecture recently added a control bit to remove=

>     this synchronisation from exception return, so if we set that then we'=
d
>     have a problem with SYNC_CORE and adding an ISB would be necessary (an=
d
>     we could probable then make kernel->kernel returns cheaper, but I
>     suspect we're relying on this implicit synchronisation in other places=

>     too).
>=20

Is ISB just a context synchronization event or does it do more?

On x86, it=E2=80=99s very hard to tell that MFENCE does any more than LOCK, b=
ut it=E2=80=99s much slower.  And we have LFENCE, which, as documented, does=
n=E2=80=99t appear to have any semantics at all.  (Or at least it didn=E2=80=
=99t before Spectre.)

> Are you seeing a problem in practice, or did this come up while trying to
> decipher the semantics of SYNC_CORE?

It came up while trying to understand the code and work through various bugs=
 in it.  The code was written using something approximating x86 terminology,=
 but it was definitely wrong on x86 (at least if you believe the SDM, and I h=
aven=E2=80=99t convinced any architects to say otherwise).

Thanks!

>=20
> Will
