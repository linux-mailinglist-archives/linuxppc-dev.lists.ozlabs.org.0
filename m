Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BD52D2EA2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 16:53:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr4TM06fpzDqgk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 02:53:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=2a01:4f8:151:8464::1:2;
 helo=ssl.serverraum.org; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=lSBFmq85; 
 dkim-atps=neutral
X-Greylist: delayed 562 seconds by postgrey-1.36 at bilbo;
 Wed, 09 Dec 2020 02:51:40 AEDT
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr4Rc5R8ZzDq5k
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 02:51:40 +1100 (AEDT)
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5C6E922EE4;
 Tue,  8 Dec 2020 16:41:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1607442124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9yBisYyB2bD6gn1VWn1SFtDRL1C9CgXOzAYJOZvXGWw=;
 b=lSBFmq85KbtIM/ZE5UIxiNa9nSxwcIoHUikj2utoZfMdugGpDtwVkJDBJD8Ez+uD8XWebu
 VpjEFoiWbOCaUD2g83EBaO6mbaWmcQ3Gb0cl0mSnFOziRM/aDg7B9bSUNvrhhyXHJSkHmc
 UQK1q8csk8ShhCcQ/QMI2sobEHbavFs=
From: Michael Walle <michael@walle.cc>
To: lorenzo.pieralisi@arm.com
Subject: Re: [PATCH v6 0/5] PCI: Unify ECAM constants in native PCI Express
 drivers
Date: Tue,  8 Dec 2020 16:41:50 +0100
Message-Id: <20201208154150.20978-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <160683676668.20365.13565676178464743008.b4-ty@arm.com>
References: <160683676668.20365.13565676178464743008.b4-ty@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: kw@linux.com, heiko@sntech.de, shawn.lin@rock-chips.com, paulus@samba.org,
 Michael Walle <michael@walle.cc>, thomas.petazzoni@bootlin.com,
 jonnyc@amazon.com, toan@os.amperecomputing.com, will@kernel.org,
 robh@kernel.org, f.fainelli@gmail.com, michal.simek@xilinx.com,
 linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 jonathan.derrick@intel.com, linux-pci@vger.kernel.org, rjui@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Jonathan.Cameron@huawei.com,
 bhelgaas@google.com, linux-arm-kernel@lists.infradead.org,
 sbranden@broadcom.com, wangzhou1@hisilicon.com, rrichter@marvell.com,
 linuxppc-dev@lists.ozlabs.org, nsaenzjulienne@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Lorenzo, Krzysztof,

>On Sun, 29 Nov 2020 23:07:38 +0000, Krzysztof Wilczyński wrote:
>> Unify ECAM-related constants into a single set of standard constants
>> defining memory address shift values for the byte-level address that can
>> be used when accessing the PCI Express Configuration Space, and then
>> move native PCI Express controller drivers to use newly introduced
>> definitions retiring any driver-specific ones.
>> 
>> The ECAM ("Enhanced Configuration Access Mechanism") is defined by the
>> PCI Express specification (see PCI Express Base Specification, Revision
>> 5.0, Version 1.0, Section 7.2.2, p. 676), thus most hardware should
>> implement it the same way.
>> 
>> [...]
>
>Applied to pci/ecam, thanks!
>
>[1/5] PCI: Unify ECAM constants in native PCI Express drivers
>      https://git.kernel.org/lpieralisi/pci/c/f3c07cf692
>[2/5] PCI: thunder-pem: Add constant for custom ".bus_shift" initialiser
>      https://git.kernel.org/lpieralisi/pci/c/3c38579263
>[3/5] PCI: iproc: Convert to use the new ECAM constants
>      https://git.kernel.org/lpieralisi/pci/c/333ec9d3cc
>[4/5] PCI: vmd: Update type of the __iomem pointers
>      https://git.kernel.org/lpieralisi/pci/c/89094c12ea
>[5/5] PCI: xgene: Removed unused ".bus_shift" initialisers from pci-xgene.c
>      https://git.kernel.org/lpieralisi/pci/c/3dc62532a5

Patch 1/5 breaks LS1028A boards:

