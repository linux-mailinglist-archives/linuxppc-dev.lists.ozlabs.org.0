Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 290B36C97A1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Mar 2023 21:29:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pl5cS71sQz3f47
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 06:29:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FEL2vNbZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FEL2vNbZ;
	dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pl5bX4w4Mz3cGH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 06:28:54 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id r187so7955463ybr.6
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 12:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679858930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGoqSojZH/9f2pXTveP8tBPP8ZFTICSBZJCZUtmlG0c=;
        b=FEL2vNbZzXmhtX5A4PbxmqoBt+gIItbE8G4MYObzwezMm3TC97WjPQxfbhRyXOoSHO
         8Yw9GEmnNWgekRyg0KUO1b75OACsXLQks2WGUU60DwjG7U/rzuvrT2uz8fIGfnUFZ0Yd
         5S1kTq1cBATn/X/z2Riua+kg0FAXGEOR0UR0H2EIkh0DIAi0zq4cTc34sS1wMT/dS43F
         eLMeipcYrg9g42vt+rkBsCHXHtPYZd0bk+N4dCy1yJlw60Ds6o4OBEZSOore82OxtM1w
         sMqt39uYl+lj/QN5XVgURyYMYF/8LkoZRzHWi7HmUDee+NJQMx0f8iMZbuS2P9V5x7JY
         xrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679858930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGoqSojZH/9f2pXTveP8tBPP8ZFTICSBZJCZUtmlG0c=;
        b=APx7HPvKxwhim1JfTm5RIFwQbKRuCPmJaFIDBbxSNQe9iHs79c1h8u/IQJpXEa9sIc
         i/WS6qEnyWJpBvE+5mF4Y+sTdKTwYcRMrt/hd7Kyf3jf0Zd7z3HstpVICTdK5u2jv7UB
         dvdKvT3ifPhEDEAm/w4CQHVJp4fNRdZGTvNyo6XYkKjHxU9LVNl9/bSaDPEdChuT/Syx
         HoiWsN2Zrs/O38pFSsaRkf08KwbhGGTI2pQeMxBNsdtOm7XCWGGorXLEvTj5/9D350d3
         Vv/BeFN7lhB/L6j2EFVpbNZqUyAt1AKuwC6mX9dhx7pnnpCPUv+7SG+MfLw38+V9heHy
         hMHA==
X-Gm-Message-State: AAQBX9f6gm8mroZqPe7TNp60ao7ZPpTZs/JmOxJADjOK2ejMZsYQHSSr
	VCtmeKQ2t7dxi4I1PrBRu9rkS+uPIoYTnsOSlFg=
X-Google-Smtp-Source: AKy350ZqrMEue00ANUn1tgzuPk4ToglTa+Veyc3QywBb5Oe/4uEkJbhTQrUUveBrMI3bliRnRcuEQkdY+85XS6umWj4=
X-Received: by 2002:a05:6902:120f:b0:b73:caa7:f05e with SMTP id
 s15-20020a056902120f00b00b73caa7f05emr5706350ybu.2.1679858930371; Sun, 26 Mar
 2023 12:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230305205628.27385-1-ubizjak@gmail.com> <20230305205628.27385-2-ubizjak@gmail.com>
 <ZB2v+avNt52ac/+w@FVFF77S0Q05N> <CAFULd4ZCgxDYnyy--qdgKoAo_y7MbNSaQdbdBFefnFuMoM2OYw@mail.gmail.com>
 <ZB3MR8lGbnea9ui6@FVFF77S0Q05N> <ZB3QtDYuWdpiD5qk@FVFF77S0Q05N>
In-Reply-To: <ZB3QtDYuWdpiD5qk@FVFF77S0Q05N>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 26 Mar 2023 21:28:38 +0200
Message-ID: <CAFULd4aFUF5k=QJD8tDp4qzm2iBF7=rNvp1SJWrg44X5hTFxtQ@mail.gmail.com>
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

