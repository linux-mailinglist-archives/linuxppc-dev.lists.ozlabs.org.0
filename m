Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B83EA53AC2A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 19:47:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCxSC4PlBz3c5C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 03:47:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z37bXwE1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z37bXwE1;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCxRT2QXpz3bY6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 03:47:01 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A088461635;
	Wed,  1 Jun 2022 17:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00445C385A5;
	Wed,  1 Jun 2022 17:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654105618;
	bh=xSqWarjhALj8dKEeRZN7Pwk+UoI0xRS0grTqPGkq0Ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z37bXwE16cFb4POTGHZIQMsdzIxBGSyCmSmdB5IiiiESZz9r5EYnXKBoaTwznCLi+
	 61PrQ9XC/Ssb/OnXH81eChsmzWHCsfXAIDr8t4rK6VSoqBhSv6c1xj7USCdYxENWBG
	 KC4m24lnXGw36Q6DVvasYy4ko87g7cyYRsF0DIh6ac0NK6JLcqRFCmQLs0bWr9pS8F
	 8pEuYNeBvPGmOWoUuf6M6kxwT+mvzFgsx0V02f1nrRkXum9nJRISzqFt35KZlB7cID
	 gga8ZTMBciVQHE/xDoutTxe9S5YZnn49BRdwPBH3eFCEowSTAjy4EVHfsQ7ItHJCEJ
	 x35A+j0MGTPTQ==
Date: Wed, 1 Jun 2022 10:46:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 09/15] swiotlb: make the swiotlb_init interface more
 useful
Message-ID: <YpemDuzdoaO3rijX@Ryzen-9-3900X.>
References: <20220404050559.132378-1-hch@lst.de>
 <20220404050559.132378-10-hch@lst.de>
 <YpehC7BwBlnuxplF@dev-arch.thelio-3990X>
 <20220601173441.GB27582@lst.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="euROFU3ViQK6AW7w"
Content-Disposition: inline
In-Reply-To: <20220601173441.GB27582@lst.de>
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, Joerg Roedel <joro@8bytes.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, tboot-devel@lists.sourceforge.net, xen-devel@lists.xenproject.org, David Woodhouse <dwmw2@infradead.org>, Tom Lendacky <thomas.lendacky@amd.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--euROFU3ViQK6AW7w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 01, 2022 at 07:34:41PM +0200, Christoph Hellwig wrote:
> Can you send me the full dmesg and the content of
> /sys/kernel/debug/swiotlb/io_tlb_nslabs for a good and a bad boot?

Sure thing, they are attached! If there is anything else I can provide
or test, I am more than happy to do so.

Cheers,
Nathan

--euROFU3ViQK6AW7w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="good.log"

# cat /sys/kernel/debug/swiotlb/io_tlb_nslabs
32768

