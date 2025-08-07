Return-Path: <linuxppc-dev+bounces-10722-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F895B1D838
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 14:47:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byRlY4JN5z3cR8;
	Thu,  7 Aug 2025 22:47:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754570873;
	cv=none; b=cA/7I0A2rnpHW0PcQRfJnzMKwYr4Y1xqGzMMHrqKEu3M9Gxsma37prMBl+X4WiQhGvBtWOvvWNYBorApMZcezh4+PsQCtM/q+yHu6rAIU0f5PBoyk706G+e3y1p3J3BMtAgvbi+QEPMDeP1YjUJFcC2pWtOYJuHt/9z3oR+JhCVPy3C9Dir2gLzSHHZn5aeiAE/ESJSy4NpqYLGPbwiel1K1YsHKDGkSIitk0nRVAJyeqkQTJKGPMerge0/QAQiSxFuedM0pm0XIZJBxUHCbuTH2QowVf/uwTc9bx3kT38IEdW1+cvX3euTVzXVaQbIhKhvFYA3Jl/Q6ZsVgZ4KPww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754570873; c=relaxed/relaxed;
	bh=7U+/hi1NU75wi5GyHPqbltoDvWO6scxSVbUq/rTUbyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJjqtqFm9fy5tg8ucSV65eE8DY1uTWsa3wBncRTD/uV5AcXNP+THss9n3HISrU+NP/x+7UAqlQzHmuYNt5mO+EpbZAG2jNzYXz9nWz3WCZaaldqGUNFDXvt6AE+J7P9q67HxZukpfsOLv4tGi41yh+vD//pFuuu15L4xcUQFBuACEFSq9/LtnbZFzOzLxf2BiN60jV4MxdP/qddmlAja0nwT1PVoAVGl+5kuHps6mSxWJfNVi1sbMlvRJH3YIMfn5Vp9Y8aXjPwbA74yyHuSOddeXDDMZzeWjqtalWYK0Ww/mApGe/XkAL55e2GM33t61UzrgKYGUqMygcvT3RQ4Fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i8wUd7ug; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i8wUd7ug;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byRlW6Chzz3cQs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 22:47:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4B015C65DA;
	Thu,  7 Aug 2025 12:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5277DC4CEEB;
	Thu,  7 Aug 2025 12:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754570868;
	bh=+egBy+RMpqLtNh79AR9yQ2T/2DAqtjLVFMqu+wyMIP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i8wUd7ugI+2eJCVQlgR+OWX8+BpJQNJTOm6DQpGqSByBgbhWZ4JMAe4XUxtOwcUHQ
	 ZamyIuuHFEKz0UhGPx01ZSJcNMDpG+tPY0tqtokc6dam69DCtoqxhjzWwIpA5biQ9r
	 CMBRVoGYIdMh68PaqAxLX62m1Xy6PI9Iiu1llWywiYt+A8zMlqmCW/v5nvmeSv7r1b
	 5F/Iq1i3cCuCQONi46KeKCIyflVwZ+3RqCLqYGUKKHEXYLkUqgrDstXnlmXLb4wOSw
	 DgBDrwpoig72ZM19FeM5ZOgqTzP3lAEA6ac22715rowvudm/PNG4umLM6RC3iFDwY+
	 i8DGTMrazccHw==
Date: Thu, 7 Aug 2025 13:47:44 +0100
From: Simon Horman <horms@kernel.org>
To: Mingming Cao <mmc@linux.ibm.com>
Cc: netdev@vger.kernel.org, bjking1@linux.ibm.com, haren@linux.ibm.com,
	ricklind@linux.ibm.com, kuba@kernel.org, edumazet@google.com,
	pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com, mpe@ellerman.id.au
Subject: Re: [PATCH net-next v4] ibmvnic: Increase max subcrq indirect
 entries with fallback
Message-ID: <20250807124744.GJ61519@horms.kernel.org>
References: <20250806184449.94278-1-mmc@linux.ibm.com>
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
In-Reply-To: <20250806184449.94278-1-mmc@linux.ibm.com>
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Aug 06, 2025 at 11:44:49AM -0700, Mingming Cao wrote:
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
> Changes since v3:
> Link to v3: https://www.spinics.net/lists/netdev/msg1112828.html
> - consolidate H_PARAMTER handling & subcrq ind desc limit reset for RX/TX
>   into a helper function
> - Cleanup and clarify comments in post migration case
> - Renamed the limits to be a clear and simple name

Thanks for the updates.

I'm sorry for not mentioning this in my review of v3, but net-next
is currently closed for the merge window. Could you please repost,
or post a v4, once it re-opens. That should happen once v6.17-rc1
has been released. Probably early next week (week of 11th August).

My minor nits below notwithstanding this looks good to me.
So feel free to include.

Reviewed-by: Simon Horman <horms@kernel.org>

N.b.: I will be on a break when net-next reopens.
      So please don't wait for feedback from me then.

> 
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

These days it is preferable to put the revision history here.
Rather than above your Signed-off-by line, as is currently the case.

>  drivers/net/ethernet/ibm/ibmvnic.c | 59 ++++++++++++++++++++++++++----
>  drivers/net/ethernet/ibm/ibmvnic.h |  6 ++-
>  2 files changed, 56 insertions(+), 9 deletions(-)

Or here.

> 
> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c

...

> @@ -6369,6 +6400,19 @@ static int ibmvnic_reset_init(struct ibmvnic_adapter *adapter, bool reset)
>  			rc = reset_sub_crq_queues(adapter);
>  		}
>  	} else {
> +		if (adapter->reset_reason == VNIC_RESET_MOBILITY) {
> +			/* After an LPM, reset the max number of indirect
> +			 * subcrq descriptors per H_SEND_SUB_CRQ_INDIRECT
> +			 * hcall to the default max (e.g POWER8 -> POWER10)
> +			 *
> +			 * If the new destination platform does not support
> +			 * the higher limit max (e.g. POWER10-> POWER8 LPM)
> +			 * H_PARAMETER will trigger automatic fallback to the
> +			 * safe minimium limit.

minimum

> +			 */
> +			adapter->cur_max_ind_descs = IBMVNIC_MAX_IND_DESCS;
> +		}
> +
>  		rc = init_sub_crqs(adapter);
>  	}

...

> diff --git a/drivers/net/ethernet/ibm/ibmvnic.h b/drivers/net/ethernet/ibm/ibmvnic.h

> index 246ddce753f9..480dc587078f 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.h
> +++ b/drivers/net/ethernet/ibm/ibmvnic.h
> @@ -29,8 +29,9 @@
>  #define IBMVNIC_BUFFS_PER_POOL	100
>  #define IBMVNIC_MAX_QUEUES	16
>  #define IBMVNIC_MAX_QUEUE_SZ   4096
> -#define IBMVNIC_MAX_IND_DESCS  16
> -#define IBMVNIC_IND_ARR_SZ	(IBMVNIC_MAX_IND_DESCS * 32)
> +#define IBMVNIC_MAX_IND_DESCS 128
> +#define IBMVNIC_SAFE_IND_DESC 16
> +#define IBMVNIC_IND_MAX_ARR_SZ (IBMVNIC_MAX_IND_DESCS * 32)

nit: maybe move towards using tabs before the values here?

+#define IBMVNIC_MAX_IND_DESCS	128
+#define IBMVNIC_SAFE_IND_DESC	16
+#define IBMVNIC_IND_MAX_ARR_SZ	(IBMVNIC_MAX_IND_DESCS * 32)

...

-- 
pw-bot: deferred

