Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 352DA3EBDFC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 23:40:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmcR6403jz3cSY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Aug 2021 07:40:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.170;
 helo=mail-qt1-f170.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmcQX335Pz3bWJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Aug 2021 07:39:30 +1000 (AEST)
Received: by mail-qt1-f170.google.com with SMTP id r21so1433621qtw.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 14:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+ZCHXkE0Ngtxkg8sy8FZkEEy5v/vMEhkY+n7hsSWU9w=;
 b=JVRqUJCb4gI5YkkQoMI8jbDyIxzN9sH5VOZyKM29e+xkV43+XueTB9JUU/9xfMjgPD
 SUNxtzW7Id8xMgZI7WGTsGLpUkxtYIrUCjilBmiT4MS6PhvDNei/ym712ndXB1prkpRM
 THSiW49kC3HJzCScf6VyFZC0nRxYeTAXbYKslU7I53KH8w6it4anBVBSqCHdyLuXfVyA
 Qx68gKMaMoVjBg1V9+A7H7qxX4dlgeGxvvgcDvSU0ESHLvsNfCSh5RD7Ti0O2F2xW42C
 koJ+zVLMzS7FmJeXMPgGt7KAz1EhJZn4cUjc2Tmet0te/KUu+Hyq2BLN08LOmbf5L+91
 cRCw==
X-Gm-Message-State: AOAM531zNSFnzib8yjn/j+dwhi06AAbbvY4U7EmMAYSGqHuJSGgMx2On
 CqrOFevMwbREE6HHkFUHU3GNuo8JpN8=
X-Google-Smtp-Source: ABdhPJzG9aUIHUE1OHFl418Y4f8HjJn3Asm+o4JyMnpuSmey8sIUfDK/EjwatSletuPSMDxwkxfRIQ==
X-Received: by 2002:a05:622a:1206:: with SMTP id
 y6mr3729256qtx.243.1628890766687; 
 Fri, 13 Aug 2021 14:39:26 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180])
 by smtp.gmail.com with ESMTPSA id c2sm1819733qkd.57.2021.08.13.14.39.25
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 14:39:26 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id l3so9430142qtk.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 14:39:25 -0700 (PDT)
X-Received: by 2002:ac8:5c82:: with SMTP id r2mr3686098qta.283.1628890765336; 
 Fri, 13 Aug 2021 14:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210811071036.44658-1-fido_max@inbox.ru>
In-Reply-To: <20210811071036.44658-1-fido_max@inbox.ru>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 13 Aug 2021 16:39:14 -0500
X-Gmail-Original-Message-ID: <CADRPPNSP+vZ_B+myoAs9LxKQH=moKgq_McXfihxyEbc=7NnxWA@mail.gmail.com>
Message-ID: <CADRPPNSP+vZ_B+myoAs9LxKQH=moKgq_McXfihxyEbc=7NnxWA@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: fix static checker warning
To: Maxim Kochetkov <fido_max@inbox.ru>
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
Cc: Saravana Kannan <saravanak@google.com>, lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 11, 2021 at 2:10 AM Maxim Kochetkov <fido_max@inbox.ru> wrote:
>
> The patch be7ecbd240b2: "soc: fsl: qe: convert QE interrupt
> controller to platform_device" from Aug 3, 2021, leads to the
> following static checker warning:
>
>         drivers/soc/fsl/qe/qe_ic.c:438 qe_ic_init()
>         warn: unsigned 'qe_ic->virq_low' is never less than zero.
>
> In old variant irq_of_parse_and_map() returns zero if failed so
> unsigned int for virq_high/virq_low was ok.
> In new variant platform_get_irq() returns negative error codes
> if failed so we need to use int for virq_high/virq_low.
>
> Also simplify high_handler checking and remove the curly braces
> to make checkpatch happy.
>
> Fixes: be7ecbd240b2 ("soc: fsl: qe: convert QE interrupt controller to platform_device")
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/soc/fsl/qe/qe_ic.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
> index e710d554425d..bff34ee2150a 100644
> --- a/drivers/soc/fsl/qe/qe_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ic.c
> @@ -54,8 +54,8 @@ struct qe_ic {
>         struct irq_chip hc_irq;
>
>         /* VIRQ numbers of QE high/low irqs */
> -       unsigned int virq_high;
> -       unsigned int virq_low;
> +       int virq_high;
> +       int virq_low;
>  };
>
>  /*
> @@ -435,9 +435,8 @@ static int qe_ic_init(struct platform_device *pdev)
>         qe_ic->virq_high = platform_get_irq(pdev, 0);
>         qe_ic->virq_low = platform_get_irq(pdev, 1);
>
> -       if (qe_ic->virq_low < 0) {
> +       if (qe_ic->virq_low < 0)

Probably should be <= 0 here.

>                 return -ENODEV;
> -       }
>
>         if (qe_ic->virq_high != qe_ic->virq_low) {

Probably we should check if qe_ic->virq_high > 0 here if we rely on
this to decide whether to set the handler later.

Applied with the above changes.  Thanks

>                 low_handler = qe_ic_cascade_low;
> @@ -459,7 +458,7 @@ static int qe_ic_init(struct platform_device *pdev)
>         irq_set_handler_data(qe_ic->virq_low, qe_ic);
>         irq_set_chained_handler(qe_ic->virq_low, low_handler);
>
> -       if (qe_ic->virq_high && qe_ic->virq_high != qe_ic->virq_low) {
> +       if (high_handler) {
>                 irq_set_handler_data(qe_ic->virq_high, qe_ic);
>                 irq_set_chained_handler(qe_ic->virq_high, high_handler);
>         }
> --
> 2.31.1
>
