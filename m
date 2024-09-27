Return-Path: <linuxppc-dev+bounces-1666-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DEA98886A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 17:39:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFZQS3kjJz3c5s;
	Sat, 28 Sep 2024 01:39:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727450979;
	cv=none; b=Dj6BKTxRhQgKzizL418EjHucio0fo6SAxwpgwsaDnwpcCFr0IPXsQtAVL22IvGb0KmGS4s27mgVsd4Bv5GsAoXjZHsWFHEGmkVT24enn+hWGUU1Dp82BanemepAuPB1RCQKerkny/EqUG06OJKmCpkjFzws7Ujj/dQJjpYykyesqRe8PnZ/e77duCKoF6L/YsWhqdVpTkdTpUiY3yWrfE9s1xJ3KY+tfe79UrxpAiOVm4G3kOkqgNTfHjFkEjSVjDFSJrgsMr7+au0S1Mrvs2O8nVIcehEbBlbYXhrmXlcLghAVmjXjpOKDEnAlLGYpQY1AqPq5kCoxGbpleQJwdEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727450979; c=relaxed/relaxed;
	bh=Eyv6FxKbSvQOFgQGcK5COE/kC4alwt92KY2oNq8SFCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DQmu8sB4qEpAge+b7/GNtA3+YTO9Jo7SFKiftfrv3DyK9Oh1BUlOpmh14905ceNYCYLNMct6ZFPBaRwOdldvtQS5VB4DLduhMbu6zwt5u1g6IPI2rjOVZ/faXk0bTDYf6L6kdv+tT/djSUgiV4eI44SJ7l82d5ia6igJskN482vZA0WZ8a/ZErUsTN6RwCkYAyHxWOVzDK18Pl7zqRCTft/9RQwrDrVKAnrVM0l9PMVEUNc5fY4e6OMQvoIdQZW4Xy+n5Yuylra8NCVRipevAxjhdi8Qk6KTpm7QaHSMuShUlsEEOq55RT2tcabsvViKx1qgWq6E9BO0YQDTRQwz0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sntech.de; dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=hHZyQS+v; dkim-atps=neutral; spf=pass (client-ip=185.11.138.130; helo=gloria.sntech.de; envelope-from=heiko@sntech.de; receiver=lists.ozlabs.org) smtp.mailfrom=sntech.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=hHZyQS+v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sntech.de (client-ip=185.11.138.130; helo=gloria.sntech.de; envelope-from=heiko@sntech.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 2650 seconds by postgrey-1.37 at boromir; Sat, 28 Sep 2024 01:29:36 AEST
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFZC45x9Fz3cMB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2024 01:29:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Eyv6FxKbSvQOFgQGcK5COE/kC4alwt92KY2oNq8SFCM=; b=hHZyQS+vg3fGvDLP66OXewKSw/
	MgkYPIHasNP3Y4Vnw+Qz32VU90hJgUuL0TNZM9Z0ex/VAcLL+btM20yOKGwqvGR0MSZJy8sZzWNmu
	CRtWZj46gdvGkeDWd8p6q6YFW0AO0Dg5nO6P2uO2uLV/GZj9x94qWOdQJ0+fOJKpEOeNwONe2b8my
	IytLCrYxSKBSyluqn/mTPCnt7Whlj3/ufprGWJQo4y2pUCu3eDn29jqe+Qo39CjycUpZaK6XK8Vbs
	wKQGVRYSz7kf5xERWOuc7hB190jPyoC7OddhWU6836LF6mjGb7UEvB/bz8zUJ6HC3A5y94d4HTLiu
	+ui1ah4g==;
Received: from 85-160-70-253.reb.o2.cz ([85.160.70.253] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1suCD8-0006OK-Lb; Fri, 27 Sep 2024 16:44:46 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, Adam Ford <aford173@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mips@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH treewide 00/11] ASoC: Clean up {hp,mic}-det-gpio handling
Date: Fri, 27 Sep 2024 16:44:43 +0200
Message-ID: <4455919.MSiuQNM8U4@phil>
In-Reply-To: <cover.1727438777.git.geert+renesas@glider.be>
References: <cover.1727438777.git.geert+renesas@glider.be>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Geert,

Am Freitag, 27. September 2024, 14:42:15 CEST schrieb Geert Uytterhoeven:
>   - The second patch updates the Audio Graph and Simple Audio Card DT
>     bindings,
>   - Patches 3-9 converts various DTS files to use the new properties,
>   - The last 2 patches convert Freescale sound device nodes to use the
>     new properties.
> 
> All patches can be applied independently,

though I guess dts patches should wait till patch 2 gets applied
somewhere, so that changed dts and changed binding can again find
together in linux-next?


Heiko



