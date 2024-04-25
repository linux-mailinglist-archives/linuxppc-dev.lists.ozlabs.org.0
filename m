Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6148B1BF6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 09:34:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=K/N2DRIa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQ6zw3Zpnz3vZ4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 17:34:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=K/N2DRIa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=lists.ozlabs.org)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQ6z755V8z3dFx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Apr 2024 17:33:21 +1000 (AEST)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 64A313FE51
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Apr 2024 07:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714030395;
	bh=N49t3AK4kKaDmcRRhdLxt0k+B5LqZexfU9NZVLcAJRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=K/N2DRIaAjRmNok+zH6+pAoU60HS5IhDtlWrvgoAC+5zlde01ji/jFB9aetPrMeeN
	 9pgn7qyz659domxob/FkcKPJfW0/vk6864KnoOLXosCrt26NqEll/LCHjuYSDs/KAK
	 /GwwGVFrS2ib1JkZmgqqi70fNvWJrYPjia0XLMXh/kwHDiN9adj4Szvs+t1ZlomlI4
	 bdGPm7KpPZG1k8Djjtmdbj6XX3BSHM5D9NKVQH2DoGwj29Y3neOyH2rSiX1S1e7N0R
	 WTe0I3dRI8Wklfu4T9wdQXSsC7s5A3dcbFa1Rxfqdq3KulbSK3SGmzfuYMtzFqCF6A
	 fDlP1dnM0ifTg==
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2a4f59746f7so878323a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Apr 2024 00:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714030394; x=1714635194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N49t3AK4kKaDmcRRhdLxt0k+B5LqZexfU9NZVLcAJRM=;
        b=u+iXFETbh/Tfh0Q6TZ9wJfNNNFxdpLH87Kmc4e+qJTAkV01B5Si+69rfXCQDjxUDGo
         PwAUdLwVRKxZxScWHL4Mm+bP63ICgzW2Xl1o6m23XMz14vlZnSnI2kbB9j5QQTmtlz0T
         CkSIcVhmzhM6GdJIOCDFJFEFRq37zWMZai2oCVbaUR/IQgLKXBva0JFEXtnpjE2yw14K
         Nq03flrM0Fa8D9Cz+yj5/X5wAN53UvfWYZROulyO9MgtKqhFKwwlg4axapvbKjutiKvk
         XPkenmaZgDftyBG8rJxyy5ix3gpjPT9xNiZoUu6CgU8LQmbOQ3FjnOnnoL+pFNyM1Hbp
         ZvSw==
X-Forwarded-Encrypted: i=1; AJvYcCWW4FTK6pOLvM1y2h/1f+0RhSGLswc60bNxIoXkZuhckTq+jR8WFufU+ZvAc1NBg1qYTxU1u3jlTChGdYhJfiaH7ynt+Zr3rVGMuGHLYQ==
X-Gm-Message-State: AOJu0YwcYvVk+JjKRIJEyP6xQ9gpMzgoV96elS5p4sQ+GYR891PjYrHa
	3Yvpodc/CsQaqSRq9VDgVQhabENGP9yIs1EuePszf+wTmye7rgsMRwbgvDcC6v7cSSd/vvgr9lE
	SNl0oz7pUcMBQAHm4WJyhrU0roSaoqmtCOCOOjs2Vjy+fko9FkTzSf3jZAosP7f7iu2GA7f82LO
	5SS3EmkGx7IkisziUgPsA6pJ7FuJ8elI5pFYtu7e45KdApmbTxbElzAw==
X-Received: by 2002:a17:90a:f18c:b0:2a2:775:9830 with SMTP id bv12-20020a17090af18c00b002a207759830mr3635604pjb.11.1714030393815;
        Thu, 25 Apr 2024 00:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxdkPh6jUQbDypZw6ih5aBEWZ8OaLuVmwkpiSeYBIaD8D8JrEbgl1UlPs5pmFlAQ5PAStLbkRGh+jSeMu9NOg=
X-Received: by 2002:a17:90a:f18c:b0:2a2:775:9830 with SMTP id
 bv12-20020a17090af18c00b002a207759830mr3635577pjb.11.1714030393404; Thu, 25
 Apr 2024 00:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240416043225.1462548-2-kai.heng.feng@canonical.com> <20240418203531.GA251408@bhelgaas>
