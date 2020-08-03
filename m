Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5359023A360
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 13:34:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKwlJ4wRhzDqTq
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 21:34:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.195;
 helo=mail-oi1-f195.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKwjS03r3zDqSY
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 21:32:43 +1000 (AEST)
Received: by mail-oi1-f195.google.com with SMTP id a24so12424604oia.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 04:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ODp5lgvPXWeexmhqKkzjrjceKYAAQRDTCREmTlObIIg=;
 b=DXpeTAL64RFpHrbEjTL2gn76dHvhTVe4NIjV5YMNjeRjSS+V5XG8fdK0I6n/vJfCwT
 EUidxIwszObs2KxDKoeHctJ1IwnZ70ciiqRyKLQBsWpHDvC5mbROgdZ67yCmGCQo33/T
 zQIYNjpH8G+HZCsG4XxWyKbsviHFmLqVb5SBejMYRdLkoDSfFsxVjU0qkvw2YENDslX4
 G4z7pa9LHQYwuWTHqZiitlp8oKX1htSz/lPfy0PedvHlmtlamzG+6DCpJ4OvMssHoNhV
 90cX2FKINHWBdNup6npxW+VWSWhTOUYLPbeK5qkud4qGj0c7MDaWO1Gj99nH/iolALp5
 yVCg==
X-Gm-Message-State: AOAM5317mZG6jr1+79qR4NAQ/DsebW2moyyIVfSPUbXKgxweC5isotu0
 F+TQyI8RaJFm4o+hLK1ul7A0KxIKZrEOwWKzAE4=
X-Google-Smtp-Source: ABdhPJyPFQ4bw8IbXQ+CjhalgL4Bx9xrlY7fHPl0cviem9in0yCgtWtlZ6PfpQU6UGJ0f3n0i4tMiNiRZ3XlbDZ64t8=
X-Received: by 2002:aca:adc4:: with SMTP id
 w187mr11723507oie.153.1596454359917; 
 Mon, 03 Aug 2020 04:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200624035920.835571-1-natechancellor@gmail.com>
 <CAMuHMdU_KfQ-RT_nev5LgN=Vj_P97Fn=nwRoC6ZREFLa3Ysj7w@mail.gmail.com>
 <20200720210252.GO30544@gate.crashing.org>
 <CAMuHMdUmHE-KVQuo=b2rn9EPgmnqSDi4i16NPbL5rXLLSCoyKg@mail.gmail.com>
 <87zh7cyoi7.fsf@mpe.ellerman.id.au>
In-Reply-To: <87zh7cyoi7.fsf@mpe.ellerman.id.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Aug 2020 13:32:28 +0200
Message-ID: <CAMuHMdXEsTuRkt5-dt08DuxHGLpQ=dZiJsNzff6gydgnzoPTLQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc/boot: Use address-of operator on section symbols
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Arnd Bergmann <arnd@arndb.de>, Geoff Levand <geoff@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Mon, Aug 3, 2020 at 1:09 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> > On Mon, Jul 20, 2020 at 11:03 PM Segher Boessenkool
> > <segher@kernel.crashing.org> wrote:
> >> On Sat, Jul 18, 2020 at 09:50:50AM +0200, Geert Uytterhoeven wrote:
> >> > On Wed, Jun 24, 2020 at 6:02 AM Nathan Chancellor
> >> > <natechancellor@gmail.com> wrote:
> >> > >         /* If we have an image attached to us, it overrides anything
> >> > >          * supplied by the loader. */
> >> > > -       if (_initrd_end > _initrd_start) {
> >> > > +       if (&_initrd_end > &_initrd_start) {
> >> >
> >> > Are you sure that fix is correct?
> >> >
> >> >     extern char _initrd_start[];
> >> >     extern char _initrd_end[];
> >> >     extern char _esm_blob_start[];
> >> >     extern char _esm_blob_end[];
> >> >
> >> > Of course the result of their comparison is a constant, as the addresses
> >> > are constant.  If clangs warns about it, perhaps that warning should be moved
> >> > to W=1?
> >> >
> >> > But adding "&" is not correct, according to C.
> >>
> >> Why not?
> >>
> >> 6.5.3.2/3
> >> The unary & operator yields the address of its operand.  [...]
> >> Otherwise, the result is a pointer to the object or function designated
> >> by its operand.
> >>
> >> This is the same as using the name of an array without anything else,
> >> yes.  It is a bit clearer if it would not be declared as array, perhaps,
> >> but it is correct just fine like this.
> >
> > Thanks, I stand corrected.
> >
> > Regardless, the comparison is still a comparison between two constant
> > addresses, so my fear is that the compiler will start generating
> > warnings for that in the near or distant future, making this change
> > futile.
>
> They're not constant at compile time though. So I don't think the
> compiler could (sensibly) warn about that? (surely!)

They're constant, but the compiler doesn't know their value.
That doesn't change by (not) using the address-of operator.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
