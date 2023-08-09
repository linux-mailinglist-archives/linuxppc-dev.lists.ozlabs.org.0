Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A14775235
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 07:28:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=uadb1klP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLJWF6vzyz30gP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 15:28:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=uadb1klP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=lists.ozlabs.org)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLJVJ09kdz2yVW
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Aug 2023 15:27:50 +1000 (AEST)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EE64C423F2
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Aug 2023 05:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1691558864;
	bh=peTqRYjSDavpbcFsnXWNHqx4GHBTnLZGnwi7ZOE5E/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=uadb1klPfTxl3hv0XbAjf+Xq5DsWvzKyZSrBS/mhiQRvcbdq/wiPmxFWWX+0683Pe
	 1YVWENWT53EJ3ZsyEEh00I/r/hXryL7N8x9LKWKQFnSH5hw2NIrwFwBcXUJXJuIuSz
	 N3deL8clrebDzP5DvZVKRoeeVe+SDmvI4ItraixyLDoS2oWWpw1XcJopGXiohNaXWi
	 FHiy1SXJ+lXtGSU2Tee+MuiQ2pRP/hvUjKwLxGBhtdTxHE7avFgevVPDS/pACwyxe0
	 IDdFDAsG/4cXRH/wxJFpfp5/Cwy+6qeDNCR6YGkjeNe8SsWnAGOIjb2eGnR8P+1JS4
	 we+Qyt50T7c0w==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-40b52fc51b5so82907531cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Aug 2023 22:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691558863; x=1692163663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peTqRYjSDavpbcFsnXWNHqx4GHBTnLZGnwi7ZOE5E/E=;
        b=MM1M9VsyJUgMYozgvyUA91hR6hu7s3kuR0I9zVkuMD+TJbR4NmIo7Gk8b8r38UqAfd
         wUEnMUR4Pvs45aWAgNTIZt8aAkpUm4nEC/hkMkLwgHVLV2Gf921WJU5Pr1SW59OCMT4e
         qn7zsQy4PSZqdmExczOUJ+6JLMwYd9R12WnB7f94b4fGXlNPOtHtKBQw21osmONStOr3
         QmCw9Ttti/+SHxgM3O2m/VHreegOr/Knha7VrhbEOwsAZ/GsYTVh+eTEZzMLTz7d9lMz
         Eutmq8IaoaMgWR75tSMRtpbIw/jnGcsTqiOmTbi29wqnlhFEFCcxtALgzePQdUqEndq8
         adgA==
X-Gm-Message-State: AOJu0Yz5IGdiETBAHuB+r8hFMJHsdmSSeprzf4qE159RRYxQ7rnd6/95
	wo4tAPGQ3/QFOcWw559kJQY0GRfkCEgUrnJGzJPmCwPcnpkqQI/vRGvUnhSXaDSUaNWdJ16MR+a
	DL8WdBDb4oRRiJC6bQtK9IVt56eg8EcTRZlmr643npKtXil0ZTQKqn4tgDsA=
X-Received: by 2002:a05:622a:11c1:b0:3fb:42cb:aa9 with SMTP id n1-20020a05622a11c100b003fb42cb0aa9mr2718325qtk.45.1691558863718;
        Tue, 08 Aug 2023 22:27:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9g/gnVBCzUhuSlDB+/aiLzLLlM41Q7Jkfkb1MkwSdlek2Jh+LrgosRiAQ7l1kU79JzGuecMBwAu2knwmTAj8=
X-Received: by 2002:a05:622a:11c1:b0:3fb:42cb:aa9 with SMTP id
 n1-20020a05622a11c100b003fb42cb0aa9mr2718308qtk.45.1691558863469; Tue, 08 Aug
 2023 22:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230512000014.118942-2-kai.heng.feng@canonical.com>
 <20230718111702.GA354713@bhelgaas> <CAAd53p7RfVcZjw+ShtkTmhCAA4zpegRZOzwiXgmanthx_KMjxA@mail.gmail.com>
