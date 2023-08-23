Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1958C784E7D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 04:03:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=mWZ7sH7s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVqHr06PTz3c4y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 12:03:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=mWZ7sH7s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=lists.ozlabs.org)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVqGx3Rmxz2xdn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 12:02:31 +1000 (AEST)
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id ABBFA3F214
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 02:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1692756147;
	bh=5DaKdBGMkxEbBMkn32LUjXYn/C5QI+ob7fnE+ftOKtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=mWZ7sH7sq5vmGaSwaCQc2yEVoRTuWG73unCOGK+iM37mE3fmfmuUrXJKIGiu9NeKy
	 2WLqSDQiTb5i9I1s2A8rpeJ6vMzBjQkObJndQBoISbpJRqSwsBzqcKsntPoigh4Ws1
	 BisyQXltOsAdf9PJPp4wqOuUUS5BXAYZCfqEpOyyPGGBjNLDfYMtjvd4ntDUwFeMEK
	 WGIaLDYrZ973XBDBJbb5b2JEoJKBjnCUSoI+Ck6bvtKSLg7VvN2Sujie9d7p+SWspZ
	 Yy004h98PKZRaSGgwDzMnGkyl0mTB2J5s2ODImdEyH+YEerd/cHlmZQWXcNqc4XZZq
	 Lt/lN04qSG8wA==
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-1c8c1f34aadso6513920fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 19:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692756146; x=1693360946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DaKdBGMkxEbBMkn32LUjXYn/C5QI+ob7fnE+ftOKtY=;
        b=j2jgSIG9d9kYs+CEmg2EuvUe6WQJ7LFJ14e/rnbvoWZGoZxDkRMai4hG5Wgpa3V8Qz
         MTNp59qQxMQ5cw54Z5EkOiW9UAmufa4Kz5tPHnyBW3hKZuA+7gwAprQPygsPYV8fXK1b
         NV2Qh02EOdkAXEhS1Of6x/bZhm73EFXNtw0zZ85KoqLHeXEhLPru1DVXoCnzwtaIyPDL
         aroV/vHiSnu+o3Ur3XJmiMCnc9t8LCIsq1ZGTPrxyCRhv4Z8g/Arp65VE/UvbevAITTD
         qJ1lnfyOY9lrkCYQVOObTBqUDSAuMMSKqt4R4hB/g8VAFFh0zSCO5ji1ioq5D3PyPzDv
         mUKg==
X-Gm-Message-State: AOJu0YyI3OCsr3OAoJTsMfLMLvKlUMLI+a0dEw6sQzHosTBOPEfufTvw
	rszc1+QHu129KQZtCxwB4Rlmmf6n5C/aH29IoKOVy0IZRIWAUs0hIzRsPwy1YVCC2S0htabH7Ho
	fHnu0jf8TUcCX4gqZJNmJK66AiUbCpyA06VpwFok1bcJrG2cYIe7fOQjEkuQ=
X-Received: by 2002:a05:6870:e889:b0:1b0:218b:8acc with SMTP id q9-20020a056870e88900b001b0218b8accmr16770340oan.7.1692756146423;
        Tue, 22 Aug 2023 19:02:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXE6jCLblN/l9DBja9Y85CLZ4DHKjKCGCejH4E5ZlU6AMZU76MDRddrpKkKh/GXqr9X9g8+ny5Ji1tce4Jjgg=
X-Received: by 2002:a05:6870:e889:b0:1b0:218b:8acc with SMTP id
 q9-20020a056870e88900b001b0218b8accmr16770311oan.7.1692756146087; Tue, 22 Aug
 2023 19:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAAd53p5QhaCA09G0BrhyDBXTKBbcgpXq0yAsj7PkG6wF8Qr=_w@mail.gmail.com>
 <20230810105116.GA22621@bhelgaas> <CAAd53p4W3Amee9dJN0usG=spHfg=s1KZM3cdJ_rJjCgDhEymAw@mail.gmail.com>
