Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBD1E4FAF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 16:57:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4706fq3Tb2zDqDW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 01:57:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b43;
 helo=mail-yb1-xb43.google.com; envelope-from=carlojpisani@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aXVD993E"; 
 dkim-atps=neutral
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47066c3TbMzDqhK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2019 01:33:27 +1100 (AEDT)
Received: by mail-yb1-xb43.google.com with SMTP id h202so911088ybg.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VpLlVrXP050XVnJUIXmpDOE06SBLEojfDEDD5nCjdx8=;
 b=aXVD993EyjjlRE/4BDk931Uo2YpeNAtohcIStuXUMcmzwU+3gUHAQ4nJNTBSUOl3Wx
 MtFmyLreQ2tZgFvlv3aHSJwLX/pGtK1hyPvgo8dHWq0N1bryYpE+0ETxi2FOx2Zw4drr
 EHSBUhlfZRLBBemzPkSNwDJvLoSTvNlmdgI9YKkfADWJ8Xoe17ybwfHB5MiVAVKHBtDj
 pxGksbzwxkZtcSBNMa9SW5gnP2EGR+R2I/naLTVQ9AtEU/8h/mXV+EYxNQgVWqiFJVk9
 V0wxUIEoSuh8nrZWqW3GZ6Sc7E+HpibYvJw/Sxsho+NWasKJW5RUNR96elbrbSuVlWqo
 y2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VpLlVrXP050XVnJUIXmpDOE06SBLEojfDEDD5nCjdx8=;
 b=EW189oQy5VfgosOsE/cRB9Sl17W7Gl4ufh7gg3kHuKhmZVl2v4aelnb2fqXePKwyCU
 NtTTdNNnkd4GZldSuQScAmBY3mAU3JX4Ikbcj/KmRbsM0J8RflA4LGQnOBH11eOyLISQ
 E/74X10NJj82nHYVd0HBRiaUxlGR30vmhZOQWpukcLHnmvzHTafobrxewMysR3mHfzDP
 A9yZjmxUn7gFkJrOhPE7CKNIc49rgjasYR/WQdm+0qcGdvmrEg3zQILRgDEem2p0GGau
 7bSTQ6q8LVmFShAe/D/O04Rqj7023rWhheiUHsz7iTzvSzR7jtq9ynq3XA7maOrnEFnx
 GL3g==
X-Gm-Message-State: APjAAAVBnyZ2huZDj+VDyj1gMt+4S3ObXmCX9ouO5nuBa16XVKMAFElL
 GPHzBEHq8ZEmuuSOofPE8pmqgaFsDbKgdorKYjA=
X-Google-Smtp-Source: APXvYqzUyqixnUEX3eyIPitt4o6OCLL0sX0/q8zK369OM2OxCQgq4yNTFjgQQMYY155qq7w/cN7UgykWwp6YvnltHHc=
X-Received: by 2002:a25:30d5:: with SMTP id w204mr3459375ybw.382.1572014002286; 
 Fri, 25 Oct 2019 07:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20191024171228.877974-1-s.miroshnichenko@yadro.com>
 <20191024171228.877974-2-s.miroshnichenko@yadro.com>
