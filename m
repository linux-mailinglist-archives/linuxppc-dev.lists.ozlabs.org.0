Return-Path: <linuxppc-dev+bounces-11177-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 603C3B30014
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Aug 2025 18:32:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c784322dnz3bVW;
	Fri, 22 Aug 2025 02:32:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755793939;
	cv=none; b=ZRAyw7XB++WBFBMqg5dmM7gSS1NdY3VvUb/RfMRaY0VjXBa8Nfc7PTlkAduY+U0rLf6oj+DIU7wA9Zl/ywsbHQX9iq/lj+3cVGemext3HDUPKWH8YONQD8LZjs58gDV3ERSjCbl85JkmSoAnmuw2vTPBQgWUROMYw3+SG4gwPwKdn8C3KbjDNWNR4V/wurRZEvkUjNhR7H7dxDwx+WwP/qHF9VZjtv3cutz9U0apnMtX+BxuYYro+G3Z8bEaNRfopFOUCqox31zM7u120qZSgClYwoe1t5QaDjtZEe2rSDT4xCla6X8fdEr58dqCzaizSZsvjBXwAgLJ2EzqfvpDag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755793939; c=relaxed/relaxed;
	bh=1M5Nb/GMJtc+X2GXJNcDemzZBR8bSjA86XYehPLVfcM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BJm2aAdgN+FvY14L4U55vM9ei7qh7rKrfWouDu8qY+WRKmpWdOWvfOnUSnfs+0STibHhG+BJAaJr+Wv43aM+VMj8kOCwwdKdfkkYPUbkVSERq014Sma1LkNXIL0cfeVFo2wjfz7pfZ+LQMLW/eJldp6atpOCzepM8dWFAjyELlrbOa4B1dGDR0jd+OmJjEzVRTTN50vfTVLbDf9TNo5r1ceBxIxjU2p43BOHcORRwgEGuPJrV5X65WwLGIi46ZdrplR/CRxtpcUQd19feZfS9YX+eaK5c+4DK0gqLOYj4wwGPUZ7L1A0jQfkDMdarZJmMKdAtQBTIKMExXjW0qhCsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KVCPARWL; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KVCPARWL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 516 seconds by postgrey-1.37 at boromir; Fri, 22 Aug 2025 02:32:18 AEST
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c78424QVZz2xPy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Aug 2025 02:32:18 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BE28D1A098C;
	Thu, 21 Aug 2025 16:23:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 83F24606AF;
	Thu, 21 Aug 2025 16:23:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AAA331C22CDE0;
	Thu, 21 Aug 2025 18:23:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755793415; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1M5Nb/GMJtc+X2GXJNcDemzZBR8bSjA86XYehPLVfcM=;
	b=KVCPARWLBBak7ha8ttTM+7mSUp1YOMn44fkE8/H8tGUXMy0+0lnJUZKwja2mTiFQWgTOf/
	h5JQRzU7uU0UKzlfsawb+1jIJunssTSjuvp/WuRJI5SGaIR4c+20C+McMOq9F2hwTWA6w4
	1H6K/QEvyZd3/J8WyJqmnQ17TZTioEQXlKTqdVEUH+hrEjAhh6+j/Xrq0idi/N90oJwrLf
	0FsZf1PAbShVXrLvavCglq5Kta5HoiGUZUrVBOZ+WKoLTKrlq3jcXAvC39cZRfF179V4/O
	ZAOVylEgw9reB1RLQo6ww7MB5XnnP+Pf9eDMwEo3HrKQpWESylbdHy9RM9fAYg==
Date: Thu, 21 Aug 2025 18:23:07 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 1/4] soc: fsl: qmc: Only set completion interrupt
 when needed
Message-ID: <20250821182307.2f7c8aeb@bootlin.com>
In-Reply-To: <f0c5260651822e8003daf11c7a76921796517152.1755504428.git.christophe.leroy@csgroup.eu>
References: <cover.1755504428.git.christophe.leroy@csgroup.eu>
 <f0c5260651822e8003daf11c7a76921796517152.1755504428.git.christophe.leroy@csgroup.eu>
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

On Mon, 18 Aug 2025 10:20:00 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> When no post-completion processing is expected, don't waste time
> handling useless interrupts.
> 
> Only set QMC_BD_[R/T]X_I when a completion function is passed in,
> and perform seamless completion on submit for interruptless buffers.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/soc/fsl/qe/qmc.c | 44 ++++++++++++++++++++++++++++++----------
>  1 file changed, 33 insertions(+), 11 deletions(-)
> 

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

