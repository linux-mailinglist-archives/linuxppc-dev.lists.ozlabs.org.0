Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA157675B38
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 18:24:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz5w94vgMz3fK8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 04:24:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i6DA1ih7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i6DA1ih7;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz5vG2K7Gz3c3m
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 04:23:54 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4AE0E62022
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 17:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFBD3C433EF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 17:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674235431;
	bh=kykmCbV6IRYOFllGzMa92OaZb1qf5DrMRxNjvVxG+9I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i6DA1ih7OebsueOAmNKk+5pwlaVjpBJjYuR8ah9s4QzqW97xx1aLlSMQCamtivTaK
	 LsGXrMffr9KQbrPV0z4UZE33LXN32yLX198q8c9/iKET2Vb4vXLn3majxYdj+dD2tY
	 VgQuSuZs+hAHQvUPrF9wQkvSmpvSnJRDDeuaRJWnowERXGvhFpeUTp2c334vW2SSgU
	 3yC5cMYYWvVyxPxmW6QOKpZDgVgJGdUGoJhsR4XFzaCsYxKKdRiFqv6XQk16n51lCU
	 gXT+6KiEUUDqPpGA5BIioX/nwvnW7pfhDzJ6IpzBUxalhB05OPgdONIb8SNY95dxut
	 3mYV233hdxCow==
Received: by mail-vk1-f177.google.com with SMTP id v81so2860994vkv.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 09:23:51 -0800 (PST)
X-Gm-Message-State: AFqh2krYvlVResxUPqNcYp2xcj6Es3BX6uslhHsO9Z/Pu1cnhddn6Zl6
	cIP18S6XA2BHAc9UCkU1cgUsPETa1w+YH7kTig==
X-Google-Smtp-Source: AMrXdXu2xY8OuzC6ho07U2ZqrqiowfM9QsN/jXfdu+/jSvwpGDFrNsNOjey8R8nuGOLE6Ei3OtZobRWMEK2H9u/Vf3k=
X-Received: by 2002:a1f:edc2:0:b0:3e1:6dc2:d562 with SMTP id
 l185-20020a1fedc2000000b003e16dc2d562mr2141801vkh.35.1674235430676; Fri, 20
 Jan 2023 09:23:50 -0800 (PST)
MIME-Version: 1.0
References: <20230118215045.5551-1-msuchanek@suse.de> <20230119095323.4659-1-msuchanek@suse.de>
In-Reply-To: <20230119095323.4659-1-msuchanek@suse.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 20 Jan 2023 11:23:39 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKo+mdjA485KDb1ZauJcbOU-FR1G-Z2sYYNu7+Zn32wSA@mail.gmail.com>
Message-ID: <CAL_JsqKo+mdjA485KDb1ZauJcbOU-FR1G-Z2sYYNu7+Zn32wSA@mail.gmail.com>
Subject: Re: [PATCH v2] of: Fix of platform build on powerpc due to bad of
 disaply code
To: Michal Suchanek <msuchanek@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Erhard F." <erhard_f@mailbox.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, open list <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 19, 2023 at 3:53 AM Michal Suchanek <msuchanek@suse.de> wrote:
>
> The commit 2d681d6a23a1 ("of: Make of framebuffer devices unique")
> breaks build because of wrong argument to snprintf. That certainly
> avoids the runtime error but is not the intended outcome.
>
> Also use standard device name format of-display.N for all created
> devices.
>
> Fixes: 2d681d6a23a1 ("of: Make of framebuffer devices unique")
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
> v2: Update the device name format
> ---
>  drivers/of/platform.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index f2a5d679a324..8c1b1de22036 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -525,7 +525,9 @@ static int __init of_platform_default_populate_init(void)
>         if (IS_ENABLED(CONFIG_PPC)) {
>                 struct device_node *boot_display = NULL;
>                 struct platform_device *dev;
> -               int display_number = 1;
> +               int display_number = 0;
> +               char buf[14];
> +               char *of_display_format = "of-display.%d";

static const as suggested and can we just move on please...

>                 int ret;
>
>                 /* Check if we have a MacOS display without a node spec */
> @@ -556,7 +558,10 @@ static int __init of_platform_default_populate_init(void)
>                         if (!of_get_property(node, "linux,opened", NULL) ||
>                             !of_get_property(node, "linux,boot-display", NULL))
>                                 continue;
> -                       dev = of_platform_device_create(node, "of-display", NULL);
> +                       ret = snprintf(buf, sizeof(buf), of_display_format, display_number++);

The boot display is always "of-display.0". Just use the fixed string
here. Then we can get rid of the whole debate around static const.

> +                       if (ret >= sizeof(buf))
> +                               continue;

This only happens if display_number becomes too big. Why continue on?
The next iteration will fail too.

> +                       dev = of_platform_device_create(node, buf, NULL);
>                         if (WARN_ON(!dev))
>                                 return -ENOMEM;
>                         boot_display = node;
> @@ -564,10 +569,9 @@ static int __init of_platform_default_populate_init(void)
>                 }
>
>                 for_each_node_by_type(node, "display") {
> -                       char *buf[14];
>                         if (!of_get_property(node, "linux,opened", NULL) || node == boot_display)
>                                 continue;
> -                       ret = snprintf(buf, "of-display-%d", display_number++);
> +                       ret = snprintf(buf, sizeof(buf), of_display_format, display_number++);
>                         if (ret >= sizeof(buf))
>                                 continue;

Here too in the original change.

>                         of_platform_device_create(node, buf, NULL);
> --
> 2.35.3
>
