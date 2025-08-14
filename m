Return-Path: <linuxppc-dev+bounces-10969-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DC3B25BC6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 08:29:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2b1M3c8Rz30T9;
	Thu, 14 Aug 2025 16:29:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.187.169.70
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755152951;
	cv=none; b=j/ahtcAy+AtyvFvK7ftiBMwcKk1NL01yotAUDBbaY14SpAQM3wF5fZZUpAMCTq83JLXno+97KQoig2Cp/2CNpV+He3yhGmLMoVGCMJSdMtUete+u9O+vEwniEisH6Utf6oTEfginHiOwyv3XJ8LP+2CEjPeYqSvT2JXAH0QApNjD7vmZwaBFPSwvcW8k7VnvLslnj0dG8IELf9Zn1WG5i3E4PR3IV7mbctNEEu86kRl0hRTYvm1ovwLXhiCW/mTzUbCR0mPuyqThRyODOdRPGLujQNZ/Yc7iQhsSCbprlqnzZQ7Sl4Rwk4I3ZMnGK01rw7XbH+A3NQhM7200WEz/uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755152951; c=relaxed/relaxed;
	bh=/qYXK+GQPFNVwlE0kyVjHerRMGCEFm6mLZMcsvi3uzc=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=EnC5aDEVLF4ZA4DXiFpfkRhMh5ca4VQliQYjBTWRyiH2nvnkb/oZkodDNxaWsTH8ZOTyph0EWQc4vdxt6oicuB1DwnCzqKU5xTTQ6wfBSBaH2OJ0MNoQIjKbm7AX8WUOKXW8OfkGv9ysdpCPnwapjdJreYZue5Oyf8nV31P/VjhvWckX0Cs0ljuJXiG28eRQSlnwy6qaUTQVS7JXAbHD0IirY7mq8QcCz1dP0F64P3E2m3DT27+4w4kSIB0kYYr6yMB6sQxQZVEi4aTbn7jq821KYKlzAStzbNbe4u3DGagTzrR3HSt+rDJxiZXEVar7IicTp7dV8K9ll/HDBwROaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hogyros.de; spf=pass (client-ip=185.187.169.70; helo=psionic.psi5.com; envelope-from=simon.richter@hogyros.de; receiver=lists.ozlabs.org) smtp.mailfrom=hogyros.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hogyros.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hogyros.de (client-ip=185.187.169.70; helo=psionic.psi5.com; envelope-from=simon.richter@hogyros.de; receiver=lists.ozlabs.org)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2b1L3Q5Xz2yhX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 16:29:08 +1000 (AEST)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by psionic.psi5.com (Postfix) with ESMTPSA id D81F53F019;
	Thu, 14 Aug 2025 08:29:03 +0200 (CEST)
Message-ID: <ae2a4fb6-9107-4362-b28e-92c40de1c2a2@hogyros.de>
Date: Thu, 14 Aug 2025 15:29:00 +0900
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org
From: Simon Richter <Simon.Richter@hogyros.de>
Subject: "Failed to create device link (0x124)" for Intel Management Engine
 Interface on Xe graphics
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

I'm trying to enable the MEI on my graphics card, to allow for firmware 
updates. The MEI is enumerated through an auxiliary bus, so it is 
detected only when the main driver is loaded.

The MEI driver tries to register an interrupt. On PPC64 (LE), I get:

xe 0030:03:00.0: enabling device (0140 -> 0142)
xe 0030:03:00.0: [drm] unbounded parent pci bridge, device won't support 
any PM support.
xe 0030:03:00.0: [drm] Found battlemage (device ID e20b) discrete 
display version 14.01 stepping B0
...
pci 0030:02:01.0: Failed to create device link (0x124) with supplier 
0.interrupt-controller for /pciex@620c3c0000000/pci@0/pci@0/pci@1
pci 0030:01:00.0: Failed to create device link (0x124) with supplier 
0.interrupt-controller for /pciex@620c3c0000000/pci@0/pci@0
pci 0030:00:00.0: Failed to create device link (0x124) with supplier 
0.interrupt-controller for /pciex@620c3c0000000/pci@0
mei_gsc xe.mei-gscfi.3146496: irq register failed -22
mei_gsc xe.mei-gscfi.3146496: probe failed: -22
mei_gsc xe.mei-gscfi.3146496: probe with driver mei_gsc failed with 
error -22

My initial suspicion was that this is caused by

     pcie_ports_disabled = true;

in arch/powerpc/platforms/powernv/pci.c:784 which stops the pcieport 
driver from being registered, and attaching to all the PCIe bridge 
ports, so there is neither power management nor something for the device 
link to attach to.

Simply commenting out this line does not change anything though: lspci 
shows the driver as registered and bound to the bridges, but it still 
complains about a lack of power management, still fails to create device 
links, and still fails to register the irq for the MEI.

So clearly there is something I've overlooked, and I'm a bit less 
confident now that the failure to register the IRQ is related to the 
"device link" functionality.

Since the weekend is coming up and I should have a bit of time to try 
things then:

1. how is this supposed to work on PPC? Should there be an OPAL call for 
power management of non-root PCIe bridges (i.e. "someone should write a 
driver"), or should non-root bridges be managed by pcieport as normal?

2. how is this interrupt supposed to work on Xe? is that a separate 
interrupt that needs to be requested and routed in addition to the MSI 
we already have, or is the MSI shared?

3. are these problems actually related, or did I misinterpret anything?
    Simon

