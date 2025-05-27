Return-Path: <linuxppc-dev+bounces-8957-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85786AC4A54
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 May 2025 10:30:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b65RK2J81z2yk3;
	Tue, 27 May 2025 18:30:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:242:246e::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748334605;
	cv=none; b=ihLgOOJfSSNFqd8aV4Zm4yMgittV61/9SN6nLi5R76JM6AwPG9mtLW0/8J2+RGkTl5dnOEhSQsh1kwvPkMGU377ssApXQ9neqL+yuFVxhtk5NxsQxBb/ckNJMMlbQaZMuFeOzcbbJ6vubcgzOeHpe7MlYCtGmL4F7aLbxV1eeZT6T2rpvcXFroNGBJ1vh+fEH8qmQH0UwNOy+FzfXOs2uGBs6MKKQLfHImQI6m1Zne9VzUM1y1BLj1X6iCpxMueIzTl15JOB80hQ54x/HC9QwzBPdpoQTr9qREe3iNj/g3ekAtpqgOv9A4rWASNM1z131ZWdMhI7mSJhQQF6HaKyBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748334605; c=relaxed/relaxed;
	bh=bokkXsDYu1IhC5cK4pIZHGBgDHkECzX1dIxfgDAGs4s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lCQk4YqQ5+HudCZzN7z4w8vZieHf8xDoDpLIthovPydAeLCCIk6SwqW4dFeptE6niOK2PZuSsUPbB6ENIW5NKDwkyaG4uzOzKf9KoiNh9jXhqqsp3FQsQhQ32AJzrbYqm5QEYfOMVrGo7BRlPjtmvHZYu8tn9W5G3Oba7RpD1SUctx6XX/2fMq/cuTaRvUEzeDBHx8is9oBSmuwBFgB6JZ4PDFa1YD4S2Y0LpZeFf4nIWkcw572wFl2yr6kSejjoGYQVQsHMQAaHDp/vrl10HSbM7Kf3lUiXyq57CHvzz0Mkd1xUQZvgyBO4/BTscFsy3vSzJl2RGpOL2Wpgph6tKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=JRNNFDFz; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org) smtp.mailfrom=sipsolutions.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=JRNNFDFz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b65RH5kXrz2yjV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 May 2025 18:30:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=bokkXsDYu1IhC5cK4pIZHGBgDHkECzX1dIxfgDAGs4s=;
	t=1748334604; x=1749544204; b=JRNNFDFzKuFSplePkm/68kLaO/7LMXdox9pfUnQE+NFGDBK
	qH+p1h9UlACW4GKrH89Az101atBbAXFeSeS4KypL85O8NVJ8jJhjz62Xgg/QxQV0kmErRPPOpE9Aw
	mqEYZxqU06S00Ml6QDo26e6ze8fyW7KtbbkEYsiwtTkcbKmmhwzP0GYps41wUtjcqqMd9cmoWS5Nv
	CpynwW7iD6bArZmCdco/Qx7eLJ8A29Zd8Fd/ZwQObvVS3a8em44i7tQVtbkzxW8dWRt563bpkE/kN
	Kaa9BQPgW6r/fLZSC8pECfuu5K/4as7loRQl7ePKKg3Tt1HTZlmlpPyCwPylnciw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uJph1-000000000cV-1wqn;
	Tue, 27 May 2025 10:29:51 +0200
Message-ID: <d33cef50af049c296bc22f1d497993c8b1c74e52.camel@sipsolutions.net>
Subject: Re: [PATCH v3 2/6] ALSA: aoa: Use helper function
 for_each_child_of_node_scoped()
From: Johannes Berg <johannes@sipsolutions.net>
To: Ai Chao <aichao@kylinos.cn>, perex@perex.cz, tiwai@suse.com, 
	kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, broonie@kernel.org, 
	jbrunet@baylibre.com, neil.armstrong@linaro.org, khilman@baylibre.com, 
	martin.blumenstingl@googlemail.com, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, 	festevam@gmail.com, nicoleotsuka@gmail.com,
 shawnguo@kernel.org, 	s.hauer@pengutronix.de, srinivas.kandagatla@linaro.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Date: Tue, 27 May 2025 10:29:50 +0200
In-Reply-To: <20250527082446.2265500-3-aichao@kylinos.cn>
References: <20250527082446.2265500-1-aichao@kylinos.cn>
	 <20250527082446.2265500-3-aichao@kylinos.cn>
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

On Tue, 2025-05-27 at 16:24 +0800, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically.

Why are you resending this? You haven't convinced anyone of its
correctness. You haven't even convinced anyone that you even understand
what you're changing ... so I think there's not much point any more.

johannes