In-Reply-To: <CAAd53p4W3Amee9dJN0usG=spHfg=s1KZM3cdJ_rJjCgDhEymAw@mail.gmail.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 23 Aug 2023 10:02:13 +0800
Message-ID: <CAAd53p5Eqs9r6+ZGjPRpjmh5bJnPqJf=Kic7dyNS7KRKRCc9Rw@mail.gmail.com>
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

On Fri, Aug 11, 2023 at 4:00=E2=80=AFPM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> On Thu, Aug 10, 2023 at 6:51=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org=
> wrote:
> >
> > On Thu, Aug 10, 2023 at 04:17:21PM +0800, Kai-Heng Feng wrote:
> > > On Thu, Aug 10, 2023 at 2:52=E2=80=AFAM Bjorn Helgaas <helgaas@kernel=
.org> wrote:
> > > > On Fri, Jul 21, 2023 at 11:58:24AM +0800, Kai-Heng Feng wrote:
> > > > > On Tue, Jul 18, 2023 at 7:17=E2=80=AFPM Bjorn Helgaas <helgaas@ke=
rnel.org> wrote:
> > > > > > On Fri, May 12, 2023 at 08:00:13AM +0800, Kai-Heng Feng wrote:
> > > > > > > PCIe services that share an IRQ with PME, such as AER or DPC,
> > > > > > > may cause a spurious wakeup on system suspend. To prevent thi=
s,
> > > > > > > disable the AER interrupt notification during the system susp=
end
> > > > > > > process.
> > > > > >
> > > > > > I see that in this particular BZ dmesg log, PME, AER, and DPC d=
o share
> > > > > > the same IRQ, but I don't think this is true in general.
> > > > > >
> > > > > > Root Ports usually use MSI or MSI-X.  PME and hotplug events us=
e the
> > > > > > Interrupt Message Number in the PCIe Capability, but AER uses t=
he one
> > > > > > in the AER Root Error Status register, and DPC uses the one in =
the DPC
> > > > > > Capability register.  Those potentially correspond to three dis=
tinct
> > > > > > MSI/MSI-X vectors.
> > > > > >
> > > > > > I think this probably has nothing to do with the IRQ being *sha=
red*,
> > > > > > but just that putting the downstream component into D3cold, whe=
re the
> > > > > > link state is L3, may cause the upstream component to log and s=
ignal a
> > > > > > link-related error as the link goes completely down.
> > > > >
> > > > > That's quite likely a better explanation than my wording.
> > > > > Assuming AER IRQ and PME IRQ are not shared, does system get woke=
n up
> > > > > by AER IRQ?
> > > >
> > > > Rafael could answer this better than I can, but
> > > > Documentation/power/suspend-and-interrupts.rst says device interrup=
ts
> > > > are generally disabled during suspend after the "late" phase of
> > > > suspending devices, i.e.,
> > > >
> > > >   dpm_suspend_noirq
> > > >     suspend_device_irqs           <-- disable non-wakeup IRQs
> > > >     dpm_noirq_suspend_devices
> > > >       ...
> > > >         pci_pm_suspend_noirq      # (I assume)
> > > >           pci_prepare_to_sleep
> > > >
> > > > I think the downstream component would be put in D3cold by
> > > > pci_prepare_to_sleep(), so non-wakeup interrupts should be disabled=
 by
> > > > then.
> > > >
> > > > I assume PME would generally *not* be disabled since it's needed fo=
r
> > > > wakeup, so I think any interrupt that shares the PME IRQ and occurs
> > > > during suspend may cause a spurious wakeup.
> > >
> > > Yes, that's the case here.
> > >
> > > > If so, it's exactly as you said at the beginning: AER/DPC/etc shari=
ng
> > > > the PME IRQ may cause spurious wakeups, and we would have to disabl=
e
> > > > those other interrupts at the source, e.g., by clearing
> > > > PCI_ERR_ROOT_CMD_FATAL_EN etc (exactly as your series does).
> > >
> > > So is the series good to be merged now?
> >
> > If we merge as-is, won't we disable AER & DPC interrupts unnecessarily
> > in the case where the link goes to D3hot?  In that case, there's no
> > reason to expect interrupts related to the link going down, but things
> > like PTM messages still work, and they may cause errors that we should
> > know about.
>
> Because the issue can be observed on D3hot as well [0].
> The root port device [0] is power managed by ACPI, so I wonder if it's
> reasonable to disable AER & DPC for devices that power managed by
> firmware?

