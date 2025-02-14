Return-Path: <linuxppc-dev+bounces-6183-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5806CA35983
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 09:57:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvQtH3hg0z30Vg;
	Fri, 14 Feb 2025 19:57:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8:216:3eff:fe9d:e7b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739523463;
	cv=none; b=aNYABobvpqGIZg54+geHMkt1idTsn0nH59TJtyJ/di5v0+2hK/ldKG36F3QM81gwN3ye9W6hPLR19WUq1bDSF6J2ckfRSzdoEvLZBunCUqomjiTKjFJWmqAx1p8y37GtgxOfS3jguTVdy2tqXm1lJmZn3mHXq/EBQMYZZrrXM+kXx+Y/zV100jbK0xrLKnXMKhNECEHXB1WGO+53OdxUdeRKRiMgsR4tnUV7j298GOZhx+jNmn1tD+xsv5NLFboWTNLsI8jOd7beD2cD8aPB0m3rEBvfnV/KBS5MC8ElbbMT4gl+ROqGzABV/hOmXXtPgOjqtl1EZsdde6fhheUtnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739523463; c=relaxed/relaxed;
	bh=MNvBJa4Q9PSMsPDhj3s1+Vt+BAwOGndJFZntHwfg/ow=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CTQBiB5blsoYLaklfZd5QtG4qtEKxh7TUQG8b/qbVX33tSGA+EPr0YHL3UCqXuY2lFOdKmoQniVNoHA1PK8UZtI0j5j92HpPDYFg+KAacB3o6XaBa5Ff6d5PvswkpaUaZj7tsVY3wOe+YZtq9QRLLGISCYreJaFNUU6MLKfAUDi/pU6b1qlWSE9qCMhBEcBoztuyPLjNOixYZBatYkQw4CBWiI8t/6Xwx/O8nUNMsZjXw+uayQEo2m1WFGA+iZnUxLx032zgLZFUN83/l6c1wKqUm+oUbNWtefghMtozZNGP3LSxqQwumyOA40Gtm2Ju6jJkptZgsBe64i4WhP2aSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=pERS73CN; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=pERS73CN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1810 seconds by postgrey-1.37 at boromir; Fri, 14 Feb 2025 19:57:41 AEDT
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [IPv6:2001:4b98:dc4:8:216:3eff:fe9d:e7b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvQtF5NzLz30Gq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 19:57:41 +1100 (AEDT)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 24DD058505F
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 08:27:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DED244331;
	Fri, 14 Feb 2025 08:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739521644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MNvBJa4Q9PSMsPDhj3s1+Vt+BAwOGndJFZntHwfg/ow=;
	b=pERS73CNJU60vhPF1OVm1TWS8RcM43zlfRPZ1EppD0bEghrGemomkYR8FoCeoLwPRfiLrq
	SkF5/1g9soVLzzc03QJyHQGZFS2h9GfXkUcTignasl++h1B1XQtzihzXoZwIpaEbXH/SyN
	Ch+Ga5kkfrrlZIwOuybPkZc5d2/+dgxwObuSRubmqduiiN/z0wjrFnp3qimQn1t2lBDC+n
	MHUraA0WmTgpfxjazyRDjhs/C2JCg2rmWqlT6TqpUJ+sOIDXqHX0oGMopYifbs+hJUHfNA
	7d5d1mmgpiSbCTT19SsqnwQHtz1FZH5AdYScflZ1uuqQ1gpJuqU30VA8rCCVHw==
Date: Fri, 14 Feb 2025 09:27:21 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: xiaopeitux@foxmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Pei Xiao <xiaopei01@kylinos.cn>, kernel test
 robot <lkp@intel.com>
Subject: Re: [PATCH] net: freescale: ucc_geth: make ugeth_mac_ops be static
Message-ID: <20250214092721.6fadd49f@fedora.home>
In-Reply-To: <tencent_832FF5138D392257AC081FEE322A03C84907@qq.com>
References: <tencent_832FF5138D392257AC081FEE322A03C84907@qq.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegleduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedugfelledvtdffvdekudeijeduueevvdevffehudehvdeuudetheekheeigfetheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepgihirghophgvihhtuhigsehfohigmhgrihhlrdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtt
 hhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

On Fri, 14 Feb 2025 14:11:07 +0800
xiaopeitux@foxmail.com wrote:

> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> sparse warning:
>     sparse: symbol 'ugeth_mac_ops' was not declared. Should it be
> static.
> 
> Add static to fix sparse warnings.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502141128.9HfxcdIE-lkp@intel.com/
> Fixes: 53036aa8d031 ("net: freescale: ucc_geth: phylink conversion")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

Thanks for fixing this,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

