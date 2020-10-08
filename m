Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C03A1286CBA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 04:25:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6FR926WpzDqSG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 13:25:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d41;
 helo=mail-io1-xd41.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MrTISALN; dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6FPh5rjRzDqRc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 13:23:52 +1100 (AEDT)
Received: by mail-io1-xd41.google.com with SMTP id 67so4652960iob.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Oct 2020 19:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=INuLJfBeUmEH0uw1bq9WIrK5i8dKmvSaFB92Q9UojBM=;
 b=MrTISALNzlXJ3QturtANcCCaH81gaQRCvQaKmxGXiT1m7ZQDBPIYxg9XvvMH6q6VzC
 eYN2wQQ24Q5uhbPjRvNNbGVkjUtSwUAfp5RBGdGK5on6rFkHH6tzET+iGK81n9gL6RWG
 Fby/zu30BO2aiHkUx4/tObTTfJ9Nsv3EzNmBEamA0C/kCaSpplFFWbPi2R8QmLS/rEe+
 NSxO49PFtRdAJFJ70oFbmMVsgy2GK6GlRSI4RY8dEiC+YiLwgFI6eiYjmFTEpi1lllBZ
 scXqdVXjNulHWr4KPdJuWW7kzhTTc5DE1maMVfseZ6F5pvNUeAAA3Z7tP96xsQ2S/evT
 fUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=INuLJfBeUmEH0uw1bq9WIrK5i8dKmvSaFB92Q9UojBM=;
 b=PslnnocQOyyO8RQCvkxYmOM5aMm3Y0bpbW4NEJtqstLR+4pAsA3dAcwf8vK+Z6wMp4
 aMuVwRhBBh1ARh/F/DOtAZNgzx5GUBnW4MxTjNjQ8SLKUCgfXpLfCC0w9IT51geDctut
 KOdjYX8kHt5Pr11wNdHmuPTqjHhkiTzzvh6NU62yFs7+R/uClIBTgM+kzKtaAWCtzO5H
 zFOJRh7J7x4UajNMNrIpirmlWS8x/Dtcs8eBbnIPz7U50mX2x93TbfM0zAPn0qH2e6+z
 HblLSOfeNacKZB9O8zE5DCIIvdccOH9qaFxmBDgVlxGk2xQPUBwgQ1Io+69DYxIqjtTQ
 Dyvg==
X-Gm-Message-State: AOAM532Fy89y8oSu+b8iDlw1Z1BkqSnDQS2r8EpLh6CkPVhENFgLvQ+E
 nGjRF2OPkYecv6veQZ7FywP3MVOsV/aLt/lMS9U=
X-Google-Smtp-Source: ABdhPJwF6c8p7byaDZ5CZ7geEmWRHlc118O6oGWP7oHgpK6Pe3PVCKbbt6qqxjFcqUyRy/3SySScPNlFxuN3oRTjWME=
X-Received: by 2002:a6b:5907:: with SMTP id n7mr4451249iob.75.1602123828699;
 Wed, 07 Oct 2020 19:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200925092258.525079-1-clg@kaod.org>
In-Reply-To: <20200925092258.525079-1-clg@kaod.org>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 8 Oct 2020 13:23:37 +1100
Message-ID: <CAOSf1CGW7ocYm2BXFiy9Nmi+G+xwVcqQzTqPo_nss_tmpG_V=w@mail.gmail.com>
Subject: Re: [PATCH] powerpc/pci: Fix PHB removal/rescan on PowerNV
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-pci <linux-pci@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 25, 2020 at 7:23 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> To fix an issue with PHB hotplug on pSeries machine (HPT/XIVE), commit
> 3a3181e16fbd introduced a PPC specific pcibios_remove_bus() routine to
> clear all interrupt mappings when the bus is removed. This routine
> frees an array allocated in pcibios_scan_phb().
>
> This broke PHB hotplug on PowerNV because, when a PHB is removed and
> re-scanned through sysfs, the PCI layer un-assigns and re-assigns
> resources to the PHB but does not destroy and recreate the PCI
> controller structure. Since pcibios_remove_bus() does not clear the
> 'irq_map' array pointer, a second removal of the PHB will try to free
> the array a second time and corrupt memory.

"PHB hotplug" and "hot-plugging devices under a PHB" are different
things. What you're saying here doesn't make a whole lot of sense to
me unless you're conflating the two. The distinction is important
since on pseries we can use DLPAR to add and remove actual PHBs (i.e.
the pci_controller) at runtime, but there's no corresponding mechanism
on PowerNV.

> Free the 'irq_map' array in pcibios_free_controller() to fix
> corruption and clear interrupt mapping after it has been
> disposed. This to avoid filling up the array with successive
> remove/rescan of a bus.

Even with this patch I think we're still broken. With this patch
applied the init path is something like:

per-phb init:
    allocate phb->irq_map array
per-bus init:
    nothing
per-device init:
    pcibios_bus_add_device()
       pci_read_irq_line()
            pci_irq_map_register(pci_dev, virq)
               *record the device's interrupt in phb->irq_map*

And the teardown path:

per-device teardown:
    nothing
per-bus teardown:
    pcibios_remove_bus()
        pci_irq_map_dispose()
            *walk phb->irq_map and dispose of each mapped interrupt*
per-phb teardown:
    free(phb->irq_map)

There's a lot of asymmetry here, which is a problem in itself, but the
real issue is that when removing *any* pci_bus under a PHB we dispose
of the LSI\ for *every* device under that PHB. Not good.

Ideally we should be fixing this by having the per-device teardown
handle disposing the mapping. Unfortunately, there's no pcibios hook
that's called when removing a pci_dev. However, we can register a bus
notifier which will be called when the pci_dev is removed from its bus
and we already do that for the per-device EEH teardown and to handle
IOMMU TCE invalidation when the device is removed.
