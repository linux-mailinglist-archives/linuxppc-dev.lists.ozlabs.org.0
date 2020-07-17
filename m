Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B448D223372
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 08:12:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7LQC5DKPzDqpK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 16:12:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::142;
 helo=mail-il1-x142.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dDKDtZnu; dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7LNN1wkWzDr8C
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 16:11:15 +1000 (AEST)
Received: by mail-il1-x142.google.com with SMTP id e18so6417192ilr.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 23:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eQ4SDzBh4+V2kMi7gXK7SWEhyh7Oi0s68t3GgMp5qdc=;
 b=dDKDtZnueT/teMNuZHUy9SajMejEPlc5TWyzWzB5UcMHB7gVOsiMckE3xc4vzC6aQN
 JwBWnQ/NoLAAcPsDtlwXQfdnpD++bERFkqzTnaE94B/r+LEzWfdxy7QyXgPbl1UB6Vzb
 ZMc54IBMcpOW/z3FgTF37Hqbh8SLZY73u4Gg13wj234GR9KLoOUyCk7gNWSF0SLWyiDP
 JYkeENvCN7gLdl43FcK5U9oRPL36h02YLduVEsMik2Ed1Ujgur9VjasUO3ynHhpN3R7o
 XgAVcvyyw5gb/nJBbxTx/aL0Li9ZhQI2HKl6yjA92MiAaaNtzboF4NpkEBiXlXzo/vTM
 AhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eQ4SDzBh4+V2kMi7gXK7SWEhyh7Oi0s68t3GgMp5qdc=;
 b=hyH0ZuWn4Soa4eA4Zz7jVSOgrWdEHOR5LUwZmG1kXkJLJe3p64utCp1FOr2DEuwzpI
 hYibw53vfo3qDfEb2UJwxdP1zkLVVERTiSrYLGy2KtkJ41lxhf7S9X6bzR/aNViY3R2C
 sx9ivPARGCZjx3THU4QZe98S+PkD5qaStK8edsCZ1M8Ldu6ask850sUTnLHGaoc/shm/
 gDZ/Kxg3eF90r0wYTCpHqS7118gJUVWQIrGCn4BdY1816M1giKNluzeh3sQEGj1vItbI
 3lOEJ8w7Cv6VDLL3eNt36GrpZ+bdEs0BVc286un8agr9kyo8f1zAhKtG/pSaWm9hHnVZ
 PHCw==
X-Gm-Message-State: AOAM531hqI+mId4F0aorB9eN+7YglhBTFYG1+llrKvjzjeGZ/jr3JIv/
 wP5cHgINtd0FPZ67Yp6do8XxJ1RvpOcV6aybAe4=
X-Google-Smtp-Source: ABdhPJznDoSDTaJNGUpx4DHhLhzw2/6O/ryIa90VGYcPNgQmY+Ql37MiKZ3WKV2ZG1nyG9X4NlEbjfglafUbPcJxxkk=
X-Received: by 2002:a92:4913:: with SMTP id w19mr7696682ila.185.1594966270961; 
 Thu, 16 Jul 2020 23:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAO3ALPy8_pxVyFROZUWNafEH1vUCP6LVpNmBBuMDSewGitzdLw@mail.gmail.com>
