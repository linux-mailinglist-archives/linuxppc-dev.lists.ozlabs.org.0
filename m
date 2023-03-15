Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8660E6BA406
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 01:25:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pbrll2zgDz3cfZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 11:25:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZiLxIon1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=grundler@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZiLxIon1;
	dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pbrkp05LYz3c7S
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 11:25:04 +1100 (AEDT)
Received: by mail-wm1-x336.google.com with SMTP id k25-20020a7bc419000000b003ed23114fa7so88183wmi.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 17:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678839901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBNqRKvFHgPqqskaybm027VBSueaOqeOTv7uwJBWtdQ=;
        b=ZiLxIon1u+rmZiqod8EddJ1NTtYuick9y4S5J3gIzNVwzhoPs8cNYgm0UcpTqZd4GC
         WXyLUpKm39+drChF4demvnBD117++Ok1xOZEphRRiTuqZJAZGaXrEFYLbNHbNkMZefuo
         ULsB9cCkVr8xwkt81Ow4eHlVoH0pkdxniF+lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678839901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBNqRKvFHgPqqskaybm027VBSueaOqeOTv7uwJBWtdQ=;
        b=wB9Ut4VFhjX/280cz2xVCq6iVfhTWEVaLHHlNj0drV/jJh76+8esooVDuN9c1nl4lY
         c1sPknF+tfb88CakdZV4RaA1CrUJKDhfXtzqSoUuV6od9DLWKQVJykeVuJnLL+e0Q3+G
         GHkTkO3uyOevBaVxzs433d1aBkmRTagocoQkXn1LccX+vlQchsW6T2PviLw0rKssCQuy
         wF9j3UIfJgHfhNEzDGORz3XvNFcdraiu4vfxdP/ZNimYk+sI6eVos1E728fBsQ4nhBx0
         3Kt1/y2DI12c+csWJ6P8iQ+euSnPv5ue8E1J5w28H1350Xxmut3MZEui3Ghy1BpS/TTu
         /RaQ==
X-Gm-Message-State: AO0yUKWwGPCISnzDe01/zCSo2MqlHRoEfyNyAukQDpIL3eMDVrsR6LZ4
	Gy8N8pXul7toWb6ycDWgrVBi8hfRr704JDWjZOohyg==
X-Google-Smtp-Source: AK7set/m4nESElQsgLmaw1biuRQY8j6mcZEJlWhUB+r9v2P1fMoQCuNEmhEy6d2bWp46oRQ6Y14VPSx4Kv3vqwW2Crw=
X-Received: by 2002:a05:600c:512a:b0:3ed:26fa:6ee5 with SMTP id
 o42-20020a05600c512a00b003ed26fa6ee5mr2238902wms.4.1678839901419; Tue, 14 Mar
 2023 17:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230301060453.4031503-1-grundler@chromium.org> <20230314193836.GA1667748@bhelgaas>
In-Reply-To: <20230314193836.GA1667748@bhelgaas>
From: Grant Grundler <grundler@chromium.org>
Date: Tue, 14 Mar 2023 17:24:49 -0700
Message-ID: <CANEJEGtxn79+weGWVuF+Ytw789Smxv-2vGaM_qes1hfzg7qeYw@mail.gmail.com>
Subject: Re: [PATCH] PCI/AER: correctable error message as KERN_INFO
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
Cc: Rajat Jain <rajatja@chromium.org>, Rajat Khandelwal <rajat.khandelwal@linux.intel.com>, Grant Grundler <grundler@chromium.org>, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Oliver O 'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 14, 2023 at 12:38=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org>=
 wrote:
>
> On Tue, Feb 28, 2023 at 10:04:53PM -0800, Grant Grundler wrote:
> > Since correctable errors have been corrected (and counted), the dmesg o=
utput
> > should not be reported as a warning, but rather as "informational".
> >
> > Otherwise, using a certain well known vendor's PCIe parts in a USB4 doc=
king
> > station, the dmesg buffer can be spammed with correctable errors, 717 b=
ytes
> > per instance, potentially many MB per day.
> >
> > Given the "WARN" priority, these messages have already confused the typ=
ical
> > user that stumbles across them, support staff (triaging feedback report=
s),
> > and more than a few linux kernel devs. Changing to INFO will hide these
> > messages from most audiences.
> >
> > Signed-off-by: Grant Grundler <grundler@chromium.org>
> > ---
> > This patch will likely conflict with:
> >   https://lore.kernel.org/all/20230103165548.570377-1-rajat.khandelwal@=
linux.intel.com/
> >
> > which I'd also like to see upstream. Please let me know to resubmit
> > mine if Rajat's patch lands first. Or feel free to fix up this one.
>
> Yes.  I think it makes sense to separate this into two patches:
>
>   1) Log correctable errors as KERN_INFO instead of KERN_WARNING, and
>   2) Rate-limit correctable error logging.

I'm going to look into your comment below. I'll port Rajat's patch on
top of mine to follow the order you've listed above.

> >  drivers/pci/pcie/aer.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index f6c24ded134c..e4cf3ec40d66 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -692,7 +692,7 @@ static void __aer_print_error(struct pci_dev *dev,
> >
> >       if (info->severity =3D=3D AER_CORRECTABLE) {
> >               strings =3D aer_correctable_error_string;
> > -             level =3D KERN_WARNING;
> > +             level =3D KERN_INFO;
> >       } else {
> >               strings =3D aer_uncorrectable_error_string;
> >               level =3D KERN_ERR;
> > @@ -724,7 +724,7 @@ void aer_print_error(struct pci_dev *dev, struct ae=
r_err_info *info)
> >       layer =3D AER_GET_LAYER_ERROR(info->severity, info->status);
> >       agent =3D AER_GET_AGENT(info->severity, info->status);
> >
> > -     level =3D (info->severity =3D=3D AER_CORRECTABLE) ? KERN_WARNING =
: KERN_ERR;
> > +     level =3D (info->severity =3D=3D AER_CORRECTABLE) ? KERN_INFO : K=
ERN_ERR;
> >
> >       pci_printk(level, dev, "PCIe Bus Error: severity=3D%s, type=3D%s,=
 (%s)\n",
> >                  aer_error_severity_string[info->severity],
>
> Shouldn't we do the same in the cper_print_aer() path?  That path
> currently uses pci_err() and then calls __aer_print_error(), so the
> initial message will always be KERN_ERR, and the decoding done by
> __aer_print_error() will be KERN_INFO (for correctable) or KERN_ERR.

I was completely unaware of this since it's not causing me any
immediate problems. But I agree the message priority should be
consistent for correctable errors.

> Seems like a shame to do the same test in three places, but would
> require a little more refactoring to avoid that.

I don't mind doing the same test in multiple places. If refactoring
this isn't straight forward, I'll leave the refactoring for someone
more ambitious. :D

cheers,
grant

>
> Bjorn
