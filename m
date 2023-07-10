Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA9274CEA5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 09:39:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OBAbthM1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qzwqj5Mgzz3bsd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 17:39:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OBAbthM1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qzwcx4DXQz2yNy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 17:29:51 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3159d5e409dso200177f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 00:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688974185; x=1691566185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2jy5zTnsEjclW0IAo6TI4KH09ecPC4N8l96twGj5N0E=;
        b=OBAbthM1v1c78/ZzCyTdIpwTdHirp2JVWB3eDHKM3yppE8P3aW7bDozXCSbCfWCGvo
         aUJhkV9MOOBlgcArpIE7XMWjWnsRdnWwGgRD7j1RpPrD6eiToYHeHf0/kHKrsAl7vs9Q
         0LVNAuVBm9Ag0wKK7btutonbmGXnR2ZHigLTSRfxBYaD6A3CvlGEsVGLMurOCq3bsgXN
         kT2XnduE6CYa7eSe9Cm105uUZIE1A28AyWSzVEhqkOhUbrp6kdT/+8dDEGqEYo0mlC0N
         +p/NmuArdn1E3yfJPZxONsLJNo47TFfmB+uq37uCzOY1HYBrZaypYGD2le0rnusaQ9Wu
         fGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688974185; x=1691566185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jy5zTnsEjclW0IAo6TI4KH09ecPC4N8l96twGj5N0E=;
        b=cjcqQitVatwapBty+dafUdoCY/W1xi+9CETXvneyuwOGbqd2CFmLGd8WwJqFuvvBL1
         w2Lzuz9MuxJURsgtV2xFKRrHfVLRZ/oGZqi562YMNXu2IZrjBGPWIaCsE5EZLDjyZo3/
         mx5CczUiWlr2ioed0C+giX+a0uyxeQzIToKYAOJempHhMyr/aqJWw894cOSAw4OpPplQ
         /39AAObTBZGr8F4yatwX0ov0rRBv8cBw/MG/yrt/82Mpak2Tvaz5aToc0hMl4ccbRUnL
         2D6jqjDlC0LL4vpDXSn/joTeMy0MoJrPWPj4OFRO6b9/fyqUqmvDPMb524jHxpRNuVPv
         hLQQ==
X-Gm-Message-State: ABy/qLZjFdJIOl7eZpIUho1fCLdB5GC3oomlwnz21kD0HF8B8fN22Bt6
	PuLoDPo7KL+7QIuzKfG/R3B8QA==
X-Google-Smtp-Source: APBJJlHVp1/4Jh3pSjHcnXhiWDH/u3GR3xaCfeHhiOKMO2azzBEjQPQEy5nxXANY+hMDz9a27mSt/A==
X-Received: by 2002:adf:f592:0:b0:314:1d6:8aa7 with SMTP id f18-20020adff592000000b0031401d68aa7mr10971747wro.29.1688974184893;
        Mon, 10 Jul 2023 00:29:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v12-20020adfe4cc000000b003143cb109d5sm10790399wrm.14.2023.07.10.00.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 00:29:43 -0700 (PDT)
Date: Mon, 10 Jul 2023 10:29:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH net-next v2 01/10] net: wan: Remove unnecessary (void*)
 conversions
Message-ID: <45519aec-6ec8-49e5-b5b2-1b52d336288c@kadam.mountain>
References: <20230710063933.172926-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710063933.172926-1-suhui@nfschina.com>
X-Mailman-Approved-At: Mon, 10 Jul 2023 17:38:31 +1000
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
        ^^^^^
This doesn't look like a real name.

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

Don't move the other variables around.  That's unrelated to the cast.
(Same applies to all the other patches).

regards,
dan carpenter

