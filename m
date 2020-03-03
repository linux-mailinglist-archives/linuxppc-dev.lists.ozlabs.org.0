Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9DF177666
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 13:50:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Wxgs751CzDqHw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 23:50:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.brown@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 48Wxck1zv9zDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 23:47:44 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBA03FEC;
 Tue,  3 Mar 2020 04:47:40 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FB513F534;
 Tue,  3 Mar 2020 04:47:40 -0800 (PST)
Date: Tue, 3 Mar 2020 12:47:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v4 1/8] ASoC: dt-bindings: fsl_asrc: Change asrc-width to
 asrc-format
Message-ID: <20200303124739.GE3866@sirena.org.uk>
References: <cover.1583039752.git.shengjiu.wang@nxp.com>
 <872c2e1082de6348318e14ccd31884d62355c282.1583039752.git.shengjiu.wang@nxp.com>
 <20200303014133.GA24596@bogus>
 <CAA+D8ANgECaz=tRtRwNP=jMXBD0XciAE0HUYROH8uuo03iDejg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XuV1QlJbYrcVoo+x"
Content-Disposition: inline
In-Reply-To: <CAA+D8ANgECaz=tRtRwNP=jMXBD0XciAE0HUYROH8uuo03iDejg@mail.gmail.com>
X-Cookie: Drilling for oil is boring.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Timur Tabi <timur@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, shawnguo@kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, linux-imx@nxp.com,
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--XuV1QlJbYrcVoo+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 03, 2020 at 11:59:30AM +0800, Shengjiu Wang wrote:
> On Tue, Mar 3, 2020 at 9:43 AM Rob Herring <robh@kernel.org> wrote:

> > > -   - fsl,asrc-width  : Defines a mutual sample width used by DPCM Back Ends.
> > > +   - fsl,asrc-format : Defines a mutual sample format used by DPCM Back
> > > +                       Ends. The value is one of SNDRV_PCM_FORMAT_XX in
> > > +                       "include/uapi/sound/asound.h"

> > You can't just change properties. They are an ABI.

> I have updated all the things related with this ABI in this patch series.
> What else should I do?

Like Nicolin says you should continue to support the old stuff.  The
kernel should work with people's out of tree DTs too so simply updating
everything in the tree isn't enough.

--XuV1QlJbYrcVoo+x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5eUeoACgkQJNaLcl1U
h9AJywf/bSiQfVDbeUAktcdvjHCRmCvZQ5r/DETvXQh3jrq8ZMfLbfd8mIoxnaPL
QCqx6aL0X4owNuPMZ8fq3jStJL1uCFJudtfA9a+H/n57opep5mhmsAw0VTUSRKxV
3YPmdTKQtoGd3GnxrcUo9Z62ssQY3K0bCy5wGjcCxOW8alaFlJqj2st0dMbC6UNb
UbxOrZp2jWpVH3U+/0qh5i5QiV9h+ctw/f1BmEPzZYb32S4Ie9Q2ldINFhbMbnMQ
gwAeyISGShAYVLuWzbVCe8e09slQqGYmKprtmCn4xgokE2+UvnQNCIuxyx+TLeXY
6xJH0vBb6D/26k+09f8BENOxCCBv4w==
=EdGJ
-----END PGP SIGNATURE-----

--XuV1QlJbYrcVoo+x--
