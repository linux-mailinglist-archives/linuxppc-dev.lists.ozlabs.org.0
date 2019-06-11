Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B483D3FE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 19:26:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NcNh4s9RzDqx9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 03:26:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NcKF1dHQzDqvw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 03:23:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ohJRVMM6"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45NcKD6yVcz8t23
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 03:23:12 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45NcKD57dKz9s6w; Wed, 12 Jun 2019 03:23:12 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::a41; helo=mail-vk1-xa41.google.com;
 envelope-from=oded.gabbay@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ohJRVMM6"; 
 dkim-atps=neutral
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45NcKD22nBz9s3l
 for <linuxppc-dev@ozlabs.org>; Wed, 12 Jun 2019 03:23:12 +1000 (AEST)
Received: by mail-vk1-xa41.google.com with SMTP id g124so2665491vkd.1
 for <linuxppc-dev@ozlabs.org>; Tue, 11 Jun 2019 10:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ekM0Tx58LmlXGIf4GqN0uasBwVkT/hH33CThSLb798=;
 b=ohJRVMM6DIAFbA/yHTwIOxp/NmQU2VC/CmthiVlLnrkWgSho10GkDrhqCah71eaW4L
 pernzBf4JqxXdqZfS4CbwMlSfwid12kU/yhewcP5016JDTcja6Cv316Yi9IEsSzfhvER
 e2XLwY7IeFHpwXW5y6Zd8wTIbb1XoQ7BCLlKVLwM6G1rAvmtFXFc1smWvQFGL4C7mDbc
 Xv9vzxbwf6+lHjLs0w8WtLtfZBpgRxqnj6T+qKUOzDmVjE3/bC+Fvx1F6CF1fhO0Y4KX
 cKnVKdHZzwR9gJkxAU9mqdCZa4/YJyYKdzg+inaI4ZT6vFUKFfaZDhy9dPswGOX++3P1
 Zj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ekM0Tx58LmlXGIf4GqN0uasBwVkT/hH33CThSLb798=;
 b=RZDQok0vKVAVtyOlsBam3BdK01mWcla06JphuWzes1gdK0W5ec58O1PQbNTmE/3Utj
 VwMIk+EGC86YS1WnoIyjn6dXizJ4rqz0oXZzlOlQrcm8WZRgBqmA8coHzd1VTnjo4UzH
 gXyEEI+GTiOLpfW7uUpWogMi70BDaDvcZaz8HseyytQO7nCpVi9kit7a0ZSUnMoaUa20
 sHBbbaShRow4iQw3LOBe4xdjB37rcFMcWOYNAW5hpsg36sMSQbQMShfikC4Saps02Zre
 A0YqeEpl+37f7YgC0+v4wvALyYOI/9Gyl+BU1MgM87t24uTr4jSyFtMgLKbKtkRc8jfn
 5igw==
X-Gm-Message-State: APjAAAXzL3qO11iUWMN/2LjYa997pIRv3sMFsX4qYyRZgrayVHDiu0yl
 zEiuO9iJ7MuOkNBZpB0TDcVFKDroCNmdCR2g4gHBDhWU
X-Google-Smtp-Source: APXvYqxOiH2kCkQzr82l3xFLUKSImtLMVMJRBIPliMpFOoL2sfq9Du4QEnQyXNMWrra3h3Fr8G0T6esyqjvidclqga0=
X-Received: by 2002:a1f:c402:: with SMTP id u2mr16839124vkf.68.1560273789368; 
 Tue, 11 Jun 2019 10:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190611092144.11194-1-oded.gabbay@gmail.com>
 <20190611095857.GB24058@kroah.com>
 <20190611151753.GA11404@infradead.org> <20190611152655.GA3972@kroah.com>
 <CAFCwf13A73AxKzaa7Dk3tU-1NDgTFs4+xCO2os7SuSyUHZ9Z3Q@mail.gmail.com>
