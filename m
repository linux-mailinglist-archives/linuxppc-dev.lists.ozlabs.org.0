Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED5744B94F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 00:19:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpkT06kN6z3c8K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 10:19:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.43; helo=mail-lf1-f43.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpkSb3d2Jz2xrP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 10:18:53 +1100 (AEDT)
Received: by mail-lf1-f43.google.com with SMTP id b40so1284862lfv.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Nov 2021 15:18:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VFbCYoW2k14ujyRjhwvBQhyyxpM93sVrLiDw2UhKfw8=;
 b=sHs1MVlSwGZybq7ReWMr5kdjNtaPNEDNyAu8vBKeZXPIU5r4FNPmZRELAL95xwURo2
 6ekXAtqO8IdaC6c2wpcxHIQRodeuz3RtCDGsAow2pQFb2Y8G7fIQsDbbJNsbq2Yf4K0U
 +44LgPfoX8RnqHz3Ts+xluKjrPaRqHSvSjeo515WL8p+LxYWOVDzJ1rYCNxpk/aqT+jK
 +vuCsM0eJyA8d7e91eIZfyXjQCMhAkIvH50Y+VPjnCpnfqZnjYHAEoM2pT3/OW0pVt5v
 55Qcq2e3F6YO/+d/dzXiWRK/0Gr8nUYzybJTTyRlsguny+pehCJ3vTN7vLrzslEbnmge
 qZJQ==
X-Gm-Message-State: AOAM5309TnnIEZsKGlF9lSze0mVBW3KaOXnbUn3M/VtV+QPPJNvhFFUC
 vB3ddHDHeU9wIs7CD4K4+ac=
X-Google-Smtp-Source: ABdhPJxt4wxqAd7VAEgHeF41O8ZXqCLkf7xfsed9Ueie6c2jeIXgp4qyNTFJ+ek2OrEqppcNv8aWKg==
X-Received: by 2002:ac2:5ddb:: with SMTP id x27mr10455549lfq.595.1636499929937; 
 Tue, 09 Nov 2021 15:18:49 -0800 (PST)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id h1sm640831lfp.249.2021.11.09.15.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 15:18:49 -0800 (PST)
Date: Wed, 10 Nov 2021 00:18:48 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PASEMI] Nemo board doesn't recognize any ATA disks with the
 pci-v5.16 updates
Message-ID: <YYsB2DAtZjtNFVhZ@rocinante>
References: <ee3884db-da17-39e3-4010-bcc8f878e2f6@xenosoft.de>
 <20211109165848.GA1155989@bhelgaas> <YYr4x1xWfptXRmqt@rocinante>
 <CAK8P3a3fB7KmqWcaenn04WMps=jucV8wOZs=AZcNFHR+o+Bvyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a3fB7KmqWcaenn04WMps=jucV8wOZs=AZcNFHR+o+Bvyg@mail.gmail.com>
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
 "R.T.Dickinson" <rtd2@xtra.co.nz>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "bhelgaas@google.com >> Bjorn Helgaas" <bhelgaas@google.com>,
 Bjorn Helgaas <helgaas@kernel.org>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <chzigotzky@xenosoft.de>, Olof Johansson <olof@lixom.net>,
 Matthew Leaman <matthew@a-eon.biz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Robert =?utf-8?B?xZp3acSZY2tp?= <robert@swiecki.net>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+CC Adding Robert for visibility]

Hi Arnd,

Thank you looking at this!  Much appreciated.

