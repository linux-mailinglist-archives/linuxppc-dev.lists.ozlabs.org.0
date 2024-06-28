Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB1891C3C6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 18:33:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lHxalcyQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9gwR69fRz3cWx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2024 02:33:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lHxalcyQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9gvj12Pgz3bYR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2024 02:32:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 86BD6CE3CF2;
	Fri, 28 Jun 2024 16:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF65C116B1;
	Fri, 28 Jun 2024 16:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719592350;
	bh=12FeweWdT5erYQcQNuT9OiEIqXz4Fbo93Lh15ZIsd4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lHxalcyQUvyRqN+tpUHLDlZIbqFmE8RCdbekJ7ZfajRSegUxJzBEz4/M2jt0HGkrJ
	 MwcTbuVgnwyiwyzlJ/JoV8HMHD3qaAmFYqIZO+I8Pv6ZlZ9OH3zg8VRVex0Q01ImlH
	 /vtQ9TXX6wydwfBiZFn6wj4g84jw1kygj0uJTvQ9FZ6Nr+NqMze4+lOTleOu40nryI
	 bNfCVNFTq0v+ggt/AgM5jKsZtKef+2xolystoQabHJr1+7LBOyAicYZBpkd/TjNRzg
	 V0T0lv4yA2Cs+uHpBGHUw3WAnlfVvoQLRSOMV3slY4iZqlwwaFC49g9aEPOTyDfxd8
	 H+t6rXhy/Yqcg==
Date: Fri, 28 Jun 2024 17:32:26 +0100
From: Simon Horman <horms@kernel.org>
To: Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH 3/4] crypto: caam: Unembed net_dev structure from qi
Message-ID: <20240628163226.GJ783093@kernel.org>
References: <20240624162128.1665620-1-leitao@debian.org>
 <20240624162128.1665620-3-leitao@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624162128.1665620-3-leitao@debian.org>
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, netdev@vger.kernel.org, Pankaj Gupta <pankaj.gupta@nxp.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 24, 2024 at 09:21:21AM -0700, Breno Leitao wrote:
> Embedding net_device into structures prohibits the usage of flexible
> arrays in the net_device structure. For more details, see the discussion
> at [1].
> 
> Un-embed the net_devices from struct caam_qi_pcpu_priv by converting them
> into pointers, and allocating them dynamically. Use the leverage
> alloc_netdev_dummy() to allocate the net_device object at
> caam_qi_init().
> 
> The free of the device occurs at caam_qi_shutdown().
> 
> Link: https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/ [1]
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> PS: Unfortunately due to lack of hardware, this was not tested in real
> hardware.
> 
>  drivers/crypto/caam/qi.c | 43 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/crypto/caam/qi.c b/drivers/crypto/caam/qi.c

...

> @@ -530,6 +530,7 @@ static void caam_qi_shutdown(void *data)
>  
>  		if (kill_fq(qidev, per_cpu(pcpu_qipriv.rsp_fq, i)))
>  			dev_err(qidev, "Rsp FQ kill failed, cpu: %d\n", i);
> +		free_netdev(pcpu_qipriv.net_dev);

Hi Breno,

I don't think you can access pcpu_qipriv.net_dev like this,
as pcpu_qipriv is a per-cpu variable. Perhaps this?

	free_netdev(per_cpu(pcpu_qipriv.net_dev, i));

Flagged by Sparse.

>  	}
>  
>  	qman_delete_cgr_safe(&priv->cgr);

...
