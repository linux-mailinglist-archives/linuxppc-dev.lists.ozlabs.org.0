Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC102D45A5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 16:42:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrhBk5g6JzDqnV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 02:42:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=2a01:4f8:151:8464::1:2;
 helo=ssl.serverraum.org; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=SMcnCPwd; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Crh8x6vs6zDqSn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 02:41:04 +1100 (AEDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 53C3A23E4A;
 Wed,  9 Dec 2020 16:40:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1607528456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MMqPmVjcNBZ7ql7NsizlkZ4mhYSQt9mGNtlc0tLR8FU=;
 b=SMcnCPwdVzQ0U25QSH9sB+sBcp+gBtkPIeiyA42bZnPEKn9Vq7LoE+Cb23G62bbnZhdXB1
 Lu5D5rwRUtEUSFfzrHnKAnKc7/r+Y3JIYcVn7nJBj64D2W/029QO2dx+6/pWh6D/0P+EiW
 AgaypLLpp49S4upT0IRX4DArHBF6JOU=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 09 Dec 2020 16:40:52 +0100
From: Michael Walle <michael@walle.cc>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v6 0/5] PCI: Unify ECAM constants in native PCI Express
 drivers
In-Reply-To: <20201209145707.GA2521966@bjorn-Precision-5520>
References: <20201209145707.GA2521966@bjorn-Precision-5520>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <c6d067abcdd5278f259bd7300730dc76@walle.cc>
X-Sender: michael@walle.cc
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
Cc: kw@linux.com, heiko@sntech.de, shawn.lin@rock-chips.com,
 Alexandru Marginean <alexm.osslist@gmail.com>, paulus@samba.org,
 thomas.petazzoni@bootlin.com, jonnyc@amazon.com, toan@os.amperecomputing.com,
 will@kernel.org, robh@kernel.org, lorenzo.pieralisi@arm.com,
 michal.simek@xilinx.com, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, rjui@broadcom.com, f.fainelli@gmail.com,
 linux-rpi-kernel@lists.infradead.org, Jonathan.Cameron@huawei.com,
 bhelgaas@google.com, jonathan.derrick@intel.com, sbranden@broadcom.com,
 wangzhou1@hisilicon.com, rrichter@marvell.com,
 Vladimir Oltean <olteanv@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 nsaenzjulienne@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 2020-12-09 15:57, schrieb Bjorn Helgaas:
