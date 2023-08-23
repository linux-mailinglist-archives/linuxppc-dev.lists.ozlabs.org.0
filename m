Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3A1786056
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 21:08:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BbT2WBMI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWG2N5qqTz3c5m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 05:08:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BbT2WBMI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWG1S3qMwz2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 05:07:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3649562193
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 19:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E958C433C7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 19:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692817639;
	bh=RVSvLWhqUQB6+MmdE+gYscr3M5RJ7QG7NfKZTgCn9p8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BbT2WBMI3oVMLqutgb1CBas2Qx3soqd66Luskm7ByeGP5/vt2lTWQ0JkGmYW9W+MC
	 wVniEh+FnzAJX47IdhxhZjIXmoNDE6pV6/GJvmTxqWAXcnwPXOxC5Ok9UV0kquKSad
	 VtBxNeh5LqM/gZfW3lglL0+e93kk4ZbnGPl3uiqWlrGPS5DHycdwy3JKjcBpeFSU9O
	 2Gb1wEcl/wt/KETKap9GSp9me9jc0XH0MjwD1l1hHdyxT+YjBKV270+0slpUH3lxHR
	 8VyElkMop6Y7Brefg3H4HTPGo2ZSevcIEgeqF2g+Z65AS8pdxMHPnBd3p9OZQRoIYG
	 px82G4yElgy7A==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2bbad32bc79so99790341fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 12:07:19 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw252WpSxk/V72h/jhSgf3dYnO9iyA7Y5TB522mGrhIYDKgAVpM
	8KfvHLc1Ol2wisjRQe14DMpzr9y2xgWz2UeOPQ==
X-Google-Smtp-Source: AGHT+IFxdup1Kiqi+uIYfNj073uf1yswleXwMzYc0X8IUuQU//tQNBsizGTxXShOkFhTmyDUw3oBBN8mQpGvjtOHeYU=
X-Received: by 2002:a2e:81d0:0:b0:2bc:d33e:ccc5 with SMTP id
 s16-20020a2e81d0000000b002bcd33eccc5mr4501945ljg.41.1692817637284; Wed, 23
 Aug 2023 12:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230609183111.1765507-1-robh@kernel.org> <20230703030148.qqszljkgnyzt52da@vireshk-i7>
In-Reply-To: <20230703030148.qqszljkgnyzt52da@vireshk-i7>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Aug 2023 14:07:04 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLQCSHfQtYicBVYfjtcE2nJLZ=g_7ASj5LfBhOb2Y2ouw@mail.gmail.com>
Message-ID: <CAL_JsqLQCSHfQtYicBVYfjtcE2nJLZ=g_7ASj5LfBhOb2Y2ouw@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: pmac32: Use of_property_read_reg() to parse "reg"
To: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>
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
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 2, 2023 at 10:01=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> On 09-06-23, 12:31, Rob Herring wrote:
> > Use the recently added of_property_read_reg() helper to get the
> > untranslated "reg" address value.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  drivers/cpufreq/pmac32-cpufreq.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/cpufreq/pmac32-cpufreq.c b/drivers/cpufreq/pmac32-=
cpufreq.c
> > index ec75e79659ac..f53635ba16c1 100644
> > --- a/drivers/cpufreq/pmac32-cpufreq.c
> > +++ b/drivers/cpufreq/pmac32-cpufreq.c
> > @@ -378,10 +378,9 @@ static int pmac_cpufreq_cpu_init(struct cpufreq_po=
licy *policy)
> >
> >  static u32 read_gpio(struct device_node *np)
> >  {
> > -     const u32 *reg =3D of_get_property(np, "reg", NULL);
> > -     u32 offset;
> > +     u64 offset;
> >
> > -     if (reg =3D=3D NULL)
> > +     if (of_property_read_reg(np, 0, &offset, NULL) < 0)
> >               return 0;
> >       /* That works for all keylargos but shall be fixed properly
> >        * some day... The problem is that it seems we can't rely
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Is someone going to apply this?

Rob
