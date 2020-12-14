Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F072B2D9A76
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 15:59:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cvl0g2ZMKzDqSS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 01:59:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E338AB4T; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cvkyp1Kc4zDqBH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 01:57:53 +1100 (AEDT)
X-Gm-Message-State: AOAM530RuxiW/PxYvXF9/xKOh6i/6SZof1dBthgFKS/dIOunmHmuJlEl
 f52VtYE42/JOjpYm07nE6y37vyJ0LmesB85CIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607957870;
 bh=YjqfvjSV9lpOWWw1+HWGyAfGe7Q5uZpQr/FuGmIm8vk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=E338AB4Tg40+60Asw0fBlGJ4Z4Ibb4OwsmIqeAEmrBh6BxZ9sifmmPx0EG1wdoP2A
 FEXMPIoh5+e0aDyaT2hqsftFKBJ2vaiUHv0gbnTSQtE87xcSFbqNXZzAFxI9/7bP5o
 LaL6VGdUgV+ur7ZrBgvTvedPGU6gDep4Yd0iNyUSbxaVE5Ytf1yc84a92owqvw3Rq4
 qJX95mj8Aw2wFwlx2uiKwaehcV7og3BGBUeL2TlGoohHPBwF23o6aLQCR9H11Mpdmk
 kW8wpCrlnYXsVargOW3zvZ9j8Z10gLWL1HWhRg+2KVGlDQcAWe5wmo9NCkkkhkkzXE
 BZaTQK2NovtQw==
X-Google-Smtp-Source: ABdhPJyLSMg72Yznek8jiRzdUGmAOe93FaxVsu09rOZbryfT+7YOWyVJmc74/U/1ioJcgEsg5vL3GH9lh22HzFPUC5g=
X-Received: by 2002:a05:6402:1841:: with SMTP id
 v1mr25750693edy.194.1607957868199; 
 Mon, 14 Dec 2020 06:57:48 -0800 (PST)
MIME-Version: 1.0
References: <20201211121507.28166-1-daniel.thompson@linaro.org>
 <CAL_JsqKQxFvkFtph1BZD2LKdZjboxhMTWkZe_AWS-vMD9y0pMw@mail.gmail.com>
 <20201211170558.clfazgoetmery6u3@holly.lan>
 <20201214104337.wbvq2gvj3wi6bvzc@holly.lan>
In-Reply-To: <20201214104337.wbvq2gvj3wi6bvzc@holly.lan>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Dec 2020 08:57:36 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+horJfhz0EAL6gcBW39DGzY27CU7PGWqricG579T0q4w@mail.gmail.com>
Message-ID: <CAL_Jsq+horJfhz0EAL6gcBW39DGzY27CU7PGWqricG579T0q4w@mail.gmail.com>
Subject: Re: [RFC HACK PATCH] PCI: dwc: layerscape: Hack around enumeration
 problems with Honeycomb LX2K
To: Daniel Thompson <daniel.thompson@linaro.org>
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
Cc: Roy Zang <roy.zang@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Linaro Patches <patches@linaro.org>, PCI <linux-pci@vger.kernel.org>,
 Jon Nettleton <jon@solid-run.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 14, 2020 at 4:43 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Fri, Dec 11, 2020 at 05:05:58PM +0000, Daniel Thompson wrote:
> > On Fri, Dec 11, 2020 at 08:37:40AM -0600, Rob Herring wrote:
> > > On Fri, Dec 11, 2020 at 6:15 AM Daniel Thompson
> > > >     BTW I noticed many other pcie-designware drivers take advantage
> > > >     of a function called dw_pcie_wait_for_link() in their init paths...
> > > >     but my naive attempts to add it to the layerscape driver results
> > > >     in non-booting systems so I haven't embarrassed myself by including
> > > >     that in the patch!
> > >
> > > You need to look at what's pending for v5.11, because I reworked this
> > > to be more unified. The ordering of init is also possibly changed. The
> > > sequence is now like this:
> > >
> > >         dw_pcie_setup_rc(pp);
> > >         dw_pcie_msi_init(pp);
> > >
> > >         if (!dw_pcie_link_up(pci) && pci->ops->start_link) {
> > >                 ret = pci->ops->start_link(pci);
> > >                 if (ret)
> > >                         goto err_free_msi;
> > >         }
> > >
> > >         /* Ignore errors, the link may come up later */
> > >         dw_pcie_wait_for_link(pci);
> >
> > Thanks. That looks likely to fix it since IIUC dw_pcie_wait_for_link()
> > will end up waiting somewhat like the double check I added to
> > ls_pcie_link_up().
> >
> > I'll take a look at let you know.
>
> Yes. These changes have fixed the enumeration problems for me.
>
> I tested pci/next and I cherry picked your patch series onto v5.10 and
> both are working well.
>
> Given this fixes a bug for me, do you think there is any scope for me
> to whittle down your series into patches for the stable kernels or am
> I likely to find too many extra bits being pulled in?

I think I'd just go the adding a delay route. It's a fairly big series
and depends on my other clean-up done in 5.10. And there's at least
some possibility it regresses some platform given the limited testing
linux-next gets.

Rob
