Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8092C6B12FE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 21:24:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PX3gf3D4Pz3cDF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 07:24:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F9JkXcVo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e31; helo=mail-vs1-xe31.google.com; envelope-from=grundler@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F9JkXcVo;
	dkim-atps=neutral
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PX3fm150Yz3bby
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Mar 2023 07:23:26 +1100 (AEDT)
Received: by mail-vs1-xe31.google.com with SMTP id f31so16534825vsv.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Mar 2023 12:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678307003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RPaT5MrHSvj4O9LtIvda00nyyIYBJhBMMQAbW0pyRs=;
        b=F9JkXcVoblDoQmKlLDOVuticNu5VhGherOTRVqdN12OzIO5B0v1TVWd406EsRrlLIs
         db+cOdWorzKZyRoNnq8sLXcGkQm56hKnDE1J4Q3NMwU/kh/rek0T2Y31POsARkcCwc9g
         rbkZPzwZTdMLA7RyOtumdEoEL+ma5XpwLbpU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678307003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RPaT5MrHSvj4O9LtIvda00nyyIYBJhBMMQAbW0pyRs=;
        b=0Ay1Z9by0jwGPDtyMue4xyDcyVjDAWs96pm379brokksy3s0FTIJzP22+Ra68Oh/cM
         3yJ2FO4kZv31MSiHpJjmIN50FyhdggzlpiTjDqruCH+cjAMdO1diLZH6yzkI8dZNAjfc
         ht9bJXsXroYMOhID/n0h6DVh98537rBaQZALv3SJshnc5p61PRg3wktlNopf3uIkfDhU
         zc6EudSO/ATv/l1zJJNL3Ie2Wv/EZdhHarldBLZ9Mt6x03k9XLnA5hChEeZX/hAcvNvM
         LcxLmzVcAp0fQ3ns568JqN1qB7ySVrUtv3Sfiv59OhLxtfx06o8jyu0SY5VWrBY2iCDw
         cKBA==
X-Gm-Message-State: AO0yUKVlBPm7KaIQla2ETep4+7wRj7fQ98Hf656Y2hItCI2CuUiCSAyR
	5OjerSCn0CS2Ljp8TRR9hNCbGhYUObeAL73H3hduTQ==
X-Google-Smtp-Source: AK7set819vxr9EQa/2YNU/n4kHNJ5k7TG52gGkvDn+JASTWTeZxSkmZibh/gpAVYxJG81DMZiVDj2IX8Hf+16OcA3NU=
X-Received: by 2002:a05:6102:1261:b0:412:11d2:bd97 with SMTP id
 q1-20020a056102126100b0041211d2bd97mr12491049vsg.2.1678307003370; Wed, 08 Mar
 2023 12:23:23 -0800 (PST)
MIME-Version: 1.0
References: <CANEJEGvB0+XTgUwJi80BRFpNYWrbtiz17baSoxcR_OpSdnzahg@mail.gmail.com>
 <20230308201827.GA1039517@bhelgaas>
In-Reply-To: <20230308201827.GA1039517@bhelgaas>
From: Grant Grundler <grundler@chromium.org>
Date: Wed, 8 Mar 2023 12:23:12 -0800
Message-ID: <CANEJEGuQhPHG6517=Os_9cgzhx7r0Rivg8BRAnKdENPMvNFxKQ@mail.gmail.com>
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

On Wed, Mar 8, 2023 at 12:18=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Wed, Mar 08, 2023 at 12:00:48PM -0800, Grant Grundler wrote:
> > Ping? Did I miss an email or other work that this patch collides with?
>
> Nope, we typically make topic branches based on -rc1, so not much
> happens during the merge window.  -rc1 was tagged Sunday, so things
> will start appearing in -next soon.

Ah ok! Thanks for clarifying Bjorn!

cheers,
grant

>
> Bjorn
>
> > On Tue, Feb 28, 2023 at 10:05=E2=80=AFPM Grant Grundler <grundler@chrom=
ium.org> wrote:
> > >
> > > Since correctable errors have been corrected (and counted), the dmesg=
 output
> > > should not be reported as a warning, but rather as "informational".
> > >
> > > Otherwise, using a certain well known vendor's PCIe parts in a USB4 d=
ocking
> > > station, the dmesg buffer can be spammed with correctable errors, 717=
 bytes
> > > per instance, potentially many MB per day.
> > >
> > > Given the "WARN" priority, these messages have already confused the t=
ypical
> > > user that stumbles across them, support staff (triaging feedback repo=
rts),
> > > and more than a few linux kernel devs. Changing to INFO will hide the=
se
> > > messages from most audiences.
> > >
> > > Signed-off-by: Grant Grundler <grundler@chromium.org>
> > > ---
> > > This patch will likely conflict with:
> > >   https://lore.kernel.org/all/20230103165548.570377-1-rajat.khandelwa=
l@linux.intel.com/
> > >
> > > which I'd also like to see upstream. Please let me know to resubmit m=
ine if Rajat's patch lands first. Or feel free to fix up this one.
> > >
> > >  drivers/pci/pcie/aer.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > > index f6c24ded134c..e4cf3ec40d66 100644
> > > --- a/drivers/pci/pcie/aer.c
> > > +++ b/drivers/pci/pcie/aer.c
> > > @@ -692,7 +692,7 @@ static void __aer_print_error(struct pci_dev *dev=
,
> > >
> > >         if (info->severity =3D=3D AER_CORRECTABLE) {
> > >                 strings =3D aer_correctable_error_string;
> > > -               level =3D KERN_WARNING;
> > > +               level =3D KERN_INFO;
> > >         } else {
> > >                 strings =3D aer_uncorrectable_error_string;
> > >                 level =3D KERN_ERR;
> > > @@ -724,7 +724,7 @@ void aer_print_error(struct pci_dev *dev, struct =
aer_err_info *info)
> > >         layer =3D AER_GET_LAYER_ERROR(info->severity, info->status);
> > >         agent =3D AER_GET_AGENT(info->severity, info->status);
> > >
> > > -       level =3D (info->severity =3D=3D AER_CORRECTABLE) ? KERN_WARN=
ING : KERN_ERR;
> > > +       level =3D (info->severity =3D=3D AER_CORRECTABLE) ? KERN_INFO=
 : KERN_ERR;
> > >
> > >         pci_printk(level, dev, "PCIe Bus Error: severity=3D%s, type=
=3D%s, (%s)\n",
> > >                    aer_error_severity_string[info->severity],
> > > --
> > > 2.39.2.722.g9855ee24e9-goog
> > >
