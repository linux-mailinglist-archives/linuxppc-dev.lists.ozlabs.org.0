Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0434644CB58
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 22:37:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqJ8f6xDqz308G
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 08:37:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=swiecki.net header.i=@swiecki.net header.a=rsa-sha256 header.s=google header.b=BT8mtsii;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=swiecki.net (client-ip=2607:f8b0:4864:20::22c;
 helo=mail-oi1-x22c.google.com; envelope-from=robert@swiecki.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=swiecki.net header.i=@swiecki.net header.a=rsa-sha256
 header.s=google header.b=BT8mtsii; dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hq9cb0vMTz2xWt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 03:42:20 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id bk14so6322154oib.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 08:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swiecki.net; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H7hoGwWJnykyOW04HONpzk1mM5tsbdn8LVftPEXQKdQ=;
 b=BT8mtsiiqINuoDDAmo6vdWY1e8h1ko5qEt1PbcTIBNaZFn1DpT6ijehrEQkOX3MjDj
 qLkNL4BMHorAyNxhg9Fe/6g6Eia6nzuZmLzARCGsCRT7b6BDOstUOHROfey5a5ZpW0YE
 hra/OLlN7fxeD7ynN++DFNF4486LEcv3hVu70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H7hoGwWJnykyOW04HONpzk1mM5tsbdn8LVftPEXQKdQ=;
 b=MRf4agsK6OY4oqU6vFzTQ34zYZ5Ot5ByVmq+USGFEOSBZatqWsXUiADLbwo3kzlvRh
 Km4VEO5YWzSFkR9Of1C+fWL08IiZjg7pyjKIKc7pTdI54MD5jKYgWIrZEb/Filire+co
 TtQ3zr7H7+mB6tM8//Ge56yWLM+l2Np3Nur2d1qCDoS4Vq7B/rXI8faVGhUDleohs+Np
 QlLLu66QLMkatp5YbsVEcv9sReQIypW/CynjW2GJZuL48sHL9qaR4nk5k4DSi/RA/Lm/
 iEgrdvokBGXG7tmcQoYqTC/mofWNwQneNbM8PfRATj5EFLeQg2x4+lzw3yhHNnR0K9T4
 J+bw==
X-Gm-Message-State: AOAM533lPRNL9jsGhmpY2++gWa209iGIC303iayGpLTfPdVqyaZ4NRYt
 rw3gAOSZGm3pDSYlaZRctmnwfQvh8rvZX9o9eVJ6jA==
X-Google-Smtp-Source: ABdhPJxHHhtgU+Bhr9WOpU8WHUSBmqUhvLThAvCpG3Ve7RGaZhDbrfL8cmNUq4AZv6A5628GWedL6+IBaMnKIKm5fwA=
X-Received: by 2002:aca:d989:: with SMTP id q131mr382945oig.167.1636562536292; 
 Wed, 10 Nov 2021 08:42:16 -0800 (PST)
MIME-Version: 1.0
References: <ee3884db-da17-39e3-4010-bcc8f878e2f6@xenosoft.de>
 <20211109165848.GA1155989@bhelgaas> <YYr4x1xWfptXRmqt@rocinante>
 <CAK8P3a3fB7KmqWcaenn04WMps=jucV8wOZs=AZcNFHR+o+Bvyg@mail.gmail.com>
 <YYsB2DAtZjtNFVhZ@rocinante>
In-Reply-To: <YYsB2DAtZjtNFVhZ@rocinante>
From: =?UTF-8?B?Um9iZXJ0IMWad2nEmWNraQ==?= <robert@swiecki.net>
Date: Wed, 10 Nov 2021 17:42:05 +0100
Message-ID: <CAP145pjASrLsjgD-nnJWKj7W0i7Q9PJ4tTS2SzD7Qg6TO6Aa0A@mail.gmail.com>
Subject: Re: [PASEMI] Nemo board doesn't recognize any ATA disks with the
 pci-v5.16 updates
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 11 Nov 2021 08:35:52 +1100
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
Cc: Jens Axboe <axboe@kernel.dk>, Darren Stevens <darren@stevens-zone.net>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Arnd Bergmann <arnd@arndb.de>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "bhelgaas@google.com >> Bjorn Helgaas" <bhelgaas@google.com>,
 Bjorn Helgaas <helgaas@kernel.org>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <chzigotzky@xenosoft.de>, Olof Johansson <olof@lixom.net>,
 Matthew Leaman <matthew@a-eon.biz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> [+CC Adding Robert for visibility]
>
> Hi Arnd,
>
> Thank you looking at this!  Much appreciated.
>
> > > > You could attach the kernel config there, too, since it didn't make it
> > > > to the mailing list (vger may discard them -- see
> > > > http://vger.kernel.org/majordomo-info.html).
> > >
> > > Bjorn and I looked at which commits that went with a recent Pull Request
> > > from us might be causing this, but we are a little bit at loss, and were
> > > hoping that you could give us a hand in troubleshooting this.
> >
> > For reference, these are the patches in that branch that touch any
> > interesting files,
> > as most of the contents are for pci-controller drivers that are not used on
> > powerpc at all:
> >
> > $ git log --no-merges --oneline 512b7931ad05..dda4b381f05d
> > arch/powerpc/ drivers/of/  drivers/pci/*.[ch]  include/linux/
> > acd61ffb2f16 PCI: Add ACS quirk for Pericom PI7C9X2G switches
> > 978fd0056e19 PCI: of: Allow matching of an interrupt-map local to a PCI device
> > 041284181226 of/irq: Allow matching of an interrupt-map local to an
> > interrupt controller
> > 0ab8d0f6ae3f irqdomain: Make of_phandle_args_to_fwspec() generally available
> > 5ec0a6fcb60e PCI: Do not enable AtomicOps on VFs
> > 7a41ae80bdcb PCI: pci-bridge-emul: Fix emulation of W1C bits
> > fd1ae23b495b PCI: Prefer 'unsigned int' over bare 'unsigned'
> > ff5d3bb6e16d PCI: Remove redundant 'rc' initialization
> > 3331325c6347 PCI/VPD: Use pci_read_vpd_any() in pci_vpd_size()
> > e1b0d0bb2032 PCI: Re-enable Downstream Port LTR after reset or hotplug
> > ac8e3cef588c PCI/sysfs: Explicitly show first MSI IRQ for 'irq'
> > 88dee3b0efe4 PCI: Remove unused pci_pool wrappers
> > b5f9c644eb1b PCI: Remove struct pci_dev->driver
> > 2a4d9408c9e8 PCI: Use to_pci_driver() instead of pci_dev->driver
> > 4141127c44a9 powerpc/eeh: Use to_pci_driver() instead of pci_dev->driver
> > f9a6c8ad4922 PCI/ERR: Reduce compile time for CONFIG_PCIEAER=n
> > 43e85554d4ed xen/pcifront: Use to_pci_driver() instead of pci_dev->driver
> > 34ab316d7287 xen/pcifront: Drop pcifront_common_process() tests of pcidev, pdrv
> > 9f37ab0412eb PCI/switchtec: Add check of event support
> > 5a72431ec318 powerpc/eeh: Use dev_driver_string() instead of struct
> > pci_dev->driver->name
> > ae232f0970ea PCI: Drop pci_device_probe() test of !pci_dev->driver
> > 097d9d414433 PCI: Drop pci_device_remove() test of pci_dev->driver
> > 8e9028b3790d PCI: Return NULL for to_pci_driver(NULL)
> > 357df2fc0066 PCI: Use unsigned to match sscanf("%x") in pci_dev_str_match_path()
> > bf2928c7a284 PCI/VPD: Add pci_read/write_vpd_any()
> > b2105b9f39b5 PCI: Correct misspelled and remove duplicated words
> > 7c3855c423b1 PCI: Coalesce host bridge contiguous apertures
> > e0f7b1922358 PCI: Use kstrtobool() directly, sans strtobool() wrapper
> > 36f354ec7bf9 PCI/sysfs: Return -EINVAL consistently from "store" functions
> > 95e83e219d68 PCI/sysfs: Check CAP_SYS_ADMIN before parsing user input
> > af9d82626c8f PCI/ACPI: Remove OSC_PCI_SUPPORT_MASKS and OSC_PCI_CONTROL_MASKS
> > 9a0a1417d3bb PCI: Tidy comments
> > 06dc660e6eb8 PCI: Rename pcibios_add_device() to pcibios_device_add()
> > e3f4bd3462f6 PCI: Mark Atheros QCA6174 to avoid bus reset
> > 3a19407913e8 PCI/P2PDMA: Apply bus offset correctly in DMA address calculation
> >
> > Out of these, I agree that most of them seem harmless, these would
> > be the ones I'd try to look at more closely, or maybe revert for testing:
> >
> > 978fd0056e19 PCI: of: Allow matching of an interrupt-map local to a PCI device
> > 041284181226 of/irq: Allow matching of an interrupt-map local to an
> > interrupt controller
> > e1b0d0bb2032 PCI: Re-enable Downstream Port LTR after reset or hotplug
> > 7c3855c423b1 PCI: Coalesce host bridge contiguous apertures
> > 3a19407913e8 PCI/P2PDMA: Apply bus offset correctly in DMA address calculation
>
> Robert would you be able build a kernel without the patches Arnd singled
> out as potential curlprits?  Might be expidite some troubleshooting saving
> a lot of time doing bisect.
>
> I wonder if this will help you with the following problem:
>   https://lore.kernel.org/linux-pci/CAP145pjO9zdGgutHP=of0H+L1=nSz097zf73i7ZYm2-NWuwHhQ@mail.gmail.com/

Thanks.

I tried removing all of those (latest 5), and I had Windows/qemu boot
hangs with all of them removed.

But I cannot say for sure, because I did quite a mess with my
kernel/qemu setup, but with this code
https://github.com/torvalds/linux/commit/cb690f5238d71f543f4ce874aa59237cf53a877c
and with patch https://lkml.org/lkml/2021/11/9/836 my qemu/Win11 seems
to be booting again (even if dmesg is filled with pci-related errors
around initialization timeouts)

I think I'll try to concentrate on helping with the pic code in this
thread: https://lkml.org/lkml/2021/11/10/684 - and once it works well
with the host kernel, I'll try to figure out whether anything still
troubles the vfio/kvm code.

PS: I assumed you asked me to test it wrt my troubles with qemu/vfio/kvm/Win11.
