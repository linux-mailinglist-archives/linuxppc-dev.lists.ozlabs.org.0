Return-Path: <linuxppc-dev+bounces-5998-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B70ACA2DBDE
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2025 10:50:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrNH42tMlz2yVv;
	Sun,  9 Feb 2025 20:50:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739094608;
	cv=none; b=cDZAU0VE5jhIVBWOumeNLSZUh9iOVgnyVXqFsvyb1CEzgPNABT4oxc15pblxeyBydfrvjoKn5YZ5Nv+7Uw/JLIktIykyRptehV0JxtrkQO/QdnNq8+6tYAlmB0rVHAuqcK/76+0xQCUGrAIZC3xQBoK1A1VitQM9iA8ZZPk42c9q7cuXwg5Qz3fkTSx58zsokJk0xP/QbeHPPNUa2eFYamLaKf6YXYgNaYQCHSbU1LvJ7Y2SysqDBknIKykqq7XZPdJMqpV5S4j6YJnpSSuWJZOv2eLieFSlJ+GSbdpr86xhnLmRdW4KZnGvJ4vEZ9e7ifpIQ9cA4Dm6W8l+HQP/rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739094608; c=relaxed/relaxed;
	bh=Z3bKHEYmP4NrCF3rYVJ3ZWLrLHw6gos/4l/0/P4BDng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VR3Q8L2+AP/yI9ZfI40j8MvloD8z/UYjHPVl+nYDjP1/wEHZj/07dLJyc7s+R31omMKAxpYjttZHm8wMaZgh37q1n7IhAJiJK4qVuknrXK0u15JEZ6SWJxCi8HPGoz7U00aOJ+5c6IFy7Qb/xtremWXdShA1mOvsQkNWET6aP6P+kw0yIVPUkNET+tFVwInM2+6d7pmNU1Tfu4DJDR1fWusW3eOWmGQaCMM5CIv8/N5RAZPUx2UgdGyn0iqtfCmEcHd94XE6ZBWcVvGW7GwRD9xDxKYoCCIV9A2Sp/F2GhEwx/ffMxnfrsfnpnyT/RO0qt1TRG18anIa1A4RrNcVCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrNH33NRmz2xmS
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2025 20:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YrMpP1Dw5z9sRr;
	Sun,  9 Feb 2025 10:28:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DDi-BSp373Uq; Sun,  9 Feb 2025 10:28:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YrMpP0PSMz9sRk;
	Sun,  9 Feb 2025 10:28:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F275D8B764;
	Sun,  9 Feb 2025 10:28:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id lJDIllVd9YL8; Sun,  9 Feb 2025 10:28:44 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C8D78B763;
	Sun,  9 Feb 2025 10:28:44 +0100 (CET)
Message-ID: <0203253b-4bda-4e66-b7e6-e74300c44c80@csgroup.eu>
Date: Sun, 9 Feb 2025 10:28:42 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: phy: remove unused PHY_INIT_TIMEOUT
 definitions
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <11be8192-b722-4680-9d1c-3e4323afc27f@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <11be8192-b722-4680-9d1c-3e4323afc27f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 08/02/2025 à 22:14, Heiner Kallweit a écrit :
> Both identical definitions of PHY_INIT_TIMEOUT aren't used,
> so remove them.

Would be good to say when it stopped being used, ie which commit or 
commits removed its use.

Also why only remove PHY_INIT_TIMEOUT ? For instance PHY_FORCE_TIMEOUT 
also seems to be unused. PHY_CHANGE_TIME as well.

> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/net/ethernet/freescale/ucc_geth.h | 1 -
>   include/linux/phy.h                       | 1 -
>   2 files changed, 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/ucc_geth.h b/drivers/net/ethernet/freescale/ucc_geth.h
> index 38789faae..03b515240 100644
> --- a/drivers/net/ethernet/freescale/ucc_geth.h
> +++ b/drivers/net/ethernet/freescale/ucc_geth.h
> @@ -890,7 +890,6 @@ struct ucc_geth_hardware_statistics {
>   							   addresses */
>   
>   #define TX_TIMEOUT                              (1*HZ)
> -#define PHY_INIT_TIMEOUT                        100000
>   #define PHY_CHANGE_TIME                         2
>   
>   /* Fast Ethernet (10/100 Mbps) */
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index 3028f8abf..9cb86666c 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -293,7 +293,6 @@ static inline long rgmii_clock(int speed)
>   	}
>   }
>   
> -#define PHY_INIT_TIMEOUT	100000
>   #define PHY_FORCE_TIMEOUT	10
>   
>   #define PHY_MAX_ADDR	32