In-Reply-To: <CAAd53p7RfVcZjw+ShtkTmhCAA4zpegRZOzwiXgmanthx_KMjxA@mail.gmail.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 9 Aug 2023 13:27:31 +0800
Message-ID: <CAAd53p5WkzydfLAkMa6Dgt5vS0w5FHATfoDj3f=YkK-hPgJ+vQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] PCI/AER: Disable AER interrupt on suspend
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, mika.westerberg@linux.intel.com, linux-pci@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 21, 2023 at 11:58=E2=80=AFAM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> On Tue, Jul 18, 2023 at 7:17=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org=
> wrote:
> >
> > [+cc Rafael]
> >
> > On Fri, May 12, 2023 at 08:00:13AM +0800, Kai-Heng Feng wrote:
> > > PCIe services that share an IRQ with PME, such as AER or DPC, may cau=
se a
> > > spurious wakeup on system suspend. To prevent this, disable the AER i=
nterrupt
> > > notification during the system suspend process.
> >
> > I see that in this particular BZ dmesg log, PME, AER, and DPC do share
> > the same IRQ, but I don't think this is true in general.
> >
> > Root Ports usually use MSI or MSI-X.  PME and hotplug events use the
> > Interrupt Message Number in the PCIe Capability, but AER uses the one
> > in the AER Root Error Status register, and DPC uses the one in the DPC
> > Capability register.  Those potentially correspond to three distinct
> > MSI/MSI-X vectors.
> >
> > I think this probably has nothing to do with the IRQ being *shared*,
> > but just that putting the downstream component into D3cold, where the
> > link state is L3, may cause the upstream component to log and signal a
> > link-related error as the link goes completely down.
>
> That's quite likely a better explanation than my wording.
> Assuming AER IRQ and PME IRQ are not shared, does system get woken up
> by AER IRQ?
>
> >
> > I don't think D0-D3hot should be relevant here because in all those
> > states, the link should be active because the downstream config space
> > remains accessible.  So I'm not sure if it's possible, but I wonder if
> > there's a more targeted place we could do this, e.g., in the path that
> > puts downstream devices in D3cold.
>
> Let me try to work on this.

We are seeing another case where the issue happens on D3hot [0].
So I wonder if it's possible to disable AER unconditionally?

[0] https://bugzilla.kernel.org/show_bug.cgi?id=3D216295#c3

>
> Kai-Heng
>
> >
> > > As Per PCIe Base Spec 5.0, section 5.2, titled "Link State Power Mana=
gement",
> > > TLP and DLLP transmission are disabled for a Link in L2/L3 Ready (D3h=
ot), L2
> > > (D3cold with aux power) and L3 (D3cold) states. So disabling the AER
> > > notification during suspend and re-enabling them during the resume pr=
ocess
> > > should not affect the basic functionality.
> > >
> > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D216295
> > > Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > ---
> > > v6:
> > > v5:
> > >  - Wording.
> > >
> > > v4:
> > > v3:
> > >  - No change.
> > >
> > > v2:
> > >  - Only disable AER IRQ.
> > >  - No more check on PME IRQ#.
> > >  - Use helper.
> > >
> > >  drivers/pci/pcie/aer.c | 22 ++++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > >
> > > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > > index 1420e1f27105..9c07fdbeb52d 100644
> > > --- a/drivers/pci/pcie/aer.c
> > > +++ b/drivers/pci/pcie/aer.c
> > > @@ -1356,6 +1356,26 @@ static int aer_probe(struct pcie_device *dev)
> > >       return 0;
> > >  }
> > >
> > > +static int aer_suspend(struct pcie_device *dev)
> > > +{
> > > +     struct aer_rpc *rpc =3D get_service_data(dev);
> > > +     struct pci_dev *pdev =3D rpc->rpd;
> > > +
> > > +     aer_disable_irq(pdev);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int aer_resume(struct pcie_device *dev)
> > > +{
> > > +     struct aer_rpc *rpc =3D get_service_data(dev);
> > > +     struct pci_dev *pdev =3D rpc->rpd;
> > > +
> > > +     aer_enable_irq(pdev);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  /**
> > >   * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
> > >   * @dev: pointer to Root Port, RCEC, or RCiEP
> > > @@ -1420,6 +1440,8 @@ static struct pcie_port_service_driver aerdrive=
r =3D {
> > >       .service        =3D PCIE_PORT_SERVICE_AER,
> > >
> > >       .probe          =3D aer_probe,
> > > +     .suspend        =3D aer_suspend,
> > > +     .resume         =3D aer_resume,
> > >       .remove         =3D aer_remove,
> > >  };
> > >
> > > --
> > > 2.34.1
> > >
