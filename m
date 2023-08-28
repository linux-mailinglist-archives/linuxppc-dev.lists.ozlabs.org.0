Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8C178B885
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 21:39:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uRgmWe/4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZLVQ5481z3bgs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 05:39:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uRgmWe/4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZLTW5Bk3z2xqq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 05:38:55 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4252C61FA9;
	Mon, 28 Aug 2023 19:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49159C433C7;
	Mon, 28 Aug 2023 19:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693251531;
	bh=L5/usRoTQkY0NoAqxhYEBU7YzcbiHRwN9h1q1YuPI1s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uRgmWe/4dw2beWc7pVFw+c0KIFlChQsMUW35wruhyGQV9RuOdaP4I0p2mU8f32xUs
	 s5Jn586gfW8hgaxlFyQfbCrYxuBKLJNCCb6Nf/7bGEqNZtyfUBeR3l6sa/zfH0bUoi
	 A1XafmFpvV86FksFScJqp63/tL/4OGBNEu5j0+m/9pQYxAyn0DeRF5qUZ9NkXBnw3r
	 mkZc99nSlPdIh0lTih1NV5o0GSO3epl8KgwQ6OaxRxileksbOrrsxaUsK5d+pDdaOV
	 TNjp+8Z6qS6e9Ev/xHfzcRuQuKcP3nICPAIVvy+doX1Cnn2DbbMbGwd3UPWVQwMVno
	 8iSS5pKYfHpmg==
Date: Mon, 28 Aug 2023 12:38:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Alexandra Diupina <adiupina@astralinux.ru>, Zhao Qiang
 <qiang.zhao@nxp.com>
Subject: Re: [PATCH v3] fsl_ucc_hdlc: process the result of hold_open()
Message-ID: <20230828123849.69466f0a@kernel.org>
In-Reply-To: <20230828121235.13953-1-adiupina@astralinux.ru>
References: <896acfac-fadb-016b-20ff-a06e18edb4d9@csgroup.eu>
	<20230828121235.13953-1-adiupina@astralinux.ru>
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
Cc: lvc-project@linuxtesting.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 28 Aug 2023 15:12:35 +0300 Alexandra Diupina wrote:
> Process the result of hold_open() and return it from
> uhdlc_open() in case of an error
> It is necessary to pass the error code up the control flow,
> similar to a possible error in request_irq()
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: c19b6d246a35 ("drivers/net: support hdlc function for QE-UCC")
> Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
> ---
> v3: Fix the commits tree
> v2: Remove the 'rc' variable (stores the return value of the 
> hdlc_open()) as Christophe Leroy <christophe.leroy@csgroup.eu> suggested
>  drivers/net/wan/fsl_ucc_hdlc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
> index 47c2ad7a3e42..4164abea7725 100644
> --- a/drivers/net/wan/fsl_ucc_hdlc.c
> +++ b/drivers/net/wan/fsl_ucc_hdlc.c
> @@ -731,7 +731,7 @@ static int uhdlc_open(struct net_device *dev)
>  		napi_enable(&priv->napi);
>  		netdev_reset_queue(dev);
>  		netif_start_queue(dev);
> -		hdlc_open(dev);
> +		return hdlc_open(dev);

Don't you have to undo all the things done prior to hdlc_open()?

Before you post v4 please make sure that you've read:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#resending-after-review

Zhao, please review the next version.
-- 
pw-bot: cr
