Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB10133B8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 20:46:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wh1g50NVzDqdW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2019 04:46:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wh0355W0zDqWW
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2019 04:45:22 +1000 (AEST)
Received: by mail-ot1-f68.google.com with SMTP id d10so1093978otp.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 May 2019 11:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QFIm1hDHtUjLdOYqNjnkn9Poy1ZSguPT9bbKFukhSS8=;
 b=Eu+vJ9DYTy2TkOKxxqOGRXLI2pB2MC25ncvKS67zQdvuJvKK69zYWkBCuw3CDpAJwt
 Ehz92CxSCZYnjqFUapeI7olE+MUC13oHB6hnLmvIO9mVvHPthDAYc3wcRge4OxX5Zh0N
 p4NWIJV3QeGqPRlxo7EJL3YL9dnqYUeZ8ZGaYR8oxb0XnOb9i8oGvFZbXXTGYmAw32hr
 NRL8L6+AsC3jqW3+a+rPM9RvOotM50lk6AQ2TEnBhqDynG+9ZHTOxrqCBNahrlXRTp6w
 h367XKaEvVInrtNmBpEWN6Ybgh9Icovu2ro6DSYwL/dyu9MqtBhhlf6VmRquLGXVoHi5
 FptQ==
X-Gm-Message-State: APjAAAW4sVnPZfW66u+LImxNxppVaJSuK7aZWXu/8prvagj8h9bxDn+2
 U3jzfpQYqQ6PMjCGjthjsC/C53/Z
X-Google-Smtp-Source: APXvYqwleviq3Abel3rRxm8iiZu/0IUopeB7YlQ3gWQpgsgFkxkPhwmpZFObS1kmUmtFwWWwHQ1vEw==
X-Received: by 2002:a9d:480b:: with SMTP id c11mr3173964otf.61.1556909119187; 
 Fri, 03 May 2019 11:45:19 -0700 (PDT)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com.
 [209.85.167.182])
 by smtp.gmail.com with ESMTPSA id l126sm1221102oia.40.2019.05.03.11.45.18
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 11:45:18 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id v10so5226401oib.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 May 2019 11:45:18 -0700 (PDT)
X-Received: by 2002:aca:b50b:: with SMTP id e11mr102116oif.51.1556909118233;
 Fri, 03 May 2019 11:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190503131551.GB1236@mwanda>
In-Reply-To: <20190503131551.GB1236@mwanda>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 3 May 2019 13:45:07 -0500
X-Gmail-Original-Message-ID: <CADRPPNTGovYXL8vo7B6d73xu5BzpZBJLV=sGXK9HXrad-3HMeg@mail.gmail.com>
Message-ID: <CADRPPNTGovYXL8vo7B6d73xu5BzpZBJLV=sGXK9HXrad-3HMeg@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: gpio: Fix an error code in qe_pin_request()
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 kernel-janitors@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 3, 2019 at 8:19 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> There was a missing error code in this path.  It meant that we returned
> ERR_PTR(0) which is NULL and would result in a NULL dereference in the
> caller.

Thanks Dan.  An early version of this patch has been included in a
pending pull request to arm-soc.
https://lkml.org/lkml/2019/5/1/506


>
> Fixes: 1a2d397a6eb5 ("gpio/powerpc: Eliminate duplication of of_get_named_gpio_flags()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/soc/fsl/qe/gpio.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
> index 819bed0f5667..51b3a47b5a55 100644
> --- a/drivers/soc/fsl/qe/gpio.c
> +++ b/drivers/soc/fsl/qe/gpio.c
> @@ -179,8 +179,10 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
>         if (err < 0)
>                 goto err0;
>         gc = gpio_to_chip(err);
> -       if (WARN_ON(!gc))
> +       if (WARN_ON(!gc)) {
> +               err = -ENODEV;
>                 goto err0;
> +       }
>
>         if (!of_device_is_compatible(gc->of_node, "fsl,mpc8323-qe-pario-bank")) {
>                 pr_debug("%s: tried to get a non-qe pin\n", __func__);
> --
> 2.18.0
>
