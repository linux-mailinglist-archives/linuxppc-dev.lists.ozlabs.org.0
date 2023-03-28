Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A8B6CB785
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 08:54:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm0ly61sVz3fBV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 17:54:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RhAoxNcH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RhAoxNcH;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pm0l06Ws7z2xvL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 17:53:32 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso14239687pjb.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679986411;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtnCUz/Z4iXZV6iYXbbsymcTGbAhqU8t0l4dnsbYOU8=;
        b=RhAoxNcHJ0Xyin7wZ0JGQZ5J9Mlohi0V3RVGoVxR+RMHPTS88uCGN+GqIvmIfjcvMe
         PJ/fLIBpan4JOTN0S9Y8XYAMpDvJXlivSIFiAHN+BmOuqMuQenDO2dD0ekRRel6uEaNH
         6So+x0Um7VNMwnNrj+sFO7t0hma9aKKQfK6J+PhrVyv/xFu/yzVTh7fjZaEF3wcaOEBp
         y+78OgIX8BjflxL2YyEYrabisvSvWi8GiAnElmvHfr8LLqhGjK3xY0yn4y5F6mnzuo8j
         24TNEE2/A7ZIGbMTLQ7TsvDjGyHYetzjXVde2SpvYlH/gc7Fmf549759UBa+tpqjOpgv
         Ttbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679986411;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NtnCUz/Z4iXZV6iYXbbsymcTGbAhqU8t0l4dnsbYOU8=;
        b=hewGpkDlXBtUFOdm1K3aK0+PQTUGmENJw3nN2xx1AOjZAcwYpSPrl223ZsDJ+dMYl3
         kFTegW/+YYWeDQtFR+F6OF9TVtC3Bm6tYsQAtun4JWoS3jDMjK3cfeZvYcXRwqEA15SE
         anB2ChxIUYmizxejhTxopvEE900wcKntAce4tdwNG0lnDbJGhXC6XmFm3vpnkcnDk574
         7LcYPEyiHiaik7oJX4GFYh6JdOiWEFThNDHi1J0Pu+YzCtJd75Ss6sxmGSibJKUdDHoz
         6WsfMP1WF4F9vL565B9bDyM2wDfKCJZ0vSdPesAV8F96Ebu/ikR2rQYIctrAo/b2IEuD
         bRCA==
X-Gm-Message-State: AO0yUKWh0qqb9ajXIFfIaCdWNAw9rFiN1JeQQxWyAQNs6WP6+0HH9Oez
	v9LnZu5FcEDw4vG0akJtvpyyE7sWkj8=
X-Google-Smtp-Source: AK7set+w1Jyeovc8T3Hj6tVvC0KVS0ElNBxL11VTGj18amGdUMV149QQKck/gPQQe+tv7r3cIkRxMg==
X-Received: by 2002:a05:6a20:4faa:b0:cc:eb3b:56e9 with SMTP id gh42-20020a056a204faa00b000cceb3b56e9mr12095774pzb.1.1679986410870;
        Mon, 27 Mar 2023 23:53:30 -0700 (PDT)
Received: from localhost (118-211-28-230.tpgi.com.au. [118.211.28.230])
        by smtp.gmail.com with ESMTPSA id z20-20020aa791d4000000b00625c37469a4sm20863759pfa.97.2023.03.27.23.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 23:53:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Mar 2023 16:53:26 +1000
Message-Id: <CRHTH8OWIYJ3.3MR13UEJQXEN@bobo>
Subject: Re: [kvm-unit-tests v3 03/13] powerpc: Add some checking to
 exception handler install
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>, <kvm@vger.kernel.org>
X-Mailer: aerc 0.13.0
References: <20230327124520.2707537-1-npiggin@gmail.com>
 <20230327124520.2707537-4-npiggin@gmail.com>
 <229dd5e2-b757-d28b-b9db-0d9efce4c5d1@redhat.com>
In-Reply-To: <229dd5e2-b757-d28b-b9db-0d9efce4c5d1@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Mar 28, 2023 at 12:39 AM AEST, Thomas Huth wrote:
> On 27/03/2023 14.45, Nicholas Piggin wrote:
> > Check to ensure exception handlers are not being overwritten or
> > invalid exception numbers are used.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> > Since v2:
> > - New patch
> >=20
> >   lib/powerpc/processor.c | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> >=20
> > diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
> > index ec85b9d..70391aa 100644
> > --- a/lib/powerpc/processor.c
> > +++ b/lib/powerpc/processor.c
> > @@ -19,11 +19,23 @@ static struct {
> >   void handle_exception(int trap, void (*func)(struct pt_regs *, void *=
),
> >   		      void * data)
> >   {
> > +	if (trap & 0xff) {
>
> You could check for the other "invalid exception handler" condition here=
=20
> already, i.e. if (trap & ~0xf00) ...
>
> I'd maybe simply do an "assert(!(trap & ~0xf00))" here.
>
> > +		printf("invalid exception handler %#x\n", trap);
> > +		abort();
> > +	}
> > +
> >   	trap >>=3D 8;
> >  =20
> >   	if (trap < 16) {
>
> ... then you could get rid of the if-statement here and remove one level =
of=20
> indentation in the code below.

Yes that's the  way to do it. I feel embarrassed for not thinking
of it :)

Thanks,
Nick

>
> > +		if (func && handlers[trap].func) {
> > +			printf("exception handler installed twice %#x\n", trap);
> > +			abort();
> > +		}
> >   		handlers[trap].func =3D func;
> >   		handlers[trap].data =3D data;
> > +	} else {
> > +		printf("invalid exception handler %#x\n", trap);
> > +		abort();
> >   	}
> >   }
> >  =20
>
>   Thomas

