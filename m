Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6A6217F09
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 07:19:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1nfn43LFzDqhb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 15:19:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=G5bSCIbf; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1nd269bszDqXL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 15:17:58 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id w17so3226410ply.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jul 2020 22:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=YY2wH1Gk2Ezk5ukJc5h1h9RQvjvh9HdxLoywMiFdMi8=;
 b=G5bSCIbfOb805JzilJDJiPqBAlv5smjDN6Dyqik5/rXcDsXSkwVt6reuEMsrLpIGlP
 3WvkNb81i17C2yYomVZeTjl8LlJ/fAnT5nPd7YtNJAmB5PTWhdL6gYmPeuP4g+ygBAAZ
 YZFWwzJUt2bEFPa3+h8K5klzKpWr7BPL76ODuC3cV6PK/FjETDF4VajDtHTLM0N3yHPF
 ZMqyyQiK7jsP2CmOnrLCWiqRzP+9TQ1Wifv+P3WmYqg/yWVHBB8Z66/YgKxSRq8ul8+K
 IIaQYeqEfomYHB/6ypHvIin2Bhr9RlYgMUuW7RHjR8siEQ7r0rVL9xxj/PPwIDyu1oyW
 wuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=YY2wH1Gk2Ezk5ukJc5h1h9RQvjvh9HdxLoywMiFdMi8=;
 b=UkVqnlYQcmGqc9CfUW10+J8y3Hn4dL9qU5MPt1s/4syTtpVAioIN3u789+f+8j4QmY
 lwV3RUvn2n0LqSsITq1jA+T/1GZvIm9pgGiK5U/sR1T/GryK7HymsBHebVvHDKCi1g/l
 FaqrJocb9MuCdqcjycH5kSag33zYhgf4Ri38ChEzqvywhmHNLokQUEQKG0ky0KXus6GS
 e8x1+QRg71UYNWYrJBJlhHTpjSACO+nSXf8CZfxyHFH3GNGmda6XuQf0P6KN47B8VKLr
 iaDl5FLGTZqkLzUkEo+zAERk6bhNQltROXSZaL1BOvxubgXVaIgTbr1bqMb/ciczoS9U
 0bYQ==
X-Gm-Message-State: AOAM530q0ChF++tknaAe4yDudEqzDA+3sRmsdYVTppTrQGJos+XhWykf
 RlF42EGYWuJ28PZxdhG+80VvOGSf
X-Google-Smtp-Source: ABdhPJxZWYKPUo47P5k045ucOfnvvGfBhhKRwT4Nfay8RdQavSxDI+3WfFHocpTjzufqdhaEiDmmHg==
X-Received: by 2002:a17:90a:8e:: with SMTP id
 a14mr8047492pja.206.1594185474722; 
 Tue, 07 Jul 2020 22:17:54 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id e8sm23669517pff.185.2020.07.07.22.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 22:17:53 -0700 (PDT)
Date: Wed, 08 Jul 2020 15:17:49 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: select ARCH_HAS_MEMBARRIER_SYNC_CORE
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
References: <20200706021822.1515189-1-npiggin@gmail.com>
 <cf10b0bc-de79-1b2b-8355-fc7bbeec47c3@csgroup.eu>
 <1594098302.nadnq2txti.astroid@bobo.none>
 <638683144.970.1594121101349.JavaMail.zimbra@efficios.com>
In-Reply-To: <638683144.970.1594121101349.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Message-Id: <1594185107.e130s0d92x.astroid@bobo.none>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Mathieu Desnoyers's message of July 7, 2020 9:25 pm:
> ----- On Jul 7, 2020, at 1:50 AM, Nicholas Piggin npiggin@gmail.com wrote=
:
>=20
>> Excerpts from Christophe Leroy's message of July 6, 2020 7:53 pm:
>>>=20
>>>=20
>>> Le 06/07/2020 =C3=A0 04:18, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>> diff --git a/arch/powerpc/include/asm/exception-64s.h
>>>> b/arch/powerpc/include/asm/exception-64s.h
>>>> index 47bd4ea0837d..b88cb3a989b6 100644
>>>> --- a/arch/powerpc/include/asm/exception-64s.h
>>>> +++ b/arch/powerpc/include/asm/exception-64s.h
>>>> @@ -68,6 +68,10 @@
>>>>    *
>>>>    * The nop instructions allow us to insert one or more instructions =
to flush the
>>>>    * L1-D cache when returning to userspace or a guest.
>>>> + *
>>>> + * powerpc relies on return from interrupt/syscall being context sync=
hronising
>>>> + * (which hrfid, rfid, and rfscv are) to support ARCH_HAS_MEMBARRIER_=
SYNC_CORE
>>>> + * without additional additional synchronisation instructions.
>>>=20
>>> This file is dedicated to BOOK3S/64. What about other ones ?
>>>=20
>>> On 32 bits, this is also valid as 'rfi' is also context synchronising,
>>> but then why just add some comment in exception-64s.h and only there ?
>>=20
>> Yeah you're right, I basically wanted to keep a note there just in case,
>> because it's possible we would get a less synchronising return (maybe
>> unlikely with meltdown) or even return from a kernel interrupt using a
>> something faster (e.g., bctar if we don't use tar register in the kernel
>> anywhere).
>>=20
>> So I wonder where to add the note, entry_32.S and 64e.h as well?
>>=20
>=20
> For 64-bit powerpc, I would be tempted to either place the comment in the=
 header
> implementing the RFI_TO_USER and RFI_TO_USER_OR_KERNEL macros or the .S f=
iles
> using them, e.g. either:
>=20
> arch/powerpc/include/asm/exception-64e.h
> arch/powerpc/include/asm/exception-64s.h
>=20
> or
>=20
> arch/powerpc/kernel/exceptions-64s.S
> arch/powerpc/kernel/entry_64.S
>=20
> And for 32-bit powerpc, AFAIU
>=20
> arch/powerpc/kernel/entry_32.S
>=20
> uses SYNC + RFI to return to user-space. RFI is defined in
>=20
> arch/powerpc/include/asm/ppc_asm.h
>=20
> So a comment either near the RFI define and its uses should work.
>=20
>> I should actually change the comment for 64-bit because soft masked
>> interrupt replay is an interesting case. I thought it was okay (because
>> the IPI would cause a hard interrupt which does do the rfi) but that
>> should at least be written.
>=20
> Yes.
>=20
>> The context synchronisation happens before
>> the Linux IPI function is called, but for the purpose of membarrier I
>> think that is okay (the membarrier just needs to have caused a memory
>> barrier + context synchronistaion by the time it has done).
>=20
> Can you point me to the code implementing this logic ?

It's mostly in arch/powerpc/kernel/exception-64s.S and=20
powerpc/kernel/irq.c, but a lot of asm so easier to explain.

When any Linux code does local_irq_disable(), we set interrupts as=20
software-masked in a per-cpu flag. When interrupts (including IPIs) come
in, the first thing we do is check that flag and if we are masked, then
record that the interrupt needs to be "replayed" in another per-cpu=20
flag. The interrupt handler then exits back using RFI (which is context=20
synchronising the CPU). Later, when the kernel code does=20
local_irq_enable(), it checks the replay flag to see if anything needs=20
to be done. At that point we basically just call the interrupt handler=20
code like a normal function, and when that returns there is no context
synchronising instruction.

So membarrier IPI will always cause target CPUs to perform a context
synchronising instruction, but sometimes it happens before the IPI=20
handler function runs.

Thanks,
Nick
