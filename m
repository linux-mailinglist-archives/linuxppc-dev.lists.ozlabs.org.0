Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 421646FF1CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 14:49:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHBY40YjSz3fQR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 22:49:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=nMlylJqE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=nMlylJqE;
	dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHBX91Krcz3bT7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 22:48:24 +1000 (AEST)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DCEB43F54D
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 12:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1683809298;
	bh=ZkSgjZyo9xVh4gblsVQOCDmnEdqEfK/tJWBgTKA7lTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=nMlylJqE+NjtauI/vFU5ePvu8CCkAgsYY7a6PfeZeygWICEGHJkMxHcetKqdFyAzX
	 +IBVFEbNIjonmBaZLfzYd6uTIHe+8QizOz/qNSMx+9Ti+7YdkX33/SA36OlScTatRP
	 apxOZJOR8rcZABcFo8f6VQ9+wFOJJijGAexH/pEXY9uH2CDbfS9JFOjokv0cTcRHMh
	 yGzF5aVNuvdGaThgn+SmHEvqxrT7BDnsYWjryDXQUMdWWjNhq0/U+mJU1wlpma4xCS
	 yaRaqE5lDFpJnHrKrlPZ10NBL2ae7vnTaCSASZhMY1snWwk3viY8sHATijQrGiHbs1
	 efw0EUAHnVi+w==
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-64389a4487fso5076728b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 05:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683809297; x=1686401297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkSgjZyo9xVh4gblsVQOCDmnEdqEfK/tJWBgTKA7lTY=;
        b=TYFDhdWPcx0OFyeoZg/nhX2O6UIE6KWCWFA7PLn51EJvxxBebFOzaU4Y22BMHVZs9B
         NowjLRKDHEYvqh121C/z9dDPBwM6qtW4cLBYSb7np/jDVWxvVQpUuhHEuvnLytHt2K6h
         aj5Iq4TZS68yLeSdBcR/1PPswp3kwmqkxWBERScFS8jQeGPwFofo3AoejB658EWrUpys
         GiqL1dtStGssWZov8+jLfrjUl5qNrjd2Ydi0OY51LlAwvOjtW+H1YW7Gj5GKjZnMiezT
         KbBGjZE8/6ooRDsjTEWcbWGOlQIYnatMM3SHXtVn2JuMJ57DcvISM8YcCqIXI8rIexm+
         lc8g==
X-Gm-Message-State: AC+VfDyXH2g/wpC2FKaWfbkKrW+KdzU/rc0tUj/TyYn6NQCVUvtGyZOt
	ja+1mrgFgjcTTE8Fbg0XoA+/59zDVNl9WkhDG5flsxw8HcyeJWcoYQ/tYPlKDmkhh2s3+kWxckT
	o0z+pUpTBPtHl/4SEJDLS4sC3YTK10ctaxcHQy3KASyXede11mhEvQCdlrvk=
X-Received: by 2002:a05:6a20:3d84:b0:103:ce90:f3d2 with SMTP id s4-20020a056a203d8400b00103ce90f3d2mr2897378pzi.9.1683809297248;
        Thu, 11 May 2023 05:48:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7a5HjvgwmUzaFJhBxIy+pEBXHv6RWgm6O2IL/k7CBCtcM/768F9wF5Jd+uvw8d2kAoRH3ALgS/uKmLbD05/78=
X-Received: by 2002:a05:6a20:3d84:b0:103:ce90:f3d2 with SMTP id
 s4-20020a056a203d8400b00103ce90f3d2mr2897350pzi.9.1683809296857; Thu, 11 May
 2023 05:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230424055249.460381-1-kai.heng.feng@canonical.com> <20230505163714.000003a9@Huawei.com>
In-Reply-To: <20230505163714.000003a9@Huawei.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 11 May 2023 20:48:05 +0800
Message-ID: <CAAd53p63TspntTfVUq5cxNQUVnw_owvwn=Y1RJq67LSUDvxH8w@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] PCI/AER: Factor out interrupt toggling into helpers
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, linuxppc-dev@lists.ozlabs.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>, linux-pci@vger.kernel.org, bhelgaas@google.com, mika.westerberg@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 5, 2023 at 11:37=E2=80=AFPM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Mon, 24 Apr 2023 13:52:47 +0800
> Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>
> > There are many places that enable and disable AER interrput, so move
>
> interrupt

Thanks, will correct that in next revision.

Kai-Heng

