Return-Path: <linuxppc-dev+bounces-15614-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE86D17452
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 09:25:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr2Nz5lYDz2xWJ;
	Tue, 13 Jan 2026 19:25:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768292707;
	cv=none; b=nEDuKk6b63Y/nUhXmwR3qvJ3mizOfSL0b5RtxWEwtBgaf3LrMg5zbn8DwDvVfv16EgieDJp3+ebRX9cfTBCvZSP2FAfff7dx/Yho1LLzENu2q4gKiIQaDgUX+CX+LDGhaeJbfYhP9weAzmsXrSu4H21ImSywPl6WNgBTPqDk9pHjVHhvOrZYkj/wcMaZpgBvacCxCsNmbrMotx/l+KheF1tGXRVdmf//xgweniPdMLcNcA3Uf/qsczVl8iAUmW83OGgquvc7UGLdsu0VtmvmlQi9wLhXPIPpcXcgDX3X/qqZ0hIg3TvY5etTUWIXVlw+dIs4HPtn7+3SEIJD3C9MTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768292707; c=relaxed/relaxed;
	bh=DFTdcQRu3RLZAeHzvdzPMi9ROu5HP5BsElgCTN/ghV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aI0bOY7CgocJlCayXCDlpHqsU1Y8F+mWdK1A9Rsehf/N1FhD6aR45xctM4UKf73NSDMYde8hpyeFMSaMN4Xd9J5cZZHC0ldYvE9PipxdUBpflESbymZBlnrHDfEbtPxYTVPtdCKMyiBtobxABl3f9zBn2ui7jCqEFFSdzno3gXm016nzbqRHaML2k2CJlPxGCXA6w1lVXqGly/+wyqnakHp6DWSEBLmzZtRmHZIzkd5+OwiY0Fl61cgT6QRPAL2Q1uT5JpZx8Gi0uPEQ5JGjR7kQBE3RfZRKM20LzcEsAQVvm0FOvJudJXFQLQAnUvS5mS8dzUsEF2wOMrx0O6Z3ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nhGdNeqa; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nhGdNeqa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 501 seconds by postgrey-1.37 at boromir; Tue, 13 Jan 2026 19:25:06 AEDT
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr2Ny5P1Fz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 19:25:05 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8B8944E4209D;
	Tue, 13 Jan 2026 08:16:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E5CC60732;
	Tue, 13 Jan 2026 08:16:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C142103C816C;
	Tue, 13 Jan 2026 09:16:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768292198; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=DFTdcQRu3RLZAeHzvdzPMi9ROu5HP5BsElgCTN/ghV8=;
	b=nhGdNeqaXVycptEVEE4Yc70hcOUGXufWSKfT8wu4gtRcq1WzO1mSuNqGnQFH2LGDr2R+gP
	6ElUs7mWC8j5+vUMk8Jyr/8fNmuzbIOxmd+Bztwe6wY8eZjbNTC6GB7GP2uIFtJ5J+05Cf
	sgkSlBt2PzCMDjl5/ImNyT4Or2uf35cbaplHI7XuXn5p7Ehq/BsQrjCGlSLyE4An5kAI2l
	3DhD+QBqlcyfBivJT/baNrVvco2aAs3v1gRLQrXIGSYe0vHULlTT1UphRZRG40TFq34Ya/
	dnMljSfbdtH6HFcDz+KX0iPsfhao+Etf+jb8FNXBXl78/mdzC/FNAWy9YttLQg==
Message-ID: <d89cb3a7-3a55-4bdf-805a-b3386572b220@bootlin.com>
Date: Tue, 13 Jan 2026 09:16:29 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: freescale: ucc_geth: Return early when TBI found
 can't be found
To: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Pei Xiao <xiaopei01@kylinos.cn>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Dan Carpenter <dan.carpenter@linaro.org>, kernel test robot <lkp@intel.com>
References: <20260113074316.145077-1-maxime.chevallier@bootlin.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260113074316.145077-1-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 13/01/2026 08:43, Maxime Chevallier wrote:
> In ucc_geth's .mac_config(), we configure the TBI block represented by a
> struct phy_device that we get from firmware.
> 
> While porting to phylink, a check was missed to make sure we don't try
> to access the TBI PHY if we can't get it. Let's add it and return early
> in case of error
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202601130843.rFGNXA5a-lkp@intel.com/
> Fixes: 53036aa8d031 ("net: freescale: ucc_geth: phylink conversion")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Heh that's what I get from sending patches while having mild fever, the
patch title is all wrong and should be :

net: freescale: ucc_geth: Return early when TBI PHY can't be found

I'll wait for the 24h cooldown, grab some honey + milk and resend after :)

Maxime

> ---
>  drivers/net/ethernet/freescale/ucc_geth.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
> index affd5a6c44e7..131d1210dc4a 100644
> --- a/drivers/net/ethernet/freescale/ucc_geth.c
> +++ b/drivers/net/ethernet/freescale/ucc_geth.c
> @@ -1602,8 +1602,10 @@ static void ugeth_mac_config(struct phylink_config *config, unsigned int mode,
>  			pr_warn("TBI mode requires that the device tree specify a tbi-handle\n");
>  
>  		tbiphy = of_phy_find_device(ug_info->tbi_node);
> -		if (!tbiphy)
> +		if (!tbiphy) {
>  			pr_warn("Could not get TBI device\n");
> +			return;
> +		}
>  
>  		value = phy_read(tbiphy, ENET_TBI_MII_CR);
>  		value &= ~0x1000;	/* Turn off autonegotiation */


