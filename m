Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF8585F1A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 07:51:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ePb7Nmjd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgP1z2QQhz3ccV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 17:51:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ePb7Nmjd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgP1F1jFwz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 17:50:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=BpvOMzy9ulC+09MeE8dtVU205P+hnczqUIcLjP1sEAc=; b=ePb7NmjdTof88AD4C557Y8s1E6
	nMYQHhmw1/yyLWaHGWz7n0DhlxQsmLy2f2rmXBs+8+1oIw0Ok4fL1ft7dMr4wQEpKFzE21fl/MR2p
	CxBcR0d0jL+3yNzXnQSH043qMIccCsPyZNwQPkZnY56fgzM8s+73f8BBLAS2iIpOg+JM0Gw8XY+Mk
	vaVvVI9WbFMc/2FfnmgAaBeEsdCvjw42rSxmKMbEVY+zu5xJuaTtB+ie/PDy0HqqX38gib3roCaUY
	JFZz+1UVIfggyrtR6zYC9oXobnOihdQS93Q2yta9TgM9oT9rF26+C7mQp05pTBBtS7tjbTCEOKgAv
	vh2rcPVg==;
Received: from 124x35x135x198.ap124.ftth.ucom.ne.jp ([124.35.135.198] helo=[192.168.2.109])
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd2uw-00000002qhp-27nM;
	Thu, 22 Feb 2024 06:50:50 +0000
Message-ID: <5548b3f0-437c-4792-ad6a-d08ffe1ba873@infradead.org>
Date: Thu, 22 Feb 2024 15:50:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] ps3/gelic: minor Kernel Doc corrections
Content-Language: en-US
To: Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
References: <20240221-ps3-gelic-kdoc-v1-1-7629216d1340@kernel.org>
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20240221-ps3-gelic-kdoc-v1-1-7629216d1340@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, netdev@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Simon,

On 2/22/24 02:46, Simon Horman wrote:
> * Update the Kernel Doc for gelic_descr_set_tx_cmdstat()
>   and gelic_net_setup_netdev() so that documented name
>   and the actual name of the function match.
> 
> * Move define of GELIC_ALIGN() so that it is no longer
>   between gelic_alloc_card_net() and it's Kernel Doc.
> 
> * Document netdev parameter of gelic_alloc_card_net()
>   in a way consistent to the documentation of other netdev parameters
>   in this file.
> 
> Addresses the following warnings flagged by ./scripts/kernel-doc -none:
> 
>   .../ps3_gelic_net.c:711: warning: expecting prototype for gelic_net_set_txdescr_cmdstat(). Prototype was for gelic_descr_set_tx_cmdstat() instead
>   .../ps3_gelic_net.c:1474: warning: expecting prototype for gelic_ether_setup_netdev(). Prototype was for gelic_net_setup_netdev() instead
>   .../ps3_gelic_net.c:1528: warning: expecting prototype for gelic_alloc_card_net(). Prototype was for GELIC_ALIGN() instead
>   .../ps3_gelic_net.c:1531: warning: Function parameter or struct member 'netdev' not described in 'gelic_alloc_card_net'
> 
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>  drivers/net/ethernet/toshiba/ps3_gelic_net.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> index d5b75af163d3..12b96ca66877 100644
> --- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> +++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> @@ -698,7 +698,7 @@ gelic_card_get_next_tx_descr(struct gelic_card *card)
>  }
>  
>  /**
> - * gelic_net_set_txdescr_cmdstat - sets the tx descriptor command field
> + * gelic_descr_set_tx_cmdstat - sets the tx descriptor command field
>   * @descr: descriptor structure to fill out
>   * @skb: packet to consider
>   *
> @@ -1461,7 +1461,7 @@ static void gelic_ether_setup_netdev_ops(struct net_device *netdev,
>  }
>  
>  /**
> - * gelic_ether_setup_netdev - initialization of net_device
> + * gelic_net_setup_netdev - initialization of net_device
>   * @netdev: net_device structure
>   * @card: card structure
>   *
> @@ -1518,14 +1518,16 @@ int gelic_net_setup_netdev(struct net_device *netdev, struct gelic_card *card)
>  	return 0;
>  }
>  
> +#define GELIC_ALIGN (32)
> +
>  /**
>   * gelic_alloc_card_net - allocates net_device and card structure
> + * @netdev: interface device structure
>   *
>   * returns the card structure or NULL in case of errors
>   *
>   * the card and net_device structures are linked to each other
>   */
> -#define GELIC_ALIGN (32)
>  static struct gelic_card *gelic_alloc_card_net(struct net_device **netdev)
>  {
>  	struct gelic_card *card;
> 

Looks good.  Thanks for taking care of it.

Acked-by: Geoff Levand <geoff@infradead.org>

