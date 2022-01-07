Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD35487089
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 03:36:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVS660nqsz3cQZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 13:36:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.171;
 helo=mail-qt1-f171.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVS5b3XYtz3bYq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 13:36:19 +1100 (AEDT)
Received: by mail-qt1-f171.google.com with SMTP id s19so4250533qtc.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jan 2022 18:36:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p1K15mtU3zzMsv0QlhLQ7Ko388P+IV6nME1cO1C6EvU=;
 b=SS8DRGK0b7bhKsgUBR7YIP7OJa7eXMCmrEYY6v8FtThoCLzgiq//xeV7WR2XP1JIgM
 KaZj5K8e9AZn5LsbZWUINyvnvUrhwBgRsImn7O+u9cZLWZ5p982xcVKXBhKZMvfLQC+5
 gBfsF2ZKblVWWpO9T+dV6J/HsvWvP7h10nkJ4A6sT7VY7OU92hkg1q2o1Kytj4kv/3MG
 wHNYkqwr7+gCBwWO3CbyJhhqvtr597dWV49ZjRFv0+/SoV/amEUeM/LZB7CvnDK6Uvxq
 qpzJmwKs241Lqw0HHKeJc5DW6wrYQpActepKZB/veYSAwhiXxxCKeRS//tLGTzckZfZR
 FrNw==
X-Gm-Message-State: AOAM531sui1o/kJlXEFKczMia0QdJSUZ9FDPTzzXvlxV8tPmGtMt4ieT
 Puqq4a82CXNojD24fbIH/p+mTXDP7ejLYA==
X-Google-Smtp-Source: ABdhPJwT75ic3Kcb/KaPW4GOtAdRqLCRY7gic0t+4yBAhT+y1DJqIPa0uigZtEr+3tunVu9ll9Or2w==
X-Received: by 2002:a05:622a:11c3:: with SMTP id
 n3mr53510853qtk.213.1641522976698; 
 Thu, 06 Jan 2022 18:36:16 -0800 (PST)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com.
 [209.85.219.50])
 by smtp.gmail.com with ESMTPSA id ay39sm2557104qkb.63.2022.01.06.18.36.16
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 18:36:16 -0800 (PST)
Received: by mail-qv1-f50.google.com with SMTP id r6so4184064qvr.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jan 2022 18:36:16 -0800 (PST)
X-Received: by 2002:a05:6214:252a:: with SMTP id
 gg10mr57473867qvb.19.1641522975923; 
 Thu, 06 Jan 2022 18:36:15 -0800 (PST)
MIME-Version: 1.0
References: <1063e5a4738d897adcaffce2ab8e4e45f07998ff.1635969326.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <1063e5a4738d897adcaffce2ab8e4e45f07998ff.1635969326.git.christophe.jaillet@wanadoo.fr>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 7 Jan 2022 10:36:04 +0800
X-Gmail-Original-Message-ID: <CADRPPNRke7ga1MsSKEpr948wkgNygNTQhcnB7Kk-f7DhMpptMQ@mail.gmail.com>
Message-ID: <CADRPPNRke7ga1MsSKEpr948wkgNygNTQhcnB7Kk-f7DhMpptMQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: fsl: guts: Revert commit 3c0d64e867ed
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

On Thu, Nov 4, 2021 at 4:09 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> This reverts commit 3c0d64e867ed
> ("soc: fsl: guts: reuse machine name from device tree").
>
> A following patch will fix the missing memory allocation failure check
> instead.
>
> Suggested-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next.  Thanks.

> ---
> This is a follow-up of discussion in:
> https://lore.kernel.org/kernel-janitors/b12e8c5c5d6ab3061d9504de8fbaefcad6bbc385.1629321668.git.christophe.jaillet@wanadoo.fr/
> ---
>  drivers/soc/fsl/guts.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
> index 072473a16f4d..af7741eafc57 100644
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
> @@ -138,7 +137,7 @@ static u32 fsl_guts_get_svr(void)
>
>  static int fsl_guts_probe(struct platform_device *pdev)
>  {
> -       struct device_node *np = pdev->dev.of_node;
> +       struct device_node *root, *np = pdev->dev.of_node;
>         struct device *dev = &pdev->dev;
>         const struct fsl_soc_die_attr *soc_die;
>         const char *machine;
> @@ -159,8 +158,9 @@ static int fsl_guts_probe(struct platform_device *pdev)
>         root = of_find_node_by_path("/");
>         if (of_property_read_string(root, "model", &machine))
>                 of_property_read_string_index(root, "compatible", 0, &machine);
> +       of_node_put(root);
>         if (machine)
> -               soc_dev_attr.machine = machine;
> +               soc_dev_attr.machine = devm_kstrdup(dev, machine, GFP_KERNEL);
>
>         svr = fsl_guts_get_svr();
>         soc_die = fsl_soc_die_match(svr, fsl_soc_die);
> @@ -195,7 +195,6 @@ static int fsl_guts_probe(struct platform_device *pdev)
>  static int fsl_guts_remove(struct platform_device *dev)
>  {
>         soc_device_unregister(soc_dev);
> -       of_node_put(root);
>         return 0;
>  }
>
> --
> 2.30.2
>
