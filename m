Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8864B2FDD83
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 01:01:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLjGS5WnMzDqFD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 11:01:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2e;
 helo=mail-yb1-xb2e.google.com; envelope-from=saravanak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ffW3hc4L; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLjDG2BtkzDqdm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 10:59:06 +1100 (AEDT)
Received: by mail-yb1-xb2e.google.com with SMTP id b11so336683ybj.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 15:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bjNWVbslUhdSMJg6quM5f9vJqYwBuRMO9foprozwioc=;
 b=ffW3hc4LnwwviIoGoe5gnQflzXCd9cYZdMHOoXum4nNbQJvSCC2AfWclS2wU/au9de
 CFRJUjnnhMitRBSu7S3m1/DZy+pxT7lr6QGCTwyNFsjyN9nB4rQa2RwDFVKSQldHo20t
 TSaB19bBSSSneWcjrQvt1mrcSxut+vop26XwhsLB4836gzQMg5Itas4U1iMBYR4Ce63y
 2DAFnXsicdrem0orFA6VQTXVbdXmnJN8xiDo6IjoKhbUluKAbEltdsYNJc7OtM3K5s25
 EdP3oDR0uFcuTNrtyDOjvUyHFnNrPeTeyqMioYmbHubqagHho7lrZ/++FzLpqNwNm/Nf
 i4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bjNWVbslUhdSMJg6quM5f9vJqYwBuRMO9foprozwioc=;
 b=ZKMCrG0ynC1as6bFY+F891t4WErerRIrM2Aoq6Bh/Ksw30XHJKZmdMOQT+3gVIP3XX
 L4F4R0pfFsUpcHvZTgk958p3zPDZfJKdBD+P8G0Rw0Dy9+jGHyL/1a6c53hEb91ZlVoE
 qTlxpr1xmX3TKRcrziQEhyS+Q1coXc4gboQxHDKnOKADTYK4NVSYK/AdKPVrTWK4y95h
 KyjM2Qia83Cw4ArMfe0aQ+aIrEzhW4hDm2N6964Pdfe8Q6uDHV+fRQGI80+Tribn+bfT
 kFg9P6MWN3ZY2NajanCLbx74+mTEAYJPA3AuVzdXlqOWRIeSpGKhZ+bQW057oLYyiAS/
 CNsw==
X-Gm-Message-State: AOAM530NrWeWrMxirZ/eCqG0Tcy0//hkHd65R7jx24EXV1MHO+Bll/kl
 qDwCZ3o4yBUcpuTaaNRbvnwRnRJ+08670roKhkONAw==
X-Google-Smtp-Source: ABdhPJzMu1+JWnwyGx4GwTGFIGNXBqrQijaNrTRbEw4zMGC6WhznJvX295T+Ea7ZyLY4NNnZiFJ6MzxNGPb4DoZb8aA=
X-Received: by 2002:a25:dfcb:: with SMTP id w194mr13618ybg.346.1611187142006; 
 Wed, 20 Jan 2021 15:59:02 -0800 (PST)
MIME-Version: 1.0
References: <20210120105246.23218-1-michael@walle.cc>
 <CAL_JsqLSJCLtgPyAdKSqsy=JoHSLYef_0s-stTbiJ+VCq2qaSA@mail.gmail.com>
 <CAGETcx86HMo=gaDdXFyJ4QQ-pGXWzw2G0J=SjC-eq4K7B1zQHg@mail.gmail.com>
 <c3e35b90e173b15870a859fd7001a712@walle.cc>
 <CAGETcx8eZRd1fJ3yuO_t2UXBFHObeNdv-c8oFH3mXw6zi=zOkQ@mail.gmail.com>
 <f706c0e4b684e07635396fcf02f4c9a6@walle.cc>
In-Reply-To: <f706c0e4b684e07635396fcf02f4c9a6@walle.cc>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 20 Jan 2021 15:58:26 -0800
Message-ID: <CAGETcx8_6Hp+MWFOhRohXwdWFSfCc7A=zpb5QYNHZE5zv0bDig@mail.gmail.com>
Subject: Re: [PATCH] PCI: dwc: layerscape: convert to builtin_platform_driver()
To: Michael Walle <michael@walle.cc>
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

On Wed, Jan 20, 2021 at 3:53 PM Michael Walle <michael@walle.cc> wrote:
>
> Am 2021-01-20 20:47, schrieb Saravana Kannan:
> > On Wed, Jan 20, 2021 at 11:28 AM Michael Walle <michael@walle.cc>
> > wrote:
> >>
> >> [RESEND, fat-fingered the buttons of my mail client and converted
> >> all CCs to BCCs :(]
> >>
> >> Am 2021-01-20 20:02, schrieb Saravana Kannan:
> >> > On Wed, Jan 20, 2021 at 6:24 AM Rob Herring <robh@kernel.org> wrote:
> >> >>
> >> >> On Wed, Jan 20, 2021 at 4:53 AM Michael Walle <michael@walle.cc>
> >> >> wrote:
> >> >> >
> >> >> > fw_devlink will defer the probe until all suppliers are ready. We can't
> >> >> > use builtin_platform_driver_probe() because it doesn't retry after probe
> >> >> > deferral. Convert it to builtin_platform_driver().
> >> >>
> >> >> If builtin_platform_driver_probe() doesn't work with fw_devlink, then
> >> >> shouldn't it be fixed or removed?
> >> >
> >> > I was actually thinking about this too. The problem with fixing
> >> > builtin_platform_driver_probe() to behave like
> >> > builtin_platform_driver() is that these probe functions could be
> >> > marked with __init. But there are also only 20 instances of
> >> > builtin_platform_driver_probe() in the kernel:
> >> > $ git grep ^builtin_platform_driver_probe | wc -l
> >> > 20
> >> >
> >> > So it might be easier to just fix them to not use
> >> > builtin_platform_driver_probe().
> >> >
> >> > Michael,
> >> >
> >> > Any chance you'd be willing to help me by converting all these to
> >> > builtin_platform_driver() and delete builtin_platform_driver_probe()?
> >>
> >> If it just moving the probe function to the _driver struct and
> >> remove the __init annotations. I could look into that.
> >
> > Yup. That's pretty much it AFAICT.
> >
> > builtin_platform_driver_probe() also makes sure the driver doesn't ask
> > for async probe, etc. But I doubt anyone is actually setting async
> > flags and still using builtin_platform_driver_probe().
>
> Hasn't module_platform_driver_probe() the same problem? And there
> are ~80 drivers which uses that.

Yeah. The biggest problem with all of these is the __init markers.
Maybe some familiar with coccinelle can help?

-Saravana
