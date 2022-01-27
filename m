Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C51A949D802
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 03:23:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkksR4K2cz3cQs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 13:23:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=kWBuUG85;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=kWBuUG85; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jkkrn04lpz2ygC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 13:22:49 +1100 (AEDT)
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AB93E3F1C4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 02:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643250166;
 bh=VON/Z/8bdlNSxKg/CZYPTOSTIKu2Vz6VcrvLtb84DlU=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=kWBuUG85n4C1kfpET1aN1OED57lL3fZy9kIorWk4tssmYP2PGX0677Gd7seR1GQ4l
 eX8z7KNajU2HJ1nbsLm91exT5GD3YTFH0s4xu+Kbgy/dm7xbwFuwiGtogXuGZwfpIJ
 HOMZwnhBa1Mag+jXGUd8fXY5ZuSHChmZkh9Go6mSCuU3p8BEkHjb4v3cgTLv16qv/i
 OmNWsui8V/u8RJvEHjDBFoC8XmblGvIMG1awteWbWGJbbpTyWdSvAACpe79bN5MZQN
 CjpIaS4nPTDeu7AFPF13UWQQI2W0sxWdvLgZc8sOta3ZA8gLHwBYCftHwlJNCYYSBa
 zOfY+fctlwK5w==
Received: by mail-oo1-f72.google.com with SMTP id
 g2-20020a4a9242000000b002da7c459222so831123ooh.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 18:22:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VON/Z/8bdlNSxKg/CZYPTOSTIKu2Vz6VcrvLtb84DlU=;
 b=uz/cCSwp+2RMRikNPAGwwM3B/qmtnC3GntY1ufwgsc3qK59bh+q7dgryLyL/6RltU/
 J0QzL9ScataDbJIgYOmwYPQsu0eqqYMgyjtw3usg2q+4sBmqNVnpt4qU2ld8BVBev63B
 CG4/rekc7BJTfWx53giWprhCxA1nzOAluXDZGdJ8Wp+y2uMWcYmaTIb9ao8i86jLS7wr
 A/MEBAVoyzSoIKDnrJc2WbhGoRNbPoyItY1UoxohEZm+xDM03UIuoIJ6y1VbYZpSkKZO
 gJ+XuhANEmWxWFMpTBiefcxnqvHpddQMx4Jc/hoJ0aPBGnytwZX2bZcDZl7YMZXL7kTs
 MC9A==
X-Gm-Message-State: AOAM533B3yDZLZa4SuKlHVgjQXAZiD/r6XER2KtSiKJ1eKSPHn9b8H5h
 MPULo7M+Wi5GcKwYB3lxPALICeYSi6NOPP6H+n02znYln3YRJfnl9jynck5mYh2lFL4GZTHZWcL
 uqi7+W39R4f+1zWSyUqzrtJk+77o5HSuh8f+MHU5UeSNQf6uxEAx8Zx1dYqk=
X-Received: by 2002:a05:6808:2087:: with SMTP id
 s7mr5179148oiw.21.1643250165677; 
 Wed, 26 Jan 2022 18:22:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwB+navU6gtFzHTGoJm+x+kCowK7+ulSkHm17hHbA227DyBZQFEB15yNQThEkQXUYewsy/No5viewb7ncXSxF0=
X-Received: by 2002:a05:6808:2087:: with SMTP id
 s7mr5179138oiw.21.1643250165478; 
 Wed, 26 Jan 2022 18:22:45 -0800 (PST)
MIME-Version: 1.0
References: <20220126071853.1940111-1-kai.heng.feng@canonical.com>
 <20220126071853.1940111-2-kai.heng.feng@canonical.com>
 <YfEsC94BvFwd5MLy@lahna>
In-Reply-To: <YfEsC94BvFwd5MLy@lahna>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 27 Jan 2022 10:22:34 +0800
Message-ID: <CAAd53p7wPZj0DTxkfoBhhhbaGWvpU4MTbJAGGNXvAjG3qw9b9Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] PCI/DPC: Disable DPC when link is in L2/L3 ready, L2
 and L3 state
To: Mika Westerberg <mika.westerberg@linux.intel.com>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>,
 bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 26, 2022 at 7:10 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Wed, Jan 26, 2022 at 03:18:52PM +0800, Kai-Heng Feng wrote:
> > Since TLP and DLLP transmission is disabled for a Link in L2/L3 Ready,
> > L2 and L3, and DPC depends on AER, so also disable DPC here.
>
> Here too I think it is good to mention that the DPC "service" never
> implemented the PM hooks in the first place

Will amend the commit message a bit.

>
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>
> One minor comment below, but other than that looks good,
>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>
> > ---
> >  drivers/pci/pcie/dpc.c | 61 +++++++++++++++++++++++++++++++-----------
> >  1 file changed, 45 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> > index 3e9afee02e8d1..9585c10b7c577 100644
> > --- a/drivers/pci/pcie/dpc.c
> > +++ b/drivers/pci/pcie/dpc.c
> > @@ -343,13 +343,34 @@ void pci_dpc_init(struct pci_dev *pdev)
> >       }
> >  }
> >
> > +static void dpc_enable(struct pcie_device *dev)
> > +{
> > +     struct pci_dev *pdev = dev->port;
> > +     u16 ctl;
> > +
> > +     pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
> > +
>
> Drop the empty line here.

OK, will do.

Kai-Heng

>
> > +     ctl = (ctl & 0xfff4) | PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN;
> > +     pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);
> > +}
> > +
> > +static void dpc_disable(struct pcie_device *dev)
> > +{
> > +     struct pci_dev *pdev = dev->port;
> > +     u16 ctl;
> > +
> > +     pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
> > +     ctl &= ~(PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN);
> > +     pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);
> > +}
