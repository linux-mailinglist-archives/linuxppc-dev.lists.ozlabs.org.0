Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E56079EB5E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 16:43:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YGMCHCaS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm39Y23cxz3gX4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 00:43:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YGMCHCaS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 73753 seconds by postgrey-1.37 at boromir; Thu, 14 Sep 2023 00:42:58 AEST
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm38f2TZqz2xdp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 00:42:58 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 40757CE22B4;
	Wed, 13 Sep 2023 14:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 904A6C433C8;
	Wed, 13 Sep 2023 14:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694616173;
	bh=ghmd2vE6l3/YQAYcdHB/Auew4n3efVE8LafRtaXbVHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YGMCHCaS7LV+IgxR8JwzA2LNP/JAobSO7VFWJqFuLotcrNli1S/nHKVzF//aJ2S6V
	 oyTmUUNwYQcB2nInr2C8Ez39iVMQmhLWasrm56DXWToBj15FazV/Kl6X9Oqd98l7vq
	 xYCSySPKPtfqvA4b/JjwavRqFP6IGhDc7F3DFnWpvbrbrOP/iHL2RUh7HiB9Nfi1ae
	 OAv6grpPZpsAP5EFZJg6+L0GXuBVZ6JskfXUivQah7NoYp1WtIsK8dxArv+axEEnrs
	 p+KoYbQrGGzwtNfTaPkj8pd6Rp9GlH1mROzy40I5zjPv5zmvE+yp4nzsVVzTdwFELZ
	 0zorZ83mPn+fA==
Date: Wed, 13 Sep 2023 15:42:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 08/31] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc:
 Add support for QMC HDLC
Message-ID: <20230913-unruly-recite-7dbbbd7e63e0@spud>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912101018.225246-1-herve.codina@bootlin.com>
 <20230912-capable-stash-c7a3e33078ac@spud>
 <20230913092640.76934b31@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D/KR2KGuouPtsCp2"
Content-Disposition: inline
In-Reply-To: <20230913092640.76934b31@bootlin.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, Si
 mon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--D/KR2KGuouPtsCp2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 09:26:40AM +0200, Herve Codina wrote:
> Hi Conor,
>=20
> On Tue, 12 Sep 2023 18:21:58 +0100
> Conor Dooley <conor@kernel.org> wrote:
>=20
> > On Tue, Sep 12, 2023 at 12:10:18PM +0200, Herve Codina wrote:
> > > The QMC (QUICC mutichannel controller) is a controller present in some
> > > PowerQUICC SoC such as MPC885.
> > > The QMC HDLC uses the QMC controller to transfer HDLC data.
> > >=20
> > > Additionally, a framer can be connected to the QMC HDLC.
> > > If present, this framer is the interface between the TDM bus used by =
the
> > > QMC HDLC and the E1/T1 line.
> > > The QMC HDLC can use this framer to get information about the E1/T1 l=
ine
> > > and configure the E1/T1 line.
> > >=20
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > ---
> > >  .../bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml   | 13 +++++++++++=
++
> > >  1 file changed, 13 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm=
1-scc-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-=
scc-qmc.yaml
> > > index 82d9beb48e00..b5073531f3f1 100644
> > > --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-q=
mc.yaml
> > > +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-q=
mc.yaml
> > > @@ -101,6 +101,16 @@ patternProperties:
> > >            Channel assigned Rx time-slots within the Rx time-slots ro=
uted by the
> > >            TSA to this cell.
> > > =20
> > > +      compatible:
> > > +        const: fsl,qmc-hdlc
> > > +
> > > +      fsl,framer:
> > > +        $ref: /schemas/types.yaml#/definitions/phandle
> > > +        description:
> > > +          phandle to the framer node. The framer is in charge of an =
E1/T1 line
> > > +          interface connected to the TDM bus. It can be used to get =
the E1/T1 line
> > > +          status such as link up/down. =20
> >=20
> > Sounds like this fsl,framer property should depend on the compatible
> > being present, no?
>=20
> Well from the implementation point of view, only the QMC HDLC driver uses=
 this
> property.
>=20
> From the hardware description point of view, this property means that the=
 time slots
> handled by this channel are connected to the framer. So I think it makes =
sense for
> any channel no matter the compatible (even if compatible is not present).
>=20
> Should I change and constraint the fsl,framer property to the compatible =
presence ?
> If so, is the following correct for this contraint ?
>    --- 8< ---
>    dependencies:
>      - fsl,framer: [ compatible ];
>    --- 8< ---

The regular sort of
if:
	compatible:
		contains:
			const: foo
then:
	required:
		- fsl,framer
would fit the bill, no?

--D/KR2KGuouPtsCp2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQHKZQAKCRB4tDGHoIJi
0jE/AP0awmyeu05CVKleLo13y3Fjt4HP0do7dEhQGNt4rxVmsAEAtTdqxGH2EmC6
3WhT1AVUi21kX6VzpxFlrQiNmHgB/A4=
=zHjw
-----END PGP SIGNATURE-----

--D/KR2KGuouPtsCp2--
