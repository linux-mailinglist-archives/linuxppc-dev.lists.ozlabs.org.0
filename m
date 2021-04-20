Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 772E836622F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 00:35:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPz5w2lZWz3019
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 08:35:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UAQY+BL1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UAQY+BL1; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPz5R294sz2xYb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 08:34:51 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 40AC761404
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 22:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618958088;
 bh=mOdMYZl26/NOZWPNIO9NmvmkA7iXHbO5ZbM5OlOhJyM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UAQY+BL1k7rdXPpPvgQJgrM8geVQzuys0slJrTAdT7UuqrUiOBVtqFrBW+ElljARL
 yvNlamYTz7mTbZZ7HYf27F3FFL9cRKUw4w0W72LQtOEzh4LdCvJN21TLhwK6s6SipP
 ONsy/FmdBUEAceLTfZkYuT9ts4sg+nmeTAZEBtFqUyRU1NpKHCnXWb9XsKC6VjVPE4
 apnsh022cPpsuUndcYBm8GrzZYzvVT+fHeUGjFfsfK27xwdC0AA3+o6S6YH6qTDnEG
 F/kV3G2E5ZUs8FDEeUVOYEXMhrNQhgumVLOsJOrd9sT9hbMyJmtedJ+5Mborxx3yj3
 6F3umTtEVmxpw==
Received: by mail-qk1-f169.google.com with SMTP id x11so41063137qkp.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 15:34:48 -0700 (PDT)
X-Gm-Message-State: AOAM531JbrgnBbYCkYkIHf3xHa6CHJTsAWHUt7p9TF5+zI3TTKg1UAzl
 NasEdEzBhRMltt89pUg6/O9DXniVEcCSDnVYng==
X-Google-Smtp-Source: ABdhPJy10+HqQKmcie6cSAKhZUBGN3k1UWCcvqC9FDITLEQDDTu1Rf0nYi5UC6N88wAkUE0CAVsmU4z6sgJ4wuehLfA=
X-Received: by 2002:a05:620a:1642:: with SMTP id
 c2mr13807588qko.311.1618958087193; 
 Tue, 20 Apr 2021 15:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210415180050.373791-1-leobras.c@gmail.com>
 <CAL_Jsq+WwAeziGN4EfPAWfA0fieAjfcxfi29=StOx0GeKjAe_g@mail.gmail.com>
 <7b089cd48b90f2445c7cb80da1ce8638607c46fc.camel@gmail.com>
 <CAL_Jsq+m6CkGj_NYGvwxoKwoQ4PkEu6hfGdMTT3i4APoHSkNeg@mail.gmail.com>
 <b875ef1778e17a87ee1f4b71d26f2782831b1d07.camel@gmail.com>
 <CAL_JsqK83MFqZ4yCz+i7sunpXFmi+vvjCSxVmcCh1YG=mOxY9A@mail.gmail.com>
 <b56b8a5c8f02a2afea9554ebf16a423c182a9fc3.camel@gmail.com>
In-Reply-To: <b56b8a5c8f02a2afea9554ebf16a423c182a9fc3.camel@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 20 Apr 2021 17:34:36 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJXKVUFh9KrJjobn-jE-PFKN0w-V_i3qkfBrpTah4g8Xw@mail.gmail.com>
Message-ID: <CAL_JsqJXKVUFh9KrJjobn-jE-PFKN0w-V_i3qkfBrpTah4g8Xw@mail.gmail.com>
Subject: Re: [PATCH 1/1] of/pci: Add IORESOURCE_MEM_64 to resource flags for
 64-bit memory addresses
