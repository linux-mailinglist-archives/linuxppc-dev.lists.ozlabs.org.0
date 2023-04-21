Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DFF6EA325
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Apr 2023 07:33:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2jqL4H72z3fVC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Apr 2023 15:33:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=gr1fCnUL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=gr1fCnUL;
	dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2jpR5nlgz3f8m
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Apr 2023 15:32:30 +1000 (AEST)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BE7EB44277
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Apr 2023 05:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1682055145;
	bh=6fZMAPxaQ2NtCFw/OrUJgDL+NjbElpsSBv71T4079w4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=gr1fCnULfyCNiWrIoIObRLAbjz6edhUrfK1lJTjtlQsAy6tqesCbgIa7VLtWFCyjE
	 u/LoNXje++UsuPBpljvhzrdfs2AAxe3qNTyb+Qz07Ry7Vl+eOUj4uxGjkEiPhW1CZb
	 qYzwkYqDOlUXdUGuHSlBNzeG8PtY7cVsbpPROoVOdFqpreHhgOMVkY4Ga1KKbW2zU8
	 XeeEALATABwTaMPxlaP+6zfZaRhQ1PHqR3KdvIFMZmbyVp0o9rQcHyHySgcC1IawGG
	 as7sszRMCOwPcx4WEp0M8NBf2kSn6zEN1IxecrhqFsV9rZy1I9ODnXrbWhqaz1xqiY
	 FQYD678OM6s5g==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2472a2e72d1so1644928a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 22:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682055143; x=1684647143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fZMAPxaQ2NtCFw/OrUJgDL+NjbElpsSBv71T4079w4=;
        b=T/0QhIKKeg1n9xtjNBs7EBJTOa6Szksu+lFA74q7Ls7tlro2x5FXH9CW2f0Ue2A+Ik
         DWagjCwZHC3S2PcNOdPbX9OYCbR1n6i3WyeJwBB5NlOwjma1+l3DyN0bWSQm7o88aAHe
         3dWRza2QWwNMVwpYv7cyXJdo1is6Hs7XePv+tAA3ZSsVm+NbTs2QcXIbPhyu4gBNfB9f
         g74Z3saSspsZOD4Z1Q79qj3r8Uh1uzEcqDS8MGQkfoxW4NxaoX+lnWeDJnQp4p2E9/Yo
         UN4CePmUVICxlUNlof11wf7Vh1+EfDPYxBHChmpt5JMiovkn0wQ/2+IJsSFkKS6lhIDP
         tLgQ==
X-Gm-Message-State: AAQBX9d4SmVDHndhPbXcZQ4ta8AZAMG5NgPcYtvQiyVObDLLpgwCG+1d
	xW84OKMo7BJ2K72uIhJREPn9Vjto0NRyXDDIcqGu+Fd2TjqMJZigXPQ5whcGhUezuYcrEVbKcxT
	psuu291+g1KrpBy+c0VfJjCkGDQH/XiX048ahIVKw4Y1n/eHBdcVsHvjno9o=
X-Received: by 2002:a17:90b:3648:b0:247:35c7:bd67 with SMTP id nh8-20020a17090b364800b0024735c7bd67mr3754306pjb.46.1682055143748;
        Thu, 20 Apr 2023 22:32:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZW3SE5cSn/yddEPPQw5KYQiQxrGhjGAVAADd/GQ9uokNzzHmPpmqsq9Qa5iBnIp1hnHZ8RBNckOT4JFBvEcnM=
X-Received: by 2002:a17:90b:3648:b0:247:35c7:bd67 with SMTP id
 nh8-20020a17090b364800b0024735c7bd67mr3754285pjb.46.1682055143456; Thu, 20
 Apr 2023 22:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230420125941.333675-1-kai.heng.feng@canonical.com>
 <20230420125941.333675-3-kai.heng.feng@canonical.com> <f1409ba9-5370-1e0d-8b6c-e9782505937f@linux.intel.com>
In-Reply-To: <f1409ba9-5370-1e0d-8b6c-e9782505937f@linux.intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 21 Apr 2023 13:32:12 +0800
Message-ID: <CAAd53p4chNHrHA8RhSjQYH4znVXHZHJ4m4JrzFiOsun_JsegXA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] PCI/AER: Disable AER interrupt on suspend
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

On Thu, Apr 20, 2023 at 10:53=E2=80=AFPM Sathyanarayanan Kuppuswamy
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>
>
>
> On 4/20/23 5:59 AM, Kai-Heng Feng wrote:
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
> In Patch #1, you skip clearing AER errors in the resume path, right? So i=
f we disable
> interrupts here, will AER driver not be notified on resume path error?

I agree the driver should report the error via aer_isr_one_error() on
resume path.
But on the system I am using (Intel ADL PCH), once the interrupt is
disabled, PCI_ERR_ROOT_STATUS doesn't record error anymore.
Not sure if it's intended though.

Kai-Heng

>
> > v3:
> >  - No change.
> >
> > v2:
> >  - Only disable AER IRQ.
> >  - No more check on PME IRQ#.
> >  - Use helper.
> >
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
