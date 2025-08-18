Return-Path: <linuxppc-dev+bounces-11110-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3F5B2B48E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 01:18:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5TCh0cV6z3cjf;
	Tue, 19 Aug 2025 09:18:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755559088;
	cv=none; b=H1swm86O4bNsa+nAzpV6MnsoYs7PEYOjJN95GaiyeBz3xh1rVgE/Wryud2kp+y0hVKfJsmv7+YHvFCh6xU6SDTWO7V5kDl+IPUhZPlgElpt4GEaPuhpTIlesZJyo5d8uje866+1dCJl8A1EsT8HKmCNPDxoV/mvUyzm6PZL3BCxXtNDypLJAkbGhRG0dBsVbEGNN7JZS1V81BH/M0PQbiE6tBRdVmDE1/RCLBJwjtL8Nl+bgNHn7gcx4M/0qlBKP4b90HSZwf84vcxfYWGPQ0Myju4rkwX2nmyI23OMu9mkvq0nyDwNcQfqCFrBfa46UswR1Pn1fN0ypVLtZLC75/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755559088; c=relaxed/relaxed;
	bh=1b+2mp/yigIIHVfdgVDB2QpdrFZcohdIV7tToHX2gNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKziBTHlhLBgIoqkgLj1joNDVy59GGEv1yaTNf5AZGtOx5RZGEq1GHKG2wJFYNa3nA5smZZgayd+I89YXV9N/ZFhjGEhKDp2yQdGzrKkmq0vwC/CMMzsIRcXS9OGqN40CDgT08KffU70DZgkLtZMC++wLkxB3oXxv2Ie+rIqlH4dDsLp0bqScldm2x5zS8JFpbhJ98d3lXW7zPhezwJn5d5iMZ9E183ok8uD+hoMMjGuWdaQ2+aLNeyg8p1Mp/JqUnY2fBwmJf3jI7xF+XMlpu5k/CWlwapZ6VK+//oHrNQfQMMKuhTn3F+0wdQW6vPVNq55E17/xIyNQLPaiE7vgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PHNbabON; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com; envelope-from=linasvepstas@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PHNbabON;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com; envelope-from=linasvepstas@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5TCf3vhVz3cft
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 09:18:05 +1000 (AEST)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-74381fbc6e3so1999176a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 16:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755559083; x=1756163883; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1b+2mp/yigIIHVfdgVDB2QpdrFZcohdIV7tToHX2gNY=;
        b=PHNbabONmkAD5DkcDAH2JV8g5ThZLfKDAkcSALqZnZ5KTcGvDLzksxZnTPOFyNcaS0
         ynO+g3gblLd+WYFGeT8pak+VjxWGMpB1ok4CvtMfewQ/GQ7himb2+cOSi7QgXKIbJ0s8
         aJsQTdUt9/FUn8nV16fDMJT9Y1k92xvwYM07WvqWSXQ9V5BzRIUQk4GWeCA2Nu+6GkdE
         d32rSMU8xxbNIEdkWPnfTyBCnsH/1VsHb0x3gD00Qx+B8mIkH/F738i7VjEuNshlCgEQ
         JXWSTLABiu5r0pwki/rHeG2seZnKYvD7wB5XCv5m0p7Dd9IGgHDkroBmnyFiL4spJ83B
         lTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755559083; x=1756163883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1b+2mp/yigIIHVfdgVDB2QpdrFZcohdIV7tToHX2gNY=;
        b=O5pRmifrLsEbh2X/qjXkDYBeqFH4Z6pLhF7tAvx1rS+np8P9XGKnsY2h6ihMFaWBtE
         rb0G5HVelYEVLUJ4KKYOYDbOJeqJtXJCl7I22E5ca1IyAmLjrOob1SgTJ82qkAAx619m
         EIANDp7VYqRt1ZJOWyrcciJ8u7zel7ZARrBL/IqjfYzV5ayNHUeUgTqMl1KfND4QoUep
         bn4KwqFBF7T2tWMPe48vS2ZLGuF667LUp8S8rTFySqsgHzrbOZt/aIsG7L5ZyyCX3fgV
         nY+ODTkncdYwFQ+j7oBu0CrJh6FQxhs2plgKBeHHDyV432mOzHg7ceZs59F3nSvNCwU3
         pQ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUppNKwimGlWCY8H0MDpdsvknBvu423X/tb6uP14zQ9iHP03LRmyyEJpauGt/giqGVIuwpDIZ2Su0ftmVo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwazcBuMyzD7zUY7LytA3Qbh0coFbS8kCsgFpR2gqrzlc1YJKum
	mThN0IW0gxUhSDYF5MF5J3KdvjruDo5/EUnR/WcB+JoHAwXsMCDAJbvicOezLMwZQnvhVKqyE+p
	PVitKd2YQiEcuYBUU+klcSAoAMB5I3os=
X-Gm-Gg: ASbGncsx6FpttiCDyw/IoOu/idx4WpJZBnjzeni7kYAaH+IaAphZO+Iy9j5yU5BrPvm
	itPgYAyHPB54gOidTkCrHtSpzDbGsyt+3euCpouiZ+VqFD9G9EdHx98ZxoFV/I7irhi0wCc0/Iz
	53XxMk7WUlBbMC88ivfkVDHytBDLjxI/LUKZ4F0yjj7S5seI3nudIcbiKM6S3FRe6Zi/ew0MkhV
	4EBCA2VsX8K4OFX
