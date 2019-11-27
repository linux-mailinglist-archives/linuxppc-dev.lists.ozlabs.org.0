Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D81C910ACF0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 10:54:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NGM66GRDzDqmh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 20:54:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::141;
 helo=mail-il1-x141.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pHqYpy5+"; 
 dkim-atps=neutral
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NGHp1c5mzDqkw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 20:51:17 +1100 (AEDT)
Received: by mail-il1-x141.google.com with SMTP id t9so826457iln.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 01:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pvfoNFwf0w3pfIKk3mN+ISE/mTmhnDldKi+aqu60kQU=;
 b=pHqYpy5+8tIRAqyR/EWJOxw7sZH3aGQ/Qr1ZFY9RshLuBX+nQMSLFvo50ot0XfevNw
 HqaIfaKGvdkdmaHSEY1GKobAttXtwftyQdRUoy8Ju4iLdjVZ9eCh7S4+7yYjrv6NAxae
 DjY9oKPML6A8vMUe9r+/CidRom+2q0UKma1mGMOSz67GxbunLYyBZZyBjbTKj57WewYH
 THEfD8f5/5+Z+IoQw+/A7PGzYDczRVJJalChmT2lsRAcbxGmp0/WsDwRRwizjIJlLOFr
 nzqgBaebOFVquvw8J+uMsIcl6sHGL6o2I/5C4lD9PKc7HcoE/5CSJ2kurG/CigId0nIO
 9WwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pvfoNFwf0w3pfIKk3mN+ISE/mTmhnDldKi+aqu60kQU=;
 b=kAQhT2NmtmH1Snqd5S2jJKnSz16fIY/aOhTvQ14oSJJkyRXaM1XQ53RiG47WlXCHwZ
 my8M7lcIegm3lMGLsybjJiI4jKoq4y3GqBIkvTrOd7w+6C12x0v5mcAKdujP/tVwJ4Au
 +vsMtHYrmWC8EdCcs9/Kigstd5oqoazhEvokNkOhsgZp7sGt2r0uYyhIArgoV3rZAHV+
 do1upcoPrvTpFIYyRcr0Ps5VyinaA2+7XPSpBZ7XDASayPGaBj6FyHBXSAFsNh0TaRoT
 Gbz+Srs4FMNpA7hGYxbJcmq56jGhScjI2hXIqkuVd1Ed3DgWyk52rjAdRFCUPUkwUdgs
 /sCw==
X-Gm-Message-State: APjAAAUC+4iiYPAVMK1wfac6G9sOx6mv5TMX1deV36QGJPv79hmaV4SM
 WqPku4uiD5/PByRLoYlPNq2Xk0Njv8RD1jvTg7Q=
X-Google-Smtp-Source: APXvYqw7ZU4rXdGQKvGnnGjbwLS5dtkQE5Htv9oueneo1Sjl7tnRezlePKOxhEJ9QUTRKmXC+XI9NeJvHbPV+YBcJcU=
X-Received: by 2002:a05:6e02:152:: with SMTP id
 j18mr45724573ilr.293.1574848274259; 
 Wed, 27 Nov 2019 01:51:14 -0800 (PST)
MIME-Version: 1.0
References: <20191120012859.23300-1-oohall@gmail.com>
 <20191120012859.23300-36-oohall@gmail.com>
 <a81b18a4-328f-70ba-027c-ef2e8c2d93a8@ozlabs.ru>
In-Reply-To: <a81b18a4-328f-70ba-027c-ef2e8c2d93a8@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 27 Nov 2019 20:51:03 +1100
Message-ID: <CAOSf1CHYGD3mRh2BKPYjUXCC87BjUwKf_+J1P3=keJDsTOmtXg@mail.gmail.com>
Subject: Re: [Very RFC 35/46] powernv/pci: Remove open-coded PE lookup in
 pnv_pci_release_device
To: Alexey Kardashevskiy <aik@ozlabs.ru>
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
Cc: Alistair Popple <alistair@popple.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 27, 2019 at 4:24 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
>
>
> On 20/11/2019 12:28, Oliver O'Halloran wrote:
> > Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> > ---
> >  arch/powerpc/platforms/powernv/pci-ioda.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> > index 4f38652c7cd7..8525642b1256 100644
> > --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> > +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> > @@ -3562,14 +3562,14 @@ static void pnv_ioda_release_pe(struct pnv_ioda_pe *pe)
> >  static void pnv_pci_release_device(struct pci_dev *pdev)
> >  {
> >       struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
> > +     struct pnv_ioda_pe *pe = pnv_ioda_get_pe(pdev);
> >       struct pci_dn *pdn = pci_get_pdn(pdev);
> > -     struct pnv_ioda_pe *pe;
> >
> >       /* The VF PE state is torn down when sriov_disable() is called */
> >       if (pdev->is_virtfn)
> >               return;
> >
> > -     if (!pdn || pdn->pe_number == IODA_INVALID_PE)
> > +     if (WARN_ON(!pe))
>
>
> Is that WARN_ON because there is always a PE - from upstream bridge or a

The device should always belong to a PE. If it doesn't (at this point)
then something deeply strange has happened.

> reserved one?

If it's associated with the reserved PE the rmap is set to
IODA_PE_INVALID, so would return NULL and we'd hit the WARN_ON(). I
think that's ok though since PE assignment should always succeed. If
it failed, or we're tearing down the device before we got to the point
of assigning a PE then there's probably a bug.
