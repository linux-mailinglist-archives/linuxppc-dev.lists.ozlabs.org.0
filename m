Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC376628865
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 19:34:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9ydG4z7Sz3cVQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 05:34:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DKn2UkZ/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=dmitry.torokhov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DKn2UkZ/;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9ycM21DLz3cGm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 05:33:21 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id q1so10959232pgl.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 10:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=loAdI/H0UjgK1hXFwm2WMoco4kfb4Re1pr9WlgqpSEE=;
        b=DKn2UkZ/IByAeJ35xYGQ8wBbKigRAkvnmJFSnAckCSD5YOYMGyixbY58G1uO8YymnH
         OjK2J5qVLpTt/LifFSw8BekJ7W7MszrALSl08MnXpQiDeMlea1XviCgO0zd0BCgZ2grh
         b/pUS/SSzUB0wnlB1FCOZSibmUV+cgL1YId/GuzcpztIcGyOVH7g2VujgSGSAHi1SB78
         G3Z4bmuVjD0VuCjj1GEXK+jQKR4Lmvv8ZHaQ5YBpqPJeE3H6Q/PA5GBBaISoB028b5vr
         qsrNgDIMNcWDZlS9uQQZ6MQ3wuD4QjHEsqlYxWKcp4nkok4jENgeQ9lNuTUqiy/oOILU
         M/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=loAdI/H0UjgK1hXFwm2WMoco4kfb4Re1pr9WlgqpSEE=;
        b=GR+dmc452RtSsqdlna0lbiVk/O3VOZIokJl54KE+cX4Xiyj/zUGbuvMKBhojDJ1MQ8
         za1hfTjV4+jJKbxhhtxgH5gH6CuBkIa8MNbnOLvREHTktR+uQU9v5h96YjzMrZagJIHV
         rWk+JpSo8JG+gCmb3JzJEFexHq3i3v+AahrR+9flHdM0X/+akladv0X7oTir6vLcNlTc
         vwNw31Idg0q5ftufDIsxyQZpKS0EZokC20tQUgsmH4Uq1ZSI5dp9Cl9Ga+tYVKSU1HFe
         8rtiToES59prFj/qU2+MnhrUb609eA4fe60lUwo3ASbZmOpBQce9yCfMtpGrhX39EpPp
         jrLA==
X-Gm-Message-State: ANoB5plEeCl5LGhKY1wMrbmLSq/1T1cCPdR7LKwmLqlfcK9sdYylPNz2
	2ZXUweU7qpu9FqkBFtPlP3w=
X-Google-Smtp-Source: AA0mqf6Nt0BOJymsx+EjDxjxZ25iE86vqkZlwt3jKPvHvSf0m/lqQ/LiBiQrt+pVZ2PfShek6WgqQg==
X-Received: by 2002:a62:ea15:0:b0:56c:d93a:ac5f with SMTP id t21-20020a62ea15000000b0056cd93aac5fmr14864165pfh.48.1668450797960;
        Mon, 14 Nov 2022 10:33:17 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:5c17:fc5a:f127:5bb5])
        by smtp.gmail.com with ESMTPSA id k3-20020a170902c40300b00176ea6ce0efsm7915345plk.109.2022.11.14.10.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 10:33:17 -0800 (PST)
Date: Mon, 14 Nov 2022 10:33:13 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH] macintosh/mac_hid.c: don't load by default
Message-ID: <Y3KJ6SOD5PEwj1oe@google.com>
References: <20221113033022.2639-1-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221113033022.2639-1-linux@weissschuh.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thomas,

On Sun, Nov 13, 2022 at 04:30:22AM +0100, Thomas Weiﬂschuh wrote:
> There should be no need to automatically load this driver on *all*
> machines with a keyboard.
> 
> This driver is of very limited utility and has to be enabled by the user
> explicitly anyway.
> Furthermore its own header comment has deprecated it for 17 years.

I think if someone does not need a driver they can either not enable it
or blacklist it in /etc/modprobe.d/... There is no need to break
module loading in the kernel.

> 
> Fixes: 99b089c3c38a ("Input: Mac button emulation - implement as an input filter")
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
>  drivers/macintosh/mac_hid.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/macintosh/mac_hid.c b/drivers/macintosh/mac_hid.c
> index d8c4d5664145..d01d28890db4 100644
> --- a/drivers/macintosh/mac_hid.c
> +++ b/drivers/macintosh/mac_hid.c
> @@ -149,8 +149,6 @@ static const struct input_device_id mac_hid_emumouse_ids[] = {
>  	{ },
>  };
>  
> -MODULE_DEVICE_TABLE(input, mac_hid_emumouse_ids);
> -
>  static struct input_handler mac_hid_emumouse_handler = {
>  	.filter		= mac_hid_emumouse_filter,
>  	.connect	= mac_hid_emumouse_connect,
> 
> base-commit: fef7fd48922d11b22620e19f9c9101647bfe943d
> -- 
> 2.38.1
> 

Thanks.

-- 
Dmitry
