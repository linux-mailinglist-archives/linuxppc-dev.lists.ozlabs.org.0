Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E316BF042
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 18:58:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdX1P48d2z3f3m
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 04:58:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XlSn50Lm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=grundler@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XlSn50Lm;
	dkim-atps=neutral
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdX0S49qzz3chZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Mar 2023 04:57:43 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3ec1e8c4cacso30865e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 10:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679075856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0kdWElxUrPVHoXwucdphZLsl4pqIxyDfVSRYkUVA0M=;
        b=XlSn50LmxMUxU8YGoCMXayJyl+xbOjaBtM1uHj+HDPFVuXFn63xuY81ycuJnn4S9/q
         1FpRVJwZToHYg9BtVM0soOzxl5iOMpMiKaLUzkb4B57FBm2q732fpd3UzFfE5pzlQa2D
         0QPt3zEl5OFOJ4piQ9C9fhWBuf/crY9XhT9LE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679075856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0kdWElxUrPVHoXwucdphZLsl4pqIxyDfVSRYkUVA0M=;
        b=THi/x/MjVzRYUiQLuJ2Aa7Q9H0qI1qCJzgmV82rZm2GXpbB+IduOLAy27uj0RH4WoQ
         Y1tcUcAzTGkOHoiSR6NbFGks4E1nUPO0ztCItlRvqwenyZAg435LQhOs0bnr+8HS0vDb
         HNiSCqYN2botM4mf19mVwwALXrViJP2/EIJozq1ajWUddbk95SNT72VooEOHfExb5Oun
         8P5Pon1mcIzu7doDqtxKxrtwqIxcmrC00FGFL2MwATjyrvfWj0a3i22RUzvmxnv9nodZ
         ZM2AnZIpucQ0RvcDO6UT79xPpwhSbTHgDGbNfEw2ONqpre0exAmEAnin1Xf1sK6ZlLhG
         RdQQ==
X-Gm-Message-State: AO0yUKU0tfwVLzqjJRq0MN9c/d82EMsP2l8a/jqm1M5NplAC6V3emcw2
	JXTd0NDE1cK+JT2hSEWB3ctrwuINSi3UUFc/H7CZvg==
X-Google-Smtp-Source: AK7set+xx+1ZWkJR/ePpXRomoOoF2jHljAnW/hhNfVsWmQ3rGcVeZksBzo2JeYsXElUnV/xYc2I0OQwYOWWVbskJGy4=
X-Received: by 2002:a05:600c:1c8b:b0:3ed:8826:256e with SMTP id
 k11-20020a05600c1c8b00b003ed8826256emr155775wms.1.1679075855950; Fri, 17 Mar
 2023 10:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230301060453.4031503-1-grundler@chromium.org>
 <20230314193836.GA1667748@bhelgaas> <CANEJEGtxn79+weGWVuF+Ytw789Smxv-2vGaM_qes1hfzg7qeYw@mail.gmail.com>
In-Reply-To: <CANEJEGtxn79+weGWVuF+Ytw789Smxv-2vGaM_qes1hfzg7qeYw@mail.gmail.com>
From: Grant Grundler <grundler@chromium.org>
Date: Fri, 17 Mar 2023 10:57:24 -0700
Message-ID: <CANEJEGt6oNVvPpUgt=Zi8P_gUp09EctKt+uBiRfO0Cx5gsUvPA@mail.gmail.com>
Subject: Re: [PATCH] PCI/AER: correctable error message as KERN_INFO
To: Grant Grundler <grundler@chromium.org>
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
Cc: Rajat Jain <rajatja@chromium.org>, Rajat Khandelwal <rajat.khandelwal@linux.intel.com>, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Oliver O 'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas <helgaas@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 14, 2023 at 5:24=E2=80=AFPM Grant Grundler <grundler@chromium.o=
rg> wrote:
>
> On Tue, Mar 14, 2023 at 12:38=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.or=
g> wrote:
> >
> > On Tue, Feb 28, 2023 at 10:04:53PM -0800, Grant Grundler wrote:
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
> > > which I'd also like to see upstream. Please let me know to resubmit
> > > mine if Rajat's patch lands first. Or feel free to fix up this one.
> >
> > Yes.  I think it makes sense to separate this into two patches:
> >
> >   1) Log correctable errors as KERN_INFO instead of KERN_WARNING, and
> >   2) Rate-limit correctable error logging.
>
> I'm going to look into your comment below. I'll port Rajat's patch on
> top of mine to follow the order you've listed above.
>
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
> > >       if (info->severity =3D=3D AER_CORRECTABLE) {
> > >               strings =3D aer_correctable_error_string;
> > > -             level =3D KERN_WARNING;
> > > +             level =3D KERN_INFO;
> > >       } else {
> > >               strings =3D aer_uncorrectable_error_string;
> > >               level =3D KERN_ERR;
> > > @@ -724,7 +724,7 @@ void aer_print_error(struct pci_dev *dev, struct =
aer_err_info *info)
> > >       layer =3D AER_GET_LAYER_ERROR(info->severity, info->status);
> > >       agent =3D AER_GET_AGENT(info->severity, info->status);
> > >
> > > -     level =3D (info->severity =3D=3D AER_CORRECTABLE) ? KERN_WARNIN=
G : KERN_ERR;
> > > +     level =3D (info->severity =3D=3D AER_CORRECTABLE) ? KERN_INFO :=
 KERN_ERR;
> > >
> > >       pci_printk(level, dev, "PCIe Bus Error: severity=3D%s, type=3D%=
s, (%s)\n",
> > >                  aer_error_severity_string[info->severity],
> >
> > Shouldn't we do the same in the cper_print_aer() path?  That path
> > currently uses pci_err() and then calls __aer_print_error(), so the
> > initial message will always be KERN_ERR, and the decoding done by
> > __aer_print_error() will be KERN_INFO (for correctable) or KERN_ERR.
>
> I was completely unaware of this since it's not causing me any
> immediate problems. But I agree the message priority should be
> consistent for correctable errors.

I've just posted a V2 which I believe is against "pci-next":

grundler <1607>git remote -v show pci-next
* remote pci-next
  Fetch URL: git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
  Push  URL: git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
  HEAD branch: main
  Remote branches:
    aer                   tracked
    controller/dt         tracked
    controller/kirin      tracked
    controller/layerscape tracked
    controller/rcar       tracked
    for-linus             tracked
    main                  tracked
    next                  tracked
  Local branch configured for 'git pull':
    aer_correctable_info merges with remote next

Please let me know if this is the wrong git tree and branch to track.

> > Seems like a shame to do the same test in three places, but would
> > require a little more refactoring to avoid that.
>
> I don't mind doing the same test in multiple places. If refactoring
> this isn't straight forward, I'll leave the refactoring for someone
> more ambitious. :D

I've moved one of the pci_info lines from cper_print_aer()  to
__aer_print_info() since the status/mask are the same for both paths
that invoke __aer_print_info(). But that's as far as I understand what
each of the paths that calls __aer_print_info() do.  If this is not
OK, I can move it back.

cheers,
grant
