Return-Path: <linuxppc-dev+bounces-1665-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D95DE988787
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 16:49:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFYJw6FqQz3cJ9;
	Sat, 28 Sep 2024 00:49:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727442246;
	cv=none; b=h3tXX1IrWQov3tzFcyxpHMe41WV0dM0tv9RKgp/crb6BW+z53km4HLsjCnr+NNrDR4tlrXj0HAXn6Qksb8qIyi9QiHFX4rVGhfeqPPW7reMbWnTWloIGr/m5OLxT9LEEAX3wFURMCb1ipAScrycNKvMUp7PK7VafJq2wpNxYzPDK3hK2MF2kAla4x8PX9BqY5xPvzmFS6mFIPY4qcxt8NsT7fTJc7eoVOn2Yd/8grClDKwgToDMu7j9jNlSN5ASB78ftulQjZkkQfVsQMIQiGewGIeNH15gCabdfyb2Cowv+AkR7kq7VMVGgJ+fHXkkJP6vVroMUb266mLKQSn6fXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727442246; c=relaxed/relaxed;
	bh=lLZBoouw/VuTYq1d8wJ2tQsyjB5lc2Ro32qoC8DsyX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ivA6CbTrYaBIZuvsppNATChREHlmN83bw7SthyRFDbyGQQjNrGoR67et2UozSDNbYGsjOio9hO6Ix0hJpDaxtP/y0+ByxhUHpkHJO2g2qPJ08xf6Q4of4DXie19R/MpZt+h/gaw/0CpwZKZk9wB+INXor8miqrbhVhgDfll7/QY0AX4DM1jHLE25JBfsrKcO34ww5LXxN7fc1D1IZInZhKKJXJE6almJsLnT6obiilVsSnTL34n0SG5QTxmjEU77bleNuzpOTLROymwVsRvdhPXFoklDNOEJo0hL6RpQh8KiKJH/Bqi0qTh8cWJNGIC6e3/ch8KoYKY+sSp7vIKsMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kmX3WWpA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=aford173@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kmX3WWpA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=aford173@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFVzB2Y1Hz2y8n
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 23:04:05 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7db90a28cf6so2269158a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727442243; x=1728047043; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLZBoouw/VuTYq1d8wJ2tQsyjB5lc2Ro32qoC8DsyX8=;
        b=kmX3WWpAl7Jz9ofiPG75jAv4rPvRgo7Ii3XcGJ+1gYgZB7bkp250sF1N76FrhLJTyT
         gcukTeIcgGD9ejP7JlFk8OgSBXnmbQ0PPsV8WVmiBNvSKWRu9w7dpQ3xxfv8u7omVFF2
         XZadjOg0l0YFcshOUoz3EGd93tiweiHQq3K35IZDGZxXKJcqjAg835AjXj+Lecl+2831
         n9/+6OY/53mlYiMftGfciihOW5doY/nfuW69YlVwbdo8LhB5hzHulUmDn3lerf0EiecI
         s64E2MWHTkhHe8pmav13Fmai4YO3YKO1BbCdF3RMHGb7kD9ljLA7uYlI8pIzKvcyV+s2
         Usug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727442243; x=1728047043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLZBoouw/VuTYq1d8wJ2tQsyjB5lc2Ro32qoC8DsyX8=;
        b=r3jITlNA7iTSrVUFH8M4XxRLcESy8qcIJYAlS1eDZQcO4XMiickS8RDyOYBeb1YYHq
         3/NnbRYDtNn+xCoZ++k/OFirbhmiMBV2xDLogJMXDWKSBJO/67jx6iqwhLIuxTg4E4UP
         h/cKguUvNcYB5FPLixC+m6EREwdwqQfZfZdnoGZzU5EWqOfs/adzsBr6idCWJNlSCYKN
         qX1SjpN7kdNKtxJ6N/W1RhGliKk7yZvq0qwu8W4xmwPmqgPl4xqpSm9maD1/ZMCpJvHC
         +1cGINI+ShgdMqzHhVHcfKFtV7J6YA80jdB0+gfFv1Rnb+5vdgT0jPzb/PJa5in0b9xp
         VyBw==
X-Forwarded-Encrypted: i=1; AJvYcCWuusXY4z0JRzsfWgpm7NUZepvVTx05DRZrcgbI4hHZm4VLs2cVF6WLLUZLzkhI15Twibj1ZBiLQqxhq5U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzXTqhKpLbZc98Pd/QljEd23xX4Vb8OR68cN0bJJVx3gKDQN65P
	VbfQ60yJB+72M7yR3et1at0Q6c8vHea4PvRDK8HNx5ybouiWNNObPj2dxidGfXmLGJ04DkhcxQJ
	FBlPzqoTFTo722EAvQRAbPflBL+c=
X-Google-Smtp-Source: AGHT+IFtB7KLDPn+GDWKySAL2J4hNThlacj2FyNRmL5tDSlTqDrYlCCyOxeg5M2NMx4sjqT6GHGIxy0O+b+GZDd+MQM=
X-Received: by 2002:a17:90a:8984:b0:2e0:855b:9b21 with SMTP id
 98e67ed59e1d1-2e09111a9ebmr10387052a91.8.1727442242759; Fri, 27 Sep 2024
 06:04:02 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <cover.1727438777.git.geert+renesas@glider.be> <7ff1bfb73a6d6fc71f3d751dbb7133b045853f64.1727438777.git.geert+renesas@glider.be>
 <00fd0f7d-e05b-4140-9997-b4ffe0fcd8e9@kernel.org>
In-Reply-To: <00fd0f7d-e05b-4140-9997-b4ffe0fcd8e9@kernel.org>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 27 Sep 2024 08:03:51 -0500
Message-ID: <CAHCN7xKywTnuW9W-5abwpq8txNYhN39G9OX8zJDy_j=fqJFPfg@mail.gmail.com>
Subject: Re: [PATCH treewide 10/11] ARM: dts: nxp: imx: Switch to {hp,mic}-det-gpios
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-mips@vger.kernel.org, 
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:00=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/09/2024 14:42, Geert Uytterhoeven wrote:
> > Replace the deprecated "hp-det-gpio" and "mic-det-gpio" properties by
> > "hp-det-gpios" resp. "mic-det-gpios" in Freescale Generic ASoC Sound
> > Card device nodes.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This has a run-time dependency on "ASoC: fsl-asoc-card: Add missing
> > handling of {hp,mic}-dt-gpios".
>
> Therefore this should wait a cycle. Patch is good, although maybe we
> should keep both properties for backwards compatibility?

I also wonder what the point of the customer fsl-asoc-card is when
used in conjunction with a standard audio codec because the simple
audio card works just fine.  I think they have some special drivers
that need it like their ARC/eARC and HDMI drivers, but I have tested
several NXP boards using a simple sound card and it works fine.

adam
>
> Subject: drop "nxp" prefix.
>
> > ---
> >  arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi  | 4 ++--
> >  arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts        | 2 +-
> >  arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts       | 2 +-
> >  arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi       | 2 +-
> >  arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi | 2 +-
> >  arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts         | 2 +-
>
>
> Best regards,
> Krzysztof
>

