Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6003579E0D2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 09:27:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=id5wBw+5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlsVQ1g8Gz3cGL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 17:27:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=id5wBw+5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlsTW1l8cz30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 17:26:52 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26012E000C;
	Wed, 13 Sep 2023 07:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694590007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+j8CLkeQqfE/jh3KUACTiWhEVCfAwwkGv+CICyZc1E=;
	b=id5wBw+5IoW5nrGIWPBxMOPgujgtR6RcLR+FMdrunmLvgVotlzLE4P7GYyysXkHSpptRua
	AUfDx7XqGPnc1pFdO+2bGGISGvLbBCzyXlMgzpVW7v7AYC53V4Eaa7Giqyjg+JY6+zA/6X
	ae1i0V0aWjGLBf6bo0hPvjiAFVEw+x3XTs3VCD8PXidN9bityZlJLHPojdkWvSYwfW1nil
	jAHS1xzlhg0SXt7dGRnbvV2Qsa4Q1uRXGy564WEw0irLFiw0glEyZRzK5O1GQJ3au0virI
	6//y6UwVKL0i+itAqUc3X0+fgIxkEkCePNW0m4OkaNXvPS+DkPuU9xPTWVApzw==
Date: Wed, 13 Sep 2023 09:26:40 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v5 08/31] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc:
 Add support for QMC HDLC
Message-ID: <20230913092640.76934b31@bootlin.com>
In-Reply-To: <20230912-capable-stash-c7a3e33078ac@spud>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
	<20230912101018.225246-1-herve.codina@bootlin.com>
	<20230912-capable-stash-c7a3e33078ac@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: herve.codina@bootlin.com
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

Hi Conor,

On Tue, 12 Sep 2023 18:21:58 +0100
Conor Dooley <conor@kernel.org> wrote:

> On Tue, Sep 12, 2023 at 12:10:18PM +0200, Herve Codina wrote:
> > The QMC (QUICC mutichannel controller) is a controller present in some
> > PowerQUICC SoC such as MPC885.
> > The QMC HDLC uses the QMC controller to transfer HDLC data.
> >=20
> > Additionally, a framer can be connected to the QMC HDLC.
> > If present, this framer is the interface between the TDM bus used by the
> > QMC HDLC and the E1/T1 line.
> > The QMC HDLC can use this framer to get information about the E1/T1 line
> > and configure the E1/T1 line.
> >=20
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  .../bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml   | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-=
scc-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-sc=
c-qmc.yaml
> > index 82d9beb48e00..b5073531f3f1 100644
> > --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc=
.yaml
> > +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc=
.yaml
> > @@ -101,6 +101,16 @@ patternProperties:
> >            Channel assigned Rx time-slots within the Rx time-slots rout=
ed by the
> >            TSA to this cell.
> > =20
> > +      compatible:
> > +        const: fsl,qmc-hdlc
> > +
> > +      fsl,framer:
> > +        $ref: /schemas/types.yaml#/definitions/phandle
> > +        description:
> > +          phandle to the framer node. The framer is in charge of an E1=
/T1 line
> > +          interface connected to the TDM bus. It can be used to get th=
e E1/T1 line
> > +          status such as link up/down. =20
>=20
> Sounds like this fsl,framer property should depend on the compatible
> being present, no?

Well from the implementation point of view, only the QMC HDLC driver uses t=
his
property.

=46rom the hardware description point of view, this property means that the t=
ime slots
handled by this channel are connected to the framer. So I think it makes se=
nse for
any channel no matter the compatible (even if compatible is not present).

Should I change and constraint the fsl,framer property to the compatible pr=
esence ?
If so, is the following correct for this contraint ?
   --- 8< ---
   dependencies:
     - fsl,framer: [ compatible ];
   --- 8< ---

Regards,
Herv=C3=A9

>=20
> Thanks,
> Conor.
>=20
> > +
> >      required:
> >        - reg
> >        - fsl,tx-ts-mask
> > @@ -159,5 +169,8 @@ examples:
> >              fsl,operational-mode =3D "hdlc";
> >              fsl,tx-ts-mask =3D <0x00000000 0x0000ff00>;
> >              fsl,rx-ts-mask =3D <0x00000000 0x0000ff00>;
> > +
> > +            compatible =3D "fsl,qmc-hdlc";
> > +            fsl,framer =3D <&framer>;
> >          };
> >      };
> > --=20
> > 2.41.0
> >  =20
