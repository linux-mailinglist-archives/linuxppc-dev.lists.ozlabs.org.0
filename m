Return-Path: <linuxppc-dev+bounces-677-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D769624D8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 12:25:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv0tP3vc7z2ykC;
	Wed, 28 Aug 2024 20:25:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724840749;
	cv=none; b=a3pYuxin6KKQMMSBo6S+XNedQQA6TVc4zngtzjKBsHdqwtnVh098OhvIkfgvJ65ovi7C5BJaPuZQ1ryujKxCs1CbE2sQRJyt/GzK6Ru8+tHvEiuU0ZKIC0ZHxXqbX0OV62KMir3a2PACnwMGyCzqhEwzZT99kw27JiLiUZ3UnfqLary5vbKVLNT6+H04WP3ZhQQXJ+5EsdWILJGdU1s1aBTQgAzshdyFmU1KPdKPF4lp/BBC1dGt0fG6WbqhuzZOhk7cxnHkGQfNYI2K2f5zkcwlXUpDAPHgjJhKkuGTZuIwQXcOvlPvG5rb+pImShNRv60HS/KxZ7JU6DwvYQ+aKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724840749; c=relaxed/relaxed;
	bh=+CF2sxGiEfZbhsB2iQ2eq6XTpIx26BvY3UYPStKDqKg=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=otPN89e0sCx6ME3tFdpDybGZjSPfZpIA15mA1smW0VIL9wgxZ1900LosKGELB5mI+BFLmA151BJXxWBANvJY3dTrGQTOk7zndLpygKgNoetKCnQWd2GWPZc8YepwJWNDdWxfPPEfa7w4rJiRj0Hr3fUzjfwd5eDp54GQEHYtIh++3HXTsIC2gBMucVIh57OujXkf4kgLxnVv95BnRARaGiu7nmICcjOW++GDhWbiidp2kDvJPebErOQaGt2XwC2jPFGT5bvtKsoDmgr1TJ3tp/SXT28deNGUBtGyaIyjHzNn/f46PQqFxSXwB9WAPqhepPo4+JGEGevDbZ4usEZ6xA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv0tP1gNDz2yjR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 20:25:48 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wv0tL2JWkz9sRy;
	Wed, 28 Aug 2024 12:25:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0csFDQsZFCn; Wed, 28 Aug 2024 12:25:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wv0tL1PSXz9sRs;
	Wed, 28 Aug 2024 12:25:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 168FC8B78F;
	Wed, 28 Aug 2024 12:25:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id hrt9wAXyhJ1B; Wed, 28 Aug 2024 12:25:46 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BB88F8B764;
	Wed, 28 Aug 2024 12:25:45 +0200 (CEST)
Message-ID: <cbe686fb-9bcf-4f25-ab26-a5330d10ad99@csgroup.eu>
Date: Wed, 28 Aug 2024 12:25:45 +0200
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
Subject: Re: [PATCH net-next 4/6] net: ethernet: fs_enet: drop unused phy_info
 and mii_if_info
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
 <20240828095103.132625-5-maxime.chevallier@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240828095103.132625-5-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 28/08/2024 à 11:51, Maxime Chevallier a écrit :
> There's no user of the struct phy_info, the 'phy' field and the
> mii_if_info in the fs_enet driver, probably dating back when phylib
> wasn't as widely used.  Drop these from the driver code.

Seems like they haven't been used since commit 5b4b8454344a ("[PATCH] 
FS_ENET: use PAL for mii management")

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>   drivers/net/ethernet/freescale/fs_enet/fs_enet.h | 11 -----------
>   1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
> index abe4dc97e52a..781f506c933c 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
> +++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
> @@ -92,14 +92,6 @@ struct fs_ops {
>   	void (*tx_restart)(struct net_device *dev);
>   };
>   
> -struct phy_info {
> -	unsigned int id;
> -	const char *name;
> -	void (*startup) (struct net_device * dev);
> -	void (*shutdown) (struct net_device * dev);
> -	void (*ack_int) (struct net_device * dev);
> -};
> -
>   /* The FEC stores dest/src/type, data, and checksum for receive packets.
>    */
>   #define MAX_MTU 1508		/* Allow fullsized pppoe packets over VLAN */
> @@ -153,10 +145,7 @@ struct fs_enet_private {
>   	cbd_t __iomem *cur_rx;
>   	cbd_t __iomem *cur_tx;
>   	int tx_free;
> -	const struct phy_info *phy;
>   	u32 msg_enable;
> -	struct mii_if_info mii_if;
> -	unsigned int last_mii_status;
>   	int interrupt;
>   
>   	int oldduplex, oldspeed, oldlink;	/* current settings */

