Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2E44870A8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 03:41:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVSCR2VSjz30hm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 13:41:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.219.43; helo=mail-qv1-f43.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVSC06079z2yZh
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 13:40:59 +1100 (AEDT)
Received: by mail-qv1-f43.google.com with SMTP id r6so4192723qvr.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jan 2022 18:40:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a3oveBvk/TJ7E2R11hx57UheCl6wg4a+PXG4wzrlHrU=;
 b=Cfc5jZv9wMrBAmfqadq0/73q8qNLc7AQmhxQ31fWpJzLeLewH9AuNF1Z98rpqyO0dg
 nNX9T0VP/l1JCfkuJHfC5ETdrx91FZjRpqHLTIcn1UDbUDG34GkSLElwORTeAjB2qZn5
 vALD8zUlhirRXwgYnFyuQJpB4x9OXpiGknMreRIhBKWqsa2ZJrP74m50cBVr2glF5Hex
 R/83vKKkXfN5T2sF/AQtXEymR1hc9tXRL0lf4MHdfwGXPCFRdu/Ovd4UKWVUPBG/i0yk
 NYx76CXxWORIVy4jqqvSswFNj8ebb5bKmRpEAejw4tRfZsd20M61+LfzvzJHvNvNHvHZ
 N/Xg==
X-Gm-Message-State: AOAM533Q/dSjVAtWyHUujjwktZXC7Ew3see3q7m/OVG8ifMizLo2TnzW
 jv0VUu4zhP6z3w/Uy8lQ0IUOOqefGwWV9toV
X-Google-Smtp-Source: ABdhPJxY3MzmMdsRprs4sDu4W3EpZVw/i+wbL+X2gwbKVRJ01JEhMB4QOJQm4OVVCnKD+xYwqJ+brw==
X-Received: by 2002:ad4:5f89:: with SMTP id jp9mr57812810qvb.39.1641523256329; 
 Thu, 06 Jan 2022 18:40:56 -0800 (PST)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175])
 by smtp.gmail.com with ESMTPSA id p67sm2374951qkf.49.2022.01.06.18.40.55
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 18:40:56 -0800 (PST)
Received: by mail-qt1-f175.google.com with SMTP id s19so4259139qtc.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jan 2022 18:40:55 -0800 (PST)
X-Received: by 2002:ac8:4e85:: with SMTP id 5mr54938490qtp.416.1641523255287; 
 Thu, 06 Jan 2022 18:40:55 -0800 (PST)
MIME-Version: 1.0
References: <1063e5a4738d897adcaffce2ab8e4e45f07998ff.1635969326.git.christophe.jaillet@wanadoo.fr>
 <4890990418ecbcfb8921efe8adb2019a03e5a1c1.1635969326.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <4890990418ecbcfb8921efe8adb2019a03e5a1c1.1635969326.git.christophe.jaillet@wanadoo.fr>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 7 Jan 2022 10:40:43 +0800
X-Gmail-Original-Message-ID: <CADRPPNTRE9sUX-4XxvtoQkGqOXzBPm_1h-FRSRepWsxdFz3Tvg@mail.gmail.com>
Message-ID: <CADRPPNTRE9sUX-4XxvtoQkGqOXzBPm_1h-FRSRepWsxdFz3Tvg@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: fsl: guts: Add a missing memory allocation
 failure check
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
Cc: tyreld@linux.ibm.com, kernel-janitors@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 4, 2021 at 4:10 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If 'devm_kstrdup()' fails, we should return -ENOMEM.
>
> While at it, move the 'of_node_put()' call in the error handling path and
> after the 'machine' has been copied.
> Better safe than sorry.
>
> Suggested-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied with Fixes tag and Depends-on tag added.  Thanks.

> ---
> Not sure of which Fixes tag to add. Should be a6fc3b698130, but since
> another commit needs to be reverted for this patch to make sense, I'm
> unsure of what to do. :(
> So, none is given.
> ---
>  drivers/soc/fsl/guts.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
> index af7741eafc57..5ed2fc1c53a0 100644
> --- a/drivers/soc/fsl/guts.c
> +++ b/drivers/soc/fsl/guts.c
> @@ -158,9 +158,14 @@ static int fsl_guts_probe(struct platform_device *pdev)
>         root = of_find_node_by_path("/");
>         if (of_property_read_string(root, "model", &machine))
>                 of_property_read_string_index(root, "compatible", 0, &machine);
> -       of_node_put(root);
> -       if (machine)
> +       if (machine) {
>                 soc_dev_attr.machine = devm_kstrdup(dev, machine, GFP_KERNEL);
> +               if (!soc_dev_attr.machine) {
> +                       of_node_put(root);
> +                       return -ENOMEM;
> +               }
> +       }
> +       of_node_put(root);
>
>         svr = fsl_guts_get_svr();
>         soc_die = fsl_soc_die_match(svr, fsl_soc_die);
> --
> 2.30.2
>
