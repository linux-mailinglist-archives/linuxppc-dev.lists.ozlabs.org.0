Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E00DC747D3B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 08:43:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=duK/kR6w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qwqqg5PVCz30fk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 16:43:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=duK/kR6w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qwqpm2GFGz2ydR
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 16:42:38 +1000 (AEST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-579dd20b1c8so47861607b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jul 2023 23:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688539350; x=1691131350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKSBJo7irT0I1bKzFBpDIxHtHbxTle2uX3bUt2F2nbk=;
        b=duK/kR6wU/iAXJmniLW+LT8JJl6U+gozPaVd6mh03l+jOCB3j14H418NCc5cU5Rj7r
         1C3INGUblOKvd3R+b28qXqXfFDE+g+DwxJvpWHp4otvTQSNEWrha+9ddRwCAEhz4wdms
         uTA1sxh1BXm2tEAPz8c0wltHdkxl8jpxDgdT65YgoFmyqbApyvGNz1pH5fD/UvvqB3T5
         C3ifZ7W8p/gZwvhuqcdzRVuNFob56kn+dP5I3vw7FZMa78TQedwHelowsOSVHQFCGAEc
         8sVsEtXXQPzNOJDTyMTEFGlJXtUTwn87b9aQL0sEt/68f2v2QmugHo6Tmqf+aQKd53+q
         hm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688539350; x=1691131350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKSBJo7irT0I1bKzFBpDIxHtHbxTle2uX3bUt2F2nbk=;
        b=IBr1CRstcE5I514oRZL4f2EmODoU9nlpbKBaqhSFCuiMkfEbZQJxXa+fe2ObWBI9HP
         tKCv9xtanM9ZmppaTUwphAZJnU5QZu/VfYH+Y0Gc0R2vNEAk2gRzAPFplf7WCLqG53LL
         cJV9RgZlQiTYk+PAiHx5sfXl9anMAZKKExFykJr20fz04OKXPTOePONEuVPrZRGoD9pu
         J22zLAw3MOC7hAW0Z5CZxE3HfRHA/tHG1IIbbFy0fv8Z00C7vVe2Liz3Z7qr1pIPeXiZ
         AByOiOdbC6okSdXbKO1L+I6UqT9ohrbIJbDmdXePjGfYmdRajwgPeiGt3KqT91wXs2Yb
         vshw==
X-Gm-Message-State: ABy/qLa1nMWjw/+cCivQXAQGXefILEPUACeCFlRe6RvSv4p/J7gJjy/l
	84n/8Osiu1hbJoxT0Pl07nIzeHxC2waooMQvb9NcZQ==
X-Google-Smtp-Source: APBJJlHAWgde7m2RXt1Ev1tbVGxPLjTAl4oWP3/x/U5RMysDIAF74aeukOVtDnUyOkuuv1arhWie5Ne6KoGdiAfYUAI=
X-Received: by 2002:a0d:d9c3:0:b0:56f:fa56:4c32 with SMTP id
 b186-20020a0dd9c3000000b0056ffa564c32mr10994044ywe.52.1688539350394; Tue, 04
 Jul 2023 23:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
 <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info> <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
 <CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
 <2023070359-evasive-regroup-f3b8@gregkh> <CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
 <2023070453-plod-swipe-cfbf@gregkh> <20230704091808.aa2ed3c11a5351d9bf217ac9@linux-foundation.org>
 <CAJuCfpE_WjRQoDT1XnvBghCH-kpqk+pfcBJGyDnK7DZLMVG5Mw@mail.gmail.com>
 <20230704142846.524daa14ff921ed7eb534594@linux-foundation.org> <CAJuCfpFA3NudeyUyL65B3rnt-8sk1cnoh0uESYuS+LaDsGZu+g@mail.gmail.com>
In-Reply-To: <CAJuCfpFA3NudeyUyL65B3rnt-8sk1cnoh0uESYuS+LaDsGZu+g@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 4 Jul 2023 23:42:19 -0700
Message-ID: <CAJuCfpFkB3OoahH6URzWi+4L50daNGqDVPeUaF5GGuez5tLk8w@mail.gmail.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
To: Andrew Morton <akpm@linux-foundation.org>
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
Cc: Jacob Young <jacobly.alt@gmail.com>, Linux regressions mailing list <regressions@lists.linux.dev>, Greg KH <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 4, 2023 at 3:04=E2=80=AFPM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Tue, Jul 4, 2023 at 2:28=E2=80=AFPM Andrew Morton <akpm@linux-foundati=
on.org> wrote:
> >
> > On Tue, 4 Jul 2023 13:22:54 -0700 Suren Baghdasaryan <surenb@google.com=
> wrote:
> >
> > > On Tue, Jul 4, 2023 at 9:18=E2=80=AFAM Andrew Morton <akpm@linux-foun=
dation.org> wrote:
> > > >
> > > > On Tue, 4 Jul 2023 09:00:19 +0100 Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> > > >
> > > > > > > > > Thanks! I'll investigate this later today. After discussi=
ng with
> > > > > > > > > Andrew, we would like to disable CONFIG_PER_VMA_LOCK by d=
efault until
> > > > > > > > > the issue is fixed. I'll post a patch shortly.
> > > > > > > >
> > > > > > > > Posted at: https://lore.kernel.org/all/20230703182150.21935=
78-1-surenb@google.com/
> > > > > > >
> > > > > > > As that change fixes something in 6.4, why not cc: stable on =
it as well?
> > > > > >
> > > > > > Sorry, I thought since per-VMA locks were introduced in 6.4 and=
 this
> > > > > > patch is fixing 6.4 I didn't need to send it to stable for olde=
r
> > > > > > versions. Did I miss something?
> > > > >
> > > > > 6.4.y is a stable kernel tree right now, so yes, it needs to be i=
ncluded
> > > > > there :)
> > > >
> > > > I'm in wait-a-few-days-mode on this.  To see if we have a backporta=
ble
> > > > fix rather than disabling the feature in -stable.
> > >
> > > Ok, I think we have a fix posted at [2]  and it's cleanly applies to
> > > 6.4.y stable branch as well. However fork() performance might slightl=
y
> > > regress, therefore disabling per-VMA locks by default for now seems t=
o
> > > be preferable even with this fix (see discussion at
> > > https://lore.kernel.org/all/54cd9ffb-8f4b-003f-c2d6-3b6b0d2cb7d9@goog=
le.com/).
> > > IOW, both [1] and [2] should be applied to 6.4.y stable. Both apply
> > > cleanly and I CC'ed stable on [2]. Greg, should I send [1] separately
> > > to stable@vger?
> > >
> > > [1] https://lore.kernel.org/all/20230703182150.2193578-1-surenb@googl=
e.com/
> >
> > This one isn't sufficient for .configs which already have
> > PER_VMA_LOCK=3Dy.  Using `depends on BROKEN' would be better.
> >
> > > [2] https://lore.kernel.org/all/20230704200656.2526715-1-surenb@googl=
e.com/
> > >
> >
> > We're still awaiting tester input on this?
>
> Yeah, and it seems to be negative... Anyway, I'll post a dependency on BR=
OKEN.

I posted the patchset at
https://lore.kernel.org/all/20230705063711.2670599-1-surenb@google.com/
CC'ing stable@vger with the cover letter explaining the situation. The
negative report might have been a fluke, so let's wait for more
testing. In the meantime we can disable the feature by applying the
last patch in that series.

>
> >
> > I think a clean new fully-changelogged two-patch series would be the
> > best way to handle this.  Please ensure that the [0/2] intro clearly
> > explains what we're proposing here, and why.

Done.

> >
> > Also, "might slightly regress" is a bit weak.  These things are
> > measurable, no?  Because a better solution would be to fix 6.4.x and
> > mainline and leave it at that.

They are measurable and they were included in the fix I posted. I
added the numbers in the new cover letter as well.
Thanks,
Suren.

> >
