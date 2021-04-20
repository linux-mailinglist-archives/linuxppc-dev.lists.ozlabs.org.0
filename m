Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 520B0364F8B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 02:36:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPPqd6tYFz30Gj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 10:35:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=nGKjCKGk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835;
 helo=mail-qt1-x835.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nGKjCKGk; dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPPqC2SWvz2xgK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 10:35:32 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id f12so27577618qtf.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 17:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=pEYRyKVxUjCxsNQMksqG31lLFUmgL2MrXrf40tljCg4=;
 b=nGKjCKGkH1i15sEaijoImhaKj8wjyiOB5eGaqdzOJrfsAhjZZ3ChAxhYXlt+6b55fp
 yKYLwdWXIeaY75bmJPJqeqhj8Us+Q0+CwJCAihgCJKztck/ofYwGnDa6+NYt14Yn7BAi
 nvxnGgEfGVLth+2boPNIYGqitfIuomiMt1bMUB1eQbfFGhQB+eUPb0oM/G4HGpXW1Abu
 HrBCM9CErcTG3nTbrD6JXH5AqLNuAYXCZq37x2o4+O8C7ZjWW8pfY5EXSrkF94VbwTuW
 RleKkrgwUrY4kwhas3BcWvYa/xG1GmulkOzRXg0nWqceRAcR82ebG3fJhNr7mO0toMK1
 JKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=pEYRyKVxUjCxsNQMksqG31lLFUmgL2MrXrf40tljCg4=;
 b=KIgxQSLJ/fuq5qqNfP/xNcbSPLQJ81zdy1ISGFQbBEBInSw8PkCDX8Xde3HCC/NmpB
 NxjGI4TpoVowaNGGSVqd7iiQTEXjJQWTRfx4B4fUhZhbSqKk/DhiTdKRcWFHygMHgRWw
 24Kk2GfsBL+vpcC8Tpl6XECxz9cJR8Q/LnqwulOY3D6yLr1xzP/bXRDMT1ZyPF4SJhpo
 iBXThpgryLUliNDvbLDnvgg480WAM67/gxWzo9IkAW0jmxbaCmCGDoGlTnu6hpiagucU
 fOz32ikV24dFOOYlEculH+nspJslmvmPBnk+TmSA2aqcjH/aUugO1wb2ieAdr0UdJUZZ
 9aZA==
X-Gm-Message-State: AOAM531x29XAyPsp6bXMq8nSSOS+mwNl7aEaNN29rukajo0jwDIqmVzD
 RRjubxE1vqdt/56/3Z3dZSk=
X-Google-Smtp-Source: ABdhPJxsZEYxx8OIGG9YIGcVVmVZRAeygEPIj5D+OTRiDUAKNgAm/jDK5Qo7LSQj5tMoj8ccxnnDvg==
X-Received: by 2002:ac8:5559:: with SMTP id o25mr2748109qtr.36.1618878928589; 
 Mon, 19 Apr 2021 17:35:28 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([177.35.200.187])
 by smtp.gmail.com with ESMTPSA id h79sm8706785qke.129.2021.04.19.17.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 17:35:28 -0700 (PDT)
Message-ID: <b875ef1778e17a87ee1f4b71d26f2782831b1d07.camel@gmail.com>
Subject: Re: [PATCH 1/1] of/pci: Add IORESOURCE_MEM_64 to resource flags for
 64-bit memory addresses
From: Leonardo Bras <leobras.c@gmail.com>
To: Rob Herring <robh+dt@kernel.org>
Date: Mon, 19 Apr 2021 21:35:24 -0300
In-Reply-To: <CAL_Jsq+m6CkGj_NYGvwxoKwoQ4PkEu6hfGdMTT3i4APoHSkNeg@mail.gmail.com>
References: <20210415180050.373791-1-leobras.c@gmail.com>
 <CAL_Jsq+WwAeziGN4EfPAWfA0fieAjfcxfi29=StOx0GeKjAe_g@mail.gmail.com>
 <7b089cd48b90f2445c7cb80da1ce8638607c46fc.camel@gmail.com>
 <CAL_Jsq+m6CkGj_NYGvwxoKwoQ4PkEu6hfGdMTT3i4APoHSkNeg@mail.gmail.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Mon, 2021-04-19 at 10:44 -0500, Rob Herring wrote:
> On Fri, Apr 16, 2021 at 3:58 PM Leonardo Bras <leobras.c@gmail.com> wrote:
> > 
> > Hello Rob, thanks for this feedback!
> > 
> > On Thu, 2021-04-15 at 13:59 -0500, Rob Herring wrote:
> > > +PPC and PCI lists
> > > 
> > > On Thu, Apr 15, 2021 at 1:01 PM Leonardo Bras <leobras.c@gmail.com> wrote:
> > > > 
> > > > Many other resource flag parsers already add this flag when the input
> > > > has bits 24 & 25 set, so update this one to do the same.
> > > 
> > > Many others? Looks like sparc and powerpc to me.
> > > 
> > 
> > s390 also does that, but it look like it comes from a device-tree.
> 
> I'm only looking at DT based platforms, and s390 doesn't use DT.