In-Reply-To: <20191024171228.877974-2-s.miroshnichenko@yadro.com>
From: Carlo Pisani <carlojpisani@gmail.com>
Date: Fri, 25 Oct 2019 16:33:13 +0200
Message-ID: <CA+QBN9AR+drU0zC2-C2zVetTv0GxNs0KRF1BG51mwcRyu=TxpA@mail.gmail.com>
Subject: Oxford Semiconductor Ltd OX16PCI954 - weird dmesg
To: linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pci_bus 0000:00: root bus resource [mem 0x50000000-0x5fffffff]
pci_bus 0000:00: root bus resource [io  0x18800000-0x188fffff]
pci_bus 0000:00: root bus resource [??? 0x00000000 flags 0x0]
pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]
pci 0000:00:00.0: [Firmware Bug]: reg 0x14: invalid BAR (can't size)
pci 0000:00:00.0: [Firmware Bug]: reg 0x18: invalid BAR (can't size)
pci 0000:00:04.0: BAR 0: assigned [mem 0x50000000-0x5000ffff]
pci 0000:00:05.0: BAR 1: assigned [mem 0x50010000-0x50010fff]
pci 0000:00:05.0: BAR 3: assigned [mem 0x50011000-0x50011fff]
pci 0000:00:0a.0: BAR 1: assigned [mem 0x50012000-0x50012fff]
pci 0000:00:0a.0: BAR 3: assigned [mem 0x50013000-0x50013fff]
pci 0000:00:02.0: BAR 0: assigned [io  0x18800000-0x188000ff]
pci 0000:00:02.0: BAR 1: assigned [mem 0x50014000-0x500140ff]
pci 0000:00:03.0: BAR 0: assigned [io  0x18800400-0x188004ff]
pci 0000:00:03.0: BAR 1: assigned [mem 0x50014100-0x500141ff]
pci 0000:00:05.0: BAR 0: assigned [io  0x18800800-0x1880081f]
pci 0000:00:05.0: BAR 2: assigned [io  0x18800820-0x1880083f]
pci 0000:00:0a.0: BAR 0: assigned [io  0x18800840-0x1880085f]
pci 0000:00:0a.0: BAR 2: assigned [io  0x18800860-0x1880087f]


00:00.0 Non-VGA unclassified device: Integrated Device Technology,
Inc. Device 0000
        Subsystem: Device 0214:011d
        Flags: bus master, 66MHz, medium devsel, latency 60, IRQ 140
        Memory at <unassigned> (32-bit, prefetchable)
        I/O ports at <ignored>
        I/O ports at <ignored>

00:02.0 Ethernet controller: VIA Technologies, Inc. VT6105/VT6106S
[Rhine-III] (rev 86)
        Subsystem: AST Research Inc Device 086c
        Flags: bus master, stepping, medium devsel, latency 64, IRQ 142
        I/O ports at 18800000 [size=256]
        Memory at 50014000 (32-bit, non-prefetchable) [size=256]
        Capabilities: [40] Power Management version 2
        Kernel driver in use: via-rhine

00:03.0 Ethernet controller: VIA Technologies, Inc. VT6105/VT6106S
[Rhine-III] (rev 86)
        Subsystem: AST Research Inc Device 086c
        Flags: bus master, stepping, medium devsel, latency 64, IRQ 143
        I/O ports at 18800400 [size=256]
        Memory at 50014100 (32-bit, non-prefetchable) [size=256]
        Capabilities: [40] Power Management version 2
        Kernel driver in use: via-rhine

00:04.0 Network controller: Atheros Communications Inc. Device 0029 (rev 01)
        Subsystem: Atheros Communications Inc. Device 2091
        Flags: bus master, 66MHz, medium devsel, latency 168, IRQ 142
        Memory at 50000000 (32-bit, non-prefetchable) [size=64K]
        Capabilities: [44] Power Management version 2
        Kernel driver in use: ath9k

00:05.0 Serial controller: Oxford Semiconductor Ltd OX16PCI954 (Quad
16950 UART) function 0 (Uart) (rev 01) (prog-if 06 [)
        Subsystem: Oxford Semiconductor Ltd Device 0000
        Flags: medium devsel, IRQ 143
        I/O ports at 18800800 [size=32]
        Memory at 50010000 (32-bit, non-prefetchable) [size=4K]
        I/O ports at 18800820 [size=32]
        Memory at 50011000 (32-bit, non-prefetchable) [size=4K]
        Capabilities: [40] Power Management version 2
        Kernel driver in use: serial

00:05.1 Non-VGA unclassified device: Oxford Semiconductor Ltd
OX16PCI954 (Quad 16950 UART) function 0 (Disabled) (rev 01)
        Subsystem: Oxford Semiconductor Ltd Device 0000
        Flags: medium devsel, IRQ 143
        I/O ports at <unassigned> [disabled]
        I/O ports at <unassigned> [disabled]
        I/O ports at <unassigned> [disabled]
        Capabilities: [40] Power Management version 2

00:0a.0 Serial controller: Oxford Semiconductor Ltd OX16PCI954 (Quad
16950 UART) function 0 (Uart) (rev 01) (prog-if 06 [)
        Subsystem: Oxford Semiconductor Ltd Device 0000
        Flags: medium devsel, IRQ 140
        I/O ports at 18800840 [size=32]
        Memory at 50012000 (32-bit, non-prefetchable) [size=4K]
        I/O ports at 18800860 [size=32]
        Memory at 50013000 (32-bit, non-prefetchable) [size=4K]
        Capabilities: [40] Power Management version 2
        Kernel driver in use: serial

00:0a.1 Non-VGA unclassified device: Oxford Semiconductor Ltd
OX16PCI954 (Quad 16950 UART) function 0 (Disabled) (rev 01)
        Subsystem: Oxford Semiconductor Ltd Device 0000
        Flags: medium devsel, IRQ 140
        I/O ports at <unassigned> [disabled]
        I/O ports at <unassigned> [disabled]
        I/O ports at <unassigned> [disabled]
        Capabilities: [40] Power Management version 2


hi guys
I have a couple of miniPCI Oxford Semiconductor Ltd OX16PCI954 cards
installed, and the dmesg looks weird

espeially these lines
pci_bus 0000:00: root bus resource [mem 0x50000000-0x5fffffff]
pci_bus 0000:00: root bus resource [io  0x18800000-0x188fffff]
pci_bus 0000:00: root bus resource [??? 0x00000000 flags 0x0]
pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]
pci 0000:00:00.0: [Firmware Bug]: reg 0x14: invalid BAR (can't size)
pci 0000:00:00.0: [Firmware Bug]: reg 0x18: invalid BAR (can't size)

besides, I am experimenting crashes happening in burn-in tests, and I
do suspect it's something related to the newly added cards

any enlightenment?
