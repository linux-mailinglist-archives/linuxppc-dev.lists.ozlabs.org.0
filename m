Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A51E3AEA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 20:25:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zbJv3RT1zDqhK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 05:25:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="ilVoazVC"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zYvh28fmzDqPm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 04:22:08 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 73722437F6;
 Thu, 24 Oct 2019 17:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1571937724; x=
 1573752125; bh=KbOhoBktNOYFqC4XkNgg32MLMMlZE2VoUNP5zAtqikY=; b=i
 lVoazVCisQOc0Hi9mJdIB4qpZaXMFFpRnR/NckzU+IZKXMjMOqtur9bZAjSo4PZh
 Db/eYtwoLMqCXIq0cMnOYbAw80QDTWydXkjGh7KRqh6OrSr+nICQvWFyYWEiw22S
 kujQYXjqAalzwHFeh7DGLBysDnJ1L4NANqOIaUP2xY=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JN_zb6lUCFs6; Thu, 24 Oct 2019 20:22:04 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 4BF7E42F14;
 Thu, 24 Oct 2019 20:22:04 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.136) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 24
 Oct 2019 20:22:03 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH RFC 00/11] PCI: hotplug: Movable bus numbers
Date: Thu, 24 Oct 2019 20:21:46 +0300
Message-ID: <20191024172157.878735-1-s.miroshnichenko@yadro.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.15.136]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To allow hotplugging bridges, the kernel or BIOS/bootloader/firmware add
extra bus numbers per slot, but this range may be not enough for a large
bridge and/or nested bridges when hot-adding a chassis full of devices.

This patchset proposes an approach similar to movable BARs: bus numbers are
not reserved anymore, instead the kernel moves the "tail" of the PCI tree
by one, when needed a new bus.

When something like this is going to happen:
                                                                   *LARGE*
 +-[0020:00]---00.0-[01-20]--+-00.0-[02-08]--+-00.0-[03]--   <--  *NESTED*
 |                           |               +-01.0-[04]--        *BRIDGE*
 |                           |               +-02.0-[05]--
 |                           |               +-03.0-[06]--
 |                           |               +-04.0-[07]--
 |                           |               \-05.0-[08]--
 ...

, this will result into the following:

 +-[0020:00]---00.0-[01-22]--+-00.0-[02-22]--+-00.0-[03-1d]----04.0-[04-1d]--+-00.0-[05]--
 |                           |               |                               +-04.0-[06]--
 |                           |               |                               +-09.0-[07]--
 |                           |               |                               +-0c.0-[08-19]----00.0-[09-19]--+-01.0-[0a]--
 |                           |               |                               |                               ...
 |                           |               |                               |                               \-11.0-[19]--
 |                           |               |                               ...
 |                           |               |                               \-15.0-[1d]--
 |                           |               +-01.0-[1e]--  <-- Renamed from 04
 |                           |               +-02.0-[1f]--  <-- Renamed from 05
 |                           |               +-03.0-[20]--  <-- Renamed from 06
 |                           |               +-04.0-[21]--  <-- Renamed from 07
 |                           |               \-05.0-[22]--  <-- Renamed from 08
 ...


This looks to be safe in the kernel, because drivers don't use the raw PCI
BDF ID, and we've tested that on our x86 and PowerNV machines: mass storage
with roots and network adapters just continue their work while their bus
numbers had moved.

But here comes the userspace:

 - procfs entries:

    % ls -la /proc/bus/pci/*
    /proc/bus/pci/00:
    00.0
    02.0
    ...
    1f.4
    1f.6

    /proc/bus/pci/04:
    00.0

    /proc/bus/pci/40:
    00.0

 - sysfs entries:

    % ls -la /sys/devices/pci0000:00/
    0000:00:00.0
    0000:00:02.0
    ...
    0000:00:1f.3
    0000:00:1f.4
    0000:00:1f.6

    % ls -la /sys/devices/pci0000:00/0000:00:1c.6/0000:04:00.0/driver
    driver -> ../../../../bus/pci/drivers/iwlwifi

 - sysfs symlinks:

    % ls -la /sys/bus/pci/devices
    0000:00:00.0 -> ../../../devices/pci0000:00/0000:00:00.0
    0000:00:02.0 -> ../../../devices/pci0000:00/0000:00:02.0
    ...
    0000:04:00.0 -> ../../../devices/pci0000:00/0000:00:1c.6/0000:04:00.0
    0000:40:00.0 -> ../../../devices/pci0000:00/0000:00:1d.2/0000:40:00.0


These patches alter the kernel public API and some internals to be able to
remove these files before changing a bus number, and create new versions
of them after device has changed its BDF.

On one hand, this makes the hotplug predictable, independent of non-kernel
program components (BIOS, bootloader, etc.) and cross-platform, but this is
also a severe ABI violation.

Probably, the udev should have a new action like "rename" in addition to
"add" and "remove".

Is it feasible to have this feature disabled by default, but with a chance
to enable by a kernel command line argument like this:

  pci=realloc,movable_buses

?

This code is follow-up of the "PCI: Allow BAR movement during hotplug"
series (v6).

Sergey Miroshnichenko (11):
  PCI: sysfs: Nullify freed pointers
  PCI: proc: Nullify a freed pointer
  drivers: base: Make bus_add_device() public
  drivers: base: Make device_{add|remove}_class_symlinks() public
  drivers: base: Add bus_disconnect_device()
  powerpc/pci: Enable assigning bus numbers instead of reading them from
    DT
  powerpc/pci: Don't reduce the host bridge bus range
  PCI: Allow expanding the bridges
  PCI: hotplug: Add initial support for movable bus numbers
  PCI: hotplug: movable bus numbers: rename proc and sysfs entries
  PCI: hotplug: movable bus numbers: compact the gaps in numbering

 .../admin-guide/kernel-parameters.txt         |   3 +
 arch/powerpc/kernel/pci-common.c              |   1 -
 arch/powerpc/kernel/pci_dn.c                  |   5 +
 arch/powerpc/platforms/powernv/eeh-powernv.c  |   3 +-
 drivers/base/base.h                           |   1 -
 drivers/base/bus.c                            |  37 +++
 drivers/base/core.c                           |   6 +-
 drivers/pci/pci-sysfs.c                       |   7 +-
 drivers/pci/pci.c                             |   3 +
 drivers/pci/pci.h                             |   2 +
 drivers/pci/probe.c                           | 291 +++++++++++++++++-
 drivers/pci/proc.c                            |   1 +
 include/linux/device.h                        |   5 +
 13 files changed, 351 insertions(+), 14 deletions(-)

-- 
2.23.0

