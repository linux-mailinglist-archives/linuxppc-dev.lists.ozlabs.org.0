Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 024D46B8D55
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 09:32:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbRb66bwWz3cfg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 19:32:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=e4kux0ZW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=e4kux0ZW;
	dkim-atps=neutral
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbRZF42NBz3cCL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 19:31:16 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0F4B21BF213;
	Tue, 14 Mar 2023 08:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678782672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jdfFUYhdjACpBVveRaAJWomc0NuqciR9U2EEWezTvMg=;
	b=e4kux0ZWhdR5f6CpCkWuoWcd/6K8eRnFxk/IH77LYo7DY1y4rfTWniYFxwqpUKQaMrxs2M
	NAXWLb7Imfb6JJoc1Y+xEEgUUlEyyfNRfPs0mQ1JFk4MBBJDqSi/Yxic3KEU8ZOuBuBBS1
	d8Gn6dCVuYbhwq4+5kjQVsL6USMWUOmJ7hvtHdoYeGzLAqDVUqSb23ySUZzD2t98PWJj/F
	P+dZqpV82oEXaAVyMZNI2TAJkSSlMxagQI6vpe10cWz3e+G7cPa6Yboq8hYhnqBJBeaNNX
	4C8B1+cGkW1pUj9mF9MHKP7FBoz8zDyytC1olon7SuJ+zixkqT1OcUuvkjjy4A==
Date: Tue, 14 Mar 2023 09:31:07 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: Question about the dependency on the config SOC_FSL in CPM_QMC
Message-ID: <20230314093107.7d150559@bootlin.com>
In-Reply-To: <CAKXUXMwqobqZJtDXAfymF3iWmzE3EXH1q6VLddVob9q2ygzWyQ@mail.gmail.com>
References: <CAKXUXMwwQuwssyzBrOXHOz__YRpa1Rjgqmwn5rRFjDVLBbabPA@mail.gmail.com>
	<20230314085741.6f968e68@bootlin.com>
	<CAKXUXMwqobqZJtDXAfymF3iWmzE3EXH1q6VLddVob9q2ygzWyQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Lukas, Mark,

On Tue, 14 Mar 2023 09:17:18 +0100
Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> On Tue, Mar 14, 2023 at 8:57=E2=80=AFAM Herve Codina <herve.codina@bootli=
n.com> wrote:
> >
> > Hi Lukas,
> >
> > On Tue, 14 Mar 2023 08:21:50 +0100
> > Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> > =20
> > > Dear Herve,
> > >
> > > In your patch below, you added the config CPM_QMC which depends on the
> > > non-existing config SOC_FSL:
> > >
> > > https://lore.kernel.org/r/20230217145645.1768659-7-herve.codina@bootl=
in.com
> > >
> > > Up to my knowledge, the config SOC_FSL never existed in the mainline
> > > tree. Is this dependency really required or can the expression simply
> > > be reduced to COMPILE_TEST and we drop the dependency to SOC_FSL?
> > >
> > > Note: This patch has now shown up in linux-next with commit
> > > 3178d58e0b97. Currently, it would not be possible to compile test this
> > > driver, as the dependency on SOC_FSL is never met.
> > >
> > >
> > > Best regards,
> > >
> > > Lukas =20
> >
> > My bad :(
> >
> > The dependency must be FSL_SOC instead of SOC_FSL. =20
>=20
> Herve, are you going to send a quick fix to your patch or ask Mark if
> your original patch can simply be replaced with a new one with this
> change added?

I have just sent a quick fix.
  https://lore.kernel.org/linux-kernel/20230314082157.137176-1-herve.codina=
@bootlin.com/

Mark, it can be squashed with
  3178d58e0b97 ("soc: fsl: cpm1: Add support for QMC")

Regards
Herv=C3=A9

>=20
> Lukas
>=20
> > I mean:
> > diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
> > index f90cfdf0c763..7268c2fbcbc1 100644
> > --- a/drivers/soc/fsl/qe/Kconfig
> > +++ b/drivers/soc/fsl/qe/Kconfig
> > @@ -47,7 +47,7 @@ config CPM_TSA
> >  config CPM_QMC
> >         tristate "CPM QMC support"
> >         depends on OF && HAS_IOMEM
> > -       depends on CPM1 || (SOC_FSL && COMPILE_TEST)
> > +       depends on CPM1 || (FSL_SOC && COMPILE_TEST)
> >         depends on CPM_TSA
> >         help
> >           Freescale CPM QUICC Multichannel Controller
> >
> >
> >
> > --
> > Herv=C3=A9 Codina, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com =20
