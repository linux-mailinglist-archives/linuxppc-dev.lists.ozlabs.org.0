Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C234E1F17
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 03:39:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMJjn0T3Fz3bVQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 13:39:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=CXFSfgUg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=CXFSfgUg; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMJj15fYQz2xgY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 13:39:00 +1100 (AEDT)
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AE5423F221
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 02:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647830333;
 bh=iHeI4Li4UlP93b9NJtNDxcZHhK1vAIlk+zBGGpgqVZ0=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=CXFSfgUgCA8HirlNhMTnJCBYNDlNh3ndcBk+kazmb0ibjJreAry3O+hCKsBCQnm4Y
 zX5S1xlfKnO4VGiiI9hEnKK/8YYba3l3JjRXfsP4Hgik/JLY88L672QQ5ISjuq95MM
 YCIewe+9lczEoiPvju8WmH9ywyUlJyZVCyehJWwyjTPriKrKKtpvDpRI7XIRYHgiBQ
 ZfXyPRSLZg2K/pzngSoTA7b4PtMJMS8fp9+b+70pSYLWyP+HCTbCDq5LMojuxXSFnm
 LyzR+zPmMTVKQqz9hBKRKnCevY6POCAehuLQXZB1dNmZ5Qe5q1DQwSy8GnB14Soyfr
 Q7Y0JJMzAKEHQ==
Received: by mail-oo1-f71.google.com with SMTP id
 o68-20020a4a4447000000b003210ddc07a2so8917863ooa.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Mar 2022 19:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iHeI4Li4UlP93b9NJtNDxcZHhK1vAIlk+zBGGpgqVZ0=;
 b=irFYVDpjFBhKJAu/vqrqlztPciMM7eaqpi4Bv1OSvFLtQ4m8XAVxoD+sEQb3lhdOk8
 k87gyTF59bhBCDrsK3I7D8ESmX8m24o9h1XkYby16jZA+2nRWcIigI/x1tjHpUwFglJA
 Sf/8lMTxGSWNVthWdz4Mr5WQutjA094S+lrHys0Jfgfska067Pjxzo13wsn3Gmx5le72
 ywdhw3GotsLagMaXp3iQCMQtrUH6J3ostH03NomXFVsG+8XXd+jNRjJix/W/JpqX8AvL
 fvYLYzUDilSNUaVLs6/y3EH6bhixmRQkA1SYejh7y6xdeELVfm71vNu4RBLtF/ZWRXHl
 leHA==
X-Gm-Message-State: AOAM533CTWhob0RPXr2TTxrfohzfi1Y3vwrHYhRh6bQP48ZJunmvQkhZ
 k6aWsHNyBAl0jAcwZKfMDQmDO7g9ATrppB0O0O9n97tBd0DnI5GAIoO3Znxq8MsaCVbb3czGQhL
 rByOrwMpE1JircHuUlxCFzptgLLIMC0RmJngIGTLmlqRJRxv91Av4UV6hKyM=
X-Received: by 2002:a05:6808:1a97:b0:2ec:a246:ad01 with SMTP id
 bm23-20020a0568081a9700b002eca246ad01mr12887366oib.54.1647830330726; 
 Sun, 20 Mar 2022 19:38:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjDOKXSViaQfhEChkSFuWe9zr8ywxKQSBCSo0Be72wPBCEEfWDVVovfp/J+gN4VMKEQCAGYLCs/0mFC/qTjVg=
X-Received: by 2002:a05:6808:1a97:b0:2ec:a246:ad01 with SMTP id
 bm23-20020a0568081a9700b002eca246ad01mr12887355oib.54.1647830330410; Sun, 20
 Mar 2022 19:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220127025418.1989642-1-kai.heng.feng@canonical.com>
 <427f19c6-32f0-684e-5fdd-2e5ed192b71d@linux.intel.com>
In-Reply-To: <427f19c6-32f0-684e-5fdd-2e5ed192b71d@linux.intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Mon, 21 Mar 2022 10:38:39 +0800
Message-ID: <CAAd53p6ZrFNhtKk=9wz8SF68jBuNajKgOzZFgHgKgd57Zp3pHg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] PCI/AER: Disable AER service when link is in L2/L3
 ready, L2 and L3 state
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Joerg Roedel <jroedel@suse.de>,
 Lalithambika Krishnakumar <lalithambika.krishnakumar@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, koba.ko@canonical.com,
 Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com,
 mika.westerberg@linux.intel.com, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 20, 2022 at 4:38 AM Sathyanarayanan Kuppuswamy
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>
>
>
> On 1/26/22 6:54 PM, Kai-Heng Feng wrote:
> > Commit 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in
> > hint") enables ACS, and some platforms lose its NVMe after resume from
>
> Why enabling ACS makes platform lose NVMe? Can you add more details
> about the problem?

