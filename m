Return-Path: <linuxppc-dev+bounces-10673-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B12BB1BAC6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 21:14:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxNQw3hLCz3blg;
	Wed,  6 Aug 2025 05:14:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754421288;
	cv=none; b=oZsDBkUUCsUGLBBpymjAtfqEBFUtMKVEMU+4IZNN8neSzqUSH9A7ZZNVXIdyBwh8OIkL3PMRtqWEOvB/4SIK6bPfkUh+1/Taf4G8atoR1AGK9Kgh6mSBr7hmhd4f+OSM2vckIyQiN86qji7VagRF8PPVGrMvjIytsVfz9IRnwIzwmrbYLwgdDcAnmOFlIcqLt0p8cnedaUfeR2cBCdxEvKSs/trkPkcH+w+JlOWrLI19COqOPH3JecBidZWG0JTNanRYouMCTKr9MWvGfaIhyTakziyuL6uul7L/w5H7UhtzPQQGmZsfsmWu8gdDH+SnkNm8Ou+suFcbbjyfPwV3vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754421288; c=relaxed/relaxed;
	bh=E04hp16oCzu7VbNG7XYvIT9if+uPmtLmVgKY4onVOjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvIDr6i/UY8l4AIAf3bHYXEkR91MM72no4cNGedaIMrRbNPXCqsycY7KH87gIwdPqkebSqYPd2Sp7tBsgtQCyEOmt6vYU0uE0ghRxj0m7Lw2WdGwGeGFHGHAVraXWgMIS6VofntMRDWExEB4JSpiYLPVUgG7s8BYeLE6N9Oei9+0NEQvDWhG8Xa4aL568Rn36E8VcumIx5Nr+cIaMQCAlo43lMCcFXbRlFSQDhmgFXE3lK2UuLVg556t20aOKdxFQLH86BFgCaamyh7iEGU3B1FhUhJYkqwaLWGSVfyMHGK5oe1IIiAPjrUhy5FTzUX2XifSKkWKsvoVYG33cy2dPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G3dPcJal; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G3dPcJal;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxNQt4DN3z3bkg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 05:14:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E89B35C66FF;
	Tue,  5 Aug 2025 19:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756CCC4CEF0;
	Tue,  5 Aug 2025 19:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754421283;
	bh=AEMRptBFjWgx5a1Ym2+nos+6PWqs3+LMFSgUwIQVLIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G3dPcJalG17ku7oEIWTs5Ls+56/huVhNo7/lzR90I0htrrz3cEHs7K3JuTfISRBle
	 va/0F1/10adpotN5Uc/5tAHF1l7hZ80hMaHe5FJjE83hAH8iOw77tUU6BVmBMjIfeu
	 qpobc6zP75QG8ccIFWUaKTd+EVQBlBnDhbz6kzWcTnCqQs/RE22Wxf33cicK5O6b3c
	 3L4U+DNMkCEFq1GsHbV1Zt5ZogZvNmedvWY0Z9RoygIID374LQ6zG7o0q2JBhTSZAA
	 gZ3veMfODYsLMsmrGsWQJIvc81oegoOaXf21Bi+OaHgGEXEkYHRSBUN5xI7j50jt1g
	 4L9q5OIRtiLZw==
Date: Tue, 5 Aug 2025 20:14:36 +0100
From: Simon Horman <horms@kernel.org>
To: Mingming Cao <mmc@linux.ibm.com>
Cc: netdev@vger.kernel.org, bjking1@linux.ibm.com, haren@linux.ibm.com,
	ricklind@linux.ibm.com, kuba@kernel.org, edumazet@google.com,
	pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com, mpe@ellerman.id.au
Subject: Re: [PATCH v3 net-next] ibmvnic: Increase max subcrq indirect
 entries with fallback
Message-ID: <20250805191436.GY8494@horms.kernel.org>
References: <20250804231704.12309-1-mmc@linux.ibm.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250804231704.12309-1-mmc@linux.ibm.com>
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 04, 2025 at 04:17:04PM -0700, Mingming Cao wrote:
> POWER8 support a maximum of 16 subcrq indirect descriptor entries per
>  H_SEND_SUB_CRQ_INDIRECT call, while POWER9 and newer hypervisors
>  support up to 128 entries. Increasing the max number of indirect
> descriptor entries improves batching efficiency and reduces
> hcall overhead, which enhances throughput under large workload on POWER9+.
> 
> Currently, ibmvnic driver always uses a fixed number of max indirect
> descriptor entries (16). send_subcrq_indirect() treats all hypervisor
> errors the same:
>  - Cleanup and Drop the entire batch of descriptors.
>  - Return an error to the caller.
>  - Rely on TCP/IP retransmissions to recover.
>  - If the hypervisor returns H_PARAMETER (e.g., because 128
>    entries are not supported on POWER8), the driver will continue
>    to drop batches, resulting in unnecessary packet loss.
> 
> In this patch:
> Raise the default maximum indirect entries to 128 to improve ibmvnic
> batching on morden platform. But also gracefully fall back to
> 16 entries for Power 8 systems.
> 
> Since there is no VIO interface to query the hypervisor’s supported
> limit, vnic handles send_subcrq_indirect() H_PARAMETER errors:
>  - On first H_PARAMETER failure, log the failure context
>  - Reduce max_indirect_entries to 16 and allow the single batch to drop.
>  - Subsequent calls automatically use the correct lower limit,
>     avoiding repeated drops.
> 
> The goal is to  optimizes performance on modern systems while handles
> falling back for older POWER8 hypervisors.
> 
> Performance shows 40% improvements with MTU (1500) on largework load.
> 
> --------------------------------------
> Changes since v2:
> link to v2: https://www.spinics.net/lists/netdev/msg1104669.html
> 
> -- was Patch 4 from a patch series v2. v2 introduced a module parameter
> for backward compatibility. Based on review feedback, This patch handles
> older systems fall back case without adding a module parameter.
> 
> Signed-off-by: Mingming Cao <mmc@linux.ibm.com>
> Reviewed-by: Brian King <bjking1@linux.ibm.com>
> Reviewed-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  drivers/net/ethernet/ibm/ibmvnic.c | 56 ++++++++++++++++++++++++++----
>  drivers/net/ethernet/ibm/ibmvnic.h |  6 ++--
>  2 files changed, 53 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c

