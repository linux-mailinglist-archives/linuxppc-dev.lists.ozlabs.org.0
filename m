Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9621AD785
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 09:37:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493SbZ61fKzDrdZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 17:37:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Fv4o/3Aq; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493SYS24GKzDrRY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 17:35:23 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id f8so672412plt.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 00:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f1koKxyGAR1m7p4dDyXBsFVXJYYQ/l7Km/MtUpFLMno=;
 b=Fv4o/3AqWJUsFcUD+puQnlNA/hfVta8uZqZAxkihc5TdUJOMPd9Q5Ncc/EPhO3dtQm
 cYOWs+Na+k9/3Xwnvqd/ea18lmWYU7zWOSXwGrEgrNm6zAcANQNaYKrYYFEBS/CVaPQJ
 gx+bo5+LaoX+1J7fXyQTYkBwL6gLdNRhZijhTL2jbQEQuKcFPqct1rAWGwVT5LHeyhut
 sxxOFk/3U+StM223t+DNFXv9fpwLkbH7QIFNwWPwWoJ7GMdItcbPweQ1c6CZ5StvGbCA
 DUYGph5pmtMkMMRhLvCA8JHAvdrflAd1KWx87nwYbjzONUEFEOOIFxqx3zjnjD/c6nO+
 +qCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f1koKxyGAR1m7p4dDyXBsFVXJYYQ/l7Km/MtUpFLMno=;
 b=MWcgGb70W63Q8i9YuYBHJLgqXYdNuhqqWEFWRyFlJ0IYJJ7Ro6nr9s7MD0hhSCmpzL
 ByVLN7rtn26RAXqgTYgPYWfg2QaG6pCREQ32r/UajeXbTlBJOt28xye6/dDIRm23ZAPd
 iDfL6k51uoyG/1S6HGFmxA+SnXbkLY3ioJPVMIz1IXoy4/OauGuT9S2kF0DVKzKrGvKH
 Z9haccI8uOkWVu/LkGfu3SRoXKj/wl3LYE67z+pypBORrpXRh4kWTalWmVnjmrhk1bcR
 ZnFKyl7Sc7s7gQS3Jh5OYfiGp7UH+6vfm/CqokDpbZ1EtMlbilUPf4y+TJbUumzprhMW
 ExYg==
X-Gm-Message-State: AGi0Pubqzq+nYYK1Riv3LGVvqIATpDyBpEhXr68oCmhkh742nlXiIWsC
 YMq6ApeB88N5NgTfD9a6KnBRVK4u
X-Google-Smtp-Source: APiQypKStmKI2WtnXdyhinvJPajd+3HOcOCt3eJI1RByeeUoUuEJlioNXPAcy0M5zg3pnc0arGpbUw==
X-Received: by 2002:a17:90a:bc4a:: with SMTP id
 t10mr2880735pjv.104.1587108919799; 
 Fri, 17 Apr 2020 00:35:19 -0700 (PDT)
Received: from 192-168-1-13.tpgi.com.au (115-64-37-247.static.tpgi.com.au.
 [115.64.37.247])
 by smtp.gmail.com with ESMTPSA id mq18sm5272438pjb.6.2020.04.17.00.35.18
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 00:35:19 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Fix sysfs pci bus rescan on PowerNV (and other things)
Date: Fri, 17 Apr 2020 17:35:04 +1000
Message-Id: <20200417073508.30356-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series is based on top of my previously posted series which reworks
how devices are added to their IOMMU groups. The two series are largely
orthogonal to each other, but they both touch pnv_pci_ioda_dma_dev_setup()
so there's a minor merge conflict if they aren't applied together. I can
fix that if people think it's important, but applying them together is
probably easisest for everyone.

Base series: https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=168715

With that out of the way, what the bulk of the changes in here are in 2/4
which moves the point where we do the HW configuration to allow a bus to be
used. Currently it's done when we setup the parent bridge for that bus and
we're moving it to be done when we add the first device to that bus.

For an example of why this change is necssary this is what happens on the
current linux-next master. This has one extra patch applied to print an
error when pci_enable_device() is blocked by the platform since it helps
highlight the issue:

/sys/devices/pci0022:00/0022:00:00.0 # echo 1 > 0022\:01\:00.0/remove
e1000e 0022:01:00.0 enP34p1s0: removed PHC
e1000e 0022:01:00.0 enP34p1s0: NIC Link is Down
pci 0022:01:00.0: Removing from iommu group 11

At this point the bus 0022:01 is empty.

