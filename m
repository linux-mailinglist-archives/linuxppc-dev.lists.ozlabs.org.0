Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B40216EDB67
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 07:56:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5B8j3ynGz3chx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 15:56:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=FwuI9+xa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=FwuI9+xa;
	dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5B7n4xlvz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 15:56:04 +1000 (AEST)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 03D9541B3A
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 05:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1682402160;
	bh=Id7udfZYtH6BsDtkq+NCghDI2bVivdmoQ1W5SFhM1jY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=FwuI9+xaaXjniRQvF+TCmxJNQ4NmmJCUBUro61I29IM/z3Q4ahaVY6zUsgx0wRtIR
	 WUPpJfLamxm/qTWJCdq/BwSRm4JFEMktglE1rL71oK1M7p3Huieb+Lypj7lHsfPagV
	 a1n9JVInKLKBGK6yJC9bynyA7SzRz/pz6fiyCExjTULuzpugzf+JcG3khzd61unjHE
	 +oWnhQAR4ex4jfNNvzJHa+WKS5ua/f4gg+UQDU4Gmk52VsLTrSjxwBij6qN0i3Seki
	 G6Y5/6dEnqyL2a2z8j829Ye8FP4gYWh/ZGoQ3hQA9a5y3nDyR9XgdF4rFik/s1UO7P
	 l8VZMdZyzCTjQ==
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-247a0922a71so2894888a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Apr 2023 22:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682402158; x=1684994158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Id7udfZYtH6BsDtkq+NCghDI2bVivdmoQ1W5SFhM1jY=;
        b=ZiAyZlqQp5At35wX/k94eSBdlMBxci+eJI8UcNLHZ7Izvv5qKgUiwyG9Apd6yKFqYc
         Tsv2fVbUTEXvjtSpltZeZ1dBelQAarvSFarnxcl2ZiOG3dZmairwFyF5ASpmQD1T2Fvd
         m/LD6xo2AfOdPOYgXIbets4SVSGtXzbWcqyiTjmsVaN6hOXdMgA/upt26mGH4JS1m6Jc
         tcERQMM1HvIm1DJ6rtmtQPtZPZ2pn0V9n5JsmhOTWiZEz6rrJ+ew66+4+32GUx2+fF/6
         nZ8CFOB7ghCqEEtbXW6ZYwXgytTNE/aoFEwIwlzUosIazHoZXk19E86kfbLevhVn92Mm
         bYvA==
X-Gm-Message-State: AAQBX9dZPV4ZoVC2UhTMKwlUffzpHhItVbINTkDWJGArtprYiMzbpsso
	tiiMxIYaMN/S3e1X0H2kcoCyQcOZE5ocFvAF1TFIYQ7+Lx7XAD7HvK7Q9HLNth42MVEZNRVMlHW
	QWTPIJyHY73H3YMuPYzswhnJycOu16wJ22ZTgpsBqLjeL/5cFnkJiYhFwFyE=
X-Received: by 2002:a17:90a:db98:b0:23d:35c9:bf1c with SMTP id h24-20020a17090adb9800b0023d35c9bf1cmr16510982pjv.16.1682402158514;
        Mon, 24 Apr 2023 22:55:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350b7kWz5yV4oUWM1W5oTc7vK7mYHi9zee2bSsM2FXwzSHPKR9WAWiGE0RrYEySVLYX02QT2QH5IsznEqnW7pSFw=
X-Received: by 2002:a17:90a:db98:b0:23d:35c9:bf1c with SMTP id
 h24-20020a17090adb9800b0023d35c9bf1cmr16510969pjv.16.1682402158193; Mon, 24
 Apr 2023 22:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230424055249.460381-1-kai.heng.feng@canonical.com>
 <20230424055249.460381-2-kai.heng.feng@canonical.com> <97260e8b-1892-49a5-3792-0e3c28378fc0@linux.intel.com>
In-Reply-To: <97260e8b-1892-49a5-3792-0e3c28378fc0@linux.intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Tue, 25 Apr 2023 13:55:46 +0800
Message-ID: <CAAd53p5nrTQOxLkv+e9gLu3R9iOLXz5taJuwaAO4_W7_y89vEw@mail.gmail.com>
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

Yes. That's exactly what happened.

>
> It looks like it is harmless to disable the AER during the suspend/resume
> path. But, I am wondering why we get these errors? Did you check what err=
ors
> you get during the suspend/resume path? Are these errors valid?

I really don't know. I think it's similar to the reasoning in commit
b07461a8e45b ("PCI/AER: Clear error status registers during
enumeration and restore"): "AER errors might be recorded when
powering-on devices. These errors can be ignored, ...".
For this case, it happens when powering-off the device (D3cold) via
turning off power resources.

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
