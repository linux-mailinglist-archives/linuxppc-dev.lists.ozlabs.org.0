Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8E571F700
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 02:03:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXNWC1bG6z3dyc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 10:03:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zhe+ii4h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zhe+ii4h;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXNVL1tRLz3cC5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 10:02:34 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B286564B13
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 00:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA2DC433A7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 00:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685664150;
	bh=tFm/VXuuVDtTlP6XBCrW6GQLEa1ct+xvVLB1UFiGIT0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zhe+ii4hjesHDAgMZHuwpUCJJCm75EFKG+5a6EPWjMO0HDHXPyIpavtujtLCURVSG
	 L0tPOTqlQwSkMNiUo14MQBHZXJuJsEZSF14bp35whT7uHVYa6I5+MNTZchaPm9JNIm
	 aVdr8gwENYjQkB3MGIU8IUF/E6pIAulaPIHaGpFoY73x0KGcegDzYIgthrQqKLiK0x
	 E+hZoEG+zWVfdTx59SC4n6eQIxvKqvyqdxNlYb/Bah5jcigAfqfjnA8yubrXktjB4r
	 u9EYw1FVaxQ8EYOZ1NhKvpv2x/t9dFLPXYWavNE0MV8kGpQg8ySGoyFYWjG/4fGguR
	 0BNJi8O6JG65A==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4f3baf04f0cso1946495e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 17:02:30 -0700 (PDT)
X-Gm-Message-State: AC+VfDywlkRs9/8uHtnZmg0t9Xx2agtzvPvs+8ep5ppYqG6il083lMWn
	bivI4gllZVFQEbI7kEnWJaBdrT9bjeG6srCg99g=
X-Google-Smtp-Source: ACHHUZ5+AeCGOC7qHIq2jqRCeZpvT4cPqtj6GONlHu3ZGFgMYeuzIcV8ffuR5AKgvu/Von6c/0h12/a6PWP4XU2OyEA=
X-Received: by 2002:a05:6512:201:b0:4f2:4df1:9718 with SMTP id
 a1-20020a056512020100b004f24df19718mr780946lfo.17.1685664148535; Thu, 01 Jun
 2023 17:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230601101257.530867-1-rppt@kernel.org> <20230601101257.530867-13-rppt@kernel.org>
 <20230601103050.GT4253@hirez.programming.kicks-ass.net> <20230601110713.GE395338@kernel.org>
In-Reply-To: <20230601110713.GE395338@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 1 Jun 2023 17:02:16 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7J=4iMPQQw=V1C4MLFf=cP94gSwVx1g7M4YL0W6OLHRQ@mail.gmail.com>
Message-ID: <CAPhsuW7J=4iMPQQw=V1C4MLFf=cP94gSwVx1g7M4YL0W6OLHRQ@mail.gmail.com>
Subject: Re: [PATCH 12/13] x86/jitalloc: prepare to allocate exectuatble
 memory as ROX
To: Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, bpf@vger.kernel.org, linuxppc-dev
 @lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 1, 2023 at 4:07=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> On Thu, Jun 01, 2023 at 12:30:50PM +0200, Peter Zijlstra wrote:
> > On Thu, Jun 01, 2023 at 01:12:56PM +0300, Mike Rapoport wrote:
> >
> > > +static void __init_or_module do_text_poke(void *addr, const void *op=
code, size_t len)
> > > +{
> > > +   if (system_state < SYSTEM_RUNNING) {
> > > +           text_poke_early(addr, opcode, len);
> > > +   } else {
> > > +           mutex_lock(&text_mutex);
> > > +           text_poke(addr, opcode, len);
> > > +           mutex_unlock(&text_mutex);
> > > +   }
> > > +}
> >
> > So I don't much like do_text_poke(); why?
>
> I believe the idea was to keep memcpy for early boot before the kernel
> image is protected without going and adding if (is_module_text_address())
> all over the place.
>
> I think this can be used instead without updating all the call sites of
> text_poke_early():
>
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.=
c
> index 91057de8e6bc..f994e63e9903 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -1458,7 +1458,7 @@ void __init_or_module text_poke_early(void *addr, c=
onst void *opcode,
>                  * code cannot be running and speculative code-fetches ar=
e
>                  * prevented. Just change the code.
>                  */
> -               memcpy(addr, opcode, len);
> +               text_poke_copy(addr, opcode, len);
>         } else {
>                 local_irq_save(flags);
>                 memcpy(addr, opcode, len);
>

This alone doesn't work, as text_poke_early() is called
before addr is added to the list of module texts. So we
still use memcpy() here.

Thanks,
Song
