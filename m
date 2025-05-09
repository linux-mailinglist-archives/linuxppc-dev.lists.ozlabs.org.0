Return-Path: <linuxppc-dev+bounces-8468-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAB1AB0EC1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 11:21:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zv3Qr4nGcz2yqg;
	Fri,  9 May 2025 19:21:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8:216:3eff:fe9d:e7b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746782484;
	cv=none; b=aOsy3mkoBDtaKIiElp64EqUmW3UP9NwTORHBuoczhW9HcuDtbwlmRz5VnL5LphAhCTi08GSBjkh9q0tcj60V8PWsROxk4mAvGkdT9TgRfLa8ZyXoyk17fZvwIkReZZNTLQ8um2w3OjOKs7njA9eKdAwYijz/qPuDyp1LByBJA99Rzusy3oIIHr7E+6L0W1o6hWOVoUlwnVwVKgZQgugtxdXORKkz8z5L/rMgOU+rUpJLCXeydhPMQaypz1dlUk8IoxR8ksPudd+YJ2msZ9jQqeMfGfyDT4ugwB9U8jEmOsupJKvh0ij8S3SPgjaB/IZiY2ieQyvqlt6DAWF0TLNRVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746782484; c=relaxed/relaxed;
	bh=0qKN4rcMkZyGCX8XvOvygZxM5y/hTbCtdBvJbeKgTB4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k1z12tuskTCVmAOBl2kwrl+z11p541WitFoiQVrYk2NuqyX7I5bR6+4+scqH4Su4cKH1xkaiyUbBavK53dia8qBcV97bQ3wch2Nv1n9qREpeLY8dVPfL9B2wlMXYK67yU8uEQ2+AcdYLGL0C12fzqgRaVtlWKkvbQh70/GKAvx9a+/tikcv8WlP6TeTzQkzdoGIF1fka280wJnLoiiZjyKm1e3zwzcMX1+/Rcu2kmS0FZvk+qxvPH0X6D1TNxCJAVyDGVS6N/Oo/1nO1Lf8UWcMj+SnUj35b3d0vSQbywkumdDnhY5upwis7jcyoRmsZw3b0AYOGpEcn8h2NGy4fFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=cOHZqeym; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=cOHZqeym;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [IPv6:2001:4b98:dc4:8:216:3eff:fe9d:e7b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zv3Qq50CQz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 19:21:23 +1000 (AEST)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 44E38581936
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 08:46:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74B371FD43;
	Fri,  9 May 2025 08:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746780347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0qKN4rcMkZyGCX8XvOvygZxM5y/hTbCtdBvJbeKgTB4=;
	b=cOHZqeymm9ZgzCZmj58TugZ51D+kzOeMr47BCZpyyd7httlGre+CvkkjTvon4+p64CgU7F
	A4sqSybPbWx8I8K1hMn7kC+HsJT/1DYOuPu8e2siOhsSWvG4TbuwBggpaIu8/T2G3YNEOG
	mJ6sBVwGwb4iPN6en5RkaRTNb5Ms8DCFxyeI9JvMicnAIOufKSUHFmaf8XET0DC3ZxIiAM
	hZS1Tm+QzFGhyOnM02Q0GqrAVawPbZHwvd7GA+pmbx+ZrD1LZYovJaMoFtreV/zhVVHy1f
	3h3YaPrSHWDvIVr/SDMMCmYETVdd7j/Tv3yc/ai04RwPJ12CMNNKiutLhqqtoQ==
Date: Fri, 9 May 2025 10:45:44 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: fsl: fsl_qmc_audio: Only request completion
 on last channel
Message-ID: <20250509104544.5c375f05@bootlin.com>
In-Reply-To: <5cffeb220617584a5e4bc03067cc10e6cdcfc25e.1746776731.git.christophe.leroy@csgroup.eu>
References: <19aa9d8a84c8475c62c42ac886dad0980428c6c0.1746776731.git.christophe.leroy@csgroup.eu>
	<5cffeb220617584a5e4bc03067cc10e6cdcfc25e.1746776731.git.christophe.leroy@csgroup.eu>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepqhhirghnghdriihhrghosehngihprdgtohhmpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesghhmrghilhdrtghomhdprhgtphhtthhopegiihhusghordfnvggvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhto
 hepnhhitgholhgvohhtshhukhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri,  9 May 2025 09:48:45 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> In non-interleaved mode, several QMC channels are used in sync.
> More details can be found in commit 188d9cae5438 ("ASoC: fsl:
> fsl_qmc_audio: Add support for non-interleaved mode.")
> At the time being, an interrupt is requested on each channel to
> perform capture/playback completion, allthough the completion is
> really performed only once all channels have completed their work.
> 
> This leads to a lot more interrupts than really needed. Looking at
> /proc/interrupts shows ~3800 interrupts per second when using
> 4 capture and 4 playback devices with 5ms periods while
> only 1600 (200 x 4 + 200 x 4) periods are processed during one second.
> 
> The QMC channels work in sync, the one started first is the one
> finishing first and the one started last is the one finishing last,

How can we be sure about that?

The mapping on the TDM bus has to be taken into account.

chan 0 -> TDM bits 0..8
chan 1 -> TDM bits 16..23
chan 2 -> TDM bits 9..15

In that case chan 1 can finish after chan 2.

qmc_chan_get_ts_info() could be used to get struct qmc_chan_ts_info
and [rx,tx]_ts_mask field in the struct give the mapping information.

The channel that ends last is the one with the highest bit set in the
mask (rx_tx_mask for capture and tx_ts_mask for playback).

Best regards,
Hervé

> so when the last one finishes it is guaranteed that the other ones are
> finished as well. Therefore, only request completion processing on the
> last QMC channel.
> 
> On my board with the above exemple, on a kernel started with
> 'threadirqs' option, the QMC irq thread uses 16% CPU time with this
> patch while it uses 26% CPU time without this patch.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---

