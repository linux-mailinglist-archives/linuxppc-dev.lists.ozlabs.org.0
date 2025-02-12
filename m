Return-Path: <linuxppc-dev+bounces-6115-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AF0A31E4C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 06:53:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yt6t50c1Jz305D;
	Wed, 12 Feb 2025 16:53:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739339581;
	cv=none; b=FWkX3p2OFonn7yyoUCWvKqRxuHuh1nBeLOBINyFHZYXUutihDeid59HZg64Sj9vzk6ta0/beX2iu0Kmb5ioUthkV59E2jozoH0HewNJl3d67qG9LScPc8ilzFpoO/Bhtoqon3JmApGn8gZzw2xvsTmgJHEMfwK3pYzCE9EN2LUeLjXXCvlTnQoPh7LJxraXWScR+A8dzOsOvEWafnVIb15g15tWgu8FRBBz6vkRTAUfMwopurnohsG7Jbl/fWiQFsx09B0qz/+z8UQAWVI4qbkEncChPIwwLwsq/iy2MhVpAKprhaenBbvuRZ/QDPKLF8eTG12Luqmf9ezL5rYfl2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739339581; c=relaxed/relaxed;
	bh=eZiBt4pZE/UW9jYH5Ey3sC6ZWiA6kPC//1fNsO6WdQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SbBE2unkyvh7Li6kAinPiLE7/9DjbtWLtdoqHc+WjOhAipG+1Ihpx9hu86P+MttQvO9R7bFaHP1XTlK+VHUU9BgtKD2bcHhA7I6VJWB1qPm5S9vRME8OT5ib2S9Cjlpi5uJJRbf9B7O5wFsYrdjsb/jKDEg0v7xB5jxSrCgJ6v5geRwoEqWwjC051J8dclzjWAWDR/iATK6G75AIVOKF5wcxB7mwlRi7AT+XyVJWd6ULByyDTCKhIuhTqq1KMCprZ4n1UIKNpvdd3BKiwPDxraCDJJECzdhJDlHn27hmTcU7UDoMhelK30uWsHzy46TbPpHLYSlEpyWkiBwqJ7rUPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zx3D+BuL; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zx3D+BuL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yt6t41bwvz2yF4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 16:53:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3AB60A40F35;
	Wed, 12 Feb 2025 05:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DCBC4CEDF;
	Wed, 12 Feb 2025 05:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739339577;
	bh=7ABNck4OSdeOsAGaKMgFtu9kfL0XbHjNUpueljNrBmU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zx3D+BuLnJMdMW33p7kLC9PykFcyt0BhStNllTw2J0jO/6f//eB3WxZGNTN5q+7R8
	 0o2UxTRcMfbawSjnT+PNhIFCUCbqiz+DCX/NcIIs/txS2hI3nlEG1+n+73XAyl2Qlt
	 yqkybpddM7K9ink5eomzh35ThmguCqHnJ0xZZRcIkxwowccaLVhYFE0WwerrUP9fti
	 YLl+3w6x/AiuBWyz3ZfDxdMWdqMawHojpOqgaMiP4cSZ/vy4CxxeXrddFXa8EciCU1
	 W5sDKNhiVualLJGqQJDgiuDSmNUib2dPmDrIFyYar527jTjYAm8qjBzzD8tPAcL/ro
	 J09i7CUDr7L0w==
Message-ID: <cb2db0c4-6f3a-4d44-90e5-b37cbe5e66fb@kernel.org>
Date: Wed, 12 Feb 2025 06:52:46 +0100
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
Subject: Re: [PATCH 2/9] net: bcmasp: Add missing of_node_get() before
 of_find_node_by_name()
To: Zhang Zekun <zhangzekun11@huawei.com>, robh@kernel.org,
 saravanak@google.com, justin.chen@broadcom.com,
 florian.fainelli@broadcom.com, andrew+netdev@lunn.ch, kuba@kernel.org,
 o.rempel@pengutronix.de, kory.maincent@bootlin.com,
 jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
 laurent.pinchart+renesas@ideasonboard.com, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, taras.chornyi@plvision.eu, edumazet@google.com,
 pabeni@redhat.com, sudeep.holla@arm.com, cristian.marussi@arm.com
Cc: arm-scmi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, chenjun102@huawei.com
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-3-zhangzekun11@huawei.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250207013117.104205-3-zhangzekun11@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 07/02/2025 02:31, Zhang Zekun wrote:
> of_find_node_by_name() will decrease the refcount of the device_node.
> So, get the device_node before passing to it.
> 
> Fixes: 490cb412007d ("net: bcmasp: Add support for ASP2.0 Ethernet controller")
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
> ---
>  drivers/net/ethernet/broadcom/asp2/bcmasp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.c b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
> index a68fab1b05f0..093c8ea72af9 100644
> --- a/drivers/net/ethernet/broadcom/asp2/bcmasp.c
> +++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
> @@ -1367,7 +1367,7 @@ static int bcmasp_probe(struct platform_device *pdev)
>  	bcmasp_core_init(priv);
>  	bcmasp_core_init_filters(priv);
>  
> -	ports_node = of_find_node_by_name(dev->of_node, "ethernet-ports");
> +	ports_node = of_find_node_by_name_balanced(dev->of_node, "ethernet-ports");

Why this cannot be of_get_child_by_name()?

Best regards,
Krzysztof

