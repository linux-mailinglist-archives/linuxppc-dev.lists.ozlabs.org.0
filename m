Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 294B61B0E3B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 16:22:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495TRN1H0WzDqjg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 00:22:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uouxbw//; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495T2t6kskzDqTn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 00:04:22 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id o10so1860387pgb.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 07:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=jy4gVgbbUYqO2rt1Le5nr76glIwKILe+Mz5nWHBsqjM=;
 b=uouxbw//nd9aTZSxpidFGATpCYluoYuMgRDfhpraTbSk723O0YRgM5hKBc/s4ewUAY
 iAYXcA2NrJk9THIX4YgB6WvefvXfGvWVbP01C9dJEiiIex2UZlASbW5szaxwLpbA44WQ
 cJDm22jNH6TZknJX6N8dhRvxOQKJLIDl+rMsECPHbd0hUScnG8aNE41RKpTiODpM6mV8
 HFX4gY9fuymHYgEsplWMHOxbCRxDa9AZRbtexJKkOoRB2D1Z7cDt/Q5hl2hYOya0PqJR
 y1COMLbSEzPGDMwiLDNqif/XRRUQaSQ1Wc4t23UTIxWbYplFDpf7eKRDtAQmvlHjnfqk
 CEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=jy4gVgbbUYqO2rt1Le5nr76glIwKILe+Mz5nWHBsqjM=;
 b=Hjuuz7RR2TwhMxfU2A0yXqnDLwItzIgykyAh+e897z1PhLYtpkqEiMjpS7fkM3uKpI
 B50sy8PTiZhsCzlBD2+aYMOICp01AOoTwTGQC/qLeKT02oQke+z8vBavn0tG2ur69gZT
 BtDail4fEdLxBCi4NKMx+Dw5nhJRqQ+l2NpUpLoHPi/FpYwamTkZCkerkpPBC3aijwfV
 eqahKeSYta8si3Km3iRhyoSBaGu8X3hoMPP/fNqAsrZrIq0N2zkyvbwwP+dckeWEtuzD
 GRfpDqkLWCJdVHiaGtfrOJI199PMAmOp6Tw0y3V5Zwqvsv99dFy6XELWaxqwSaOOerzG
 gVAQ==
X-Gm-Message-State: AGi0PubzROVgaU2g9218rxzM6nTW3weJ6KDV6hfd0IcOHjlMfEnwoJfv
 hUVBXjmKjoUwNGTa9fUOVd0=
X-Google-Smtp-Source: APiQypK7x2ipAVoVTFsP+Bys7u+FsKgBv39XGJ9ob8gZ6ttd6GdgBR6XVEF/C1J66eoItzGvk1ipjw==
X-Received: by 2002:a62:ed1a:: with SMTP id u26mr17026729pfh.47.1587391458282; 
 Mon, 20 Apr 2020 07:04:18 -0700 (PDT)
Received: from localhost.localdomain (203-219-253-91.static.tpgi.com.au.
 [203.219.253.91])
 by smtp.googlemail.com with ESMTPSA id o12sm1222803pgl.87.2020.04.20.07.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 07:04:17 -0700 (PDT)
Message-ID: <76718d0c46f4638a57fd2deeeed031143599d12d.camel@gmail.com>
Subject: Re: [PATCH kernel v2 0/7] powerpc/powenv/ioda: Allow huge DMA
 window at 4GB
From: Oliver O'Halloran <oohall@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Russell Currey <ruscur@russell.cc>
Date: Tue, 21 Apr 2020 00:04:11 +1000
In-Reply-To: <9893c4db-057d-8e42-52fe-8241d6d90b5f@ozlabs.ru>
References: <20200323075354.93825-1-aik@ozlabs.ru>
 <b512ac5e-dca5-4c08-8ea1-a636b887c0d0@ozlabs.ru>
 <d5cac37a-8b32-cabf-e247-10e64f0110ab@ozlabs.ru>
 <CAOSf1CGfjX9LGQ1GDSmxrzjnaWOM3mUvBu9_xe-L2umin9n66w@mail.gmail.com>
 <CAOSf1CHgUsJ7jGokg6QD6cEDr4-o5hnyyyjRZ=YijsRY3T1sYA@mail.gmail.com>
 <b0b361092d2d7e38f753edee6dcd9222b4e388ce.camel@russell.cc>
 <9893c4db-057d-8e42-52fe-8241d6d90b5f@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
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
Cc: KVM list <kvm@vger.kernel.org>, Fabiano Rosas <farosas@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, kvm-ppc@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-04-17 at 15:47 +1000, Alexey Kardashevskiy wrote:
> 
> On 17/04/2020 11:26, Russell Currey wrote:
> > 
> > For what it's worth this sounds like a good idea to me, it just sounds
> > tricky to implement.  You're adding another layer of complexity on top
> > of EEH (well, making things look simple to the EEH core and doing your
> > own freezing on top of it) in addition to the DMA handling.
> > 
> > If it works then great, just has a high potential to become a new bug
> > haven.
> 
> imho putting every PCI function to a separate PE is the right thing to
> do here but I've been told it is not that simple, and I believe that.
> Reusing slave PEs seems unreliable - the configuration will depend on
> whether a PE occupied enough segments to give an unique PE to a PCI
> function and my little brain explodes.

