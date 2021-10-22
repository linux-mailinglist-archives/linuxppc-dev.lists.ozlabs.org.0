Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C96436ED5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 02:27:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb4tN2kV3z3cRH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 11:27:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.219.45; helo=mail-qv1-f45.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb4sv3tT7z2yV5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 11:26:58 +1100 (AEDT)
Received: by mail-qv1-f45.google.com with SMTP id v10so1499438qvb.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 17:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HnL8LEaWnSsWA9HfguV8dZWptDtYCS/c4aEJvvgRowc=;
 b=yySIZ5u8vTQEmAFEsA9Zcjx+/qHUQCdAk+lIkTe2OoeRu06O8ALrJp/Lm5+RRv6VoJ
 KiS/qplxv3LUSDplcM9E75DKcXVoYjfu+1vyIfYntN5eUqr5/xnEMNYJJ8PiJfWojk1E
 wXJUiv+UfN4AJAbxjReqFY5YISATvzEWVKMxMAcXouCWi6me0WskqvFr/VDc2jGwZiLB
 mhbRzw4tTTOWTAQs7q7oFMf5vnsxJ5KuxKQ9/VNr8keCxgJhk2OCEhjP7iBuJ8+qT+Xd
 0x0e2euW19hEVGlT81rp/8YXsNynDq22mKixzjTnxB9oLqSybzIma9l7sfPxBSMtQlsV
 5xKw==
X-Gm-Message-State: AOAM532o8yUF8SLI3FXkLYHzprVUPYX28jEGsgaRpljOmSwSlgnrgK6D
 8/bSYkLEW5cGVw37nlu+QYFJY1naRZo=
X-Google-Smtp-Source: ABdhPJxnWRm2+PS0+vtdznz4Wz3Nnba6uZwvUUGwz01laBwzFGsQ7dxv/YciptwMX0CBuwrnyBeBIA==
X-Received: by 2002:a05:6214:1c8a:: with SMTP id
 ib10mr4838393qvb.46.1634862415494; 
 Thu, 21 Oct 2021 17:26:55 -0700 (PDT)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com.
 [209.85.222.177])
 by smtp.gmail.com with ESMTPSA id w11sm3869823qta.50.2021.10.21.17.26.54
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 17:26:55 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id j12so3205409qkk.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 17:26:54 -0700 (PDT)
X-Received: by 2002:a37:bd7:: with SMTP id 206mr7129325qkl.297.1634862414371; 
 Thu, 21 Oct 2021 17:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <b12e8c5c5d6ab3061d9504de8fbaefcad6bbc385.1629321668.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <b12e8c5c5d6ab3061d9504de8fbaefcad6bbc385.1629321668.git.christophe.jaillet@wanadoo.fr>
From: Li Yang <leoyang.li@nxp.com>
Date: Thu, 21 Oct 2021 19:26:42 -0500
X-Gmail-Original-Message-ID: <CADRPPNTHKuV9eernJS6ZV_+i-xtPXHQnS64GSx=ubwWE+nbLYw@mail.gmail.com>
Message-ID: <CADRPPNTHKuV9eernJS6ZV_+i-xtPXHQnS64GSx=ubwWE+nbLYw@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: guts: Fix a resource leak in the error handling
 path of 'fsl_guts_probe()'
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
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
Cc: kernel-janitors@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 18, 2021 at 4:23 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If an error occurs after 'of_find_node_by_path()', the reference taken for
> 'root' will never be released and some memory will leak.

Thanks for finding this.  This truly is a problem.

>
> Instead of adding an error handling path and modifying all the
> 'return -SOMETHING' into 'goto errorpath', use 'devm_add_action_or_reset()'
> to release the reference when needed.
>
> Simplify the remove function accordingly.
>
> As an extra benefit, the 'root' global variable can now be removed as well.
>
> Fixes: 3c0d64e867ed ("soc: fsl: guts: reuse machine name from device tree")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only
> ---
>  drivers/soc/fsl/guts.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
> index d5e9a5f2c087..4d9476c7b87c 100644
> --- a/drivers/soc/fsl/guts.c
> +++ b/drivers/soc/fsl/guts.c
> @@ -28,7 +28,6 @@ struct fsl_soc_die_attr {
>  static struct guts *guts;
>  static struct soc_device_attribute soc_dev_attr;
>  static struct soc_device *soc_dev;
> -static struct device_node *root;
>
>
>  /* SoC die attribute definition for QorIQ platform */
> @@ -136,14 +135,23 @@ static u32 fsl_guts_get_svr(void)
>         return svr;
>  }
>
> +static void fsl_guts_put_root(void *data)
> +{
> +       struct device_node *root = data;
> +
> +       of_node_put(root);
> +}
> +
>  static int fsl_guts_probe(struct platform_device *pdev)
>  {
>         struct device_node *np = pdev->dev.of_node;
>         struct device *dev = &pdev->dev;
> +       struct device_node *root;
>         struct resource *res;
>         const struct fsl_soc_die_attr *soc_die;
>         const char *machine;
>         u32 svr;
> +       int ret;
>
>         /* Initialize guts */
>         guts = devm_kzalloc(dev, sizeof(*guts), GFP_KERNEL);
> @@ -159,6 +167,10 @@ static int fsl_guts_probe(struct platform_device *pdev)
>
>         /* Register soc device */
>         root = of_find_node_by_path("/");
> +       ret = devm_add_action_or_reset(dev, fsl_guts_put_root, root);
> +       if (ret)
> +               return ret;

We probably only need to hold the reference when we do get "machine"
from the device tree, otherwise we can put it directly.

Or maybe we just maintain a local copy of string machine which means
we can release the reference right away?

> +
>         if (of_property_read_string(root, "model", &machine))
>                 of_property_read_string_index(root, "compatible", 0, &machine);
>         if (machine)
> @@ -197,7 +209,7 @@ static int fsl_guts_probe(struct platform_device *pdev)
>  static int fsl_guts_remove(struct platform_device *dev)
>  {
>         soc_device_unregister(soc_dev);
> -       of_node_put(root);
> +
>         return 0;
>  }
>
> --
> 2.30.2
>
