Return-Path: <linuxppc-dev+bounces-10931-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FC3B2470B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 12:20:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c249x3zzGz30WY;
	Wed, 13 Aug 2025 20:19:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8:216:3eff:fe9d:e7b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755080389;
	cv=none; b=mXpTul2Th3VN8IROwweP8g+y8N1VpIPfPA2pJNoCjsuMBFgqz4tb9DN6y8SXXXsfkCg7c71tmKxHIiR/RooSwfIyKFrwrmfx1h61BTOCfWT/srNsHIaQ2xcCbRdv/mMa8LcQwghdrZaVPEB8A+/qPjvpg52h7f/e8cQpgUNDlBU76i8RboP6MXd5vo7RBwEkcU5S1p3/M7jL6XQpYNjb5KhkpAxwLgDjsG6zV48gmp1TNQWxOaS3ts9a83W4pkAUwWhO/jRJxxrvVdfD8S1txSkb7C3KqfViAcRKRZm23m36gOw3FE/Xic9LzMhmHUnOhmza8imtfBBVKuv6CbK6CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755080389; c=relaxed/relaxed;
	bh=/jkXDRZmWGRgRXzJOU+jIPIdQYDS6GexJmI7jPxQpAI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=noFgok7kXAiYaAyPNfeiKfV7m3uOYmL6eLf/rUdXhXPD4xYVjLBAWZZXUFZ9ww3DrTTqlylgBVT/sh8gR5lMnbJdZCQXW+IJNALxiuh0xET3C+WOXSVdZ7QVFaivAU7Nrv6grdg/CnULXXM8fjG+NqvVfxcEmxr2AGLFzbvkHKCeK4AVdEe79zUgyfHqMoCYy6cerAk3+dvH2h+VneL1lXWg6V7oBFxqfW1qs9s59vfZ7wxuBxY54JPvzNlI7cwRscxOTteiVRl6mdjJ+rJeRTvP8iRx6dhei1yJuU568ULGmlVK/yzJc88VGsCV+4ykQWZY4Uk98gDFBYa84/oSAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=pTGq3u7r; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=pTGq3u7r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [IPv6:2001:4b98:dc4:8:216:3eff:fe9d:e7b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c249t5Sqhz30TG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 20:19:46 +1000 (AEST)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 87C83580907
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 10:07:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C5EC43A11;
	Wed, 13 Aug 2025 10:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755079619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/jkXDRZmWGRgRXzJOU+jIPIdQYDS6GexJmI7jPxQpAI=;
	b=pTGq3u7ruzEJwmP3IVkTm8+aqpnCbVjsWdRcvIh3Q1eeiiB6zc0LdpsX3zgpXnU3qPV/Js
	7vCUVZF9PwpKUc2BathX3SkxvRM+DowdZnLhEUDHb582JJjcz3l4LZe7q3/Iiu2Yg8OdPL
	k5trmBpbBEn4odsGQNqGx1oi73B1QEH2wWIi2+8VTHx67sY3f6qqk02rn9V1kuE+QlZUw7
	eQ99L2ASzg6xFdwiyTMIhWU6XTyRstm4x3XOGhtAlaCy3mJB4keOqNnyiQs9hNCbwuVUba
	WVcztX5VbiNe4k5/dXfWlhCG83nP1hAjnFgLDEhxdsAFiMjF6JR66dwCjw6sNg==
Date: Wed, 13 Aug 2025 12:06:57 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoc: fsl: fsl_qmc_audio: Ensure audio channels
 are ordered in TDM bus
Message-ID: <20250813120657.1e93b16b@bootlin.com>
In-Reply-To: <8d01cf4599664188c92a515922d68c9834263384.1754993232.git.christophe.leroy@csgroup.eu>
References: <cover.1754993232.git.christophe.leroy@csgroup.eu>
 <8d01cf4599664188c92a515922d68c9834263384.1754993232.git.christophe.leroy@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeejleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemtggstdekmeelkeeltgemkedttddtmehfugekudemleehgegvmedvudehrgemfeeluddtnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdtkeemleeklegtmeektddttdemfhgukedumeelheegvgemvdduhegrmeefledutddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepqhhirghnghdriihhrghosehngihprdgtohhmpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesghhmrghilhdrtghomhdprhgtphhtthhop
 egiihhusghordfnvggvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitgholhgvohhtshhukhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christophe,

On Tue, 12 Aug 2025 12:50:56 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

...

> @@ -879,6 +884,30 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
>  				return -EINVAL;
>  			}
>  		}
> +
> +		ret = qmc_chan_get_ts_info(qmc_dai->qmc_chans[i], &ts_info);
> +		if (ret) {
> +			dev_err(qmc_audio->dev, "dai %d get QMC %d channel TS info failed %d\n",
> +				qmc_dai->id, i, ret);
> +			return ret;
> +		}
> +
> +		last_rx_ts = fls64(ts_info.rx_ts_mask);
> +		last_tx_ts = fls64(ts_info.rx_ts_mask);
                                              
tx_ts_mask instead of rx_ts_mask for last_tx_ts.

Best regards,
Hervé

