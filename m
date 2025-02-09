Return-Path: <linuxppc-dev+bounces-6008-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CF7A2E06C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2025 21:20:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrfG266Hgz2ykf;
	Mon, 10 Feb 2025 07:20:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=81.19.149.120
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739126725;
	cv=none; b=SX4bEGQK4XeWAdTr89utQg0sKUQS6Sgv5pIGALYGkIVXtZ7B/SRb7WniAQfISbTVFlRqWIZssHfmIM+cKKI0gHm+UOP9QSTL6uQIo/aph0ZZtlYD49J8KagjJ89FFAw/bB8dGbMjAXC91I/21HuvmoQ0col17c6Rc2xBI3dmga8MDP1Y1FzfporV5K+x7UMrU9nPglwiEMhbl8uJalJAeKP73Tlf6khXAQw03e/o587Sc0Bs8fpzEcyR9WvB4sRYZFdIhG4JUKDblGNNlXOB8FGSEefU4T4tSMvcAFz7jLOLw0kNQxFADsufFi3w35QCCMhbsVejZswy3MImfGwa5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739126725; c=relaxed/relaxed;
	bh=lJ0M1krCmi4eiwYD2F8NcoMHdmDqLxf3C+ZCd5NYc0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AfXxIJcYen65O1Rak5eQx+8Wi8y+6B4JYZ3m2TrTnRl1JtYN4bjjM3hqUZc4M4UQs95FqCynGt53kv4GW+g8VMTTqUn5ZC2DCje8iFN5pglVdB1+PtKqH+5w6k2QSV1YS7lR9NFLvl+Nzq8r2HOHvahNOGnbiUfdlG+QHcpHXdQ4V7wF4xXr4T7XtC7p3egMRZfhJTro1MgOOxocCeCalUnLS6go3oL5+cRXPfVUOoyhIkT6aL1vyaCgY/E5k7WS0ZWezkHYW/cTOvA1PAosA68dYrQNc9otVR/B/T4y/QVl3UVB1bHfGzSpSgeTC6R8f2W32kOaydUDuM07uLicNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; dkim=pass (1024-bit key; unprotected) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.a=rsa-sha256 header.s=dkim11 header.b=aOs0nG8i; dkim-atps=neutral; spf=pass (client-ip=81.19.149.120; helo=mx10lb.world4you.com; envelope-from=gerhard@engleder-embedded.com; receiver=lists.ozlabs.org) smtp.mailfrom=engleder-embedded.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.a=rsa-sha256 header.s=dkim11 header.b=aOs0nG8i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=engleder-embedded.com (client-ip=81.19.149.120; helo=mx10lb.world4you.com; envelope-from=gerhard@engleder-embedded.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1072 seconds by postgrey-1.37 at boromir; Mon, 10 Feb 2025 05:45:24 AEDT
Received: from mx10lb.world4you.com (mx10lb.world4you.com [81.19.149.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yrc8h3Kptz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 05:45:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lJ0M1krCmi4eiwYD2F8NcoMHdmDqLxf3C+ZCd5NYc0s=; b=aOs0nG8iCgPhMu0X6frAFmWxgo
	jsVXpuqyarFrlcNmBJ6SKf/ou9ZIxO7C0PifSq/w29e5FuYue0zFLiuDsGlb1kG0RZzSbWfH6798Y
	FatCS9D7J9ysG95zHe4VmgErCeP4NPLAAxEd9yOPXj+FdJ3kx5hhQGzMOYXeVqzydv/o=;
Received: from [88.117.60.28] (helo=[10.0.0.160])
	by mx10lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1thC1d-000000006NR-3bxU;
	Sun, 09 Feb 2025 19:27:26 +0100
Message-ID: <3a94fc8d-b2de-4ccf-be41-dc9c1aed26fd@engleder-embedded.com>
Date: Sun, 9 Feb 2025 19:27:24 +0100
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
Subject: Re: [PATCH net-next] net: freescale: ucc_geth: remove unused
 PHY_INIT_TIMEOUT and PHY_CHANGE_TIME
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>
References: <62e9429b-57e0-42ec-96a5-6a89553f441d@gmail.com>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <62e9429b-57e0-42ec-96a5-6a89553f441d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Do-Run: Yes
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 09.02.25 13:27, Heiner Kallweit wrote:
> Both definitions are unused. Last users have been removed with:
> 
> 1577ecef7666 ("netdev: Merge UCC and gianfar MDIO bus drivers")
> 728de4c927a3 ("ucc_geth: migrate ucc_geth to phylib")
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/net/ethernet/freescale/ucc_geth.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/ucc_geth.h b/drivers/net/ethernet/freescale/ucc_geth.h
> index 38789faae..84f92f638 100644
> --- a/drivers/net/ethernet/freescale/ucc_geth.h
> +++ b/drivers/net/ethernet/freescale/ucc_geth.h
> @@ -890,8 +890,6 @@ struct ucc_geth_hardware_statistics {
>   							   addresses */
>   
>   #define TX_TIMEOUT                              (1*HZ)
> -#define PHY_INIT_TIMEOUT                        100000
> -#define PHY_CHANGE_TIME                         2
>   
>   /* Fast Ethernet (10/100 Mbps) */
>   #define UCC_GETH_URFS_INIT                      512	/* Rx virtual FIFO size

Reviewed-by: Gerhard Engleder <gerhard@engleder-embedded.com>