OK, I think the D3hot case is different to this one, so I'll work on
next revision that only disable AER/DPC when power is really off.

In additional to disabling interrupt, is it reasonable to disable AER
and DPC service completely, so unwanted electric noise wont trigger a
DPC reset?

Kai-Heng

> [0] https://bugzilla.kernel.org/show_bug.cgi?id=3D216295#c3
>
> Kai-Heng
>
> >
> > > > > > I don't think D0-D3hot should be relevant here because in all t=
hose
> > > > > > states, the link should be active because the downstream config=
 space
> > > > > > remains accessible.  So I'm not sure if it's possible, but I wo=
nder if
> > > > > > there's a more targeted place we could do this, e.g., in the pa=
th that
> > > > > > puts downstream devices in D3cold.
> > > > >
> > > > > Let me try to work on this.
> > > > >
> > > > > Kai-Heng
> > > > >
> > > > > >
> > > > > > > As Per PCIe Base Spec 5.0, section 5.2, titled "Link State Po=
wer Management",
> > > > > > > TLP and DLLP transmission are disabled for a Link in L2/L3 Re=
ady (D3hot), L2
> > > > > > > (D3cold with aux power) and L3 (D3cold) states. So disabling =
the AER
> > > > > > > notification during suspend and re-enabling them during the r=
esume process
> > > > > > > should not affect the basic functionality.
> > > > > > >
> > > > > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D216295
> > > > > > > Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com=
>
> > > > > > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > > > > > ---
> > > > > > > v6:
> > > > > > > v5:
> > > > > > >  - Wording.
> > > > > > >
> > > > > > > v4:
> > > > > > > v3:
> > > > > > >  - No change.
> > > > > > >
> > > > > > > v2:
> > > > > > >  - Only disable AER IRQ.
> > > > > > >  - No more check on PME IRQ#.
> > > > > > >  - Use helper.
> > > > > > >
> > > > > > >  drivers/pci/pcie/aer.c | 22 ++++++++++++++++++++++
> > > > > > >  1 file changed, 22 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > > > > > > index 1420e1f27105..9c07fdbeb52d 100644
> > > > > > > --- a/drivers/pci/pcie/aer.c
> > > > > > > +++ b/drivers/pci/pcie/aer.c
> > > > > > > @@ -1356,6 +1356,26 @@ static int aer_probe(struct pcie_devic=
e *dev)
> > > > > > >       return 0;
> > > > > > >  }
> > > > > > >
> > > > > > > +static int aer_suspend(struct pcie_device *dev)
> > > > > > > +{
> > > > > > > +     struct aer_rpc *rpc =3D get_service_data(dev);
> > > > > > > +     struct pci_dev *pdev =3D rpc->rpd;
> > > > > > > +
> > > > > > > +     aer_disable_irq(pdev);
> > > > > > > +
> > > > > > > +     return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int aer_resume(struct pcie_device *dev)
> > > > > > > +{
> > > > > > > +     struct aer_rpc *rpc =3D get_service_data(dev);
> > > > > > > +     struct pci_dev *pdev =3D rpc->rpd;
> > > > > > > +
> > > > > > > +     aer_enable_irq(pdev);
> > > > > > > +
> > > > > > > +     return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > >  /**
> > > > > > >   * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiE=
P
> > > > > > >   * @dev: pointer to Root Port, RCEC, or RCiEP
> > > > > > > @@ -1420,6 +1440,8 @@ static struct pcie_port_service_driver =
aerdriver =3D {
> > > > > > >       .service        =3D PCIE_PORT_SERVICE_AER,
> > > > > > >
> > > > > > >       .probe          =3D aer_probe,
> > > > > > > +     .suspend        =3D aer_suspend,
> > > > > > > +     .resume         =3D aer_resume,
> > > > > > >       .remove         =3D aer_remove,
> > > > > > >  };
> > > > > > >
> > > > > > > --
> > > > > > > 2.34.1
> > > > > > >
