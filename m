Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B81219DB2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 12:27:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2XRJ0Xs6zDqxl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 20:27:08 +1000 (AEST)
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
 header.s=20161025 header.b=h3icAK0f; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2XP20GVtzDqKf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 20:25:08 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id d10so669850pll.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 03:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=b2NeK05XWB0xDJ7gbj6dxeZbhLfM0JEMlPnaA+COod8=;
 b=h3icAK0fJlduSxaVJZTAsAbBOXWSxN4IoYHK8mdc1bCh1bsLxSIRHiIVfUBzc1NIk4
 aoS/LYGHK2VtD9IJjgkcsYAiHBNDI5I/E9YfhQN+zvgbc0Sf+ycTqzneR/HN2BDzvLwH
 Q2NkaNM+WU969yGnPwKGrc5gVFFKNhZLEDB8Wrk5PdIFMYw+IjQ9SG4k3hotPwn1fe1/
 PkDr0zWaYC0j89w8FyTmwpQTbCevkciW+WhITHnKtX+zqcrDC1lMP6LttxQPbpM+yVht
 D5GQ4RzZJEfyRBjOJVXeLp/yD/BbL/R+GWtYKEZJdg+8aZ50SP5aWC/FwiNOqOn19AgU
 VCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=b2NeK05XWB0xDJ7gbj6dxeZbhLfM0JEMlPnaA+COod8=;
 b=a6o0FPorD5LQPlvFWncuBachN0MDl5N4A65CkFG2rO92yVtG+62UeaYj9Xg6aTsPZI
 kZSwPwQRakpfW8K0Oonm/IYRTSXrDuqC5lWLjItR1MsrzgmSmn8q4lsE9YH8PCWO5POR
 fh4KwVumxDJ2/FHxaB+y6p6u3204+20Vcw4W8pU2oyoAAcfrQzqU966NIIMkiF9sVLYw
 CbRpehgAJhei14CuO15d9jhtxCCg3S1MilpkZeEHJpP9ZwBkrzcAN7drSk1yVDbz3arr
 QQAbmQxafyh8b48Nor4mwUUItC6kn+p+X6rcgDeIml+BCqWwe9g3iG69eSD2VjbeJ5YL
 j03g==
X-Gm-Message-State: AOAM530EIDrzPNp0Vg6bOBDTRuSYE+AxdiiWnKGbXgq/i1OC/XtuuKMM
 8dcsUSsO7YD1APxyPWp7ocM=
X-Google-Smtp-Source: ABdhPJyW7NYnbURxdwM8YP4WKOabd+AK4ezMjz49kVRoyMbLLTmNSYA/GBxbPfH1AietJHL0utbNeQ==
X-Received: by 2002:a17:90a:7185:: with SMTP id
 i5mr15201660pjk.170.1594290304419; 
 Thu, 09 Jul 2020 03:25:04 -0700 (PDT)
Received: from localhost (27-33-0-186.tpgi.com.au. [27.33.0.186])
 by smtp.gmail.com with ESMTPSA id l15sm2101883pjq.1.2020.07.09.03.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 03:25:03 -0700 (PDT)
Date: Thu, 09 Jul 2020 20:24:56 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: select ARCH_HAS_MEMBARRIER_SYNC_CORE
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
References: <20200706021822.1515189-1-npiggin@gmail.com>
 <cf10b0bc-de79-1b2b-8355-fc7bbeec47c3@csgroup.eu>
 <1594098302.nadnq2txti.astroid@bobo.none>
 <638683144.970.1594121101349.JavaMail.zimbra@efficios.com>
 <1594185107.e130s0d92x.astroid@bobo.none>
 <407005394.1910.1594217551840.JavaMail.zimbra@efficios.com>
In-Reply-To: <407005394.1910.1594217551840.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Message-Id: <1594290193.f21t9y66td.astroid@bobo.none>
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

Excerpts from Mathieu Desnoyers's message of July 9, 2020 12:12 am:
> ----- On Jul 8, 2020, at 1:17 AM, Nicholas Piggin npiggin@gmail.com wrote=
:
>=20
>> Excerpts from Mathieu Desnoyers's message of July 7, 2020 9:25 pm:
>>> ----- On Jul 7, 2020, at 1:50 AM, Nicholas Piggin npiggin@gmail.com wro=
te:
>>>=20
> [...]
>>>> I should actually change the comment for 64-bit because soft masked
>>>> interrupt replay is an interesting case. I thought it was okay (becaus=
e
>>>> the IPI would cause a hard interrupt which does do the rfi) but that
>>>> should at least be written.
>>>=20
>>> Yes.
>>>=20
>>>> The context synchronisation happens before
>>>> the Linux IPI function is called, but for the purpose of membarrier I
>>>> think that is okay (the membarrier just needs to have caused a memory
>>>> barrier + context synchronistaion by the time it has done).
>>>=20
>>> Can you point me to the code implementing this logic ?
>>=20
>> It's mostly in arch/powerpc/kernel/exception-64s.S and
>> powerpc/kernel/irq.c, but a lot of asm so easier to explain.
>>=20
>> When any Linux code does local_irq_disable(), we set interrupts as
>> software-masked in a per-cpu flag. When interrupts (including IPIs) come
>> in, the first thing we do is check that flag and if we are masked, then
>> record that the interrupt needs to be "replayed" in another per-cpu
>> flag. The interrupt handler then exits back using RFI (which is context
>> synchronising the CPU). Later, when the kernel code does
>> local_irq_enable(), it checks the replay flag to see if anything needs
>> to be done. At that point we basically just call the interrupt handler
>> code like a normal function, and when that returns there is no context
>> synchronising instruction.
>=20
> AFAIU this can only happen for interrupts nesting over irqoff sections,
> therefore over kernel code, never userspace, right ?

Right.

>> So membarrier IPI will always cause target CPUs to perform a context
>> synchronising instruction, but sometimes it happens before the IPI
>> handler function runs.
>=20
> If my understanding is correct, the replayed interrupt handler logic
> only nests over kernel code, which will eventually need to issue a
> context synchronizing instruction before returning to user-space.

Yes.

> All we care about is that starting from the membarrier, each core
> either:
>=20
> - interrupt user-space to issue the context synchronizing instruction if
>   they were running userspace, or
> - _eventually_ issue a context synchronizing instruction before returning
>   to user-space if they were running kernel code.
>=20
> So your earlier statement "the membarrier just needs to have caused a mem=
ory
> barrier + context synchronistaion by the time it has done" is not strictl=
y
> correct: the context synchronizing instruction does not strictly need to
> happen on each core before membarrier returns. A similar line of thoughts
> can be followed for memory barriers.

Ah okay that makes it simpler, then no such speical comment is required=20
for the powerpc specific interrupt handling.

Thanks,
Nick
