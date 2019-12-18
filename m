Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C264B12402E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 08:20:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d5xv4ZynzDqbF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 18:20:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::143;
 helo=mail-il1-x143.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PPeL3sQb"; 
 dkim-atps=neutral
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d5vk33kJzDqRZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 18:18:26 +1100 (AEDT)
Received: by mail-il1-x143.google.com with SMTP id c4so823799ilo.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 23:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JCwa00IyQIOLZ6z5iyawbZaNF4jJ6Iczm0eXb9CjqUU=;
 b=PPeL3sQbNZHoirsJWfwatpisDOVGToI3CoGqFNY4/oya1AjdAGO+LOBjokNQcUMBI6
 S4XoTesMvsOSgqYl6Tsq/qcsAwmvwhHMkhekPtamed+iNGRY32cvFqChMHshvoE5Zgsf
 Q0qRp3RkmC1XoD1frrkmA6XzjCn6+gSGy8yYsZ+dHjpvGfJ9d1fp1D1BDqlFvvpijKI+
 akUP5gyNU3VRzuB2I/fHGacriS+MgeJCye0F3gsIxvdvbi7hNDdvjIok4Wzbfusehlmg
 tG6+jDPipxM5cBIfVuJ84lBDyx8G1wx3HVRf2RnWC6fpdMf+mywdxlecOnHFjM5YySx8
 43Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JCwa00IyQIOLZ6z5iyawbZaNF4jJ6Iczm0eXb9CjqUU=;
 b=nKfvKQDszyaCuvbfRvRm6nhcYpJ8yIUiYqiGhiI2c2JELcx4TlJDo3wiFEL3qH0PeN
 S5yRed7H1B8d6/FRNvKM131likTde1MRfgeaNsEoow+P1FKMAXJVlsJBr71X/3M8FOTz
 k6a8yVk5lWlLpzhvEInw6J5J6U6SeeFwsaeL4PUr4rK67sjJx6bGr1A6x5mQEN1QInXM
 ykrwSHK3KabWjB1TUolKuBoMWUvfXwlcd80XcPBzcx9ADuNsh6+thYcqdFFUYyEOQnPC
 nm0RQjbQbP6AA9csBHANO9Is0YzMIA5ptsoonRVqOdxjmPD9iYs+f5F0Hi+tl/3o3Sb6
 Na+w==
X-Gm-Message-State: APjAAAV9t4FP1YRSAMqE4S1llDV2Fs5dSFjzcrepgCiusVesypxjphcw
 I+dS4u3tW28EWrL1+9xZnXcX5qTOUSkOKyG0icc=
X-Google-Smtp-Source: APXvYqz/6Gyoo0ZOsaHyTvMhPiJSUUCi7Es/5C4io0hOtE9kuWjmgJL7u5Gd4+rPxvw7QmHa2YK50fQKJsU8rRKXQeg=
X-Received: by 2002:a92:4e:: with SMTP id 75mr555618ila.276.1576653500781;
 Tue, 17 Dec 2019 23:18:20 -0800 (PST)
MIME-Version: 1.0
References: <1574816731.13250.9.camel@hbabu-laptop>
In-Reply-To: <1574816731.13250.9.camel@hbabu-laptop>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 18 Dec 2019 18:18:09 +1100
Message-ID: <CAOSf1CEvZ32xC71siuyfUQEcQ4yLoDtj2jGoc3jrmsHc0jD+Vw@mail.gmail.com>
Subject: Re: [PATCH 04/14] powerpc/vas: Setup IRQ mapping and register port
 for each window
To: Haren Myneni <haren@linux.vnet.ibm.com>
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
Cc: Device Tree <devicetree@vger.kernel.org>,
 Michael Neuling <mikey@neuling.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 27, 2019 at 12:07 PM Haren Myneni <haren@linux.vnet.ibm.com> wrote:
>
> *snip*
>
> @@ -36,7 +62,18 @@ static int init_vas_instance(struct platform_device *pdev)
>                 return -ENODEV;
>         }
>
> -       if (pdev->num_resources != 4) {
> +       rc = of_property_read_u64(dn, "ibm,vas-port", &port);
> +       if (rc) {
> +               pr_err("No ibm,vas-port property for %s?\n", pdev->name);
> +               /* No interrupts property */
> +               nresources = 4;
> +       }
> +
> +       /*
> +        * interrupts property is available with 'ibm,vas-port' property.
> +        * 4 Resources and 1 IRQ if interrupts property is available.
> +        */
> +       if (pdev->num_resources != nresources) {
>                 pr_err("Unexpected DT configuration for [%s, %d]\n",
>                                 pdev->name, vasid);
>                 return -ENODEV;

Right, so adding the IRQ in firmware will break the VAS driver in
existing kernels since it changes the resource count. This is IMO a
bug in the VAS driver that you should fix, but it does mean we need to
think twice about having firmware assign an interrupt at boot.

I had a closer look at this series and I'm not convinced that any
firmware changes are actually required either. We already have OPAL
calls for allocating an hwirq for the kernel to use and for getting
the IRQ's XIVE trigger port (see pnv_ocxl_alloc_xive_irq() for an
example). Why not use those here too? Doing so would allow us to
assign interrupts to individual windows too which might be useful for
the windows used by the kernel.
