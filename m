Return-Path: <linuxppc-dev+bounces-7686-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E5FA8B939
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 14:35:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zd0pp5g57z2xjP;
	Wed, 16 Apr 2025 22:34:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744806898;
	cv=none; b=iJgp1uVbUrsDwrGSx5zZafuZRiaXhiqnwLs1esadWYcqVkESdKuNYbthxLTPHm8pH38AIqcqbgfqKbiIb+b/SPdvMHEo+cK49R+0tj/3c8sQyv/cu0crbUFwkA0j+EGkbJcpGdzmzaqcCg6wtzVgFcx1sHyte/LrP9sUYgeq4GkWl+e1l+1GCkAyaX4l4Ri4PSj4QY4EdaRoA4Hmm7KxCJakZR/sqcCV6gfEIYOsBlewvrehQ444vJmcX2jUOfvJDuK5f3twG2sP7rMgvNSXiXtb7H+N/+LAhnAE/eDOnf78PX0HaWSn1c06IV+R9c8EncvsLDtrUf0ewb+Y8AcjnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744806898; c=relaxed/relaxed;
	bh=VyKwPMQDj0Oaz0XIufSBEbxEWcuhmFvy6Xb1QfLBfKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWUprNM/+678jE2nnMyK0QfpfEmEoq0h4ZnIxVgwDsLdZGxkql4oS1ogPBQENJIBrWDFStALGl8tGS9vFklc8VarFIvvF4f7i+DggAD8VT/IQRVMMpjy1eRX94jAMfXZMct9s1YHkonXdhQa1/x5yno1td0OMnDAMpShUQWzxZmHdMqPnQgi/dOGLXkKFydaq8VuwwrRUqHz26YROATpot4xk6siGhDyA6BAPCJ2bYffpQ/tS5UoKcXVlPRErzzOG3ej6hgSFq03TPr2tAwgDuk4pOMguy8H2msgvKWycIdtalfk4OkqIZMFfyABJPeplWIroiP0V4FwMgTnHwsK1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HGR7ML/k; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HGR7ML/k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zd0pn452Fz2xd5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 22:34:57 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E492861135;
	Wed, 16 Apr 2025 12:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6967BC4CEE2;
	Wed, 16 Apr 2025 12:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744806892;
	bh=MQzAdBu/uMebeOJA/sZbwOp+jPQg3Wn4NmMIMqB48Ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HGR7ML/k61FQ1FDw+5qwWmSxs2bICPqLtCebdQiV+rrFlRGCb+cQytXead4oJXV2h
	 7eS8lqlYz+k7UdzujkSijNg3fM9I6YjNNStBsl1D7L6S2d2l9rLVHLAuXVjZnm9WNP
	 96ScdzXOCavsO33Vn5AE0SKhnJc0LdEVmVbyUVvb1xleJVr4HEAUW6ZJ/bakNnaFSG
	 Xihc/B8idKJVFoV9qu1PoknzSE5lzPW+gKN7Fb8/fb9K/SbmJV12W9A++H+DeAi6I5
	 +/NqWTLBaEJBCGQdMP4kntCh+rb/2WZoeYPQI/Pn5a5YL6uY0Y4MBxETwQ7q9hbFEG
	 oYUMv8uF8GELA==
Date: Wed, 16 Apr 2025 13:34:49 +0100
From: Simon Horman <horms@kernel.org>
To: Dave Marquardt <davemarq@linux.ibm.com>
Cc: netdev@vger.kernel.org, michal.swiatkowski@linux.intel.com,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v2 1/2] net: ibmveth: make ibmveth use WARN_ON
 instead of BUG_ON
Message-ID: <20250416123449.GQ395307@horms.kernel.org>
References: <20250414194016.437838-1-davemarq@linux.ibm.com>
 <20250414194016.437838-2-davemarq@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414194016.437838-2-davemarq@linux.ibm.com>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Apr 14, 2025 at 02:40:15PM -0500, Dave Marquardt wrote:
> Replaced BUG_ON calls with WARN_ON calls with error handling, with
> calls to a new ibmveth_reset routine, which resets the device. Removed
> conflicting and unneeded forward declaration.

To me the most important change here is adding the ibmveth_reset.
So I would report that in the subject (rather than the WARN_ON) change.
But perhaps that is just me.

> 
> Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
> ---
>  drivers/net/ethernet/ibm/ibmveth.c | 116 ++++++++++++++++++++++++-----
>  drivers/net/ethernet/ibm/ibmveth.h |  65 ++++++++--------
>  2 files changed, 130 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c

...

