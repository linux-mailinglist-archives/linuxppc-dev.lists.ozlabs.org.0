Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8242748A06
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 19:18:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=XaolOQWQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qx5wv4Hz7z3bsr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 03:18:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=XaolOQWQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx5w04XJKz304b
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 03:18:07 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-c1aad78d5b2so1463413276.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 10:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688577484; x=1691169484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7jIf9i3ksWGvPsicxdNnPgtrbo3MzQISW/C0qv0Qbw=;
        b=XaolOQWQ4jnES3E/8iNwVuZyh2DV6FVlo/omaa4EKlgqNljBwOJdMKU8RPHwO8Vl9V
         lI/dO6+1/B50grN6xvSluk0s8yvAKU2usA2Qq9fla+PAUdftTcmU4qSWnXuZygaTyzfo
         4e4D8uqf9vxe5DiA3sfIYLuM8uzo3qC+kYpEwv6XrtK0BBJUIllmBcQl9iQyHmFrs7Iv
         vm/OelYF9SLZCXvTdLOb/kNYOZ1tZ1mmSOL0oqBnRd3QVCZbSoSJyFSWHXQTPNRqUUCe
         6jkyRy/x3z8naQL6QTG813D/HfD/Nhw/vIw1oFjsNIAAz5cz4Xbe8KFPfVcGaTMG80rK
         n1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688577484; x=1691169484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7jIf9i3ksWGvPsicxdNnPgtrbo3MzQISW/C0qv0Qbw=;
        b=Ax939pWxb0fX6+aecqTJMf38Or+JrMsS1U7Ri5VvyKgRq58D1zzJDsL31yoGDH959U
         OnWoGaUQOhtvgDIUbR+P554C7e07csadrWkz32kBFdv7Pbt/rXYEZVEa7jtaAxjsbLAm
         QLFpJgcSjpB1t5T5AzRghhQ57O6X0iUwNQr8cByXeH9HFyFFk4Fm5tjz0WSbCLoJUqGB
         RF0k5M5oghnNkY/LZv8YXkbHFNuzoo/oEt9fSrH7MtNwj0cm4bKF7tSJIYU4xQcWGAxL
         47QdqK0btQnowLtxmIMVbarCFpSsWpXJjad3cpIOR5e1R1VM25exIk+fkcxr5jcSZErn
         T3zg==
X-Gm-Message-State: ABy/qLZVhC29mQbVjO0lk/eQIKnkR5tz2Bpjywb2fC0I1nzJiD+X1b/y
	RzPucxqcV8himTgYv6OhfOdfkNpa1/y9lD3dl2jWdA==
X-Google-Smtp-Source: APBJJlF5Lu4LTcBLFU5Z+wtDAT4LAHiYQvjgJVRmySjeBhhbtcDJ5fU6Lnob/EjgPne994hRcVi0JgDWA1h6Lpg+q6I=
X-Received: by 2002:a25:ef47:0:b0:c42:2b05:17a5 with SMTP id
 w7-20020a25ef47000000b00c422b0517a5mr1942870ybm.11.1688577483813; Wed, 05 Jul
 2023 10:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
 <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info> <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
 <CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
 <2023070359-evasive-regroup-f3b8@gregkh> <CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
 <2023070453-plod-swipe-cfbf@gregkh> <20230704091808.aa2ed3c11a5351d9bf217ac9@linux-foundation.org>
 <CAJuCfpE_WjRQoDT1XnvBghCH-kpqk+pfcBJGyDnK7DZLMVG5Mw@mail.gmail.com>
 <2023070509-undertow-pulverize-5adc@gregkh> <7668c45a-70b1-dc2f-d0f5-c0e76ec17145@leemhuis.info>
 <20230705084906.22eee41e6e72da588fce5a48@linux-foundation.org> <CAJuCfpGQK+Z0WPoRjBbSgD5m9wXyP7NJpu9fjGALmGu=6AGYaw@mail.gmail.com>
In-Reply-To: <CAJuCfpGQK+Z0WPoRjBbSgD5m9wXyP7NJpu9fjGALmGu=6AGYaw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 5 Jul 2023 10:17:52 -0700
Message-ID: <CAJuCfpGwE+ZvBVjp__9aQcbmq8MpBbeS4xUjFkjJUQY+fwyryg@mail.gmail.com>
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
Cc: Jacob Young <jacobly.alt@gmail.com>, Linux regressions mailing list <regressions@lists.linux.dev>, Greg KH <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, "Linux regression tracking \(Thorsten Leemhuis\)" <regressions@leemhuis.info>, Bagas Sanjaya <bagasdotme@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 5, 2023 at 9:14=E2=80=AFAM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Wed, Jul 5, 2023 at 8:49=E2=80=AFAM Andrew Morton <akpm@linux-foundati=
on.org> wrote:
> >
> > On Wed, 5 Jul 2023 10:51:57 +0200 "Linux regression tracking (Thorsten =
Leemhuis)" <regressions@leemhuis.info> wrote:
> >
> > > >>> I'm in wait-a-few-days-mode on this.  To see if we have a backpor=
table
> > > >>> fix rather than disabling the feature in -stable.
> > >
> > > Andrew, how long will you remain in "wait-a-few-days-mode"? Given wha=
t
> > > Greg said below and that we already had three reports I know of I'd
> > > prefer if we could fix this rather sooner than later in mainline --
> > > especially as Arch Linux and openSUSE Tumbleweed likely have switched=
 to
> > > 6.4.y already or will do so soon.
> >
> > I'll send today's 2-patch series to Linus today or tomorrow.
>
> I need to make a correction to the patch fixing the issue (the first
> one in the series) and will post it within an hour. Thanks!

Corrected patch is posted at
https://lore.kernel.org/all/20230705171213.2843068-2-surenb@google.com/.
The other patch is unchanged but I posted v3 of the entire patchset
anyway.
Andrew, could you please replace the old version with this one before
sending it to Linus?
Thanks,
Suren.
