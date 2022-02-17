Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9514B958B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 02:37:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzcrZ5C2rz30Mj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 12:37:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=edu3aKwK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1130;
 helo=mail-yw1-x1130.google.com; envelope-from=wedsonaf@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=edu3aKwK; dkim-atps=neutral
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzZt70KYcz2ynt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 11:08:30 +1100 (AEDT)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2d646fffcc2so15896577b3.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 16:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MJswp/06z6H2zTidNluNJt5ucFccyexftvmJcY3aUJo=;
 b=edu3aKwKRZZvgZ+3Mv5JKsCI8h6eWJiJlaVfXQqpb4qEW9uFQXWWBMMnUGtpKO0QCa
 QNEdU9+SnPoPKKprTln2NYIats33kIpC9A1zQvr3+m/ub59mYDmKW1oUDOf/7EEQNInV
 +AC1DQFIRp+1nFPGJI+Gy5pr7yEyqeXWKWoqQ/hWRIizbEEqN5vLBW0qHCTep77hnkX0
 YN2iwUgtlt3pYFL6o/d1J0ErDwAbswMBi0ChNNns126kdgDqll9Hq+7fSjyCw7itb3t+
 9nT3EbSpUQoxdPzmZqoYBYLrIMVJs8+OnvAQpxBzqGc9Lgt8gCKcWVDRkB8ZNKBVozRO
 2BjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MJswp/06z6H2zTidNluNJt5ucFccyexftvmJcY3aUJo=;
 b=yHjJQqTvgQ/e04OUAfZ/2YfYSOFM+HornEuwMzExP3ES/6NjeYwkkiq/x4kX3FhVyk
 NyzmmD7Mg3PhawSMIC9q/3L9JCKZoQJ+CnuDjYyrggxaAKg9UObwVAIxWUM6nHd6wwTQ
 +3bNpHIh8Ktp1FRagZflgEjIWs4sgOwVYRee6Jr6ekQpzieZu3il2EcvWe8K+XMh+gyI
 gX90+Ff/uw+Be6M/sqHLhvrq52+U3qG+hQiSj+HRtczc//GDIB7mDbo3H1K2tQmC8ch5
 2o6UsDU47R2kagFbdhZ684CavfcuF8BAX+r0mxbx26f3agQ2b3+uGcRZ04PcaaznaAsB
 OIrA==
X-Gm-Message-State: AOAM532vosTFNUnhXT9x8aW8if8WeNCQPMxRm7VONsVx9KjHhDZ5iQcO
 red7AnsEUN8UaROAHlLTM/GuRK9v1Kyp9QJ2gjkg
X-Google-Smtp-Source: ABdhPJwI84Dtw8jNHVgF7S0S2h65D1i+hK2lqsMSC1l0s2mxEOLNgAFiNO08Ui8MHdSwZFiPoMLmW7GiSIqirBAnNGY=
X-Received: by 2002:a0d:d0c6:0:b0:2d0:3a5a:f30b with SMTP id
 s189-20020a0dd0c6000000b002d03a5af30bmr352653ywd.476.1645056507846; Wed, 16
 Feb 2022 16:08:27 -0800 (PST)
MIME-Version: 1.0
References: <20220202055123.2144842-1-wedsonaf@google.com>
 <CAMKQLN+Q3asVqP3MZVFZO66CvZVVfGOZn=pMXmiNqZ7t2i55wg@mail.gmail.com>
 <8735kknzeh.fsf@mpe.ellerman.id.au>
In-Reply-To: <8735kknzeh.fsf@mpe.ellerman.id.au>
From: Wedson Almeida Filho <wedsonaf@google.com>
Date: Thu, 17 Feb 2022 00:08:16 +0000
Message-ID: <CAMKQLN+axK+Uf2=DAf6FzLX-2CbB3XWat3_aC27-oVirsu8zEw@mail.gmail.com>
Subject: Re: [PATCH] powerpc/module_64: use module_init_section instead of
 patching names
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: multipart/alternative; boundary="000000000000c985d005d82b9046"
X-Mailman-Approved-At: Thu, 17 Feb 2022 12:36:47 +1100
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000c985d005d82b9046
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Feb 2022 at 11:27, Michael Ellerman <mpe@ellerman.id.au> wrote:

> Wedson Almeida Filho <wedsonaf@google.com> writes:
> > Hi Michael,
> >
> > On Wed, 2 Feb 2022 at 05:53, Wedson Almeida Filho <wedsonaf@google.com>
> wrote:
> >>
> >> Without this patch, module init sections are disabled by patching their
> >> names in arch-specific code when they're loaded (which prevents code in
> >> layout_sections from finding init sections). This patch uses the new
> >> arch-specific module_init_section instead.
> >>
> >> This allows modules that have .init_array sections to have the
> >> initialisers properly called (on load, before init). Without this patch,
> >> the initialisers are not called because .init_array is renamed to
> >> _init_array, and thus isn't found by code in find_module_sections().
> >>
> >> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> >> ---
> >>  arch/powerpc/kernel/module_64.c | 11 ++++++-----
> >>  1 file changed, 6 insertions(+), 5 deletions(-)
> ...
> >
> > Would any additional clarification from my part be helpful here?
>
> Just more patience ;)
>
> > I got an email saying it was under review (and checks passed) but
> > nothing appears to have happened since.
>
> I actually put it in next late last week, but the emails got delayed due
> to various gremlins.
>

Yes, I see it, thank you!

Cheers

--000000000000c985d005d82b9046
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 15 Feb 2022 at 11:27, Mic=
hael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au">mpe@ellerman.id.au<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">W=
edson Almeida Filho &lt;<a href=3D"mailto:wedsonaf@google.com" target=3D"_b=
lank">wedsonaf@google.com</a>&gt; writes:<br>
&gt; Hi Michael,<br>
&gt;<br>
&gt; On Wed, 2 Feb 2022 at 05:53, Wedson Almeida Filho &lt;<a href=3D"mailt=
o:wedsonaf@google.com" target=3D"_blank">wedsonaf@google.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; Without this patch, module init sections are disabled by patching =
their<br>
&gt;&gt; names in arch-specific code when they&#39;re loaded (which prevent=
s code in<br>
&gt;&gt; layout_sections from finding init sections). This patch uses the n=
ew<br>
&gt;&gt; arch-specific module_init_section instead.<br>
&gt;&gt;<br>
&gt;&gt; This allows modules that have .init_array sections to have the<br>
&gt;&gt; initialisers properly called (on load, before init). Without this =
patch,<br>
&gt;&gt; the initialisers are not called because .init_array is renamed to<=
br>
&gt;&gt; _init_array, and thus isn&#39;t found by code in find_module_secti=
ons().<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Wedson Almeida Filho &lt;<a href=3D"mailto:wedsonaf=
@google.com" target=3D"_blank">wedsonaf@google.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 arch/powerpc/kernel/module_64.c | 11 ++++++-----<br>
&gt;&gt;=C2=A0 1 file changed, 6 insertions(+), 5 deletions(-)<br>
...<br>
&gt;<br>
&gt; Would any additional clarification from my part be helpful here?<br>
<br>
Just more patience ;)<br>
<br>
&gt; I got an email saying it was under review (and checks passed) but<br>
&gt; nothing appears to have happened since.<br>
<br>
I actually put it in next late last week, but the emails got delayed due<br=
>
to various gremlins.<br></blockquote><div><br></div><div>Yes, I see it, tha=
nk you!</div><div><br></div><div>Cheers=C2=A0</div><div>=C2=A0</div></div><=
/div>

--000000000000c985d005d82b9046--
