Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D18B7587CD3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 15:02:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxwBx5LdMz3cBt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 23:02:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=onxfnI7x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=onxfnI7x;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxwBM5QkZz2xHv
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 23:02:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 551C5612BE;
	Tue,  2 Aug 2022 13:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27F9C433C1;
	Tue,  2 Aug 2022 13:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659445335;
	bh=vtbUQascnzykXnbn3jLHzf6EgUayeIV5xScTTT1utW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=onxfnI7x0G+0BL9M5R8cYlNYFlJE49TQBq/8y6i02zsPybK7lk1ewdUZyY97KThWJ
	 DutUHrpQplDbKErGMj0xc9yxrB9IpNSWEi7KhF6/u7z+6rLURw/GcQhLVZ7eo1gQ3N
	 i2hMeW/LeVmfFQpsYcTUrdYNgHioqzG3w+NTlKvanf6BqeNxFqDwYtUks5P2V8GcDO
	 OYcmnkdcVJqwoWBI6nx08CF0jtbF3Mu4bz3q5uZ+fB/of9w0ykwe5RORiJOoGjY3GQ
	 4prctlkGsdKFIva22EeHyri3eZLnBEmYOHPWa8I4qb2AK2L418CAdx8VvLzyyixhUb
	 L0FvVFLQXnd+w==
Date: Tue, 2 Aug 2022 14:02:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: imx-rpmsg: Support configure sysclk for codec dai
Message-ID: <YukgUWgx+ZurQfBm@sirena.org.uk>
References: <1659356773-8315-1-git-send-email-shengjiu.wang@nxp.com>
 <CAGoOwPSy77PuBvA0BghsFrNgpXfO+JuFgTW5VTNOfMEQdnbrVA@mail.gmail.com>
 <CAA+D8AN3C6gN0cNF57qpiQf=p-834MRFCC4QeoEhxf95T1KURA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YRw2Uby4vcPES6Dj"
Content-Disposition: inline
In-Reply-To: <CAA+D8AN3C6gN0cNF57qpiQf=p-834MRFCC4QeoEhxf95T1KURA@mail.gmail.com>
X-Cookie: Stay on the trail.
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Fabio Estevam <festevam@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--YRw2Uby4vcPES6Dj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 02, 2022 at 08:23:37PM +0800, Shengjiu Wang wrote:
> On Tue, Aug 2, 2022 at 1:47 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > On Mon, Aug 1, 2022 at 5:42 AM Shengjiu Wang <shengjiu.wang@nxp.com>
> > wrote:

> > >  struct imx_rpmsg {
> > >         struct snd_soc_dai_link dai;
> > >         struct snd_soc_card card;
> > > +       unsigned int sysclk;

> > unsigned long?

> Seems int or long are all used in the kernel.
> I am not sure which one is better?

clk_get_rate() and clk_set_rate() do use unsigned long, but on a lot of
architectures that is the same size as int so it makes little practical
difference though it would be more correct to use an unsigned long.

--YRw2Uby4vcPES6Dj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLpIFAACgkQJNaLcl1U
h9Cq2wf+J5FyPms0fj44ULLXTCMYrAhOctllwnKP9MWRLU8ta/gzpq7RS4unLUto
VioH6SSf68deF2va4wasuvwzhluGPbcFCo+jcfUq0rNfGlMNeKxndx4SBkgYHEGy
G0b8vQTBGFmDWWjesTFZ/clyS55VSXHK39P8BshYHi2cM9xadYSQwjuGpMU2Zu4B
tADY/WUwb08iOPXxrXeh2uy1ndmPR61HNhaiVPfqNqhHp4hgG+ETn9onv/82EYhH
hT27tKuZUnKZC+ge3XIXpc+TR+zoXRbDs372LLirEFVL9b3CUqNGAtPkQCI9A4Uy
yJ0+9WIMCJ8hrOE+G89ykMGTEwfViQ==
=GkXv
-----END PGP SIGNATURE-----

--YRw2Uby4vcPES6Dj--
