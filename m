Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE784276D8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 05:12:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HR99N2zBcz3c8k
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 14:12:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.177;
 helo=mail-qt1-f177.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HR98t1pxWz2ypR
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 14:12:29 +1100 (AEDT)
Received: by mail-qt1-f177.google.com with SMTP id r17so6095569qtx.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Oct 2021 20:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RZSR3JWmSBMwGLbANGREyXBTPWcaZYMU43ykvJz+HmI=;
 b=qKo3FpZuW5lUa90O5vQBvJAkrUjGtZjZffLl2ftjIu/7jd3XQwClSKgpMM38d0m4x3
 hd5VA4vyc6OLQ6t9VXU+nycycbaifwkHSBvZM2A2OFS2F5LSta/9ujyZrgJjHvey9mYh
 U8VkTW+sl5J2IXMvj23xQRRM3KKikIc036r6WpLZEDzBWbk8JKXf17ty/MA2mnM2l4gS
 Hrdsf267u0KbHr7444I0e8QcZQUMqScSPVcOpkNyOcQa3cdyjFRD1XS4e7LSQX53eTGG
 1/uL+z+3dPdz4oSzA5T1YXZSlf4ieznv1/Nq5Xj7I1z0GT948xBMaExrTVC1DXvqo9CT
 8iYQ==
X-Gm-Message-State: AOAM532KIO1Tn6l9claLAOXgjVM6GPjFG5F9fxYtStIRxZxRxUTRkTQm
 vrIZaRgZBxh+YRYiWbqtzwDrV0IiFDo=
X-Google-Smtp-Source: ABdhPJwcNUFcrrBNpVRQ6BAFMaiCwWIe3wXU/rdpMen5sy4P5UBBntgmuFSw9gA/gnfdIEAI8YGj8Q==
X-Received: by 2002:ac8:3d42:: with SMTP id u2mr2060903qtf.346.1633749145872; 
 Fri, 08 Oct 2021 20:12:25 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com.
 [209.85.222.178])
 by smtp.gmail.com with ESMTPSA id bj31sm1087058qkb.43.2021.10.08.20.12.25
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 20:12:25 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id ay35so2652039qkb.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Oct 2021 20:12:25 -0700 (PDT)
X-Received: by 2002:a37:b842:: with SMTP id i63mr5942720qkf.262.1633749145064; 
 Fri, 08 Oct 2021 20:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211001000924.15421-1-leoyang.li@nxp.com>
 <20211001000924.15421-3-leoyang.li@nxp.com>
 <YVsrYp3kZNmB1CIu@robh.at.kernel.org>
In-Reply-To: <YVsrYp3kZNmB1CIu@robh.at.kernel.org>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 8 Oct 2021 22:12:13 -0500
X-Gmail-Original-Message-ID: <CADRPPNSqJJ3RObHLVmpcg71Gz6jXi+Qa3kv-Z2oyBHzv4qcx_g@mail.gmail.com>
Message-ID: <CADRPPNSqJJ3RObHLVmpcg71Gz6jXi+Qa3kv-Z2oyBHzv4qcx_g@mail.gmail.com>
Subject: Re: [PATCH 2/5] memory: fsl_ifc: populate child devices without
 relying on simple-bus
To: Rob Herring <robh@kernel.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 4, 2021 at 12:14 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Sep 30, 2021 at 07:09:21PM -0500, Li Yang wrote:
> > After we update the binding to not use simple-bus compatible for the
> > controller, we need the driver to populate the child devices explicitly.
> >
> > Signed-off-by: Li Yang <leoyang.li@nxp.com>
> > ---
> >  drivers/memory/fsl_ifc.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
> > index d062c2f8250f..251d713cd50b 100644
> > --- a/drivers/memory/fsl_ifc.c
> > +++ b/drivers/memory/fsl_ifc.c
> > @@ -88,6 +88,7 @@ static int fsl_ifc_ctrl_remove(struct platform_device *dev)
> >  {
> >       struct fsl_ifc_ctrl *ctrl = dev_get_drvdata(&dev->dev);
> >
> > +     of_platform_depopulate(&dev->dev);
> >       free_irq(ctrl->nand_irq, ctrl);
> >       free_irq(ctrl->irq, ctrl);
> >
> > @@ -285,6 +286,14 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
> >               }
> >       }
> >
> > +     /* legacy dts may still use "simple-bus" compatible */
> > +     if (!of_device_is_compatible(dev->dev.of_node, "simple-bus")) {
> > +             ret = of_platform_populate(dev->dev.of_node, NULL, NULL,
> > +                                             &dev->dev);
>
> There's no need to make this conditional. of_platform_populate() is safe
> to call multiple times. If that doesn't work, it's a bug.

I think that it is probably an optimization to avoid re-populate the
bus for legacy device trees.  But it might be cleaner to just
re-populate anyway?

Regards,
Leo
