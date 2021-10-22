Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D12DE436EDE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 02:35:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb5381zl9z3cRj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 11:35:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.173;
 helo=mail-qt1-f173.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb52g508Pz2ynD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 11:34:33 +1100 (AEDT)
Received: by mail-qt1-f173.google.com with SMTP id z24so2155134qtv.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 17:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5pLuQaUGEsRYwpc0MMQlI/U5wBA+N3te0wyegZPV6Y4=;
 b=meUSnA/QbQcXEqejKCLdRIyP5KQJQKJsB/ZqX5iBIJ3rG5wlqm5YMAtxM54xLu7HBU
 QtV8KKWzc+BY8VXHsmV/XIb3RQfCd606Y0akmcoW/jeeEy2k+sIuPaK2klqN3ITCxeZe
 Z8MT8CBf5qSk2MOBKTDYq42qHKd9A3Y6xL/y1jYv/NkaO6axwGcTg/AQ4y+J+eny7Yeh
 GcKyN8Go4dL0RXdv7W1ZcgvDAYhVGhCbMDKmV3D6pX8bmGaEVJ8mHiyPU3sMgPEKrSuk
 QWP2dahYHTCOt5xVaNlpp2ZWeC/R0y27rZNX048v+yr3N9luc5Z3Grbk+pIa0pXP8rtT
 /7gQ==
X-Gm-Message-State: AOAM531sSa6SEDdn053cjsxa8LNFEOVva7l1rdGPbV2ptNU/3zXnmsEF
 NNwA8xYOlyzBD0CvZPAt9abtXekU4zQ=
X-Google-Smtp-Source: ABdhPJxHhbkLwFN5AGzvAcXdtI//uIyuuGLvFPZMdh9qbjVmAso5c1/Sm/QFu5ch2JnzDv1HwmLx/g==
X-Received: by 2002:a05:622a:1aa6:: with SMTP id
 s38mr9604738qtc.52.1634862870902; 
 Thu, 21 Oct 2021 17:34:30 -0700 (PDT)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com.
 [209.85.222.177])
 by smtp.gmail.com with ESMTPSA id 31sm3374885qtb.85.2021.10.21.17.34.30
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 17:34:30 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id j12so3218911qkk.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 17:34:30 -0700 (PDT)
X-Received: by 2002:a37:db02:: with SMTP id e2mr7461283qki.436.1634862869999; 
 Thu, 21 Oct 2021 17:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210908071631.660-1-caihuoqing@baidu.com>
In-Reply-To: <20210908071631.660-1-caihuoqing@baidu.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Thu, 21 Oct 2021 19:34:18 -0500
X-Gmail-Original-Message-ID: <CADRPPNSkyJxJSuRwgc4fGLPwTtsMC5YBy2yg7HN2WmGj2utdbA@mail.gmail.com>
Message-ID: <CADRPPNSkyJxJSuRwgc4fGLPwTtsMC5YBy2yg7HN2WmGj2utdbA@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: fsl: guts: Make use of the helper function
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

On Wed, Sep 8, 2021 at 2:19 AM Cai Huoqing <caihuoqing@baidu.com> wrote:
>
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Applied for next.  Thanks.

> ---
>  drivers/soc/fsl/guts.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
> index d5e9a5f2c087..072473a16f4d 100644
> --- a/drivers/soc/fsl/guts.c
> +++ b/drivers/soc/fsl/guts.c
> @@ -140,7 +140,6 @@ static int fsl_guts_probe(struct platform_device *pdev)
>  {
>         struct device_node *np = pdev->dev.of_node;
>         struct device *dev = &pdev->dev;
> -       struct resource *res;
>         const struct fsl_soc_die_attr *soc_die;
>         const char *machine;
>         u32 svr;
> @@ -152,8 +151,7 @@ static int fsl_guts_probe(struct platform_device *pdev)
>
>         guts->little_endian = of_property_read_bool(np, "little-endian");
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       guts->regs = devm_ioremap_resource(dev, res);
> +       guts->regs = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(guts->regs))
>                 return PTR_ERR(guts->regs);
>
> --
> 2.25.1
>
