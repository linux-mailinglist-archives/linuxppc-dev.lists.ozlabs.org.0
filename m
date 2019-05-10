Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A3819807
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 07:24:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450dtC2brxzDqRW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 15:24:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=2a00:1450:4864:20::243; helo=mail-lj1-x243.google.com;
 envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.b="fohbzQBc"; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450d4M57q0zDqS1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 14:47:47 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id w1so1351805ljw.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2019 21:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ImcrHBqFFEqsmpAMxzWPbx7VppKY86XVes/D/i1UVb4=;
 b=fohbzQBcRJy6wMgJSp6gpKGQZeDeRjcUTot7TfXWT2k/dGlAbqjtZpoVJQXdUZuhkf
 rTL7MWW7QI2QCVJgzMq8Wr9Jelc98wWm6uqyLy7Jp1xS9qqShXO83rXs8FRZACpgk2XU
 gfgRxfTzqX7YGmmXht0ejVHBroIkQsCZs0X9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ImcrHBqFFEqsmpAMxzWPbx7VppKY86XVes/D/i1UVb4=;
 b=UKUHI3g0aQlCEgWU18TMIzX2lQTwhIbEMOcW+36JxpzDs7NozAvrT1yjCB7lvs62tn
 lg2mlU+Mlzw/7GuoclSXPQGpOF0D3obPuB0PBip54MwU3z3xokK2IGbTdJJil6QgM/KI
 K0H/P4nCkqBB5E933l8IF49okpSM2m2qryc6QGbo4KyQVJITkubH2U3gGO3tTaFp4kW9
 grgPhKS73X+aE3gmRBm8oRdyRoDNoz6ToabsM9auNm6Iy6ZkZ9b60KGCUTRrC+6FmGUh
 aAb8YwHUsAtvONYJGuzFhHBUQfC86vtqqq694eZER+MI9VFyD9MRia1Bw7Acbdc7hfWj
 rowA==
X-Gm-Message-State: APjAAAVVCrkKTLJj799hvj0PDLyT4BDL8tT6Osb7LJwmlbBmge38iDZS
 VEjFpetay8txpBTGzipKlsx2c82iacI=
X-Google-Smtp-Source: APXvYqyYM5EAlc09emJOKkkWgKqfi72EYtLwwGoR0//2piLz6SjBPvHdxbZlMlvPcS9ByLzl6OjdPA==
X-Received: by 2002:a2e:9ada:: with SMTP id p26mr4374912ljj.167.1557463661616; 
 Thu, 09 May 2019 21:47:41 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49])
 by smtp.gmail.com with ESMTPSA id n8sm997123lfe.15.2019.05.09.21.47.39
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 21:47:40 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id y10so3164979lfl.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2019 21:47:39 -0700 (PDT)
X-Received: by 2002:ac2:43cf:: with SMTP id u15mr4557604lfl.67.1557463658025; 
 Thu, 09 May 2019 21:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190509121923.8339-1-pmladek@suse.com>
 <20190510043200.GC15652@jagdpanzerIV>
In-Reply-To: <20190510043200.GC15652@jagdpanzerIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 9 May 2019 21:47:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiP+hwSqEW0dM6AYNWUR7jXDkeueq69et6ahfUgV7hC3w@mail.gmail.com>
Message-ID: <CAHk-=wiP+hwSqEW0dM6AYNWUR7jXDkeueq69et6ahfUgV7hC3w@mail.gmail.com>
Subject: Re: [PATCH] vsprintf: Do not break early boot with probing addresses
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000166f8f05888144be"
X-Mailman-Approved-At: Fri, 10 May 2019 15:23:00 +1000
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
Cc: Petr Mladek <pmladek@suse.com>, linux-arch@vger.kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-s390@vger.kernel.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Michal Hocko <mhocko@suse.cz>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Stephen Rothwell <sfr@ozlabs.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linuxppc-dev@lists.ozlabs.org, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 "Tobin C . Harding" <me@tobin.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000166f8f05888144be
Content-Type: text/plain; charset="UTF-8"