> @@ -370,20 +372,36 @@ static void ibmveth_free_buffer_pool(struct ibmveth_adapter *adapter,
>  	}
>  }
>  
> -/* remove a buffer from a pool */
> -static void ibmveth_remove_buffer_from_pool(struct ibmveth_adapter *adapter,
> -					    u64 correlator, bool reuse)
> +/**
> + * ibmveth_remove_buffer_from_pool - remove a buffer from a pool
> + * @adapter: adapter instance
> + * @correlator: identifies pool and index
> + * @reuse: whether to reuse buffer

The above is the correct way to document function parameters in a Kernel doc.

> + *
> + * Return:
> + * * %0       - success
> + * * %-EINVAL - correlator maps to pool or index out of range
> + * * %-EFAULT - pool and index map to null skb
> + */
> +static int ibmveth_remove_buffer_from_pool(struct ibmveth_adapter *adapter,
> +					   u64 correlator, bool reuse)

...

> +/**
> + * ibmveth_rxq_harvest_buffer - Harvest buffer from pool
> + *
> + * @adapter - pointer to adapter
> + * @reuse   - whether to reuse buffer

But this is not correct. IOW, tooling expects
f.e. @adapter: ...  rather than @adapter - ...

Flagged by W=1 builds and ./scripts/kernel-doc -none

> + *
> + * Context: called from ibmveth_poll
> + *
> + * Return:
> + * * %0    - success
> + * * other - non-zero return from ibmveth_remove_buffer_from_pool
> + */
> +static int ibmveth_rxq_harvest_buffer(struct ibmveth_adapter *adapter,
> +				      bool reuse)

...

> diff --git a/drivers/net/ethernet/ibm/ibmveth.h b/drivers/net/ethernet/ibm/ibmveth.h
> index 8468e2c59d7a..b0a2460ec9f9 100644
> --- a/drivers/net/ethernet/ibm/ibmveth.h
> +++ b/drivers/net/ethernet/ibm/ibmveth.h
> @@ -134,38 +134,39 @@ struct ibmveth_rx_q {
>  };
>  
>  struct ibmveth_adapter {
> -    struct vio_dev *vdev;
> -    struct net_device *netdev;
> -    struct napi_struct napi;
> -    unsigned int mcastFilterSize;
> -    void * buffer_list_addr;
> -    void * filter_list_addr;
> -    void *tx_ltb_ptr[IBMVETH_MAX_QUEUES];
> -    unsigned int tx_ltb_size;
> -    dma_addr_t tx_ltb_dma[IBMVETH_MAX_QUEUES];
> -    dma_addr_t buffer_list_dma;
> -    dma_addr_t filter_list_dma;
> -    struct ibmveth_buff_pool rx_buff_pool[IBMVETH_NUM_BUFF_POOLS];
> -    struct ibmveth_rx_q rx_queue;
> -    int rx_csum;
> -    int large_send;
> -    bool is_active_trunk;
> -
> -    u64 fw_ipv6_csum_support;
> -    u64 fw_ipv4_csum_support;
> -    u64 fw_large_send_support;
> -    /* adapter specific stats */
> -    u64 replenish_task_cycles;
> -    u64 replenish_no_mem;
> -    u64 replenish_add_buff_failure;
> -    u64 replenish_add_buff_success;
> -    u64 rx_invalid_buffer;
> -    u64 rx_no_buffer;
> -    u64 tx_map_failed;
> -    u64 tx_send_failed;
> -    u64 tx_large_packets;
> -    u64 rx_large_packets;
> -    /* Ethtool settings */
> +	struct vio_dev *vdev;
> +	struct net_device *netdev;
> +	struct napi_struct napi;
> +	struct work_struct work;
> +	unsigned int mcastFilterSize;
> +	void *buffer_list_addr;
> +	void *filter_list_addr;
> +	void *tx_ltb_ptr[IBMVETH_MAX_QUEUES];
> +	unsigned int tx_ltb_size;
> +	dma_addr_t tx_ltb_dma[IBMVETH_MAX_QUEUES];
> +	dma_addr_t buffer_list_dma;
> +	dma_addr_t filter_list_dma;
> +	struct ibmveth_buff_pool rx_buff_pool[IBMVETH_NUM_BUFF_POOLS];
> +	struct ibmveth_rx_q rx_queue;
> +	int rx_csum;
> +	int large_send;
> +	bool is_active_trunk;
> +
> +	u64 fw_ipv6_csum_support;
> +	u64 fw_ipv4_csum_support;
> +	u64 fw_large_send_support;
> +	/* adapter specific stats */
> +	u64 replenish_task_cycles;
> +	u64 replenish_no_mem;
> +	u64 replenish_add_buff_failure;
> +	u64 replenish_add_buff_success;
> +	u64 rx_invalid_buffer;
> +	u64 rx_no_buffer;
> +	u64 tx_map_failed;
> +	u64 tx_send_failed;
> +	u64 tx_large_packets;
> +	u64 rx_large_packets;
> +	/* Ethtool settings */
>  	u8 duplex;
>  	u32 speed;
>  };

If you would like to update the indentation of this structure
then please do so in a separate patch which precedes
adding/removing/chainging fields of the structure.

As it, it's very hard to see the non-formatting changes in this hunk.

-- 
pw-bot: changes-requested