In-Reply-To: <20240418203531.GA251408@bhelgaas>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 25 Apr 2024 15:33:01 +0800
Message-ID: <CAAd53p7O51mG7LMrEobEgGrD8tsDFO3ZFSPAu02Dk-R0W3mkvg@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] PCI/AER: Disable AER service on suspend
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
Cc: kch@nvidia.com, regressions@lists.linux.dev, linux-pci@vger.kernel.org, mahesh@linux.ibm.com, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, kbusch@kernel.org, oohall@gmail.com, hare@suse.de, bagasdotme@gmail.com, bhelgaas@google.com, gloriouseggroll@gmail.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de, sagi@grimberg.me
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 19, 2024 at 4:35=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Tue, Apr 16, 2024 at 12:32:24PM +0800, Kai-Heng Feng wrote:
> > When the power rail gets cut off, the hardware can create some electric
> > noise on the link that triggers AER. If IRQ is shared between AER with
> > PME, such AER noise will cause a spurious wakeup on system suspend.
> >
> > When the power rail gets back, the firmware of the device resets itself
> > and can create unexpected behavior like sending PTM messages. For this
> > case, the driver will always be too late to toggle off features should
> > be disabled.
> >
> > As Per PCIe Base Spec 5.0, section 5.2, titled "Link State Power
> > Management", TLP and DLLP transmission are disabled for a Link in L2/L3
> > Ready (D3hot), L2 (D3cold with aux power) and L3 (D3cold) states. So if
> > the power will be turned off during suspend process, disable AER servic=
e
> > and re-enable it during the resume process. This should not affect the
> > basic functionality.
> >
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D209149
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D216295
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218090
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>
> Thanks for reviving this series.  I tried follow the history about
> this, but there are at least two series that were very similar and I
> can't put it all together.
>
> > ---
> > v8:
> >  - Add more bug reports.
> >
> > v7:
> >  - Wording
> >  - Disable AER completely (again) if power will be turned off
> >
> > v6:
> > v5:
> >  - Wording.
> >
> > v4:
> > v3:
> >  - No change.
> >
> > v2:
> >  - Only disable AER IRQ.
> >  - No more check on PME IRQ#.
> >  - Use helper.
> >
> >  drivers/pci/pcie/aer.c | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index ac6293c24976..bea7818c2d1b 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -28,6 +28,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/kfifo.h>
> >  #include <linux/slab.h>
> > +#include <linux/suspend.h>
> >  #include <acpi/apei.h>
> >  #include <acpi/ghes.h>
> >  #include <ras/ras_event.h>
> > @@ -1497,6 +1498,28 @@ static int aer_probe(struct pcie_device *dev)
> >       return 0;
> >  }
> >
> > +static int aer_suspend(struct pcie_device *dev)
> > +{
> > +     struct aer_rpc *rpc =3D get_service_data(dev);
> > +     struct pci_dev *pdev =3D rpc->rpd;
> > +
> > +     if (pci_ancestor_pr3_present(pdev) || pm_suspend_via_firmware())
> > +             aer_disable_rootport(rpc);
>
> Why do we check pci_ancestor_pr3_present(pdev) and
> pm_suspend_via_firmware()?  I'm getting pretty convinced that we need
> to disable AER interrupts on suspend in general.  I think it will be
> better if we do that consistently on all platforms, not special cases
> based on details of how we suspend.

Sure. Will change in next revision.

>
> Also, why do we use aer_disable_rootport() instead of just
> aer_disable_irq()?  I think it's the interrupt that causes issues on
> suspend.  I see that there *were* some versions that used
> aer_disable_irq(), but I can't find the reason it changed.

Interrupt can cause system wakeup, if it's shared with PME.

The reason why aer_disable_rootport() is used over aer_disable_irq()
is that when the latter is used the error still gets logged during
sleep cycle. Once the pcieport driver resumes, it invokes
aer_root_reset() to reset the hierarchy, while the hierarchy hasn't
resumed yet.

So use aer_disable_rootport() to prevent such issue from happening.

Kai-Heng

>
> > +
> > +     return 0;
> > +}
> > +
> > +static int aer_resume(struct pcie_device *dev)
> > +{
> > +     struct aer_rpc *rpc =3D get_service_data(dev);
> > +     struct pci_dev *pdev =3D rpc->rpd;
> > +
> > +     if (pci_ancestor_pr3_present(pdev) || pm_resume_via_firmware())
> > +             aer_enable_rootport(rpc);
> > +
> > +     return 0;
> > +}
> > +
> >  /**
> >   * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
> >   * @dev: pointer to Root Port, RCEC, or RCiEP
> > @@ -1561,6 +1584,8 @@ static struct pcie_port_service_driver aerdriver =
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
