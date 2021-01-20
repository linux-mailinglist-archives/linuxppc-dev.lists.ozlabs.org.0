Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E9D2FDB40
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 21:59:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLdFH3RJrzDqZ2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 07:59:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2b;
 helo=mail-yb1-xb2b.google.com; envelope-from=saravanak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=gqXXWU/D; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLbfk4RLYzDqTg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 06:48:13 +1100 (AEDT)
Received: by mail-yb1-xb2b.google.com with SMTP id y128so20569871ybf.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 11:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z+VKdic9vQLplZ5dRDPFBsqTAKEx7zvAEih/IIGE3o4=;
 b=gqXXWU/DUfCRlZqg6VB4WrIPdIGgIy2FpoB64Tw6CtQ1jL1wrLFZqp3MrEbrMBYGiZ
 N4/i+WbY5NkRoGQ0TOQ8gSx1H/xButR/QyThA+B2Gz/O5XBV3DuftVSBSZBLeyg1OLU+
 UOnY3ZnpvA9fS2hSivgKSdxrfkTqrNLOncrFUlwoHemuKABuY67DntKltT3SJx0D9dWo
 /9pBl19rfoJS1N1WX6MM6xVcEDMYzyaqXAJ7Q6wXNhN/hh/u8nnQojbYlYlOdnqtABHz
 lhAfatORzVUNAHTBDkjRB1KD+A8zB99tvQ/Y4CW0lF2FN6Oz8vdPn1HEE/kgKprBbKFe
 sZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z+VKdic9vQLplZ5dRDPFBsqTAKEx7zvAEih/IIGE3o4=;
 b=ZbFyzhev4f0pBIIsu7FPMjl22VRuMNzWN+LNHoVSF5xgt7CEw1MMjNFJXE8q8Y+Vsm
 BHhnl5CNKjndsy4jI3Daw7iZs5dTB0G1NWDDmGsElUaH3ccg/J/s3fqH/T0Pk8cU69i2
 ecXCjLIt04rYHqGF1f4UqrGskD9heFzHmkSquXbsUr2DCMZ39p4E79k65lhIU1wOWrGm
 t/wPN/FdZMUiebqcHfatm2FobjpQoWfsFD3cH+biwsuWgfqAwkHGJxGi1c1YW/JF4MW1
 WTLxRB/1UxnjsR9zrilmcWkWA71n9WCCja9Soepcq00Isfkb/m4aSEgnSV8ShVv6k8ac
 03FA==
X-Gm-Message-State: AOAM530v58Lx1fw/RcNZRbEqv/vN0FlciMC4cUOfpma1AUmdZ/UJ0dJ5
 m8/K5bZhZ0Wc2LCzUlro4zfUEH6wm90gJ5vTkmeNxA==
X-Google-Smtp-Source: ABdhPJy6lnzImOgxZ62zFBVY/BNYqrbN/QRRos+AWvRoeObCVMQxkr4MeX9zWJIX5eWD7W+mqvC8d3XxTrbOt6hpwoA=
X-Received: by 2002:a25:77d4:: with SMTP id s203mr17677961ybc.32.1611172088185; 
 Wed, 20 Jan 2021 11:48:08 -0800 (PST)
MIME-Version: 1.0
References: <20210120105246.23218-1-michael@walle.cc>
 <CAL_JsqLSJCLtgPyAdKSqsy=JoHSLYef_0s-stTbiJ+VCq2qaSA@mail.gmail.com>
 <CAGETcx86HMo=gaDdXFyJ4QQ-pGXWzw2G0J=SjC-eq4K7B1zQHg@mail.gmail.com>
 <c3e35b90e173b15870a859fd7001a712@walle.cc>
In-Reply-To: <c3e35b90e173b15870a859fd7001a712@walle.cc>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 20 Jan 2021 11:47:31 -0800
Message-ID: <CAGETcx8eZRd1fJ3yuO_t2UXBFHObeNdv-c8oFH3mXw6zi=zOkQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: dwc: layerscape: convert to builtin_platform_driver()
To: Michael Walle <michael@walle.cc>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 21 Jan 2021 07:49:58 +1100
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
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Roy Zang <roy.zang@nxp.com>,
 PCI <linux-pci@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 20, 2021 at 11:28 AM Michael Walle <michael@walle.cc> wrote:
>
> [RESEND, fat-fingered the buttons of my mail client and converted
> all CCs to BCCs :(]
>
> Am 2021-01-20 20:02, schrieb Saravana Kannan:
> > On Wed, Jan 20, 2021 at 6:24 AM Rob Herring <robh@kernel.org> wrote:
> >>
> >> On Wed, Jan 20, 2021 at 4:53 AM Michael Walle <michael@walle.cc>
> >> wrote:
> >> >
> >> > fw_devlink will defer the probe until all suppliers are ready. We can't
> >> > use builtin_platform_driver_probe() because it doesn't retry after probe
> >> > deferral. Convert it to builtin_platform_driver().
> >>
> >> If builtin_platform_driver_probe() doesn't work with fw_devlink, then
> >> shouldn't it be fixed or removed?
> >
> > I was actually thinking about this too. The problem with fixing
> > builtin_platform_driver_probe() to behave like
> > builtin_platform_driver() is that these probe functions could be
> > marked with __init. But there are also only 20 instances of
> > builtin_platform_driver_probe() in the kernel:
> > $ git grep ^builtin_platform_driver_probe | wc -l
> > 20
> >
> > So it might be easier to just fix them to not use
> > builtin_platform_driver_probe().
> >
> > Michael,
> >
> > Any chance you'd be willing to help me by converting all these to
> > builtin_platform_driver() and delete builtin_platform_driver_probe()?
>
> If it just moving the probe function to the _driver struct and
> remove the __init annotations. I could look into that.

Yup. That's pretty much it AFAICT.

builtin_platform_driver_probe() also makes sure the driver doesn't ask
for async probe, etc. But I doubt anyone is actually setting async
flags and still using builtin_platform_driver_probe().

-Saravana
