Return-Path: <linuxppc-dev+bounces-14112-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6A1C504A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 03:05:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5mty0Vb7z2yvJ;
	Wed, 12 Nov 2025 13:04:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762913097;
	cv=none; b=c+abcWepK9Fa/os18GOnRCfP5jmMvPJT9F0rETEKxlVZDxojzo9q66cbXUgIVy4XKM8SmSOHZCzwjNBZrHnVcEXrUeumVdk0Es8UNsalKseFU2teVKOYVzBg1C2G8AeXg9cm4FVRL8pBOn6HTO41BktnYH+NfMyJL1ayRnd635Y4QPMLZuNFgwBJxQ4o4eOnJCgKUdlf22w9TZgo5L/imrkqWRX9ZBa1LuvogoeTKIdkFtUo6HdGrKt7EbMGuSXyyyS7DFpNkeOht8gzCDo0aj9UoU3I5CMUdLkrjPuvQCCpR5FrnWyBQj1iAe2vN7bfc2yw4AondThYf7DLJAgaow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762913097; c=relaxed/relaxed;
	bh=bc10Pyj1FidQejClHXXoH/sDPtnqxBgoZ+uU485nK/s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LG2JoTwhVcRF0fhud6FDXzgpAJvt0kAT5Nwd68Od138uSFWNGAAjUWqstcaSGvVl3CehZVS9zd8rqN3C8RawIyYQeuqZbe4ZIcaKW6zc8E0NeX5bjoQDaAbIHsfijcFSaYHX6aUCLaZHpvHdfqfve/Df/RSh83xG0S9sHhwjOQM+MOetASXqHmCebz8awdgra+L8nIcyA+3hgspLOh/lJOmt8PueUWFuRylm68gZILIZ5C2LXalkAczNaT/Eeagmb2IrhN5ru3eAkFB9tYIBS8l8fAoI/rNJv3HSubrKtww+NFErnpUk2TT3RwGUSzPDc7JDXteYPSOvR96xZbZVmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SfimH5Ym; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SfimH5Ym;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5mtw6H0jz2xFS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 13:04:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D78B46020F;
	Wed, 12 Nov 2025 02:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181E9C4CEF5;
	Wed, 12 Nov 2025 02:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762913093;
	bh=Uz5EtMpVn6519xtKF+vC8bmfybmH8hJy0801N8rm/0E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SfimH5Ymq9+ZbUxv0zM93q32qDniKAP6tfxR1/i/RjL5r7IDdzB55S2ZkvWbTfScU
	 r/ipl1c8XnG3MaW82bNzP+jBX30kmI+EDfRgbwHC6n4ib19i7CyKtvTb7QGJqoSpuw
	 c+pItosmZSbf86kKRMrmlVXqQ41EyVw3wqDctH+G9RiYZ/1rJP9+AETWlmMjn0+idI
	 wFIncnF7vGpvuWtbWgixKjrf/Gvfe0Oeayc8C9CfiYAM9tTgkIx6E2TEzd1oSI6SA0
	 94Obomw2t+GTBbBQyl831yEhgBOPfYjZKkd+wuGFzIupRD3ilLhFkwJ46U88qUKo00
	 NcKHrikY/VIiA==