X-Google-Smtp-Source: AGHT+IGRJXLntANEfq69fBWLU4IJo5Sovp0hsSpwPWXOm4Y8/hfOeFbowvnUWBRIYgeHJZFRZ4J33wlV1SVvt6TELAY=
X-Received: by 2002:a05:6808:3c44:b0:435:f7a2:8ff with SMTP id
 5614622812f47-436cdc938f8mr381698b6e.12.1755559082607; Mon, 18 Aug 2025
 16:18:02 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1755008151.git.lukas@wunner.de> <28fd805043bb57af390168d05abb30898cf4fc58.1755008151.git.lukas@wunner.de>
 <7c545fff40629b612267501c0c74bc40c3df29e2.camel@linux.ibm.com>
In-Reply-To: <7c545fff40629b612267501c0c74bc40c3df29e2.camel@linux.ibm.com>
Reply-To: linasvepstas@gmail.com
From: Linas Vepstas <linasvepstas@gmail.com>
Date: Mon, 18 Aug 2025 18:17:49 -0500
X-Gm-Features: Ac12FXwvCNef1lGTrHQMtgrxrH734r9DdIijklrZKJzvHuzfvTB-RsjbXGpXUJU
Message-ID: <CAHrUA37+0UBYDNzwsU1p8xYCpRypt_e_=ASC2e5QxT1z+D=YJQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] PCI/AER: Allow drivers to opt in to Bus Reset on
 Non-Fatal Errors
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <helgaas@kernel.org>, 
	Riana Tauro <riana.tauro@intel.com>, 
	Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, 
	"Sean C. Dardis" <sean.c.dardis@intel.com>, Terry Bowman <terry.bowman@amd.com>, 
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver OHalloran <oohall@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 14, 2025 at 2:56=E2=80=AFAM Niklas Schnelle <schnelle@linux.ibm=
.com> wrote:
>
> On Wed, 2025-08-13 at 07:11 +0200, Lukas Wunner wrote:
> > When Advanced Error Reporting was introduced in September 2006 by commi=
t
> > 6c2b374d7485 ("PCI-Express AER implemetation: AER core and aerdriver"),=
 it
> > sought to adhere to the recovery flow and callbacks specified in
> > Documentation/PCI/pci-error-recovery.rst.
> >
> --- snip ---
> > Signed-off-by: Lukas Wunner <lukas@wunner.de>
> > ---
> >  drivers/pci/pcie/err.c | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> > index de6381c690f5..e795e5ae6b03 100644
> > --- a/drivers/pci/pcie/err.c
> > +++ b/drivers/pci/pcie/err.c
> > @@ -217,15 +217,10 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev =
*dev,
> >       pci_walk_bridge(bridge, pci_pm_runtime_get_sync, NULL);
> >
> >       pci_dbg(bridge, "broadcast error_detected message\n");
> > -     if (state =3D=3D pci_channel_io_frozen) {
> > +     if (state =3D=3D pci_channel_io_frozen)
> >               pci_walk_bridge(bridge, report_frozen_detected, &status);
> > -             if (reset_subordinates(bridge) !=3D PCI_ERS_RESULT_RECOVE=
RED) {
> > -                     pci_warn(bridge, "subordinate device reset failed=
\n");
> > -                     goto failed;
> > -             }
> > -     } else {
> > +     else
> >               pci_walk_bridge(bridge, report_normal_detected, &status);
> > -     }
> >
> >       if (status =3D=3D PCI_ERS_RESULT_CAN_RECOVER) {
> >               status =3D PCI_ERS_RESULT_RECOVERED;
>
> On s390 PCI errors leave the device with MMIO blocked until either the
> error state is cleared or we reset via the firmware interface. With
> this change and the pci_channel_io_frozen case AER would now do the
> report_mmio_enabled() before the reset with nothing happening between
> report_frozen_detected() and report_mmio_enabled() is MMIO enabled at
> this point? I think this callback really only makes sense if you have
> an equivalent to s390's clearing of the error state that enables MMIO
> but doesn't otherwise reset. Similarly EEH has eeh_pci_enable(pe,
> EEH_OPT_THAW_MMIO).

The original intent was that if the channel locked up e.g. due to some
uncorrectable ECC error or some transient errors due to electrical
problems on the bus (bad reflection of some pulse off some poorly
terminated connector) then such an error would almost surely be
transient and very very unlikely to repeat.

Thus it would be OK to re-enable the MMIO (without otherwise resetting
any channel controller state) and let the device driver examine the PCI
config registers. If they all look good, don't contain any scrambled addrs
or bitflags, then completely normal operations could be resumed without
any further messing around, resetting, invalidating etc.

But first, the device driver needs to examine the config registers and
that cannot be done unless MMIO is enabled.  If MMIO is enabled,
and the PCI config regs appear to contain garbage, then that garbage
can be logged in some error report or crash dump. After this
got done, the device driver would invalidate any pending i/o (for example,
half-finished blocks in some s390 orb, irb, schib, ioccw, whatever)
make sure that assorted channel subsystems are actually halted,
and then attempt  a reset of the bus, the bus controllers (390 channel
or subchannel) and probably the device as well. If that reset succeeds,
then the device driver can restart with a fresh, clean device and a working
channel.  And maybe, if we're lucky, start handling any pending i/o request=
s.

In practice, this worked great for network adapters. However, if the affect=
ed
device was some storage controller for e.g. some mounted filesystem then
(way back when) it was hopeless, because the Linux block subsystem did
not know how to deal with transient errors like this.  Trying to figure out=
 how
to unscramble the block subsystem, and keep mounted filesystems shielded
from this chaos was the one thing I couldn't figure out how to solve.  It s=
eemed
important.  But we've come a long way since then, so I dunno.

-- Linas

