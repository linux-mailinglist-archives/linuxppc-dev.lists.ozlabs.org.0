Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F4335859
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 10:15:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JhRp1LrlzDqfN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 18:15:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="QUtXl3yo"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JhPH69GBzDqQd
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 18:13:07 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id EDEF87E716;
 Wed,  5 Jun 2019 03:12:33 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1559722354; bh=MR7X+xCRfP7AnwE7ElfrHb8QpeQuk302tr7MMQQxunA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QUtXl3yo0RueX1o8N+5pdSeA91BxXkRoq9LnmEPW9etaOufoXF/Eq3koYUHicKr0f
 j9F+wtwJrNF9jjXB41E7kHlsXjEfOwcoucDct6bndbzWvY6GwXyL7yk83nsNHC0lGy
 eZ9yRbgfocNew8QIXvQlFbr+bVXncOtUe3C6/SwGIKIUgXkiUI4kYia2OhpHK4HaeZ
 2gloSRI8uZlF3NR022tnwIDjYqwAmV9NbWnjL/skgPdX2mdY0Cmn7pJT9MBiV11CO1
 XQOzQofGdAdBOnyWcK19/MmstMj2YtsQynwSB3MWZhHkIiZxgoChvdxTeebSQpP9LA
 lxd3ewPVu5IVQ==
Subject: Re: [PATCH kernel] powerpc/pci/of: Fix OF flags parsing for 64bit BARs
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20190605033814.127962-1-aik@ozlabs.ru>
From: Shawn Anastasio <shawn@anastas.io>
Message-ID: <5cffbab9-ae63-bfb8-1474-6bfd9a1a783a@anastas.io>
Date: Wed, 5 Jun 2019 03:12:32 -0500
MIME-Version: 1.0
In-Reply-To: <20190605033814.127962-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/4/19 10:38 PM, Alexey Kardashevskiy wrote:
> When the firmware does PCI BAR resource allocation, it passes the assigned
> addresses and flags (prefetch/64bit/...) via the "reg" property of
> a PCI device device tree node so the kernel does not need to do
> resource allocation.
> 
> The flags are stored in resource::flags - the lower byte stores
> PCI_BASE_ADDRESS_SPACE/etc bits and the other bytes are IORESOURCE_IO/etc.
> Some flags from PCI_BASE_ADDRESS_xxx and IORESOURCE_xxx are duplicated,
> such as PCI_BASE_ADDRESS_MEM_PREFETCH/PCI_BASE_ADDRESS_MEM_TYPE_64/etc.
> When parsing the "reg" property, we copy the prefetch flag but we skip
> on PCI_BASE_ADDRESS_MEM_TYPE_64 which leaves the flags out of sync.
> 
> The missing IORESOURCE_MEM_64 flag comes into play under 2 conditions:
> 1. we remove PCI_PROBE_ONLY for pseries (by hacking pSeries_setup_arch()
> or by passing "/chosen/linux,pci-probe-only");
> 2. we request resource alignment (by passing pci=resource_alignment=
> via the kernel cmd line to request PAGE_SIZE alignment or defining
> ppc_md.pcibios_default_alignment which returns anything but 0). Note that
> the alignment requests are ignored if PCI_PROBE_ONLY is enabled.
> 
> With 1) and 2), the generic PCI code in the kernel unconditionally
> decides to:
> - reassign the BARs in pci_specified_resource_alignment() (works fine)
> - write new BARs to the device - this fails for 64bit BARs as the generic
> code looks at IORESOURCE_MEM_64 (not set) and writes only lower 32bits
> of the BAR and leaves the upper 32bit unmodified which breaks BAR mapping
> in the hypervisor.
> 
> This fixes the issue by copying the flag. This is useful if we want to
> enforce certain BAR alignment per platform as handling subpage sized BARs
> is proven to cause problems with hotplug (SLOF already aligns BARs to 64k).
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> 
> This code is there for ages (from 200x) hence no "Fixes:".
> 
> Ideally I want to enforce /chosen/linux,pci-probe-only in QEMU as
> at the moment:
> - pci=resource_alignment= alone does not do anything;
> - /chosen/linux,pci-probe-only alone does not cause the kernel to
> reassign resources;
> - pci=resource_alignment= with /chosen/linux,pci-probe-only is broken
> anyway.
> 
> ---
>   arch/powerpc/kernel/pci_of_scan.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/pci_of_scan.c b/arch/powerpc/kernel/pci_of_scan.c
> index 24191ea2d9a7..64ad92016b63 100644
> --- a/arch/powerpc/kernel/pci_of_scan.c
> +++ b/arch/powerpc/kernel/pci_of_scan.c
> @@ -45,6 +45,8 @@ unsigned int pci_parse_of_flags(u32 addr0, int bridge)
>   	if (addr0 & 0x02000000) {
>   		flags = IORESOURCE_MEM | PCI_BASE_ADDRESS_SPACE_MEMORY;
>   		flags |= (addr0 >> 22) & PCI_BASE_ADDRESS_MEM_TYPE_64;
> +		if (flags & PCI_BASE_ADDRESS_MEM_TYPE_64)
> +			flags |= IORESOURCE_MEM_64;
>   		flags |= (addr0 >> 28) & PCI_BASE_ADDRESS_MEM_TYPE_1M;
>   		if (addr0 & 0x40000000)
>   			flags |= IORESOURCE_PREFETCH
> 

I have confirmed that this fixes the case with PCI_PROBE_ONLY
disabled and a ppc_md.pcibios_default_alignment implementation that
returns PAGE_SIZE.

Reviewed-by: Shawn Anastasio <shawn@anastas.io>
