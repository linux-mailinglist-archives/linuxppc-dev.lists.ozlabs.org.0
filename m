Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7010CE516F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 18:39:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4708w3319hzDqsQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 03:39:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="i7via2c0"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4708sj2CTjzDqnv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2019 03:37:28 +1100 (AEDT)
Received: from localhost (odyssey.drury.edu [64.22.249.253])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8BB4C21872;
 Fri, 25 Oct 2019 16:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572021445;
 bh=WhIoGgltuLJwktQnUdu37d8EQjzrGwE98l51YGKpHoM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=i7via2c09Y8LHo35j1mwPm7qBRnwGFKjoxH2jIbLp1Zn07l1ytjd7Ud/Wx5gsSz7C
 M3fw7kimAnqMiaLvUhx3xyr/dhACu+7Sje3GMtC/1eGYsEkCyIEjDWJRSjj74GKh2F
 aiUwqQ4tU+H36Gwrug5pmEOy3CeFuQjkIs9TPkY0=
Date: Fri, 25 Oct 2019 11:37:24 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Carlo Pisani <carlojpisani@gmail.com>
Subject: Re: Oxford Semiconductor Ltd OX16PCI954 - weird dmesg
Message-ID: <20191025163724.GA144828@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+QBN9AR+drU0zC2-C2zVetTv0GxNs0KRF1BG51mwcRyu=TxpA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 25, 2019 at 04:33:13PM +0200, Carlo Pisani wrote:
> pci_bus 0000:00: root bus resource [mem 0x50000000-0x5fffffff]
> pci_bus 0000:00: root bus resource [io  0x18800000-0x188fffff]
> pci_bus 0000:00: root bus resource [??? 0x00000000 flags 0x0]
> pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]
> pci 0000:00:00.0: [Firmware Bug]: reg 0x14: invalid BAR (can't size)
> pci 0000:00:00.0: [Firmware Bug]: reg 0x18: invalid BAR (can't size)
> pci 0000:00:04.0: BAR 0: assigned [mem 0x50000000-0x5000ffff]
> pci 0000:00:05.0: BAR 1: assigned [mem 0x50010000-0x50010fff]
> pci 0000:00:05.0: BAR 3: assigned [mem 0x50011000-0x50011fff]
> pci 0000:00:0a.0: BAR 1: assigned [mem 0x50012000-0x50012fff]
> pci 0000:00:0a.0: BAR 3: assigned [mem 0x50013000-0x50013fff]
> pci 0000:00:02.0: BAR 0: assigned [io  0x18800000-0x188000ff]
> pci 0000:00:02.0: BAR 1: assigned [mem 0x50014000-0x500140ff]
> pci 0000:00:03.0: BAR 0: assigned [io  0x18800400-0x188004ff]
> pci 0000:00:03.0: BAR 1: assigned [mem 0x50014100-0x500141ff]
> pci 0000:00:05.0: BAR 0: assigned [io  0x18800800-0x1880081f]
> pci 0000:00:05.0: BAR 2: assigned [io  0x18800820-0x1880083f]
> pci 0000:00:0a.0: BAR 0: assigned [io  0x18800840-0x1880085f]
> pci 0000:00:0a.0: BAR 2: assigned [io  0x18800860-0x1880087f]
> 
> 
> 00:00.0 Non-VGA unclassified device: Integrated Device Technology,
> Inc. Device 0000
>         Subsystem: Device 0214:011d
>         Flags: bus master, 66MHz, medium devsel, latency 60, IRQ 140
>         Memory at <unassigned> (32-bit, prefetchable)
>         I/O ports at <ignored>
>         I/O ports at <ignored>
> 
> 00:02.0 Ethernet controller: VIA Technologies, Inc. VT6105/VT6106S
> [Rhine-III] (rev 86)
>         Subsystem: AST Research Inc Device 086c
>         Flags: bus master, stepping, medium devsel, latency 64, IRQ 142
>         I/O ports at 18800000 [size=256]
>         Memory at 50014000 (32-bit, non-prefetchable) [size=256]
>         Capabilities: [40] Power Management version 2
>         Kernel driver in use: via-rhine
> 
> 00:03.0 Ethernet controller: VIA Technologies, Inc. VT6105/VT6106S
> [Rhine-III] (rev 86)
>         Subsystem: AST Research Inc Device 086c
>         Flags: bus master, stepping, medium devsel, latency 64, IRQ 143
>         I/O ports at 18800400 [size=256]
>         Memory at 50014100 (32-bit, non-prefetchable) [size=256]
>         Capabilities: [40] Power Management version 2
>         Kernel driver in use: via-rhine
> 
> 00:04.0 Network controller: Atheros Communications Inc. Device 0029 (rev 01)
>         Subsystem: Atheros Communications Inc. Device 2091
>         Flags: bus master, 66MHz, medium devsel, latency 168, IRQ 142
>         Memory at 50000000 (32-bit, non-prefetchable) [size=64K]
>         Capabilities: [44] Power Management version 2
>         Kernel driver in use: ath9k
> 
> 00:05.0 Serial controller: Oxford Semiconductor Ltd OX16PCI954 (Quad
> 16950 UART) function 0 (Uart) (rev 01) (prog-if 06 [)
>         Subsystem: Oxford Semiconductor Ltd Device 0000
>         Flags: medium devsel, IRQ 143
>         I/O ports at 18800800 [size=32]
>         Memory at 50010000 (32-bit, non-prefetchable) [size=4K]
>         I/O ports at 18800820 [size=32]
>         Memory at 50011000 (32-bit, non-prefetchable) [size=4K]
>         Capabilities: [40] Power Management version 2
>         Kernel driver in use: serial
> 
> 00:05.1 Non-VGA unclassified device: Oxford Semiconductor Ltd
> OX16PCI954 (Quad 16950 UART) function 0 (Disabled) (rev 01)
>         Subsystem: Oxford Semiconductor Ltd Device 0000
>         Flags: medium devsel, IRQ 143
>         I/O ports at <unassigned> [disabled]
>         I/O ports at <unassigned> [disabled]
>         I/O ports at <unassigned> [disabled]
>         Capabilities: [40] Power Management version 2
> 
> 00:0a.0 Serial controller: Oxford Semiconductor Ltd OX16PCI954 (Quad
> 16950 UART) function 0 (Uart) (rev 01) (prog-if 06 [)
>         Subsystem: Oxford Semiconductor Ltd Device 0000
>         Flags: medium devsel, IRQ 140
>         I/O ports at 18800840 [size=32]
>         Memory at 50012000 (32-bit, non-prefetchable) [size=4K]
>         I/O ports at 18800860 [size=32]
>         Memory at 50013000 (32-bit, non-prefetchable) [size=4K]
>         Capabilities: [40] Power Management version 2
>         Kernel driver in use: serial
> 
> 00:0a.1 Non-VGA unclassified device: Oxford Semiconductor Ltd
> OX16PCI954 (Quad 16950 UART) function 0 (Disabled) (rev 01)
>         Subsystem: Oxford Semiconductor Ltd Device 0000
>         Flags: medium devsel, IRQ 140
>         I/O ports at <unassigned> [disabled]
>         I/O ports at <unassigned> [disabled]
>         I/O ports at <unassigned> [disabled]
>         Capabilities: [40] Power Management version 2
> 
> 
> hi guys
> I have a couple of miniPCI Oxford Semiconductor Ltd OX16PCI954 cards
> installed, and the dmesg looks weird
> 
> espeially these lines
> pci_bus 0000:00: root bus resource [mem 0x50000000-0x5fffffff]
> pci_bus 0000:00: root bus resource [io  0x18800000-0x188fffff]
> pci_bus 0000:00: root bus resource [??? 0x00000000 flags 0x0]
> pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]

These resources are supplied to the PCI core, probably from DT.  A
complete dmesg log would show more.

> pci 0000:00:00.0: [Firmware Bug]: reg 0x14: invalid BAR (can't size)
> pci 0000:00:00.0: [Firmware Bug]: reg 0x18: invalid BAR (can't size)

> besides, I am experimenting crashes happening in burn-in tests, and I
> do suspect it's something related to the newly added cards

If you take the cards out do the lines you mention above change?

What sort of crashes do you see?  I assume it doesn't crash without
the cards?

It *looks* like the miniPCI cards should be these devices:

  00:05.0 Serial controller: Oxford Semiconductor Ltd OX16PCI954 (Quad 16950 UART) function 0 (Uart) (rev 01) (prog-if 06 [)
  00:0a.0 Serial controller: Oxford Semiconductor Ltd OX16PCI954 (Quad 16950 UART) function 0 (Uart) (rev 01) (prog-if 06 [)

which are unrelated to the 00:00.0 device with the broken BAR.