> > > You could attach the kernel config there, too, since it didn't make it
> > > to the mailing list (vger may discard them -- see
> > > http://vger.kernel.org/majordomo-info.html).
> >
> > Bjorn and I looked at which commits that went with a recent Pull Request
> > from us might be causing this, but we are a little bit at loss, and were
> > hoping that you could give us a hand in troubleshooting this.
> 
> For reference, these are the patches in that branch that touch any
> interesting files,
> as most of the contents are for pci-controller drivers that are not used on
> powerpc at all:
> 
> $ git log --no-merges --oneline 512b7931ad05..dda4b381f05d
> arch/powerpc/ drivers/of/  drivers/pci/*.[ch]  include/linux/
> acd61ffb2f16 PCI: Add ACS quirk for Pericom PI7C9X2G switches
> 978fd0056e19 PCI: of: Allow matching of an interrupt-map local to a PCI device
> 041284181226 of/irq: Allow matching of an interrupt-map local to an
> interrupt controller
> 0ab8d0f6ae3f irqdomain: Make of_phandle_args_to_fwspec() generally available
> 5ec0a6fcb60e PCI: Do not enable AtomicOps on VFs
> 7a41ae80bdcb PCI: pci-bridge-emul: Fix emulation of W1C bits
> fd1ae23b495b PCI: Prefer 'unsigned int' over bare 'unsigned'
> ff5d3bb6e16d PCI: Remove redundant 'rc' initialization
> 3331325c6347 PCI/VPD: Use pci_read_vpd_any() in pci_vpd_size()
> e1b0d0bb2032 PCI: Re-enable Downstream Port LTR after reset or hotplug
> ac8e3cef588c PCI/sysfs: Explicitly show first MSI IRQ for 'irq'
> 88dee3b0efe4 PCI: Remove unused pci_pool wrappers
> b5f9c644eb1b PCI: Remove struct pci_dev->driver
> 2a4d9408c9e8 PCI: Use to_pci_driver() instead of pci_dev->driver
> 4141127c44a9 powerpc/eeh: Use to_pci_driver() instead of pci_dev->driver
> f9a6c8ad4922 PCI/ERR: Reduce compile time for CONFIG_PCIEAER=n
> 43e85554d4ed xen/pcifront: Use to_pci_driver() instead of pci_dev->driver
> 34ab316d7287 xen/pcifront: Drop pcifront_common_process() tests of pcidev, pdrv
> 9f37ab0412eb PCI/switchtec: Add check of event support
> 5a72431ec318 powerpc/eeh: Use dev_driver_string() instead of struct
> pci_dev->driver->name
> ae232f0970ea PCI: Drop pci_device_probe() test of !pci_dev->driver
> 097d9d414433 PCI: Drop pci_device_remove() test of pci_dev->driver
> 8e9028b3790d PCI: Return NULL for to_pci_driver(NULL)
> 357df2fc0066 PCI: Use unsigned to match sscanf("%x") in pci_dev_str_match_path()
> bf2928c7a284 PCI/VPD: Add pci_read/write_vpd_any()
> b2105b9f39b5 PCI: Correct misspelled and remove duplicated words
> 7c3855c423b1 PCI: Coalesce host bridge contiguous apertures
> e0f7b1922358 PCI: Use kstrtobool() directly, sans strtobool() wrapper
> 36f354ec7bf9 PCI/sysfs: Return -EINVAL consistently from "store" functions
> 95e83e219d68 PCI/sysfs: Check CAP_SYS_ADMIN before parsing user input
> af9d82626c8f PCI/ACPI: Remove OSC_PCI_SUPPORT_MASKS and OSC_PCI_CONTROL_MASKS
> 9a0a1417d3bb PCI: Tidy comments
> 06dc660e6eb8 PCI: Rename pcibios_add_device() to pcibios_device_add()
> e3f4bd3462f6 PCI: Mark Atheros QCA6174 to avoid bus reset
> 3a19407913e8 PCI/P2PDMA: Apply bus offset correctly in DMA address calculation
> 
> Out of these, I agree that most of them seem harmless, these would
> be the ones I'd try to look at more closely, or maybe revert for testing:
> 
> 978fd0056e19 PCI: of: Allow matching of an interrupt-map local to a PCI device
> 041284181226 of/irq: Allow matching of an interrupt-map local to an
> interrupt controller
> e1b0d0bb2032 PCI: Re-enable Downstream Port LTR after reset or hotplug
> 7c3855c423b1 PCI: Coalesce host bridge contiguous apertures
> 3a19407913e8 PCI/P2PDMA: Apply bus offset correctly in DMA address calculation

Robert would you be able build a kernel without the patches Arnd singled
out as potential curlprits?  Might be expidite some troubleshooting saving
a lot of time doing bisect.

I wonder if this will help you with the following problem:
  https://lore.kernel.org/linux-pci/CAP145pjO9zdGgutHP=of0H+L1=nSz097zf73i7ZYm2-NWuwHhQ@mail.gmail.com/

	Krzysztof
