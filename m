Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBAF63BD02
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 10:33:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLxwY3NKGz30RG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 20:33:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=bHiA/KNI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=210.131.2.91; helo=conssluserg-06.nifty.com; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=bHiA/KNI;
	dkim-atps=neutral
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com [210.131.2.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLxvZ6f7kz30QX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 20:32:42 +1100 (AEDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177]) (authenticated)
	by conssluserg-06.nifty.com with ESMTP id 2AT9W9vU001902
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 18:32:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 2AT9W9vU001902
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1669714330;
	bh=q/JmDqY6ZRCZRuLvhYeSw2JChEy0BBcsxyEmrOBAzZM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bHiA/KNIjelohJ3X7qiDzn2Ber+EQubl4XqdW0/2uPKizHNa4BbudrTQQ5CRLBGZs
	 kQSz+RWwa5XI4e9wGq40XUn8fnmEWeuTrtEQtlOE/6FUAKaG7gjRuyZuv/Q11fHH3g
	 lZNcKKUoO3Q4aBXHVioq67D/0+avAhlR136coUnWRtR3+yHZn32DR4XKcm1GyHw+IG
	 zDwBUBkim2Sr4ZcFFn9QITZWHFEqbEzemMUum0g0ZeFbnE5TvlmTvHx/Ik8zYdLyzo
	 6k+5anV0Y0y3OmeyyevlnP4SbCs6EBhCEEdct2jyYgL6uRbNcfHXWW1ThqfpzYIAqY
	 VaECvm+bNaNig==
X-Nifty-SrcIP: [209.85.167.177]
Received: by mail-oi1-f177.google.com with SMTP id n205so14555233oib.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 01:32:10 -0800 (PST)
X-Gm-Message-State: ANoB5pnpHn6GX27LSAW+korQoFSkp+5CyCbkuf8FVLcAKES7xyGpz2Em
	GenwbL3aBfE5282d7AceBzW45IEwWaFYtssJ3kk=
X-Google-Smtp-Source: AA0mqf7bodWJFNLDikd/rcLNd4BOT1NRsA02M6/379i66X8ke8jBxU/NKe1nREvGpq0xvy+KFo7vmA+PacSXp5XJnZY=
X-Received: by 2002:aca:1c06:0:b0:354:28ae:23b3 with SMTP id
 c6-20020aca1c06000000b0035428ae23b3mr18092147oic.287.1669714329287; Tue, 29
 Nov 2022 01:32:09 -0800 (PST)
MIME-Version: 1.0
References: <20221126051002.123199-1-linux@weissschuh.net> <6dc8ce0d-6587-5f39-d8cc-e4626ebfaf41@intel.com>
In-Reply-To: <6dc8ce0d-6587-5f39-d8cc-e4626ebfaf41@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 29 Nov 2022 18:31:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNASzeb5cEkHg8EimFnp02L0Kdcj_=c5GbD12g8JTH+3UqA@mail.gmail.com>
Message-ID: <CAK7LNASzeb5cEkHg8EimFnp02L0Kdcj_=c5GbD12g8JTH+3UqA@mail.gmail.com>
Subject: Re: [PATCH 1/3] firmware_loader: remove #include <generated/utsrelease.h>
To: Russ Weight <russell.h.weight@intel.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 29, 2022 at 10:18 AM Russ Weight <russell.h.weight@intel.com> w=
rote:
>
>
>
> On 11/25/22 21:09, Thomas Wei=C3=9Fschuh wrote:
> > utsrelease.h is potentially generated on each build.
> > By removing this unused include we can get rid of some spurious
> > recompilations.
> Reviewed-by: Russ Weight <russell.h.weight@intel.com>
> > Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > ---
> >  drivers/base/firmware_loader/firmware.h | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/base/firmware_loader/firmware.h b/drivers/base/fir=
mware_loader/firmware.h
> > index fe77e91c38a2..bf549d6500d7 100644
> > --- a/drivers/base/firmware_loader/firmware.h
> > +++ b/drivers/base/firmware_loader/firmware.h
> > @@ -9,8 +9,6 @@
> >  #include <linux/list.h>
> >  #include <linux/completion.h>
> >
> > -#include <generated/utsrelease.h>
> > -
> >  /**
> >   * enum fw_opt - options to control firmware loading behaviour
> >   *
> >
> > base-commit: 0b1dcc2cf55ae6523c6fbd0d741b3ac28c9f4536
>

Applied to linux-kbuild.
Thanks.

--=20
Best Regards
Masahiro Yamada
