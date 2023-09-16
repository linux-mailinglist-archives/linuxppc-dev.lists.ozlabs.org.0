Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FDF7A2BE2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 02:23:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=fG0g2Lv6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnWxZ3VX6z3cnc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 10:23:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=fG0g2Lv6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnWwf6vbwz3cKV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 10:22:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=seiFPh/RNGfAZ+in9FMjht9cWbGAXZLBZhZdj4gxOGQ=; b=fG0g2Lv6luE70akUAjd7jkjBIh
	XVu67BwfKuccykyAV6sF/lUJ8QIKXwajn+C+RNrIoFHJX6e9DqpWxbDt9SAssBLFwLFGxLSz5gC5h
	/6heev58te1YmC2dv5COPf0vvoVpr824Mj/q89F+5BlNaKoYKTWSyiUbIiwKxlSdOFxC7Z3NUHhwx
	C5Le8oUXd0VAelGoLhbWdrS3Vq9c/vG56yLBBRyigxhFVBR78bPYiR06R6ZzElZmfsSuZObp2LkyV
	3gEd/e+QLE+pjq8ke9bNW85t/2wbtDnlWXclNv3rjy/VU0PDiwwFT8SCQFXP4BAMzI/EAws8Un4ux
	9ea/7qYQ==;
Received: from [172.59.186.83] (helo=[192.168.12.170])
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJ4H-009iKn-1X;
	Sat, 16 Sep 2023 00:21:52 +0000
Message-ID: <e0ed4f6b-3db0-9729-6582-8a5e3b4e2064@infradead.org>
Date: Fri, 15 Sep 2023 19:21:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH][next] net: spider_net: Use size_add() in call to
 struct_size()
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ishizaki Kou <kou.ishizaki@toshiba.co.jp>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
References: <ZQSvsLmJrDsKtLCa@work>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <ZQSvsLmJrDsKtLCa@work>
Content-Type: text/plain; charset=UTF-8
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/15/23 14:25, Gustavo A. R. Silva wrote:
> If, for any reason, the open-coded arithmetic causes a wraparound,
> the protection that `struct_size()` adds against potential integer
> overflows is defeated. Fix this by hardening call to `struct_size()`
> with `size_add()`.
> 
> Fixes: 3f1071ec39f7 ("net: spider_net: Use struct_size() helper")
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/net/ethernet/toshiba/spider_net.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/toshiba/spider_net.c b/drivers/net/ethernet/toshiba/spider_net.c
> index 50d7eacfec58..87e67121477c 100644
> --- a/drivers/net/ethernet/toshiba/spider_net.c
> +++ b/drivers/net/ethernet/toshiba/spider_net.c
> @@ -2332,7 +2332,7 @@ spider_net_alloc_card(void)
>  	struct spider_net_card *card;
>  
>  	netdev = alloc_etherdev(struct_size(card, darray,
> -					    tx_descriptors + rx_descriptors));
> +					    size_add(tx_descriptors, rx_descriptors)));
>  	if (!netdev)
>  		return NULL;
>  

Looks good to me.  Thanks for your fix-up.

Signed-off-by: Geoff Levand <geoff@infradead.org>


