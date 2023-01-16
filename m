Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFC166BB4B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 11:10:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwSTW2JTNz3cg0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 21:10:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lBW89nC3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lBW89nC3;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwSSb5BGkz3c4f
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 21:10:07 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0747460EA3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 10:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD01C4339E
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 10:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673863802;
	bh=WvUKV+LJJqo7bAhYclYeSMFCwFldg4KmpbXOAYz8QWo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lBW89nC335bSKVJufIQTqJ90AU9ql4YIY+Ppj9Gwj3YZEZSp/xPavFF4GGeXyd/RM
	 ck+8dh37dVIL5J4En4mxnCR7gJ2/yLSWAw5XQL6Tio402pzpwhcUl2xxtaAcy+onfI
	 khZWWGjbhZH02MiydW/l6V+jcb9luEFu91HBnU5hZ9l03DTfChxEV2A2l7XQUEPwj5
	 sacnw3pUmG3judnxU2OuyQmJIRBoL2P99WngbmQZhO74uE8DECcUSTMU4XfohH3JWL
	 ZycQrhEjsc2fkoPrqUaa/9INUPpD864zkw6zIK3XZ3z1ac1S0JDT1oAp4i2N4V+7xA
	 zAnFJeSynL+lQ==
Received: by mail-lj1-f170.google.com with SMTP id a37so3601249ljq.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 02:10:02 -0800 (PST)
X-Gm-Message-State: AFqh2kpUEhw2uYuYwvrIkU8A3tx5S+ptOVUiLkltXBrUiFGqBCMjTnYY
	wVB2tlC5KmHncwcPfX+CqYFbWAGcku2KDGqxQRk=
X-Google-Smtp-Source: AMrXdXuci9MgC4Yqkq9KkHHd04QolyddrXOjxcSpOm/4blocNC+0ii0paVfsFlAG2o8dCizIgUWfTcSThbA29z7ap4s=
X-Received: by 2002:a2e:96ce:0:b0:283:33fa:ee22 with SMTP id
 d14-20020a2e96ce000000b0028333faee22mr1349344ljj.415.1673863800637; Mon, 16
 Jan 2023 02:10:00 -0800 (PST)
MIME-Version: 1.0
References: <CAMj1kXEqbMEcrKYzz2-huLPMnotPoxFY8adyH=Xb4Ex8o98x-w@mail.gmail.com>
 <db6937a1-e817-2d7b-0062-9aff012bb3e8@physik.fu-berlin.de>
 <CAMj1kXEtTuaNFiKWn3cJngR0J2vr0G07HR6+5PBodtr1b7vNxg@mail.gmail.com> <9f91942e-f4bf-e38c-2bb9-b32941b6d5f1@physik.fu-berlin.de>
In-Reply-To: <9f91942e-f4bf-e38c-2bb9-b32941b6d5f1@physik.fu-berlin.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 16 Jan 2023 11:09:49 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH1SjPrPWyQbsYUHhVfgWH_p-sf-mhbeKMQn-QyOjBRng@mail.gmail.com>
Message-ID: <CAMj1kXH1SjPrPWyQbsYUHhVfgWH_p-sf-mhbeKMQn-QyOjBRng@mail.gmail.com>
Subject: Re: ia64 removal (was: Re: lockref scalability on x86-64 vs cpu_relax)
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, Will Deacon <will@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Luck, Tony" <tony.luck@intel.com>, Catalin Marinas <catalin.marinas@arm.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Jan Glauber <jan.glauber@gmail.com>, "Torvalds, Linus" <torvalds@linux-foundation.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 16 Jan 2023 at 10:33, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Ard!
>
> On 1/14/23 00:25, Ard Biesheuvel wrote:
> > Thanks for reporting back. I (mis)read the debian ports page [3],
> > which mentions Debian 7 as the highest Debian version that supports
> > IA64, and so I assumed that support had been dropped from Debian.
>
> This page talks about officially supported ports. Debian Ports is an
> unofficial spin maintained by a number of Debian Developers and external
> developers that are volunteering to maintain these ports.
>
> > However, if only a handful of people want to keep this port alive for
> > reasons of nostalgia, it is obviously obsolete, and we should ask
> > ourselves whether it is reasonable to expect Linux contributors to
> > keep spending time on this.
>
> You could say this about a lot of hardware, can't you?
>

Uhm, yes. Linux contributor effort is a scarce resource, and spending
it on architectures that nobody actually uses, such as alpha or ia64,
means it is not spent on things that are useful to more people.

I really do sympathize with the enthusiast/hobbyist PoV - I am also an
engineer that likes to tinker. So 'use' can be defined liberally here,
and cover running the latest Linux on ancient hardware just for
entertainment.

However, the question is not how you or I choose to spend (or waste)
their time. The question is whether it is reasonable *as a community*
to insist that everyone who contributes a cross-architecture change
also has to ensure that obsolete architectures such as i64 or alpha
are not left behind.

The original thread is an interesting example here - removing a
cpu_relax() in cmpxchg() that was only there because of IA64's clunky
SMT implementation. Perhaps this means that IA64 performance is going
to regress substantially for some workloads? Should anyone care?
Should we test such changes first? And how should we do that if there
is no maintainer and nobody has access to the hardware?

The other example is EFI, which i maintain. Should I require from
contributors that they build and boot test EFI changes on ia64 if I
myself don't even have access to the hardware? It is good to know that
things don't seem to be broken today, but if it is going to fall over,
it may take a while before anybody notices. What happens then?

> > Does the Debian ia64 port have any users? Or is the system that builds
> > the packages the only one that consumes them?
>
> There is the popcon statistics. However, that is opt-on and the numbers are
> not really trustworthy. We are getting feedback from time to time from people
> using it.
>
> Is there any problem with the ia64 port at the moment that would justify removal?
>

I would argue that we should mark it obsolete at the very least, so
that it is crystal clear that regressing IA64 (either knowingly or
unknowingly) by a generic or cross-architecture change is not a
showstopper, even at build time. Then, if someone has the skill set
and the time on their hands, as well as access to actual hardware,
they can keep it alive if they want to.
