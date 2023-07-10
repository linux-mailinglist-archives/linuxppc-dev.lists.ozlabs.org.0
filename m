Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4318174DB27
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 18:35:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=z2G0+8/G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R08kb14vBz3bp7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 02:35:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=z2G0+8/G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R08jh2qglz301f
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 02:34:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jLGZ8Kt5cT2lpnt9z22M2igMnkaIHF8gwZa/YIMfnqM=; b=z2G0+8/GJfV/RuF2lZu7GATCK4
	wsXBdaF4/3pPUB5Nyp+xNiYERioTgNDxfkSML5BjoZGDbndl5UpmdyepkYpVVN41wC/CEmLQaWSqv
	9iPHY5Os1WStwXUKOwkoM6bweMfJ5F8Z6IpqdRJXdKjNKGsGZDFEeRCqMJKusLJ16LRM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qItqK-000xlL-WE; Mon, 10 Jul 2023 18:34:33 +0200
Date: Mon, 10 Jul 2023 18:34:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH net-next v2 01/10] net: wan: Remove unnecessary (void*)
 conversions
Message-ID: <23e98085-8f07-4ee2-8487-8e3b439b69f4@lunn.ch>
References: <20230710063933.172926-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710063933.172926-1-suhui@nfschina.com>
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
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, edumazet@google.com, wuych <yunchuan@nfschina.com>, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, qiang.zhao@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 10, 2023 at 02:39:33PM +0800, Su Hui wrote:
> From: wuych <yunchuan@nfschina.com>
> 
> Pointer variables of void * type do not require type cast.
> 
> Signed-off-by: wuych <yunchuan@nfschina.com>
> ---
>  drivers/net/wan/fsl_ucc_hdlc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
> index 47c2ad7a3e42..73c73d8f4bb2 100644
> --- a/drivers/net/wan/fsl_ucc_hdlc.c
> +++ b/drivers/net/wan/fsl_ucc_hdlc.c
> @@ -350,11 +350,11 @@ static int uhdlc_init(struct ucc_hdlc_private *priv)
>  static netdev_tx_t ucc_hdlc_tx(struct sk_buff *skb, struct net_device *dev)
>  {
>  	hdlc_device *hdlc = dev_to_hdlc(dev);
> -	struct ucc_hdlc_private *priv = (struct ucc_hdlc_private *)hdlc->priv;
> -	struct qe_bd *bd;
> -	u16 bd_status;
> +	struct ucc_hdlc_private *priv = hdlc->priv;
>  	unsigned long flags;
>  	__be16 *proto_head;
> +	struct qe_bd *bd;
> +	u16 bd_status;

When dealing with existing broken reverse Christmas tree, please don't
make it worse with a change. But actually fixing it should be in a
different patch.

We want patches to be obviously correct. By removing the cast and
moving variables around, it is less obvious it is correct, than having
two patches.

       Andrew
