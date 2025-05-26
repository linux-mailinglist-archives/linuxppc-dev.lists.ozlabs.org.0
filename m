Return-Path: <linuxppc-dev+bounces-8933-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA5EAC3B8E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 May 2025 10:21:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5TJD5rXxz2xfR;
	Mon, 26 May 2025 18:21:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:242:246e::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748247708;
	cv=none; b=fbj9Ou+t6QsQZkC/aPWNeqx9qgcexr5R5mb9+7oeJaSYdaTFtyQK4vybXxdareqZyG5RdqyX5dOM/9u0mUHQ4ZFN8uDbSzJpMtf4JqCdRjhkap45cbjbhsQAGOvMBsbkkq47wzsU3MPmnPhpIPKM2WjXS1LZTg6oblVxmToQTxAd8EjiLR8yujMb+JwD4ojtouprDA222Lpa9C6bOLcrwScohx0MwZ0LfNvZfm0s3A3sc1cLkwC6cjmd6xYLyxIJhpkG2GttV6Rgks/kQGl2i39EWobnyCixOz0CX2y2fedcq3hJ5sox4G5e0Ygi9Q4Cprkc5Q1M8AEhKs80AOGczQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748247708; c=relaxed/relaxed;
	bh=kQpQyzSLFXzcV+bV7PWjdFj0k9dCEFAnIJ2CmkjTnDY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g920mBEIrzPZKzyJvNMN4wFqzq0rOCpMfu/1Xl0RozFnpY2GROxUGsJCqHgUA+cikY7E/BuP7QHs4med72Lmn6t0Mwe/GZXDuvxWOMi0D52n9AoLprxSfri8FsmK4QpKikhnQlp4z7kS7U2aw93SjQvUBjhk6pYut9PY3ToBlRDod+zdXRlXRFNf2CjT3yXyo5uLvBgCwS+88NXvrHxQydLkXnMSQ609amqR3Ymvje4gE3QD8xDYWG71nqk7UnenXZSAT3AEtP2fue9OubPavBV4rGt1WxpNvZI/cWJZtgg5+GRzlISq3CjXDZv95wm1zuLXJqqUEMSuoXuRxnsDaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=T8sToZ3s; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org) smtp.mailfrom=sipsolutions.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=T8sToZ3s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b5TJD00QLz2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 May 2025 18:21:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=kQpQyzSLFXzcV+bV7PWjdFj0k9dCEFAnIJ2CmkjTnDY=;
	t=1748247708; x=1749457308; b=T8sToZ3sH9mMQV3qqKQz+Mt805KsRLYSnezCuAjf7kvFJHL
	Y8Aoj7TNnMPQbJrcI7lGDuyNImOPKsCGJIJEe8sjG2QGVnE8UJ+SXzuARyMx52rlHXPfztWfpmHsK
	/FTanrBgfivQNLOix+t3LwO3whblFlmRuI//zghnr6OV3LPyTxsp1/bnAWARKbZndkJhgg/lzIT7K
	6r532pfYN8KHuWL1PoO15+329lQhaiswVCKUvLmc7MVfYBCevLPtUBoCTZw8nW0JKWxTia8umkyIe
	/pJqFBhgPdkwN+bnyWZ1DBNOqLqHiAAo1OmqV4DqLy4RfFfTJ28JCOY/OFVpJrQQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uJT5X-0000000DQMg-1YY7;
	Mon, 26 May 2025 10:21:39 +0200
Message-ID: <b36908bf35a20f7196bec4fe22e392a015d9b7d1.camel@sipsolutions.net>
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
Date: Mon, 26 May 2025 10:21:37 +0200
In-Reply-To: <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
References: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
	 <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
	 <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
	 <23aadbd78d3585c900c579c26f360011cf1ca830.camel@sipsolutions.net>
	 <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
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

On Mon, 2025-05-26 at 16:20 +0800, Ai Chao wrote:
> Hi Johannes:
> > > Hi Johannes:
> > >=20
> > > > > "simplifies the code" is no need to callof_node_put() .
> > > > Fair. Except that's not what you _actually_ changed here. Like I sa=
id,
> > > > either it's buggy before or after.
> > > >=20
> > > In the function i2sbus_probe, it not return a struct device_node, so =
, I
> > > think function for_each_child_of_node_scoped is better than
> > > for_each_child_of_node.
> > You still haven't explained why it's even correct.
> >=20
> > johannes
>=20
> The for_each_child_of_node() function is used to iterate over all child=
=20
> nodes of a device tree node.
> During each iteration, it retrieves a pointer to the child node via=20
> of_get_next_child() and automatically increments the node's reference=20
> count (of_node_get()).
> Each call to of_get_next_child() increases the reference count=20
> (refcount) of the returned child node, ensuring that the node is not=20
> freed while in use.
> for_each_child_of_node() increments the child node's reference count in=
=20
> each iteration but does not decrement it automatically.
> If of_node_put() is not called manually, the reference count will never=
=20
> reach zero, resulting in a memory leak of the node.

Yes, good! Now show that you can apply what you've learned to the
specific code (and changes) at hand.

johannes