I don't have a hardware analyzer, so the only detail I can provide is
the symptom.
I believe the affected system was sent Intel, and there wasn't any
feedback since then.

>
> > S3:
> > [   50.947816] pcieport 0000:00:1b.0: DPC: containment event, status:0x1f01 source:0x0000
> > [   50.947817] pcieport 0000:00:1b.0: DPC: unmasked uncorrectable error detected
> > [   50.947829] pcieport 0000:00:1b.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Receiver ID)
> > [   50.947830] pcieport 0000:00:1b.0:   device [8086:06ac] error status/mask=00200000/00010000
> > [   50.947831] pcieport 0000:00:1b.0:    [21] ACSViol                (First)
> > [   50.947841] pcieport 0000:00:1b.0: AER: broadcast error_detected message
> > [   50.947843] nvme nvme0: frozen state error detected, reset controller
> >
> > It happens right after ACS gets enabled during resume.
> >
> > There's another case, when Thunderbolt reaches D3cold:
> > [   30.100211] pcieport 0000:00:1d.0: AER: Uncorrected (Non-Fatal) error received: 0000:00:1d.0
> > [   30.100251] pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Requester ID)
> > [   30.100256] pcieport 0000:00:1d.0:   device [8086:7ab0] error status/mask=00100000/00004000
> > [   30.100262] pcieport 0000:00:1d.0:    [20] UnsupReq               (First)
> > [   30.100267] pcieport 0000:00:1d.0: AER:   TLP Header: 34000000 08000052 00000000 00000000
> > [   30.100372] thunderbolt 0000:0a:00.0: AER: can't recover (no error_detected callback)
>
> no callback message means one or more devices in the given port does not
> support error handler. How is this related to ACS?

This case is about D3cold, not related to ACS.
And no error_detected is just part of the message. The whole AER
message is more important.

Kai-Heng

>
> > [   30.100401] xhci_hcd 0000:3e:00.0: AER: can't recover (no error_detected callback)
> > [   30.100427] pcieport 0000:00:1d.0: AER: device recovery failed
> >
> > So disable AER service to avoid the noises from turning power rails
> > on/off when the device is in low power states (D3hot and D3cold), as
> > PCIe spec "5.2 Link State Power Management" states that TLP and DLLP
> > transmission is disabled for a Link in L2/L3 Ready (D3hot), L2 (D3cold
> > with aux power) and L3 (D3cold).
> >
> > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=209149
> > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=215453
> > Fixes: 50310600ebda ("iommu/vt-d: Enable PCI ACS for platform opt in hint")
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> > v2:
> >   - Wording change.
> >
> >   drivers/pci/pcie/aer.c | 31 +++++++++++++++++++++++++------
> >   1 file changed, 25 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index 9fa1f97e5b270..e4e9d4a3098d7 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -1367,6 +1367,22 @@ static int aer_probe(struct pcie_device *dev)
> >       return 0;
> >   }
> >
> > +static int aer_suspend(struct pcie_device *dev)
> > +{
> > +     struct aer_rpc *rpc = get_service_data(dev);
> > +
> > +     aer_disable_rootport(rpc);
> > +     return 0;
> > +}
> > +
> > +static int aer_resume(struct pcie_device *dev)
> > +{
> > +     struct aer_rpc *rpc = get_service_data(dev);
> > +
> > +     aer_enable_rootport(rpc);
> > +     return 0;
> > +}
> > +
> >   /**
> >    * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
> >    * @dev: pointer to Root Port, RCEC, or RCiEP
> > @@ -1433,12 +1449,15 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
> >   }
> >
> >   static struct pcie_port_service_driver aerdriver = {
> > -     .name           = "aer",
> > -     .port_type      = PCIE_ANY_PORT,
> > -     .service        = PCIE_PORT_SERVICE_AER,
> > -
> > -     .probe          = aer_probe,
> > -     .remove         = aer_remove,
> > +     .name                   = "aer",
> > +     .port_type              = PCIE_ANY_PORT,
> > +     .service                = PCIE_PORT_SERVICE_AER,
> > +     .probe                  = aer_probe,
> > +     .suspend                = aer_suspend,
> > +     .resume                 = aer_resume,
> > +     .runtime_suspend        = aer_suspend,
> > +     .runtime_resume         = aer_resume,
> > +     .remove                 = aer_remove,
> >   };
> >
> >   /**
>
> --
> Sathyanarayanan Kuppuswamy
> Linux Kernel Developer
