Return-Path: <linuxppc-dev+bounces-8466-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3B1AB0E8F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 11:16:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zv3Jd3VX4z2xHZ;
	Fri,  9 May 2025 19:16:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::223"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746782161;
	cv=none; b=TP+l+zS7cnsbM7BfQMyw8mOD7J0NKRejgwCnp0aidR0xauk31o5YdVrggEwMlDbGg8JwdZu8gOa2qd4V9Dj1m36mmD19/SYNw+LjPZWIvmozRyyiQ2oMJYoKsUmF7Y//W1i6gtD8LaA2rQBx+tvOjPCZTy6jHNhNsVyB7FuazoBnpPuWYrUMUiX+jmaStzLGcbRboWzjy9MP3sgAaHcxz6eIUDN7mRSnHQsEocYJHZhx8I0HAU0T2B2I2xLhsLQPa/1fdDD13+ihc8t630+a1gAuwcE/xFSugkVCs5bELnkbPWGSWqwvYR7rzcnu2Uehy6x8p/4V6naIfdpM2bU4dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746782161; c=relaxed/relaxed;
	bh=uOMW9BGxskbhad6mlU+Himy6oHmyXjwahxXAzW3WdCk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HNOGTAMFs7KelcvoEu+XC1v9PTr9VWWUcg0BLNT7uCYwOGB0hBivYE8qd1l6t8vztac+5xbMFn8mAsk+VtleF5pFNz9sjtz98+5+0hWMJY8TzCGiuftDxO26UcOP92sajpzGEEzNCzylRXSESryCfM/5stnne/bgzkNvhYhN0KO6dkllZrZtWP/Gfpr/cU2Sp7kGFe/Iy4j3GEEK8HtD/ghAF0KiGJUTAVMH7RCHT75FWO08IFDHlCgkBTTWC0+FJ8eLUx3xQW48u3vDK1d1yc9P9MAMGvPxcSpbDIa2EdxkMJK5VmXN2yi3nOiClEreH53CQ1eLiLX+ZHIQ+Egw2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=A49+jEYE; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::223; helo=relay3-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=A49+jEYE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::223; helo=relay3-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1803 seconds by postgrey-1.37 at boromir; Fri, 09 May 2025 19:15:59 AEST
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zv3Jb3Qc4z2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 19:15:58 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07CAE1FD43;
	Fri,  9 May 2025 09:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746782155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uOMW9BGxskbhad6mlU+Himy6oHmyXjwahxXAzW3WdCk=;
	b=A49+jEYE7WBREA5b6YXFMHfgJgHIHEfZyMK/RNX+suNhPAOLzF5+ZiOY9VjEJNSMYeaD2Y
	MrnyIbfXfo5AU1P/osyUWAzpu3oBNbTlJjbZ/T4DNgoboLXfJnwYLb94aKzyQcE92u7PwO
	MxY7uBU7wLo9mKHJ7ykciVIv9HjzTHlMpHoPSOS+J61W/2Bng8ecZy4/tEJavqMtWveEFm
	pVhdjm1YJzBBVR7R2MpYwhF4mh+Vp7E7Yn9maafTTpzVxqA7CFWvg6+45chPVUEGbF0rfK
	ATf0366ofRqxq3v87RGphfqb8PJX9dkrxtXdpD7U2pbjx/3P5Kp0+w4cAJqQUA==
Date: Fri, 9 May 2025 11:15:54 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: fsl: qmc: Only set completion interrupt when
 needed
Message-ID: <20250509111554.770263b7@bootlin.com>
In-Reply-To: <19aa9d8a84c8475c62c42ac886dad0980428c6c0.1746776731.git.christophe.leroy@csgroup.eu>
References: <19aa9d8a84c8475c62c42ac886dad0980428c6c0.1746776731.git.christophe.leroy@csgroup.eu>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefflefhieduteegffeifeeggfffvdeuvdeutddvfeduudeukeffleehheffkeetnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepqhhirghnghdriihhrghosehngihprdgtohhmpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesghhmrghilhdrtghomhdprhgtphhtthhopegiihhusghordfnvggvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhgvshhtv
 ghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitgholhgvohhtshhukhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christophe,

On Fri,  9 May 2025 09:48:44 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> When no post-completion processing is expected, don't waste time
> handling useless interrupts.
> 
> Only set QMC_BD_[R/T]X_I and QMC_BD_[R/T]X_UB when a completion
> function is passed in.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/soc/fsl/qe/qmc.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index 36c0ccc06151..0a704fd0b1a0 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -474,7 +474,9 @@ int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
>  	xfer_desc->context = context;
>  
>  	/* Activate the descriptor */
> -	ctrl |= (QMC_BD_TX_R | QMC_BD_TX_UB);
> +	ctrl |= QMC_BD_TX_R;
> +	if (complete)
> +		ctrl |= QMC_BD_TX_I | QMC_BD_TX_UB;

Be careful, you don't set the UB bit for all descriptor anymore.
Your goal, is to have interrupts only on some descriptors (those where I
bit is set).

This can lead to issue in the function handling the interrupt.
This function, qmc_chan_write_done(), do the processing according to the
following:
        /*
	 * R bit  UB bit
	 *   0       0  : The BD is free
	 *   1       1  : The BD is in used, waiting for transfer
	 *   0       1  : The BD is in used, waiting for completion
	 *   1       0  : Should not append
	 */
https://elixir.bootlin.com/linux/v6.15-rc5/source/drivers/soc/fsl/qe/qmc.c#L507

It considers R=0 / UB=0 as a free BD and R=1 / UB=0 as a case that should
not happen.

Both cases are no more correct with your modification.

Have the feeling that UB bit still has to be set even if I bit is not set
in order to have qmc_chan_write_done() looking at all descriptors.

Suppose:
 desc 0, no interrupt
 desc 1, no interrupt
 desc 2, interrupt

When the interrupt for desc 2 is handled, desc 0 and desc 1 are seen with
R=0 and UB=0. As desc 0 is considered as free by qmc_chan_write_done(), it
will never look at desc 2.

>  	wmb(); /* Be sure to flush the descriptor before control update */
>  	qmc_write16(&bd->cbd_sc, ctrl);
>  
> @@ -586,7 +588,9 @@ int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
>  		  QMC_BD_RX_AB | QMC_BD_RX_CR);
>  
>  	/* Activate the descriptor */
> -	ctrl |= (QMC_BD_RX_E | QMC_BD_RX_UB);
> +	ctrl |= QMC_BD_RX_E;
> +	if (complete)
> +		ctrl |= QMC_BD_RX_I | QMC_BD_RX_UB;

Exact same comment.


Best regards,
Hervé

