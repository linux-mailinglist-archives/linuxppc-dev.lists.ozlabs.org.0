Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CAA227858
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 07:51:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9nlw6MNHzDqhF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 15:51:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=cyrozap@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bOK7kcAW; dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9nkF0c7zzDqW7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 15:50:12 +1000 (AEST)
Received: by mail-lf1-x144.google.com with SMTP id j21so11003740lfe.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 22:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=dt80hbEOtASF8k7tNC7l6WffPpiCUoKmZ9tNVyqMSXA=;
 b=bOK7kcAWGZTbReRstO98MjoMLM20jr1puDwabwv/D3lydkSXe+ns4b3Q3GRzgg1gM6
 blOkZ3vMYBRhayjrN5jDwtMrOI8A9ESd1gQnDKTZTcCZtDxWV5MT/Plcp5J4vhtk0E7y
 8nfmlAULuzEeHrpwVbTD8ekx1tiAXf4TJ/CE4FJdwYXasiJ+GUifx7rBhFM67ohW7GiA
 wPMQZ/PzRf4eUDJU/NkdjeaiEJTwoQLaMcguSI9no/rP7DDwbAb3KYzRhUxW0nLhhDjU
 QQkt3TrzljAjQRWmsL6kPu1dNM2gwlcG4myYj7W/pkiqgLr3nxxO9zEy4QoeKkgO2NQM
 nglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=dt80hbEOtASF8k7tNC7l6WffPpiCUoKmZ9tNVyqMSXA=;
 b=kxYQ8jPGzZRFBATxnsI7fi5s35jvwM5hwtAfHS0YFepkWmqlR9WG7q6ZeTxorX5uvT
 8B/il1wpP9NPHgKzK+DG9G/QKm2iYDstoipG36cjm8kDiyffyKQwTq+wLYUsQIrQq1No
 8Jb0N9/YsfaQ3FkDDiJ16u7f80dsgGtefJCy8P2rsjhg2Kn8T76Vj1qvrhFZ1JZinZb/
 Mskld7fDiVdZyA7WZy0uiUky6HiJpHh8fR5cRFch8p73VSNzdEjInhSVTgNOPBmLQoJU
 Hgi/KyNSujR0PVchLp4xRlbusDgAEmgpeEGf7pdaRRo8jzRCVCwH6yREJ8XMs5JX6zmy
 +82A==
X-Gm-Message-State: AOAM5328gSd6vwXv6VXUSAB90Qq2ZBqSsoBNZ535lUg1kEyFj6jz4uys
 lHtry4urP1m56BJVcaoN0hj09S0ZlH0+G5FX/7M=
X-Google-Smtp-Source: ABdhPJw0BsG4TjWzV4eP2VNRtAnmub/GrcV0vvv9EBrlAUjH4gypW0yhy5+fGOVGwOoPHjZNtLImfZQaX4XMWxyrP88=
X-Received: by 2002:a19:c7d0:: with SMTP id x199mr7356452lff.205.1595310606453; 
 Mon, 20 Jul 2020 22:50:06 -0700 (PDT)
MIME-Version: 1.0
From: Forest Crossman <cyrozap@gmail.com>
Date: Tue, 21 Jul 2020 00:49:55 -0500
Message-ID: <CAO3ALPyB1JDvvC27JGgAoTuHh0w+897tPhmTKX9PQWBFCrrnbQ@mail.gmail.com>
Subject: ASMedia ASM2142 USB host controller tries to DMA to address zero when
 doing bulk reads from multiple devices
To: linux-usb@vger.kernel.org
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello, again!

After fixing the issue in my previous thread using this patch[1], I
decided to do some stress-testing of the controller to make sure it
could handle my intended workloads and that there were no further DMA
address issues that would need to be fixed. Unfortunately, it looks
like there's still more work to be done: when I try to do long bulk
reads from multiple devices simultaneously, eventually the host
controller sends a DMA write to address zero, which then triggers EEH
in my POWER9 system, causing the controller card to get hotplug-reset,
which of course kills the disk-reading processes. For more details on
the EEH errors, you can see my kernel's EEH message log[2]. The
results of the various tests I performed are listed below.

Test results (all failures are due to DMA writes to address zero, all
hubs are USB 3.0/3.1 Gen1 only, and all disks are accessed via the
usb-storage driver):
- Reading simultaneously from two or more disks behind a hub connected
to one port on the host controller:
  - FAIL after 20-50 GB of data transferred for each device.
- Reading simultaneously from two disks, each connected directly to
one port on the host controller:
  - FAIL after about 800 GB of data transferred for each device.
- Reading from one disk behind a hub connected to one port on the host
controller:
  - OK for at least 2.7 TB of data transferred (I didn't test the
whole 8 TB disk).
- Writing simultaneously to two FL2000 dongles (using osmo-fl2k's
"fl2k_test"), each connected directly to one port on the host
controller:
  - OK, was able to write several dozen terabytes to each device over
the course of a little over 21 hours.

Seeing how simultaneous writes to multiple devices and reads from
single devices both seem to work fine, I assume that means this is
being caused by some race condition in the host controller firmware
when it responds to multiple read requests. I also assume we're not
going to be able to convince ASMedia to both fix the bug in their
firmware and release the details on how to flash it from Linux, so I
guess we'll just have to figure out how to make the driver talk to the
controller in a way that avoids triggering the bad DMA write. As
before, I decided to try a little kernel hacking of my own before
sending this email, and tried separately enabling the
XHCI_BROKEN_STREAMS and XHCI_ASMEDIA_MODIFY_FLOWCONTROL quirks in an
attempt to fix this. As you might expect since you're reading this
message, neither of those quirks fixed the issue, nor did they even
make the transfers last any longer before failing.

So now I've reached the limits of my understanding, and I need some
help devising a fix. If anyone has any comments to that effect, or any
questions about my hardware configuration, testing methodology, etc.,
please don't hesitate to air them. Also, if anyone needs me to perform
additional tests, or collect more log information, I'd be happy to do
that as well.


Thanks in advance for your help,

Forest


[1]: https://patchwork.kernel.org/patch/11669989/
[2]: https://paste.debian.net/hidden/2a442aa6
