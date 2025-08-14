Return-Path: <linuxppc-dev+bounces-10972-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C356B25DD7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 09:45:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2cj30Xm4z30TG;
	Thu, 14 Aug 2025 17:45:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::224"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755157511;
	cv=none; b=LRBNBP9eOSoc8WCX8TAJ1OQ46u0VTGjSLr19/j+e1VgqdRKvZSULF9BVa/9OIy60eNgWffUFHrGydx4/hD2pfR8tWGk/CQW84L7q0Z7he0dCgj857KHem1wJEijyru6ZahuANrpClXNOoUAkXGdJU+9gVJsnDFmCOCE49j5vKHtctjM9MeMhgIWzfK04C4EgZ+I25KuKORyWTKormDeohKMpbKQ8f8ksYo9Iw75OcN2/whQfgHjTC+Vh45gTg2pca7mVdOAGyK7R/4ZFZd0l+//DrlLoj8EnfIUN2LhOyLmmf91XpZ8xBhUWehEOuVX5GJ4I7Bt1QodrVJgQ1wfZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755157511; c=relaxed/relaxed;
	bh=oGaeaOyu7sZr1t9Yhldyp6k6MutpBTd2kLlHKclXjtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HvQ/qIWvQB2WMkyG6mH08e5rFzAEl/omEMxN+gc2+V48Ba3Ns4pPO1C30Gxd5fKHGfgWBGMSobjjcJedL18NRmcKzQpfIIvETE+9+bmPqVw0+BJRSutcJXZM9liSm8zUTTVxbLJHk/H4HvQyZwAPyZFDB2BU3N727hPvgyKdjFK1D1WnzQe43vfj5arAnms4L7Eid37pH0trkoEAoqiaxw2khg6STqvLl0b9PWnpzffxu36h2+PUyTkXCoCSWL8DNZEC2ZKE5//tt38zviXxu21dwpPQEZs7+C8Rgk4YJz/lgQhIX4jR92v37/onRVyuWyYjI3unuhviGxYuUY4o0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=g3rWnz9M; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=g3rWnz9M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 77889 seconds by postgrey-1.37 at boromir; Thu, 14 Aug 2025 17:45:09 AEST
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2cj15VjVz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 17:45:08 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4F8B444FC;
	Thu, 14 Aug 2025 07:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755157503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oGaeaOyu7sZr1t9Yhldyp6k6MutpBTd2kLlHKclXjtQ=;
	b=g3rWnz9M4v3IfdZKg8YsEppWQv3TXECF1TdJA3Q2JvW6gzqm6A6Gbk7Oy4QYK+SBuJ+4S4
	tqjiE9YDPtgo2OzvXF5B0pTGPUmANjuiX6ouLiIQRrVmiNgCRfqX/ke4qDokQvxQEjiQT2
	uu4PBmttQ6d7NWsnLt1W1jxdXXqE2j0bja30tG57RMpFw86BRGNdgBXSI9M4t0pS17eFeK
	QQX0ZXFJ/Ni0E2m+f0QGq+SAqLBqm5NOuMYAOSz8fUf4WmppMkQF6TH2qCfJhAiuqLS3RF
	TszOf8Z10x2fkH7IDWCMIb9ppwE4AybNJ/Y2JTfx4JNA82Tz5VUnQdIRCynzJg==
Date: Thu, 14 Aug 2025 09:45:02 +0200
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
Message-ID: <20250814094502.4b350b3e@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemtggstdekmeelkeeltgemkedttddtmehfugekudemleehgegvmedvudehrgemfeeluddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdtkeemleeklegtmeektddttdemfhgukedumeelheegvgemvdduhegrmeefledutddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepqhhirghnghdriihhrghosehngihprdgtohhmpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesghhmrghilhdrtghomhdprhgtphhtthhop
 egiihhusghordfnvggvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitgholhgvohhtshhukhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 12 Aug 2025 12:50:56 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> To reduce complexity of interrupt handling in following patch, ensure
> audio channels are configured in the same order as timeslots on the
> TDM bus. If we need a given ordering of audio sources in the audio
> frame, it is possible to re-order codecs on the TDM bus, no need to
> mix up timeslots in channels.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: New
> ---
>  sound/soc/fsl/fsl_qmc_audio.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
> index 5614a8b909edf..0be29ccc1ff7b 100644
> --- a/sound/soc/fsl/fsl_qmc_audio.c
> +++ b/sound/soc/fsl/fsl_qmc_audio.c
> @@ -791,12 +791,17 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
>  			       struct qmc_dai *qmc_dai,
>  			       struct snd_soc_dai_driver *qmc_soc_dai_driver)
>  {
> +	struct qmc_chan_ts_info ts_info;
>  	struct qmc_chan_info info;
>  	unsigned long rx_fs_rate;
>  	unsigned long tx_fs_rate;
> +	int prev_last_rx_ts = 0;
> +	int prev_last_tx_ts = 0;
>  	unsigned int nb_tx_ts;
>  	unsigned int nb_rx_ts;
>  	unsigned int i;
> +	int last_rx_ts;
> +	int last_tx_ts;
>  	int count;
>  	u32 val;
>  	int ret;
> @@ -879,6 +884,30 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
>  				return -EINVAL;
>  			}
>  		}
> +
> +		ret = qmc_chan_get_ts_info(qmc_dai->qmc_chans[i], &ts_info);

qmc_chan_get_ts_info() need a struct qmc_chan as first parameter

qmc_dai->qmc_chans[i].qmc_chan instead of qmc_dai->qmc_chans[i].

The use of qmc_dai->qmc_chans[i] without .qmc_chan have to be done on patch 4 (cleanup patch).

Best regards,
Hervé

