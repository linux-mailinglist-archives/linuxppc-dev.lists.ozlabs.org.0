Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B103436EE4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 02:37:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb56W5DC3z3cS0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 11:37:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.172;
 helo=mail-qt1-f172.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb5666xsZz2ynD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 11:37:34 +1100 (AEDT)
Received: by mail-qt1-f172.google.com with SMTP id w2so2223333qtn.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 17:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k8cCGwIM+MEipkZPPkMbL/O4ATGbMjxLb4ByRgUs5DA=;
 b=mTC692fkoZcs1u3xzHHh+rY0rjLTgK/hAQy15olLy2ZlHGHdXXDsnXcYb4Ne5YZOyO
 1sKeqvAmHT6gW64yzrV/NihyeYlt4O3qjIBzumWZAVBOwWTl5qoVXnj+FqaViMV3noI2
 0BDEo+eB7XuQ8jGPvfv5h1d/ngx6aT8waafogjsH20RcKJbgBA1RltkAP+CopK9yXn4q
 PsN6epox9aqqkZDKFmQcQ7O/HE9tEhTWjoT9t2AJg4/+5G/09+OtNFrVkcaFTku/jlKB
 cuTNKqKY1XTIOsd0TeCED6nYQvLpTFG/5OpeOk29NYiQ0ODapdmCs18QcYUUkpLE5YOl
 xe9A==
X-Gm-Message-State: AOAM531p8YcdTlIE4ih4vD5fQesl7J57MF5O25Fl1TNOEdvYhRtTA2qa
 RE8Zj1kOHJuz0/JRL+nSfQOJBf/1LOI=
X-Google-Smtp-Source: ABdhPJyaSpJGPa4qDdB2u+krVAKdUD6UsIWnMfLlAAxk10VkqokoCY0lwP6FLGDZrLXoq9ePAFLSLA==
X-Received: by 2002:ac8:5ad4:: with SMTP id d20mr10114661qtd.58.1634863052241; 
 Thu, 21 Oct 2021 17:37:32 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175])
 by smtp.gmail.com with ESMTPSA id m6sm3226250qkh.69.2021.10.21.17.37.31
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 17:37:32 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id o12so2173342qtq.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 17:37:31 -0700 (PDT)
X-Received: by 2002:ac8:74c7:: with SMTP id j7mr9593942qtr.118.1634863051346; 
 Thu, 21 Oct 2021 17:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210908071631.660-1-caihuoqing@baidu.com>
 <20210908071631.660-2-caihuoqing@baidu.com>
In-Reply-To: <20210908071631.660-2-caihuoqing@baidu.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Thu, 21 Oct 2021 19:37:20 -0500
X-Gmail-Original-Message-ID: <CADRPPNT-ZGsn_04J8tLuyACqpdtSE0b8qg0dC7jPgTZcMhx26g@mail.gmail.com>
Message-ID: <CADRPPNT-ZGsn_04J8tLuyACqpdtSE0b8qg0dC7jPgTZcMhx26g@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: fsl: rcpm: Make use of the helper function
 devm_platform_ioremap_resource()
To: Cai Huoqing <caihuoqing@baidu.com>
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
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 8, 2021 at 2:20 AM Cai Huoqing <caihuoqing@baidu.com> wrote:
>
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Applied for next.  Thanks.

> ---
>  drivers/soc/fsl/rcpm.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
> index 90d3f4060b0c..3d0cae30c769 100644
> --- a/drivers/soc/fsl/rcpm.c
> +++ b/drivers/soc/fsl/rcpm.c
> @@ -146,7 +146,6 @@ static const struct dev_pm_ops rcpm_pm_ops = {
>  static int rcpm_probe(struct platform_device *pdev)
>  {
>         struct device   *dev = &pdev->dev;
> -       struct resource *r;
>         struct rcpm     *rcpm;
>         int ret;
>
> @@ -154,11 +153,7 @@ static int rcpm_probe(struct platform_device *pdev)
>         if (!rcpm)
>                 return -ENOMEM;
>
> -       r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       if (!r)
> -               return -ENODEV;
> -
> -       rcpm->ippdexpcr_base = devm_ioremap_resource(&pdev->dev, r);
> +       rcpm->ippdexpcr_base = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(rcpm->ippdexpcr_base)) {
>                 ret =  PTR_ERR(rcpm->ippdexpcr_base);
>                 return ret;
> --
> 2.25.1
>