[..]
[    1.144426] pci-host-generic 1f0000000.pcie: host bridge /soc/pcie@1f0000000 ranges:
[    1.152276] pci-host-generic 1f0000000.pcie:      MEM 0x01f8000000..0x01f815ffff -> 0x0000000000
[    1.161161] pci-host-generic 1f0000000.pcie:      MEM 0x01f8160000..0x01f81cffff -> 0x0000000000
[    1.170043] pci-host-generic 1f0000000.pcie:      MEM 0x01f81d0000..0x01f81effff -> 0x0000000000
[    1.178924] pci-host-generic 1f0000000.pcie:      MEM 0x01f81f0000..0x01f820ffff -> 0x0000000000
[    1.187805] pci-host-generic 1f0000000.pcie:      MEM 0x01f8210000..0x01f822ffff -> 0x0000000000
[    1.196686] pci-host-generic 1f0000000.pcie:      MEM 0x01f8230000..0x01f824ffff -> 0x0000000000
[    1.205562] pci-host-generic 1f0000000.pcie:      MEM 0x01fc000000..0x01fc3fffff -> 0x0000000000
[    1.214465] pci-host-generic 1f0000000.pcie: ECAM at [mem 0x1f0000000-0x1f00fffff] for [bus 00]
[    1.223318] pci-host-generic 1f0000000.pcie: PCI host bridge to bus 0000:00
[    1.230350] pci_bus 0000:00: root bus resource [bus 00]
[    1.235625] pci_bus 0000:00: root bus resource [mem 0x1f8000000-0x1f815ffff] (bus address [0x00000000-0x0015ffff])
[    1.246077] pci_bus 0000:00: root bus resource [mem 0x1f8160000-0x1f81cffff pref] (bus address [0x00000000-0x0006ffff])
[    1.256969] pci_bus 0000:00: root bus resource [mem 0x1f81d0000-0x1f81effff] (bus address [0x00000000-0x0001ffff])
[    1.267427] pci_bus 0000:00: root bus resource [mem 0x1f81f0000-0x1f820ffff pref] (bus address [0x00000000-0x0001ffff])
[    1.278326] pci_bus 0000:00: root bus resource [mem 0x1f8210000-0x1f822ffff] (bus address [0x00000000-0x0001ffff])
[    1.288779] pci_bus 0000:00: root bus resource [mem 0x1f8230000-0x1f824ffff pref] (bus address [0x00000000-0x0001ffff])
[    1.299669] pci_bus 0000:00: root bus resource [mem 0x1fc000000-0x1fc3fffff] (bus address [0x00000000-0x003fffff])
[    1.310138] pci 0000:00:00.0: [1957:e100] type 00 class 0x020001
[    1.316234] pci 0000:00:00.0: BAR 0: [mem 0x1f8000000-0x1f803ffff 64bit] (from Enhanced Allocation, properties 0x0)
[    1.326776] pci 0000:00:00.0: BAR 2: [mem 0x1f8160000-0x1f816ffff 64bit pref] (from Enhanced Allocation, properties 0x1)
[    1.337759] pci 0000:00:00.0: VF BAR 0: [mem 0x1f81d0000-0x1f81dffff 64bit] (from Enhanced Allocation, properties 0x4)
[    1.348563] pci 0000:00:00.0: VF BAR 2: [mem 0x1f81f0000-0x1f81fffff 64bit pref] (from Enhanced Allocation, properties 0x3)
[    1.359821] pci 0000:00:00.0: PME# supported from D0 D3hot
[    1.365368] pci 0000:00:00.0: VF(n) BAR0 space: [mem 0x1f81d0000-0x1f81effff 64bit] (contains BAR0 for 2 VFs)
[    1.375381] pci 0000:00:00.0: VF(n) BAR2 space: [mem 0x1f81f0000-0x1f820ffff 64bit pref] (contains BAR2 for 2 VFs)
[    1.385983] Unable to handle kernel paging request at virtual address ffff800012132000
[    1.393972] Mem abort info:
[    1.396783]   ESR = 0x96000007
[    1.399859]   EC = 0x25: DABT (current EL), IL = 32 bits
[    1.405215]   SET = 0, FnV = 0
[    1.408290]   EA = 0, S1PTW = 0
[    1.411453] Data abort info:
[    1.414352]   ISV = 0, ISS = 0x00000007
[    1.418216]   CM = 0, WnR = 0
[    1.421205] swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000008369c000
[    1.427966] [ffff800012132000] pgd=00000020fffff003, p4d=00000020fffff003, pud=00000020ffffe003, pmd=00000020ffffa003, pte=0000000000000000
[    1.440618] Internal error: Oops: 96000007 [#1] PREEMPT SMP
[    1.446239] Modules linked in:
[    1.449320] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.10.0-rc3-00101-g2f378db5c89 #191
[    1.457484] Hardware name: Kontron SMARC-sAL28 (Single PHY) on SMARC Eval 2.0 carrier (DT)
[    1.465827] pstate: 20000085 (nzCv daIf -PAN -UAO -TCO BTYPE=--)
[    1.471892] pc : pci_generic_config_read+0x38/0xe0
[    1.476723] lr : pci_generic_config_read+0x24/0xe0
[    1.481553] sp : ffff80001211b920
[    1.484891] x29: ffff80001211b920 x28: 0000000000000000 
[    1.490252] x27: ffff8000116a04bc x26: 0000000000000000 
[    1.495612] x25: 0000000000000001 x24: ffff80001211ba54 
[    1.500972] x23: ffff0020009c3800 x22: 0000000000000000 
[    1.506332] x21: 0000000000000087 x20: ffff80001211b994 
[    1.511692] x19: 0000000000000004 x18: 0000000000000000 
[    1.517052] x17: 0000000000000000 x16: 00000000d5edfbc1 
[    1.522412] x15: ffffffffffffffff x14: ffff800011cf9948 
[    1.527772] x13: ffff002000305a1c x12: 0000000000000030 
[    1.533132] x11: 0101010101010101 x10: 7f7f7f7f7f7f7f7f 
[    1.538491] x9 : 2c6b7173626d686f x8 : 000000000000ea60 
[    1.543851] x7 : ffff80001211ba54 x6 : 0000000000000000 
[    1.549211] x5 : 0000000000000000 x4 : ffff800012131000 
[    1.554570] x3 : 0000000000000000 x2 : 0000000000000000 
[    1.559930] x1 : 0000000000001000 x0 : ffff800012132000 
[    1.565290] Call trace:
[    1.567752]  pci_generic_config_read+0x38/0xe0
[    1.572233]  pci_bus_read_config_dword+0x84/0xd8
[    1.576890]  pci_bus_generic_read_dev_vendor_id+0x34/0x1b0
[    1.582423]  pci_bus_read_dev_vendor_id+0x4c/0x70
[    1.587167]  pci_scan_single_device+0x84/0xe0
[    1.591559]  pci_scan_slot+0x6c/0x120
[    1.595250]  pci_scan_child_bus_extend+0x54/0x298
[    1.599994]  pci_scan_root_bus_bridge+0xd4/0xf0
[    1.604562]  pci_host_probe+0x18/0xb0
[    1.608254]  pci_host_common_probe+0x13c/0x1a0
[    1.612735]  platform_drv_probe+0x54/0xa8
[    1.616777]  really_probe+0xe4/0x3b8
[    1.620380]  driver_probe_device+0x58/0xb8
[    1.624509]  device_driver_attach+0x74/0x80
[    1.628725]  __driver_attach+0x58/0xe0
[    1.632503]  bus_for_each_dev+0x74/0xc8
[    1.636369]  driver_attach+0x24/0x30
[    1.639972]  bus_add_driver+0x18c/0x1f0
[    1.643838]  driver_register+0x64/0x120
[    1.647704]  __platform_driver_register+0x48/0x58
[    1.652449]  gen_pci_driver_init+0x1c/0x28
[    1.656580]  do_one_initcall+0x4c/0x2c0
[    1.660447]  kernel_init_freeable+0x1e4/0x250
[    1.664840]  kernel_init+0x14/0x118
[    1.668355]  ret_from_fork+0x10/0x34
[    1.671961] Code: 7100067f 540001c0 71000a7f 54000300 (b9400001) 
[    1.678114] ---[ end trace 0aca1b048661e8b3 ]---
[    1.682770] note: swapper/0[1] exited with preempt_count 1
[    1.688305] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    1.696031] SMP: stopping secondary CPUs
[    1.699989] Kernel Offset: disabled
[    1.703503] CPU features: 0x0240022,61006008
[    1.707806] Memory Limit: none
[    1.710884] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

There is a LS1028A eval board in kernelci here:
https://lavalab.nxp.com/scheduler/job/170566

I actually have this board which also have a LS1028A SoC:
https://lavalab.kontron.com/scheduler/job/1771

But in the latter you won't see much because earlycon isn't active. [I'm
about to fix that.]

By reverting patch 1/5, the board will work again.

-michael
