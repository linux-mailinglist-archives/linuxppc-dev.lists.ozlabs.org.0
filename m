Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E48390E308
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 08:06:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=mvTpYTDg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3tRQ6mVCz3cT2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 16:06:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=mvTpYTDg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=lists.ozlabs.org)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3tQh25m6z30Vg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 16:05:46 +1000 (AEST)
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 378B03F5EA
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 06:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1718777141;
	bh=6Nv2YnUXwNhwZtcnR0l2iX9oZx8TMUNIK8n7g+2X8A0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=mvTpYTDgC9ykaSSC6UCMwHN3dpTK8vabqzqR9HG9Ru0xSCL/FBHbD9KRgbFmMe8GB
	 Al9FW7rTMUKH0t/WbRhotVquhcKchIOOaH1M6yysbyIuKXiQLHxAQeWrXkJTv28fB+
	 YQgNQECgoQAwhDjabaOPhuqoIkE0rjP2bmUYqWZxNGGXGP16F/pTJhuaktXotrjwIR
	 Kk9RuTSvkn4ImLfOjmPJqwMEHsAbf6m551HSIPd+HkxFvKK3Z5Y/Qtse6JxM14/dR4
	 Spj6jNKuDneJs10LXtrcLdy+JNYPzL+G/u9psVKO7k9IoOPUMTc2v7gztSR2VUF7q6
	 tApn8HfDIqArg==
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-70d8b7924e7so1912220a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 23:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718777138; x=1719381938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Nv2YnUXwNhwZtcnR0l2iX9oZx8TMUNIK8n7g+2X8A0=;
        b=TBS8mreyTWwYW6aSYMfBknevLecm2cleH4pDAsH9SIGLN7Sj6Ro+nbIDDS2X57ok46
         ShNuHB1jAB/CFaERRwvwqX4kFJbhCTAk+XWWJo6yT5yQR4GVM00yG43QLjtYoXCVJebN
         25uKCuhU64Z+WMyHzG/JsQXKf0lAtIN3nGMNhszOML+9Xbo1MHCSkgckStSYPmgVkr70
         2dQ+1Fr3bOW0H1aYtZs2sd6oRNMFPAnXGi5knB6xnuxq/zpz373FP80tOkznPMrXQkao
         SbNiHp/gB0qGojAcX7VILTDcli6XmHoUNhEhEc2epotI0TjGtxmJcY8N10oj0qda5K8O
         iFkw==
X-Forwarded-Encrypted: i=1; AJvYcCXNjC45pUEyuqWVXR7lWg68I6gC7pY7IYm4aZ+8DUfH3pnr2Z0kSxtP6kD/i6M/zICexWf/UVAOAw4+Hp5kybPgehZnFY+xDTBkNm80fw==
X-Gm-Message-State: AOJu0YzEEZkRZQdps180N0KKS0amfD69r/RUOuUGoQCDbnC8sJmc1o2V
	uLY5BKMt1jGs29GvRBzQ82ArXiJ2YQc58nT/h29RPRvtT1pWhBGJusu7fzWLclYfnCFtSQP88/R
	xrDY7McEcYwd3zoExSechDIxZ9iYgywpVrFewqJFMd8RPnAP6lB4XEURlcEC8yDVd/kGWEdzMw2
	mh+APHeWInWcyveydL+E8V52jbapmUWO4S+oY6WIN+nksSCl2/k89DLA==
X-Received: by 2002:a05:6a20:a8a5:b0:1b2:a94d:4eca with SMTP id adf61e73a8af0-1bcbb5f705dmr1512761637.41.1718777138514;
        Tue, 18 Jun 2024 23:05:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmoBDk3wuIfStUvPkgN/DsQ3AqL87wGvMpH6BdkD1tmYIyQo/0+ajiApdNg790feEKy+jeMAf9CLNezX3NDog=
X-Received: by 2002:a05:6a20:a8a5:b0:1b2:a94d:4eca with SMTP id
 adf61e73a8af0-1bcbb5f705dmr1512734637.41.1718777138116; Tue, 18 Jun 2024
 23:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAAd53p7O51mG7LMrEobEgGrD8tsDFO3ZFSPAu02Dk-R0W3mkvg@mail.gmail.com>
 <20240618204837.GA1262769@bhelgaas>
In-Reply-To: <20240618204837.GA1262769@bhelgaas>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 19 Jun 2024 14:05:26 +0800
Message-ID: <CAAd53p4gHQeyDkusDW7rkjVKjTnyi+RjHZLbPU5CqfsuVRtodQ@mail.gmail.com>
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

