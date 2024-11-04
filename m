Return-Path: <linuxppc-dev+bounces-2834-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DC89BB7EA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 15:35:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhvCD41C2z2yMX;
	Tue,  5 Nov 2024 01:35:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730730936;
	cv=none; b=OpVmQEcYSPseR/7/ok/l1XCrFmPW+uLButHbQV7L3ZcbxU+lsKeXlHcJQQ+Dgvwm497aSARfP8T58TNNyRK/zw6w/PfOmTaJfEu3JXgn0fr6kzjMTNfUFl56ffctcBWwPgKsP0JmAA0fakeqGKDWqBqR4GCitKUwnwyiHCKisOsHGyiel3VW1v7sn6FjXkdzMsbCWsHHeX6XjChuv2xp5GizEjiphXP13kbE0MWAgY5+5FOYDFlN3XnmWxnEBc7MM0XReMGd/I/HvR5LM/bVVRfTfL1AebuuQQi5DypQ3yrrXiNMB4aEmzWlWVI7AbPEtoq1hxZEII8RzZIj8Y1FaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730730936; c=relaxed/relaxed;
	bh=M7J7SxbYNkFOeauNfPcJtMWdixZ4cGL9MkYuvNXSDBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mdgxiWiT3rKFGuLAqUSvanLwZThadgtmLzHGvFDrpuuTeR65yz5hWT9ONsBLZwblo4j8oBkR1EtULv1i3iIkDhzozmnPkITds7WkOw/srnSErZ1mM2jZcRF0EugM3fdytRxGpGiZtwK37Y0hLR3d9A3OADa4soXhT/NXmpbfeq32HUSOd4HdGQVssQvanvq7lqFjGl5Kn+Wf1OzxHe1WxpczJKbBYMm/9kXGDYB+lH5M7XonQX3+EztaTJ5WxumUD+XegmkjWliiASExzgZ9yHfYhgVqFw8TY0sKOQrsnZjRuu1oFZNSsF9YumWVRjj1A111vZKTH9ooP/lbS+Tjrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhvCC4KkDz2xDM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 01:35:35 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XhvC82mfbz9sSX;
	Mon,  4 Nov 2024 15:35:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ttptrm8rp-3y; Mon,  4 Nov 2024 15:35:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XhvC81z3Wz9sSV;
	Mon,  4 Nov 2024 15:35:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 312F18B773;
	Mon,  4 Nov 2024 15:35:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id TRbO97QGNqR3; Mon,  4 Nov 2024 15:35:32 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E86488B763;
	Mon,  4 Nov 2024 15:35:31 +0100 (CET)
Message-ID: <71956f4c-4b08-4ade-a19e-7cda8677c326@csgroup.eu>
Date: Mon, 4 Nov 2024 15:35:31 +0100
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
Subject: Re: [PATCH net-next 3/3] net: dpaa_eth: extract hash using __be32
 pointer in rx_default_dqrr()
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Breno Leitao <leitao@debian.org>,
 Madalin Bucur <madalin.bucur@nxp.com>, Ioana Ciornei
 <ioana.ciornei@nxp.com>, Radu Bulie <radu-andrei.bulie@nxp.com>,
 Sean Anderson <sean.anderson@linux.dev>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20241029164317.50182-1-vladimir.oltean@nxp.com>
 <20241029164317.50182-4-vladimir.oltean@nxp.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241029164317.50182-4-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 29/10/2024 à 17:43, Vladimir Oltean a écrit :
> Sparse provides the following output:
> 
> warning: cast to restricted __be32
> 
> This is a harmless warning due to the fact that we dereference the hash
> stored in the FD using an incorrect type annotation. Suppress the
> warning by using the correct __be32 type instead of u32. No functional
> change.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/net/ethernet/freescale/dpaa/dpaa_eth.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
> index e280013afa63..bf5baef5c3e0 100644
> --- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
> +++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
> @@ -2772,7 +2772,7 @@ static enum qman_cb_dqrr_result rx_default_dqrr(struct qman_portal *portal,
>   	if (net_dev->features & NETIF_F_RXHASH && priv->keygen_in_use &&
>   	    !fman_port_get_hash_result_offset(priv->mac_dev->port[RX],
>   					      &hash_offset)) {
> -		hash = be32_to_cpu(*(u32 *)(vaddr + hash_offset));
> +		hash = be32_to_cpu(*(__be32 *)(vaddr + hash_offset));
>   		hash_valid = true;
>   	}
>   

