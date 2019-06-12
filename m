Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F1741C4D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 08:37:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NxxN72pNzDr3P
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 16:37:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NxvX10KFzDqBg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 16:35:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="S9hscLxT"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45NxvW71sMz8t23
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 16:35:35 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45NxvW6PtYz9s9y; Wed, 12 Jun 2019 16:35:35 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="S9hscLxT"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45NxvW4vkYz9s7h
 for <linuxppc-dev@ozlabs.org>; Wed, 12 Jun 2019 16:35:35 +1000 (AEST)
Received: by mail-it1-x142.google.com with SMTP id m3so9052743itl.1
 for <linuxppc-dev@ozlabs.org>; Tue, 11 Jun 2019 23:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MHcvYWRnrXWxsWWs0BejJhNYWntQgPzwqsTyK3JVcEE=;
 b=S9hscLxT9U0oYcldK6EV5J/lbYqp/LZmLHawIS7nzJVR0hsF1YqVy150zNpRA9eZtS
 04C0Hbr1JbzSiOoaoXFWJijWoXICJeBvkpEM2EMr+QojWFDJ8UlLUaUSBOpD2z9Nlfgc
 F6zwaVjxQlFzllxXNlNlaICFHIf4OAVLxZbKKCgBXFSFsBKTRA1B1KYpGaN4woeCH091
 GNSM6lSXYFA+slAMAiohXpmR69HFHKhg/lxP3dP1h954Fc/oEsyat+AX0WldkvkU2u94
 81Otxa9+L7GosJ3ZF8B3x8fOUMRgxm3yuiWt+QNnp/cOpbigVendTpVFvhXldkxI+/D3
 x2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MHcvYWRnrXWxsWWs0BejJhNYWntQgPzwqsTyK3JVcEE=;
 b=UgecDOv0bvD33KzVu3oPkoyUFyQIW2B2rK4me5uF9Mn0I0AVVy5e4MWWdZXqMuQG+s
 i9YzMuvZK0P/MF5WNRU7ougNOJ4QwmbESNNZ68a2PWpQ8EPpDPOjLfXsmd/0xuc4/iEL
 gIeJdOJKuzZlHBf/FBhdZiQsi+uImyhUO2k+Dq7uYOPuTyo2hYj1Op5Q3zw9AKmH+1R6
 u075xyjGlu3gdCk/ZsUCcGigJoc4NEgifEQL0V4kMc919QoDWTSh2U+MS47DG52VD3gV
 58tUy7/dG3fLpOyG9bna5C3hPnmo68G8czxux5TCULP+3bWMZyn1cFPNSAQ5jntiYcHp
 1lpg==
X-Gm-Message-State: APjAAAVUcJXsHGucO+uAE8uKUIuXh9Ft9vbmG/Ue7aZpd4HpECDO/Rbh
 OVJgXQrmis5TFIjhKPusWPb0fSq4sOuRwYGXZ3w=
X-Google-Smtp-Source: APXvYqx16rAJnIPnPFPqqoZ7lmzh1vpi/yzIxiE9JzX1lPl2u7spnY33oJUFEHnBbB8dL05qV9YE/DbB9OoGggJpIo4=
X-Received: by 2002:a24:d145:: with SMTP id w66mr20513709itg.71.1560321333285; 
 Tue, 11 Jun 2019 23:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190611092144.11194-1-oded.gabbay@gmail.com>
 <20190611095857.GB24058@kroah.com>
 <20190611151753.GA11404@infradead.org> <20190611152655.GA3972@kroah.com>
 <CAFCwf13A73AxKzaa7Dk3tU-1NDgTFs4+xCO2os7SuSyUHZ9Z3Q@mail.gmail.com>
 <CAFCwf134nTD4FM_9Q+THQ7ZAZzGxhs15O6EheaRJMqM5wxi+aA@mail.gmail.com>
In-Reply-To: <CAFCwf134nTD4FM_9Q+THQ7ZAZzGxhs15O6EheaRJMqM5wxi+aA@mail.gmail.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 12 Jun 2019 16:35:22 +1000
Message-ID: <CAOSf1CE82uVVni638jkJJpQ7XLXX+HdD7xuB7Wv-f8mn=SBMeg@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] habanalabs: enable 64-bit DMA mask in POWER9
To: Oded Gabbay <oded.gabbay@gmail.com>
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
Cc: Christoph Hellwig <hch@infradead.org>, Greg KH <gregkh@linuxfoundation.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 12, 2019 at 3:25 AM Oded Gabbay <oded.gabbay@gmail.com> wrote:
>
> On Tue, Jun 11, 2019 at 8:03 PM Oded Gabbay <oded.gabbay@gmail.com> wrote:
> >
> > On Tue, Jun 11, 2019 at 6:26 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > *snip*
> >
> > Now, when I tried to integrate Goya into a POWER9 machine, I got a
> > reject from the call to pci_set_dma_mask(pdev, 48). The standard code,
> > as I wrote above, is to call the same function with 32-bits. That
> > works BUT it is not practical, as our applications require much more
> > memory mapped then 32-bits.

Setting a 48 bit DMA mask doesn't work today because we only allocate
IOMMU tables to cover the 0..2GB range of PCI bus addresses. Alexey
has some patches to expand that range so we can support devices that
can't hit the 64 bit bypass window. You need:

This fix: http://patchwork.ozlabs.org/patch/1113506/
This series: http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=110810

Give that a try and see if the IOMMU overhead is tolerable.

> >In addition, once you add more cards which
> > are all mapped to the same range, it is simply not usable at all.

Each IOMMU group should have a separate bus address space and seperate
cards shouldn't be in the same IOMMU group. If they are then there's
something up.

Oliver
