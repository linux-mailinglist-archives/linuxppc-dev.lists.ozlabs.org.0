Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A6F6BFF84
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Mar 2023 07:02:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PfS1g1LLbz3cjG
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Mar 2023 17:01:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Uv/GGmwu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com; envelope-from=grundler@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Uv/GGmwu;
	dkim-atps=neutral
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PfS0k2kYpz2yV5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Mar 2023 17:01:09 +1100 (AEDT)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-316d901b2ecso213405ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Mar 2023 23:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679205664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jtobE7mdQ684Q9rpZyR9ThE+UBXlRxaYkXSGk1qWzI=;
        b=Uv/GGmwuWmKmuai9ob/LIugQoqxPKWFQ7VQPGsUzDsFDNBg7szlIlGrjo7Wy6dUE5+
         m5CLuuE8SgR+boruhHSQ2QGYMbhG+txFqoW37ungZHOAuhIlBH27W24o1IjrNdQOUGDn
         rOBRSjw07ZsARNdte4ehKRi0jjkPaHBpLfkx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679205664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jtobE7mdQ684Q9rpZyR9ThE+UBXlRxaYkXSGk1qWzI=;
        b=hAGZI386egfg+oIzrUwv92gadAjif/dE/4NPVBwOPSbEgY1O1FV3nk4xXebibm8NIg
         PiCtAWAGWiAkW4Em/KCzkCn5gMYTuZhLhWsXG81xIiTo8ubXVhQJ4yYQhabRcHzrybyu
         WobBW3+nPlJYDvMx8lUXRnHEMcVeJj06sCY5LZJQcErm+BRiPRht3u/A4de7jfLV6Y4x
         BUbnItJJYRlk8q44QLieh/EprkPgF+opBIppAUJqPH+gC+Jw3KW9SOrld8nhctR2+dY1
         36omKraR92ryvlm6lxE1xU7QNXgTv8f81aTmGqht4r+MfRfcHm4ZfGl4sZ0izfUXjYCL
         xtIQ==
X-Gm-Message-State: AO0yUKXD2av9mH90NHEQKKwnj3kJQ+nGfSwjTQJpLY41I0LTqrnq+PoQ
	b8zzCZv8ezESAt+TNISCZkTo0u7JX5Ejrq1geNW27Q==
X-Google-Smtp-Source: AK7set8cLZYljQLpMgQgrBxrBo0UkMYzaidGYl/tBvUtvNEHoq8IQWEs2fBEX/GlE8CDFvEikWcBJNSxSYDOktq1GmA=
X-Received: by 2002:a05:6e02:1d9b:b0:317:6591:95dd with SMTP id
 h27-20020a056e021d9b00b00317659195ddmr224882ila.9.1679205664302; Sat, 18 Mar
 2023 23:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <bd48a3f0-138d-9c48-27d6-a5133f054c96@linux.intel.com> <20230317193056.GA1963022@bhelgaas>
In-Reply-To: <20230317193056.GA1963022@bhelgaas>
From: Grant Grundler <grundler@chromium.org>
Date: Sat, 18 Mar 2023 23:00:52 -0700
Message-ID: <CANEJEGuVTWTkFmnK0m-4Tn1OUvQQBLjCQ-fxL24jXAWaafQ9cw@mail.gmail.com>
Subject: Re: [PATCHv2 pci-next 1/2] PCI/AER: correctable error message as KERN_INFO
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
Cc: Rajat Jain <rajatja@chromium.org>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, Rajat Khandelwal <rajat.khandelwal@linux.intel.com>, Grant Grundler <grundler@chromium.org>, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Oliver O 'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 17, 2023 at 12:31=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org>=
 wrote:
>
> On Fri, Mar 17, 2023 at 11:50:22AM -0700, Sathyanarayanan Kuppuswamy wrot=
e:
> > On 3/17/23 10:51 AM, Grant Grundler wrote:
> > > Since correctable errors have been corrected (and counted), the dmesg=
 output
> > > should not be reported as a warning, but rather as "informational".
> > >
> > > Otherwise, using a certain well known vendor's PCIe parts in a USB4 d=
ocking
> > > station, the dmesg buffer can be spammed with correctable errors, 717=
 bytes
> > > per instance, potentially many MB per day.
> >
> > Why don't you investigate why you are getting so many correctable error=
s?

It's a bit difficult to insert a PCIe logic analyzer on someone else's
soldered down parts. Intel is the only party with all the HW in a form
that allows that level of debugging.

> > Isn't solving the problem preferable to hiding the logs?

Of course! But note that spamming the logs with low priority messages
isn't acceptable either. So we should be doing both.

> I hope there's some effort to find the cause of the errors, too.

Rajat (from Intel) has told me that Intel is investigating this.

I was told the devices are reporting two kinds of correctable
errors:replay rollover and replay timeout.

This may be related to a replay timer value (PCIERTP1) in the PCI
device is too short for PCIe tunneling (USB4).  It's not clear to me
if this value is hardcoded in the Intel NIC or if it's configurable.
But I've been waiting since last December for Intel to give me
guidance on what is implemented in their NIC.

> But I do think KERN_INFO is a reasonable level for errors that have
> already been corrected.  KERN_ERR seems a little bit too severe to me.
>
> Does changing to KERN_INFO keep the messages out of the dmesg log?  I
> don't think it does, because *most* kernel messages are at KERN_INFO.
> This may be just a commit log clarification.

True. I'm not sure why I thought KERN_INFO would not show up.  If they
do, I'll depend on the rate limiting patch to not spam the system
logs.

> I would like to know *which* devices are involved.
> Is there some reason for weasel-wording this?