[..]
> Can you try the following just to get started?
> 
> diff --git a/drivers/pci/access.c b/drivers/pci/access.c
> index 46935695cfb9..569a45727bc7 100644
> --- a/drivers/pci/access.c
> +++ b/drivers/pci/access.c
> @@ -79,6 +79,7 @@ int pci_generic_config_read(struct pci_bus *bus,
> unsigned int devfn,
>  {
>  	void __iomem *addr;
> 
> +	pci_info(bus, "%s(%#x %#05x %d)\n", __func__, devfn, where, size);
>  	addr = bus->ops->map_bus(bus, devfn, where);
>  	if (!addr) {
>  		*val = ~0;
> @@ -101,6 +102,7 @@ int pci_generic_config_write(struct pci_bus *bus,
> unsigned int devfn,
>  {
>  	void __iomem *addr;
> 
> +	pci_info(bus, "%s(%#x %#05x %d)\n", __func__, devfn, where, size);
>  	addr = bus->ops->map_bus(bus, devfn, where);
>  	if (!addr)
>  		return PCIBIOS_DEVICE_NOT_FOUND;
> diff --git a/drivers/pci/ecam.c b/drivers/pci/ecam.c
> index 59f91d434859..78f776e590be 100644
> --- a/drivers/pci/ecam.c
> +++ b/drivers/pci/ecam.c
> @@ -33,6 +33,8 @@ struct pci_config_window *pci_ecam_create(struct 
> device *dev,
>  	struct resource *conflict;
>  	int i, err;
> 
> +	dev_info(dev, "%s cfg %pR bus %pR\n", __func__, cfgres, busr);
> +
>  	if (busr->start > busr->end)
>  		return ERR_PTR(-EINVAL);
> 
> @@ -85,6 +87,9 @@ struct pci_config_window *pci_ecam_create(struct 
> device *dev,
>  			goto err_exit_iomap;
>  	}
> 
> +	dev_info(dev, "%s per_bus_mapping %d win %px\n", __func__,
> +		 per_bus_mapping, cfg->win);
> +
>  	if (ops->init) {
>  		err = ops->init(cfg);
>  		if (err)
> @@ -140,6 +145,8 @@ void __iomem *pci_ecam_map_bus(struct pci_bus
> *bus, unsigned int devfn,
>  	if (busn < cfg->busr.start || busn > cfg->busr.end)
>  		return NULL;
> 
> +	pci_info(bus, "%s(%#x %#05x): %pR\n", __func__, devfn, where,
> +		 &cfg->busr);
>  	busn -= cfg->busr.start;
>  	if (per_bus_mapping) {
>  		base = cfg->winp[busn];
> @@ -147,6 +154,8 @@ void __iomem *pci_ecam_map_bus(struct pci_bus
> *bus, unsigned int devfn,
>  	} else
>  		base = cfg->win;
> 
> +	pci_info(bus, "%s base %px bus_shift %d\n", __func__, base,
> +		 cfg->ops->bus_shift);
>  	if (cfg->ops->bus_shift) {
>  		bus_offset = (busn & PCIE_ECAM_BUS_MASK) << bus_shift;
>  		devfn_offset = (devfn & PCIE_ECAM_DEVFN_MASK) << devfn_shift;

Hopefully my mail client won't mess up the output that much.

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
[    0.000000] Linux version 5.10.0-rc7-next-20201208-dirty 
(mwalle@mwalle01) (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0, GNU ld 
(GNU Binutils for Debian) 2.31.1) #207 SMP PREEMPT Wed Dec 9 16:35:46 
CET 2020
[    0.000000] Machine model: Kontron SMARC-sAL28 (Single PHY) on SMARC 
Eval 2.0 carrier
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 32 MiB at 0x00000000fcc00000
[    0.000000] earlycon: ns16550a0 at MMIO 0x00000000021c0500 (options 
'115200n8')
[    0.000000] printk: bootconsole [ns16550a0] enabled
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 
0x0000000080000000-0x00000020ffffffff]
[    0.000000] NUMA: NODE_DATA [mem 0x20ff7dcc00-0x20ff7defff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000080000000-0x00000000ffffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000100000000-0x00000020ffffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000ffffffff]
[    0.000000]   node   0: [mem 0x0000002080000000-0x00000020ffffffff]
[    0.000000] Initmem setup node 0 [mem 
0x0000000080000000-0x00000020ffffffff]
[    0.000000] On node 0 totalpages: 1048576
[    0.000000]   DMA zone: 8192 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 524288 pages, LIFO batch:63
[    0.000000]   Normal zone: 8192 pages used for memmap
[    0.000000]   Normal zone: 524288 pages, LIFO batch:63
[    0.000000] percpu: Embedded 32 pages/cpu s90264 r8192 d32616 u131072
[    0.000000] pcpu-alloc: s90264 r8192 d32616 u131072 alloc=32*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: detected: GIC system register CPU interface
[    0.000000] CPU features: detected: Spectre-v3a
[    0.000000] CPU features: detected: Spectre-v2
[    0.000000] CPU features: detected: Spectre-v4
[    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or 
1530923
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 
1032192
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: debug earlycon console=ttyS0,115200
[    0.000000] Dentry cache hash table entries: 524288 (order: 10, 
4194304 bytes, linear)
[    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152 
bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] software IO TLB: mapped [mem 
0x00000000f8c00000-0x00000000fcc00000] (64MB)
[    0.000000] Memory: 3978952K/4194304K available (15680K kernel code, 
3706K rwdata, 8048K rodata, 8256K init, 510K bss, 182584K reserved, 
32768K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, 
Nodes=1
[    0.000000] ftrace: allocating 55767 entries in 218 pages
[    0.000000] ftrace: allocated 218 pages with 5 groups
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=256 to 
nr_cpu_ids=2.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay 
is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, 
nr_cpu_ids=2
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
[    0.000000] GICv3: 256 SPIs implemented
[    0.000000] GICv3: 0 Extended SPIs implemented
[    0.000000] GICv3: Distributor has no Range Selector support
[    0.000000] GICv3: 16 PPIs implemented
[    0.000000] GICv3: CPU0: found redistributor 0 region 
0:0x0000000006040000
[    0.000000] ITS [mem 0x06020000-0x0603ffff]
[    0.000000] ITS@0x0000000006020000: allocated 65536 Devices 
@2080200000 (flat, esz 8, psz 64K, shr 0)
[    0.000000] ITS: using cache flushing for cmd queue
[    0.000000] GICv3: using LPI property table @0x00000020801c0000
[    0.000000] GIC: using cache flushing for LPI property table
[    0.000000] GICv3: CPU0: using allocated LPI pending table 
@0x00000020801d0000
[    0.000000] random: get_random_bytes called from 
start_kernel+0x3bc/0x578 with crng_init=0
[    0.000000] arch_timer: cp15 timer(s) running at 25.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff 
max_cycles: 0x5c40939b5, max_idle_ns: 440795202646 ns
[    0.000002] sched_clock: 56 bits at 25MHz, resolution 40ns, wraps 
every 4398046511100ns
[    0.008419] Console: colour dummy device 80x25
[    0.012951] Calibrating delay loop (skipped), value calculated using 
timer frequency.. 50.00 BogoMIPS (lpj=100000)
[    0.023407] pid_max: default: 32768 minimum: 301
[    0.028106] LSM: Security Framework initializing
[    0.032816] Mount-cache hash table entries: 8192 (order: 4, 65536 
bytes, linear)
[    0.040307] Mountpoint-cache hash table entries: 8192 (order: 4, 
65536 bytes, linear)
[    0.049064] rcu: Hierarchical SRCU implementation.
[    0.054069] Platform MSI: gic-its@6020000 domain created
[    0.059517] PCI/MSI: /interrupt-controller@6000000/gic-its@6020000 
domain created
[    0.067116] fsl-mc MSI: gic-its@6020000 domain created
[    0.072911] EFI services will not be available.
[    0.077578] smp: Bringing up secondary CPUs ...
[    0.082420] Detected PIPT I-cache on CPU1
[    0.082441] GICv3: CPU1: found redistributor 1 region 
0:0x0000000006060000
[    0.082448] GICv3: CPU1: using allocated LPI pending table 
@0x00000020801e0000
[    0.082475] CPU1: Booted secondary processor 0x0000000001 
[0x410fd083]
[    0.082541] smp: Brought up 1 node, 2 CPUs
[    0.111539] SMP: Total of 2 processors activated.
[    0.116288] CPU features: detected: 32-bit EL0 Support
[    0.121483] CPU features: detected: CRC32 instructions
[    0.126673] CPU features: detected: 32-bit EL1 Support
[    0.140754] CPU: All CPU(s) started at EL2
[    0.144903] alternatives: patching kernel code
[    0.150172] devtmpfs: initialized
[    0.155754] KASLR disabled due to lack of seed
[    0.160507] clocksource: jiffies: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.170354] futex hash table entries: 512 (order: 3, 32768 bytes, 
linear)
[    0.177810] pinctrl core: initialized pinctrl subsystem
[    0.183687] DMI not present or invalid.
[    0.187857] NET: Registered protocol family 16
[    0.193117] DMA: preallocated 512 KiB GFP_KERNEL pool for atomic 
allocations
[    0.200341] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA pool for 
atomic allocations
[    0.208322] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA32 pool for 
atomic allocations
[    0.216341] audit: initializing netlink subsys (disabled)
[    0.221897] audit: type=2000 audit(0.172:1): state=initialized 
audit_enabled=0 res=1
[    0.222415] thermal_sys: Registered thermal governor 'step_wise'
[    0.229723] thermal_sys: Registered thermal governor 
'power_allocator'
[    0.236033] cpuidle: using governor menu
[    0.246693] hw-breakpoint: found 6 breakpoint and 4 watchpoint 
registers.
[    0.253571] ASID allocator initialised with 65536 entries
[    0.259602] Serial: AMBA PL011 UART driver
[    0.274466] Machine: Kontron SMARC-sAL28 (Single PHY) on SMARC Eval 
2.0 carrier
[    0.281853] SoC family: QorIQ LS1028A
[    0.285542] SoC ID: svr:0x870b0110, Revision: 1.0
[    0.297947] HugeTLB registered 1.00 GiB page size, pre-allocated 0 
pages
[    0.304722] HugeTLB registered 32.0 MiB page size, pre-allocated 0 
pages
[    0.311489] HugeTLB registered 2.00 MiB page size, pre-allocated 0 
pages
[    0.318254] HugeTLB registered 64.0 KiB page size, pre-allocated 0 
pages
[    0.325775] cryptd: max_cpu_qlen set to 1000
[    0.331453] ACPI: Interpreter disabled.
[    0.336254] iommu: Default domain type: Translated
[    0.341365] vgaarb: loaded
[    0.344250] SCSI subsystem initialized
[    0.348129] libata version 3.00 loaded.
[    0.352170] usbcore: registered new interface driver usbfs
[    0.357733] usbcore: registered new interface driver hub
[    0.363112] usbcore: registered new device driver usb
[    0.368478] imx-i2c 2000000.i2c: can't get pinctrl, bus recovery not 
supported
[    0.376183] i2c i2c-0: IMX I2C adapter registered
[    0.381068] imx-i2c 2030000.i2c: can't get pinctrl, bus recovery not 
supported
[    0.388483] i2c i2c-1: IMX I2C adapter registered
[    0.393357] imx-i2c 2040000.i2c: can't get pinctrl, bus recovery not 
supported
[    0.400879] i2c i2c-2: IMX I2C adapter registered
[    0.405900] pps_core: LinuxPPS API ver. 1 registered
[    0.410913] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 
Rodolfo Giometti <giometti@linux.it>
[    0.420156] PTP clock support registered
[    0.424188] EDAC MC: Ver: 3.0.0
[    0.428104] FPGA manager framework
[    0.431612] Advanced Linux Sound Architecture Driver Initialized.
[    0.438221] clocksource: Switched to clocksource arch_sys_counter
[    0.908920] VFS: Disk quotas dquot_6.6.0
[    0.912921] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 
bytes)
[    0.919981] pnp: PnP ACPI: disabled
[    0.927129] NET: Registered protocol family 2
[    0.931782] tcp_listen_portaddr_hash hash table entries: 2048 (order: 
3, 32768 bytes, linear)
[    0.940413] TCP established hash table entries: 32768 (order: 6, 
262144 bytes, linear)
[    0.948491] TCP bind hash table entries: 32768 (order: 7, 524288 
bytes, linear)
[    0.956179] TCP: Hash tables configured (established 32768 bind 
32768)
[    0.962890] UDP hash table entries: 2048 (order: 4, 65536 bytes, 
linear)
[    0.969682] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes, 
linear)
[    0.977005] NET: Registered protocol family 1
[    0.981700] RPC: Registered named UNIX socket transport module.
[    0.987696] RPC: Registered udp transport module.
[    0.992444] RPC: Registered tcp transport module.
[    0.997191] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.003697] PCI: CLS 0 bytes, default 64
[    1.008034] hw perfevents: enabled with armv8_cortex_a72 PMU driver, 
7 counters available
[    1.016471] kvm [1]: IPA Size Limit: 44 bits
[    1.021451] kvm [1]: GICv3: no GICV resource entry
[    1.026291] kvm [1]: disabling GICv2 emulation
[    1.030786] kvm [1]: GIC system register CPU interface enabled
[    1.036703] kvm [1]: vgic interrupt IRQ9
[    1.040722] kvm [1]: Hyp mode initialized successfully
[    1.046971] Initialise system trusted keyrings
[    1.051545] workingset: timestamp_bits=42 max_order=20 bucket_order=0
[    1.061455] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    1.067780] NFS: Registering the id_resolver key type
[    1.072903] Key type id_resolver registered
[    1.077125] Key type id_legacy registered
[    1.081217] nfs4filelayout_init: NFSv4 File Layout Driver 
Registering...
[    1.088079] 9p: Installing v9fs 9p2000 file system support
[    1.122728] Key type asymmetric registered
[    1.126867] Asymmetric key parser 'x509' registered
[    1.131809] Block layer SCSI generic (bsg) driver version 0.4 loaded 
(major 245)
[    1.139278] io scheduler mq-deadline registered
[    1.143849] io scheduler kyber registered
[    1.153103] pci-host-generic 1f0000000.pcie: host bridge 
/soc/pcie@1f0000000 ranges:
[    1.160949] pci-host-generic 1f0000000.pcie:      MEM 
0x01f8000000..0x01f815ffff -> 0x0000000000
[    1.169837] pci-host-generic 1f0000000.pcie:      MEM 
0x01f8160000..0x01f81cffff -> 0x0000000000
[    1.178723] pci-host-generic 1f0000000.pcie:      MEM 
0x01f81d0000..0x01f81effff -> 0x0000000000
[    1.187605] pci-host-generic 1f0000000.pcie:      MEM 
0x01f81f0000..0x01f820ffff -> 0x0000000000
[    1.196487] pci-host-generic 1f0000000.pcie:      MEM 
0x01f8210000..0x01f822ffff -> 0x0000000000
[    1.205369] pci-host-generic 1f0000000.pcie:      MEM 
0x01f8230000..0x01f824ffff -> 0x0000000000
[    1.214247] pci-host-generic 1f0000000.pcie:      MEM 
0x01fc000000..0x01fc3fffff -> 0x0000000000
[    1.223141] pci-host-generic 1f0000000.pcie: pci_ecam_create cfg [mem 
0x1f0000000-0x1f00fffff] bus [bus 00]
[    1.232992] pci-host-generic 1f0000000.pcie: pci_ecam_create 
per_bus_mapping 0 win ffff8000123b1000
[    1.242128] pci-host-generic 1f0000000.pcie: ECAM at [mem 
0x1f0000000-0x1f00fffff] for [bus 00]
[    1.250984] pci-host-generic 1f0000000.pcie: PCI host bridge to bus 
0000:00
[    1.258015] pci_bus 0000:00: root bus resource [bus 00]
[    1.263292] pci_bus 0000:00: root bus resource [mem 
0x1f8000000-0x1f815ffff] (bus address [0x00000000-0x0015ffff])
[    1.273751] pci_bus 0000:00: root bus resource [mem 
0x1f8160000-0x1f81cffff pref] (bus address [0x00000000-0x0006ffff])
[    1.284647] pci_bus 0000:00: root bus resource [mem 
0x1f81d0000-0x1f81effff] (bus address [0x00000000-0x0001ffff])
[    1.295104] pci_bus 0000:00: root bus resource [mem 
0x1f81f0000-0x1f820ffff pref] (bus address [0x00000000-0x0001ffff])
[    1.305995] pci_bus 0000:00: root bus resource [mem 
0x1f8210000-0x1f822ffff] (bus address [0x00000000-0x0001ffff])
[    1.316448] pci_bus 0000:00: root bus resource [mem 
0x1f8230000-0x1f824ffff pref] (bus address [0x00000000-0x0001ffff])
[    1.327340] pci_bus 0000:00: root bus resource [mem 
0x1fc000000-0x1fc3fffff] (bus address [0x00000000-0x003fffff])
[    1.337794] pci_bus 0000:00: pci_generic_config_read(0x0 0x000 4)
[    1.343942] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x000): [bus 00]
[    1.350177] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.357563] pci_bus 0000:00: pci_generic_config_read(0x0 0x00e 1)
[    1.363711] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x00e): [bus 00]
[    1.369946] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.377327] pci_bus 0000:00: pci_generic_config_read(0x0 0x006 2)
[    1.383475] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x006): [bus 00]
[    1.389709] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.397090] pci_bus 0000:00: pci_generic_config_read(0x0 0x034 1)
[    1.403237] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x034): [bus 00]
[    1.409471] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.416855] pci_bus 0000:00: pci_generic_config_read(0x0 0x040 2)
[    1.423002] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x040): [bus 00]
[    1.429237] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.436618] pci_bus 0000:00: pci_generic_config_read(0x0 0x042 2)
[    1.442765] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x042): [bus 00]
[    1.448999] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.456380] pci_bus 0000:00: pci_generic_config_read(0x0 0x044 2)
[    1.462527] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x044): [bus 00]
[    1.468762] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.476148] pci_bus 0000:00: pci_generic_config_read(0x0 0x008 4)
[    1.482296] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x008): [bus 00]
[    1.488530] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.495912] pci_bus 0000:00: pci_generic_config_read(0x0 0x100 4)
[    1.502060] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x100): [bus 00]
[    1.508294] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.515675] pci_bus 0000:00: pci_generic_config_read(0x0 0x000 4)
[    1.521822] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x000): [bus 00]
[    1.528056] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.535440] pci_bus 0000:00: pci_generic_config_read(0x0 0x100 4)
[    1.541587] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x100): [bus 00]
[    1.547821] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.555202] pci_bus 0000:00: pci_generic_config_read(0x0 0x100 4)
[    1.561349] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x100): [bus 00]
[    1.567583] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.574964] pci_bus 0000:00: pci_generic_config_read(0x0 0x130 4)
[    1.581111] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x130): [bus 00]
[    1.587346] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.594728] pci_bus 0000:00: pci_generic_config_read(0x0 0x140 4)
[    1.600876] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x140): [bus 00]
[    1.607110] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.614494] pci 0000:00:00.0: [1957:e100] type 00 class 0x020001
[    1.620558] pci_bus 0000:00: pci_generic_config_read(0x0 0x004 2)
[    1.626705] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    1.632940] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.640320] pci_bus 0000:00: pci_generic_config_write(0x0 0x004 2)
[    1.646555] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    1.652789] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.660171] pci_bus 0000:00: pci_generic_config_read(0x0 0x004 2)
[    1.666319] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    1.672553] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.679933] pci_bus 0000:00: pci_generic_config_write(0x0 0x004 2)
[    1.686168] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    1.692402] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.699782] pci_bus 0000:00: pci_generic_config_read(0x0 0x03d 1)
[    1.705929] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x03d): [bus 00]
[    1.712163] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.719546] pci_bus 0000:00: pci_generic_config_read(0x0 0x004 2)
[    1.725693] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    1.731928] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.739308] pci_bus 0000:00: pci_generic_config_write(0x0 0x004 2)
[    1.745543] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    1.751777] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.759156] pci_bus 0000:00: pci_generic_config_read(0x0 0x010 4)
[    1.765303] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x010): [bus 00]
[    1.771538] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.778920] pci_bus 0000:00: pci_generic_config_write(0x0 0x010 4)
[    1.785155] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x010): [bus 00]
[    1.791389] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.798770] pci_bus 0000:00: pci_generic_config_read(0x0 0x010 4)
[    1.804917] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x010): [bus 00]
[    1.811151] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.818531] pci_bus 0000:00: pci_generic_config_write(0x0 0x010 4)
[    1.824766] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x010): [bus 00]
[    1.831000] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.838382] pci_bus 0000:00: pci_generic_config_write(0x0 0x004 2)
[    1.844617] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    1.850852] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.858232] pci_bus 0000:00: pci_generic_config_read(0x0 0x004 2)
[    1.864379] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    1.870613] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.877993] pci_bus 0000:00: pci_generic_config_write(0x0 0x004 2)
[    1.884228] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    1.890462] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.897843] pci_bus 0000:00: pci_generic_config_read(0x0 0x014 4)
[    1.903990] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x014): [bus 00]
[    1.910224] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.917628] pci_bus 0000:00: pci_generic_config_write(0x0 0x014 4)
[    1.923864] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x014): [bus 00]
[    1.930098] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.937479] pci_bus 0000:00: pci_generic_config_read(0x0 0x014 4)
[    1.943626] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x014): [bus 00]
[    1.949861] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.957241] pci_bus 0000:00: pci_generic_config_write(0x0 0x014 4)
[    1.963476] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x014): [bus 00]
[    1.969709] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.977092] pci_bus 0000:00: pci_generic_config_write(0x0 0x004 2)
[    1.983327] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    1.989562] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    1.996943] pci_bus 0000:00: pci_generic_config_read(0x0 0x004 2)
[    2.003089] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    2.009324] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.016704] pci_bus 0000:00: pci_generic_config_write(0x0 0x004 2)
[    2.022938] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    2.029173] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.036555] pci_bus 0000:00: pci_generic_config_read(0x0 0x018 4)
[    2.042702] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x018): [bus 00]
[    2.048937] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.056317] pci_bus 0000:00: pci_generic_config_write(0x0 0x018 4)
[    2.062552] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x018): [bus 00]
[    2.068786] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.076166] pci_bus 0000:00: pci_generic_config_read(0x0 0x018 4)
[    2.082313] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x018): [bus 00]
[    2.088547] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.095930] pci_bus 0000:00: pci_generic_config_write(0x0 0x018 4)
[    2.102165] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x018): [bus 00]
[    2.108400] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.115780] pci_bus 0000:00: pci_generic_config_write(0x0 0x004 2)
[    2.122014] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    2.128248] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.135629] pci_bus 0000:00: pci_generic_config_read(0x0 0x004 2)
[    2.141776] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    2.148010] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.155392] pci_bus 0000:00: pci_generic_config_write(0x0 0x004 2)
[    2.161626] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    2.167861] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.175241] pci_bus 0000:00: pci_generic_config_read(0x0 0x01c 4)
[    2.181388] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x01c): [bus 00]
[    2.187622] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.195002] pci_bus 0000:00: pci_generic_config_write(0x0 0x01c 4)
[    2.201237] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x01c): [bus 00]
[    2.207471] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.214854] pci_bus 0000:00: pci_generic_config_read(0x0 0x01c 4)
[    2.221001] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x01c): [bus 00]
[    2.227235] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.234615] pci_bus 0000:00: pci_generic_config_write(0x0 0x01c 4)
[    2.240850] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x01c): [bus 00]
[    2.247084] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.254464] pci_bus 0000:00: pci_generic_config_write(0x0 0x004 2)
[    2.260698] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    2.266932] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.274314] pci_bus 0000:00: pci_generic_config_read(0x0 0x004 2)
[    2.280462] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    2.286696] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.294077] pci_bus 0000:00: pci_generic_config_write(0x0 0x004 2)
[    2.300312] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    2.306546] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.313925] pci_bus 0000:00: pci_generic_config_read(0x0 0x020 4)
[    2.320072] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x020): [bus 00]
[    2.326306] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.333686] pci_bus 0000:00: pci_generic_config_write(0x0 0x020 4)
[    2.339921] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x020): [bus 00]
[    2.346156] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.353538] pci_bus 0000:00: pci_generic_config_read(0x0 0x020 4)
[    2.359685] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x020): [bus 00]
[    2.365919] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.373300] pci_bus 0000:00: pci_generic_config_write(0x0 0x020 4)
[    2.379534] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x020): [bus 00]
[    2.385768] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.393148] pci_bus 0000:00: pci_generic_config_write(0x0 0x004 2)
[    2.399382] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    2.405617] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.413000] pci_bus 0000:00: pci_generic_config_read(0x0 0x004 2)
[    2.419148] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    2.425382] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.432762] pci_bus 0000:00: pci_generic_config_write(0x0 0x004 2)
[    2.438997] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    2.445231] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.452611] pci_bus 0000:00: pci_generic_config_read(0x0 0x024 4)
[    2.458758] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x024): [bus 00]
[    2.464993] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.472374] pci_bus 0000:00: pci_generic_config_write(0x0 0x024 4)
[    2.478609] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x024): [bus 00]
[    2.484843] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.492223] pci_bus 0000:00: pci_generic_config_read(0x0 0x024 4)
[    2.498370] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x024): [bus 00]
[    2.504604] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.511985] pci_bus 0000:00: pci_generic_config_write(0x0 0x024 4)
[    2.518219] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x024): [bus 00]
[    2.524454] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.531836] pci_bus 0000:00: pci_generic_config_write(0x0 0x004 2)
[    2.538071] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    2.544305] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.551686] pci_bus 0000:00: pci_generic_config_read(0x0 0x004 2)
[    2.557833] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    2.564067] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.571447] pci_bus 0000:00: pci_generic_config_write(0x0 0x004 2)
[    2.577681] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    2.583916] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.591298] pci_bus 0000:00: pci_generic_config_read(0x0 0x030 4)
[    2.597445] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x030): [bus 00]
[    2.603680] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.611060] pci_bus 0000:00: pci_generic_config_write(0x0 0x030 4)
[    2.617295] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x030): [bus 00]
[    2.623530] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.630910] pci_bus 0000:00: pci_generic_config_read(0x0 0x030 4)
[    2.637057] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x030): [bus 00]
[    2.643291] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.650673] pci_bus 0000:00: pci_generic_config_write(0x0 0x030 4)
[    2.656908] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x030): [bus 00]
[    2.663143] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.670523] pci_bus 0000:00: pci_generic_config_write(0x0 0x004 2)
[    2.676757] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    2.682992] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.690372] pci_bus 0000:00: pci_generic_config_read(0x0 0x02c 2)
[    2.696519] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x02c): [bus 00]
[    2.702754] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.710133] pci_bus 0000:00: pci_generic_config_read(0x0 0x02e 2)
[    2.716281] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x02e): [bus 00]
[    2.722515] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.729899] pci_bus 0000:00: pci_generic_config_read(0x0 0x048 2)
[    2.736046] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x048): [bus 00]
[    2.742280] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.749661] pci_bus 0000:00: pci_generic_config_write(0x0 0x048 2)
[    2.755895] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x048): [bus 00]
[    2.762130] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.769510] pci_bus 0000:00: pci_generic_config_read(0x0 0x044 4)
[    2.775657] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x044): [bus 00]
[    2.781891] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.789274] pci_bus 0000:00: pci_generic_config_read(0x0 0x048 2)
[    2.795421] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x048): [bus 00]
[    2.801655] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.809036] pci_bus 0000:00: pci_generic_config_read(0x0 0x100 4)
[    2.815183] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x100): [bus 00]
[    2.821418] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.828798] pci_bus 0000:00: pci_generic_config_read(0x0 0x130 4)
[    2.834945] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x130): [bus 00]
[    2.841180] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.848562] pci_bus 0000:00: pci_generic_config_read(0x0 0x140 4)
[    2.854709] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x140): [bus 00]
[    2.860943] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.868324] pci_bus 0000:00: pci_generic_config_read(0x0 0x064 4)
[    2.874471] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x064): [bus 00]
[    2.880705] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.888085] pci_bus 0000:00: pci_generic_config_read(0x0 0x064 4)
[    2.894233] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x064): [bus 00]
[    2.900467] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.907864] pci_bus 0000:00: pci_generic_config_read(0x0 0x006 2)
[    2.914012] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x006): [bus 00]
[    2.920246] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.927628] pci_bus 0000:00: pci_generic_config_read(0x0 0x034 1)
[    2.933776] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x034): [bus 00]
[    2.940010] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.947390] pci_bus 0000:00: pci_generic_config_read(0x0 0x040 2)
[    2.953537] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x040): [bus 00]
[    2.959771] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.967154] pci_bus 0000:00: pci_generic_config_read(0x0 0x080 2)
[    2.973301] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x080): [bus 00]
[    2.979535] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    2.986916] pci_bus 0000:00: pci_generic_config_read(0x0 0x090 2)
[    2.993063] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x090): [bus 00]
[    2.999297] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.006677] pci_bus 0000:00: pci_generic_config_read(0x0 0x09c 2)
[    3.012824] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x09c): [bus 00]
[    3.019058] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.026441] pci_bus 0000:00: pci_generic_config_read(0x0 0x09e 1)
[    3.032587] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x09e): [bus 00]
[    3.038822] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.046202] pci_bus 0000:00: pci_generic_config_read(0x0 0x0a0 4)
[    3.052349] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x0a0): [bus 00]
[    3.058584] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.065964] pci_bus 0000:00: pci_generic_config_read(0x0 0x0a4 4)
[    3.072111] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x0a4): [bus 00]
[    3.078345] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.085725] pci_bus 0000:00: pci_generic_config_read(0x0 0x0a8 4)
[    3.091872] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x0a8): [bus 00]
[    3.098106] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.105488] pci_bus 0000:00: pci_generic_config_read(0x0 0x0ac 4)
[    3.111635] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x0ac): [bus 00]
[    3.117869] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.125251] pci 0000:00:00.0: BAR 0: [mem 0x1f8000000-0x1f803ffff 
64bit] (from Enhanced Allocation, properties 0x0)
[    3.135790] pci_bus 0000:00: pci_generic_config_read(0x0 0x0b0 4)
[    3.141937] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x0b0): [bus 00]
[    3.148172] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.155552] pci_bus 0000:00: pci_generic_config_read(0x0 0x0b4 4)
[    3.161698] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x0b4): [bus 00]
[    3.167933] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.175315] pci_bus 0000:00: pci_generic_config_read(0x0 0x0b8 4)
[    3.181462] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x0b8): [bus 00]
[    3.187696] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.195076] pci_bus 0000:00: pci_generic_config_read(0x0 0x0bc 4)
[    3.201223] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x0bc): [bus 00]
[    3.207457] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.214838] pci 0000:00:00.0: BAR 2: [mem 0x1f8160000-0x1f816ffff 
64bit pref] (from Enhanced Allocation, properties 0x1)
[    3.225816] pci_bus 0000:00: pci_generic_config_read(0x0 0x0c0 4)
[    3.231963] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x0c0): [bus 00]
[    3.238197] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.245580] pci_bus 0000:00: pci_generic_config_read(0x0 0x0c4 4)
[    3.251727] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x0c4): [bus 00]
[    3.257961] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.265342] pci_bus 0000:00: pci_generic_config_read(0x0 0x0c8 4)
[    3.271489] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x0c8): [bus 00]
[    3.277723] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.285103] pci_bus 0000:00: pci_generic_config_read(0x0 0x0cc 4)
[    3.291250] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x0cc): [bus 00]
[    3.297485] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.304868] pci 0000:00:00.0: VF BAR 0: [mem 0x1f81d0000-0x1f81dffff 
64bit] (from Enhanced Allocation, properties 0x4)
[    3.315671] pci_bus 0000:00: pci_generic_config_read(0x0 0x0d0 4)
[    3.321818] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x0d0): [bus 00]
[    3.328053] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.335433] pci_bus 0000:00: pci_generic_config_read(0x0 0x0d4 4)
[    3.341579] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x0d4): [bus 00]
[    3.347813] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.355193] pci_bus 0000:00: pci_generic_config_read(0x0 0x0d8 4)
[    3.361340] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x0d8): [bus 00]
[    3.367575] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.374957] pci_bus 0000:00: pci_generic_config_read(0x0 0x0dc 4)
[    3.381103] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x0dc): [bus 00]
[    3.387337] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.394719] pci 0000:00:00.0: VF BAR 2: [mem 0x1f81f0000-0x1f81fffff 
64bit pref] (from Enhanced Allocation, properties 0x3)
[    3.405959] pci_bus 0000:00: pci_generic_config_read(0x0 0x006 2)
[    3.412106] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x006): [bus 00]
[    3.418340] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.425722] pci_bus 0000:00: pci_generic_config_read(0x0 0x034 1)
[    3.431868] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x034): [bus 00]
[    3.438103] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.445485] pci_bus 0000:00: pci_generic_config_read(0x0 0x040 2)
[    3.451632] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x040): [bus 00]
[    3.457866] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.465247] pci_bus 0000:00: pci_generic_config_read(0x0 0x080 2)
[    3.471394] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x080): [bus 00]
[    3.477628] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.485008] pci_bus 0000:00: pci_generic_config_read(0x0 0x090 2)
[    3.491155] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x090): [bus 00]
[    3.497389] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.504771] pci_bus 0000:00: pci_generic_config_read(0x0 0x09c 2)
[    3.510918] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x09c): [bus 00]
[    3.517153] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.524533] pci_bus 0000:00: pci_generic_config_read(0x0 0x006 2)
[    3.530680] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x006): [bus 00]
[    3.536914] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.544294] pci_bus 0000:00: pci_generic_config_read(0x0 0x034 1)
[    3.550441] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x034): [bus 00]
[    3.556675] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.564058] pci_bus 0000:00: pci_generic_config_read(0x0 0x040 2)
[    3.570205] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x040): [bus 00]
[    3.576440] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.583820] pci_bus 0000:00: pci_generic_config_read(0x0 0x080 2)
[    3.589967] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x080): [bus 00]
[    3.596202] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.603581] pci_bus 0000:00: pci_generic_config_read(0x0 0x082 2)
[    3.609729] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x082): [bus 00]
[    3.615964] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.623346] pci_bus 0000:00: pci_generic_config_read(0x0 0x006 2)
[    3.629493] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x006): [bus 00]
[    3.635728] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.643108] pci_bus 0000:00: pci_generic_config_read(0x0 0x034 1)
[    3.649255] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x034): [bus 00]
[    3.655489] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.662869] pci_bus 0000:00: pci_generic_config_read(0x0 0x040 2)
[    3.669016] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x040): [bus 00]
[    3.675250] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.682634] pci_bus 0000:00: pci_generic_config_read(0x0 0x006 2)
[    3.688780] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x006): [bus 00]
[    3.695015] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.702395] pci_bus 0000:00: pci_generic_config_read(0x0 0x034 1)
[    3.708542] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x034): [bus 00]
[    3.714777] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.722157] pci_bus 0000:00: pci_generic_config_read(0x0 0x040 2)
[    3.728304] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x040): [bus 00]
[    3.734538] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.741918] pci_bus 0000:00: pci_generic_config_read(0x0 0x080 2)
[    3.748065] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x080): [bus 00]
[    3.754300] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.761682] pci_bus 0000:00: pci_generic_config_read(0x0 0x090 2)
[    3.767829] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x090): [bus 00]
[    3.774063] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.781443] pci_bus 0000:00: pci_generic_config_read(0x0 0x09c 2)
[    3.787590] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x09c): [bus 00]
[    3.793825] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.801205] pci_bus 0000:00: pci_generic_config_read(0x0 0x100 4)
[    3.807352] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x100): [bus 00]
[    3.813586] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.820968] pci_bus 0000:00: pci_generic_config_read(0x0 0x130 4)
[    3.827115] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x130): [bus 00]
[    3.833350] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.840730] pci_bus 0000:00: pci_generic_config_read(0x0 0x140 4)
[    3.846877] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x140): [bus 00]
[    3.853111] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.860491] pci_bus 0000:00: pci_generic_config_read(0x0 0x100 4)
[    3.866637] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x100): [bus 00]
[    3.872872] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.880254] pci_bus 0000:00: pci_generic_config_read(0x0 0x130 4)
[    3.886401] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x130): [bus 00]
[    3.892636] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.900016] pci_bus 0000:00: pci_generic_config_read(0x0 0x140 4)
[    3.906163] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x140): [bus 00]
[    3.912397] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.919778] pci_bus 0000:00: pci_generic_config_read(0x0 0x100 4)
[    3.925925] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x100): [bus 00]
[    3.932159] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.939543] pci_bus 0000:00: pci_generic_config_read(0x0 0x130 4)
[    3.945690] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x130): [bus 00]
[    3.951924] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.959305] pci_bus 0000:00: pci_generic_config_read(0x0 0x140 4)
[    3.965452] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x140): [bus 00]
[    3.971686] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.979066] pci_bus 0000:00: pci_generic_config_read(0x0 0x100 4)
[    3.985213] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x100): [bus 00]
[    3.991447] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    3.998829] pci_bus 0000:00: pci_generic_config_read(0x0 0x130 4)
[    4.004976] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x130): [bus 00]
[    4.011211] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.018591] pci_bus 0000:00: pci_generic_config_read(0x0 0x140 4)
[    4.024738] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x140): [bus 00]
[    4.030973] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.038353] pci_bus 0000:00: pci_generic_config_read(0x0 0x100 4)
[    4.044500] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x100): [bus 00]
[    4.050734] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.058114] pci_bus 0000:00: pci_generic_config_read(0x0 0x130 4)
[    4.064261] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x130): [bus 00]
[    4.070495] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.077877] pci_bus 0000:00: pci_generic_config_read(0x0 0x140 4)
[    4.084024] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x140): [bus 00]
[    4.090259] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.097642] pci_bus 0000:00: pci_generic_config_read(0x0 0x006 2)
[    4.103789] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x006): [bus 00]
[    4.110023] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.117403] pci_bus 0000:00: pci_generic_config_read(0x0 0x034 1)
[    4.123550] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x034): [bus 00]
[    4.129784] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.137166] pci_bus 0000:00: pci_generic_config_read(0x0 0x040 2)
[    4.143314] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x040): [bus 00]
[    4.149548] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.156929] pci_bus 0000:00: pci_generic_config_read(0x0 0x080 2)
[    4.163076] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x080): [bus 00]
[    4.169310] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.176690] pci_bus 0000:00: pci_generic_config_read(0x0 0x090 2)
[    4.182837] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x090): [bus 00]
[    4.189071] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.196453] pci_bus 0000:00: pci_generic_config_read(0x0 0x092 2)
[    4.202600] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x092): [bus 00]
[    4.208835] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.216216] pci 0000:00:00.0: PME# supported from D0 D3hot
[    4.221754] pci_bus 0000:00: pci_generic_config_read(0x0 0x094 2)
[    4.227901] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x094): [bus 00]
[    4.234135] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.241516] pci_bus 0000:00: pci_generic_config_write(0x0 0x094 2)
[    4.247750] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x094): [bus 00]
[    4.253985] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.261368] pci_bus 0000:00: pci_generic_config_read(0x0 0x006 2)
[    4.267515] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x006): [bus 00]
[    4.273749] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.281130] pci_bus 0000:00: pci_generic_config_read(0x0 0x006 2)
[    4.287277] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x006): [bus 00]
[    4.293511] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.300891] pci_bus 0000:00: pci_generic_config_read(0x0 0x034 1)
[    4.307038] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x034): [bus 00]
[    4.313273] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.320655] pci_bus 0000:00: pci_generic_config_read(0x0 0x040 2)
[    4.326802] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x040): [bus 00]
[    4.333036] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.340417] pci_bus 0000:00: pci_generic_config_read(0x0 0x080 2)
[    4.346563] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x080): [bus 00]
[    4.352798] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.360178] pci_bus 0000:00: pci_generic_config_read(0x0 0x090 2)
[    4.366325] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x090): [bus 00]
[    4.372559] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.379941] pci_bus 0000:00: pci_generic_config_read(0x0 0x09c 2)
[    4.386088] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x09c): [bus 00]
[    4.392322] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.399703] pci_bus 0000:00: pci_generic_config_read(0x0 0x100 4)
[    4.405850] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x100): [bus 00]
[    4.412085] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.419465] pci_bus 0000:00: pci_generic_config_read(0x0 0x130 4)
[    4.425612] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x130): [bus 00]
[    4.431846] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.439228] pci_bus 0000:00: pci_generic_config_read(0x0 0x140 4)
[    4.445376] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x140): [bus 00]
[    4.451610] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.458992] pci_bus 0000:00: pci_generic_config_read(0x0 0x148 2)
[    4.465139] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x148): [bus 00]
[    4.471373] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.478754] pci_bus 0000:00: pci_generic_config_write(0x0 0x148 2)
[    4.484988] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x148): [bus 00]
[    4.491222] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.498604] pci_bus 0000:00: pci_generic_config_read(0x0 0x14e 2)
[    4.504752] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x14e): [bus 00]
[    4.510986] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.518367] pci_bus 0000:00: pci_generic_config_read(0x0 0x15c 4)
[    4.524514] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x15c): [bus 00]
[    4.530748] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.538128] pci_bus 0000:00: pci_generic_config_write(0x0 0x160 4)
[    4.544362] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x160): [bus 00]
[    4.550597] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.557979] pci 0000:00:00.0: VF(n) BAR0 space: [mem 
0x1f81d0000-0x1f81effff 64bit] (contains BAR0 for 2 VFs)
[    4.567995] pci 0000:00:00.0: VF(n) BAR2 space: [mem 
0x1f81f0000-0x1f820ffff 64bit pref] (contains BAR2 for 2 VFs)
[    4.578446] pci_bus 0000:00: pci_generic_config_read(0x0 0x004 2)
[    4.584593] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    4.590828] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.598208] pci_bus 0000:00: pci_generic_config_write(0x0 0x004 2)
[    4.604443] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    4.610677] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.618057] pci_bus 0000:00: pci_generic_config_read(0x0 0x174 4)
[    4.624204] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x174): [bus 00]
[    4.630438] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.637821] pci_bus 0000:00: pci_generic_config_write(0x0 0x174 4)
[    4.644055] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x174): [bus 00]
[    4.650290] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.657670] pci_bus 0000:00: pci_generic_config_read(0x0 0x174 4)
[    4.663817] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x174): [bus 00]
[    4.670052] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.677431] pci_bus 0000:00: pci_generic_config_write(0x0 0x174 4)
[    4.683666] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x174): [bus 00]
[    4.689901] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.697283] pci_bus 0000:00: pci_generic_config_write(0x0 0x004 2)
[    4.703518] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    4.709752] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.717133] pci_bus 0000:00: pci_generic_config_read(0x0 0x004 2)
[    4.723279] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    4.729513] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.736893] pci_bus 0000:00: pci_generic_config_write(0x0 0x004 2)
[    4.743128] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    4.749363] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.756745] pci_bus 0000:00: pci_generic_config_read(0x0 0x178 4)
[    4.762892] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x178): [bus 00]
[    4.769127] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.776507] pci_bus 0000:00: pci_generic_config_write(0x0 0x178 4)
[    4.782741] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x178): [bus 00]
[    4.788976] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.796356] pci_bus 0000:00: pci_generic_config_read(0x0 0x178 4)
[    4.802503] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x178): [bus 00]
[    4.808738] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.816120] pci_bus 0000:00: pci_generic_config_write(0x0 0x178 4)
[    4.822355] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x178): [bus 00]
[    4.828589] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.835969] pci_bus 0000:00: pci_generic_config_write(0x0 0x004 2)
[    4.842204] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x004): [bus 00]
[    4.848438] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.855818] pci_bus 0000:00: pci_generic_config_read(0x0 0x15a 2)
[    4.861965] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x15a): [bus 00]
[    4.868199] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.875582] pci_bus 0000:00: pci_generic_config_read(0x0 0x144 4)
[    4.881729] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x144): [bus 00]
[    4.887963] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.895344] pci_bus 0000:00: pci_generic_config_read(0x0 0x152 1)
[    4.901491] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x152): [bus 00]
[    4.907725] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.915105] pci_bus 0000:00: pci_generic_config_write(0x0 0x150 2)
[    4.921340] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x150): [bus 00]
[    4.927574] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.934956] pci_bus 0000:00: pci_generic_config_read(0x0 0x154 2)
[    4.941104] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x154): [bus 00]
[    4.947338] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.954718] pci_bus 0000:00: pci_generic_config_read(0x0 0x156 2)
[    4.960865] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x156): [bus 00]
[    4.967099] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.974480] pci_bus 0000:00: pci_generic_config_write(0x0 0x150 2)
[    4.980714] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x150): [bus 00]
[    4.986948] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    4.994331] pci_bus 0000:00: pci_generic_config_read(0x0 0x154 2)
[    5.000478] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x154): [bus 00]
[    5.006712] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    5.014093] pci_bus 0000:00: pci_generic_config_read(0x0 0x156 2)
[    5.020239] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x156): [bus 00]
[    5.026474] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    5.033854] pci_bus 0000:00: pci_generic_config_write(0x0 0x150 2)
[    5.040089] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x150): [bus 00]
[    5.046323] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    5.053703] pci_bus 0000:00: pci_generic_config_read(0x0 0x154 2)
[    5.059850] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x154): [bus 00]
[    5.066084] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    5.073467] pci_bus 0000:00: pci_generic_config_read(0x0 0x156 2)
[    5.079614] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x156): [bus 00]
[    5.085848] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    5.093229] pci_bus 0000:00: pci_generic_config_read(0x0 0x100 4)
[    5.099376] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x100): [bus 00]
[    5.105610] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    5.112990] pci_bus 0000:00: pci_generic_config_read(0x0 0x130 4)
[    5.119137] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x130): [bus 00]
[    5.125372] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    5.132754] pci_bus 0000:00: pci_generic_config_read(0x0 0x140 4)
[    5.138901] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x140): [bus 00]
[    5.145135] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    5.152515] pci_bus 0000:00: pci_generic_config_read(0x0 0x100 4)
[    5.158662] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x100): [bus 00]
[    5.164897] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    5.172277] pci_bus 0000:00: pci_generic_config_read(0x0 0x130 4)
[    5.178423] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x130): [bus 00]
[    5.184658] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    5.192039] pci_bus 0000:00: pci_generic_config_read(0x0 0x140 4)
[    5.198186] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x140): [bus 00]
[    5.204420] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    5.211801] pci_bus 0000:00: pci_generic_config_read(0x0 0x100 4)
[    5.217948] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x100): [bus 00]
[    5.224182] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    5.231562] pci_bus 0000:00: pci_generic_config_read(0x0 0x130 4)
[    5.237709] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x130): [bus 00]
[    5.243943] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    5.251327] pci_bus 0000:00: pci_generic_config_read(0x0 0x044 4)
[    5.257474] pci_bus 0000:00: pci_ecam_map_bus(0x0 0x044): [bus 00]
[    5.263708] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    5.271245] pci_bus 0000:00: pci_generic_config_read(0x1 0x000 4)
[    5.277392] pci_bus 0000:00: pci_ecam_map_bus(0x1 0x000): [bus 00]
[    5.283627] pci_bus 0000:00: pci_ecam_map_bus base ffff8000123b1000 
bus_shift 0
[    5.291007] Unable to handle kernel paging request at virtual address 
ffff8000123b2000
[    5.298996] Mem abort info:
[    5.301807]   ESR = 0x96000007
[    5.304883]   EC = 0x25: DABT (current EL), IL = 32 bits
[    5.310240]   SET = 0, FnV = 0
[    5.313315]   EA = 0, S1PTW = 0
[    5.316477] Data abort info:
[    5.319376]   ISV = 0, ISS = 0x00000007
[    5.323240]   CM = 0, WnR = 0
[    5.326228] swapper pgtable: 4k pages, 48-bit VAs, 
pgdp=0000000083741000
[    5.332989] [ffff8000123b2000] pgd=00000020fffff003, 
p4d=00000020fffff003, pud=00000020ffffe003, pmd=00000020ffff8003, 
pte=0000000000000000
[    5.345641] Internal error: Oops: 96000007 [#1] PREEMPT SMP
[    5.351262] Modules linked in:
[    5.354342] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 
5.10.0-rc7-next-20201208-dirty #207
[    5.362595] Hardware name: Kontron SMARC-sAL28 (Single PHY) on SMARC 
Eval 2.0 carrier (DT)
[    5.370937] pstate: 20000085 (nzCv daIf -PAN -UAO -TCO BTYPE=--)
[    5.377005] pc : pci_generic_config_read+0xdc/0x110
[    5.381925] lr : pci_generic_config_read+0x70/0x110
[    5.386842] sp : ffff80001239b8f0
[    5.390181] x29: ffff80001239b8f0 x28: 0000000000000000
[    5.395541] x27: ffff8000117504e4 x26: 0000000000000000
[    5.400902] x25: 0000000000000001 x24: ffff80001239ba44
[    5.406262] x23: 0000000000000000 x22: 0000000000000001
[    5.411622] x21: ffff002001490000 x20: 0000000000000004
[    5.416982] x19: ffff80001239b984 x18: 0000000000000010
[    5.422342] x17: 0000000000007fff x16: 00000000ffffffff
[    5.427702] x15: ffffffffffffffff x14: ffff800011f69948
[    5.433062] x13: ffff80009239b4f7 x12: ffff800012004188
[    5.438421] x11: 0000000000000003 x10: ffff800011fec148
[    5.443781] x9 : ffff800010101b10 x8 : 0000000000017fe8
[    5.449141] x7 : c0000000ffffefff x6 : 0000000000000001
[    5.454501] x5 : 0000000000000000 x4 : ffff8000123b2000
[    5.459860] x3 : 00000000fffffff8 x2 : 0000000001000000
[    5.465220] x1 : 0000000000000000 x0 : ffff8000123b2000
[    5.470580] Call trace:
[    5.473043]  pci_generic_config_read+0xdc/0x110
[    5.477614]  pci_bus_read_config_dword+0x8c/0xe0
[    5.482271]  pci_bus_generic_read_dev_vendor_id+0x3c/0x1b8
[    5.487804]  pci_bus_read_dev_vendor_id+0x54/0x78
[    5.492548]  pci_scan_single_device+0x8c/0xe8
[    5.496941]  pci_scan_slot+0x74/0x128
[    5.500632]  pci_scan_child_bus_extend+0x5c/0x2a0
[    5.505376]  pci_scan_root_bus_bridge+0xdc/0xf8
[    5.509944]  pci_host_probe+0x20/0xb8
[    5.513635]  pci_host_common_probe+0x144/0x1a8
[    5.518116]  platform_drv_probe+0x5c/0xb0
[    5.522158]  really_probe+0xec/0x3c0
[    5.525761]  driver_probe_device+0x60/0xc0
[    5.529891]  device_driver_attach+0x7c/0x88
[    5.534108]  __driver_attach+0x60/0xe8
[    5.537886]  bus_for_each_dev+0x7c/0xd0
[    5.541752]  driver_attach+0x2c/0x38
[    5.545355]  bus_add_driver+0x194/0x1f8
[    5.549221]  driver_register+0x6c/0x128
[    5.553087]  __platform_driver_register+0x50/0x60
[    5.557831]  gen_pci_driver_init+0x24/0x30
[    5.561962]  do_one_initcall+0x54/0x2d0
[    5.565830]  kernel_init_freeable+0x1ec/0x258
[    5.570223]  kernel_init+0x1c/0x120
[    5.573738]  ret_from_fork+0x10/0x30
[    5.577342] Code: b5000000 52800000 b9000261 14000008 (b9400001)
[    5.583496] ---[ end trace c0958e83ad22f359 ]---
[    5.588152] note: swapper/0[1] exited with preempt_count 1
[    5.593687] Kernel panic - not syncing: Attempted to kill init! 
exitcode=0x0000000b
[    5.601414] SMP: stopping secondary CPUs
[    5.605371] Kernel Offset: disabled
[    5.608885] CPU features: 0x00240022,61006008
[    5.613276] Memory Limit: none
[    5.616355] ---[ end Kernel panic - not syncing: Attempted to kill 
init! exitcode=0x0000000b ]---

-michael
