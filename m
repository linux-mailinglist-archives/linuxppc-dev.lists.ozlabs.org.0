Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FE76FF301
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 15:35:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHCZS4LC7z3fYV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 23:35:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=Xg3006bx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=Xg3006bx;
	dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHCYd1z4Jz3fGY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 23:34:44 +1000 (AEST)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 82B243F54D
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 13:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1683812079;
	bh=011K5wvvIoIZK715UN1HjkgAo3VxiaK+uINHfyAtcqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Xg3006bxwcFF0VwLT5HTnNaBwVjOYROYUXaaKVgifm+ApNL1dSvIFi56ogQnYd9x8
	 JUMFSLkbX8ZLnpSmjijte6LeknNGD8fwsqtX4GMZ35Z9DTtfYAu3jNPq5iFnX9MaIH
	 RwWHzSBSl/JAtOpUtYz5EcmuLCSowa2IFBZTiealhw+lNYnjxU1CjVRz83Ev0tUWPU
	 +fy5nfdG7HqI6EU6RUihQtItgDXMHjct5+fGBPd2PWsCkHAERc+y5ixTLBv29p18eS
	 Gs8jYOh35ERt5m00Y/8LAjtrZGomBpl7qZiXcLVbyI3PISeHo3sFFr3Lxn/ZTNTA5o
	 MU51boXNiQwpQ==
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-24e5481a79fso4811638a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 06:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683812078; x=1686404078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=011K5wvvIoIZK715UN1HjkgAo3VxiaK+uINHfyAtcqg=;
        b=V9rRdaCB52WQ7qh9BW6i9aMvmWdjGoJ81UNyovKG7eyv99s/nIkdPP0Bk+p1PHHCJc
         Pj/+T+OoZ1C9LWUouGPx3zsb4j0kFE9RCoz30AStNDmhrCWoovR2kUi305XB+RO8qzGr
         7Du/+vVzuxCLoQ/gZ2joV0l1GV63vSaWlpCSWU6qyNFhtay0yrzX/9XN349B40Sol81e
         Duq2WmEMiWRENlqy5o5sXnIwdZPP7RFcho4aAPzk3YrTNElgTzpi6HvX3vkivpe7I0N3
         T2hKXUANajrHSQCFNHcY86RvBLlfH62IvRAg3xBm2KYApvyanJM5rcz9fs//ayT1pxze
         pJag==
X-Gm-Message-State: AC+VfDxJ7bN9HwR76DKAlJCFILjiQtNnHf+gIOsCAA5k6soryHgU/L+1
	X11jxwj0F/ZE5nuuPmE4YmBfgi9LAgU/H+xEyrafjGseUUZUuJnELakBUTGaPBi0jqnHJ2gTenc
	iA32wMyOFdjfJ4WSgAg8M38r6Z4ucKwSeWz7YkSGww40mf/5YnfVbnLRL3L8=
X-Received: by 2002:a17:90a:db4d:b0:250:8258:1a5 with SMTP id u13-20020a17090adb4d00b00250825801a5mr15729699pjx.33.1683812077995;
        Thu, 11 May 2023 06:34:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4PM1BwcYbS1lb5Q9CzUvOu/d5br84AluARyXzOfos8pADmP57XceNs9VQKShDZU3Dx3q9SP47ED8gQ1AomNMk=
X-Received: by 2002:a17:90a:db4d:b0:250:8258:1a5 with SMTP id
 u13-20020a17090adb4d00b00250825801a5mr15729681pjx.33.1683812077662; Thu, 11
 May 2023 06:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230424055249.460381-1-kai.heng.feng@canonical.com>
 <20230424055249.460381-2-kai.heng.feng@canonical.com> <97260e8b-1892-49a5-3792-0e3c28378fc0@linux.intel.com>
In-Reply-To: <97260e8b-1892-49a5-3792-0e3c28378fc0@linux.intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 11 May 2023 21:34:26 +0800
Message-ID: <CAAd53p5FUJpd2jENOo6YV8MhXdA1pZiO8G3Ho0x26=gL+vDAqw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] PCI/AER: Disable AER interrupt on suspend
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
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
Cc: mika.westerberg@linux.intel.com, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>, linux-pci@vger.kernel.org, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 25, 2023 at 7:47=E2=80=AFAM Sathyanarayanan Kuppuswamy
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>
>
>
> On 4/23/23 10:52 PM, Kai-Heng Feng wrote:
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
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D216295
> >
> > Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
>
> IIUC, you encounter AER errors during the suspend/resume process, which
> results in AER IRQ. Because AER and PME share an IRQ, it is regarded as a
> spurious wake-up IRQ. So to fix it, you want to disable AER reporting,
> right?
>
> It looks like it is harmless to disable the AER during the suspend/resume
> path. But, I am wondering why we get these errors? Did you check what err=
ors
> you get during the suspend/resume path? Are these errors valid?

AFAIK those errors comes from firmware/hardware side, especially when
the device gets put to D3hot/D3cold.

Kai-Heng

>
>
> >  drivers/pci/pcie/aer.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index 1420e1f27105..9c07fdbeb52d 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -1356,6 +1356,26 @@ static int aer_probe(struct pcie_device *dev)
> >       return 0;
> >  }
> >
> > +static int aer_suspend(struct pcie_device *dev)
> > +{
> > +     struct aer_rpc *rpc =3D get_service_data(dev);
> > +     struct pci_dev *pdev =3D rpc->rpd;
> > +
> > +     aer_disable_irq(pdev);
> > +
> > +     return 0;
> > +}
> > +
> > +static int aer_resume(struct pcie_device *dev)
> > +{
> > +     struct aer_rpc *rpc =3D get_service_data(dev);
> > +     struct pci_dev *pdev =3D rpc->rpd;
> > +
> > +     aer_enable_irq(pdev);
> > +
> > +     return 0;
> > +}
> > +
> >  /**
> >   * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
> >   * @dev: pointer to Root Port, RCEC, or RCiEP
> > @@ -1420,6 +1440,8 @@ static struct pcie_port_service_driver aerdriver =
=3D {
> >       .service        =3D PCIE_PORT_SERVICE_AER,
> >
> >       .probe          =3D aer_probe,
> > +     .suspend        =3D aer_suspend,
> > +     .resume         =3D aer_resume,
> >       .remove         =3D aer_remove,
> >  };
> >
>
> --
> Sathyanarayanan Kuppuswamy
> Linux Kernel Developer
