Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF25231F43
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 15:25:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGvRT22K2zDqHb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 23:25:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12d;
 helo=mail-il1-x12d.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hKZrJADi; dkim-atps=neutral
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGvN95jbHzDqwh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 23:22:15 +1000 (AEST)
Received: by mail-il1-x12d.google.com with SMTP id z17so4245115ill.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 06:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UCWyTb1UTyujoVaF6C3YpPKXd4JjrUv7/CB4E1zkf9w=;
 b=hKZrJADiVsm/IX/0/KeAKFW2lQUV7eHmkEUjKrW/O+KZ7kcJaEMn7TLakTNMIysjpx
 yNfxAf/UojmnXDuwarQCxQ5RmAbX5RLbF8TqjM8qw3AR1qygkhNH/kEg9/PfEktbRMWh
 nXjgl1BDNfkOSGvVBiI9SAlyaggS1CTf9XvKAt0Vvp2FIcIbmv03XHwN5fPEP428S4MS
 anTuaJmTPrsQz5h5hdPubCT4gCK1wP9wfeHVLR2Ox8/lJvy6qOSLJl4bh7YI3b5T/rM5
 j0t0GGLTEKOkksIU1vxNX3R6/Ut1Bqp8Av8HAZy4KP4+hsD+QU3ReKc+33q5C58NeotD
 0m0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UCWyTb1UTyujoVaF6C3YpPKXd4JjrUv7/CB4E1zkf9w=;
 b=Clda3GuZ0jQiowdDYXq3pCMFb0f9j2OQ+2IFzy/BahXQM1eo8nYjKTzedHu+T1Eyas
 IrRD0xbb6tXnikJVIvUa9lHxY0G550i2k4aH2x8Mmpr5HPoaNlfEMYmAgoK00dxyMNsk
 VTlF5GBzVNUTT5c3EBvAqAbFxa4885hJBORztXPTr5gX2aosAlKMk3GhiizdxZ20i1UI
 EfuUxgLQCg+ajK+oCNHi5dt2qJ/z3Ieic1+6ZS70bjpWedH/iv+EA22AvVKSh6wFJIcZ
 C38o9e/ke4E+l4wgHqPvCDuARyYNcGuRIX5ClsgHoyELTk3Du0eiuVALRXAgZbVEv8IN
 9/Ag==
X-Gm-Message-State: AOAM533jOhLff2nDmikmUQL0B47z7FbiQo5ghcozoWhk18zzc3ZucrVP
 +4yWBUfCS+qAI2tobZhMS3SJEmnKjdCoW21WJZc=
X-Google-Smtp-Source: ABdhPJwz7AwbZaKcZG+071c5rlaimIUQzDi2+r2Ez7FbdmfHJm8QOAG5+VtfNRLP9LQef44ZP+WkP1quHRkUEA8ghk0=
X-Received: by 2002:a92:d607:: with SMTP id w7mr3268612ilm.149.1596028932333; 
 Wed, 29 Jul 2020 06:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAO3ALPyB1JDvvC27JGgAoTuHh0w+897tPhmTKX9PQWBFCrrnbQ@mail.gmail.com>
In-Reply-To: <CAO3ALPyB1JDvvC27JGgAoTuHh0w+897tPhmTKX9PQWBFCrrnbQ@mail.gmail.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 29 Jul 2020 23:22:01 +1000
Message-ID: <CAOSf1CEkHLamLXK3HOAZ+w0K=2hTOjn=x5KpDdmRZ4BXVy+P2A@mail.gmail.com>
Subject: Re: ASMedia ASM2142 USB host controller tries to DMA to address zero
 when doing bulk reads from multiple devices
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linux-usb@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 21, 2020 at 3:51 PM Forest Crossman <cyrozap@gmail.com> wrote:
>
> Hello, again!
>
> After fixing the issue in my previous thread using this patch[1], I
> decided to do some stress-testing of the controller to make sure it
> could handle my intended workloads and that there were no further DMA
> address issues that would need to be fixed. Unfortunately, it looks
> like there's still more work to be done: when I try to do long bulk
> reads from multiple devices simultaneously, eventually the host
> controller sends a DMA write to address zero, which then triggers EEH
> in my POWER9 system, causing the controller card to get hotplug-reset,
> which of course kills the disk-reading processes. For more details on
> the EEH errors, you can see my kernel's EEH message log[2].

Take the logged address with a grain of salt. If an error occurs while
translating the DMA address the PHB logs all zeros as the "DMA
Address" because it only keeps around the bits that it needs to fetch
the next level of the TCE table. The EEH dump says the error is due to
a TCE permission mis-match so odds the ASmedia controller is writing
to an address that's already been DMA unmapped, hence the logged
address being zeros.

Sorry, I probably should have mentioned that quirk in the last mail.

> The results of the various tests I performed are listed below.
>
> Test results (all failures are due to DMA writes to address zero, all
> hubs are USB 3.0/3.1 Gen1 only, and all disks are accessed via the
> usb-storage driver):
> - Reading simultaneously from two or more disks behind a hub connected
> to one port on the host controller:
>   - FAIL after 20-50 GB of data transferred for each device.
> - Reading simultaneously from two disks, each connected directly to
> one port on the host controller:
>   - FAIL after about 800 GB of data transferred for each device.
> - Reading from one disk behind a hub connected to one port on the host
> controller:
>   - OK for at least 2.7 TB of data transferred (I didn't test the
> whole 8 TB disk).
> - Writing simultaneously to two FL2000 dongles (using osmo-fl2k's
> "fl2k_test"), each connected directly to one port on the host
> controller:
>   - OK, was able to write several dozen terabytes to each device over
> the course of a little over 21 hours.
>
> Seeing how simultaneous writes to multiple devices and reads from
> single devices both seem to work fine, I assume that means this is
> being caused by some race condition in the host controller firmware
> when it responds to multiple read requests.

Most likely. It's possible it's a platform specific race with DMA
map/unmap too, but I think we would be seeing similar issues with
other devices if it was.

> I also assume we're not
> going to be able to convince ASMedia to both fix the bug in their
> firmware and release the details on how to flash it from Linux, so I
> guess we'll just have to figure out how to make the driver talk to the
> controller in a way that avoids triggering the bad DMA write. As
> before, I decided to try a little kernel hacking of my own before
> sending this email, and tried separately enabling the
> XHCI_BROKEN_STREAMS and XHCI_ASMEDIA_MODIFY_FLOWCONTROL quirks in an
> attempt to fix this. As you might expect since you're reading this
> message, neither of those quirks fixed the issue, nor did they even
> make the transfers last any longer before failing.
>
> So now I've reached the limits of my understanding, and I need some
> help devising a fix. If anyone has any comments to that effect, or any
> questions about my hardware configuration, testing methodology, etc.,
> please don't hesitate to air them. Also, if anyone needs me to perform
> additional tests, or collect more log information, I'd be happy to do
> that as well.

I started writing a tool a while ago to use the internal trace bus to
log incoming TLPs. Something like that might allow you to get a better
idea what the faulting access pattern is, but you would still need to
find a way to mitigate the issue. I'm not all that familiar with USB3
so I'm not much help on that front.
