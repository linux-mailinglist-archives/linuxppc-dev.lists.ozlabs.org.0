Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F12CD6FF1D9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 14:50:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHBZ05tW9z3fNh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 22:50:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=QEUtbIV0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=QEUtbIV0;
	dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHBY75VM1z3fWh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 22:49:15 +1000 (AEST)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2A8593F4E0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 12:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1683809352;
	bh=ol2Z7aMVfchGYQa9rHq5vwmYfVHXB9l1MkpDsHEuF7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=QEUtbIV0YX35/fs8Q/M18Bn/ZJ9RpHRi+7vdXoC5xEg2hCwmhKeeu+0ET5W3fOuOd
	 iajYJcT9BHDVAwJgdzbbAiaDZVtZr5Hj9eoX/8qV/w4L4LKeML3Icw/sUe4Wr1IU8l
	 BZqcBkkgqQDGKrBfq58Hvk07HKFRihssiYYMMQz/Ym2a01GaH/gA4qh5e7NiW5giwP
	 o9pqE4nL41iWXNMO/FpyOFJ8uscLS3re7t9F99ce4iL+oYU5eHn7DM/L+w1BqZCfNa
	 XRzQHJT6y309ufPARgudrRZ2V1I/gmnq3SgXTzAf7xIBZGWWfHp1mYcEpoBJGjGFNz
	 618fljA7kYHOw==
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-51b7810ec2cso4537985a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 05:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683809351; x=1686401351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ol2Z7aMVfchGYQa9rHq5vwmYfVHXB9l1MkpDsHEuF7g=;
        b=BWVh/cAOAmUTmFMWShc4UuaFvqqoWoV9bW8zaNUDBIvByxKW8I6q2XcvAgpInZg+XL
         I3SH+LpaMmQJWDq5+K6zbw3YESIafwF5s18H3qrgbygnaoDBkkHWGpfM/aUUPFXHj3Kz
         au1DwQvq9Mb+6s0uTb5Ukje0e6sBW4crfz7Xx9zG60lXBFk1sqo8igYFMAyvoPk3acgr
         QlezCDOIxCZxWITUiWVlFycDbOCReueZMPCoPwn7JrR4l2i3q8DKyE9w29lDZTB9ZTs0
         lYGgnqyY50NCAOnRRPqOiaxryP41BVMPWU33bZaf5R+H9frPCNo+6tXON1M49Z0VFR/X
         NoZQ==
X-Gm-Message-State: AC+VfDyh2dgwtAHGKXC0aue9/Kmn3dBXU5bX4D9cLt4nfhJBKzd2kO6T
	WyWjBH68fg9/0YJzCNg9XziCv5P+MpbdvjVDRgljHSuH3WRLL0iH4R4/89Y7VTJqsoKL2lVHqM2
	pa75Ihq5dMlHL6FsqOLdfi+e7of9H9wD+ybuiLqzUU0A6T8+R5JPaz9Bki+M=
X-Received: by 2002:a05:6a20:8e04:b0:100:1583:f230 with SMTP id y4-20020a056a208e0400b001001583f230mr22433984pzj.53.1683809350850;
        Thu, 11 May 2023 05:49:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4O3tqxxukugzTWtunS2y3hSSJYIfQzWJ0EpAS43vCnCzWOri7iVs1hU9nKhzrLFBqWz843HwoBRtH1DQ2Yp8I=
X-Received: by 2002:a05:6a20:8e04:b0:100:1583:f230 with SMTP id
 y4-20020a056a208e0400b001001583f230mr22433964pzj.53.1683809350580; Thu, 11
 May 2023 05:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230424055249.460381-2-kai.heng.feng@canonical.com> <20230505192208.GA970992@bhelgaas>
In-Reply-To: <20230505192208.GA970992@bhelgaas>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 11 May 2023 20:48:59 +0800
Message-ID: <CAAd53p7FpSDh2nHYk1Tory3bvhKcmNQFYqC2GOM+jEyy0osceQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] PCI/AER: Disable AER interrupt on suspend
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, linuxppc-dev@lists.ozlabs.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>, linux-pci@vger.kernel.org, bhelgaas@google.com, mika.westerberg@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 6, 2023 at 3:22=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> On Mon, Apr 24, 2023 at 01:52:48PM +0800, Kai-Heng Feng wrote:
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
>
> What is the reason?  I assume it's something to do with the bugzilla
> below, but the commit log should outline the user-visible problem this
> fixes.  The commit log basically makes the case for "why should we
> merge this patch."
>
> I assume it's along the lines of "I tried to suspend this system, but
> it immediately woke up again because of an AER interrupt, and
> disabling AER during suspend avoids this problem.  And disabling
> the AER interrupt is not a problem because X"

Yes that's the reason :)
Will update the message to better reflect what's going on.

Kai-Heng

>
> > [1] https://lore.kernel.org/linux-pci/20220408153159.106741-1-kai.heng.=
feng@canonical.com/
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D216295
> >
> > Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
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
> > --
> > 2.34.1
> >
