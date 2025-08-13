Return-Path: <linuxppc-dev+bounces-10929-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E3FB24706
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 12:20:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c249w3pcxz30Vf;
	Wed, 13 Aug 2025 20:19:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8:216:3eff:fe9d:e7b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755080388;
	cv=none; b=FxvsXBfDKQFfTBmEyxRlOIVjoFC+XDWIR7e1dd/UVcvrTw+eZawfMEWEoJ6jA/d3BJb4br5+ci2Px+cJ4GDSo17OKKiMoptke+OHJXFi7U18flq0O631uiDoDIYmGxtR+rYuYguZ1QlEaT4A/NDj9oJC5+LfRduvUkI2wlYefM7y3BRNAq3aV56PNhQpuilUbJsPr51UPWvyolRhHZ3HUriis6OILrNr8MRD/ynaf6VH+ytjYT5mwK6KgXEvN+A0fpHg5FfwvfXELSscwMNc22nxtoprVAco9brq6rcXQT/fsjLEud/dFiUnw9KbYltB4eZCsx416yKHhACQHQVjMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755080388; c=relaxed/relaxed;
	bh=92PIXEVT8Ixzby8qIvoqZV3y8yASO5P1j9bblpffSDI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bjZHxMZH9Uq+UYKGCAdSAPMYIoCT33bW3c6xD4fNI9wfAX6GHnDaA4+uw1U02exEuGd0Ort32v04S0pspEgup/iUe0zcNyisMuhrHgeHL5tLUAJTUMO568CMTBsTqfiktOqChkjO8iNhFAO1ykFeJQR0aNi2JQpnBv3tGrtex2C00lWML6+DkEXtega17s/hEl6Zgg+5OstRP9DmRHQIVCxqlf7Nq2xXW2gZq2Rhj8FA8acchjXkVTry+2L9kJ6Mv3sXogY+7CKUPmgk63m23QBqC0IeV+n8PX8TfeKtlmgaxF5NZcEJMxjJATY0fU91zpSGRfuIbWxtuBVZ3Qhb2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Lx0+IBzy; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Lx0+IBzy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [IPv6:2001:4b98:dc4:8:216:3eff:fe9d:e7b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c249t30trz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 20:19:46 +1000 (AEST)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id CD1635801B8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 10:07:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 010A943A0E;
	Wed, 13 Aug 2025 10:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755079624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=92PIXEVT8Ixzby8qIvoqZV3y8yASO5P1j9bblpffSDI=;
	b=Lx0+IBzyJDg5esoCFnwqsP2JW9x31tMSRoSLDz7BcU+YI+doD+qy6tqzxdbFQATuZpzIfU
	Yfy7+yt96LT5AcQ8eq/UDwR3GhDFAWNz5noQFA7aUuay/RFWrMbPlzb+BpZAcH9ypNcb1W
	IhZEabkj2nITM+Tgu5l7jFyOpcOdkj9uk3nq4CHkf3AxAYJaotHVZbDMU3p2eOIAwssMkh
	QHWUnqNyX56qzHLIn3YzSJLhv4mj5lWcVupbf/UEubRv5rfYXlILE21tsIkj8J3jo3Cdh6
	bacpjidH0UHPx3/8yDWeLdkGmGnAApfuxued2TIDSrh0K0Oz4dJPlt5GFvLZRA==
Date: Wed, 13 Aug 2025 12:07:03 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 3/4] ASoC: fsl: fsl_qmc_audio: Only request
 completion on last channel
Message-ID: <20250813120703.6e8eed30@bootlin.com>
In-Reply-To: <21eb89cc03a1c2135bdaba6a4dd1d0c2e624ce29.1754993232.git.christophe.leroy@csgroup.eu>
References: <cover.1754993232.git.christophe.leroy@csgroup.eu>
 <21eb89cc03a1c2135bdaba6a4dd1d0c2e624ce29.1754993232.git.christophe.leroy@csgroup.eu>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeejleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefflefhieduteegffeifeeggfffvdeuvdeutddvfeduudeukeffleehheffkeetnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggstdekmeelkeeltgemkedttddtmehfugekudemleehgegvmedvudehrgemfeeluddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdtkeemleeklegtmeektddttdemfhgukedumeelheegvgemvdduhegrmeefledutddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepqhhirghnghdriihhrghosehngihprdgtohhmpdhrtghpthhtohepshhhvghnghhjihhurdifr
 ghnghesghhmrghilhdrtghomhdprhgtphhtthhopegiihhusghordfnvggvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitgholhgvohhtshhukhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 12 Aug 2025 12:50:57 +0200
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
> so when the last one finishes it is guaranteed that the other ones are
> finished as well. Therefore only request completion processing on the
> last QMC channel.
> 
> On my board with the above exemple, on a kernel started with
> 'threadirqs' option, the QMC irq thread uses 16% CPU time with this
> patch while it uses 26% CPU time without this patch.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  sound/soc/fsl/fsl_qmc_audio.c | 46 +++++------------------------------
>  1 file changed, 6 insertions(+), 40 deletions(-)
> 

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé



-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

