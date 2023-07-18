Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B02175725D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 05:34:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZEPFLg7r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4l1h11ssz3ck0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 13:34:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZEPFLg7r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4kz43njCz3bcH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 13:32:15 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-666eec46206so5327632b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 20:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689651130; x=1692243130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qsCgfp2s3CRfk6nv+x0Mk0r1Oznh1MYu4hj6PzpztDM=;
        b=ZEPFLg7rh5L4b7krkym5Ya+3jpyqEqMmL/f2boSjPTpbBG26VM+k7464Jo5583X0SD
         a1Hw0wjSHGPNytPVL9TwTmmRBuq54jqOx6viOG/XyfQinG8Bjmw5k9NRMeQwdVcqYJuw
         +Lm5xtcuXeY9RnnUpmW1s1zhsxPisZtikjU9KUPopAYpCiR82uGhq4dgb81vUAKKYm5x
         rDIpRedktdlIfSkhJkVC7cTqJoWL1XbBorpIdJ9NtHJXVyiU17Nn/QlU9ya6Ad6aEYVA
         Rx4Fffm3aba7pO1PPklVrsRr1dy1uTyApY745rTX/ZTXC7zxlXgsm+ya1+HKpNg50sMF
         bhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689651130; x=1692243130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsCgfp2s3CRfk6nv+x0Mk0r1Oznh1MYu4hj6PzpztDM=;
        b=esFBAqP0uNYTpFLwv5s4I7JTNqpcFew4DWFTh7PXDhrIsCUSgTirI1NLl2qJAkpTnD
         qXqD1Lr7g9/rYeIRkCr4CBCPudfmLzmLblWnWUT9jiPkOQoRNYWtMuwdA/zYIgyIwMca
         4E2ghX3iLQclctSqvirOt/iZhfB9mHQHyfuiUyPIMrLKUBGHvfiZofyMz7jov1n08IPj
         6NVrMwW9aVL44WCUjFKOB84WgTBAYfElZD3QjHm4XuiEwCM69WnRu127V4wmvY2E7fy2
         dYL1u0gXdk1QGCjR6jodSaIGb8FFmhkZwxzd+qKY9dgczI+m7/AjpZ48fTgRv6TiYLEL
         OoQQ==
X-Gm-Message-State: ABy/qLaQfXZPRukHqkS69dB76ar/z1EbiCgVFvg3g6jpYiSdPHKM4N0x
	Cr/AzqiKOW0Xhit1i15XzZc=
X-Google-Smtp-Source: APBJJlFAwDoW4yADO2Pjd04stMQf1iujcnSKviiNjIZ3895AEfrruDatfQyAiKeDtImLL7XYcqiTtg==
X-Received: by 2002:a05:6a21:7883:b0:133:215e:746d with SMTP id bf3-20020a056a21788300b00133215e746dmr17816681pzc.41.1689651130509;
        Mon, 17 Jul 2023 20:32:10 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902758e00b001b9be2e2b3esm584344pll.277.2023.07.17.20.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 20:32:10 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 5ED5E834F19C; Tue, 18 Jul 2023 10:32:05 +0700 (WIB)
Date: Tue, 18 Jul 2023 10:32:05 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Tree for Jul 13 (drivers/video/fbdev/ps3fb.c)
Message-ID: <ZLYHtVuS7AElXcCb@debian.me>
References: <20230713123710.5d7d81e4@canb.auug.org.au>
 <ccc63065-2976-88ef-1211-731330bf2866@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ccc63065-2976-88ef-1211-731330bf2866@infradead.org>
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
Cc: linux-fbdev@vger.kernel.org, Linux Regressions <regressions@lists.linux.dev>, Helge Deller <deller@gmx.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 13, 2023 at 09:11:10AM -0700, Randy Dunlap wrote:
> 
> 
> On 7/12/23 19:37, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20230712:
> > 
> 
> on ppc64:
> 
> In file included from ../include/linux/device.h:15,
>                  from ../arch/powerpc/include/asm/io.h:22,
>                  from ../include/linux/io.h:13,
>                  from ../include/linux/irq.h:20,
>                  from ../arch/powerpc/include/asm/hardirq.h:6,
>                  from ../include/linux/hardirq.h:11,
>                  from ../include/linux/interrupt.h:11,
>                  from ../drivers/video/fbdev/ps3fb.c:25:
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
> 

Hmm, there is no response from Thomas yet. I guess we should go with
reverting bdb616479eff419, right? Regardless, I'm adding this build regression
to regzbot so that parties involved are aware of it:

#regzbot ^introduced: bdb616479eff419
#regzbot title: build regression in PS3 framebuffer

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
