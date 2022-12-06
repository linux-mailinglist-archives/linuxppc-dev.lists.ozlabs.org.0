Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6CC644242
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 12:38:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRJM004Dzz3c69
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 22:38:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.45; helo=mail-wr1-f45.google.com; envelope-from=wei.liu.linux@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRJLR3fBJz3bTs
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Dec 2022 22:37:33 +1100 (AEDT)
Received: by mail-wr1-f45.google.com with SMTP id h10so13506219wrx.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Dec 2022 03:37:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dEEPgYHWLWGN87zsbE4biUqCxTkyL0Hp4s+LmxL1OA=;
        b=c+ZhVmXcFBcBYZ1CqnAuO2BT4uDt/GoBVl/FSV7k7maqIQ9jw3ettvRtUBqKt6olcT
         Gc48TfH4lgpUu8yqhUrEFgxO9Xna+0zlL/aAZ2tK5iQ1vUgpyYY1JcA51f8R1khN1xLR
         y6z2qgdJSqXgUOUghDyKAIod+mQN08DxcEBFjKXa7LSzm4G8eRZP7vWnRQSrb2849J0i
         C4sw21jsI7A2CrN1A/YqLR8IRdhiefJU8rJZuZLVKV1XqPtCylh9jI15wYYgBG47NU/y
         JW+2UGi8ZHSJlOTQUULENyka6YSTekuQZ+d10qFF6UZqeATYgtrHT6YTjaimlBVDUglp
         C+/g==
X-Gm-Message-State: ANoB5pnF/zy5FcrVA8zTzggd/K4n4vh8htx5dzRiTzfEBymwHmaX14mF
	BOaKs8N3oM97YXPxtG47UKA=
X-Google-Smtp-Source: AA0mqf5IQao7pI3S55ozIZ3UILwG0zwLXEWSh3JhE8Rsg0wuM8pdCGyXY1E8JKqEYaIaMJ9EdjlENQ==
X-Received: by 2002:a5d:5385:0:b0:242:f8d:fcee with SMTP id d5-20020a5d5385000000b002420f8dfceemr27418643wrv.86.1670326648777;
        Tue, 06 Dec 2022 03:37:28 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id q17-20020a05600000d100b0024207ed4ce0sm16635553wrx.58.2022.12.06.03.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 03:37:27 -0800 (PST)
Date: Tue, 6 Dec 2022 11:37:26 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Dawei Li <set_pte_at@outlook.com>
Subject: Re: [PATCH 1/6] hyperv: Make remove callback of hyperv driver void
 returned
Message-ID: <Y48pdr9DEmXShhFR@liuwe-devbox-debian-v2>
References: <20221205153644.60909-1-set_pte_at@outlook.com>
 <TYCP286MB232373567792ED1AC5E0849FCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB232373567792ED1AC5E0849FCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
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
Cc: jgross@suse.com, wei.liu@kernel.org, sstabellini@kernel.org, linux-hyperv@vger.kernel.org, gregkh@linuxfoundation.org, haiyangz@microsoft.com, linuxppc-dev@lists.ozlabs.org, decui@microsoft.com, alsa-devel@alsa-project.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, oleksandr_tyshchenko@epam.com, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, xen-devel@lists.xenproject.org, johannes@sipsolutions.net, kys@microsoft.com, robert.jarzmik@free.fr, roger.pau@citrix.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 05, 2022 at 11:36:39PM +0800, Dawei Li wrote:
> Since commit fc7a6209d571 ("bus: Make remove callback return
> void") forces bus_type::remove be void-returned, it doesn't
> make much sense for any bus based driver implementing remove
> callbalk to return non-void to its caller.
> 
> This change is for hyperv bus based drivers.
> 
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>
[...]
> -static int netvsc_remove(struct hv_device *dev)
> +static void netvsc_remove(struct hv_device *dev)
>  {
>  	struct net_device_context *ndev_ctx;
>  	struct net_device *vf_netdev, *net;
> @@ -2603,7 +2603,6 @@ static int netvsc_remove(struct hv_device *dev)
>  	net = hv_get_drvdata(dev);
>  	if (net == NULL) {
>  		dev_err(&dev->device, "No net device to remove\n");
> -		return 0;

This is wrong. You are introducing a NULL pointer dereference.

>  	}
>  
>  	ndev_ctx = netdev_priv(net);
> @@ -2637,7 +2636,6 @@ static int netvsc_remove(struct hv_device *dev)
>  
>  	free_percpu(ndev_ctx->vf_stats);
>  	free_netdev(net);
> -	return 0;
>  }
>  
>  static int netvsc_suspend(struct hv_device *dev)
> diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
> index ba64284eaf9f..3a09de70d6ea 100644
> --- a/drivers/pci/controller/pci-hyperv.c
> +++ b/drivers/pci/controller/pci-hyperv.c
> @@ -3756,7 +3756,7 @@ static int hv_pci_bus_exit(struct hv_device *hdev, bool keep_devs)
>   *
>   * Return: 0 on success, -errno on failure
>   */

This comment is no longer needed in the new world.

But, are you sure you're modifying the correct piece of code?

hv_pci_remove is not a hook in the base bus type. It is used in struct
hv_driver.

The same comment applies to all other modifications.

Thanks,
Wei.
