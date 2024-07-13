Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 493B19307C4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 00:36:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TNuN/KLn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WM3GT0sYJz30Tv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 08:36:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TNuN/KLn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WM3Fn3tplz30Ts
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 08:35:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 336E360AF6;
	Sat, 13 Jul 2024 22:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C8BC4AF0F;
	Sat, 13 Jul 2024 22:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720910134;
	bh=zQUxCqtUpN52n9YsEQxbjE8McWWkxC6aEh066/NralQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TNuN/KLnVTqee778aHu2dlA7WIyvigcmlfKY3stUj1rxOvT9viyCQynS3KSfb+k1/
	 RHjfRTc7WJvIVjbmeNF0JUkZAPYIe9a4D6umdGtJ7lE6Ii8nf5k7z5zq6bHIFFrt3q
	 7BUAWXjpqb+EEMop9aGkLJQtwUk9k0+dwzQZS3K1v+tvtyrxUDVyDe4fuqrNLCSgDD
	 2kn8QjRQZYWVDxd8jt3VJSUtOf1tJ1ULaZNcDqQ5KmSc3Kl0rlIeubQQ6KhjwvPQxJ
	 v0hn4oHGIyhL3Z/l1s1iubAF92LNani7LBkg1ZzJuVUZrU4IX195xsBvKmGHwL6dxI
	 g3PG5ueJCmocg==
Date: Sat, 13 Jul 2024 15:35:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH net-next 2/5] net: dpaa: eliminate NR_CPUS dependency in
 egress_fqs[] and conf_fqs[]
Message-ID: <20240713153532.28bf1320@kernel.org>
In-Reply-To: <20240710230025.46487-3-vladimir.oltean@nxp.com>
References: <20240710230025.46487-1-vladimir.oltean@nxp.com>
	<20240710230025.46487-3-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Madalin Bucur <madalin.bucur@nxp.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Breno Leitao <leitao@debian.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 11 Jul 2024 02:00:22 +0300 Vladimir Oltean wrote:
> +	priv->egress_fqs = devm_kcalloc(dev, dpaa_max_num_txqs(),
> +					sizeof(*priv->egress_fqs),
> +					GFP_KERNEL);
> +	if (!priv->egress_fqs)
> +		goto free_netdev;
> +
> +	priv->conf_fqs = devm_kcalloc(dev, dpaa_max_num_txqs(),
> +				      sizeof(*priv->conf_fqs),
> +				      GFP_KERNEL);
> +	if (!priv->conf_fqs)
> +		goto free_netdev;

Gotta set err before jumping
-- 
pw-bot: cr