You're overthinking it.

If a bus has no m64 MMIO space we're free to assign whatever PE number
we want since the PE for the bus isn't fixed by the m64 segment its
BARs were placed in. For those buses we assign a PE number starting
from the max and counting down (0xff, 0xfe, etc). For example, with
this PHB:

# lspci -s 1:: -v | egrep '0001:|Memory at'
0001:00:00.0 PCI bridge: IBM Device 04c1 (prog-if 00 [Normal decode])
0001:01:00.0 PCI bridge: PLX Technology, Inc. Device 8725 (rev ca)
(prog-if 00 [Normal decode])
        Memory at 600c081000000 (32-bit, non-prefetchable) [size=256K]
0001:02:01.0 PCI bridge: PLX Technology, Inc. Device 8725 (rev ca)
(prog-if 00 [Normal decode])
0001:02:08.0 PCI bridge: PLX Technology, Inc. Device 8725 (rev ca)
(prog-if 00 [Normal decode])
0001:02:09.0 PCI bridge: PLX Technology, Inc. Device 8725 (rev ca)
(prog-if 00 [Normal decode])
0001:03:00.0 Non-Volatile memory controller: PMC-Sierra Inc. Device
f117 (rev 06) (prog-if 02 [NVM Express])
        Memory at 600c080000000 (64-bit, non-prefetchable) [size=16K]
        Memory at 6004000000000 (64-bit, prefetchable) [size=1M]
0001:09:00.0 Ethernet controller: Intel Corporation Ethernet Controller
X710/X557-AT 10GBASE-T (rev 02)
        Memory at 6004048000000 (64-bit, prefetchable) [size=8M]
        Memory at 600404a000000 (64-bit, prefetchable) [size=32K]
(redundant functions removed)

We get these PE assignments:

0001:00:00.0 - 0xfe # Root port
0001:01:00.0 - 0xfc # upstream port
0001:02:01.0 - 0xfd # downstream port bus
0001:02:08.0 - 0xfd
0001:02:09.0 - 0xfd
0001:03:00.0 - 0x0  # NVMe
0001:09:00.0 - 0x1  # Ethernet

All the switch ports either have 32bit BARs or no BARs so they get
assigned PEs starting from the top. The Ethernet and the NVMe have some
prefetchable 64bit BARs so they have to be in PE 0x0 and 0x1
respectively since that's where their m64 BARs are located. For our
DMA-only slave PEs any MMIO space would remain in their master PE so we
can allocate a PE number for the DMA-PE (our iommu context).

I think the key thing to realise is that we'd only be using the DMA-PE
when a crippled DMA mask is set by the driver. In all other cases we
can just use the "native PE" and when the driver unbinds we can de-
allocate our DMA-PE and return the device to the PE containing it's
MMIO BARs. I think we can keep things relatively sane that way and the
real issue is detecting EEH events on the DMA-PE.

On P9 we don't have PHB error interrupts enabled in firmware so we're
completely reliant on seeing a 0xFF response to an MMIO and manually
checking the PE status to see if it's due to a PE freeze. For our DMA-
PE it could be frozen (due to a bad DMA) and we'd never notice unless
we explicitly check the status of the DMA-PE since there's no
corresponding MMIO space to freeze.

On P8 we had PHB Error interrupts so you would notice that *something*
happened, then go check for frozen PEs, at which point the master-slave 
grouping logic would see that one PE in the group was frozen and freeze
the rest of them. We can re-use that on that, but we still need
something to actually notice a freeze occured. A background poller
checking for freezes on each PE might do the trick.

> So this is not happening soon.

Oh ye of little faith.

> For the time being, this patchset is good for:
> 1. weird hardware which has limited DMA mask (this is why the patchset
> was written in the first place)
> 2. debug DMA by routing it via IOMMU (even when 4GB hack is not enabled).

Sure, but it's still dependent on having firmware which supports the
4GB hack and I don't think that's in any offical firmware releases yet.

Oliver

