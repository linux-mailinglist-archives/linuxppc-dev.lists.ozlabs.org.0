Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 022C22C38E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 07:00:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgqxK2FfNzDr4r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 17:00:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgqYv4fRTzDqdd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 16:43:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VJAZ/jJz; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CgqYt3zhmz9sSs;
 Wed, 25 Nov 2020 16:43:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606283010;
 bh=3LAUEpq1wObIwU9ezJFWWUNQZ1td88N2WZdNNoXSTE4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VJAZ/jJz+1cMe0Ve8wVLRfoe94evycN1QlnghDS02IuY5/+OxwHCUdqvIAmunCJDj
 +/RyZ8Ajl2XiwL+Rmy0LN6K8byUciQvaRCoObJpZ11WzLHsT0Nt0T8D8RJj7JeWdiD
 6xK9OOwxI4evYZzZA2fjowt5/BqF+PdtTYd4/Ngl5sI6a5N2fb8UBZup8dcJw0/tQK
 qUIIMstgMi4sgjADChc7mlGm2Vi3oFTBDPTFVak/OVa8ZQHQfUWX1AH0CUHNRD2r9v
 nZNqQpQ+i9d+C6e4huAwUSz+M0gsWBKsj3uYore6AztKpzI2zCBwQge1mkdUTcf4My
 pvEBSuuk7EDVw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thomas Falcon <tlfalcon@linux.ibm.com>, netdev@vger.kernel.org
Subject: Re: [PATCH net 1/2] ibmvnic: Ensure that SCRQ entry reads are
 correctly ordered
In-Reply-To: <1606238776-30259-2-git-send-email-tlfalcon@linux.ibm.com>
References: <1606238776-30259-1-git-send-email-tlfalcon@linux.ibm.com>
 <1606238776-30259-2-git-send-email-tlfalcon@linux.ibm.com>
Date: Wed, 25 Nov 2020 16:43:26 +1100
Message-ID: <87o8jmyosh.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: cforno12@linux.ibm.com, ljp@linux.vnet.ibm.com, ricklind@linux.ibm.com,
 dnbanerg@us.ibm.com, tlfalcon@linux.ibm.com, drt@linux.vnet.ibm.com,
 brking@linux.vnet.ibm.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Falcon <tlfalcon@linux.ibm.com> writes:
> Ensure that received Subordinate Command-Response Queue (SCRQ)
> entries are properly read in order by the driver. These queues
> are used in the ibmvnic device to process RX buffer and TX completion
> descriptors. dma_rmb barriers have been added after checking for a
> pending descriptor to ensure the correct descriptor entry is checked
> and after reading the SCRQ descriptor to ensure the entire
> descriptor is read before processing.
>
> Fixes: 032c5e828 ("Driver for IBM System i/p VNIC protocol")
> Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
> ---
>  drivers/net/ethernet/ibm/ibmvnic.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> index 2aa40b2..489ed5e 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.c
> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> @@ -2403,6 +2403,8 @@ static int ibmvnic_poll(struct napi_struct *napi, int budget)
>  
>  		if (!pending_scrq(adapter, adapter->rx_scrq[scrq_num]))
>  			break;
> +		/* ensure that we do not prematurely exit the polling loop */
> +		dma_rmb();

I'd be happier if these comments were more specific about which read(s)
they are ordering vs which other read(s).

I'm sure it's obvious to you, but it may not be to a future author,
and/or after the code has been refactored over time.

>  		next = ibmvnic_next_scrq(adapter, adapter->rx_scrq[scrq_num]);
>  		rx_buff =
>  		    (struct ibmvnic_rx_buff *)be64_to_cpu(next->
> @@ -3098,6 +3100,9 @@ static int ibmvnic_complete_tx(struct ibmvnic_adapter *adapter,
>  		unsigned int pool = scrq->pool_index;
>  		int num_entries = 0;
>  
> +		/* ensure that the correct descriptor entry is read */
> +		dma_rmb();
> +
>  		next = ibmvnic_next_scrq(adapter, scrq);
>  		for (i = 0; i < next->tx_comp.num_comps; i++) {
>  			if (next->tx_comp.rcs[i]) {
> @@ -3498,6 +3503,9 @@ static union sub_crq *ibmvnic_next_scrq(struct ibmvnic_adapter *adapter,
>  	}
>  	spin_unlock_irqrestore(&scrq->lock, flags);
>  
> +	/* ensure that the entire SCRQ descriptor is read */
> +	dma_rmb();
> +
>  	return entry;
>  }

cheers
