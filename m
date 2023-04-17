Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B346E46CE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 13:51:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0QPL6Q8Cz3f7r
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 21:51:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=IgahMDmI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=IgahMDmI;
	dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0QNN6Z04z3cFw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 21:50:27 +1000 (AEST)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 16F693F22B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 11:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1681732223;
	bh=6GYDRTm5i091Nsg8Us5E8SdBSSCh6NzIhoebfwUefD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=IgahMDmI2v/POHGj/X7gKk2fgviknFjsr8RSLsNooxNNiteND1O8zFY4wH/E1/jUB
	 CX0sSrAtgeH0+ik6GB0OOh7fVyXajxjNxuz5+FcUn4J/sD9Sym7q1MVzEli7Kj8JuA
	 6LupZE4KoJPcYufC+T9d6rgnkbycOEHytZn3mbS/Kh4TThmWAkGeZmuHxVBlwMtcpU
	 OBipkC6SlRTmHquxE99vR8myA5yVdlYeP0ZUnuE08o/TwCV3mtj0eNNaDpQrKQK1bS
	 0sXRoREMQyLyp4QGcAnj7xvdP/lJBuIwyiVX/dc5CsWJaV8NxQolyNdqv1yXX8LM/8
	 QC3zBal444PKQ==
Received: by mail-pj1-f69.google.com with SMTP id z18-20020a17090acb1200b00246eef2845aso5817117pjt.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 04:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681732221; x=1684324221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GYDRTm5i091Nsg8Us5E8SdBSSCh6NzIhoebfwUefD0=;
        b=JrJPPtN5nV8YFFfSRIjV5VmSEdZ6DTb+WyiXzq/gFnxCY64/izYxkmKcWGHVYKd826
         PZE7bz0iQKSJSb0PUouZb7bx1O8PeebkxU8is762/Es5zXhsUlATJ8piolDvBBALG/Oi
         W/7bqVwWu52mfcsIVg2+4M2BWosIHWsJ4vMRRhmzfTgxrBXxT87ItkN4rQ3/eIMtDcMk
         oqjk/H4talLu6enM8yU6lPlRAZp4dO2Rs9ZZmXbMb5aaA++nc7RF343kYK6KY0BHwcBC
         y5e6gmipjzq5qvysWXdEFYjdnEVYXPAW4suE8JmKeIj+GX5X2L7bv4SMu9+o9EHkAV+u
         OfEg==
X-Gm-Message-State: AAQBX9fnlD5Cevpvq7g0WDV8D37OOAoeDDI442349cfdAZzU2KpHZnJs
	Uf01MHHpiWM/99jrC+8mwSBRjiCvJUx2pd1TtDQN7vLGDj3tlc8NUDBEDwb1r7mgtuaSJexE0vK
	BrdEVoa6xqlzJXKyRS8N7QC3jslxqIj62/9lIj7RZmpjeY8fymLXovnVQG2k=
X-Received: by 2002:a17:90a:b00e:b0:247:2437:d5c4 with SMTP id x14-20020a17090ab00e00b002472437d5c4mr13489429pjq.13.1681732221393;
        Mon, 17 Apr 2023 04:50:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350bMHUJJluXpbTYJTU5g2d4iXGCmYsFbXGYmNAIPXStId8I4XBXBOXkL9aEbLgiYT/vEGd3M3KO/cmCBEgLV28M=
X-Received: by 2002:a17:90a:b00e:b0:247:2437:d5c4 with SMTP id
 x14-20020a17090ab00e00b002472437d5c4mr13489409pjq.13.1681732221055; Mon, 17
 Apr 2023 04:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220727013255.269815-2-kai.heng.feng@canonical.com> <20220928214557.GA1840266@bhelgaas>
In-Reply-To: <20220928214557.GA1840266@bhelgaas>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Mon, 17 Apr 2023 19:50:09 +0800
Message-ID: <CAAd53p7LFXSmBfLoz3i1C16x1oSJf99pVPuxTbj+tvxuKcNmPA@mail.gmail.com>
Subject: Re: [PATCH 2/3] PCI/AER: Disable AER service on suspend when IRQ is
 shared with PME
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, mika.westerberg@linux.intel.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 29, 2022 at 5:46=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Wed, Jul 27, 2022 at 09:32:51AM +0800, Kai-Heng Feng wrote:
> > PCIe service that shares IRQ with PME may cause spurious wakeup on
> > system suspend.
> >
> > PCIe Base Spec 5.0, section 5.2 "Link State Power Management" states
> > that TLP and DLLP transmission is disabled for a Link in L2/L3 Ready
> > (D3hot), L2 (D3cold with aux power) and L3 (D3cold), so we don't lose
> > much here to disable AER during system suspend.
> >
> > This is very similar to previous attempts to suspend AER and DPC [1],
> > but with a different reason.
> >
> > [1] https://lore.kernel.org/linux-pci/20220408153159.106741-1-kai.heng.=
feng@canonical.com/
> > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D216295
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> >  drivers/pci/pcie/aer.c | 23 ++++++++++++++++++++++-
> >  1 file changed, 22 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index 7952e5efd6cf3..60cc373754af2 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -1372,6 +1372,26 @@ static int aer_probe(struct pcie_device *dev)
> >       return 0;
> >  }
> >
> > +static int aer_suspend(struct pcie_device *dev)
> > +{
> > +     struct aer_rpc *rpc =3D get_service_data(dev);
> > +
> > +     if (dev->shared_pme_irq)
> > +             aer_disable_rootport(rpc);
>
> aer_disable_rootport() seems like it might be overkill.  IIUC, what
> we want to do here is disable AER interrupts, which should only
> require clearing ROOT_PORT_INTR_ON_MESG_MASK in PCI_ERR_ROOT_COMMAND.
>
> In addition to clearing ROOT_PORT_INTR_ON_MESG_MASK,
> aer_disable_rootport() traverses the whole hierarchy, clearing
> PCI_EXP_AER_FLAGS (CERE | NFERE | FERE | URRE) in PCI_EXP_DEVCTL.
> I don't think these DEVCTL bits control interrupt generation, so I
> don't know why we need to touch them.
>
> aer_disable_rootport() also clears PCI_ERR_ROOT_STATUS, which I think
> we should not do during suspend either.  We might want to clear it
> on resume (which we already do in pci_restore_state()), but I think
> generally we should preserve error information as long as it doesn't
> cause trouble.
>
> Your thoughts please :)

Sorry for the belated response.

Clearing ROOT_PORT_INTR_ON_MESG_MASK along to disable interrupt can
solve the issue too.
And I agree that the AER information should be preserved too.

Kai-Heng

>
> > +
> > +     return 0;
> > +}
> > +
> > +static int aer_resume(struct pcie_device *dev)
> > +{
> > +     struct aer_rpc *rpc =3D get_service_data(dev);
> > +
> > +     if (dev->shared_pme_irq)
> > +             aer_enable_rootport(rpc);
> > +
> > +     return 0;
> > +}
> > +
> >  /**
> >   * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
> >   * @dev: pointer to Root Port, RCEC, or RCiEP
> > @@ -1441,8 +1461,9 @@ static struct pcie_port_service_driver aerdriver =
=3D {
> >       .name           =3D "aer",
> >       .port_type      =3D PCIE_ANY_PORT,
> >       .service        =3D PCIE_PORT_SERVICE_AER,
> > -
> >       .probe          =3D aer_probe,
> > +     .suspend        =3D aer_suspend,
> > +     .resume         =3D aer_resume,
> >       .remove         =3D aer_remove,
> >  };
> >
> > --
> > 2.36.1
> >
