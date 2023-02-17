Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D01F69B3BE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 21:19:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJNSt0Wptz3f7p
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 07:19:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=obYLelZ0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::231; helo=relay11.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=obYLelZ0;
	dkim-atps=neutral
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJNRw5w8lz3cdp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 07:18:34 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 337FE100005;
	Fri, 17 Feb 2023 20:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676665105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E8lIhLyYZrWOGH9acO3c8AQgJcBFOpPFrurmuqfB/DU=;
	b=obYLelZ0JpWaeHM6XQnuEUxoArkn0+207v2TingL+S5XYm+6rwdff8zRrzHgkYLJWrd+Ph
	fMP9ByQfat3MpOUROCd8ZI/xIlRtYV5geFdbGDqh8MtLoxR46yJPFJ9uL72EsEIp7vwUdD
	WHJe2q4dgHghfDTa3rnFerrXAS50zXfIbxGXy9LCO3avlzWJuZ0F8UvmqBdYOoJWcI1HJC
	3jF6uf4FB6X7h8dR1SQehYPUnMlCli6LiksbHXvRNgMuKPji4vkMkQk93+nZfPPeENfMxE
	8YknYacLfbmAreQ6q91HJ/heB2kN7gRA7RO29JggH1vCkXQdg1Pe5pEZAjz3wg==
Date: Fri, 17 Feb 2023 21:18:20 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 00/10] Add the PowerQUICC audio support using the QMC
Message-ID: <20230217211820.39fb47a7@bootlin.com>
In-Reply-To: <Y+/SStm9ifszrYA1@sirena.org.uk>
References: <20230216134226.1692107-1-herve.codina@bootlin.com>
	<87mt5dyxph.fsf@mpe.ellerman.id.au>
	<0606f44f-bdbb-055c-6fff-440007222ce3@csgroup.eu>
	<Y+/SStm9ifszrYA1@sirena.org.uk>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xiubo Li <Xiubo.Lee@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 17 Feb 2023 19:15:22 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Fri, Feb 17, 2023 at 06:32:03AM +0000, Christophe Leroy wrote:
>=20
> > Mark, is that ok for you or do you expect this series to go via soc tre=
e ?
>=20
> Sure, that sounds good to me.  I'll give it another check and
> then assuming everything is fine apply for -rc1.

Thanks a lot,
Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
