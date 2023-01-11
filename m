Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7AC665EC6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 16:07:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsWJT1t7kz3c4x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 02:07:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=J2zebCAM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.197; helo=relay5-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=J2zebCAM;
	dkim-atps=neutral
X-Greylist: delayed 111605 seconds by postgrey-1.36 at boromir; Thu, 12 Jan 2023 02:07:04 AEDT
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsWHX6lbZz2xGq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 02:07:02 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7925C1C000B;
	Wed, 11 Jan 2023 15:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673449616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=96p48KGQVOszGpiIUB1uMQHTSrU1mw+PEt8uGhIXaOc=;
	b=J2zebCAM0gphMWejuOqgoceHr5MqD34OCvw5uIQ+F8xbwSyORqkjh5JN2WScz1Txu5rTA2
	oWG0oqjsC4TfW2W6iI9azZabaMlxD4UwGsCtIMgaxUsBAVf+S4BhZxNsfF++6qyd88P51j
	jTN0lxAM9hMeQ2T1yXZ3dCMevMQX/c69W2vPSEc81hUm2hBKXfojWt/aKd1iw4OGl0mv14
	6jyJY34VcHSqHG5PWqLJhCiaVS7KwdXzjRRNsRc7oZvowk1q7ZqmkvjRCtumbZwDyt60IY
	gVVVVQjYQyaYgKeiyyyZhzYFLYpjrQTPE5pNH2V3X3c+rY/pgSOvtO7fye2REA==
Date: Wed, 11 Jan 2023 16:06:51 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 02/10] soc: fsl: qe: Add support for TSA
Message-ID: <20230111160651.24538b35@bootlin.com>
In-Reply-To: <7a36f02b-1ba1-b509-4aa0-c5c37a3cb3ef@csgroup.eu>
References: <20230106163746.439717-1-herve.codina@bootlin.com>
	<20230106163746.439717-3-herve.codina@bootlin.com>
	<7a36f02b-1ba1-b509-4aa0-c5c37a3cb3ef@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Fabio Estevam <festevam@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Li Yang <leoyang.li@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mark Brown <broonie@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Wed, 11 Jan 2023 13:47:23 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Le 06/01/2023 =C3=A0 17:37, Herve Codina a =C3=A9crit=C2=A0:
> > The TSA (Time Slot Assigner) is available in some
> > PowerQUICC SoC such as the MPC885 or MPC866.
> >=20
> > Its purpose is to route some TDM time-slots to other
> > internal serial controllers. =20
>=20
> Is the subject correct ? As far as I understand this patch adds support=20
> for the TSA on the CPM (exactly on CPM1), not on the QE.

Yes exactly, it is a CPM1 support (kind of previous version of QE).

Do you think that fixing the subject is enough or do I need also
to create a new directory drivers/soc/fsl/cpm/ and move these drivers
(TSA and QMC) in this new directory.

The alternative could be to leave this driver in drivers/soc/qe/ and
rename it to cpm-tsa.c.

For information, we have some plan to have this driver working
with QE (not done yet).

>=20
> By the way, there are already some embryo for handling TSA on QE in=20
> drivers/soc/fsl/qe/qe-tdm.c

Yes but this can be seen as an extension only used by=20
drivers/net/wan/fsl_ucc_hdlc.c and it supports QE only.

Not sure that qe-tdm.c will fit well if several other
drivers instances use it.

>=20
> >=20
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com> =20
>=20
> Christophe

Thanks for the review,
Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