I don't think there is. Rajat previously mentioned this was for the HP
TBT4 docking station. The two USB4 docking station vendors I'm
familiar with are both using Intel i225 NIC (foxville). This appears
to be a problem only with the NIC behind a PCIe tunnel and not a HW
problem with the docking station overall (which is what I previously
assumed.)

FTR, this same NIC works and does not report correctable errors when
directly connected to a PCI host controller. It's not as happy on the
other side of a USB4 PCIe tunnel but still appears to work correctly
(retries are succeeding). I'm not able to point at any NIC failures
(yet). But I'm certainly not very happy that the same company which is
the primary backer of thunderbolt and USB4 isn't able to
design/configure parts so they play well together.

>  Knowing which devices are involved
> helps in triaging issue reports.  If there are any public reports on
> mailing lists, etc, we could also cite those here to help users find
> this solution.

Yup - that's exactly how I've been helped so often in the past as well.


>
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
> > >  drivers/pci/pcie/aer.c | 29 +++++++++++++++++++----------
> > >  1 file changed, 19 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > > index f6c24ded134c..cb6b96233967 100644
> > > --- a/drivers/pci/pcie/aer.c
> > > +++ b/drivers/pci/pcie/aer.c
> > > @@ -687,23 +687,29 @@ static void __aer_print_error(struct pci_dev *d=
ev,
> > >  {
> > >     const char **strings;
> > >     unsigned long status =3D info->status & ~info->mask;
> > > -   const char *level, *errmsg;
> > >     int i;
> > >
> > >     if (info->severity =3D=3D AER_CORRECTABLE) {
> > >             strings =3D aer_correctable_error_string;
> > > -           level =3D KERN_WARNING;
> > > +           pci_info(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n",
> > > +                   info->status, info->mask);
> > >     } else {
> > >             strings =3D aer_uncorrectable_error_string;
> > > -           level =3D KERN_ERR;
> > > +           pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n",
> > > +                   info->status, info->mask);
> > >     }
> > >
> > >     for_each_set_bit(i, &status, 32) {
> > > -           errmsg =3D strings[i];
> > > +           const char *errmsg =3D strings[i];
> > > +
> > >             if (!errmsg)
> > >                     errmsg =3D "Unknown Error Bit";
> > >
> > > -           pci_printk(level, dev, "   [%2d] %-22s%s\n", i, errmsg,
> > > +           if (info->severity =3D=3D AER_CORRECTABLE)
> > > +                   pci_info(dev, "   [%2d] %-22s%s\n", i, errmsg,
> > > +                           info->first_error =3D=3D i ? " (First)" :=
 "");
> > > +           else
> > > +                   pci_err(dev, "   [%2d] %-22s%s\n", i, errmsg,
> > >                             info->first_error =3D=3D i ? " (First)" :=
 "");
>
> The - 5 lines, + 11 lines diff and repetition of the printk strings
> doesn't seem like an improvement compared to the -1, +1 in the v1
> patch:
>
>   @@ -692,7 +692,7 @@ static void __aer_print_error(struct pci_dev *dev,
>
>           if (info->severity =3D=3D AER_CORRECTABLE) {
>                   strings =3D aer_correctable_error_string;
>   -               level =3D KERN_WARNING;
>   +               level =3D KERN_INFO;
>           } else {
>
> But maybe there's a reason?

Not intentionally - but Yes - the next patch is simpler when changing
to pci_info_ratelimit. This change will show up in either the first or
second patch.

I can switch that hunk back to V1 code if you prefer that for this patch.

cheers,
grant

>
> > >     }
> > >     pci_dev_aer_stats_incr(dev, info);
> > > @@ -724,7 +730,7 @@ void aer_print_error(struct pci_dev *dev, struct =
aer_err_info *info)
> > >     layer =3D AER_GET_LAYER_ERROR(info->severity, info->status);
> > >     agent =3D AER_GET_AGENT(info->severity, info->status);
> > >
> > > -   level =3D (info->severity =3D=3D AER_CORRECTABLE) ? KERN_WARNING =
: KERN_ERR;
> > > +   level =3D (info->severity =3D=3D AER_CORRECTABLE) ? KERN_INFO : K=
ERN_ERR;
> > >
> > >     pci_printk(level, dev, "PCIe Bus Error: severity=3D%s, type=3D%s,=
 (%s)\n",
> > >                aer_error_severity_string[info->severity],
> > > @@ -797,14 +803,17 @@ void cper_print_aer(struct pci_dev *dev, int ae=
r_severity,
> > >     info.mask =3D mask;
> > >     info.first_error =3D PCI_ERR_CAP_FEP(aer->cap_control);
> > >
> > > -   pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, ma=
sk);
> > >     __aer_print_error(dev, &info);
> > > -   pci_err(dev, "aer_layer=3D%s, aer_agent=3D%s\n",
> > > -           aer_error_layer[layer], aer_agent_string[agent]);
> > >
> > > -   if (aer_severity !=3D AER_CORRECTABLE)
> > > +   if (aer_severity =3D=3D AER_CORRECTABLE) {
> > > +           pci_info(dev, "aer_layer=3D%s, aer_agent=3D%s\n",
> > > +                   aer_error_layer[layer], aer_agent_string[agent]);
> > > +   } else {
> > > +           pci_err(dev, "aer_layer=3D%s, aer_agent=3D%s\n",
> > > +                   aer_error_layer[layer], aer_agent_string[agent]);
> > >             pci_err(dev, "aer_uncor_severity: 0x%08x\n",
> > >                     aer->uncor_severity);
> > > +   }
> > >
> > >     if (tlp_header_valid)
> > >             __print_tlp_header(dev, &aer->header_log);
> >
> > --
> > Sathyanarayanan Kuppuswamy
> > Linux Kernel Developer
