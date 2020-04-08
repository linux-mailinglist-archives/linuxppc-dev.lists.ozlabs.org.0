Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EA71A2C03
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 00:48:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yKFV6TTyzDr6d
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 08:48:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.67; helo=mail-io1-f67.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yKCq41C5zDr34
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 08:47:18 +1000 (AEST)
Received: by mail-io1-f67.google.com with SMTP id n10so1907576iom.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Apr 2020 15:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fu64UL2/aZUHV4DT2tomeskLOh/+k23UcYzbE4vOhe4=;
 b=J3uGWrCH0qpIzSQMtWrNwBHX1Zddsa3S4JmQUlVNBzSo8NjtYq8tatb6uYs4zFNHPh
 7HwPsw3mpaVK2YN/rTXEW74lTGLAALqemaTUO4M61gItFf7Wy6n9DSGbW5l0FHxQ9e6z
 /5v2DK6Tb+qfz0oib0FiM3IuyPlxImKe0cQ8cI+zo3/n2RX8ghao2cIRHK6XPUPMkWfF
 ibL/AAc7HPKY7bv6ad9u3KFjXInPIhzuNrqGcQLvZIbjtpVZkaH+4AkAVPqZsOJQc5iH
 R6LhZo/+sXoYx9iYBK9QlwLsffwfdCk/6pMIFqHSDuSBLeMehy47G4enS5pQY31yFC22
 nMVQ==
X-Gm-Message-State: AGi0Pubh38ho9Z6AgE+6ywrtY99sJ7HkK0Glm1oJ5iI4EwxAa6UmjAG4
 SFPE8Ct8rO5LsC4FM1pHSwQYKxKx5rA=
X-Google-Smtp-Source: APiQypIhmEnzAxT3g6rT8TDoQZ/Ed/mBW/d0aPOeYArcX9PMH3HjoP0cbGJk3+WMWsAEqySuFgtXTw==
X-Received: by 2002:a02:390b:: with SMTP id l11mr9176358jaa.111.1586386035931; 
 Wed, 08 Apr 2020 15:47:15 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com.
 [209.85.166.44])
 by smtp.gmail.com with ESMTPSA id n29sm8515913ila.86.2020.04.08.15.47.14
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2020 15:47:15 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id f3so1924284ioj.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Apr 2020 15:47:14 -0700 (PDT)
X-Received: by 2002:a5d:91cc:: with SMTP id k12mr9210587ior.198.1586386034462; 
 Wed, 08 Apr 2020 15:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <36341bb1-1e00-5eb1-d032-60dcc614ddaf@web.de>
In-Reply-To: <36341bb1-1e00-5eb1-d032-60dcc614ddaf@web.de>
From: Li Yang <leoyang.li@nxp.com>
Date: Wed, 8 Apr 2020 17:47:03 -0500
X-Gmail-Original-Message-ID: <CADRPPNRe=YxwjCOYbEjKg4LCOx2suK5WxZp17NJhTm76szdU0w@mail.gmail.com>
Message-ID: <CADRPPNRe=YxwjCOYbEjKg4LCOx2suK5WxZp17NJhTm76szdU0w@mail.gmail.com>
Subject: Re: usb: gadget: fsl_udc_core: Checking for a failed
 platform_get_irq() call in fsl_udc_probe()
To: Markus Elfring <Markus.Elfring@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Felipe Balbi <balbi@kernel.org>, Tang Bin <tangbin@cmss.chinamobile.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 8, 2020 at 9:19 AM Markus Elfring <Markus.Elfring@web.de> wrote=
:
>
> Hello,
>
> I have taken another look at the implementation of the function =E2=80=9C=
fsl_udc_probe=E2=80=9D.
> A software analysis approach points the following source code out for
> further development considerations.
> https://elixir.bootlin.com/linux/v5.6.2/source/drivers/usb/gadget/udc/fsl=
_udc_core.c#L2443
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/usb/gadget/udc/fsl_udc_core.c?id=3Df5e94d10e4c468357019e5c28d48499f6=
77b284f#n2442
>
>         udc_controller->irq =3D platform_get_irq(pdev, 0);
>         if (!udc_controller->irq) {
>                 ret =3D -ENODEV;
>                 goto err_iounmap;
>         }
>
>
> The software documentation is providing the following information
> for the used programming interface.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/base/platform.c?id=3Df5e94d10e4c468357019e5c28d48499f677b284f#n221
> https://elixir.bootlin.com/linux/v5.6.2/source/drivers/base/platform.c#L2=
02
>
> =E2=80=9C=E2=80=A6
>  * Return: IRQ number on success, negative error number on failure.
> =E2=80=A6=E2=80=9D
>
> Would you like to reconsider the shown condition check?

Thanks for the finding.  This is truly a software issue that need to
be fixed.  Would you submit a patch for it or you want us to fix it?

Regards,
Leo
