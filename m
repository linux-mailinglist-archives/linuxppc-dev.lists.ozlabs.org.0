Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B32D63BD15
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 10:36:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLy081d9tz3bTq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 20:36:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=iu8wmfQ9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=210.131.2.80; helo=conssluserg-01.nifty.com; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=iu8wmfQ9;
	dkim-atps=neutral
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com [210.131.2.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLxzB174bz2yxQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 20:35:49 +1100 (AEDT)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53]) (authenticated)
	by conssluserg-01.nifty.com with ESMTP id 2AT9ZGno019811
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 18:35:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 2AT9ZGno019811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1669714517;
	bh=Q7xi3f1N/meKASk0USS2l24LMBp1S+Lf4JZEEmqBqZ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iu8wmfQ9D9rAAP7mWoxw8h2LRApApWINFKiihUGcgIGNK6jfBtoHWQSIZUwKwnOzw
	 irqBc87cUAgwfQsoXxDTNDKChTNvOgC2zN9AyEIG2+SrZMU6IrkURbPJduSqZzTB/o
	 oW8JeTFZM181JJ9lApleFQO0De+uRb+LMneWY270NsVUqAjcnskpvP4jwAYAFT5NaF
	 uqypyS06NXu8ZhU4bbr7J1fxnJ2CPjLsJSMa1Ap4zgT/D2YWQaLWFANo0VQWnS6zzv
	 yqsK0FhWsh2tC5qBcCTQnCOyb6/mZTH0S3p4pEc2qXLrPLa9h62jvbb1yBmqluoBHO
	 9oAa/hU17XPbg==
X-Nifty-SrcIP: [209.85.160.53]
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-141ca09c2fbso16320736fac.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 01:35:16 -0800 (PST)
X-Gm-Message-State: ANoB5pl+MFoe3JqMd+JHiG7WZAw4TCiQPPG+12H5dzITwyXKERjCyxH0
	ELlM5O2NZMbcGXBEToauDdSTPpLX5iLufNEsJho=
X-Google-Smtp-Source: AA0mqf6J+oTxURdJK5Agpkp0/EJAXlORqpOujR9dCeA/lWt4niw0dV/3a7s/MpqS4A7v0PXydp7QwqhjqqWdkA57n28=
X-Received: by 2002:a05:6870:ea8e:b0:13b:a31f:45fd with SMTP id
 s14-20020a056870ea8e00b0013ba31f45fdmr33753310oap.194.1669714515803; Tue, 29
 Nov 2022 01:35:15 -0800 (PST)
MIME-Version: 1.0
References: <20221126051002.123199-1-linux@weissschuh.net> <20221126051002.123199-2-linux@weissschuh.net>
 <03859890-bf90-4ad0-1926-4b8cb8dbfa57@csgroup.eu> <8f8b12fd-2e25-49e4-a1fa-247f08f56454@t-8ch.de>
 <87r0xoatrg.fsf@mpe.ellerman.id.au>
In-Reply-To: <87r0xoatrg.fsf@mpe.ellerman.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 29 Nov 2022 18:34:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNATjaVerkr8GFVFQwqGnjC1Jz23E+C5f9+0LTLhX4gNmZA@mail.gmail.com>
Message-ID: <CAK7LNATjaVerkr8GFVFQwqGnjC1Jz23E+C5f9+0LTLhX4gNmZA@mail.gmail.com>
Subject: Re: [PATCH 2/3] powerpc/book3e: remove #include <generated/utsrelease.h>
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Russ Weight <russell.h.weight@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 28, 2022 at 7:59 AM Michael Ellerman <mpe@ellerman.id.au> wrote=
:
>
> Thomas Wei=C3=9Fschuh <linux@weissschuh.net> writes:
> > On 2022-11-26 07:36+0000, Christophe Leroy wrote:
> >> Le 26/11/2022 =C3=A0 06:10, Thomas Wei=C3=9Fschuh a =C3=A9crit :
> >>> Commit 7ad4bd887d27 ("powerpc/book3e: get rid of #include <generated/=
compile.h>")
> >>> removed the usage of the define UTS_VERSION but forgot to drop the
> >>> include.
> >>
> >> What about:
> >> arch/powerpc/platforms/52xx/efika.c
> >> arch/powerpc/platforms/amigaone/setup.c
> >> arch/powerpc/platforms/chrp/setup.c
> >> arch/powerpc/platforms/powermac/bootx_init.c
> >>
> >> I believe you can do a lot more than what you did in your series.
> >
> > The commit messages are wrong.
> > They should have said UTS_RELEASE instead of UTS_VERSION.
> >
> > Could the maintainers fix this up when applying?
> > I also changed it locally so it will be fixed for v2.
>
> I'll take this patch, but not the others.
>
> cheers


Okay, I applied 1/3 and 3/3 to the kbuild tree.




--=20
Best Regards
Masahiro Yamada
