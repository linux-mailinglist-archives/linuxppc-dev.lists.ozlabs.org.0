Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A340247A73
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 00:29:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVpcV2bCHzDqQR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 08:29:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=netronome.com
 (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com;
 envelope-from=simon.horman@netronome.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=El20VIDg; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVbg66tRHzDqP0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 00:15:39 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id bs17so12406537edb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 07:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5GU+hvhFq5FTqZEE9oONoXIkAiVxgc+Oe9aNa54OoQw=;
 b=El20VIDg2NdzHYr8IDobZ35xvin+mYvK5IfVN6E9Mz2vqJozybe5i/2Wlxsfn/Sw/y
 f0k6vhoiwuZpjkzNSH7o+/kxhGMI3IyIdKA4L1csfLFdCS6VvpM1KpyCMatdms38ockb
 vn6Q6r/gun8WRAuHZEgnHoD53UF7AoIaf1iQ4RKKUOFzHezYOMIPu4FjKKdkid1QrTsN
 XYkEGMgZuM9FY7pC3oZAX3Vg3vp1JBtMrz/WWZifbhpZStXw/b3vMHLDcnShb+UIMLC4
 o9oDwufDPJMlMN5ma80n0X1ZjkPVvlDsh9iTTR2Y6qpP13GK5L2sWymrfnPwd48VcEor
 G8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5GU+hvhFq5FTqZEE9oONoXIkAiVxgc+Oe9aNa54OoQw=;
 b=iunpIxFlD9evEmIlH8JNTH6P0wyqURSdpZMA/1b49RzdaY3OZp565ZBWbf0RkzhKWS
 FjLO2E7pa/wULTixKiInOTYNVKWe4nYGWiFQqaYReIhUwZWNLKLkGTJt+JvC1bmV+L0X
 wWiFXSCxSsaYRc1XVxV+X7KHzBs2iuWPQ3SZsXM1opUe16rAPq3LyeHEpVVZ3R4etlCz
 z/Oux3XuE5Mee7P0RcW70j0lGMADiPq7z1A4ueMjf66Hwt7v5yje59+CrJ7HWVaSLIoW
 1b+VV6DRWJIg9vAr71aWlA0gzdI4D3BIhIQvMIXnZgivg9Ja1w4Lk+fSQcivejCQfwzo
 b4sA==
X-Gm-Message-State: AOAM5324ndBl+hvHteklLY9VbvG+ju+nitve+h247UcdnyEY4lNe+RD8
 INt68qo9mczZziXuFgJ3/jV1Ow==
X-Google-Smtp-Source: ABdhPJzjr9ZxRXnAgQ3pOgNu0n1L4UO5JB4hdIav5PocnLg1VrC/U2k8Jix0avX3cyR6efPTsghljQ==
X-Received: by 2002:a05:6402:3121:: with SMTP id
 dd1mr15268241edb.72.1597673735048; 
 Mon, 17 Aug 2020 07:15:35 -0700 (PDT)
Received: from netronome.com ([2001:982:7ed1:403:9eeb:e8ff:fe0d:5b6a])
 by smtp.gmail.com with ESMTPSA id g19sm14563399ejz.5.2020.08.17.07.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 07:15:34 -0700 (PDT)
Date: Mon, 17 Aug 2020 16:15:33 +0200
From: Simon Horman <simon.horman@netronome.com>
To: Allen Pais <allen.lkml@gmail.com>
Subject: Re: [oss-drivers] [PATCH 16/20] ethernet: netronome: convert
 tasklets to use new tasklet_setup() API
Message-ID: <20200817141532.GA4130@netronome.com>
References: <20200817082434.21176-1-allen.lkml@gmail.com>
 <20200817082434.21176-18-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817082434.21176-18-allen.lkml@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 18 Aug 2020 08:22:15 +1000
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
Cc: jes@trained-monkey.org, borisp@mellanox.com, keescook@chromium.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org, kda@linux-powerpc.org,
 cooldavid@cooldavid.org, dougmill@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-acenic@sunsite.dk, oss-drivers@netronome.com, kuba@kernel.org,
 Romain Perier <romain.perier@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 mlindner@marvell.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 17, 2020 at 01:54:30PM +0530, Allen Pais wrote:
> In preparation for unconditionally passing the
> struct tasklet_struct pointer to all tasklet
> callbacks, switch to using the new tasklet_setup()
> and from_tasklet() to pass the tasklet pointer explicitly.
> 
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>

Reviewed-by: Simon Horman <simon.horman@netronome.com>

But:

This series should be targeted at net-next, and thus have net-next in its
subject

	[PATCH net-next x/y] ...

And it should be posted when net-next is open: it is currently closed.

	http://vger.kernel.org/~davem/net-next.html

> ---
>  drivers/net/ethernet/netronome/nfp/nfp_net_common.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/netronome/nfp/nfp_net_common.c b/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
> index 39ee23e8c0bf..1dcd24d899f5 100644
> --- a/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
> +++ b/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
> @@ -2287,9 +2287,9 @@ static bool nfp_ctrl_rx(struct nfp_net_r_vector *r_vec)
>  	return budget;
>  }
>  
> -static void nfp_ctrl_poll(unsigned long arg)
> +static void nfp_ctrl_poll(struct tasklet_struct *t)
>  {
> -	struct nfp_net_r_vector *r_vec = (void *)arg;
> +	struct nfp_net_r_vector *r_vec = from_tasklet(r_vec, t, tasklet);
>  
>  	spin_lock(&r_vec->lock);
>  	nfp_net_tx_complete(r_vec->tx_ring, 0);
> @@ -2337,8 +2337,7 @@ static void nfp_net_vecs_init(struct nfp_net *nn)
>  
>  			__skb_queue_head_init(&r_vec->queue);
>  			spin_lock_init(&r_vec->lock);
> -			tasklet_init(&r_vec->tasklet, nfp_ctrl_poll,
> -				     (unsigned long)r_vec);
> +			tasklet_setup(&r_vec->tasklet, nfp_ctrl_poll);
>  			tasklet_disable(&r_vec->tasklet);
>  		}
>  
> -- 
> 2.17.1
> 