On Fri, Mar 24, 2023 at 5:33=E2=80=AFPM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> On Fri, Mar 24, 2023 at 04:14:22PM +0000, Mark Rutland wrote:
> > On Fri, Mar 24, 2023 at 04:43:32PM +0100, Uros Bizjak wrote:
> > > On Fri, Mar 24, 2023 at 3:13=E2=80=AFPM Mark Rutland <mark.rutland@ar=
m.com> wrote:
> > > >
> > > > On Sun, Mar 05, 2023 at 09:56:19PM +0100, Uros Bizjak wrote:
> > > > > Cast _oldp to the type of _ptr to avoid incompatible-pointer-type=
s warning.
> > > >
> > > > Can you give an example of where we are passing an incompatible poi=
nter?
> > >
> > > An example is patch 10/10 from the series, which will fail without
> > > this fix when fallback code is used. We have:
> > >
> > > -       } while (local_cmpxchg(&rb->head, offset, head) !=3D offset);
> > > +       } while (!local_try_cmpxchg(&rb->head, &offset, head));
> > >
> > > where rb->head is defined as:
> > >
> > > typedef struct {
> > >    atomic_long_t a;
> > > } local_t;
> > >
> > > while offset is defined as 'unsigned long'.
> >
> > Ok, but that's because we're doing the wrong thing to start with.
> >
> > Since local_t is defined in terms of atomic_long_t, we should define th=
e
> > generic local_try_cmpxchg() in terms of atomic_long_try_cmpxchg(). We'l=
l still
> > have a mismatch between 'long *' and 'unsigned long *', but then we can=
 fix
> > that in the callsite:
> >
> >       while (!local_try_cmpxchg(&rb->head, &(long *)offset, head))
>
> Sorry, that should be:
>
>         while (!local_try_cmpxchg(&rb->head, (long *)&offset, head))

The fallbacks are a bit more complicated than above, and are different
from atomic_try_cmpxchg.

Please note in patch 2/10, the falbacks when arch_try_cmpxchg_local
are not defined call arch_cmpxchg_local. Also in patch 2/10,
try_cmpxchg_local is introduced, where it calls
arch_try_cmpxchg_local. Targets (and generic code) simply define (e.g.
:

#define local_cmpxchg(l, o, n) \
       (cmpxchg_local(&((l)->a.counter), (o), (n)))
+#define local_try_cmpxchg(l, po, n) \
+       (try_cmpxchg_local(&((l)->a.counter), (po), (n)))

which is part of the local_t API. Targets should either define all
these #defines, or none. There are no partial fallbacks as is the case
with atomic_t.

The core of the local_h API is in the local.h header. If the target
doesn't define its own local.h header, then asm-generic/local.h is
used that does exactly what you propose above regarding the usage of
atomic functions.

OTOH, when the target defines its own local.h, then the above
target-dependent #define path applies. The target should define its
own arch_try_cmpxchg_local, otherwise a "generic" target-dependent
fallback that calls target arch_cmpxchg_local applies. In the case of
x86, patch 9/10 enables new instruction by defining
arch_try_cmpxchg_local.

FYI, the patch sequence is carefully chosen so that x86 also exercises
fallback code between different patches in the series.

Targets are free to define local_t to whatever they like, but for some
reason they all define it to:

typedef struct {
    atomic_long_t a;
} local_t;

so they have to dig the variable out of the struct like:

#define local_cmpxchg(l, o, n) \
     (cmpxchg_local(&((l)->a.counter), (o), (n)))

Regarding the mismatch of 'long *' vs 'unsigned long *': x86
target-specific code does for try_cmpxchg:

#define __raw_try_cmpxchg(_ptr, _pold, _new, size, lock) \
({ \
bool success; \
__typeof__(_ptr) _old =3D (__typeof__(_ptr))(_pold); \
__typeof__(*(_ptr)) __old =3D *_old; \
__typeof__(*(_ptr)) __new =3D (_new); \

so, it *does* cast the "old" pointer to the type of "ptr". The generic
code does *not*. This difference is dangerous, since the compilation
of some code involving try_cmpxchg will compile OK for x86 but will
break for other targets that use try_cmpxchg fallback templates (I was
the unlucky one that tripped on this in the past). Please note that
this problem is not specific to the proposed local_try_cmpxchg series,
but affects the existing try_cmpxchg API.

Also, I don't think that "fixing" callsites is the right thing to do.
The generic code should follow x86 and cast the "old" pointer to the
type of "ptr" inside the fallback.

> The fundamenalthing I'm trying to say is that the
> atomic/atomic64/atomic_long/local/local64 APIs should be type-safe, and f=
or
> their try_cmpxchg() implementations, the type signature should be:
>
>         ${atomictype}_try_cmpxchg(${atomictype} *ptr, ${inttype} *old, ${=
inttype} new)

This conversion should be performed also for the cmpxchg family of
functions, if desired at all. try_cmpxchg fallback is just cmpxchg
with some extra code around.

Thanks,
Uros.
