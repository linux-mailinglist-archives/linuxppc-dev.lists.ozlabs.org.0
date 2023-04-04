Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E39486D62BB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 15:24:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrT4X5r4yz3cKb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 23:24:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CxCzEj2L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CxCzEj2L;
	dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrT3d249Pz2yNm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Apr 2023 23:23:24 +1000 (AEST)
Received: by mail-qk1-x72b.google.com with SMTP id ay7so2185186qkb.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Apr 2023 06:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680614601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVV5FfyLXKvr30JASXaFzrtmOvguU/pSGwBivgkkCt8=;
        b=CxCzEj2L7VIhJL6LkhpoeSyjitfjUIwxyK7WygTAvIMrtL8sNfxriP0xlU7D62WQoz
         JS8ax3M/Eesvd5oi0sr1H03A3xMMSSa82fhef9qRDqrlsouM+KCZqqtCxNs6kzj4t5Ub
         F7DDt5YscrWWbseYb3G5W9hFZRpZsQPXo27yv0jzn2w9mDA1ooRuDwc7z6znLG2Vi+Bi
         tq4rA2ZMQA51NCQ7Ksdo8VwWalrmJJS5r9RCMSPpRrKxpS4no0h4o3ze6IAi22w6AMMd
         0et5DLzt+KCxhgyjPFDLnq1TYfArzjvJxF3PKXuT3UfUffLUWpYKI/WE/kzz1oDnvdpX
         Etng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680614601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVV5FfyLXKvr30JASXaFzrtmOvguU/pSGwBivgkkCt8=;
        b=06UkxbA7I3sgMMJ3KHE9oVboy/BXuIHa/ga+1od3pHUYw6CIUCOYqpfo9QnY7Tn3YC
         5kJeR4r4fFn/i7k6g/k93JO6hkOTARcJ8xPBQqFKpKI3heMxp5kDCr+I0y3/7vo8OF7L
         by9jauYFuuzW7rQf0TXPR4Ji57lvqyM9naanpGSPA2RwbMO7Rr3d7oU2+sNbsMqnZCxn
         BGhaxCg829p/b8m95vvzGJXjPhQFnzUdj2CX2mU+1dplkV400VKCEETU/Jx4rcpeGrD3
         bQyZ805GvxIJbl3C153P+rGhx1lGU2NEneqD41lTRaeDKBPaFm6tO/RJkKD62JSyJ4qB
         EyPA==
X-Gm-Message-State: AAQBX9e7mOLLVFJBxSnDp/IEhWv/xyzGfxmASVrQ5URgq4Xxn0g7hM3Q
	QNjUrjwWyAtOpq8AUSFBwkC05w8JY1yP5GVaNno=
X-Google-Smtp-Source: AKy350b/r9epx7QN6cXCoxgIbACmW4sFS0VlXrzPHDsCvgVLRBRS+bIi9gMlH812VAfYBgK5rBITGvtyCoxFOxnCyYI=
X-Received: by 2002:a05:620a:404f:b0:74a:28c4:64ea with SMTP id
 i15-20020a05620a404f00b0074a28c464eamr911755qko.6.1680614600864; Tue, 04 Apr
 2023 06:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230305205628.27385-1-ubizjak@gmail.com> <20230305205628.27385-2-ubizjak@gmail.com>
 <ZB2v+avNt52ac/+w@FVFF77S0Q05N> <CAFULd4ZCgxDYnyy--qdgKoAo_y7MbNSaQdbdBFefnFuMoM2OYw@mail.gmail.com>
 <ZB3MR8lGbnea9ui6@FVFF77S0Q05N> <ZB3QtDYuWdpiD5qk@FVFF77S0Q05N>
 <CAFULd4aFUF5k=QJD8tDp4qzm2iBF7=rNvp1SJWrg44X5hTFxtQ@mail.gmail.com>
 <ZCqoRNU8EJhKJVEu@FVFF77S0Q05N> <CAFULd4ZUnbtDYXBBbuTJnq9wLSf5cZTc=hUPxg6-8KRNA7YVeQ@mail.gmail.com>
 <ZCwj19okhYNRN8er@FVFF77S0Q05N.cambridge.arm.com>