# dmesg
[    0.000000] Linux version 5.18.0-rc3-microsoft-standard-WSL2-00008-ga3e230926708 (nathan@dev-arch.thelio-3990X) (gcc (GCC) 12.1.0, GNU ld (GNU Binutils) 2.38) #1 SMP PREEMPT_DYNAMIC Wed Jun 1 10:38:34 MST 2022
[    0.000000] Command line: initrd=\initrd.img panic=-1 nr_cpus=8 swiotlb=force earlycon=uart8250,io,0x3f8,115200 console=hvc0 debug pty.legacy_count=0
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Centaur CentaurHauls
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'compacted' format.
[    0.000000] signal: max sigframe size: 1776
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000e0fff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000001fffff] ACPI data
[    0.000000] BIOS-e820: [mem 0x0000000000200000-0x00000000f7ffffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x0000000407ffffff] usable
[    0.000000] earlycon: uart8250 at I/O port 0x3f8 (options '115200')
[    0.000000] printk: bootconsole [uart8250] enabled
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] DMI not present or invalid.
[    0.000000] Hypervisor detected: Microsoft Hyper-V
[    0.000000] Hyper-V: privilege flags low 0xae7f, high 0x3b8030, hints 0xc2c, misc 0xe0bed7b6
[    0.000000] Hyper-V: Host Build 10.0.22000.708-0-0
[    0.000000] Hyper-V: Nested features: 0x4a0000
[    0.000000] Hyper-V: LAPIC Timer Frequency: 0x1e8480
[    0.000000] Hyper-V: Using hypercall for remote TLB flush
[    0.000000] clocksource: hyperv_clocksource_tsc_page: mask: 0xffffffffffffffff max_cycles: 0x24e6a1710, max_idle_ns: 440795202120 ns
[    0.000005] tsc: Detected 3800.008 MHz processor
[    0.001901] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.004593] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.006806] last_pfn = 0x408000 max_arch_pfn = 0x400000000
[    0.009042] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.011760] last_pfn = 0xf8000 max_arch_pfn = 0x400000000
[    0.013959] Using GB pages for direct mapping
[    0.015749] RAMDISK: [mem 0x0371f000-0x03779fff]
[    0.017616] ACPI: Early table checksum verification disabled
[    0.019854] ACPI: RSDP 0x00000000000E0000 000024 (v02 VRTUAL)
[    0.022162] ACPI: XSDT 0x0000000000100000 000044 (v01 VRTUAL MICROSFT 00000001 MSFT 00000001)
[    0.025624] ACPI: FACP 0x0000000000101000 000114 (v06 VRTUAL MICROSFT 00000001 MSFT 00000001)
[    0.029022] ACPI: DSDT 0x00000000001011B8 01E184 (v02 MSFTVM DSDT01   00000001 MSFT 05000000)
[    0.032413] ACPI: FACS 0x0000000000101114 000040
[    0.034280] ACPI: OEM0 0x0000000000101154 000064 (v01 VRTUAL MICROSFT 00000001 MSFT 00000001)
[    0.037699] ACPI: SRAT 0x000000000011F33C 000330 (v02 VRTUAL MICROSFT 00000001 MSFT 00000001)
[    0.041089] ACPI: APIC 0x000000000011F66C 000088 (v04 VRTUAL MICROSFT 00000001 MSFT 00000001)
[    0.044475] ACPI: Reserving FACP table memory at [mem 0x101000-0x101113]
[    0.047159] ACPI: Reserving DSDT table memory at [mem 0x1011b8-0x11f33b]
[    0.049905] ACPI: Reserving FACS table memory at [mem 0x101114-0x101153]
[    0.052693] ACPI: Reserving OEM0 table memory at [mem 0x101154-0x1011b7]
[    0.055404] ACPI: Reserving SRAT table memory at [mem 0x11f33c-0x11f66b]
[    0.058040] ACPI: Reserving APIC table memory at [mem 0x11f66c-0x11f6f3]
[    0.061078] Zone ranges:
[    0.062074]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.066106]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.068763]   Normal   [mem 0x0000000100000000-0x0000000407ffffff]
[    0.071235]   Device   empty
[    0.072384] Movable zone start for each node
[    0.074058] Early memory node ranges
[    0.075515]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.077979]   node   0: [mem 0x0000000000200000-0x00000000f7ffffff]
[    0.080483]   node   0: [mem 0x0000000100000000-0x0000000407ffffff]
[    0.082980] Initmem setup node 0 [mem 0x0000000000001000-0x0000000407ffffff]
[    0.085954] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.085972] On node 0, zone DMA: 352 pages in unavailable ranges
[    0.098043] ACPI: LAPIC_NMI (acpi_id[0x01] dfl dfl lint[0x1])
[    0.102995] IOAPIC[0]: apic_id 8, version 17, address 0xfec00000, GSI 0-23
[    0.105726] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.108349] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.110909] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.112902] [mem 0xf8000000-0xffffffff] available for PCI devices
[    0.115315] Booting paravirtualized kernel on Hyper-V
[    0.117347] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.126056] setup_percpu: NR_CPUS:256 nr_cpumask_bits:256 nr_cpu_ids:8 nr_node_ids:1
[    0.129513] percpu: Embedded 53 pages/cpu s178408 r8192 d30488 u262144
[    0.132139] pcpu-alloc: s178408 r8192 d30488 u262144 alloc=1*2097152
[    0.134679] pcpu-alloc: [0] 0 1 2 3 4 5 6 7 
[    0.136341] Hyper-V: PV spinlocks enabled
[    0.137917] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.140833] Built 1 zonelists, mobility grouping on.  Total pages: 4127749
[    0.143636] Kernel command line: initrd=\initrd.img panic=-1 nr_cpus=8 swiotlb=force earlycon=uart8250,io,0x3f8,115200 console=hvc0 debug pty.legacy_count=0
[    0.151440] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.155808] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.159017] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.184685] Memory: 4126096K/16775804K available (18449K kernel code, 2647K rwdata, 3952K rodata, 1536K init, 2448K bss, 392692K reserved, 0K cma-reserved)
[    0.190358] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.192969] ftrace: allocating 51788 entries in 203 pages
[    0.201434] ftrace: allocated 203 pages with 5 groups
[    0.204349] Dynamic Preempt: none
[    0.205846] rcu: Preemptible hierarchical RCU implementation.
[    0.208162] rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=8.
[    0.210799] 	Trampoline variant of Tasks RCU enabled.
[    0.212756] 	Rude variant of Tasks RCU enabled.
[    0.214541] 	Tracing variant of Tasks RCU enabled.
[    0.216404] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.219393] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.225278] Using NULL legacy PIC
[    0.226573] NR_IRQS: 16640, nr_irqs: 488, preallocated irqs: 0
[    0.229131] random: crng init done (trusting CPU's manufacturer)
[    0.231548] Console: colour dummy device 80x25
[    0.233276] ACPI: Core revision 20211217
[    0.234931] Failed to register legacy timer interrupt
[    0.236944] APIC: Switch to symmetric I/O mode setup
[    0.238947] Hyper-V: enabling crash_kexec_post_notifiers
[    0.241016] Hyper-V: Using IPI hypercalls
[    0.242591] Hyper-V: Using enlightened APIC (xapic mode)
[    0.242680] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x6d8cbf8869f, max_idle_ns: 881590921691 ns
[    0.248870] Calibrating delay loop (skipped), value calculated using timer frequency.. 7600.01 BogoMIPS (lpj=38000080)
[    0.253092] pid_max: default: 32768 minimum: 301
[    0.254926] LSM: Security Framework initializing
[    0.256750] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.258867] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.258867] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.258867] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
[    0.258867] Last level dTLB entries: 4KB 2048, 2MB 2048, 4MB 1024, 1GB 0
[    0.258867] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.258867] Spectre V2 : Mitigation: Retpolines
[    0.258867] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.258867] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.258867] Spectre V2 : User space: Mitigation: STIBP via prctl
[    0.258867] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
[    0.258867] Freeing SMP alternatives memory: 56K
[    0.258867] smpboot: CPU0: AMD Ryzen 9 3900X 12-Core Processor (family: 0x17, model: 0x71, stepping: 0x0)
[    0.258867] cblist_init_generic: Setting adjustable number of callback queues.
[    0.258867] cblist_init_generic: Setting shift to 3 and lim to 1.
[    0.258867] cblist_init_generic: Setting shift to 3 and lim to 1.
[    0.258895] cblist_init_generic: Setting shift to 3 and lim to 1.
[    0.261292] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
[    0.263817] ... version:                0
[    0.265391] ... bit width:              48
[    0.267068] ... generic registers:      6
[    0.268634] ... value mask:             0000ffffffffffff
[    0.268871] ... max period:             00007fffffffffff
[    0.270991] ... fixed-purpose events:   0
[    0.272571] ... event mask:             000000000000003f
[    0.274695] rcu: Hierarchical SRCU implementation.
[    0.276947] smp: Bringing up secondary CPUs ...
[    0.278794] x86: Booting SMP configuration:
[    0.278872] .... node  #0, CPUs:      #1 #2 #3 #4 #5 #6 #7
[    0.279525] smp: Brought up 1 node, 8 CPUs
[    0.282814] smpboot: Max logical packages: 1
[    0.284479] smpboot: Total of 8 processors activated (60800.12 BogoMIPS)
[    0.298895] node 0 deferred pages initialised in 10ms
[    0.300921] devtmpfs: initialized
[    0.300921] x86/mm: Memory block size: 128MB
[    0.302426] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.308889] futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
[    0.312151] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.314571] thermal_sys: Registered thermal governor 'step_wise'
[    0.314572] thermal_sys: Registered thermal governor 'user_space'
[    0.316961] cpuidle: using governor menu
[    0.318916] PCI: Fatal: No config space access function found
[    0.322206] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.322206] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.322206] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.328925] raid6: skipped pq benchmark and selected avx2x4
[    0.331164] raid6: using avx2x2 recovery algorithm
[    0.331164] ACPI: Added _OSI(Module Device)
[    0.331164] ACPI: Added _OSI(Processor Device)
[    0.332457] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.334283] ACPI: Added _OSI(Processor Aggregator Device)
[    0.336463] ACPI: Added _OSI(Linux-Dell-Video)
[    0.338283] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.348871] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.355075] ACPI: 1 ACPI AML tables successfully acquired and loaded
[    0.358946] ACPI: Interpreter enabled
[    0.360583] ACPI: PM: (supports S0 S5)
[    0.362198] ACPI: Using IOAPIC for interrupt routing
[    0.364304] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.368017] ACPI: Enabled 1 GPEs in block 00 to 0F
[    0.369481] iommu: Default domain type: Translated 
[    0.371449] iommu: DMA domain TLB invalidation policy: lazy mode 
[    0.373937] SCSI subsystem initialized
[    0.375541] ACPI: bus type USB registered
[    0.377164] usbcore: registered new interface driver usbfs
[    0.378875] usbcore: registered new interface driver hub
[    0.380985] usbcore: registered new device driver usb
[    0.383023] hv_vmbus: Vmbus version:5.2
[    0.383023] PCI: Using ACPI for IRQ routing
[    0.383023] PCI: System does not support PCI
[    0.389034] clocksource: Switched to clocksource tsc-early
[    0.389075] hv_vmbus: Unknown GUID: c376c1c3-d276-48d2-90a9-c04748072c60
[    0.394146] hv_vmbus: Unknown GUID: 6e382d18-3336-4f4b-acc4-2b7703d4df4a
[    0.396909] hv_vmbus: Unknown GUID: dde9cbc0-5060-4436-9448-ea1254a5d177
[    0.399744] VFS: Disk quotas dquot_6.6.0
[    0.401370] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.404186] FS-Cache: Loaded
[    0.405386] pnp: PnP ACPI init
[    0.406693] pnp: PnP ACPI: found 3 devices
[    0.412166] NET: Registered PF_INET protocol family
[    0.414416] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.418515] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5, 131072 bytes, linear)
[    0.422058] TCP established hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.425602] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
[    0.428661] TCP: Hash tables configured (established 131072 bind 65536)
[    0.431375] UDP hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.434579] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.437587] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.440120] RPC: Registered named UNIX socket transport module.
[    0.442979] RPC: Registered udp transport module.
[    0.445120] RPC: Registered tcp transport module.
[    0.447250] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.449989] PCI: CLS 0 bytes, default 64
[    0.451619] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.451654] Trying to unpack rootfs image as initramfs...
[    0.454256] software IO TLB: mapped [mem 0x00000000f4000000-0x00000000f8000000] (64MB)
[    0.456463] Freeing initrd memory: 364K
[    0.541510] kvm: no hardware support for 'kvm_intel'
[    0.543867] SVM: TSC scaling supported
[    0.545319] kvm: Nested Virtualization enabled
[    0.547040] SVM: kvm: Nested Paging enabled
[    0.548653] SVM: kvm: Hyper-V enlightened NPT TLB flush enabled
[    0.550967] SVM: kvm: Hyper-V Direct TLB Flush enabled
[    0.552946] SVM: Virtual VMLOAD VMSAVE supported
[    0.618969] Initialise system trusted keyrings
[    0.620900] workingset: timestamp_bits=46 max_order=22 bucket_order=0
[    0.624053] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.626726] NFS: Registering the id_resolver key type
[    0.628690] Key type id_resolver registered
[    0.630376] Key type id_legacy registered
[    0.631915] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.634537] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
[    0.637515] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
[    0.640546] Key type cifs.idmap registered
[    0.642255] fuse: init (API version 7.36)
[    0.643973] SGI XFS with ACLs, security attributes, realtime, scrub, repair, quota, no debug enabled
[    0.647888] 9p: Installing v9fs 9p2000 file system support
[    0.650100] ceph: loaded (mds proto 32)
[    0.653965] NET: Registered PF_ALG protocol family
[    0.655832] xor: automatically using best checksumming function   avx       
[    0.658591] Key type asymmetric registered
[    0.660227] Asymmetric key parser 'x509' registered
[    0.662151] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
[    0.665489] hv_vmbus: registering driver hv_pci
[    0.667566] hv_pci b440727e-7525-4d9c-a556-d52029b00086: PCI VMBus probing: Using version 0x10004
[    0.671953] hv_pci b440727e-7525-4d9c-a556-d52029b00086: PCI host bridge to bus 7525:00
[    0.675135] pci_bus 7525:00: root bus resource [mem 0x9ffe00000-0x9ffe02fff window]
[    0.678177] pci_bus 7525:00: No busn resource found for root bus, will use [bus 00-ff]
[    0.682285] pci 7525:00:00.0: [1af4:1043] type 00 class 0x010000
[    0.686012] pci 7525:00:00.0: reg 0x10: [mem 0x9ffe00000-0x9ffe00fff 64bit]
[    0.689489] pci 7525:00:00.0: reg 0x18: [mem 0x9ffe01000-0x9ffe01fff 64bit]
[    0.693005] pci 7525:00:00.0: reg 0x20: [mem 0x9ffe02000-0x9ffe02fff 64bit]
[    0.698805] pci_bus 7525:00: busn_res: [bus 00-ff] end is updated to 00
[    0.701529] pci 7525:00:00.0: BAR 0: assigned [mem 0x9ffe00000-0x9ffe00fff 64bit]
[    0.705034] pci 7525:00:00.0: BAR 2: assigned [mem 0x9ffe01000-0x9ffe01fff 64bit]
[    0.708415] pci 7525:00:00.0: BAR 4: assigned [mem 0x9ffe02000-0x9ffe02fff 64bit]
[    0.712037] hv_pci 121abb12-7ab2-45ff-b4ee-e85a1067c860: PCI VMBus probing: Using version 0x10004
[    0.716192] hv_pci 121abb12-7ab2-45ff-b4ee-e85a1067c860: PCI host bridge to bus 7ab2:00
[    0.719504] pci_bus 7ab2:00: No busn resource found for root bus, will use [bus 00-ff]
[    0.723020] pci 7ab2:00:00.0: [1414:008e] type 00 class 0x030200
[    0.729607] pci_bus 7ab2:00: busn_res: [bus 00-ff] end is updated to 00
[    0.732348] hv_pci 0c573a50-ca5d-42a9-9657-3920a455151c: PCI VMBus probing: Using version 0x10004
[    0.736748] hv_pci 0c573a50-ca5d-42a9-9657-3920a455151c: PCI host bridge to bus ca5d:00
[    0.739875] pci_bus ca5d:00: root bus resource [mem 0x9ffe04000-0x9ffe06fff window]
[    0.742859] pci_bus ca5d:00: No busn resource found for root bus, will use [bus 00-ff]
[    0.746939] pci ca5d:00:00.0: [1af4:1049] type 00 class 0x010000
[    0.750206] pci ca5d:00:00.0: reg 0x10: [mem 0x9ffe04000-0x9ffe04fff 64bit]
[    0.753516] pci ca5d:00:00.0: reg 0x18: [mem 0x9ffe05000-0x9ffe05fff 64bit]
[    0.756826] pci ca5d:00:00.0: reg 0x20: [mem 0x9ffe06000-0x9ffe06fff 64bit]
[    0.763185] pci_bus ca5d:00: busn_res: [bus 00-ff] end is updated to 00
[    0.765793] pci ca5d:00:00.0: BAR 0: assigned [mem 0x9ffe04000-0x9ffe04fff 64bit]
[    0.769223] pci ca5d:00:00.0: BAR 2: assigned [mem 0x9ffe05000-0x9ffe05fff 64bit]
[    0.772634] pci ca5d:00:00.0: BAR 4: assigned [mem 0x9ffe06000-0x9ffe06fff 64bit]
[    0.784382] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.787110] 00:00: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    0.790429] 00:01: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16550A
[    0.829682] Non-volatile memory driver v1.3
[    0.831440] printk: console [hvc0] enabled
[    0.833112] printk: bootconsole [uart8250] disabled
[    0.836997] brd: module loaded
[    0.838058] loop: module loaded
[    0.838265] hv_vmbus: registering driver hv_storvsc
[    0.838832] wireguard: WireGuard 1.0.0 loaded. See www.wireguard.com for information.
[    0.839306] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
[    0.839681] tun: Universal TUN/TAP device driver, 1.6
[    0.839972] PPP generic driver version 2.4.2
[    0.840236] scsi host0: storvsc_host_t
[    0.840302] PPP BSD Compression module registered
[    0.840692] PPP Deflate Compression module registered
[    0.841134] PPP MPPE Compression module registered
[    0.841392] NET: Registered PF_PPPOX protocol family
[    0.841654] usbcore: registered new interface driver cdc_ether
[    0.841957] usbcore: registered new interface driver cdc_ncm
[    0.842276] hv_vmbus: registering driver hv_netvsc
[    0.842639] VFIO - User Level meta-driver version: 0.3
[    0.843061] usbcore: registered new interface driver cdc_acm
[    0.843378] cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
[    0.843756] usbcore: registered new interface driver ch341
[    0.843966] usbserial: USB Serial support registered for ch341-uart
[    0.844287] usbcore: registered new interface driver cp210x
[    0.844545] usbserial: USB Serial support registered for cp210x
[    0.844853] usbcore: registered new interface driver ftdi_sio
[    0.845182] usbserial: USB Serial support registered for FTDI USB Serial Device
[    0.845673] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller
[    0.846016] vhci_hcd vhci_hcd.0: new USB bus registered, assigned bus number 1
[    0.846374] vhci_hcd: created sysfs vhci_hcd.0
[    0.846742] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.18
[    0.847077] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.847418] usb usb1: Product: USB/IP Virtual Host Controller
[    0.847660] usb usb1: Manufacturer: Linux 5.18.0-rc3-microsoft-standard-WSL2-00008-ga3e230926708 vhci_hcd
[    0.847995] usb usb1: SerialNumber: vhci_hcd.0
[    0.848335] hub 1-0:1.0: USB hub found
[    0.848536] hub 1-0:1.0: 8 ports detected
[    0.848976] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller
[    0.849254] vhci_hcd vhci_hcd.0: new USB bus registered, assigned bus number 2
[    0.849621] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[    0.850102] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.18
[    0.850427] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.850718] usb usb2: Product: USB/IP Virtual Host Controller
[    0.850961] usb usb2: Manufacturer: Linux 5.18.0-rc3-microsoft-standard-WSL2-00008-ga3e230926708 vhci_hcd
[    0.851300] usb usb2: SerialNumber: vhci_hcd.0
[    0.851614] hub 2-0:1.0: USB hub found
[    0.851810] hub 2-0:1.0: 8 ports detected
[    0.852249] hv_vmbus: registering driver hyperv_keyboard
[    0.852593] rtc_cmos 00:02: RTC can wake from S4
[    0.854483] rtc_cmos 00:02: registered as rtc0
[    0.854995] rtc_cmos 00:02: setting system clock to 2022-06-01T17:39:04 UTC (1654105144)
[    0.855309] rtc_cmos 00:02: alarms up to one month, 114 bytes nvram
[    0.855718] device-mapper: ioctl: 4.46.0-ioctl (2022-02-22) initialised: dm-devel@redhat.com
[    0.856172] device-mapper: raid: Loading target version 1.15.1
[    0.856511] usbcore: registered new interface driver usbhid
[    0.856703] usbhid: USB HID core driver
[    0.856901] hv_utils: Registering HyperV Utility Driver
[    0.857113] hv_vmbus: registering driver hv_utils
[    0.857333] hv_vmbus: registering driver hv_balloon
[    0.857338] hv_utils: cannot register PTP clock: 0
[    0.857607] drop_monitor: Initializing network drop monitor service
[    0.858067] hv_utils: TimeSync IC version 4.0
[    0.858073] hv_balloon: Using Dynamic Memory protocol version 2.0
[    0.858248] Mirror/redirect action on
[    0.859029] Free page reporting enabled
[    0.859197] hv_balloon: Cold memory discard hint enabled
[    0.859770] IPVS: Registered protocols (TCP, UDP)
[    0.860029] IPVS: Connection hash table configured (size=4096, memory=64Kbytes)
[    0.860395] IPVS: ipvs loaded.
[    0.860546] IPVS: [rr] scheduler registered.
[    0.860743] IPVS: [wrr] scheduler registered.
[    0.860937] IPVS: [sh] scheduler registered.
[    0.861159] ipip: IPv4 and MPLS over IPv4 tunneling driver
[    0.861418] ipt_CLUSTERIP: ClusterIP Version 0.8 loaded successfully
[    0.861666] Initializing XFRM netlink socket
[    0.861903] NET: Registered PF_INET6 protocol family
[    0.862439] Segment Routing with IPv6
[    0.862619] In-situ OAM (IOAM) with IPv6
[    0.862791] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    0.863092] NET: Registered PF_PACKET protocol family
[    0.863332] Bridge firewalling registered
[    0.863488] 8021q: 802.1Q VLAN Support v1.8
[    0.863653] sctp: Hash tables configured (bind 256/256)
[    0.863885] 9pnet: Installing 9P2000 support
[    0.875420] Key type dns_resolver registered
[    0.875693] Key type ceph registered
[    0.875979] libceph: loaded (mon/osd proto 15/24)
[    0.876260] NET: Registered PF_VSOCK protocol family
[    0.876540] hv_vmbus: registering driver hv_sock
[    0.876769] IPI shorthand broadcast: enabled
[    0.876968] sched_clock: Marking stable (856497151, 19750700)->(930661400, -54413549)
[    0.877527] registered taskstats version 1
[    0.878008] Loading compiled-in X.509 certificates
[    0.878392] Btrfs loaded, crc32c=crc32c-generic, zoned=no, fsverity=no
[    0.883871] Freeing unused kernel image (initmem) memory: 1536K
[    0.958961] Write protecting the kernel read-only data: 24576k
[    0.959743] Freeing unused kernel image (text/rodata gap) memory: 2028K
[    0.960146] Freeing unused kernel image (rodata/data gap) memory: 144K
[    0.960406] Run /init as init process
[    0.960549]   with arguments:
[    0.960690]     /init
[    0.960790]   with environment:
[    0.960931]     HOME=/
[    0.961046]     TERM=linux
[    0.963320] scsi 0:0:0:0: Direct-Access     Msft     Virtual Disk     1.0  PQ: 0 ANSI: 5
[    0.964110] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    0.964747] sd 0:0:0:0: [sda] 641944 512-byte logical blocks: (329 MB/313 MiB)
[    0.965293] sd 0:0:0:0: [sda] Write Protect is on
[    0.965554] sd 0:0:0:0: [sda] Mode Sense: 0f 00 80 00
[    0.965967] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    1.459424] EXT4-fs (sda): mounted filesystem without journal. Quota mode: none.
[    1.677905] hv_pci 75e234e6-9a41-4c1d-8ac8-5d395d071dd2: PCI VMBus probing: Using version 0x10004
[    1.678919] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x6d8cbf8869f, max_idle_ns: 881590921691 ns
[    1.679926] hv_pci 75e234e6-9a41-4c1d-8ac8-5d395d071dd2: PCI host bridge to bus 9a41:00
[    1.680478] pci_bus 9a41:00: root bus resource [mem 0xa00000000-0xc00001fff window]
[    1.680783] pci_bus 9a41:00: No busn resource found for root bus, will use [bus 00-ff]
[    1.682091] pci 9a41:00:00.0: [1af4:105a] type 00 class 0x088000
[    1.684295] pci 9a41:00:00.0: reg 0x10: [mem 0xc00000000-0xc00000fff 64bit]
[    1.686271] pci 9a41:00:00.0: reg 0x18: [mem 0xc00001000-0xc00001fff 64bit]
[    1.688288] pci 9a41:00:00.0: reg 0x20: [mem 0xa00000000-0xbffffffff 64bit]
[    1.693245] pci_bus 9a41:00: busn_res: [bus 00-ff] end is updated to 00
[    1.693513] pci 9a41:00:00.0: BAR 4: assigned [mem 0xa00000000-0xbffffffff 64bit]
[    1.695391] pci 9a41:00:00.0: BAR 0: assigned [mem 0xc00000000-0xc00000fff 64bit]
[    1.697251] pci 9a41:00:00.0: BAR 2: assigned [mem 0xc00001000-0xc00001fff 64bit]
[    1.712810] virtiofs virtio2: Cache len: 0x200000000 @ 0xa00000000
[    1.713702] clocksource: Switched to clocksource tsc
[    1.739139] sd 0:0:0:0: [sda] Attached SCSI disk
[    1.778098] memmap_init_zone_device initialised 2097152 pages in 10ms
[    1.779673] WSL2: SetEphemeralPortRange is a no-op : range (0, 0)
[    1.848936] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[    2.479025] scsi 0:0:0:1: Direct-Access     Msft     Virtual Disk     1.0  PQ: 0 ANSI: 5
[    2.479872] sd 0:0:0:1: Attached scsi generic sg1 type 0
[    2.480323] sd 0:0:0:1: [sdb] 2097160 512-byte logical blocks: (1.07 GB/1.00 GiB)
[    2.480417] scsi 0:0:0:2: Direct-Access     Msft     Virtual Disk     1.0  PQ: 0 ANSI: 5
[    2.480787] sd 0:0:0:1: [sdb] 4096-byte physical blocks
[    2.481485] sd 0:0:0:2: Attached scsi generic sg2 type 0
[    2.481508] sd 0:0:0:1: [sdb] Write Protect is off
[    2.482052] sd 0:0:0:2: [sdc] 536870912 512-byte logical blocks: (275 GB/256 GiB)
[    2.482106] sd 0:0:0:1: [sdb] Mode Sense: 0f 00 00 00
[    2.482522] sd 0:0:0:2: [sdc] 4096-byte physical blocks
[    2.482915] sd 0:0:0:1: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    2.483103] sd 0:0:0:2: [sdc] Write Protect is off
[    2.483857] sd 0:0:0:2: [sdc] Mode Sense: 0f 00 00 00
[    2.484274] sd 0:0:0:2: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    2.485716] sd 0:0:0:1: [sdb] Attached SCSI disk
[    2.491559] sd 0:0:0:2: [sdc] Attached SCSI disk
[    2.500504] EXT4-fs (sdc): recovery complete
[    2.501459] EXT4-fs (sdc): mounted filesystem with ordered data mode. Quota mode: none.
[    2.522816] Adding 1048576k swap on /dev/sdb.  Priority:-2 extents:1 across:1048576k 
[    2.681998] hv_pci 218ee01d-fcab-4f07-9ea0-57e00b7600be: PCI VMBus probing: Using version 0x10004
[    2.683056] 9pnet_virtio: no channels available for device drvfs
[    2.683289] hv_pci 218ee01d-fcab-4f07-9ea0-57e00b7600be: PCI host bridge to bus fcab:00
[    2.683349] init: (1) WARNING: mount: waiting for virtio device...
[    2.683645] pci_bus fcab:00: root bus resource [mem 0x9ffe08000-0x9ffe0afff window]
[    2.684167] pci_bus fcab:00: No busn resource found for root bus, will use [bus 00-ff]
[    2.685517] pci fcab:00:00.0: [1af4:1049] type 00 class 0x010000
[    2.686817] pci fcab:00:00.0: reg 0x10: [mem 0x9ffe08000-0x9ffe08fff 64bit]
[    2.687677] pci fcab:00:00.0: reg 0x18: [mem 0x9ffe09000-0x9ffe09fff 64bit]
[    2.688539] pci fcab:00:00.0: reg 0x20: [mem 0x9ffe0a000-0x9ffe0afff 64bit]
[    2.692528] pci_bus fcab:00: busn_res: [bus 00-ff] end is updated to 00
[    2.692830] pci fcab:00:00.0: BAR 0: assigned [mem 0x9ffe08000-0x9ffe08fff 64bit]
[    2.693631] pci fcab:00:00.0: BAR 2: assigned [mem 0x9ffe09000-0x9ffe09fff 64bit]
[    2.694374] pci fcab:00:00.0: BAR 4: assigned [mem 0x9ffe0a000-0x9ffe0afff 64bit]
[    2.788379] hv_pci 5767d560-6512-42aa-bddc-89eca93e4c84: PCI VMBus probing: Using version 0x10004
[    2.789471] 9pnet_virtio: no channels available for device drvfs
[    2.789751] hv_pci 5767d560-6512-42aa-bddc-89eca93e4c84: PCI host bridge to bus 6512:00
[    2.789774] init: (1) WARNING: mount: waiting for virtio device...
[    2.790068] pci_bus 6512:00: root bus resource [mem 0x9ffe0c000-0x9ffe0efff window]
[    2.790613] pci_bus 6512:00: No busn resource found for root bus, will use [bus 00-ff]
[    2.791858] pci 6512:00:00.0: [1af4:1049] type 00 class 0x010000
[    2.792992] pci 6512:00:00.0: reg 0x10: [mem 0x9ffe0c000-0x9ffe0cfff 64bit]
[    2.793834] pci 6512:00:00.0: reg 0x18: [mem 0x9ffe0d000-0x9ffe0dfff 64bit]
[    2.794694] pci 6512:00:00.0: reg 0x20: [mem 0x9ffe0e000-0x9ffe0efff 64bit]
[    2.798621] pci_bus 6512:00: busn_res: [bus 00-ff] end is updated to 00
[    2.798961] pci 6512:00:00.0: BAR 0: assigned [mem 0x9ffe0c000-0x9ffe0cfff 64bit]
[    2.799695] pci 6512:00:00.0: BAR 2: assigned [mem 0x9ffe0d000-0x9ffe0dfff 64bit]
[    2.800416] pci 6512:00:00.0: BAR 4: assigned [mem 0x9ffe0e000-0x9ffe0efff 64bit]
[    2.895193] hv_pci 4fae7a25-5e7f-42d1-8a8f-7e1eb4128529: PCI VMBus probing: Using version 0x10004
[    2.896654] hv_pci 4fae7a25-5e7f-42d1-8a8f-7e1eb4128529: PCI host bridge to bus 5e7f:00
[    2.897036] pci_bus 5e7f:00: root bus resource [mem 0x9ffe10000-0x9ffe12fff window]
[    2.897405] pci_bus 5e7f:00: No busn resource found for root bus, will use [bus 00-ff]
[    2.898729] pci 5e7f:00:00.0: [1af4:1049] type 00 class 0x010000
[    2.900002] pci 5e7f:00:00.0: reg 0x10: [mem 0x9ffe10000-0x9ffe10fff 64bit]
[    2.900885] pci 5e7f:00:00.0: reg 0x18: [mem 0x9ffe11000-0x9ffe11fff 64bit]
[    2.901753] pci 5e7f:00:00.0: reg 0x20: [mem 0x9ffe12000-0x9ffe12fff 64bit]
[    2.905797] pci_bus 5e7f:00: busn_res: [bus 00-ff] end is updated to 00
[    2.906134] pci 5e7f:00:00.0: BAR 0: assigned [mem 0x9ffe10000-0x9ffe10fff 64bit]
[    2.906894] pci 5e7f:00:00.0: BAR 2: assigned [mem 0x9ffe11000-0x9ffe11fff 64bit]
[    2.907627] pci 5e7f:00:00.0: BAR 4: assigned [mem 0x9ffe12000-0x9ffe12fff 64bit]
[    3.077268] hv_pci 98cd7659-96ca-4b6a-95f7-0896075bc081: PCI VMBus probing: Using version 0x10004
[    3.078351] 9pnet_virtio: no channels available for device drvfs
[    3.078666] init: (1) WARNING: mount: waiting for virtio device...
[    3.078865] hv_pci 98cd7659-96ca-4b6a-95f7-0896075bc081: PCI host bridge to bus 96ca:00
[    3.079411] pci_bus 96ca:00: root bus resource [mem 0x9ffe14000-0x9ffe16fff window]
[    3.079774] pci_bus 96ca:00: No busn resource found for root bus, will use [bus 00-ff]
[    3.081309] pci 96ca:00:00.0: [1af4:1049] type 00 class 0x010000
[    3.082647] pci 96ca:00:00.0: reg 0x10: [mem 0x9ffe14000-0x9ffe14fff 64bit]
[    3.083650] pci 96ca:00:00.0: reg 0x18: [mem 0x9ffe15000-0x9ffe15fff 64bit]
[    3.084634] pci 96ca:00:00.0: reg 0x20: [mem 0x9ffe16000-0x9ffe16fff 64bit]
[    3.088677] pci_bus 96ca:00: busn_res: [bus 00-ff] end is updated to 00
[    3.089026] pci 96ca:00:00.0: BAR 0: assigned [mem 0x9ffe14000-0x9ffe14fff 64bit]
[    3.089905] pci 96ca:00:00.0: BAR 2: assigned [mem 0x9ffe15000-0x9ffe15fff 64bit]
[    3.090676] pci 96ca:00:00.0: BAR 4: assigned [mem 0x9ffe16000-0x9ffe16fff 64bit]
[    3.183923] hv_pci d00b62d9-165b-4f27-8533-5d0402fb00d8: PCI VMBus probing: Using version 0x10004
[    3.185457] hv_pci d00b62d9-165b-4f27-8533-5d0402fb00d8: PCI host bridge to bus 165b:00
[    3.185861] pci_bus 165b:00: root bus resource [mem 0x9ffe18000-0x9ffe1afff window]
[    3.185908] 9pnet_virtio: no channels available for device drvfs
[    3.186186] pci_bus 165b:00: No busn resource found for root bus, will use [bus 00-ff]
[    3.186580] init: (1) WARNING: mount: waiting for virtio device...
[    3.187888] pci 165b:00:00.0: [1af4:1049] type 00 class 0x010000
[    3.189081] pci 165b:00:00.0: reg 0x10: [mem 0x9ffe18000-0x9ffe18fff 64bit]
[    3.189964] pci 165b:00:00.0: reg 0x18: [mem 0x9ffe19000-0x9ffe19fff 64bit]
[    3.190841] pci 165b:00:00.0: reg 0x20: [mem 0x9ffe1a000-0x9ffe1afff 64bit]
[    3.194800] pci_bus 165b:00: busn_res: [bus 00-ff] end is updated to 00
[    3.195067] pci 165b:00:00.0: BAR 0: assigned [mem 0x9ffe18000-0x9ffe18fff 64bit]
[    3.195787] pci 165b:00:00.0: BAR 2: assigned [mem 0x9ffe19000-0x9ffe19fff 64bit]
[    3.196517] pci 165b:00:00.0: BAR 4: assigned [mem 0x9ffe1a000-0x9ffe1afff 64bit]
[    3.292120] hv_pci ff437ee8-6a13-4119-800a-411d24b930e4: PCI VMBus probing: Using version 0x10004
[    3.293643] hv_pci ff437ee8-6a13-4119-800a-411d24b930e4: PCI host bridge to bus 6a13:00
[    3.294135] pci_bus 6a13:00: root bus resource [mem 0x9ffe1c000-0x9ffe1efff window]
[    3.294500] pci_bus 6a13:00: No busn resource found for root bus, will use [bus 00-ff]
[    3.295857] pci 6a13:00:00.0: [1af4:1049] type 00 class 0x010000
[    3.297136] pci 6a13:00:00.0: reg 0x10: [mem 0x9ffe1c000-0x9ffe1cfff 64bit]
[    3.298009] pci 6a13:00:00.0: reg 0x18: [mem 0x9ffe1d000-0x9ffe1dfff 64bit]
[    3.298981] pci 6a13:00:00.0: reg 0x20: [mem 0x9ffe1e000-0x9ffe1efff 64bit]
[    3.303144] pci_bus 6a13:00: busn_res: [bus 00-ff] end is updated to 00
[    3.303421] pci 6a13:00:00.0: BAR 0: assigned [mem 0x9ffe1c000-0x9ffe1cfff 64bit]
[    3.304141] pci 6a13:00:00.0: BAR 2: assigned [mem 0x9ffe1d000-0x9ffe1dfff 64bit]
[    3.304851] pci 6a13:00:00.0: BAR 4: assigned [mem 0x9ffe1e000-0x9ffe1efff 64bit]
[   49.723597] hv_balloon: Max. dynamic memory size: 16384 MB