Correct. 
Sorry, I somehow write above the opposite of what I was thinking.

> 
> > > Those would be the
> > > ones I worry about breaking. Sparc doesn't use of/address.c so it's
> > > fine. Powerpc version of the flags code was only fixed in 2019, so I
> > > don't think powerpc will care either.
> > 
> > In powerpc I reach this function with this stack, while configuring a
> > virtio-net device for a qemu/KVM pseries guest:
> > 
> > pci_process_bridge_OF_ranges+0xac/0x2d4
> > pSeries_discover_phbs+0xc4/0x158
> > discover_phbs+0x40/0x60
> > do_one_initcall+0x60/0x2d0
> > kernel_init_freeable+0x308/0x3a8
> > kernel_init+0x2c/0x168
> > ret_from_kernel_thread+0x5c/0x70
> > 
> > For this, both MMIO32 and MMIO64 resources will have flags 0x200.
> 
> Oh good, powerpc has 2 possible flags parsing functions. So in the
> above path, do we need to set PCI_BASE_ADDRESS_MEM_TYPE_64?
> 
> Does pci_parse_of_flags() get called in your case?
> 

It's called in some cases, but not for the device I am debugging
(virtio-net pci@800000020000000). 

For the above device, here is an expanded stack trace:

of_bus_pci_get_flags() (from parser->bus->get_flags()) 
of_pci_range_parser_one() (from macro for_each_of_pci_range)
pci_process_bridge_OF_ranges+0xac/0x2d4
pSeries_discover_phbs+0xc4/0x158
discover_phbs+0x40/0x60
do_one_initcall+0x60/0x2d0
kernel_init_freeable+0x308/0x3a8
kernel_init+0x2c/0x168
ret_from_kernel_thread+0x5c/0x70

For other devices, I could also see the following stack trace:
## device ethernet@8

pci_parse_of_flags()
of_create_pci_dev+0x7f0/0xa40
__of_scan_bus+0x248/0x320
pcibios_scan_phb+0x370/0x3b0
pcibios_init+0x8c/0x12c
do_one_initcall+0x60/0x2d0
kernel_init_freeable+0x308/0x3a8
kernel_init+0x2c/0x168
ret_from_kernel_thread+0x5c/0x70

Devices that get parsed with of_bus_pci_get_flags() appears first at
dmesg (around 0.015s in my test), while devices that get parsed by
pci_parse_of_flags() appears later (0.025s in my test).

I am not really used to this code, but having the term "discover phbs"
in the first trace and the term "scan phb" in the second, makes me
wonder if the first trace is seen on devices that are seen/described in
the device-tree and the second trace is seen in devices not present in
the device-tree and found scanning pci bus.

> > > I noticed both sparc and powerpc set PCI_BASE_ADDRESS_MEM_TYPE_64 in
> > > the flags. AFAICT, that's not set anywhere outside of arch code. So
> > > never for riscv, arm and arm64 at least. That leads me to
> > > pci_std_update_resource() which is where the PCI code sets BARs and
> > > just copies the flags in PCI_BASE_ADDRESS_MEM_MASK ignoring
> > > IORESOURCE_* flags. So it seems like 64-bit is still not handled and
> > > neither is prefetch.
> > > 
> > 
> > I am not sure if you mean here:
> > a) it's ok to add IORESOURCE_MEM_64 here, because it does not affect
> > anything else, or
> > b) it should be using PCI_BASE_ADDRESS_MEM_TYPE_64
> > (or IORESOURCE_MEM_64 | PCI_BASE_ADDRESS_MEM_TYPE_64) instead, since
> > it's how it's added in powerpc/sparc, and else there is no point.
> 
> I'm wondering if a) is incomplete and PCI_BASE_ADDRESS_MEM_TYPE_64
> also needs to be set. The question is ultimately are BARs getting set
> correctly for 64-bit? It looks to me like they aren't.

I am not used to these terms, does BAR means 'Base Address Register'?

If so, those are the addresses stored in pci->phb->mem_resources[i] and
pci->phb->mem_offset[i], printed from enable_ddw() (which takes place a
lot after discovering the device (0.17s in my run)).

resource #1 pci@800000020000000: start=0x200080000000
end=0x2000ffffffff flags=0x200 desc=0x0 offset=0x200000000000
resource #2 pci@800000020000000: start=0x210000000000
end=0x21ffffffffff flags=0x200 desc=0x0 offset=0x0

The message above was printed without this patch.
With the patch, the flags for memory resource #2 gets ORed with 
0x00100000.

Is it enough to know if BARs are correctly set for 64-bit?
If it's not, how can I check?

> 
> Rob

Thanks Rob!

Leonardo Brás