Date: Tue, 11 Nov 2025 18:04:51 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Florian Fuchs <fuchsfl@gmail.com>
Cc: Geoff Levand <geoff@infradead.org>, netdev@vger.kernel.org, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ps3_gelic_net: handle skb allocation failures
Message-ID: <20251111180451.0ef1dc9c@kernel.org>
In-Reply-To: <20251110114523.3099559-1-fuchsfl@gmail.com>
References: <20251110114523.3099559-1-fuchsfl@gmail.com>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 10 Nov 2025 12:45:23 +0100 Florian Fuchs wrote:
> Handle skb allocation failures in RX path, to avoid NULL pointer
> dereference and RX stalls under memory pressure. If the refill fails
> with -ENOMEM, complete napi polling and wake up later to retry via timer.
> Also explicitly re-enable RX DMA after oom, so the dmac doesn't remain
> stopped in this situation.
> 
> Previously, memory pressure could lead to skb allocation failures and
> subsequent Oops like:
> 
> 	Oops: Kernel access of bad area, sig: 11 [#2]
> 	Hardware name: SonyPS3 Cell Broadband Engine 0x701000 PS3
> 	NIP [c0003d0000065900] gelic_net_poll+0x6c/0x2d0 [ps3_gelic] (unreliable)
> 	LR [c0003d00000659c4] gelic_net_poll+0x130/0x2d0 [ps3_gelic]
> 	Call Trace:
> 	  gelic_net_poll+0x130/0x2d0 [ps3_gelic] (unreliable)
> 	  __napi_poll+0x44/0x168
> 	  net_rx_action+0x178/0x290
> 
> Steps to reproduce the issue:
> 	1. Start a continuous network traffic, like scp of a 20GB file
> 	2. Inject failslab errors using the kernel fault injection:
> 	    echo -1 > /sys/kernel/debug/failslab/times
> 	    echo 30 > /sys/kernel/debug/failslab/interval
> 	    echo 100 > /sys/kernel/debug/failslab/probability
> 	3. After some time, traces start to appear, kernel Oopses
> 	   and the system stops
> 
> Step 2 is not always necessary, as it is usually already triggered by
> the transfer of a big enough file.

Have you actually tested this on a real device?
Please describe the testing you have done rather that "how to test".

> Fixes: 02c1889166b4 ("ps3: gigabit ethernet driver for PS3, take3")
> Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
> ---
>  drivers/net/ethernet/toshiba/ps3_gelic_net.c | 54 +++++++++++++++-----
>  drivers/net/ethernet/toshiba/ps3_gelic_net.h |  1 +
>  2 files changed, 42 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> index 5ee8e8980393..a8121f7583f9 100644
> --- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> +++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
> @@ -259,6 +259,7 @@ void gelic_card_down(struct gelic_card *card)
>  	mutex_lock(&card->updown_lock);
>  	if (atomic_dec_if_positive(&card->users) == 0) {
>  		pr_debug("%s: real do\n", __func__);
> +		timer_delete_sync(&card->rx_oom_timer);
>  		napi_disable(&card->napi);

I think the ordering here should be inverted

>  		/*
>  		 * Disable irq. Wireless interrupts will
> @@ -970,7 +971,8 @@ static void gelic_net_pass_skb_up(struct gelic_descr *descr,
>   * gelic_card_decode_one_descr - processes an rx descriptor
>   * @card: card structure
>   *
> - * returns 1 if a packet has been sent to the stack, otherwise 0
> + * returns 1 if a packet has been sent to the stack, -ENOMEM on skb alloc
> + * failure, otherwise 0
>   *
>   * processes an rx descriptor by iommu-unmapping the data buffer and passing
>   * the packet up to the stack
> @@ -981,16 +983,17 @@ static int gelic_card_decode_one_descr(struct gelic_card *card)
>  	struct gelic_descr_chain *chain = &card->rx_chain;
>  	struct gelic_descr *descr = chain->head;
>  	struct net_device *netdev = NULL;
> -	int dmac_chain_ended;
> +	int dmac_chain_ended = 0;
>  
>  	status = gelic_descr_get_status(descr);
>  
>  	if (status == GELIC_DESCR_DMA_CARDOWNED)
>  		return 0;
>  
> -	if (status == GELIC_DESCR_DMA_NOT_IN_USE) {
> +	if (status == GELIC_DESCR_DMA_NOT_IN_USE || !descr->skb) {
>  		dev_dbg(ctodev(card), "dormant descr? %p\n", descr);
> -		return 0;
> +		dmac_chain_ended = 1;
> +		goto refill;
>  	}
>  
>  	/* netdevice select */
> @@ -1048,9 +1051,10 @@ static int gelic_card_decode_one_descr(struct gelic_card *card)
>  refill:
>  
>  	/* is the current descriptor terminated with next_descr == NULL? */
> -	dmac_chain_ended =
> -		be32_to_cpu(descr->hw_regs.dmac_cmd_status) &
> -		GELIC_DESCR_RX_DMA_CHAIN_END;
> +	if (!dmac_chain_ended)
> +		dmac_chain_ended =
> +			be32_to_cpu(descr->hw_regs.dmac_cmd_status) &
> +			GELIC_DESCR_RX_DMA_CHAIN_END;

TBH handling the OOM inside the Rx function seems a little fragile.
What if there is a packet to Rx as we enter. I don't see any loop here
it just replaces the used buffer..

>  	/*
>  	 * So that always DMAC can see the end
>  	 * of the descriptor chain to avoid
> @@ -1062,10 +1066,12 @@ static int gelic_card_decode_one_descr(struct gelic_card *card)
>  	gelic_descr_set_status(descr, GELIC_DESCR_DMA_NOT_IN_USE);
>  
>  	/*
> -	 * this call can fail, but for now, just leave this
> -	 * descriptor without skb
> +	 * this call can fail, propagate the error
>  	 */
> -	gelic_descr_prepare_rx(card, descr);
> +	int ret = gelic_descr_prepare_rx(card, descr);
> +

please dont declare variables half way thru a function and dont
separate function call from its error check with empty lines

> +	if (ret)
> +		return ret;
>  
>  	chain->tail = descr;
>  	chain->head = descr->next;
> @@ -1087,6 +1093,17 @@ static int gelic_card_decode_one_descr(struct gelic_card *card)
>  	return 1;
>  }
>  
> +/**
> + *  gelic_rx_oom_timer - Restart napi poll if oom occurred
> + *  @t: timer list
> + */

This kdoc is worthless 

> +static void gelic_rx_oom_timer(struct timer_list *t)
> +{
> +	struct gelic_card *card = timer_container_of(card, t, rx_oom_timer);
> +
> +	napi_schedule(&card->napi);
> +}
> +
>  /**
>   * gelic_net_poll - NAPI poll function called by the stack to return packets
>   * @napi: napi structure
> @@ -1099,12 +1116,21 @@ static int gelic_net_poll(struct napi_struct *napi, int budget)
>  {
>  	struct gelic_card *card = container_of(napi, struct gelic_card, napi);
>  	int packets_done = 0;
> +	int work_result = 0;
>  
>  	while (packets_done < budget) {
> -		if (!gelic_card_decode_one_descr(card))
> -			break;
> +		work_result = gelic_card_decode_one_descr(card);
> +		if (work_result == 1) {
> +			packets_done++;
> +			continue;
> +		}
> +		break;

common / success path should be the less indented one.

> +	}
>  
> -		packets_done++;
> +	if (work_result == -ENOMEM) {
> +		napi_complete_done(napi, packets_done);
> +		mod_timer(&card->rx_oom_timer, jiffies + 1);
> +		return packets_done;
>  	}
>  
>  	if (packets_done < budget) {
> @@ -1576,6 +1602,8 @@ static struct gelic_card *gelic_alloc_card_net(struct net_device **netdev)
>  	mutex_init(&card->updown_lock);
>  	atomic_set(&card->users, 0);
>  
> +	timer_setup(&card->rx_oom_timer, gelic_rx_oom_timer, 0);
> +
>  	return card;
>  }
>  
> diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.h b/drivers/net/ethernet/toshiba/ps3_gelic_net.h
> index f7d7931e51b7..c10f1984a5a1 100644
> --- a/drivers/net/ethernet/toshiba/ps3_gelic_net.h
> +++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.h
> @@ -268,6 +268,7 @@ struct gelic_vlan_id {
>  struct gelic_card {
>  	struct napi_struct napi;
>  	struct net_device *netdev[GELIC_PORT_MAX];
> +	struct timer_list rx_oom_timer;
>  	/*
>  	 * hypervisor requires irq_status should be
>  	 * 8 bytes aligned, but u64 member is
> 
> base-commit: 96a9178a29a6b84bb632ebeb4e84cf61191c73d5
-- 
pw-bot: cr