>
> > them into helpers.
>
> Otherwise looks like a good clean up to me.
> FWIW
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> >
> > Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@lin=
ux.intel.com>
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> >  drivers/pci/pcie/aer.c | 45 +++++++++++++++++++++++++-----------------
> >  1 file changed, 27 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index f6c24ded134c..1420e1f27105 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -1227,6 +1227,28 @@ static irqreturn_t aer_irq(int irq, void *contex=
t)
> >       return IRQ_WAKE_THREAD;
> >  }
> >
> > +static void aer_enable_irq(struct pci_dev *pdev)
> > +{
> > +     int aer =3D pdev->aer_cap;
> > +     u32 reg32;
> > +
> > +     /* Enable Root Port's interrupt in response to error messages */
> > +     pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
> > +     reg32 |=3D ROOT_PORT_INTR_ON_MESG_MASK;
> > +     pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
> > +}
> > +
> > +static void aer_disable_irq(struct pci_dev *pdev)
> > +{
> > +     int aer =3D pdev->aer_cap;
> > +     u32 reg32;
> > +
> > +     /* Disable Root's interrupt in response to error messages */
> > +     pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
> > +     reg32 &=3D ~ROOT_PORT_INTR_ON_MESG_MASK;
> > +     pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
> > +}
> > +
> >  /**
> >   * aer_enable_rootport - enable Root Port's interrupts when receiving =
messages
> >   * @rpc: pointer to a Root Port data structure
> > @@ -1256,10 +1278,7 @@ static void aer_enable_rootport(struct aer_rpc *=
rpc)
> >       pci_read_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, &reg32);
> >       pci_write_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, reg32);
> >
> > -     /* Enable Root Port's interrupt in response to error messages */
> > -     pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
> > -     reg32 |=3D ROOT_PORT_INTR_ON_MESG_MASK;
> > -     pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
> > +     aer_enable_irq(pdev);
> >  }
> >
> >  /**
> > @@ -1274,10 +1293,7 @@ static void aer_disable_rootport(struct aer_rpc =
*rpc)
> >       int aer =3D pdev->aer_cap;
> >       u32 reg32;
> >
> > -     /* Disable Root's interrupt in response to error messages */
> > -     pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
> > -     reg32 &=3D ~ROOT_PORT_INTR_ON_MESG_MASK;
> > -     pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
> > +     aer_disable_irq(pdev);
> >
> >       /* Clear Root's error status reg */
> >       pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, &reg32);
> > @@ -1372,12 +1388,8 @@ static pci_ers_result_t aer_root_reset(struct pc=
i_dev *dev)
> >        */
> >       aer =3D root ? root->aer_cap : 0;
> >
> > -     if ((host->native_aer || pcie_ports_native) && aer) {
> > -             /* Disable Root's interrupt in response to error messages=
 */
> > -             pci_read_config_dword(root, aer + PCI_ERR_ROOT_COMMAND, &=
reg32);
> > -             reg32 &=3D ~ROOT_PORT_INTR_ON_MESG_MASK;
> > -             pci_write_config_dword(root, aer + PCI_ERR_ROOT_COMMAND, =
reg32);
> > -     }
> > +     if ((host->native_aer || pcie_ports_native) && aer)
> > +             aer_disable_irq(root);
> >
> >       if (type =3D=3D PCI_EXP_TYPE_RC_EC || type =3D=3D PCI_EXP_TYPE_RC=
_END) {
> >               rc =3D pcie_reset_flr(dev, PCI_RESET_DO_RESET);
> > @@ -1396,10 +1408,7 @@ static pci_ers_result_t aer_root_reset(struct pc=
i_dev *dev)
> >               pci_read_config_dword(root, aer + PCI_ERR_ROOT_STATUS, &r=
eg32);
> >               pci_write_config_dword(root, aer + PCI_ERR_ROOT_STATUS, r=
eg32);
> >
> > -             /* Enable Root Port's interrupt in response to error mess=
ages */
> > -             pci_read_config_dword(root, aer + PCI_ERR_ROOT_COMMAND, &=
reg32);
> > -             reg32 |=3D ROOT_PORT_INTR_ON_MESG_MASK;
> > -             pci_write_config_dword(root, aer + PCI_ERR_ROOT_COMMAND, =
reg32);
> > +             aer_enable_irq(root);
> >       }
> >
> >       return rc ? PCI_ERS_RESULT_DISCONNECT : PCI_ERS_RESULT_RECOVERED;
>
