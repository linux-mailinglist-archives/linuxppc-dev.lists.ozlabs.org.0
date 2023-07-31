Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EA576A45F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 00:52:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa1 header.b=gbD2l+F4;
	dkim=fail reason="signature verification failed" header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed1 header.b=lbxy0fAh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFD6F72hfz3bt0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 08:52:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa1 header.b=gbD2l+F4;
	dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed1 header.b=lbxy0fAh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mailrelay1-1.pub.mailoutpod2-cph3.one.com (client-ip=2a02:2350:5:400::1; helo=mailrelay1-1.pub.mailoutpod2-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 11726 seconds by postgrey-1.37 at boromir; Tue, 01 Aug 2023 08:52:03 AEST
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFD5H3BF9z2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 08:51:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=6qASGIsrRTha6LW4nGlFz5hVK9QFyCgkRnIOH/MfmdI=;
	b=gbD2l+F4txZSKOikg9ULrRxYvmKpodr8viXTZBSfsyRhtbkseAGNq5G/j1Yjw/MChSfPAbovOOckO
	 fDLnWkOt+KM0RrinBws0z3F8YDy4ZK+v8OA63YMgBDwno7Hos7KtKozzN1O0VOr+88mykbAMD9nyem
	 JOtXu92SRr2bmjPmUpaS/v4CXn8TOlB/DULIqsm0bq8fQjbPCL4F1imrCWJD8+zw9e7BtI5nvLQGBr
	 Vvw9pxE+uYxbtboGk5CCcL6EiLab9g7/w/44JEZWP4Pd2Wrvf/kbo+XywEiXBXQWvpKJz31cF8878D
	 7E3htRYGp0KE2CAKyAhYuzmi55Lpy+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=6qASGIsrRTha6LW4nGlFz5hVK9QFyCgkRnIOH/MfmdI=;
	b=lbxy0fAhUsTGM7a0p9jw1JGKiT98vxHJLhFafsTjUZmjfLKS+bkQvy0jxq/0Be1QR1jiE0GoMXFoE
	 wcLb15eBg==
X-HalOne-ID: 626809cf-2fd9-11ee-8694-c5367ef0e45e
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay1 (Halon) with ESMTPSA
	id 626809cf-2fd9-11ee-8694-c5367ef0e45e;
	Mon, 31 Jul 2023 19:35:21 +0000 (UTC)
Date: Mon, 31 Jul 2023 21:35:20 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] fbdev/ps3fb: Build without kernel device
Message-ID: <20230731193520.GA1463201@ravnborg.org>
References: <20230731175535.11345-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731175535.11345-1-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, sfr@canb.auug.org.au, linux-fbdev@vger.kernel.org, regressions@lists.linux.dev, deller@gmx.de, Randy Dunlap <rdunlap@infradead.org>, javierm@redhat.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, regressions@leemhuis.info, npiggin@gmail.com, bagasdotme@gmail.com, linuxppc-dev@lists.ozlabs.org, rd.dunlab@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 31, 2023 at 07:55:00PM +0200, Thomas Zimmermann wrote:
> Use fb_info() to print status message at the end of the probe function,
> which avoids decoding the devices. fb_info() works with or without an
> fbdev kernel device. Fixes the following error:
> 
> ../drivers/video/fbdev/ps3fb.c: In function 'ps3fb_probe':
> ../drivers/video/fbdev/ps3fb.c:1172:40: error: 'struct fb_info' has no member named 'dev'
>  1172 |                  dev_driver_string(info->dev), dev_name(info->dev),
>       |                                        ^~
> ../include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
>   110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>       |                                     ^~~~~~~~~~~
> ../drivers/video/fbdev/ps3fb.c:1171:9: note: in expansion of macro 'dev_info'
>  1171 |         dev_info(info->device, "%s %s, using %u KiB of video memory\n",
>       |         ^~~~~~~~
> ../drivers/video/fbdev/ps3fb.c:1172:61: error: 'struct fb_info' has no member named 'dev'
>  1172 |                  dev_driver_string(info->dev), dev_name(info->dev),
>       |                                                             ^~
> ../include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
>   110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>       |                                     ^~~~~~~~~~~
> ../drivers/video/fbdev/ps3fb.c:1171:9: note: in expansion of macro 'dev_info'
>  1171 |         dev_info(info->device, "%s %s, using %u KiB of video memory\n",
>       |         ^~~~~~~~
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/lkml/ccc63065-2976-88ef-1211-731330bf2866@infradead.org/
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 701d2054fa31 ("fbdev: Make support for userspace interfaces configurable")
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Bagas Sanjaya <bagasdotme@gmail.com>
> Cc: Thorsten Leemhuis <regressions@leemhuis.info>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/video/fbdev/ps3fb.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/ps3fb.c b/drivers/video/fbdev/ps3fb.c
> index 5aedc30c5f7e..64d291d6b153 100644
> --- a/drivers/video/fbdev/ps3fb.c
> +++ b/drivers/video/fbdev/ps3fb.c
> @@ -1168,9 +1168,7 @@ static int ps3fb_probe(struct ps3_system_bus_device *dev)
>  
>  	ps3_system_bus_set_drvdata(dev, info);
>  
> -	dev_info(info->device, "%s %s, using %u KiB of video memory\n",
> -		 dev_driver_string(info->dev), dev_name(info->dev),
> -		 info->fix.smem_len >> 10);
> +	fb_info(info, "using %u KiB of video memory\n", info->fix.smem_len >> 10);
>  
>  	task = kthread_run(ps3fbd, info, DEVICE_NAME);
>  	if (IS_ERR(task)) {
> -- 
> 2.41.0
