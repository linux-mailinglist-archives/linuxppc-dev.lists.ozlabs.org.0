Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E10E26F5C40
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 May 2023 18:52:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QBNK75zdnz3cdj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 May 2023 02:52:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AO0C4SNo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AO0C4SNo;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QBNJC6mJ2z2xdw
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 May 2023 02:51:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E2A5629CC
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 May 2023 16:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90740C4339B
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 May 2023 16:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683132680;
	bh=bQNDzf+GFVEGlhcokubtvQUs4W+6eXzGORjfjoZib/Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AO0C4SNovMLwUvp1ofjEutpCdQhJ0wr0he18a0CraRys/nPxwm3HrxJlJ7q8uWVLK
	 TmwEUwBBu1AwBxAzESET8ZpB1SNSvpXma0mQA5qoD5nNX0vi6oMS5TwYbNefSDIrto
	 hHzuUPpw9+iOLnA0qB1wGxh2MyclWEnPhTtesKKb6uxB9z8ZC5GjZLFBURGHefcpzM
	 gb1vwSAnJiG6Cy1D7kaE/0l270Wjr335W/+FALBy9t+uOqn5i51JTwoHAooG3O/i6k
	 orlcIllP87RUU2Gux21mNPRZMCZZaCsq3LaFwhXBeY0Sv+VoQd9j+H+Uwt4HNbB6IX
	 No8N/a7IC7nwg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ac733b813fso11509841fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 May 2023 09:51:20 -0700 (PDT)
X-Gm-Message-State: AC+VfDwoH4F3Gp0GuVH7lsTCSMLngKwUbbrlE56VJsSWL23YTnLsVfjk
	XEL/FMBy7tXiik6m/waWaX0j193U+RyBQWD2Ng==
X-Google-Smtp-Source: ACHHUZ6c3K8r3ypRhvI2ll4kOd1r9J69xD3kghVJZQ6YZDME21fNdkSWvlJ55GrAailLHQoCpMp+J28QCx/5BA02Wwc=
X-Received: by 2002:a2e:920c:0:b0:2a1:ab4a:153d with SMTP id
 k12-20020a2e920c000000b002a1ab4a153dmr164012ljg.29.1683132678617; Wed, 03 May
 2023 09:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <301595ad-0edf-2113-b55f-f5b8051ed24c@xenosoft.de>
 <87ednz6q0i.fsf@mail.lhotse> <3fa42c8c-09bd-d0f0-401b-315b484f4bb0@xenosoft.de>
 <df17df39-304b-d638-9aaa-6194b1ac4d47@csgroup.eu>
In-Reply-To: <df17df39-304b-d638-9aaa-6194b1ac4d47@csgroup.eu>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 May 2023 11:51:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLZhWZqS7mcyvAEu=m_TmkoZ5V4h54Jh25+Ms0J1_z9Fw@mail.gmail.com>
Message-ID: <CAL_JsqLZhWZqS7mcyvAEu=m_TmkoZ5V4h54Jh25+Ms0J1_z9Fw@mail.gmail.com>
Subject: Re: [PASEMI NEMO] Boot issue with the PowerPC updates 6.4-1
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Christian Zigotzky <chzigotzky@xenosoft.de>, Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Olof Johansson <olof@lixom.net>, Darren Stevens <darren@stevens-zone.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 3, 2023 at 11:27=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> +Rob as he's the commit's Author.
>
> Le 03/05/2023 =C3=A0 17:46, Christian Zigotzky a =C3=A9crit :
> > On 02 May 2023 at 11:28 am, Michael Ellerman wrote:
> >> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
> >>> Hello,
> >>>
> >>> Our PASEMI Nemo board [1] doesn't boot with the PowerPC updates 6.4-1
> >>> [2].
> >>>
> >>> The kernel hangs right after the booting Linux via __start() @
> >>> 0x0000000000000000 ...
> >>>
> >>> I was able to revert the PowerPC updates 6.4-1 [2] with the following
> >>> command: git revert 70cc1b5307e8ee3076fdf2ecbeb89eb973aa0ff7 -m 1
> >>>
> >>> After a re-compiling, the kernel boots without any problems without t=
he
> >>> PowerPC updates 6.4-1 [2].
> >>>
> >>> Could you please explain me, what you have done in the boot area?
> >> There's a few possibilities, but nothing obvious.
> >>
> >> To begin with can you please test the following commits?
> >>
> >> 77e69ee7ce07
> >> e4ab08be5b49
> >> eeac8ede1755
> >>
> >> cheers
> > git revert e4ab08be5b4902e5b350b0e1e1a3c25eb21d76d4
> >
> > [master 0086e2cbbec0] Revert "powerpc/isa-bridge: Remove open coded
> > "ranges" parsing"
> >   1 file changed, 129 insertions(+), 37 deletions(-)
> >
> > After a recompiling it boots without any problems.
> >
> > e4ab08be5b49 -- powerpc/isa-bridge: Remove open coded "ranges" parsing
> > is the bad commit.

Could I get a DT file for this board?

In the meantime, just revert this commit. I don't think I'll be able
to fix it before I'm out on sabbatical.

Rob