[ Sorry about html and mobile crud, I'm not at the computer right now ]

How about we just undo the whole misguided probe_kernel_address() thing?

The excuse for is was that it would avoid crashes.

It turns out that was wrong, and that it just made things much worse.
Honestly, we haven't really had the crashes that the logic was supposed to
protect against in the first place, so by now it's clear that the whole
thing was a stupid and horrible mistake in the first place.

So let's admit that and just go back to the old sane model.

Seriously, we've never needed that odd probing. It causes issues. It's
wrong and pointless.

       Linus

On Thu, May 9, 2019, 21:32 Sergey Senozhatsky <
sergey.senozhatsky.work@gmail.com> wrote:

> On (05/09/19 14:19), Petr Mladek wrote:
> > 1. Report on Power:
> >
> > Kernel crashes very early during boot with with CONFIG_PPC_KUAP and
> > CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG
> >
> > The problem is the combination of some new code called via printk(),
> > check_pointer() which calls probe_kernel_read(). That then calls
> > allow_user_access() (PPC_KUAP) and that uses mmu_has_feature() too early
> > (before we've patched features). With the JUMP_LABEL debug enabled that
> > causes us to call printk() & dump_stack() and we end up recursing and
> > overflowing the stack.
>
> Hmm... hmm... PPC does an .opd-based symbol dereference, which
> eventually probe_kernel_read()-s. So early printk(%pS) will do
>
>         printk(%pS)
>          dereference_function_descriptor()
>           probe_kernel_address()
>            dump_stack()
>             printk(%pS)
>              dereference_function_descriptor()
>               probe_kernel_address()
>                dump_stack()
>                 printk(%pS)
>                  ...
>
> I'd say... that it's not vsprintf that we want to fix, it's
> the idea that probe_kernel_address() can dump_stack() on any
> platform. On some archs probe_kernel_address()->dump_stack()
> is going nowhere:
>  dump_stack() does probe_kernel_address(), which calls dump_stack(),
>  which calls printk(%pS)->probe_kernel_address() again and again,
>  and again.
>
>         -ss
>

--000000000000166f8f05888144be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">[ Sorry about html and mobile crud, I&#=
39;m not at the computer right now ]</div><div dir=3D"auto"><br></div>How a=
bout we just undo the whole misguided probe_kernel_address() thing?<div dir=
=3D"auto"><br></div><div dir=3D"auto">The excuse for is was that it would a=
void crashes.</div><div dir=3D"auto"><br></div><div dir=3D"auto">It turns o=
ut that was wrong, and that it just made things much worse. Honestly, we ha=
ven&#39;t really had the crashes that the logic was supposed to protect aga=
inst in the first place, so by now it&#39;s clear that the whole thing was =
a stupid and horrible mistake in the first place.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">So let&#39;s admit that and just go back to the o=
ld sane model.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Seriously=
, we&#39;ve never needed that odd probing. It causes issues. It&#39;s wrong=
 and pointless.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Linus</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, May 9, 2019, 21:32 Sergey Senozhatsk=
y &lt;<a href=3D"mailto:sergey.senozhatsky.work@gmail.com">sergey.senozhats=
ky.work@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On=
 (05/09/19 14:19), Petr Mladek wrote:<br>
&gt; 1. Report on Power:<br>
&gt; <br>
&gt; Kernel crashes very early during boot with with CONFIG_PPC_KUAP and<br=
>
&gt; CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG<br>
&gt; <br>
&gt; The problem is the combination of some new code called via printk(),<b=
r>
&gt; check_pointer() which calls probe_kernel_read(). That then calls<br>
&gt; allow_user_access() (PPC_KUAP) and that uses mmu_has_feature() too ear=
ly<br>
&gt; (before we&#39;ve patched features). With the JUMP_LABEL debug enabled=
 that<br>
&gt; causes us to call printk() &amp; dump_stack() and we end up recursing =
and<br>
&gt; overflowing the stack.<br>
<br>
Hmm... hmm... PPC does an .opd-based symbol dereference, which<br>
eventually probe_kernel_read()-s. So early printk(%pS) will do<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(%pS)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dereference_function_descriptor()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 probe_kernel_address()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dump_stack()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(%pS)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dereference_function_descri=
ptor()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 probe_kernel_address()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dump_stack()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(%pS)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
<br>
I&#39;d say... that it&#39;s not vsprintf that we want to fix, it&#39;s<br>
the idea that probe_kernel_address() can dump_stack() on any<br>
platform. On some archs probe_kernel_address()-&gt;dump_stack()<br>
is going nowhere:<br>
=C2=A0dump_stack() does probe_kernel_address(), which calls dump_stack(),<b=
r>
=C2=A0which calls printk(%pS)-&gt;probe_kernel_address() again and again,<b=
r>
=C2=A0and again.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -ss<br>
</blockquote></div>

--000000000000166f8f05888144be--