/sys/devices/pci0022:00/0022:00:00.0 # echo 1 > rescan
pci 0022:01:00.0: [8086:10d3] type 00 class 0x020000
pci 0022:01:00.0: reg 0x10: [mem 0x3fe9000c0000-0x3fe9000dffff]
pci 0022:01:00.0: reg 0x14: [mem 0x3fe900000000-0x3fe90007ffff]
pci 0022:01:00.0: reg 0x18: [io  0x0000-0x001f]
pci 0022:01:00.0: reg 0x1c: [mem 0x3fe9000e0000-0x3fe9000e3fff]
pci 0022:01:00.0: reg 0x30: [mem 0x00000000-0x0003ffff pref]
pci 0022:01:00.0: BAR3 [mem size 0x00004000]: requesting alignment to 0x10000
pci 0022:01:00.0: PME# supported from D0 D3hot D3cold
pci 0022:00:00.0: BAR 13: no space for [io  size 0x1000]
pci 0022:00:00.0: BAR 13: failed to assign [io  size 0x1000]
pci 0022:01:00.0: BAR 1: assigned [mem 0x3fe900000000-0x3fe90007ffff]
pci 0022:01:00.0: BAR 6: assigned [mem 0x3fe900080000-0x3fe9000bffff pref]
pci 0022:01:00.0: BAR 0: assigned [mem 0x3fe9000c0000-0x3fe9000dffff]
pci 0022:01:00.0: BAR 3: assigned [mem 0x3fe9000e0000-0x3fe9000e3fff]
pci 0022:01:00.0: BAR 2: no space for [io  size 0x0020]
pci 0022:01:00.0: BAR 2: failed to assign [io  size 0x0020]
e1000e 0022:01:00.0: pci_enable_device() blocked, no PE assigned.
e1000e: probe of 0022:01:00.0 failed with error -22

So on rescan we can re-discover the device, but the driver probe will
always fail at the point where the driver attemps to enable the device
because the PE was deconfigured.

Repeating this same experiment with this series (and dependency) applied:

/sys/devices/pci0022:00/0022:00:00.0 # echo 1 > rescan
pci 0022:01:00.0: [8086:10d3] type 00 class 0x020000
pci 0022:01:00.0: reg 0x10: [mem 0x3fe9000c0000-0x3fe9000dffff]
pci 0022:01:00.0: reg 0x14: [mem 0x3fe900000000-0x3fe90007ffff]
pci 0022:01:00.0: reg 0x18: [io  0x0000-0x001f]
pci 0022:01:00.0: reg 0x1c: [mem 0x3fe9000e0000-0x3fe9000e3fff]
pci 0022:01:00.0: reg 0x30: [mem 0x00000000-0x0003ffff pref]
pci 0022:01:00.0: BAR3 [mem size 0x00004000]: requesting alignment to 0x10000
pci 0022:01:00.0: PME# supported from D0 D3hot D3cold
pci 0022:00:00.0: BAR 13: no space for [io  size 0x1000]
pci 0022:00:00.0: BAR 13: failed to assign [io  size 0x1000]
pci 0022:01:00.0: BAR 1: assigned [mem 0x3fe900000000-0x3fe90007ffff]
pci 0022:01:00.0: BAR 6: assigned [mem 0x3fe900080000-0x3fe9000bffff pref]
pci 0022:01:00.0: BAR 0: assigned [mem 0x3fe9000c0000-0x3fe9000dffff]
pci 0022:01:00.0: BAR 3: assigned [mem 0x3fe9000e0000-0x3fe9000e3fff]
pci 0022:01:00.0: BAR 2: no space for [io  size 0x0020]
pci 0022:01:00.0: BAR 2: failed to assign [io  size 0x0020]
pci_bus 0022:01: Configuring PE for bus
pci 0022:01     : [PE# fd] Secondary bus 0x0000000000000001 associated with PE#fd
pci 0022:01     : [PE# fd] Setting up 32-bit TCE table at 0..80000000
pci 0022:01     : [PE# fd] Setting up window#0 0..7fffffffff pg=10000
pci 0022:01     : [PE# fd] Enabling 64-bit DMA bypass
pci 0022:01:00.0: Configured PE#fd
pci 0022:01:00.0: Adding to iommu group 12
e1000e 0022:01:00.0: enabling device (0140 -> 0142)
e1000e 0022:01:00.0: Interrupt Throttling Rate (ints/sec) set to dynamic conservative mode
e1000e 0022:01:00.0 0022:01:00.0 (uninitialized): registered PHC clock
e1000e 0022:01:00.0 eth0: (PCI Express:2.5GT/s:Width x1) 68:05:ca:37:9c:d7
e1000e 0022:01:00.0 enP34p1s0: renamed from eth0
e1000e 0022:01:00.0 enP34p1s0: Intel(R) PRO/1000 Network Connection
e1000e 0022:01:00.0 enP34p1s0: MAC: 3, PHY: 8, PBA No: E46981-008
/sys/devices/pci0022:00/0022:00:00.0 #

Now, when the rescan happens we notice the PE was deconfigured after removing
the device and re-configure it. This allows the device to be enabled and
everything works. Probably.

Making this change also lays the groundwork for allowing devices to be
added to a bus PE as they're enabled rather than mapping all 256 devfns
on a bus to the PE in one go. This is going to be necessary for supporting
the native PCIe hotplug driver (rather than pnv_php) since currently
scanning an empty slot causes spurious PE freezes. Keeping inactive
devices mapped to the reserved PE would prevent that from occuring.

It might also be useful for (ab)using PEs to provide per-device
IOMMU contexts rather than per-bus. A per-device context would also be
necessary for allowing individual functions of a device to be passed
through to guests rather than requiring all of them to be passed as a
group.

Oliver


