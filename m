Return-Path: <linuxppc-dev+bounces-667-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E17B96249A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 12:18:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv0kR01MXz2yZN;
	Wed, 28 Aug 2024 20:18:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724840334;
	cv=none; b=Ls4CibMgqt+F4qiKwustUl5jCau+cyz7oPMOl0jAvFBauICtPpQnjhsTc0nBK9RqbVOPzchrGJfNNM5H7NM2GwB4TqsWmWi+b3etu56Da4Odp87vwaaCGREpoIZp6f4LEClAuINpE/NndOXoY7FSS6euP/J8CoPhVUD31d7CLkhUYle/P3Xz1mWaK7fp9jTNb6vzjiABMV06m0WXbsws1dp5JN1pq5+Qwk14qVoG8QLnvYky37KOKoc3LGU6Q+smt7m1scJHL5cKCpfFSc/cIFS77wik0CZgH3VwGWlbbTY97yP5XcjWM4ldiE9poN9R2QVEThssrfKQZLKz3VQQpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724840334; c=relaxed/relaxed;
	bh=++GdwCer1MfOjw10GsEdsmaobreRajyTrVmcnLMLKHk=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=N245U+FvEsEvlX55X/DYp7WOLR2CY5HX/kC7Q8YGRi0wHrw0tO28/W1xA7UAbGc7cn63bBIvdgM/TLFFIUCnEYlbWwgiB/JMg3h+pxGHyba0tGK3cnyNUe6ovEUADb71Y/z3FSD1msHLYA8b7kOJb1AjudnCEwkye0efQFyADkOQq6xiNK6NmAREUMDYvyrmq/exRztukxlae1r592bwTsqVk0DDFGF4eZW1pgaH+JgpWJ+0yfrRVxr+HpAuPLHmRFuujwVRgfUO+i1DwzPt6X7hInyYKKuBEp5lT0/OabFAHFkkOP+cvK7XgdR6j0yeqsf+FRu7XeyPLZfasold1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv0kQ4wMSz2yYn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 20:18:54 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wv0kM5zJMz9sRy;
	Wed, 28 Aug 2024 12:18:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wconnBVW9-Lt; Wed, 28 Aug 2024 12:18:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wv0kM5B9Sz9sRs;
	Wed, 28 Aug 2024 12:18:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A05508B78F;
	Wed, 28 Aug 2024 12:18:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id E3dYZevYEYVw; Wed, 28 Aug 2024 12:18:51 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2CE418B764;
	Wed, 28 Aug 2024 12:18:51 +0200 (CEST)
Message-ID: <cdea1768-b44c-4bf5-931b-10f9357ed4cb@csgroup.eu>
Date: Wed, 28 Aug 2024 12:18:51 +0200
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
Subject: Re: [PATCH net-next 3/6] net: ethernet: fs_enet: drop the
 .adjust_link custom fs_ops
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
 <20240828095103.132625-4-maxime.chevallier@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240828095103.132625-4-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 28/08/2024 à 11:50, Maxime Chevallier a écrit :
> There's no in-tree user for the fs_ops .adjust_link() function, so we
> can always use the generic one in fe_enet-main.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 7 +------
>   drivers/net/ethernet/freescale/fs_enet/fs_enet.h      | 1 -
>   2 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> index 2b48a2a5e32d..caca81b3ccb6 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> +++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> @@ -649,12 +649,7 @@ static void fs_adjust_link(struct net_device *dev)
>   	unsigned long flags;
>   
>   	spin_lock_irqsave(&fep->lock, flags);
> -
> -	if (fep->ops->adjust_link)
> -		fep->ops->adjust_link(dev);
> -	else
> -		generic_adjust_link(dev);
> -
> +	generic_adjust_link(dev);
>   	spin_unlock_irqrestore(&fep->lock, flags);
>   }
>   
> diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
> index 21c07ac05225..abe4dc97e52a 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
> +++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
> @@ -77,7 +77,6 @@ struct fs_ops {
>   	void (*free_bd)(struct net_device *dev);
>   	void (*cleanup_data)(struct net_device *dev);
>   	void (*set_multicast_list)(struct net_device *dev);
> -	void (*adjust_link)(struct net_device *dev);
>   	void (*restart)(struct net_device *dev);
>   	void (*stop)(struct net_device *dev);
>   	void (*napi_clear_event)(struct net_device *dev);

