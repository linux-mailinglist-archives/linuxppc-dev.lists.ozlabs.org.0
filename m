Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 388546AC5BD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 16:43:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVjXG13X0z3chx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 02:43:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Y7pgUr7Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Y7pgUr7Q;
	dkim-atps=neutral
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVjWM3rQfz3c6V
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 02:42:18 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B37C4240009;
	Mon,  6 Mar 2023 15:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678117328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+e/cUqhhX/VA/vt11SGpFMg3F+XphXS1/Hro38i4j0=;
	b=Y7pgUr7QHXRIZk9xlTpsJCwpUTN6J93viTIZPEPSAu5ZhECKJ2jOfMP9JFBqxLQNuei34Z
	tKLWB7FoAqSYE1PTY6ROhpqYUfgTlToyScGeKDgIVmUER65rZTwF9S1kKKWTu/P2Wrno5b
	fjLhWcgMRzdMyJCOtqls3mPQbmf6lgBIJJzqhScg+Vc5VY+ufSUGvRYmuaHL/vScl+JD+h
	5iPYWJhDzoQX5TLjFPLfFYWP8nErrdcYz0KDIE1sjeJcH67gkRx79N2SEaiVlz/MkMJK4L
	UwV37a+dm/zpn1w7yGKYoqjcPjwxlcQ7wOcVaX2spOpnPyfxvvOgD5jlmJbnAg==
Date: Mon, 6 Mar 2023 16:41:58 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 01/10] dt-bindings: soc: fsl: cpm_qe: Add TSA
 controller
Message-ID: <20230306164158.767e6420@bootlin.com>
In-Reply-To: <20230226174833.GA76710-robh@kernel.org>
References: <20230217145645.1768659-1-herve.codina@bootlin.com>
	<20230217145645.1768659-2-herve.codina@bootlin.com>
	<20230226174833.GA76710-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rob,
On Sun, 26 Feb 2023 11:48:33 -0600
Rob Herring <robh@kernel.org> wrote:

[...]
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  '#fsl,serial-cells': =20
>=20
> #foo-cells is for when there are differing foo providers which need=20
> different number of cells. That's not the case here.
>=20

Ok, I will remove the #fsl,serial-cells property on the next iteration.

On the next series iteration, I will also remove the #fsl,chan-cells proper=
ty
present later on a patch related to the QMC binding. The #fsl,chan-cells ne=
eds
to be removed exactly for the same reason.

> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    const: 1
> > +    description:
> > +      TSA consumers that use a phandle to TSA need to pass the serial =
identifier
> > +      with this phandle (defined in dt-bindings/soc/fsl,tsa.h).
> > +      For instance "fsl,tsa-serial =3D <&tsa FSL_CPM_TSA_SCC4>;". =20

Thanks for the review.
Herv=C3=A9
