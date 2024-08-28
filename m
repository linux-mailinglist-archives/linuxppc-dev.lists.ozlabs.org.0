Return-Path: <linuxppc-dev+bounces-681-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6529624E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 12:27:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv0wf244Hz2yZS;
	Wed, 28 Aug 2024 20:27:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724840866;
	cv=none; b=EdNR2krrDwX7bmqTDdAJaEK0vAaOoizCfIJCKRpMWYXqPuQe4R/emcdA3uEFPFj9uC6IItleAgG3nwDqrDm0YioaOjvrIFK0O6Gvn6umniJrLR1uiP6OZJYVMdeFzz8Ynt/FyH5hyG40u7scX0kSkgF5Cf/zH5WMqMD01ZG8XrSbWYMcJh4fAajvxV9CSTu6YxmmMhMlCAbkW8aXv8Sxjr0OmtHTARHbBGl2dmBtbxtJQMzFltLADZ8H7JiZXHb3YMg9oOVLfIqGXLcBjqegu4QRbuwN7VejZVxCKv/T1XGCrNNh98eJZN4CC2imlrqcgWJRh7xjPjmzS0jTtNQIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724840866; c=relaxed/relaxed;
	bh=fEnEn5hzgBzl0GTPauhMV5Pr0gYQLV6CNqq0JmVprdQ=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=Cj/GWM9/luPVHbI+rI5PeCMDssgJvNqoBcUXvRd16vnyEtW4Ar6qYMUP6G/8ybwQVthwUW1oddYSHg1EnbgS/wnf7m8HB8aR7mDxkoAA1a9icfIo082jOLPe3IHYxvT6qkblNoUmotnXL831OowDJYkhdA+/z2cGoGtQaQs4egNucOBpWMJk3anlLY9F3gfn3mDrfkC70MTaEVUiX7SLfF4ecxarOFyI0ozTjn5HCdYEO1kbauMdbO4nq8Feztz5y1vl/Fp/hJIofYeQD9tsZTnZKPltCU7k5aOd2SfzuR+/+5d0JmcBaXnSIaSFixKfdVWUFZupJxxZugcR//fAsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv0wd71CTz2yK7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 20:27:45 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wv0wb19Lrz9sRy;
	Wed, 28 Aug 2024 12:27:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id atgXkts7Rrq7; Wed, 28 Aug 2024 12:27:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wv0wb0BKxz9sRs;
	Wed, 28 Aug 2024 12:27:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E6DFF8B78F;
	Wed, 28 Aug 2024 12:27:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kG13dQI6O_yt; Wed, 28 Aug 2024 12:27:42 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AA2E98B764;
	Wed, 28 Aug 2024 12:27:42 +0200 (CEST)
Message-ID: <7d62064e-c303-4d74-b213-a29ce16dbb39@csgroup.eu>
Date: Wed, 28 Aug 2024 12:27:42 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 5/6] net: ethernet: fs_enet: fcc: use macros for
 speed and duplex values
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Florian Fainelli
 <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Herve Codina <herve.codina@bootlin.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20240828095103.132625-1-maxime.chevallier@bootlin.com>
 <20240828095103.132625-6-maxime.chevallier@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240828095103.132625-6-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 28/08/2024 à 11:51, Maxime Chevallier a écrit :
> The PHY speed and duplex should be manipulated using the SPEED_XXX and
> DUPLEX_XXX macros available. Use it in the fcc, fec and scc MAC for fs_enet.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


> ---
>   drivers/net/ethernet/freescale/fs_enet/mac-fcc.c | 4 ++--
>   drivers/net/ethernet/freescale/fs_enet/mac-fec.c | 2 +-
>   drivers/net/ethernet/freescale/fs_enet/mac-scc.c | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
> index add062928d99..056909156b4f 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
> +++ b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
> @@ -361,7 +361,7 @@ static void restart(struct net_device *dev)
>   
>   	/* adjust to speed (for RMII mode) */
>   	if (fpi->use_rmii) {
> -		if (dev->phydev->speed == 100)
> +		if (dev->phydev->speed == SPEED_100)
>   			C8(fcccp, fcc_gfemr, 0x20);
>   		else
>   			S8(fcccp, fcc_gfemr, 0x20);
> @@ -387,7 +387,7 @@ static void restart(struct net_device *dev)
>   		S32(fccp, fcc_fpsmr, FCC_PSMR_RMII);
>   
>   	/* adjust to duplex mode */
> -	if (dev->phydev->duplex)
> +	if (dev->phydev->duplex == DUPLEX_FULL)
>   		S32(fccp, fcc_fpsmr, FCC_PSMR_FDE | FCC_PSMR_LPB);
>   	else
>   		C32(fccp, fcc_fpsmr, FCC_PSMR_FDE | FCC_PSMR_LPB);
> diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
> index f75acb3b358f..855ee9e3f042 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
> +++ b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
> @@ -309,7 +309,7 @@ static void restart(struct net_device *dev)
>   	/*
>   	 * adjust to duplex mode
>   	 */
> -	if (dev->phydev->duplex) {
> +	if (dev->phydev->duplex == DUPLEX_FULL) {
>   		FC(fecp, r_cntrl, FEC_RCNTRL_DRT);
>   		FS(fecp, x_cntrl, FEC_TCNTRL_FDEN);	/* FD enable */
>   	} else {
> diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
> index 29ba0048396b..9e5e29312c27 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
> +++ b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
> @@ -338,7 +338,7 @@ static void restart(struct net_device *dev)
>   	W16(sccp, scc_psmr, SCC_PSMR_ENCRC | SCC_PSMR_NIB22);
>   
>   	/* Set full duplex mode if needed */
> -	if (dev->phydev->duplex)
> +	if (dev->phydev->duplex == DUPLEX_FULL)
>   		S16(sccp, scc_psmr, SCC_PSMR_LPB | SCC_PSMR_FDE);
>   
>   	/* Restore multicast and promiscuous settings */

