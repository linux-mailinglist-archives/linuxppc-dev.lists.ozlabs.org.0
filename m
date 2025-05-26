Return-Path: <linuxppc-dev+bounces-8932-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A192AC3B49
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 May 2025 10:13:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5T7124Xqz2xfB;
	Mon, 26 May 2025 18:13:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:242:246e::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748247229;
	cv=none; b=acJUTJ89BRuVM5PQCmZpQmcV/A6tOnPYw9K8hLAReXYIPZdteia0FAhRx079PdLxItqVc0333QOpiwu+/uD7JAkdAdG5dQZcc6equQM7ENvJHzaXty0cx8MBCBxnfHL9avo3IwsQODgfG/1R+UoUCoA4asEvcCwZ7W2DQtII3SmovhchJUVUQFVuzqyPcC7H4nXs5g3BDisOxxd1aSGnD2lkOecd3pyHWHublzkNwcfvYE/ISunph1FWrgcnvkQJ2SLQKn01NTFKlGmofBH4xEVauGKbs6ZKd6izdBA5DbhH8eNkgvBU382MItXNiVwWqVaFbtWZkDckjzvEegsriQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748247229; c=relaxed/relaxed;
	bh=+itlrWYzfhQ7YhSm6Rwr1H/9x36GVhI08lVyKj97jHk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JOaK8ohkbExT2Og3yD6VAp6CLfjWhUv6gZwqgx9qX0UREvGkF/xac5u4AWZWqORXvLMIG7fYshzyNNRFQU/GkvWSy9Sx7g5yITNOUFt7bp6ZkwpoU9FMCCmFbIxsojyXJNvJtTZJd34oJPL8Pjrop7xxXYFgjw3vUF/Vt/45YE/RTREBszuv9ng1G2oAOIgeE0a+ULRbTfNUFwU1blJtzOLDjwmj5Ym8/Sn1rT2o15Ic6vjGAo2aTGt0jy15U1RCqUZv6bysRVB/2ygZ/04TAlOiKkma5nHum6l1K7bx27ICN6JIUsVFNKvEkRsqDchPATw2yrPh2odQT6ICSeBHpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=F54CGL1B; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org) smtp.mailfrom=sipsolutions.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=F54CGL1B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b5T701TD8z2yZS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 May 2025 18:13:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=+itlrWYzfhQ7YhSm6Rwr1H/9x36GVhI08lVyKj97jHk=;
	t=1748247228; x=1749456828; b=F54CGL1BoYgIfRjP+wyQKGoiaPS0Rii82n2t1YWxsyTvTIP
	PBq2X+itw7lz+/1FPKWCVerLk7xlFx1ji0FwDMGgRKdw9hoYxQWL4wy2oE0dHxWunUxOFJ1fGA9HB
	Bmh1mkwcliB53IWut7vrWaA6DIz6JCICVA+IF1eKXUyiEwfvhQYuGvyU8LKqdAj8EcOpJEl6ynv7w
	FLE3XJz0WuxjIHK0L5kmksOY3fRZGshq22u+JOYK6N56aSJnplIkb4bBbeCth2syd1QIZ92PMfdL8
	mzdkWH/gUltI9d6f22LeBpMbQ6XEHWqUTwf2uPb5S/JcPaF8+zrmWT1vWt0H/5DQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uJSxj-0000000DOyV-1Dst;
	Mon, 26 May 2025 10:13:35 +0200
Message-ID: <23aadbd78d3585c900c579c26f360011cf1ca830.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
From: Johannes Berg <johannes@sipsolutions.net>
To: Ai Chao <aichao@kylinos.cn>, perex <perex@perex.cz>, tiwai
 <tiwai@suse.com>,  "kuninori.morimoto.gx"
 <kuninori.morimoto.gx@renesas.com>, lgirdwood <lgirdwood@gmail.com>,
 broonie <broonie@kernel.org>, jbrunet	 <jbrunet@baylibre.com>,
 "neil.armstrong" <neil.armstrong@linaro.org>, khilman	
 <khilman@baylibre.com>, "martin.blumenstingl"	
 <martin.blumenstingl@googlemail.com>, "shengjiu.wang"
 <shengjiu.wang@gmail.com>,  "Xiubo.Lee" <Xiubo.Lee@gmail.com>, festevam
 <festevam@gmail.com>, nicoleotsuka <nicoleotsuka@gmail.com>,  shawnguo
 <shawnguo@kernel.org>, "s.hauer" <s.hauer@pengutronix.de>,
 "srinivas.kandagatla"	 <srinivas.kandagatla@linaro.org>
Cc: linux-sound <linux-sound@vger.kernel.org>, linux-kernel	
 <linux-kernel@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>,  linux-renesas-soc
 <linux-renesas-soc@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>, imx <imx@lists.linux.dev>, kernel
 <kernel@pengutronix.de>,  linux-arm-msm <linux-arm-msm@vger.kernel.org>
Date: Mon, 26 May 2025 10:13:33 +0200
In-Reply-To: <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
References: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
	 <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
	 <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 2025-05-26 at 16:12 +0800, Ai Chao wrote:
> Hi Johannes:
>=20
> > > "simplifies the code" is no need to callof_node_put() .
> > Fair. Except that's not what you _actually_ changed here. Like I said,
> > either it's buggy before or after.
> >=20
> In the function i2sbus_probe, it not return a struct device_node, so , I=
=20
> think function for_each_child_of_node_scoped is better than=20
> for_each_child_of_node.

You still haven't explained why it's even correct.

johannes