On Wed, Jun 19, 2024 at 4:48=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Thu, Apr 25, 2024 at 03:33:01PM +0800, Kai-Heng Feng wrote:
> > On Fri, Apr 19, 2024 at 4:35=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.o=
rg> wrote:
> > >
> > > On Tue, Apr 16, 2024 at 12:32:24PM +0800, Kai-Heng Feng wrote:
> > > > When the power rail gets cut off, the hardware can create some elec=
tric
> > > > noise on the link that triggers AER. If IRQ is shared between AER w=
ith
> > > > PME, such AER noise will cause a spurious wakeup on system suspend.
> > > >
> > > > When the power rail gets back, the firmware of the device resets it=
self
> > > > and can create unexpected behavior like sending PTM messages. For t=
his
> > > > case, the driver will always be too late to toggle off features sho=
uld
> > > > be disabled.
> > > >
> > > > As Per PCIe Base Spec 5.0, section 5.2, titled "Link State Power
> > > > Management", TLP and DLLP transmission are disabled for a Link in L=
2/L3
> > > > Ready (D3hot), L2 (D3cold with aux power) and L3 (D3cold) states. S=
o if
> > > > the power will be turned off during suspend process, disable AER se=
rvice
> > > > and re-enable it during the resume process. This should not affect =
the
> > > > basic functionality.
> > > >
> > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D209149
> > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D216295
> > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218090
> > > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > >
> > > Thanks for reviving this series.  I tried follow the history about
> > > this, but there are at least two series that were very similar and I
> > > can't put it all together.
> > >
> > > > ---
> > > > v8:
> > > >  - Add more bug reports.
> > > >
> > > > v7:
> > > >  - Wording
> > > >  - Disable AER completely (again) if power will be turned off
> > > >
> > > > v6:
> > > > v5:
> > > >  - Wording.
> > > >
> > > > v4:
> > > > v3:
> > > >  - No change.
> > > >
> > > > v2:
> > > >  - Only disable AER IRQ.
> > > >  - No more check on PME IRQ#.
> > > >  - Use helper.
> > > >
> > > >  drivers/pci/pcie/aer.c | 25 +++++++++++++++++++++++++
> > > >  1 file changed, 25 insertions(+)
> > > >
> > > > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > > > index ac6293c24976..bea7818c2d1b 100644
> > > > --- a/drivers/pci/pcie/aer.c
> > > > +++ b/drivers/pci/pcie/aer.c
> > > > @@ -28,6 +28,7 @@
> > > >  #include <linux/delay.h>
> > > >  #include <linux/kfifo.h>
> > > >  #include <linux/slab.h>
> > > > +#include <linux/suspend.h>
> > > >  #include <acpi/apei.h>
> > > >  #include <acpi/ghes.h>
> > > >  #include <ras/ras_event.h>
> > > > @@ -1497,6 +1498,28 @@ static int aer_probe(struct pcie_device *dev=
)
> > > >       return 0;
> > > >  }
> > > >
> > > > +static int aer_suspend(struct pcie_device *dev)
> > > > +{
> > > > +     struct aer_rpc *rpc =3D get_service_data(dev);
> > > > +     struct pci_dev *pdev =3D rpc->rpd;
> > > > +
> > > > +     if (pci_ancestor_pr3_present(pdev) || pm_suspend_via_firmware=
())
> > > > +             aer_disable_rootport(rpc);
> > >
> > > Why do we check pci_ancestor_pr3_present(pdev) and
> > > pm_suspend_via_firmware()?  I'm getting pretty convinced that we need
> > > to disable AER interrupts on suspend in general.  I think it will be
> > > better if we do that consistently on all platforms, not special cases
> > > based on details of how we suspend.
> >
> > Sure. Will change in next revision.
> >
> > > Also, why do we use aer_disable_rootport() instead of just
> > > aer_disable_irq()?  I think it's the interrupt that causes issues on
> > > suspend.  I see that there *were* some versions that used
> > > aer_disable_irq(), but I can't find the reason it changed.
> >
> > Interrupt can cause system wakeup, if it's shared with PME.
> >
> > The reason why aer_disable_rootport() is used over aer_disable_irq()
> > is that when the latter is used the error still gets logged during
> > sleep cycle. Once the pcieport driver resumes, it invokes
> > aer_root_reset() to reset the hierarchy, while the hierarchy hasn't
> > resumed yet.
> >
> > So use aer_disable_rootport() to prevent such issue from happening.
>
> I think the issue is more likely on the resume side.
>
> aer_disable_rootport() disables AER interrupts, then clears
> PCI_ERR_ROOT_STATUS, so the path looks like this:
>
>   aer_suspend
>     aer_disable_rootport
>       aer_disable_irq()
>       pci_write_config_dword(PCI_ERR_ROOT_STATUS)    # clear
>
> This happens during suspend, so at this point I think the link is
> still active and the spurious AER errors haven't happened yet and it
> probably doesn't matter that we clear PCI_ERR_ROOT_STATUS *here*.
>
> My guess is that what really matters is that we disable the AER
> interrupt so it doesn't happen during suspend, and then when we
> resume, we probably want to clear out the status registers before
> re-enabling the AER interrupt.

Thanks for catching this. Clearing status registers does the trick for
my cases here.

>
> In any event, I think we need to push this forward.  I'll post a v9
> based on this but dropping the pci_ancestor_pr3_present(pdev) and
> pm_suspend_via_firmware() tests so we do this unconditionally.

Thanks for the v9.

Kai-Heng

>
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int aer_resume(struct pcie_device *dev)
> > > > +{
> > > > +     struct aer_rpc *rpc =3D get_service_data(dev);
> > > > +     struct pci_dev *pdev =3D rpc->rpd;
> > > > +
> > > > +     if (pci_ancestor_pr3_present(pdev) || pm_resume_via_firmware(=
))
> > > > +             aer_enable_rootport(rpc);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > >  /**
> > > >   * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
> > > >   * @dev: pointer to Root Port, RCEC, or RCiEP
> > > > @@ -1561,6 +1584,8 @@ static struct pcie_port_service_driver aerdri=
ver =3D {
> > > >       .service        =3D PCIE_PORT_SERVICE_AER,
> > > >
> > > >       .probe          =3D aer_probe,
> > > > +     .suspend        =3D aer_suspend,
> > > > +     .resume         =3D aer_resume,
> > > >       .remove         =3D aer_remove,
> > > >  };
> > > >
> > > > --
> > > > 2.34.1
> > > >