To: Leonardo Bras <leobras.c@gmail.com>
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
Cc: devicetree@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frank Rowand <frowand.list@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 PCI <linux-pci@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 19, 2021 at 9:03 PM Leonardo Bras <leobras.c@gmail.com> wrote:
>
> On Mon, 2021-04-19 at 20:39 -0500, Rob Herring wrote:
> > On Mon, Apr 19, 2021 at 7:35 PM Leonardo Bras <leobras.c@gmail.com> wrote:
> > >
> > > On Mon, 2021-04-19 at 10:44 -0500, Rob Herring wrote:
> > > > On Fri, Apr 16, 2021 at 3:58 PM Leonardo Bras <leobras.c@gmail.com> wrote:
> > > > >
> > > > > Hello Rob, thanks for this feedback!
> > > > >
> > > > > On Thu, 2021-04-15 at 13:59 -0500, Rob Herring wrote:
> > > > > > +PPC and PCI lists
> > > > > >
> > > > > > On Thu, Apr 15, 2021 at 1:01 PM Leonardo Bras <leobras.c@gmail.com> wrote:
> > > > > > >
> > > > > > > Many other resource flag parsers already add this flag when the input
> > > > > > > has bits 24 & 25 set, so update this one to do the same.
> > > > > >
> > > > > > Many others? Looks like sparc and powerpc to me.
> > > > > >
> > > > >
> > > > > s390 also does that, but it look like it comes from a device-tree.
> > > >
> > > > I'm only looking at DT based platforms, and s390 doesn't use DT.
> > >
> > > Correct.
> > > Sorry, I somehow write above the opposite of what I was thinking.
> > >
> > > >
> > > > > > Those would be the
> > > > > > ones I worry about breaking. Sparc doesn't use of/address.c so it's
> > > > > > fine. Powerpc version of the flags code was only fixed in 2019, so I
> > > > > > don't think powerpc will care either.
> > > > >
> > > > > In powerpc I reach this function with this stack, while configuring a
> > > > > virtio-net device for a qemu/KVM pseries guest:
> > > > >
> > > > > pci_process_bridge_OF_ranges+0xac/0x2d4
> > > > > pSeries_discover_phbs+0xc4/0x158
> > > > > discover_phbs+0x40/0x60
> > > > > do_one_initcall+0x60/0x2d0
> > > > > kernel_init_freeable+0x308/0x3a8
> > > > > kernel_init+0x2c/0x168
> > > > > ret_from_kernel_thread+0x5c/0x70
> > > > >
> > > > > For this, both MMIO32 and MMIO64 resources will have flags 0x200.
> > > >
> > > > Oh good, powerpc has 2 possible flags parsing functions. So in the
> > > > above path, do we need to set PCI_BASE_ADDRESS_MEM_TYPE_64?
> > > >
> > > > Does pci_parse_of_flags() get called in your case?
> > > >
> > >
> > > It's called in some cases, but not for the device I am debugging
> > > (virtio-net pci@800000020000000).
> > >
> > > For the above device, here is an expanded stack trace:
> > >
> > > of_bus_pci_get_flags() (from parser->bus->get_flags())
> > > of_pci_range_parser_one() (from macro for_each_of_pci_range)
> > > pci_process_bridge_OF_ranges+0xac/0x2d4
> > > pSeries_discover_phbs+0xc4/0x158
> > > discover_phbs+0x40/0x60
> > > do_one_initcall+0x60/0x2d0
> > > kernel_init_freeable+0x308/0x3a8
> > > kernel_init+0x2c/0x168
> > > ret_from_kernel_thread+0x5c/0x70
> > >
> > > For other devices, I could also see the following stack trace:
> > > ## device ethernet@8
> > >
> > > pci_parse_of_flags()
> > > of_create_pci_dev+0x7f0/0xa40
> > > __of_scan_bus+0x248/0x320
> > > pcibios_scan_phb+0x370/0x3b0
> > > pcibios_init+0x8c/0x12c
> > > do_one_initcall+0x60/0x2d0
> > > kernel_init_freeable+0x308/0x3a8
> > > kernel_init+0x2c/0x168
> > > ret_from_kernel_thread+0x5c/0x70
> > >
> > > Devices that get parsed with of_bus_pci_get_flags() appears first at
> > > dmesg (around 0.015s in my test), while devices that get parsed by
> > > pci_parse_of_flags() appears later (0.025s in my test).
> > >
> > > I am not really used to this code, but having the term "discover phbs"
> > > in the first trace and the term "scan phb" in the second, makes me
> > > wonder if the first trace is seen on devices that are seen/described in
> > > the device-tree and the second trace is seen in devices not present in
> > > the device-tree and found scanning pci bus.
> >
> > That was my guess as well. I think on pSeries that most PCI devices
> > are in the DT whereas on Arm and other flattened DT (non OpenFirmware)
> > platforms PCI devices are not in DT.
> >
>
> It makes sense to me.
>
> >  Of course, for virtio devices,
> > they would not be in DT in either case.
>
> I don't get this part... in pseries it looks like virtio devices can be
> in device-tree.
>
> Oh, I think I get it... this pci@800000020000000 looks like a bus
> (described in device-tree, so discovered), and then the devices are
> inside it, getting scanned.
>
> The virtio device gets the correct flags (from pci_parse_of_flags), but
> the bus (pci@800000020000000) does not seem to get it correctly,
> because it comes from of_bus_pci_get_flags() which makes sense
> according to the name of the function.
>
> (see lspci bellow, output without patch)
>
>
> 00:08.0 Ethernet controller: Red Hat, Inc. Virtio network device (rev
> 01)
>         Subsystem: Red Hat, Inc. Device 1100
>         Device tree node:
> /sys/firmware/devicetree/base/pci@800000020000000/ethernet@8
>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> ParErr- Stepping- SERR+ FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupt: pin A routed to IRQ 19
>         IOMMU group: 0
>         Region 1: Memory at 200080020000 (32-bit, non-prefetchable)
> [size=4K]
>         Region 4: Memory at 210000010000 (64-bit, prefetchable)
> [size=16K]
>         Expansion ROM at 200080040000 [disabled] [size=256K]
>         Capabilities: [98] MSI-X: Enable+ Count=3 Masked-
>                 Vector table: BAR=1 offset=00000000
>                 PBA: BAR=1 offset=00000800
>         Capabilities: [84] Vendor Specific Information: VirtIO:
> <unknown>
>                 BAR=0 offset=00000000 size=00000000
>         Capabilities: [70] Vendor Specific Information: VirtIO: Notify
>                 BAR=4 offset=00003000 size=00001000 multiplier=00000004
>         Capabilities: [60] Vendor Specific Information: VirtIO:
> DeviceCfg
>                 BAR=4 offset=00002000 size=00001000
>         Capabilities: [50] Vendor Specific Information: VirtIO: ISR
>                 BAR=4 offset=00001000 size=00001000
>         Capabilities: [40] Vendor Specific Information: VirtIO:
> CommonCfg
>                 BAR=4 offset=00000000 size=00001000
>         Kernel driver in use: virtio-pci
>
>
> >
> > > > > > I noticed both sparc and powerpc set PCI_BASE_ADDRESS_MEM_TYPE_64 in
> > > > > > the flags. AFAICT, that's not set anywhere outside of arch code. So
> > > > > > never for riscv, arm and arm64 at least. That leads me to
> > > > > > pci_std_update_resource() which is where the PCI code sets BARs and
> > > > > > just copies the flags in PCI_BASE_ADDRESS_MEM_MASK ignoring
> > > > > > IORESOURCE_* flags. So it seems like 64-bit is still not handled and
> > > > > > neither is prefetch.
> > > > > >
> > > > >
> > > > > I am not sure if you mean here:
> > > > > a) it's ok to add IORESOURCE_MEM_64 here, because it does not affect
> > > > > anything else, or
> > > > > b) it should be using PCI_BASE_ADDRESS_MEM_TYPE_64
> > > > > (or IORESOURCE_MEM_64 | PCI_BASE_ADDRESS_MEM_TYPE_64) instead, since
> > > > > it's how it's added in powerpc/sparc, and else there is no point.
> > > >
> > > > I'm wondering if a) is incomplete and PCI_BASE_ADDRESS_MEM_TYPE_64
> > > > also needs to be set. The question is ultimately are BARs getting set
> > > > correctly for 64-bit? It looks to me like they aren't.
> > >
> > > I am not used to these terms, does BAR means 'Base Address Register'?
> >
> > Yes. Standard PCI thing.
>
> Nice :)
>
> >
> > > If so, those are the addresses stored in pci->phb->mem_resources[i] and
> > > pci->phb->mem_offset[i], printed from enable_ddw() (which takes place a
> > > lot after discovering the device (0.17s in my run)).
> > >
> > > resource #1 pci@800000020000000: start=0x200080000000
> > > end=0x2000ffffffff flags=0x200 desc=0x0 offset=0x200000000000
> > > resource #2 pci@800000020000000: start=0x210000000000
> > > end=0x21ffffffffff flags=0x200 desc=0x0 offset=0x0
> > >
> > > The message above was printed without this patch.
> > > With the patch, the flags for memory resource #2 gets ORed with
> > > 0x00100000.
> >
> > Right, as expected.
> >
> > > Is it enough to know if BARs are correctly set for 64-bit?
> >
> > No, because AFAICT, bit 2 in the BAR would not be set.
> >
> > > If it's not, how can I check?
> >
> > Can you try 'lspci -vv' and look at the 'Region X:' lines which will
> > say 32 or 64-bit. I *think* that should reflect what actually got
> > written into the BARs.
>
> As seen in the lspci from above comment:
> Region 1: Memory at 200080020000 (32-bit, non-prefetchable) [size=4K]
> Region 4: Memory at 210000010000 (64-bit, prefetchable) [size=16K]
>
> So it seems to be getting configured properly.
>
> I think the point here is bus resources not getting the MEM_64 flag,
> but device resources getting it correctly. Is that supposed to happen?

I experimented with this on Arm with qemu and it seems fine there too.
Looks like the BARs are first read and will have bit 2 set by default
(or hardwired?). Now I'm just wondering why powerpc needs the code it
has...

Anyways, I'll apply the patch.

Rob
