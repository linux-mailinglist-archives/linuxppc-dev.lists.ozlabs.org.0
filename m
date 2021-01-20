Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F982FDB44
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 22:01:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLdHb5dhPzDr3V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 08:01:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b34;
 helo=mail-yb1-xb34.google.com; envelope-from=saravanak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=oC6SN/sb; dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLbg806HPzDqTg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 06:48:35 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id x6so20620087ybr.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 11:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ObV+Zrw0ag3h+RPkcqP4IfhPjoMoAtg+NMqr3jjO+Go=;
 b=oC6SN/sbj4bIrF3B4GUuhs9TwpbLn4WPe1e9cjwF7wwmLDRIO7pF44hc+PlUUR5s6f
 BUa/nNUWktSkKrynSgljkxdDWgmOVVMVyk8uWzs3rc62W0hdOV2OZFhKAvCRrJue94uF
 dtTS6xLCZnR4CARQJgq3BQNQntv8GvoIMDidgambBPn09cfAnJTf/fW2G1wUUaSef+Lb
 eUdBgvApC0YkqmFU3YIk/cUwKzppcJs1fvb2jH3Mxq+LoT5Y1ONy+9CAcS/N9SgllEh8
 BpR65N56lr1oYN/R2Sk1xRq0HxiULzg425ngiI8FJXDLpvPxGxLFwJJPKAUdWbIf3wHj
 w/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ObV+Zrw0ag3h+RPkcqP4IfhPjoMoAtg+NMqr3jjO+Go=;
 b=M1Ueg2atHovYT/z2EDtX73ZwTYitCrGeldLnDb4PxgDYqWKAivG61u0BAa8VHXMGGh
 5KQ0GX4eklFiCNcObKShKojuJFlPmWe2AjUk2Yz5MPvYmcGD6Mhey75nXVaxnnREJEOb
 cGs2CV1X7UY2kWLykX1VfI+QXvI/L95EReTf8qcRfaGc8CUyE0yQ3oOsH2z+FP5/Elhf
 r6VG9X31OzykiV59hJI/TwpOsYLCNQs0B3T4pmVEHtfOU4Xw39LGYaP1ZE2FvVpxfS+I
 EFKHD0lUkCllWLEGYSj5nvgwR6JrUxR02bjfcEywx8KmBhlnLjQRWUMR7v8Q8I53HZSs
 KuUg==
X-Gm-Message-State: AOAM531LAtaTNJWLjoPyKf4OQpRhDgp4+27LeDqlzG+ixQs4hrbQhpJi
 RH4LytNE3AsTHo2iS14CAAOQr07pXZllwsoK6mtloQ==
X-Google-Smtp-Source: ABdhPJwnmI7Ki+dDkxtJ432CAmCzDl+L83UkNWO3KhRK6fxwAFD24zUFGq1C6V2bl4d7oNvSYCj+gOEJxriWc7ov3P4=
X-Received: by 2002:a25:b703:: with SMTP id t3mr17175535ybj.96.1611172112724; 
 Wed, 20 Jan 2021 11:48:32 -0800 (PST)
MIME-Version: 1.0
References: <20210120105246.23218-1-michael@walle.cc>
 <CAL_JsqLSJCLtgPyAdKSqsy=JoHSLYef_0s-stTbiJ+VCq2qaSA@mail.gmail.com>
 <CAGETcx86HMo=gaDdXFyJ4QQ-pGXWzw2G0J=SjC-eq4K7B1zQHg@mail.gmail.com>
 <c3e35b90e173b15870a859fd7001a712@walle.cc>
 <CAGETcx8eZRd1fJ3yuO_t2UXBFHObeNdv-c8oFH3mXw6zi=zOkQ@mail.gmail.com>
In-Reply-To: <CAGETcx8eZRd1fJ3yuO_t2UXBFHObeNdv-c8oFH3mXw6zi=zOkQ@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 20 Jan 2021 11:47:56 -0800
Message-ID: <CAGETcx_bT46e1JFsSDQ+Rv8uFwHYima-00anH220qmK=cCs=Ww@mail.gmail.com>
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

On Wed, Jan 20, 2021 at 11:47 AM Saravana Kannan <saravanak@google.com> wrote:
>
> On Wed, Jan 20, 2021 at 11:28 AM Michael Walle <michael@walle.cc> wrote:
> >
> > [RESEND, fat-fingered the buttons of my mail client and converted
> > all CCs to BCCs :(]
> >
> > Am 2021-01-20 20:02, schrieb Saravana Kannan:
> > > On Wed, Jan 20, 2021 at 6:24 AM Rob Herring <robh@kernel.org> wrote:
> > >>
> > >> On Wed, Jan 20, 2021 at 4:53 AM Michael Walle <michael@walle.cc>
> > >> wrote:
> > >> >
> > >> > fw_devlink will defer the probe until all suppliers are ready. We can't
> > >> > use builtin_platform_driver_probe() because it doesn't retry after probe
> > >> > deferral. Convert it to builtin_platform_driver().
> > >>
> > >> If builtin_platform_driver_probe() doesn't work with fw_devlink, then
> > >> shouldn't it be fixed or removed?
> > >
> > > I was actually thinking about this too. The problem with fixing
> > > builtin_platform_driver_probe() to behave like
> > > builtin_platform_driver() is that these probe functions could be
> > > marked with __init. But there are also only 20 instances of
> > > builtin_platform_driver_probe() in the kernel:
> > > $ git grep ^builtin_platform_driver_probe | wc -l
> > > 20
> > >
> > > So it might be easier to just fix them to not use
> > > builtin_platform_driver_probe().
> > >
> > > Michael,
> > >
> > > Any chance you'd be willing to help me by converting all these to
> > > builtin_platform_driver() and delete builtin_platform_driver_probe()?
> >
> > If it just moving the probe function to the _driver struct and
> > remove the __init annotations. I could look into that.
>
> Yup. That's pretty much it AFAICT.
>
> builtin_platform_driver_probe() also makes sure the driver doesn't ask
> for async probe, etc. But I doubt anyone is actually setting async
> flags and still using builtin_platform_driver_probe().
>

And thanks for agreeing to help!

-Saravana
