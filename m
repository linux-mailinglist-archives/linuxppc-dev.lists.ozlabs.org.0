Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A34D01B1EE2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 08:37:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495v4C1GB6zDr4m
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 16:36:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::141;
 helo=mail-il1-x141.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QxMVyfDL; dkim-atps=neutral
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495v2H0jQczDqsl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 16:35:18 +1000 (AEST)
Received: by mail-il1-x141.google.com with SMTP id x2so11049383ilp.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 23:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2GZ3FEJ4iPZ3+IRnrKx7fOdw1woztaKLuV+cLqPMCgY=;
 b=QxMVyfDLq1hToJoggNoJE9N+v6mbWwed+u3yYFj/4mgX0rFsfe4Ip4Py9Dz0VTHclg
 bqM/hQ5rFYOQQekWe+gAP6NTB3csVRytsir+sHfBjfeeIgCg30JjYsMcXuYLqshCa3bA
 cK3NiW8ghX5rClE2iWcsA+vlfYQU7p2psMRScc7MHcYGKJbcth9mWYCKKxiXs6UOrlcK
 QBSQxCd7tn5iQznHZnO+7lrzI30HYGB3FHg9wPyrH+kfLX/SdMCVQg5kgdz3cyHMUbQ8
 6C49cuZzT3+hV2xB9xHikkzaG9j40Yi3bZX8/pJMpQeWAgtLQ/jSo7XctVH0Uxd/PA4F
 FOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2GZ3FEJ4iPZ3+IRnrKx7fOdw1woztaKLuV+cLqPMCgY=;
 b=VX7knMa+xlUl9HBBCkH3znr1PiPpwkI+W3FHLJm1N3VMF5DeP3M7irOzDtKIAGaNrL
 WR6pAuFJp7CXqM1fCq5fSMqWYApcg/uSG75m2cYnMEMcH6wOzEV5vGKx7nLf8TSuYilE
 mjAefWxPytreEgLRttGP9c/CPnnfT8yUnr1Zb3XSaGykAD4K9+d6gLKOkpuUB1pFOUlZ
 etbx7z+5KKO5/IsTB4EaBWmCt9+w53WbHexrgXeHNzt2yj3P6DyIxYiw8OS5V2Mct7Py
 JAemsWBuhWJ8rhOPKRrHGB1NIwN9fH6dt2vCCURc9Br5OuoxehVmQTghmGTgizZ/59RR
 pkFA==
X-Gm-Message-State: AGi0PuYKKx1SaH+Ip0PcCaz01BCxslWzfjXSDNPZU8KptOd2OV5h8WX3
 e5sC9M1s55RbViNqEG4/xafI9PsSfDEE6S4MXKskYg==
X-Google-Smtp-Source: APiQypI0UjZj3RJkKhckLd67LZ5JWoeLzx1wDwHDSxBunlAoQ/EBiYhIkcP39F0zeF4gS3v76sDGDLlnUaj8mi5mmac=
X-Received: by 2002:a92:7c01:: with SMTP id x1mr12131737ilc.122.1587450916283; 
 Mon, 20 Apr 2020 23:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200323075354.93825-1-aik@ozlabs.ru>
 <b512ac5e-dca5-4c08-8ea1-a636b887c0d0@ozlabs.ru>
 <d5cac37a-8b32-cabf-e247-10e64f0110ab@ozlabs.ru>
 <CAOSf1CGfjX9LGQ1GDSmxrzjnaWOM3mUvBu9_xe-L2umin9n66w@mail.gmail.com>
 <CAOSf1CHgUsJ7jGokg6QD6cEDr4-o5hnyyyjRZ=YijsRY3T1sYA@mail.gmail.com>
 <b0b361092d2d7e38f753edee6dcd9222b4e388ce.camel@russell.cc>
 <9893c4db-057d-8e42-52fe-8241d6d90b5f@ozlabs.ru>
 <76718d0c46f4638a57fd2deeeed031143599d12d.camel@gmail.com>
 <8f317916-06be-ed25-4d9b-a8e2e993b112@ozlabs.ru>
In-Reply-To: <8f317916-06be-ed25-4d9b-a8e2e993b112@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 21 Apr 2020 16:35:05 +1000
Message-ID: <CAOSf1CG_qiR2HvSFVTbgTyqVmDt4+Oy60PNWY23K2ihHib1K7Q@mail.gmail.com>
Subject: Re: [PATCH kernel v2 0/7] powerpc/powenv/ioda: Allow huge DMA window
 at 4GB
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
Cc: KVM list <kvm@vger.kernel.org>, Fabiano Rosas <farosas@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, kvm-ppc@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 21, 2020 at 3:11 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> One example of a problem device is AMD GPU with 64bit video PCI function
> and 32bit audio, no?
>
> What PEs will they get assigned to now? Where will audio's MMIO go? It
> cannot be the same 64bit MMIO segment, right? If so, it is a separate PE
> already. If not, then I do not understand "we're free to assign whatever
> PE number we want.

The BARs stay in the same place and as far as MMIO is concerned
nothing has changed. For MMIO the PHB uses the MMIO address to find a
PE via the M64 BAR table, but for DMA it uses a *completely* different
mechanism. Instead it takes the BDFN (included in the DMA packet
header) and the Requester Translation Table (RTT) to map the BDFN to a
PE. Normally you would configure the PHB so the same PE used for MMIO
and DMA, but you don't have to.

> > I think the key thing to realise is that we'd only be using the DMA-PE
> > when a crippled DMA mask is set by the driver. In all other cases we
> > can just use the "native PE" and when the driver unbinds we can de-
> > allocate our DMA-PE and return the device to the PE containing it's
> > MMIO BARs. I think we can keep things relatively sane that way and the
> > real issue is detecting EEH events on the DMA-PE.
>
>
> Oooor we could just have 1 DMA window (or, more precisely, a single
> "TVE" as it is either window or bypass) per a PE and give every function
> its own PE and create a window or a table when a device sets a DMA mask.
> I feel I am missing something here though.

Yes, we could do that, but do we want to?

I was thinking we should try minimise the number of DMA-only PEs since
it complicates the EEH freeze handling. When MMIO and DMA are mapped
to the same PE an error on either will cause the hardware to stop
both. When seperate PEs are used for DMA and MMIO you lose that
atomicity. It's not a big deal if DMA is stopped and MMIO allowed
since PAPR (sort-of) allows that, but having MMIO frozen with DMA
unfrozen is a bit sketch.

> >> For the time being, this patchset is good for:
> >> 1. weird hardware which has limited DMA mask (this is why the patchset
> >> was written in the first place)
> >> 2. debug DMA by routing it via IOMMU (even when 4GB hack is not enabled).
> >
> > Sure, but it's still dependent on having firmware which supports the
> > 4GB hack and I don't think that's in any offical firmware releases yet.
>
> It's been a while :-/

There's been no official FW releases with a skiboot that supports the
phb get/set option opal calls so the only systems that can actually
take advantage of it are our lab systems. It might still be useful for
future systems, but I'd rather something that doesn't depend on FW
support.


Oliver
