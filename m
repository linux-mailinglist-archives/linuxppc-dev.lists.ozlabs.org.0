Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B584F9401
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 13:27:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZbZ05FKdz3bcj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 21:27:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=Il4Hb1EW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=Il4Hb1EW; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZbYG6KqYz2x9G
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 21:26:25 +1000 (AEST)
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A01EA3F7F4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 11:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1649417178;
 bh=TlvQVB5MMhFkpcx7NoQ85ETd+2hV1Om6HXECryb4lPk=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=Il4Hb1EWNFpOBvNfE4li9XjVslw6C5FptiIJeoTrvUTKkJBpfkFdO9kLzpjA4/tA3
 QKAuNfYkFAqeL7/7R5NaxFPYuXj6wwpSG6MIza5T4bEz1caXyq94RL1ibqvNas+4CA
 FZSxq3vVpmBfI8OCD2vB6HQN952hHjz1hiNYGNieU/s0cKWX2pGC3qskeelxMtejo/
 RRczSP6AXy2XSirCT4bc86etHax59M7N7JVDkKRL3wR+tlUEg82dELMPaU76Ts45fV
 0Bto7+JahbPVXxGvbZfShIBTXlA24WtHH8SXGiNAo2RdQddKtFiNGDY1Dl6Ho7x8zH
 BTJzgkM4H8Wug==
Received: by mail-oo1-f70.google.com with SMTP id
 g18-20020a4a6b12000000b003246ed86f00so4510701ooc.23
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Apr 2022 04:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TlvQVB5MMhFkpcx7NoQ85ETd+2hV1Om6HXECryb4lPk=;
 b=TtdjbW5xEEDZIn/98xpP15BKA3zGMREmDnm509Tw/qEUANQOImfrZzpqa1Jr+R2tO3
 bF2P/9VRnhvOd0QXk7teVRTCo0UczYqsv2H9yj7oVzyUrrFB/OwWdZMwlNv6d/TGc8JM
 PA5f1syYjJIvZxkffuHRogaQB88uM6kBy3d0BJQGXizx3zi4azKkwCOsHHhElHDAQnrI
 YKx3CcKxYGGWpef7nOv1CEkplY2kjZwZ1PdazRtf/7eEru5ijbblxZRMK286G0kzC2+B
 BxjQlhPXF3Pam2FF+gIQ78LGOvCdE0zClsTPoB90r+I4x5lJ6lfNYCIqtw7WPgHCBPjk
 vzfg==
X-Gm-Message-State: AOAM531iV4aEp77N0Y0fR+ZQbgfbVX/VV7t8iQXZC3wdJlrdKvgMQaFE
 Ttngk/zpvcu1BabGAC0Knu4FfW4fTRLG7wjBqcE0hQARPm8OIHnE/vjsaAwzyALLuXxCrDZuOB3
 wYRKyU/0uVJ5J6Pl9B8Z89JhYU4L3V0M14T+8EkVWRhXES1xTILYlpyBxlHA=
X-Received: by 2002:a9d:6d89:0:b0:5cd:9c48:724c with SMTP id
 x9-20020a9d6d89000000b005cd9c48724cmr6420753otp.233.1649417177443; 
 Fri, 08 Apr 2022 04:26:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMsajOjzOFNsK+hzAS9FaCvNkmkgbhVptrmJvMFP6+orBrWU/UlP3Idkcq6MatULuM4ulcb5ZcQhwL//6oDPc=
X-Received: by 2002:a9d:6d89:0:b0:5cd:9c48:724c with SMTP id
 x9-20020a9d6d89000000b005cd9c48724cmr6420742otp.233.1649417177157; Fri, 08
 Apr 2022 04:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220329083130.817316-1-kai.heng.feng@canonical.com>
 <009c9c14-7669-9750-a787-1d220414423e@linux.intel.com>
In-Reply-To: <009c9c14-7669-9750-a787-1d220414423e@linux.intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 8 Apr 2022 19:26:06 +0800
Message-ID: <CAAd53p50sW8GsetxisisNXM3FTZf73GCPnRXAqYysckKzw_SqQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] PCI/AER: Disable AER service when link is in L2/L3
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, koba.ko@canonical.com,
 Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com,
 mika.westerberg@linux.intel.com, baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 31, 2022 at 3:40 AM Sathyanarayanan Kuppuswamy
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>
>
>
> On 3/29/22 1:31 AM, Kai-Heng Feng wrote:
> > On some Intel AlderLake platforms, Thunderbolt entering D3cold can cause
> > some errors reported by AER:
> > [   30.100211] pcieport 0000:00:1d.0: AER: Uncorrected (Non-Fatal) error received: 0000:00:1d.0
> > [   30.100251] pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Requester ID)
> > [   30.100256] pcieport 0000:00:1d.0:   device [8086:7ab0] error status/mask=00100000/00004000
> > [   30.100262] pcieport 0000:00:1d.0:    [20] UnsupReq               (First)
> > [   30.100267] pcieport 0000:00:1d.0: AER:   TLP Header: 34000000 08000052 00000000 00000000
> > [   30.100372] thunderbolt 0000:0a:00.0: AER: can't recover (no error_detected callback)
> > [   30.100401] xhci_hcd 0000:3e:00.0: AER: can't recover (no error_detected callback)
> > [   30.100427] pcieport 0000:00:1d.0: AER: device recovery failed
>
> Include details about in which platform you have seen it and whether
> this is a generic power issue?

_All_ Alder Lake platforms I worked on have this issue. I don't think
have hardware to analyze if it's a power issue though.

>
> >
> > So disable AER service to avoid the noises from turning power rails
> > on/off when the device is in low power states (D3hot and D3cold), as
> > PCIe spec "5.2 Link State Power Management" states that TLP and DLLP
>
> Also include PCIe specification version number.

Will add in next revision.

Kai-Heng

>
> > transmission is disabled for a Link in L2/L3 Ready (D3hot), L2 (D3cold
> > with aux power) and L3 (D3cold).
> >
> > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=215453
> > Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> > v3:
> >   - Remove reference to ACS.
> >   - Wording change.
> >
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
