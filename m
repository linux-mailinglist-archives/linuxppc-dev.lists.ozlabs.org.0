Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 879A753A528
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 14:36:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCpXb2vVbz3blK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 22:35:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.175; helo=mail-oi1-f175.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCpX630cVz2xvw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 22:35:33 +1000 (AEST)
Received: by mail-oi1-f175.google.com with SMTP id w130so2515473oig.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jun 2022 05:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=82L4X+R71tB/oBHFieTxctNvKfw4v3mlwwZIdAh9rvk=;
        b=BMZUAlKBiZaCIrxQOyhyrUPWLAY0MRr1/aKvljZDg2yG4f5xr62ae8X6qL6sypZtRw
         IOBUtdYZ7SWrUkVRcju0DJTKD4Rc6eJZY19007DVEz6B6WeewItzV3+IfeJEMXaqLvUE
         CJIgxgT/mgAr+0OdF87bdcTUPd+ThzWBsgKduMJT4IrQhkUH27UOvP41Ni29wMJ3Z42q
         As59Yx/PGI53ezrlbXHY6qBiiJY84apSwM7nZ9AprYxfPJvj4tHOUCosjAY8t1N8Uz4k
         /RzDxZ0hLDIks1AKri1fy/FcwB4Oa6GGb4wrKXinY2Vi7BtpSgB7pLjvNuJ63aCVFvkw
         54jQ==
X-Gm-Message-State: AOAM530KVZ+X8Zsi7uA8lf3nF4XTNMfgwMJmFGu/m3YAstVAgl9RlYTt
	DCM9/qmt76V4BGiTt2OdVQ==
X-Google-Smtp-Source: ABdhPJzVwly1aZVPqXvvzde/yRFC+/eJWAmhpCecasnCwaemv3chTF+FUk0DafomWcC/mJWafCRfPg==
X-Received: by 2002:a54:458c:0:b0:32a:f3f1:a6e7 with SMTP id z12-20020a54458c000000b0032af3f1a6e7mr14730295oib.179.1654086929964;
        Wed, 01 Jun 2022 05:35:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d22-20020a056830045600b00608b8e6fad5sm658392otc.76.2022.06.01.05.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 05:35:29 -0700 (PDT)
Received: (nullmailer pid 3764642 invoked by uid 1000);
	Wed, 01 Jun 2022 12:35:29 -0000
Date: Wed, 1 Jun 2022 07:35:29 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [FSL P50x0] Keyboard and mouse don't work anymore after the
 devicetree updates for 5.19
Message-ID: <20220601123529.GA3760306-robh@kernel.org>
References: <CAL_JsqK+OqML54Dfs_JNeM1_od9EBGf-eMH_4sXgpjqs2R-iYQ@mail.gmail.com>
 <87A6751F-9F21-4D06-A664-910F27459D5C@xenosoft.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87A6751F-9F21-4D06-A664-910F27459D5C@xenosoft.de>
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
Cc: Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 31, 2022 at 06:29:38PM +0200, Christian Zigotzky wrote:
> 
> 
> > On 31. May 2022, at 15:46, Rob Herring <robh@kernel.org> wrote:
> > 
> > ﻿On Mon, May 30, 2022 at 12:26 AM Christian Zigotzky
> > <chzigotzky@xenosoft.de> wrote:
> >> 
> >>> On 27 May 2022 at 04:23 pm, Rob Herring wrote:
> >>> The issue is in drivers/usb/host/fsl-mph-dr-of.c which copies the
> >>> resources to a child platform device. Can you try the following
> >>> change:
> >>> 
> >>> diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
> >>> index 44a7e58a26e3..47d9b7be60da 100644
> >>> --- a/drivers/usb/host/fsl-mph-dr-of.c
> >>> +++ b/drivers/usb/host/fsl-mph-dr-of.c
> >>> @@ -80,8 +80,6 @@ static struct platform_device *fsl_usb2_device_register(
> >>>                                         const char *name, int id)
> >>>  {
> >>>         struct platform_device *pdev;
> >>> -       const struct resource *res = ofdev->resource;
> >>> -       unsigned int num = ofdev->num_resources;
> >>>         int retval;
> >>> 
> >>>         pdev = platform_device_alloc(name, id);
> >>> @@ -106,11 +104,7 @@ static struct platform_device *fsl_usb2_device_register(
> >>>         if (retval)
> >>>                 goto error;
> >>> 
> >>> -       if (num) {
> >>> -               retval = platform_device_add_resources(pdev, res, num);
> >>> -               if (retval)
> >>> -                       goto error;
> >>> -       }
> >>> +       pdev->dev.of_node = ofdev->dev.of_node;
> >>> 
> >>>         retval = platform_device_add(pdev);
> >>>         if (retval)
> >> Hello Rob,
> >> 
> >> Thanks a lot for your patch! Unfortunately, this leads to a boot loop.
> >> Do you have another idea?
> > 
> > Do you have a dmesg log?
> 
> From the boot loop?

Yes.

> 
> > 
> > The other way to fix is creating a IRQ resource and adding it to the
> > child device resources.
> 
> Good idea.

Not really. I'd rather have the child device just point to the DT node, 
but that doesn't seem to work for some drivers and I want to understand 
why.

Rob