...

> @@ -862,6 +862,19 @@ static void replenish_rx_pool(struct ibmvnic_adapter *adapter,
>  failure:
>  	if (lpar_rc != H_PARAMETER && lpar_rc != H_CLOSED)
>  		dev_err_ratelimited(dev, "rx: replenish packet buffer failed\n");
> +
> +	/* Detect platform limit H_PARAMETER */
> +	if (lpar_rc == H_PARAMETER &&
> +	    adapter->cur_max_ind_descs > IBMVNIC_MAX_IND_DESC_MIN) {
> +		netdev_info(adapter->netdev,
> +			    "H_PARAMETER, set ind desc to safe limit %u\n",
> +			    IBMVNIC_MAX_IND_DESC_MIN);
> +		adapter->cur_max_ind_descs = IBMVNIC_MAX_IND_DESC_MIN;
> +	}

Hi Mingming, all,

The logic above seems to appear twice in this patch.
I think it would be good to consolidate it somehow.
E.g. in a helper function.

> +
> +	/* for all error case, temporarily drop only this batch
> +	 * Rely on TCP/IP retransmissions to retry and recover
> +	 */

Thanks for adding this comment.
Although perhaps 'for' -> 'For'.

Likewise below.

>  	for (i = ind_bufp->index - 1; i >= 0; --i) {
>  		struct ibmvnic_rx_buff *rx_buff;
>  
> @@ -2381,16 +2394,33 @@ static int ibmvnic_tx_scrq_flush(struct ibmvnic_adapter *adapter,
>  		rc = send_subcrq_direct(adapter, handle,
>  					(u64 *)ind_bufp->indir_arr);
>  
> -	if (rc)
> +	if (rc) {
> +		dev_err_ratelimited(&adapter->vdev->dev,
> +				    "tx_flush failed, rc=%u (%llu entries dma=%pad handle=%llx)\n",
> +				    rc, entries, &dma_addr, handle);
> +		/* Detect platform limit H_PARAMETER */
> +		if (rc == H_PARAMETER &&
> +		    adapter->cur_max_ind_descs > IBMVNIC_MAX_IND_DESC_MIN) {
> +			netdev_info(adapter->netdev,
> +				    "H_PARAMETER, set ind descs to safe limit %u\n",
> +				    IBMVNIC_MAX_IND_DESC_MIN);
> +			adapter->cur_max_ind_descs = IBMVNIC_MAX_IND_DESC_MIN;
> +		}
> +
> +		/* for all error case, temporarily drop only this batch
> +		 * Rely on TCP/IP retransmissions to retry and recover
> +		 */
>  		ibmvnic_tx_scrq_clean_buffer(adapter, tx_scrq);
> -	else
> +	} else {
>  		ind_bufp->index = 0;
> +	}
>  	return rc;
>  }

...

> @@ -6369,6 +6399,17 @@ static int ibmvnic_reset_init(struct ibmvnic_adapter *adapter, bool reset)
>  			rc = reset_sub_crq_queues(adapter);
>  		}
>  	} else {
> +		if (adapter->reset_reason == VNIC_RESET_MOBILITY) {
> +			/* post migrtione reset the max
> +			 * indirect descriptors per hcall to be default max
> +			 * (e.g p8 ->p10)
> +			 * if the destination is on the platform supports
> +			 * do not support max (e.g. p10->p8) the threshold
> +			 * will be reduced to safe min limit for p8 later
> +			 */

nits: Post migration, reset.

      The line breaking seems uneven.

      And if p8 and p10 are POWER8 and POWER10 then I think it would
      be worth spelling that out.
 
> +			adapter->cur_max_ind_descs = IBMVNIC_MAX_IND_DESC_MAX;
> +		}
> +
>  		rc = init_sub_crqs(adapter);
>  	}
>  

...

> diff --git a/drivers/net/ethernet/ibm/ibmvnic.h b/drivers/net/ethernet/ibm/ibmvnic.h
> index 246ddce753f9..829a16116812 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.h
> +++ b/drivers/net/ethernet/ibm/ibmvnic.h
> @@ -29,8 +29,9 @@
>  #define IBMVNIC_BUFFS_PER_POOL	100
>  #define IBMVNIC_MAX_QUEUES	16
>  #define IBMVNIC_MAX_QUEUE_SZ   4096
> -#define IBMVNIC_MAX_IND_DESCS  16
> -#define IBMVNIC_IND_ARR_SZ	(IBMVNIC_MAX_IND_DESCS * 32)
> +#define IBMVNIC_MAX_IND_DESC_MAX 128
> +#define IBMVNIC_MAX_IND_DESC_MIN 16

...MAX...{MAX,MIN} seems like an unfortunate name.
But I don't feel particularly strongly about this one.

> +#define IBMVNIC_IND_MAX_ARR_SZ (IBMVNIC_MAX_IND_DESC_MAX * 32)
>  
>  #define IBMVNIC_TSO_BUF_SZ	65536
>  #define IBMVNIC_TSO_BUFS	64

...