In-Reply-To: <CAFCwf13A73AxKzaa7Dk3tU-1NDgTFs4+xCO2os7SuSyUHZ9Z3Q@mail.gmail.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Tue, 11 Jun 2019 20:22:43 +0300
Message-ID: <CAFCwf134nTD4FM_9Q+THQ7ZAZzGxhs15O6EheaRJMqM5wxi+aA@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] habanalabs: enable 64-bit DMA mask in POWER9
To: Greg KH <gregkh@linuxfoundation.org>, linuxppc-dev@ozlabs.org, 
 Christoph Hellwig <hch@infradead.org>
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
Cc: "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 11, 2019 at 8:03 PM Oded Gabbay <oded.gabbay@gmail.com> wrote:
>
> On Tue, Jun 11, 2019 at 6:26 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Jun 11, 2019 at 08:17:53AM -0700, Christoph Hellwig wrote:
> > > On Tue, Jun 11, 2019 at 11:58:57AM +0200, Greg KH wrote:
> > > > That feels like a big hack.  ppc doesn't have any "what arch am I
> > > > running on?" runtime call?  Did you ask on the ppc64 mailing list?  I'm
> > > > ok to take this for now, but odds are you need a better fix for this
> > > > sometime...
> > >
> > > That isn't the worst part of it.  The whole idea of checking what I'm
> > > running to set a dma mask just doesn't make any sense at all.
> >
> > Oded, I thought I asked if there was a dma call you should be making to
> > keep this type of check from being needed.  What happened to that?  As
> > Christoph points out, none of this should be needed, which is what I
> > thought I originally said :)
> >
> > thanks,
> >
> > greg k-h
>
> I'm sorry, but it seems I can't explain what's my problem because you
> and Christoph keep mentioning the pci_set_dma_mask() but it doesn't
> help me.
> I'll try again to explain.
>
> The main problem specifically for Goya device, is that I can't call
> this function with *the same parameter* for POWER9 and x86-64, because
> x86-64 supports dma mask of 48-bits while POWER9 supports only 32-bits
> or 64-bits.
>
> The main limitation in my Goya device is that it can generate PCI
> outbound transactions with addresses from 0 to (2^50 - 1).
> That's why when we first integrated it in x86-64, we used a DMA mask
> of 48-bits, by calling pci_set_dma_mask(pdev, 48). That way, the
> kernel ensures me that all the DMA addresses are from 0 to (2^48 - 1),
> and that address range is accessible by my device.
>
> If for some reason, the x86-64 machine doesn't support 48-bits, the
> standard fallback code in ALL the drivers I have seen is to set the
> DMA mask to 32-bits. And that's how my current driver's code is
> written.
>
> Now, when I tried to integrate Goya into a POWER9 machine, I got a
> reject from the call to pci_set_dma_mask(pdev, 48). The standard code,
> as I wrote above, is to call the same function with 32-bits. That
> works BUT it is not practical, as our applications require much more
> memory mapped then 32-bits. In addition, once you add more cards which
> are all mapped to the same range, it is simply not usable at all.
>
> Therefore, I consulted with POWER people and they told me I can call
> to pci_set_dma_mask with the mask as 64, but I must make sure that ALL
> outbound transactions from Goya will be with bit 59 set in the
> address.
> I can achieve that with a dedicated configuration I make in Goya's
> PCIe controller. That's what I did and that works.
>
> So, to summarize:
> If I call pci_set_dma_mask with 48, then it fails on POWER9. However,
> in runtime, I don't know if its POWER9 or not, so upon failure I will
> call it again with 32, which makes our device pretty much unusable.
> If I call pci_set_dma_mask with 64, and do the dedicated configuration
> in Goya's PCIe controller, then it won't work on x86-64, because bit
> 59 will be set and the host won't like it (I checked it). In addition,
> I might get addresses above 50 bits, which my device can't generate.
>
> I hope this makes things more clear. Now, please explain to me how I
> can call pci_set_dma_mask without any regard to whether I run on
> x86-64 or POWER9, considering what I wrote above ?
>
> Thanks,
> Oded

Adding ppc mailing list.

Oded