In-Reply-To: <ZCwj19okhYNRN8er@FVFF77S0Q05N.cambridge.arm.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Tue, 4 Apr 2023 15:23:09 +0200
Message-ID: <CAFULd4ZypxQULgq-MYgzsYd8k_BV0aH0eRhggX3MHWCgvKW=Bg@mail.gmail.com>
Subject: Re: [PATCH 01/10] locking/atomic: Add missing cast to try_cmpxchg() fallbacks
To: Mark Rutland <mark.rutland@arm.com>
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
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, loongarch@lists.linux.dev, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 4, 2023 at 3:19=E2=80=AFPM Mark Rutland <mark.rutland@arm.com> =
wrote:
>
> On Tue, Apr 04, 2023 at 02:24:38PM +0200, Uros Bizjak wrote:
> > On Mon, Apr 3, 2023 at 12:19=E2=80=AFPM Mark Rutland <mark.rutland@arm.=
com> wrote:
> > >
> > > On Sun, Mar 26, 2023 at 09:28:38PM +0200, Uros Bizjak wrote:
> > > > On Fri, Mar 24, 2023 at 5:33=E2=80=AFPM Mark Rutland <mark.rutland@=
arm.com> wrote:
> > > > >
> > > > > On Fri, Mar 24, 2023 at 04:14:22PM +0000, Mark Rutland wrote:
> > > > > > On Fri, Mar 24, 2023 at 04:43:32PM +0100, Uros Bizjak wrote:
> > > > > > > On Fri, Mar 24, 2023 at 3:13=E2=80=AFPM Mark Rutland <mark.ru=
tland@arm.com> wrote:
> > > > > > > >
> > > > > > > > On Sun, Mar 05, 2023 at 09:56:19PM +0100, Uros Bizjak wrote=
:
> > > > > > > > > Cast _oldp to the type of _ptr to avoid incompatible-poin=
ter-types warning.
> > > > > > > >
> > > > > > > > Can you give an example of where we are passing an incompat=
ible pointer?
> > > > > > >
> > > > > > > An example is patch 10/10 from the series, which will fail wi=
thout
> > > > > > > this fix when fallback code is used. We have:
> > > > > > >
> > > > > > > -       } while (local_cmpxchg(&rb->head, offset, head) !=3D =
offset);
> > > > > > > +       } while (!local_try_cmpxchg(&rb->head, &offset, head)=
);
> > > > > > >
> > > > > > > where rb->head is defined as:
> > > > > > >
> > > > > > > typedef struct {
> > > > > > >    atomic_long_t a;
> > > > > > > } local_t;
> > > > > > >
> > > > > > > while offset is defined as 'unsigned long'.
> > > > > >
> > > > > > Ok, but that's because we're doing the wrong thing to start wit=
h.
> > > > > >
> > > > > > Since local_t is defined in terms of atomic_long_t, we should d=
efine the
> > > > > > generic local_try_cmpxchg() in terms of atomic_long_try_cmpxchg=
(). We'll still
> > > > > > have a mismatch between 'long *' and 'unsigned long *', but the=
n we can fix
> > > > > > that in the callsite:
> > > > > >
> > > > > >       while (!local_try_cmpxchg(&rb->head, &(long *)offset, hea=
d))
> > > > >
> > > > > Sorry, that should be:
> > > > >
> > > > >         while (!local_try_cmpxchg(&rb->head, (long *)&offset, hea=
d))
> > > >
> > > > The fallbacks are a bit more complicated than above, and are differ=
ent
> > > > from atomic_try_cmpxchg.
> > > >
> > > > Please note in patch 2/10, the falbacks when arch_try_cmpxchg_local
> > > > are not defined call arch_cmpxchg_local. Also in patch 2/10,
> > > > try_cmpxchg_local is introduced, where it calls
> > > > arch_try_cmpxchg_local. Targets (and generic code) simply define (e=
.g.
> > > > :
> > > >
> > > > #define local_cmpxchg(l, o, n) \
> > > >        (cmpxchg_local(&((l)->a.counter), (o), (n)))
> > > > +#define local_try_cmpxchg(l, po, n) \
> > > > +       (try_cmpxchg_local(&((l)->a.counter), (po), (n)))
> > > >
> > > > which is part of the local_t API. Targets should either define all
> > > > these #defines, or none. There are no partial fallbacks as is the c=
ase
> > > > with atomic_t.
> > >
> > > Whether or not there are fallbacks is immaterial.
> > >
> > > In those cases, architectures can just as easily write C wrappers, e.=
g.
> > >
> > > long local_cmpxchg(local_t *l, long old, long new)
> > > {
> > >         return cmpxchg_local(&l->a.counter, old, new);
> > > }
> > >
> > > long local_try_cmpxchg(local_t *l, long *old, long new)
> > > {
> > >         return try_cmpxchg_local(&l->a.counter, old, new);
> > > }
> >
> > Please find attached the complete prototype patch that implements the
> > above suggestion.
> >
> > The patch includes:
> > - implementation of instrumented try_cmpxchg{,64}_local definitions
> > - corresponding arch_try_cmpxchg{,64}_local fallback definitions
> > - generic local{,64}_try_cmpxchg (and local{,64}_cmpxchg) C wrappers
> >
> > - x86 specific local_try_cmpxchg (and local_cmpxchg) C wrappers
> > - x86 specific arch_try_cmpxchg_local definition
> >
> > - kernel/events/ring_buffer.c change to test local_try_cmpxchg
> > implementation and illustrate the transition
> > - arch/x86/events/core.c change to test local64_try_cmpxchg
> > implementation and illustrate the transition
> >
> > The definition of atomic_long_t is different for 64-bit and 32-bit
> > targets (s64 vs int), so target specific C wrappers have to use
> > different casts to account for this difference.
> >
> > Uros.
>
> Thanks for this!
>
> FWIW, the patch (inline below) looks good to me.

Thanks, I will prepare a patch series for submission later today.

Uros.
