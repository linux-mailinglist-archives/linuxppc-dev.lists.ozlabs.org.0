Return-Path: <linuxppc-dev+bounces-11176-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B090B3000D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Aug 2025 18:30:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c78253kWpz30T9;
	Fri, 22 Aug 2025 02:30:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755793837;
	cv=none; b=a6BW6KszDAIXUcU+Y7QZ7T4wbwK0FQP3kHmrUk7bax7IklGXJHM3jxfShQChNYFePHCgWOxbgm0hvusdZ68s4buVuR9cHjMRcD0Qi2XQr4lfKhH69tX0kylV8YzwXoO7MgZ1d82qHk6KJTGFzny1wa0vU9bVtP8V1g5W7NxVEZ5CqYK2Nt2NNcc5aDwwuiTEVQS07CKEHPlyiW/LjQgL/rGWE1FagkzEmcJZ1rkgrrU947SJG12xDpqT/AI8xYRGwgpqK+LOmEL5YyJPJ6YOGolQobYBYlz+gtM5/t6ab8z1qPBMqChp3+m7gGmJ9dL0/k73IqpWtO9dcFuYnnw9zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755793837; c=relaxed/relaxed;
	bh=M9hPN9pLek8IF0I+6c6051btbaPlaupVt0kSjMksl9E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VH+3aH6utwcRQZXRFiPIKJxTlkkSW8u/687Jdpq2KPUmza6uvH4Mb7QDfvtEhCprxQD6qgKspzn6CubZ0GkZeY3rF2bvo2bvUAn75SoDZghHfLR8TsoOiZs6d5dS5WnQXW3U6wCzEPUAPOFISKQ0T6CTBAPEl1xjOw9c0AfScX95DTTJ8fPLDDctI6aa8NNqOXWROuX4IvLSzkxVclisOa13ti6ba+ncrHHMKScdqfF1T/ZDPq/ZtOUai0Bhi3zgZ7xJz6C0/3JR8u69A7E9yigAza4oeoNYQGV4Nh39VLrmVtWQ+y1it7Dhjhtdn/Fe6yTVrfc6K1VqhAIgqDrz7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hZVY7K6o; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hZVY7K6o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 392 seconds by postgrey-1.37 at boromir; Fri, 22 Aug 2025 02:30:35 AEST
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c782336rgz2xPy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Aug 2025 02:30:33 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 27CA0C6B3BD;
	Thu, 21 Aug 2025 16:23:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1B22606AF;
	Thu, 21 Aug 2025 16:23:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 753641C22D0B6;
	Thu, 21 Aug 2025 18:23:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755793438; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M9hPN9pLek8IF0I+6c6051btbaPlaupVt0kSjMksl9E=;
	b=hZVY7K6ojOU/EEB23DXOQ9t7qzlwW6bkLJqTMKi2mVtd1GtUUl1BUejOK+xIB4Z91hgtIn
	SgPH80PZaW9YtJZQMnECdXUijVG1jBDCy9MAV9GXrOaEnOA+DDJtuPgvbS25FNuHTS9XdF
	t4Z0eMKcJACXWAF7/y5ZOJqJg7yyzw7Y5+arlecpTfuyn70oue82w06Y8OIryYl3IGD93g
	IbCCney2Usa7F7E3Hyb4NjBgEniK6rhr7dQiQOTU1O6RVpGyAU1OgSkCdux0/HzkfD2ZWl
	dRWHJ88JC+1znMkmuSlFA7gbVLml05m/vKvPcMvLYB1OSjnA7wk105HDE+t6Sg==
Date: Thu, 21 Aug 2025 18:23:54 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 2/4] ASoc: fsl: fsl_qmc_audio: Ensure audio channels
 are ordered in TDM bus
Message-ID: <20250821182354.5c3b0344@bootlin.com>
In-Reply-To: <fad43df132900d7001fea34a2ee563d819c74015.1755504428.git.christophe.leroy@csgroup.eu>
References: <cover.1755504428.git.christophe.leroy@csgroup.eu>
 <fad43df132900d7001fea34a2ee563d819c74015.1755504428.git.christophe.leroy@csgroup.eu>
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
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christophe,

On Mon, 18 Aug 2025 10:20:01 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> To reduce complexity of interrupt handling in following patch, ensure
> audio channels are configured in the same order as timeslots on the
> TDM bus. If we need a given ordering of audio sources in the audio
> frame, it is possible to re-order codecs on the TDM bus, no need to
> mix up timeslots in channels.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  sound/soc/fsl/fsl_qmc_audio.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