In-Reply-To: <CAO3ALPy8_pxVyFROZUWNafEH1vUCP6LVpNmBBuMDSewGitzdLw@mail.gmail.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 17 Jul 2020 16:10:59 +1000
Message-ID: <CAOSf1CEOu5jX6KXKWiConBf=TDwF3qdASMxtfDjqSR6vOKN4XA@mail.gmail.com>
Subject: Re: ASMedia USB 3.x host controllers triggering EEH on POWER9
To: Forest Crossman <cyrozap@gmail.com>
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
Cc: linux-pci <linux-pci@vger.kernel.org>, linux-usb@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 17, 2020 at 2:14 PM Forest Crossman <cyrozap@gmail.com> wrote:
>
> Hi, all,
>
> I have several ASMedia USB 3.x host controllers (ASM2142 and ASM3142,
> both share the same Vendor ID/Device ID pair) that I'd like to use
> with a POWER9 system (a Raptor Computing Systems Talos II).
> Unfortunately, while the kernel recognizes the controllers just fine,
> as soon as I plug in a device, an EEH error occurs and the host
> controller gets repeatedly reset until it eventually gets disabled. An
> example of one of these errors can be seen here:
> https://paste.debian.net/hidden/e39698eb
>
> Based on the "PHB4 Diag-data" reported by the kernel, it seems that
> LEM_WOF_R bit 35, PHB_FESR bit 20, and RXE_ARB_FESR bit 28 have been
> set. According to the PHB4 specification
> (https://ibm.ent.box.com/s/jftnfhceul07qjh9jtn91xwjmclabc71), they
> respectively mean the following:
>  - ARB: IODA TVT Errors - "TCE Validation Table error occurred. The
> entry is invalid, or the PCI Address was out of range as defined by
> the TTA bounds in the TVE entry."
>  - RXE_ARB OR Error Status - "RXE_ARB error bits, ... OR of all error
> status bits."
>  - IODA TVT Address Range Error - "IODA Error: The PCI Address was out
> of range as defined by the TTA bounds in the TVE entry."

Welcome to my world!

In the future you can use this script to automate some of the tedium
of parsing the eeh dumps:
https://patchwork.ozlabs.org/project/skiboot/patch/20200717044243.1195833-1-oohall@gmail.com/

Anyway, for background the way PHB3 and PHB4 handle incoming DMAs goes
as follows:

1. Map the 16bit <bus><devfn> number to an IOMMU context, we call
those PEs. PE means "partitionable endpoint", but for the purpose of
processing DMAs you can ignore that and just treat it as an IOMMU
context ID.
2. Use the PE number and some of the upper bits of the DMA address to
form the index into the Translation Validation Table.
3. Use the table entry to validate the DMA address is within bounds
and whether it should be translated by the IOMMU or used as-is.

If the table entry says the DMA needs to be translated by the IOMMU we'll also:
4. Walk the IOMMU table to get the relevant IOMMU table entry.
5. Validate the device has permission to read/write to that address.

The "TVT Address Range Error" you're seeing means that the bounds
checks done in 3) is failing. OPAL configures the PHB so there's two
TVT entries (TVEs for short) assigned to each PE. Bit 59 of the DMA
address is used to select which TVE to use. We typically configure
TVE#0 to map 0x0...0x8000_0000 so there's a 2GB 32bit DMA window.
TVE#1 is configured for no-translate (bypass) mode so you can convert
from a system physical address to a DMA address by ORing in bit 59.

From word 2 of the PEST entry the faulting DMA address is:
0x0000203974c00000. That address is interesting since it looks a lot
like a memory address on the 2nd chip, but it doesn't have bit 59 set
so TVE#0 is used to validate it. Obviously that address is above 2GB
so we get the error.

What's probably happening is that the ASmedia controller doesn't
actually implement all 64 address bits and truncates the upper bits of
the DMA address. Doing that is a blatant violation of the PCIe (and
probably the xHCI) spec, but it's also pretty common since "it works
on x86." Something to try would be booting with the iommu=nobypass in
the kernel command line. That'll disable TVE#1 and force all DMAs to
go through TVE#0.

> In other words, the ASMedia USB controllers seem to be trying to write
> to addresses they're not supposed to, and thankfully the PHB4 is
> catching these bad writes before they can cause any corruption of my
> system's memory. Of course, this has the unfortunate side-effect that
> these devices are completely unable to operate with my computer, and
> since it seems to be possible to use these controllers on x86 systems
> (presumably because of the less-strict/disabled-by-default IOMMU), I
> wonder if maybe it would be possible to work around these errors in
> either the kernel or the OPAL firmware?

It's not easy to work around at the platform level since we have no
way to know what an arbitrary device can and can't do. There's various
tricks we can pull like putting the TVE#0 into bypass mode, but that
causes problems if there are any devices in the PE that are actually
limited to 32bit DMA. Some GPUs have a secondary audio function which
only supports 32bit DMA so it's not a completely academic concern
either.

> Now, I'm a novice at kernel hacking, so I don't really know what I'm
> doing, but just for fun I did try to paper over the issue by adding an
> EEH handler to the xhci driver
> (https://paste.debian.net/hidden/16081515), but as you might expect,
> that didn't do anything but prevent further communication with the
> device.

Assuming the nobypass trick above works, what you really need to do is
have the driver report that it can't address all 64bits by setting its
DMA mask accordingly. For the xhci driver it looks like this is done
in xhci_gen_setup(), there might be a quirks-style interface for
working around bugs in specific controllers that you can use. Have a
poke around and see what you can find :)

Oliver