--euROFU3ViQK6AW7w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="bad.log"

# cat /sys/kernel/debug/swiotlb/io_tlb_nslabs
32768

# dmesg
[    0.000000] Linux version 5.18.0-rc3-microsoft-standard-WSL2-00009-gc6af2aa9ffc9 (nathan@dev-arch.thelio-3990X) (gcc (GCC) 12.1.0, GNU ld (GNU Binutils) 2.38) #1 SMP PREEMPT_DYNAMIC Wed Jun 1 10:41:21 MST 2022
[    0.000000] Command line: initrd=\initrd.img panic=-1 nr_cpus=8 swiotlb=force earlycon=uart8250,io,0x3f8,115200 console=hvc0 debug pty.legacy_count=0
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Centaur CentaurHauls
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'compacted' format.
[    0.000000] signal: max sigframe size: 1776
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000e0fff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000001fffff] ACPI data
[    0.000000] BIOS-e820: [mem 0x0000000000200000-0x00000000f7ffffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x0000000407ffffff] usable
[    0.000000] earlycon: uart8250 at I/O port 0x3f8 (options '115200')
[    0.000000] printk: bootconsole [uart8250] enabled
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] DMI not present or invalid.
[    0.000000] Hypervisor detected: Microsoft Hyper-V
[    0.000000] Hyper-V: privilege flags low 0xae7f, high 0x3b8030, hints 0xc2c, misc 0xe0bed7b6
[    0.000000] Hyper-V: Host Build 10.0.22000.708-0-0
[    0.000000] Hyper-V: Nested features: 0x4a0000
[    0.000000] Hyper-V: LAPIC Timer Frequency: 0x1e8480
[    0.000000] Hyper-V: Using hypercall for remote TLB flush
[    0.000000] clocksource: hyperv_clocksource_tsc_page: mask: 0xffffffffffffffff max_cycles: 0x24e6a1710, max_idle_ns: 440795202120 ns
[    0.000003] tsc: Detected 3800.008 MHz processor
[    0.001844] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.004500] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.006752] last_pfn = 0x408000 max_arch_pfn = 0x400000000
[    0.008928] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.011617] last_pfn = 0xf8000 max_arch_pfn = 0x400000000
[    0.013721] Using GB pages for direct mapping
[    0.015504] RAMDISK: [mem 0x0371f000-0x03779fff]
[    0.017288] ACPI: Early table checksum verification disabled
[    0.019511] ACPI: RSDP 0x00000000000E0000 000024 (v02 VRTUAL)
[    0.021806] ACPI: XSDT 0x0000000000100000 000044 (v01 VRTUAL MICROSFT 00000001 MSFT 00000001)
[    0.025255] ACPI: FACP 0x0000000000101000 000114 (v06 VRTUAL MICROSFT 00000001 MSFT 00000001)
[    0.028644] ACPI: DSDT 0x00000000001011B8 01E184 (v02 MSFTVM DSDT01   00000001 MSFT 05000000)
[    0.032074] ACPI: FACS 0x0000000000101114 000040
[    0.033876] ACPI: OEM0 0x0000000000101154 000064 (v01 VRTUAL MICROSFT 00000001 MSFT 00000001)
[    0.037335] ACPI: SRAT 0x000000000011F33C 000330 (v02 VRTUAL MICROSFT 00000001 MSFT 00000001)
[    0.040839] ACPI: APIC 0x000000000011F66C 000088 (v04 VRTUAL MICROSFT 00000001 MSFT 00000001)
[    0.044205] ACPI: Reserving FACP table memory at [mem 0x101000-0x101113]
[    0.046856] ACPI: Reserving DSDT table memory at [mem 0x1011b8-0x11f33b]
[    0.049526] ACPI: Reserving FACS table memory at [mem 0x101114-0x101153]
[    0.052323] ACPI: Reserving OEM0 table memory at [mem 0x101154-0x1011b7]
[    0.054916] ACPI: Reserving SRAT table memory at [mem 0x11f33c-0x11f66b]
[    0.057563] ACPI: Reserving APIC table memory at [mem 0x11f66c-0x11f6f3]
[    0.060644] Zone ranges:
[    0.061621]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.064031]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.066551]   Normal   [mem 0x0000000100000000-0x0000000407ffffff]
[    0.069096]   Device   empty
[    0.070236] Movable zone start for each node
[    0.071880] Early memory node ranges
[    0.073323]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.075736]   node   0: [mem 0x0000000000200000-0x00000000f7ffffff]
[    0.078260]   node   0: [mem 0x0000000100000000-0x0000000407ffffff]
[    0.080698] Initmem setup node 0 [mem 0x0000000000001000-0x0000000407ffffff]
[    0.083706] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.083724] On node 0, zone DMA: 352 pages in unavailable ranges
[    0.095850] ACPI: LAPIC_NMI (acpi_id[0x01] dfl dfl lint[0x1])
[    0.100817] IOAPIC[0]: apic_id 8, version 17, address 0xfec00000, GSI 0-23
[    0.103601] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.106156] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.108743] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.110810] [mem 0xf8000000-0xffffffff] available for PCI devices
[    0.113193] Booting paravirtualized kernel on Hyper-V
[    0.115221] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.124086] setup_percpu: NR_CPUS:256 nr_cpumask_bits:256 nr_cpu_ids:8 nr_node_ids:1
[    0.127620] percpu: Embedded 53 pages/cpu s178408 r8192 d30488 u262144
[    0.130204] pcpu-alloc: s178408 r8192 d30488 u262144 alloc=1*2097152
[    0.132746] pcpu-alloc: [0] 0 1 2 3 4 5 6 7 
[    0.134452] Hyper-V: PV spinlocks enabled
[    0.136082] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.138923] Built 1 zonelists, mobility grouping on.  Total pages: 4127749
[    0.141669] Kernel command line: initrd=\initrd.img panic=-1 nr_cpus=8 swiotlb=force earlycon=uart8250,io,0x3f8,115200 console=hvc0 debug pty.legacy_count=0
[    0.149809] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.154232] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.157400] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.182296] Memory: 4126096K/16775804K available (18449K kernel code, 2647K rwdata, 3952K rodata, 1536K init, 2448K bss, 392692K reserved, 0K cma-reserved)
[    0.188084] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.190824] ftrace: allocating 51788 entries in 203 pages
[    0.199397] ftrace: allocated 203 pages with 5 groups
[    0.202320] Dynamic Preempt: none
[    0.203777] rcu: Preemptible hierarchical RCU implementation.
[    0.206055] rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=8.
[    0.208807] 	Trampoline variant of Tasks RCU enabled.
[    0.210844] 	Rude variant of Tasks RCU enabled.
[    0.213292] 	Tracing variant of Tasks RCU enabled.
[    0.215445] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.218380] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.224306] Using NULL legacy PIC
[    0.225589] NR_IRQS: 16640, nr_irqs: 488, preallocated irqs: 0
[    0.228245] random: crng init done (trusting CPU's manufacturer)
[    0.230636] Console: colour dummy device 80x25
[    0.232438] ACPI: Core revision 20211217
[    0.234033] Failed to register legacy timer interrupt
[    0.236047] APIC: Switch to symmetric I/O mode setup
[    0.238014] Hyper-V: enabling crash_kexec_post_notifiers
[    0.240107] Hyper-V: Using IPI hypercalls
[    0.241666] Hyper-V: Using enlightened APIC (xapic mode)
[    0.241757] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x6d8cbf8869f, max_idle_ns: 881590921691 ns
[    0.247930] Calibrating delay loop (skipped), value calculated using timer frequency.. 7600.01 BogoMIPS (lpj=38000080)
[    0.252067] pid_max: default: 32768 minimum: 301
[    0.253895] LSM: Security Framework initializing
[    0.255751] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.257927] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.257927] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.257927] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
[    0.257927] Last level dTLB entries: 4KB 2048, 2MB 2048, 4MB 1024, 1GB 0
[    0.257927] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.257927] Spectre V2 : Mitigation: Retpolines
[    0.257927] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.257927] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.257927] Spectre V2 : User space: Mitigation: STIBP via prctl
[    0.257927] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
[    0.257927] Freeing SMP alternatives memory: 56K
[    0.257927] smpboot: CPU0: AMD Ryzen 9 3900X 12-Core Processor (family: 0x17, model: 0x71, stepping: 0x0)
[    0.257927] cblist_init_generic: Setting adjustable number of callback queues.
[    0.257927] cblist_init_generic: Setting shift to 3 and lim to 1.
[    0.257927] cblist_init_generic: Setting shift to 3 and lim to 1.
[    0.257953] cblist_init_generic: Setting shift to 3 and lim to 1.
[    0.260344] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
[    0.262870] ... version:                0
[    0.264433] ... bit width:              48
[    0.266024] ... generic registers:      6
[    0.267586] ... value mask:             0000ffffffffffff
[    0.267931] ... max period:             00007fffffffffff
[    0.269978] ... fixed-purpose events:   0
[    0.271549] ... event mask:             000000000000003f
[    0.273693] rcu: Hierarchical SRCU implementation.
[    0.275947] smp: Bringing up secondary CPUs ...
[    0.277746] x86: Booting SMP configuration:
[    0.277931] .... node  #0, CPUs:      #1 #2 #3 #4 #5 #6 #7
[    0.278598] smp: Brought up 1 node, 8 CPUs
[    0.281786] smpboot: Max logical packages: 1
[    0.283442] smpboot: Total of 8 processors activated (60800.12 BogoMIPS)
[    0.297948] node 0 deferred pages initialised in 10ms
[    0.300095] devtmpfs: initialized
[    0.300095] x86/mm: Memory block size: 128MB
[    0.301372] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.307950] futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
[    0.311117] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.313590] thermal_sys: Registered thermal governor 'step_wise'
[    0.313591] thermal_sys: Registered thermal governor 'user_space'
[    0.315970] cpuidle: using governor menu
[    0.317983] PCI: Fatal: No config space access function found
[    0.321181] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.321181] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.321181] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.327982] raid6: skipped pq benchmark and selected avx2x4
[    0.330080] raid6: using avx2x2 recovery algorithm
[    0.331916] ACPI: Added _OSI(Module Device)
[    0.337945] ACPI: Added _OSI(Processor Device)
[    0.339664] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.341472] ACPI: Added _OSI(Processor Aggregator Device)
[    0.343581] ACPI: Added _OSI(Linux-Dell-Video)
[    0.345290] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.347310] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.351846] ACPI: 1 ACPI AML tables successfully acquired and loaded
[    0.354878] ACPI: Interpreter enabled
[    0.357948] ACPI: PM: (supports S0 S5)
[    0.359386] ACPI: Using IOAPIC for interrupt routing
[    0.361295] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.364875] ACPI: Enabled 1 GPEs in block 00 to 0F
[    0.367281] iommu: Default domain type: Translated 
[    0.367930] iommu: DMA domain TLB invalidation policy: lazy mode 
[    0.370342] SCSI subsystem initialized
[    0.371819] ACPI: bus type USB registered
[    0.373384] usbcore: registered new interface driver usbfs
[    0.375508] usbcore: registered new interface driver hub
[    0.377556] usbcore: registered new device driver usb
[    0.378007] hv_vmbus: Vmbus version:5.2
[    0.379525] PCI: Using ACPI for IRQ routing
[    0.381148] PCI: System does not support PCI
[    0.382985] hv_vmbus: Unknown GUID: c376c1c3-d276-48d2-90a9-c04748072c60
[    0.385656] hv_vmbus: Unknown GUID: 6e382d18-3336-4f4b-acc4-2b7703d4df4a
[    0.385656] hv_vmbus: Unknown GUID: dde9cbc0-5060-4436-9448-ea1254a5d177
[    0.385656] clocksource: Switched to clocksource tsc-early
[    0.395132] VFS: Disk quotas dquot_6.6.0
[    0.398629] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.401503] FS-Cache: Loaded
[    0.402695] pnp: PnP ACPI init
[    0.403992] pnp: PnP ACPI: found 3 devices
[    0.409671] NET: Registered PF_INET protocol family
[    0.411938] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.416026] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5, 131072 bytes, linear)
[    0.419575] TCP established hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.423230] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
[    0.426347] TCP: Hash tables configured (established 131072 bind 65536)
[    0.429190] UDP hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.432209] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.435648] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.438375] RPC: Registered named UNIX socket transport module.
[    0.440789] RPC: Registered udp transport module.
[    0.442671] RPC: Registered tcp transport module.
[    0.444673] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.447332] PCI: CLS 0 bytes, default 64
[    0.448993] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.449028] Trying to unpack rootfs image as initramfs...
[    0.451710] software IO TLB: mapped [mem 0x00000000f4000000-0x00000000f8000000] (64MB)
[    0.454079] Freeing initrd memory: 364K
[    0.541430] kvm: no hardware support for 'kvm_intel'
[    0.543753] SVM: TSC scaling supported
[    0.545214] kvm: Nested Virtualization enabled
[    0.546939] SVM: kvm: Nested Paging enabled
[    0.548655] SVM: kvm: Hyper-V enlightened NPT TLB flush enabled
[    0.550982] SVM: kvm: Hyper-V Direct TLB Flush enabled
[    0.553055] SVM: Virtual VMLOAD VMSAVE supported
[    0.619230] Initialise system trusted keyrings
[    0.621148] workingset: timestamp_bits=46 max_order=22 bucket_order=0
[    0.624304] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.626917] NFS: Registering the id_resolver key type
[    0.628911] Key type id_resolver registered
[    0.630622] Key type id_legacy registered
[    0.632252] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.635096] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
[    0.638073] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
[    0.641200] Key type cifs.idmap registered
[    0.642865] fuse: init (API version 7.36)
[    0.644622] SGI XFS with ACLs, security attributes, realtime, scrub, repair, quota, no debug enabled
[    0.648593] 9p: Installing v9fs 9p2000 file system support
[    0.650987] ceph: loaded (mds proto 32)
[    0.654860] NET: Registered PF_ALG protocol family
[    0.656711] xor: automatically using best checksumming function   avx       
[    0.659472] Key type asymmetric registered
[    0.661072] Asymmetric key parser 'x509' registered
[    0.662976] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
[    0.666333] hv_vmbus: registering driver hv_pci
[    0.668465] hv_pci a154a52e-df93-4a32-a470-37362af9092a: PCI VMBus probing: Using version 0x10004
[    0.672862] hv_pci a154a52e-df93-4a32-a470-37362af9092a: PCI host bridge to bus df93:00
[    0.675963] pci_bus df93:00: root bus resource [mem 0x9ffe00000-0x9ffe02fff window]
[    0.678965] pci_bus df93:00: No busn resource found for root bus, will use [bus 00-ff]
[    0.683016] pci df93:00:00.0: [1af4:1043] type 00 class 0x010000
[    0.686425] pci df93:00:00.0: reg 0x10: [mem 0x9ffe00000-0x9ffe00fff 64bit]
[    0.689851] pci df93:00:00.0: reg 0x18: [mem 0x9ffe01000-0x9ffe01fff 64bit]
[    0.693249] pci df93:00:00.0: reg 0x20: [mem 0x9ffe02000-0x9ffe02fff 64bit]
[    0.698971] pci_bus df93:00: busn_res: [bus 00-ff] end is updated to 00
[    0.701554] pci df93:00:00.0: BAR 0: assigned [mem 0x9ffe00000-0x9ffe00fff 64bit]
[    0.704894] pci df93:00:00.0: BAR 2: assigned [mem 0x9ffe01000-0x9ffe01fff 64bit]
[    0.708243] pci df93:00:00.0: BAR 4: assigned [mem 0x9ffe02000-0x9ffe02fff 64bit]
[    0.711877] hv_pci ca66d0fe-4477-439b-9d67-02d7bd2dcb05: PCI VMBus probing: Using version 0x10004
[    0.716001] hv_pci ca66d0fe-4477-439b-9d67-02d7bd2dcb05: PCI host bridge to bus 4477:00
[    0.719136] pci_bus 4477:00: No busn resource found for root bus, will use [bus 00-ff]
[    0.722586] pci 4477:00:00.0: [1414:008e] type 00 class 0x030200
[    0.729016] pci_bus 4477:00: busn_res: [bus 00-ff] end is updated to 00
[    0.731822] hv_pci c42c9658-a709-40bd-8d72-5ee9b78e28ca: PCI VMBus probing: Using version 0x10004
[    0.736240] hv_pci c42c9658-a709-40bd-8d72-5ee9b78e28ca: PCI host bridge to bus a709:00
[    0.739381] pci_bus a709:00: root bus resource [mem 0x9ffe04000-0x9ffe06fff window]
[    0.742368] pci_bus a709:00: No busn resource found for root bus, will use [bus 00-ff]
[    0.746437] pci a709:00:00.0: [1af4:1049] type 00 class 0x010000
[    0.749663] pci a709:00:00.0: reg 0x10: [mem 0x9ffe04000-0x9ffe04fff 64bit]
[    0.752975] pci a709:00:00.0: reg 0x18: [mem 0x9ffe05000-0x9ffe05fff 64bit]
[    0.756273] pci a709:00:00.0: reg 0x20: [mem 0x9ffe06000-0x9ffe06fff 64bit]
[    0.762929] pci_bus a709:00: busn_res: [bus 00-ff] end is updated to 00
[    0.765585] pci a709:00:00.0: BAR 0: assigned [mem 0x9ffe04000-0x9ffe04fff 64bit]
[    0.769014] pci a709:00:00.0: BAR 2: assigned [mem 0x9ffe05000-0x9ffe05fff 64bit]
[    0.772436] pci a709:00:00.0: BAR 4: assigned [mem 0x9ffe06000-0x9ffe06fff 64bit]
[    0.784024] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.786788] 00:00: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    0.790004] 00:01: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16550A
[    0.828478] Non-volatile memory driver v1.3
[    0.830180] printk: console [hvc0] enabled
[    0.831804] printk: bootconsole [uart8250] disabled
[    0.835700] brd: module loaded
[    0.836692] loop: module loaded
[    0.836890] hv_vmbus: registering driver hv_storvsc
[    0.837466] wireguard: WireGuard 1.0.0 loaded. See www.wireguard.com for information.
[    0.837853] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
[    0.838217] scsi host0: storvsc_host_t
[    0.838399] tun: Universal TUN/TAP device driver, 1.6
[    0.838812] PPP generic driver version 2.4.2
[    0.839159] PPP BSD Compression module registered
[    0.839395] PPP Deflate Compression module registered
[    0.839781] PPP MPPE Compression module registered
[    0.840046] NET: Registered PF_PPPOX protocol family
[    0.840326] usbcore: registered new interface driver cdc_ether
[    0.840687] usbcore: registered new interface driver cdc_ncm
[    0.841009] hv_vmbus: registering driver hv_netvsc
[    0.841331] VFIO - User Level meta-driver version: 0.3
[    0.841707] usbcore: registered new interface driver cdc_acm
[    0.841999] cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
[    0.842346] usbcore: registered new interface driver ch341
[    0.842613] usbserial: USB Serial support registered for ch341-uart
[    0.842907] usbcore: registered new interface driver cp210x
[    0.843226] usbserial: USB Serial support registered for cp210x
[    0.843574] usbcore: registered new interface driver ftdi_sio
[    0.843874] usbserial: USB Serial support registered for FTDI USB Serial Device
[    0.844325] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller
[    0.844630] vhci_hcd vhci_hcd.0: new USB bus registered, assigned bus number 1
[    0.844968] vhci_hcd: created sysfs vhci_hcd.0
[    0.845394] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.18
[    0.845749] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.846033] usb usb1: Product: USB/IP Virtual Host Controller
[    0.846274] usb usb1: Manufacturer: Linux 5.18.0-rc3-microsoft-standard-WSL2-00009-gc6af2aa9ffc9 vhci_hcd
[    0.846606] usb usb1: SerialNumber: vhci_hcd.0
[    0.846887] hub 1-0:1.0: USB hub found
[    0.847077] hub 1-0:1.0: 8 ports detected
[    0.847565] vhci_hcd vhci_hcd.0: USB/IP Virtual Host Controller
[    0.847828] vhci_hcd vhci_hcd.0: new USB bus registered, assigned bus number 2
[    0.848246] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[    0.848690] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.18
[    0.848997] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.849279] usb usb2: Product: USB/IP Virtual Host Controller
[    0.849523] usb usb2: Manufacturer: Linux 5.18.0-rc3-microsoft-standard-WSL2-00009-gc6af2aa9ffc9 vhci_hcd
[    0.849855] usb usb2: SerialNumber: vhci_hcd.0
[    0.850138] hub 2-0:1.0: USB hub found
[    0.850333] hub 2-0:1.0: 8 ports detected
[    0.850772] hv_vmbus: registering driver hyperv_keyboard
[    0.851119] rtc_cmos 00:02: RTC can wake from S4
[    0.853017] rtc_cmos 00:02: registered as rtc0
[    0.853536] rtc_cmos 00:02: setting system clock to 2022-06-01T17:41:59 UTC (1654105319)
[    0.853854] rtc_cmos 00:02: alarms up to one month, 114 bytes nvram
[    0.854249] device-mapper: ioctl: 4.46.0-ioctl (2022-02-22) initialised: dm-devel@redhat.com
[    0.854710] device-mapper: raid: Loading target version 1.15.1
[    0.855003] usbcore: registered new interface driver usbhid
[    0.855198] usbhid: USB HID core driver
[    0.855394] hv_utils: Registering HyperV Utility Driver
[    0.855608] hv_vmbus: registering driver hv_utils
[    0.855910] hv_vmbus: registering driver hv_balloon
[    0.855914] hv_utils: cannot register PTP clock: 0
[    0.856165] drop_monitor: Initializing network drop monitor service
[    0.856597] hv_balloon: Using Dynamic Memory protocol version 2.0
[    0.856611] hv_utils: TimeSync IC version 4.0
[    0.856742] Mirror/redirect action on
[    0.857542] Free page reporting enabled
[    0.857744] hv_balloon: Cold memory discard hint enabled
[    0.858304] IPVS: Registered protocols (TCP, UDP)
[    0.858534] IPVS: Connection hash table configured (size=4096, memory=64Kbytes)
[    0.858872] IPVS: ipvs loaded.
[    0.859018] IPVS: [rr] scheduler registered.
[    0.859213] IPVS: [wrr] scheduler registered.
[    0.859405] IPVS: [sh] scheduler registered.
[    0.859622] ipip: IPv4 and MPLS over IPv4 tunneling driver
[    0.860047] ipt_CLUSTERIP: ClusterIP Version 0.8 loaded successfully
[    0.860293] Initializing XFRM netlink socket
[    0.860522] NET: Registered PF_INET6 protocol family
[    0.861019] Segment Routing with IPv6
[    0.861193] In-situ OAM (IOAM) with IPv6
[    0.861362] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    0.861655] NET: Registered PF_PACKET protocol family
[    0.861875] Bridge firewalling registered
[    0.862024] 8021q: 802.1Q VLAN Support v1.8
[    0.862189] sctp: Hash tables configured (bind 256/256)
[    0.862419] 9pnet: Installing 9P2000 support
[    0.874428] Key type dns_resolver registered
[    0.874663] Key type ceph registered
[    0.874921] libceph: loaded (mon/osd proto 15/24)
[    0.875208] NET: Registered PF_VSOCK protocol family
[    0.875419] hv_vmbus: registering driver hv_sock
[    0.875644] IPI shorthand broadcast: enabled
[    0.875840] sched_clock: Marking stable (855501109, 19696300)->(934890300, -59692891)
[    0.876403] registered taskstats version 1
[    0.876928] Loading compiled-in X.509 certificates
[    0.877333] Btrfs loaded, crc32c=crc32c-generic, zoned=no, fsverity=no
[    0.882685] Freeing unused kernel image (initmem) memory: 1536K
[    0.918057] Write protecting the kernel read-only data: 24576k
[    0.918975] Freeing unused kernel image (text/rodata gap) memory: 2028K
[    0.919393] Freeing unused kernel image (rodata/data gap) memory: 144K
[    0.919654] Run /init as init process
[    0.919798]   with arguments:
[    0.919940]     /init
[    0.920047]   with environment:
[    0.920190]     HOME=/
[    0.920286]     TERM=linux
[    0.922620] scsi 0:0:0:0: Direct-Access     Msft     Virtual Disk     1.0  PQ: 0 ANSI: 5
[    0.923252] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    0.923893] sd 0:0:0:0: [sda] 641944 512-byte logical blocks: (329 MB/313 MiB)
[    0.924490] sd 0:0:0:0: [sda] Write Protect is on
[    0.924760] sd 0:0:0:0: [sda] Mode Sense: 0f 00 80 00
[    0.925199] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    1.538410] EXT4-fs (sda): mounted filesystem without journal. Quota mode: none.
[    1.640080] hv_pci 88309164-1127-4233-9560-6e0cad455d8f: PCI VMBus probing: Using version 0x10004
[    1.642187] hv_pci 88309164-1127-4233-9560-6e0cad455d8f: PCI host bridge to bus 1127:00
[    1.642548] pci_bus 1127:00: root bus resource [mem 0xa00000000-0xc00001fff window]
[    1.642895] pci_bus 1127:00: No busn resource found for root bus, will use [bus 00-ff]
[    1.644287] pci 1127:00:00.0: [1af4:105a] type 00 class 0x088000
[    1.647194] pci 1127:00:00.0: reg 0x10: [mem 0xc00000000-0xc00000fff 64bit]
[    1.649501] pci 1127:00:00.0: reg 0x18: [mem 0xc00001000-0xc00001fff 64bit]
[    1.651514] pci 1127:00:00.0: reg 0x20: [mem 0xa00000000-0xbffffffff 64bit]
[    1.656603] pci_bus 1127:00: busn_res: [bus 00-ff] end is updated to 00
[    1.656902] pci 1127:00:00.0: BAR 4: assigned [mem 0xa00000000-0xbffffffff 64bit]
[    1.658754] pci 1127:00:00.0: BAR 0: assigned [mem 0xc00000000-0xc00000fff 64bit]
[    1.660797] pci 1127:00:00.0: BAR 2: assigned [mem 0xc00001000-0xc00001fff 64bit]
[    1.676734] virtiofs virtio2: Cache len: 0x200000000 @ 0xa00000000
[    1.687964] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x6d8cbf8869f, max_idle_ns: 881590921691 ns
[    1.688537] clocksource: Switched to clocksource tsc
[    1.718131] sd 0:0:0:0: [sda] Attached SCSI disk
[    1.737024] memmap_init_zone_device initialised 2097152 pages in 10ms
[    1.738457] WSL2: SetEphemeralPortRange is a no-op : range (0, 0)
[    1.847973] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[    2.418129] scsi 0:0:0:1: Direct-Access     Msft     Virtual Disk     1.0  PQ: 0 ANSI: 5
[    2.418887] sd 0:0:0:1: Attached scsi generic sg1 type 0
[    2.419446] scsi 0:0:0:2: Direct-Access     Msft     Virtual Disk     1.0  PQ: 0 ANSI: 5
[    2.419498] sd 0:0:0:1: [sdb] 2097160 512-byte logical blocks: (1.07 GB/1.00 GiB)
[    2.420146] sd 0:0:0:2: Attached scsi generic sg2 type 0
[    2.420236] sd 0:0:0:1: [sdb] 4096-byte physical blocks
[    2.420789] sd 0:0:0:2: [sdc] 536870912 512-byte logical blocks: (275 GB/256 GiB)
[    2.420849] sd 0:0:0:1: [sdb] Write Protect is off
[    2.421225] sd 0:0:0:2: [sdc] 4096-byte physical blocks
[    2.421541] sd 0:0:0:1: [sdb] Mode Sense: 0f 00 00 00
[    2.421888] sd 0:0:0:2: [sdc] Write Protect is off
[    2.422260] sd 0:0:0:1: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    2.422392] sd 0:0:0:2: [sdc] Mode Sense: 0f 00 00 00
[    2.423302] sd 0:0:0:2: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    2.424840] sd 0:0:0:1: [sdb] Attached SCSI disk
[    2.426063] sd 0:0:0:2: [sdc] Attached SCSI disk
[    2.444484] EXT4-fs (sdc): recovery complete
[    2.445457] EXT4-fs (sdc): mounted filesystem with ordered data mode. Quota mode: none.
[    2.459372] Adding 1048576k swap on /dev/sdb.  Priority:-2 extents:1 across:1048576k 
[    2.649008] hv_pci aed388e8-de3a-45a5-bb0c-ee534e806689: PCI VMBus probing: Using version 0x10004
[    2.650439] hv_pci aed388e8-de3a-45a5-bb0c-ee534e806689: PCI host bridge to bus de3a:00
[    2.650756] pci_bus de3a:00: root bus resource [mem 0x9ffe08000-0x9ffe0afff window]
[    2.651045] pci_bus de3a:00: No busn resource found for root bus, will use [bus 00-ff]
[    2.652320] pci de3a:00:00.0: [1af4:1049] type 00 class 0x010000
[    2.653496] pci de3a:00:00.0: reg 0x10: [mem 0x9ffe08000-0x9ffe08fff 64bit]
[    2.654363] pci de3a:00:00.0: reg 0x18: [mem 0x9ffe09000-0x9ffe09fff 64bit]
[    2.655227] pci de3a:00:00.0: reg 0x20: [mem 0x9ffe0a000-0x9ffe0afff 64bit]
[    2.659234] pci_bus de3a:00: busn_res: [bus 00-ff] end is updated to 00
[    2.659501] pci de3a:00:00.0: BAR 0: assigned [mem 0x9ffe08000-0x9ffe08fff 64bit]
[    2.660251] pci de3a:00:00.0: BAR 2: assigned [mem 0x9ffe09000-0x9ffe09fff 64bit]
[    2.660989] pci de3a:00:00.0: BAR 4: assigned [mem 0x9ffe0a000-0x9ffe0afff 64bit]
[    2.663932] 9pnet_virtio: no channels available for device drvfs
[    2.664237] init: (1) WARNING: mount: waiting for virtio device...
[    2.770766] hv_pci 81d9a8d7-9fce-46b7-9ff9-b146da3089e4: PCI VMBus probing: Using version 0x10004
[    2.772061] hv_pci 81d9a8d7-9fce-46b7-9ff9-b146da3089e4: PCI host bridge to bus 9fce:00
[    2.772372] pci_bus 9fce:00: root bus resource [mem 0x9ffe0c000-0x9ffe0efff window]
[    2.772664] pci_bus 9fce:00: No busn resource found for root bus, will use [bus 00-ff]
[    2.773910] pci 9fce:00:00.0: [1af4:1049] type 00 class 0x010000
[    2.775050] pci 9fce:00:00.0: reg 0x10: [mem 0x9ffe0c000-0x9ffe0cfff 64bit]
[    2.775911] pci 9fce:00:00.0: reg 0x18: [mem 0x9ffe0d000-0x9ffe0dfff 64bit]
[    2.776761] pci 9fce:00:00.0: reg 0x20: [mem 0x9ffe0e000-0x9ffe0efff 64bit]
[    2.780694] pci_bus 9fce:00: busn_res: [bus 00-ff] end is updated to 00
[    2.780986] pci 9fce:00:00.0: BAR 0: assigned [mem 0x9ffe0c000-0x9ffe0cfff 64bit]
[    2.781703] pci 9fce:00:00.0: BAR 2: assigned [mem 0x9ffe0d000-0x9ffe0dfff 64bit]
[    2.781986] 9pnet_virtio: no channels available for device drvfs
[    2.782311] init: (1) WARNING: mount: waiting for virtio device...
[    2.782471] pci 9fce:00:00.0: BAR 4: assigned [mem 0x9ffe0e000-0x9ffe0efff 64bit]
[    2.898491] hv_pci 86858b54-a9ff-42c1-85be-12646bde6957: PCI VMBus probing: Using version 0x10004
[    2.899831] hv_pci 86858b54-a9ff-42c1-85be-12646bde6957: PCI host bridge to bus a9ff:00
[    2.900148] pci_bus a9ff:00: root bus resource [mem 0x9ffe10000-0x9ffe12fff window]
[    2.900437] pci_bus a9ff:00: No busn resource found for root bus, will use [bus 00-ff]
[    2.901684] pci a9ff:00:00.0: [1af4:1049] type 00 class 0x010000
[    2.902856] pci a9ff:00:00.0: reg 0x10: [mem 0x9ffe10000-0x9ffe10fff 64bit]
[    2.903716] pci a9ff:00:00.0: reg 0x18: [mem 0x9ffe11000-0x9ffe11fff 64bit]
[    2.904609] pci a9ff:00:00.0: reg 0x20: [mem 0x9ffe12000-0x9ffe12fff 64bit]
[    2.908519] pci_bus a9ff:00: busn_res: [bus 00-ff] end is updated to 00
[    2.908842] pci a9ff:00:00.0: BAR 0: assigned [mem 0x9ffe10000-0x9ffe10fff 64bit]
[    2.909600] pci a9ff:00:00.0: BAR 2: assigned [mem 0x9ffe11000-0x9ffe11fff 64bit]
[    2.910335] pci a9ff:00:00.0: BAR 4: assigned [mem 0x9ffe12000-0x9ffe12fff 64bit]
[    3.009967] hv_pci 14a6c250-2f5e-4544-972d-e4af992a128a: PCI VMBus probing: Using version 0x10004
[    3.011462] hv_pci 14a6c250-2f5e-4544-972d-e4af992a128a: PCI host bridge to bus 2f5e:00
[    3.011804] pci_bus 2f5e:00: root bus resource [mem 0x9ffe14000-0x9ffe16fff window]
[    3.012172] pci_bus 2f5e:00: No busn resource found for root bus, will use [bus 00-ff]
[    3.013562] pci 2f5e:00:00.0: [1af4:1049] type 00 class 0x010000
[    3.014756] pci 2f5e:00:00.0: reg 0x10: [mem 0x9ffe14000-0x9ffe14fff 64bit]
[    3.015633] pci 2f5e:00:00.0: reg 0x18: [mem 0x9ffe15000-0x9ffe15fff 64bit]
[    3.016516] pci 2f5e:00:00.0: reg 0x20: [mem 0x9ffe16000-0x9ffe16fff 64bit]
[    3.020834] pci_bus 2f5e:00: busn_res: [bus 00-ff] end is updated to 00
[    3.021157] pci 2f5e:00:00.0: BAR 0: assigned [mem 0x9ffe14000-0x9ffe14fff 64bit]
[    3.022095] pci 2f5e:00:00.0: BAR 2: assigned [mem 0x9ffe15000-0x9ffe15fff 64bit]
[    3.022867] pci 2f5e:00:00.0: BAR 4: assigned [mem 0x9ffe16000-0x9ffe16fff 64bit]
[    3.030227] 9pnet_virtio: no channels available for device drvfs
[    3.030578] init: (1) WARNING: mount: waiting for virtio device...
[    3.143192] hv_pci ed843176-e057-48d4-ab94-623a027b1629: PCI VMBus probing: Using version 0x10004
[    3.144600] hv_pci ed843176-e057-48d4-ab94-623a027b1629: PCI host bridge to bus e057:00
[    3.144927] pci_bus e057:00: root bus resource [mem 0x9ffe18000-0x9ffe1afff window]
[    3.145222] pci_bus e057:00: No busn resource found for root bus, will use [bus 00-ff]
[    3.146529] pci e057:00:00.0: [1af4:1049] type 00 class 0x010000
[    3.147766] pci e057:00:00.0: reg 0x10: [mem 0x9ffe18000-0x9ffe18fff 64bit]
[    3.148685] pci e057:00:00.0: reg 0x18: [mem 0x9ffe19000-0x9ffe19fff 64bit]
[    3.149556] pci e057:00:00.0: reg 0x20: [mem 0x9ffe1a000-0x9ffe1afff 64bit]
[    3.153686] pci_bus e057:00: busn_res: [bus 00-ff] end is updated to 00
[    3.154060] pci e057:00:00.0: BAR 0: assigned [mem 0x9ffe18000-0x9ffe18fff 64bit]
[    3.154855] pci e057:00:00.0: BAR 2: assigned [mem 0x9ffe19000-0x9ffe19fff 64bit]
[    3.155592] pci e057:00:00.0: BAR 4: assigned [mem 0x9ffe1a000-0x9ffe1afff 64bit]
[    3.188714] hv_pci c963c476-4546-43da-a32c-7e4ddeb55d93: PCI VMBus probing: Using version 0x10004
[    3.190328] hv_pci c963c476-4546-43da-a32c-7e4ddeb55d93: PCI host bridge to bus 4546:00
[    3.190732] pci_bus 4546:00: root bus resource [mem 0x9ffe1c000-0x9ffe1efff window]
[    3.191104] pci_bus 4546:00: No busn resource found for root bus, will use [bus 00-ff]
[    3.192578] pci 4546:00:00.0: [1af4:1049] type 00 class 0x010000
[    3.193870] pci 4546:00:00.0: reg 0x10: [mem 0x9ffe1c000-0x9ffe1cfff 64bit]
[    3.194935] pci 4546:00:00.0: reg 0x18: [mem 0x9ffe1d000-0x9ffe1dfff 64bit]
[    3.196022] pci 4546:00:00.0: reg 0x20: [mem 0x9ffe1e000-0x9ffe1efff 64bit]
[    3.200503] pci_bus 4546:00: busn_res: [bus 00-ff] end is updated to 00
[    3.200855] pci 4546:00:00.0: BAR 0: assigned [mem 0x9ffe1c000-0x9ffe1cfff 64bit]
[    3.201736] pci 4546:00:00.0: BAR 2: assigned [mem 0x9ffe1d000-0x9ffe1dfff 64bit]
[    3.202501] pci 4546:00:00.0: BAR 4: assigned [mem 0x9ffe1e000-0x9ffe1efff 64bit]
[   49.723721] hv_balloon: Max. dynamic memory size: 16384 MB

--euROFU3ViQK6AW7w--
