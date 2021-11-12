Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0FD44E416
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Nov 2021 10:41:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HrDB14vXTz305W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Nov 2021 20:41:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=T1g983n/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=T1g983n/; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HrD9B0pdCz2xtf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Nov 2021 20:40:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636710033;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=XSgxABbbj87iIeHCPEI+4Mx6YjZHKFaw6u80pq5XpUU=;
 b=T1g983n/TwHPMQGjZzOmpYokzL2ta2iVy0fHrRXFVWQVylPP4ZY4aZASfUb/bRIyAD
 DfllQ7nUbgDs5uNWcQ2Vzwz+Vi9CpgKghQQbowwRnCKUEKeqST0iE3iseUJRIm7dHC/c
 bN2IRa18JnV8x2WqR5N8NxEd4xmNQ7QspxFeKKlM8i+jMyKOv4rGJv7GknePcwv3H9Wd
 gFF23HCAjfJ/ruUDuN0QaoLaMY+IuUgKXREa1g40Wyd38eF+S8aAM42uO/fUCKyxqBUt
 0jF0Gc4dAN4bE3YPXh54c5iyBsPyLhgZp1+YcQ24FpDlt7vozWJt/kNwTVuE725jcAR6
 StQA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgGI+hs5tAvjn+88DfkT7ELd1ArCg=="
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:89c0:ebfc:e52a:1ea0:c574:c7ab]
 by smtp.strato.de (RZmta 47.34.5 AUTH)
 with ESMTPSA id N03801xAC9eUSMB
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 12 Nov 2021 10:40:30 +0100 (CET)
Message-ID: <c95c9b58-347e-d159-3a82-bf5f9dbf91ac@xenosoft.de>
Date: Fri, 12 Nov 2021 10:40:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PASEMI] Nemo board doesn't recognize any ATA disks with the
 pci-v5.16 updates
Content-Language: de-DE
To: Marc Zyngier <maz@kernel.org>
References: <3eedbe78-1fbd-4763-a7f3-ac5665e76a4a@xenosoft.de>
 <15731ad7-83ff-c7ef-e4a1-8b11814572c2@xenosoft.de>
 <17e37b22-5839-0e3a-0dbf-9c676adb0dec@xenosoft.de>
 <3b210c92-4be6-ce49-7512-bb194475eeab@xenosoft.de>
 <78308692-02e6-9544-4035-3171a8e1e6d4@xenosoft.de>
 <87mtma8udh.wl-maz@kernel.org>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <87mtma8udh.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: axboe@kernel.dk, Rob Herring <robh@kernel.org>, lorenzo.pieralisi@arm.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Arnd Bergmann <arnd@arndb.de>, kw@linux.com,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 damien.lemoal@opensource.wdc.com, Olof Johansson <olof@lixom.net>,
 Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>,
 "bhelgaas@google.com >> Bjorn Helgaas" <bhelgaas@google.com>,
 robert@swiecki.net, Matthew Leaman <matthew@a-eon.biz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11 November 2021 at 06:39 pm, Marc Zyngier wrote:
> On Wed, 10 Nov 2021 18:07:24 +0000,
> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>> On 09 November 2021 at 03:45 pm, Christian Zigotzky wrote:
>>> Hello,
>>>
>>> The Nemo board [1] doesn't recognize any ATA disks with the
>> pci-v5.16 updates [2].
>>> Error messages:
>>>
>>> ata4.00: gc timeout cmd 0xec
>>> ata4.00: failed to IDENTIFY (I/O error, error_mask=0x4)
>>> ata1.00: gc timeout cmd 0xec
>>> ata1.00: failed to IDENTIFY (I/O error, error_mask=0x4)
>>> ata3.00: gc timeout cmd 0xec
>>> ata3.00: failed to IDENTIFY (I/O error, error_mask=0x4)
>>>
>>> I was able to revert the new pci-v5.16 updates [2]. After a new
>> compiling, the kernel recognize all ATA disks correctly.
>>> Could you please check the pci-v5.16 updates [2]?
>>>
>>> Please find attached the kernel config.
>>>
>>> Thanks,
>>> Christian
>>>
>>> [1] https://en.wikipedia.org/wiki/AmigaOne_X1000
>>> [2]
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0c5c62ddf88c34bc83b66e4ac9beb2bb0e1887d4
>>
>> Hi All,
>>
>> Many thanks for your nice responses.
>>
>> I bisected today [1]. 0412841812265734c306ba5ef8088bcb64d5d3bd
>> (of/irq: Allow matching of an interrupt-map local to an interrupt
>> controller) [2] is the first bad commit.
> Can you please give the following hack a go and post the result
> (including the full dmesg)?
>
> Thanks,
>
> 	M.
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 32be5a03951f..8cf0cc9b7caf 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -156,14 +156,15 @@ int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq)
>   
>   	/* Now start the actual "proper" walk of the interrupt tree */
>   	while (ipar != NULL) {
> +		bool intc = of_property_read_bool(ipar, "interrupt-controller");
> +
>   		/*
>   		 * Now check if cursor is an interrupt-controller and
>   		 * if it is then we are done, unless there is an
>   		 * interrupt-map which takes precedence.
>   		 */
>   		imap = of_get_property(ipar, "interrupt-map", &imaplen);
> -		if (imap == NULL &&
> -		    of_property_read_bool(ipar, "interrupt-controller")) {
> +		if (imap == NULL && intc) {
>   			pr_debug(" -> got it !\n");
>   			return 0;
>   		}
> @@ -244,8 +245,14 @@ int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq)
>   
>   			pr_debug(" -> imaplen=%d\n", imaplen);
>   		}
> -		if (!match)
> +		if (!match) {
> +			if (intc) {
> +				pr_info("%pOF interrupt-map failed, using interrupt-controller\n", ipar);
> +				return 0;
> +			}
> +
>   			goto fail;
> +		}
>   
>   		/*
>   		 * Successfully parsed an interrrupt-map translation; copy new
>
The detecting of the ATA disks works with this patch! Well done! Thanks 
a lot!

dmesg:

[    0.000000] hash-mmu: Page sizes from device-tree:
[    0.000000] hash-mmu: base_shift=12: shift=12, sllp=0x0000, 
avpnm=0x00000000, tlbiel=1, penc=0
[    0.000000] hash-mmu: base_shift=16: shift=16, sllp=0x0110, 
avpnm=0x00000000, tlbiel=1, penc=3
[    0.000000] hash-mmu: base_shift=20: shift=20, sllp=0x0030, 
avpnm=0x00000000, tlbiel=0, penc=31
[    0.000000] hash-mmu: base_shift=24: shift=24, sllp=0x0100, 
avpnm=0x00000001, tlbiel=0, penc=0
[    0.000000] Page orders: linear mapping = 24, virtual = 12, io = 12, 
vmemmap = 24
[    0.000000] Using 1TB segments
[    0.000000] hash-mmu: Initializing hash mmu with SLB
[    0.000000] Linux version 
5.16.0-a6_A-EON_X1000_Nemo-12267-gdebe436e77c7-dirty 
(christian@cc-build-machine.a-eon.tld) (powerpc-linux-gnu-gcc (Ubuntu 
7.5.0-3ubuntu1~18.04) 7.5.0, GNU ld (GNU Binutils for Ubuntu) 2.30) #1 
SMP Fri Nov 12 09:30:39 CET 2021
[    0.000000] IOBMAP L2 allocated at: (____ptrval____)
[    0.000000] ioremap() called early from 
.iommu_init_early_pasemi+0x10c/0x244. Use early_ioremap() instead
[    0.000000] Using A-EON Amigaone X1000 machine description
[    0.000000] Found legacy serial port 0 for /pxp@0,e0000000/serial@1d
[    0.000000]   port=7f03f8, taddr=fcff03f8, irq=0, clk=133333333, 
speed=115200
[    0.000000] Found legacy serial port 1 for /pxp@0,e0000000/serial@1d,1
[    0.000000]   port=7f02f8, taddr=fcff02f8, irq=0, clk=133333333, 
speed=115200
[    0.000000] CPU maps initialized for 1 thread per core
[    0.000000]  (thread shift is 0)
[    0.000000] Allocated 2320 bytes for 2 pacas
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0x200000000
[    0.000000] dcache_bsize      = 0x40
[    0.000000] icache_bsize      = 0x40
[    0.000000] cpu_features      = 0x0000010000401182
[    0.000000]   possible        = 0x000ffbebffffb18f
[    0.000000]   always          = 0x0000000000000180
[    0.000000] cpu_user_features = 0xdc000802 0x00000000
[    0.000000] mmu_features      = 0x6e000001
[    0.000000] firmware_features = 0x0000000000000000
[    0.000000] vmalloc start     = 0xc0003d0000000000
[    0.000000] IO start          = 0xc0003e0000000000
[    0.000000] vmemmap start     = 0xc0003f0000000000
[    0.000000] hash-mmu: ppc64_pft_size    = 0x0
[    0.000000] hash-mmu: htab_hash_mask    = 0xfffff
[    0.000000] -----------------------------------------------------
[    0.000000] ioremap() called early from .pas_setup_arch+0x3c/0x58. 
Use early_ioremap() instead
[    0.000000] barrier-nospec: using ORI speculation barrier
[    0.000000] barrier-nospec: patched 413 locations
[    0.000000] Top of RAM: 0x280000000, Total RAM: 0x200000000
[    0.000000] Memory hole size: 2048MB
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x000000027fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000007fffffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x000000027fffffff]
[    0.000000] Initmem setup node 0 [mem 
0x0000000000000000-0x000000027fffffff]
[    0.000000] percpu: Embedded 25 pages/cpu s64152 r0 d38248 u524288
[    0.000000] pcpu-alloc: s64152 r0 d38248 u524288 alloc=1*1048576
[    0.000000] pcpu-alloc: [0] 0 1
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 
2068480
[    0.000000] Kernel command line: root=/dev/sdb4
[    0.000000] Dentry cache hash table entries: 1048576 (order: 11, 
8388608 bytes, linear)
[    0.000000] Inode-cache hash table entries: 524288 (order: 10, 
4194304 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 8067920K/8388608K available (19672K kernel code, 
2856K rwdata, 7752K rodata, 7428K init, 678K bss, 320688K reserved, 0K 
cma-reserved)
[    0.000000] ftrace: allocating 45669 entries in 269 pages
[    0.000000] ftrace: allocated 268 pages with 3 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000]     Rude variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay 
is 100 jiffies.
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] mpic: Setting up MPIC "PASEMI-OPIC" version 1.3 at 
fc000000, max 2 CPUs
[    0.000000] mpic: ISU size: 1024, shift: 10, mask: 3ff
[    0.000000] mpic: Initializing for 1024 sources
[    0.000000] random: get_random_u64 called from 
.start_kernel+0x970/0xbc4 with crng_init=0
[    0.000000] time_init: decrementer frequency = 66.666666 MHz
[    0.000000] time_init: processor frequency   = 1800.000000 MHz
[    0.000001] clocksource: timebase: mask: 0xffffffffffffffff 
max_cycles: 0xf6018975a, max_idle_ns: 440795204712 ns
[    0.000009] clocksource: timebase mult[f000003] shift[24] registered
[    0.000019] clockevent: decrementer mult[1111110e] shift[32] cpu[0]
[    0.000241] Console: colour dummy device 80x25
[    0.000443] printk: console [tty0] enabled
[    0.000461] pid_max: default: 32768 minimum: 301
[    0.000581] Mount-cache hash table entries: 16384 (order: 5, 131072 
bytes, linear)
[    0.000625] Mountpoint-cache hash table entries: 16384 (order: 5, 
131072 bytes, linear)
[    0.001129] mpic: requesting IPIs...
[    0.001498] rcu: Hierarchical SRCU implementation.
[    0.001678] smp: Bringing up secondary CPUs ...
[    0.002118] smp: Brought up 1 node, 2 CPUs
[    0.002533] devtmpfs: initialized
[    0.005905] Found PA-PXP PCI host bridge.
[    0.005916] PCI host bridge /pxp@0,e0000000 (primary) ranges:
[    0.005946]   IO 0x00000000fc800000..0x00000000fcffffff -> 
0x0000000000000000
[    0.005962]  MEM 0x0000000080000000..0x00000000e00fffff -> 
0x0000000080000000
[    0.005975]  MEM 0x00000000fd800000..0x00000000fd800fff -> 
0x00000000fd800000
[    0.005986]  MEM 0x0000080000000000..0x00000bffffffffff -> 
0x0000080000000000
[    0.006000] no ISA IO ranges or unexpected isa range, mapping 64k
[    0.006010] ISA bridge (early) is /pxp@0,e0000000/io-bridge@0
[    0.006158] i8259 legacy interrupt controller initialized
[    0.006224] clocksource: jiffies: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.006242] futex hash table entries: 512 (order: 4, 65536 bytes, linear)
[    0.006501] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.006967] thermal_sys: Registered thermal governor 'step_wise'
[    0.007372] PCI: Probing PCI hardware
[    0.008645] PCI host bridge to bus 0000:00
[    0.008660] pci_bus 0000:00: root bus resource [io 0x10000-0x80ffff] 
(bus address [0x0000-0x7fffff])
[    0.008674] pci_bus 0000:00: root bus resource [mem 
0x80000000-0xe00fffff]
[    0.008684] pci_bus 0000:00: root bus resource [mem 
0xfd800000-0xfd800fff]
[    0.008693] pci_bus 0000:00: root bus resource [mem 
0x80000000000-0xbffffffffff]
[    0.008703] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.008713] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
[    0.008744] NEMO SB600 IOB base e0000000
[    0.008778] pci 0000:00:00.0: [1959:a001] type 00 class 0x060000
[    0.008883] ISA bridge PCI attached: 0000:00:00.0
[    0.008955] pci 0000:00:01.0: [1959:a009] type 00 class 0x058000
[    0.009146] pci 0000:00:03.0: [1959:a00c] type 00 class 0x080080
[    0.009313] pci 0000:00:04.0: [1959:a00a] type 00 class 0x050000
[    0.009478] pci 0000:00:05.0: [1959:a00a] type 00 class 0x050000
[    0.009690] pci 0000:00:08.0: [1959:a000] type 00 class 0x0b2000
[    0.009844] pci 0000:00:09.0: [1959:a000] type 00 class 0x0b2000
[    0.010145] pci 0000:00:10.0: [1959:a002] type 01 class 0x060400
[    0.010189] pci 0000:00:10.0: enabling Extended Tags
[    0.010232] pci 0000:00:10.0: PME# supported from D0 D3hot D3cold
[    0.010370] pci 0000:00:10.1: [1959:a002] type 01 class 0x060400
[    0.010404] pci 0000:00:10.1: enabling Extended Tags
[    0.010444] pci 0000:00:10.1: PME# supported from D0 D3hot D3cold
[    0.010561] pci 0000:00:10.2: [1959:a002] type 01 class 0x060400
[    0.010595] pci 0000:00:10.2: enabling Extended Tags
[    0.010635] pci 0000:00:10.2: PME# supported from D0 D3hot D3cold
[    0.010749] pci 0000:00:10.3: [1959:a002] type 01 class 0x060400
[    0.010783] pci 0000:00:10.3: enabling Extended Tags
[    0.010822] pci 0000:00:10.3: PME# supported from D0 D3hot D3cold
[    0.010972] pci 0000:00:11.0: [1959:a002] type 01 class 0x060400
[    0.011008] pci 0000:00:11.0: enabling Extended Tags
[    0.011047] pci 0000:00:11.0: PME# supported from D0 D3hot D3cold
[    0.011201] pci 0000:00:11.1: [1959:a002] type 01 class 0x060400
[    0.011236] pci 0000:00:11.1: enabling Extended Tags
[    0.011276] pci 0000:00:11.1: PME# supported from D0 D3hot D3cold
[    0.011396] pci 0000:00:11.2: [1959:a002] type 01 class 0x060400
[    0.011430] pci 0000:00:11.2: enabling Extended Tags
[    0.011470] pci 0000:00:11.2: PME# supported from D0 D3hot D3cold
[    0.011586] pci 0000:00:11.3: [1959:a002] type 01 class 0x060400
[    0.011620] pci 0000:00:11.3: enabling Extended Tags
[    0.011660] pci 0000:00:11.3: PME# supported from D0 D3hot D3cold
[    0.011857] pci 0000:00:14.0: [1959:a005] type 00 class 0x020000
[    0.011981] pci 0000:00:14.1: [1959:a005] type 00 class 0x020000
[    0.012105] pci 0000:00:14.2: [1959:a005] type 00 class 0x020000
[    0.012227] pci 0000:00:14.3: [1959:a005] type 00 class 0x020000
[    0.012394] pci 0000:00:15.0: [1959:a006] type 00 class 0x020000
[    0.012527] pci 0000:00:15.1: [1959:a006] type 00 class 0x020000
[    0.012776] pci 0000:00:1a.0: [1959:a007] type 00 class 0x0801ff
[    0.012942] pci 0000:00:1b.0: [1959:a00b] type 00 class 0x088000
[    0.013101] pci 0000:00:1c.0: [1959:a003] type 00 class 0x0c0500
[    0.013123] pci 0000:00:1c.0: reg 0x10: [io  0x800200-0x80023f]
[    0.013253] pci 0000:00:1c.1: [1959:a003] type 00 class 0x0c0500
[    0.013274] pci 0000:00:1c.1: reg 0x10: [io  0x800240-0x80027f]
[    0.013394] pci 0000:00:1c.2: [1959:a003] type 00 class 0x0c0500
[    0.013415] pci 0000:00:1c.2: reg 0x10: [io  0x800280-0x8002bf]
[    0.013568] pci 0000:00:1d.0: [1959:a004] type 00 class 0x070003
[    0.013590] pci 0000:00:1d.0: reg 0x10: [io  0x8003f8-0x8003ff]
[    0.013708] pci 0000:00:1d.1: [1959:a004] type 00 class 0x070003
[    0.013728] pci 0000:00:1d.1: reg 0x10: [io  0x8002f8-0x8002ff]
[    0.013895] pci 0000:00:1e.0: [1959:a008] type 00 class 0x0601ff
[    0.013916] pci 0000:00:1e.0: reg 0x10: [io  0x800400-0x8004ff]
[    0.013929] pci 0000:00:1e.0: reg 0x14: [io  0x800500-0x8005ff]
[    0.056717] IOMMU table initialized, virtual merging enabled
[    0.056849] pci 0000:01:00.0: [1002:6718] type 00 class 0x030000
[    0.056875] pci 0000:01:00.0: reg 0x10: [mem 0x90000000-0x9fffffff 
64bit pref]
[    0.056894] pci 0000:01:00.0: reg 0x18: [mem 0xa0020000-0xa003ffff 64bit]
[    0.056908] pci 0000:01:00.0: reg 0x20: [io  0x12000-0x120ff]
[    0.056926] pci 0000:01:00.0: reg 0x30: [mem 0xa0000000-0xa001ffff pref]
[    0.056942] pci 0000:01:00.0: enabling Extended Tags
[    0.056989] pci 0000:01:00.0: supports D1 D2
[    0.057135] pci 0000:01:00.1: [1002:aa80] type 00 class 0x040300
[    0.057159] pci 0000:01:00.1: reg 0x10: [mem 0xa0040000-0xa0043fff 64bit]
[    0.057196] pci 0000:01:00.1: enabling Extended Tags
[    0.057240] pci 0000:01:00.1: supports D1 D2
[    0.061218] pci 0000:00:10.0: PCI bridge to [bus 01]
[    0.061235] pci 0000:00:10.0:   bridge window [io 0x12000-0x12fff]
[    0.061245] pci 0000:00:10.0:   bridge window [mem 0x90000000-0xa00fffff]
[    0.062093] pci 0000:00:10.1: PCI bridge to [bus 02]
[    0.062939] pci 0000:00:10.2: PCI bridge to [bus 03]
[    0.063783] pci 0000:00:10.3: PCI bridge to [bus 04]
[    0.064331] pci 0000:05:12.0: [1002:4380] type 00 class 0x01018f
[    0.064359] pci 0000:05:12.0: reg 0x10: [io  0x11040-0x11047]
[    0.064376] pci 0000:05:12.0: reg 0x14: [io  0x1105c-0x1105f]
[    0.064392] pci 0000:05:12.0: reg 0x18: [io  0x11048-0x1104f]
[    0.064408] pci 0000:05:12.0: reg 0x1c: [io  0x11058-0x1105b]
[    0.064431] pci 0000:05:12.0: reg 0x20: [io  0x11010-0x1101f]
[    0.064448] pci 0000:05:12.0: reg 0x24: [mem 0xa0209000-0xa02093ff]
[    0.064478] pci 0000:05:12.0: set SATA to AHCI mode
[    0.064653] pci 0000:05:13.0: [1002:4387] type 00 class 0x0c0310
[    0.064681] pci 0000:05:13.0: reg 0x10: [mem 0xa0207000-0xa0207fff]
[    0.064836] pci 0000:05:13.1: [1002:4388] type 00 class 0x0c0310
[    0.064863] pci 0000:05:13.1: reg 0x10: [mem 0xa0208000-0xa0208fff]
[    0.065019] pci 0000:05:13.2: [1002:4389] type 00 class 0x0c0310
[    0.065047] pci 0000:05:13.2: reg 0x10: [mem 0xa0206000-0xa0206fff]
[    0.065203] pci 0000:05:13.3: [1002:438a] type 00 class 0x0c0310
[    0.065230] pci 0000:05:13.3: reg 0x10: [mem 0xa0205000-0xa0205fff]
[    0.065384] pci 0000:05:13.4: [1002:438b] type 00 class 0x0c0310
[    0.065411] pci 0000:05:13.4: reg 0x10: [mem 0xa0204000-0xa0204fff]
[    0.065582] pci 0000:05:13.5: [1002:4386] type 00 class 0x0c0320
[    0.065610] pci 0000:05:13.5: reg 0x10: [mem 0xa0209800-0xa02098ff]
[    0.065698] pci 0000:05:13.5: supports D1 D2
[    0.065706] pci 0000:05:13.5: PME# supported from D0 D1 D2 D3hot
[    0.065851] pci 0000:05:14.0: [1002:4385] type 00 class 0x0c0500
[    0.065877] pci 0000:05:14.0: reg 0x10: [io  0x11020-0x1102f]
[    0.065894] pci 0000:05:14.0: reg 0x14: [mem 0xa0209400-0xa02097ff]
[    0.066051] pci 0000:05:14.1: [1002:438c] type 00 class 0x010183
[    0.066078] pci 0000:05:14.1: reg 0x10: [io  0x11030-0x11037]
[    0.066094] pci 0000:05:14.1: reg 0x14: [io  0x11054-0x11057]
[    0.066110] pci 0000:05:14.1: reg 0x18: [io  0x11038-0x1103f]
[    0.066126] pci 0000:05:14.1: reg 0x1c: [io  0x11050-0x11053]
[    0.066142] pci 0000:05:14.1: reg 0x20: [io  0x11000-0x1100f]
[    0.066169] pci 0000:05:14.1: legacy IDE quirk: reg 0x18: [io 
0x10170-0x10177]
[    0.066178] pci 0000:05:14.1: legacy IDE quirk: reg 0x1c: [io 0x10376]
[    0.066293] pci 0000:05:14.2: [1002:4383] type 00 class 0x040300
[    0.066325] pci 0000:05:14.2: reg 0x10: [mem 0xa0200000-0xa0203fff 64bit]
[    0.066401] pci 0000:05:14.2: PME# supported from D0 D3hot D3cold
[    0.066523] pci 0000:05:14.3: [1002:438d] type 00 class 0x060100
[    0.066698] pci 0000:05:14.4: [1002:4384] type 01 class 0x060400
[    0.067143] pci 0000:00:11.0: PCI bridge to [bus 05-06]
[    0.067159] pci 0000:00:11.0:   bridge window [io 0x10000-0x13fff]
[    0.067169] pci 0000:00:11.0:   bridge window [mem 0xa0100000-0xa03fffff]
[    0.067196] pci_bus 0000:06: extended config space not accessible
[    0.067391] pci 0000:06:05.0: [10ec:8139] type 00 class 0x020000
[    0.067424] pci 0000:06:05.0: reg 0x10: [io  0x13000-0x130ff]
[    0.067450] pci 0000:06:05.0: reg 0x14: [mem 0xa0312000-0xa03120ff]
[    0.067510] pci 0000:06:05.0: reg 0x30: [mem 0xa0300000-0xa030ffff pref]
[    0.067558] pci 0000:06:05.0: supports D1 D2
[    0.067565] pci 0000:06:05.0: PME# supported from D1 D2 D3hot
[    0.067710] pci 0000:06:06.0: [109e:036e] type 00 class 0x040000
[    0.067743] pci 0000:06:06.0: reg 0x10: [mem 0xa0310000-0xa0310fff pref]
[    0.067965] pci 0000:06:06.1: [109e:0878] type 00 class 0x048000
[    0.067997] pci 0000:06:06.1: reg 0x10: [mem 0xa0311000-0xa0311fff pref]
[    0.068871] pci 0000:05:14.4: PCI bridge to [bus 06]
[    0.068886] pci 0000:05:14.4:   bridge window [io 0x13000-0x13fff]
[    0.068898] pci 0000:05:14.4:   bridge window [mem 0xa0300000-0xa03fffff]
[    0.069751] pci 0000:00:11.1: PCI bridge to [bus 07]
[    0.070598] pci 0000:00:11.2: PCI bridge to [bus 08]
[    0.071437] pci 0000:00:11.3: PCI bridge to [bus 09]
[    0.071480] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 09
[    0.071658] PCI 0000:00 Cannot reserve Legacy IO [io 0x10000-0x10fff]
[    0.071671] pci 0000:00:10.0: bridge window [mem 
0x00100000-0x000fffff 64bit pref] to [bus 01] add_size 200000 add_align 
100000
[    0.071697] pci 0000:00:11.0: bridge window [mem 
0x00100000-0x000fffff 64bit pref] to [bus 05-06] add_size 200000 
add_align 100000
[    0.071714] pci 0000:00:11.1: bridge window [io  0x1000-0x0fff] to 
[bus 07] add_size 1000
[    0.071726] pci 0000:00:11.1: bridge window [mem 
0x00100000-0x000fffff 64bit pref] to [bus 07] add_size 200000 add_align 
100000
[    0.071741] pci 0000:00:11.1: bridge window [mem 
0x00100000-0x000fffff] to [bus 07] add_size 200000 add_align 100000
[    0.071756] pci 0000:00:11.2: bridge window [io  0x1000-0x0fff] to 
[bus 08] add_size 1000
[    0.071767] pci 0000:00:11.2: bridge window [mem 
0x00100000-0x000fffff 64bit pref] to [bus 08] add_size 200000 add_align 
100000
[    0.071782] pci 0000:00:11.2: bridge window [mem 
0x00100000-0x000fffff] to [bus 08] add_size 200000 add_align 100000
[    0.071796] pci 0000:00:11.3: bridge window [io  0x1000-0x0fff] to 
[bus 09] add_size 1000
[    0.071808] pci 0000:00:11.3: bridge window [mem 
0x00100000-0x000fffff 64bit pref] to [bus 09] add_size 200000 add_align 
100000
[    0.071823] pci 0000:00:11.3: bridge window [mem 
0x00100000-0x000fffff] to [bus 09] add_size 200000 add_align 100000
[    0.071861] pci 0000:00:10.0: BAR 9: assigned [mem 
0x80000000000-0x800001fffff 64bit pref]
[    0.071877] pci 0000:00:11.0: BAR 9: assigned [mem 
0x80000200000-0x800003fffff 64bit pref]
[    0.071889] pci 0000:00:11.1: BAR 8: assigned [mem 0x80000000-0x801fffff]
[    0.071901] pci 0000:00:11.1: BAR 9: assigned [mem 
0x80000400000-0x800005fffff 64bit pref]
[    0.071913] pci 0000:00:11.2: BAR 8: assigned [mem 0x80200000-0x803fffff]
[    0.071926] pci 0000:00:11.2: BAR 9: assigned [mem 
0x80000600000-0x800007fffff 64bit pref]
[    0.071937] pci 0000:00:11.3: BAR 8: assigned [mem 0x80400000-0x805fffff]
[    0.071950] pci 0000:00:11.3: BAR 9: assigned [mem 
0x80000800000-0x800009fffff 64bit pref]
[    0.071961] pci 0000:00:11.1: BAR 7: assigned [io 0x14000-0x14fff]
[    0.071972] pci 0000:00:11.2: BAR 7: assigned [io 0x15000-0x15fff]
[    0.071983] pci 0000:00:11.3: BAR 7: assigned [io 0x16000-0x16fff]
[    0.071999] pci 0000:00:10.0: PCI bridge to [bus 01]
[    0.072008] pci 0000:00:10.0:   bridge window [io 0x12000-0x12fff]
[    0.072019] pci 0000:00:10.0:   bridge window [mem 0x90000000-0xa00fffff]
[    0.072029] pci 0000:00:10.0:   bridge window [mem 
0x80000000000-0x800001fffff 64bit pref]
[    0.072041] pci 0000:00:10.1: PCI bridge to [bus 02]
[    0.072053] pci 0000:00:10.2: PCI bridge to [bus 03]
[    0.072065] pci 0000:00:10.3: PCI bridge to [bus 04]
[    0.072082] pci 0000:05:14.4: PCI bridge to [bus 06]
[    0.072093] pci 0000:05:14.4:   bridge window [io 0x13000-0x13fff]
[    0.072104] pci 0000:05:14.4:   bridge window [mem 0xa0300000-0xa03fffff]
[    0.072118] pci 0000:00:11.0: PCI bridge to [bus 05-06]
[    0.072127] pci 0000:00:11.0:   bridge window [io 0x10000-0x13fff]
[    0.072137] pci 0000:00:11.0:   bridge window [mem 0xa0100000-0xa03fffff]
[    0.072147] pci 0000:00:11.0:   bridge window [mem 
0x80000200000-0x800003fffff 64bit pref]
[    0.072159] pci 0000:00:11.1: PCI bridge to [bus 07]
[    0.072168] pci 0000:00:11.1:   bridge window [io 0x14000-0x14fff]
[    0.072178] pci 0000:00:11.1:   bridge window [mem 0x80000000-0x801fffff]
[    0.072188] pci 0000:00:11.1:   bridge window [mem 
0x80000400000-0x800005fffff 64bit pref]
[    0.072200] pci 0000:00:11.2: PCI bridge to [bus 08]
[    0.072209] pci 0000:00:11.2:   bridge window [io 0x15000-0x15fff]
[    0.072219] pci 0000:00:11.2:   bridge window [mem 0x80200000-0x803fffff]
[    0.072229] pci 0000:00:11.2:   bridge window [mem 
0x80000600000-0x800007fffff 64bit pref]
[    0.072241] pci 0000:00:11.3: PCI bridge to [bus 09]
[    0.072249] pci 0000:00:11.3:   bridge window [io 0x16000-0x16fff]
[    0.072259] pci 0000:00:11.3:   bridge window [mem 0x80400000-0x805fffff]
[    0.072270] pci 0000:00:11.3:   bridge window [mem 
0x80000800000-0x800009fffff 64bit pref]
[    0.072284] pci_bus 0000:00: resource 4 [io  0x10000-0x80ffff]
[    0.072295] pci_bus 0000:00: resource 5 [mem 0x80000000-0xe00fffff]
[    0.072305] pci_bus 0000:00: resource 6 [mem 0xfd800000-0xfd800fff]
[    0.072314] pci_bus 0000:00: resource 7 [mem 0x80000000000-0xbffffffffff]
[    0.072324] pci_bus 0000:01: resource 0 [io  0x12000-0x12fff]
[    0.072333] pci_bus 0000:01: resource 1 [mem 0x90000000-0xa00fffff]
[    0.072343] pci_bus 0000:01: resource 2 [mem 
0x80000000000-0x800001fffff 64bit pref]
[    0.072354] pci_bus 0000:05: resource 0 [io  0x10000-0x13fff]
[    0.072363] pci_bus 0000:05: resource 1 [mem 0xa0100000-0xa03fffff]
[    0.072373] pci_bus 0000:05: resource 2 [mem 
0x80000200000-0x800003fffff 64bit pref]
[    0.072383] pci_bus 0000:06: resource 0 [io  0x13000-0x13fff]
[    0.072393] pci_bus 0000:06: resource 1 [mem 0xa0300000-0xa03fffff]
[    0.072402] pci_bus 0000:07: resource 0 [io  0x14000-0x14fff]
[    0.072412] pci_bus 0000:07: resource 1 [mem 0x80000000-0x801fffff]
[    0.072421] pci_bus 0000:07: resource 2 [mem 
0x80000400000-0x800005fffff 64bit pref]
[    0.072431] pci_bus 0000:08: resource 0 [io  0x15000-0x15fff]
[    0.072441] pci_bus 0000:08: resource 1 [mem 0x80200000-0x803fffff]
[    0.072450] pci_bus 0000:08: resource 2 [mem 
0x80000600000-0x800007fffff 64bit pref]
[    0.072460] pci_bus 0000:09: resource 0 [io  0x16000-0x16fff]
[    0.072469] pci_bus 0000:09: resource 1 [mem 0x80400000-0x805fffff]
[    0.072479] pci_bus 0000:09: resource 2 [mem 
0x80000800000-0x800009fffff 64bit pref]
[    0.072659] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.072682] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.072701] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.072720] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.072741] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.072762] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.072784] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.072805] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.072824] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.072843] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.072861] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.072929] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.073167] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.073191] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.073211] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.073232] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.073252] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.073272] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.073292] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.073319] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.073339] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.073371] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.073392] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.073412] OF: /pxp@0,e0000000 interrupt-map failed, using 
interrupt-controller
[    0.073426] PCI: Probing PCI hardware done
[    0.082932] HugeTLB registered 16.0 MiB page size, pre-allocated 0 pages
[    0.099632] raid6: altivecx8 gen()  4750 MB/s
[    0.116688] raid6: altivecx4 gen()  4666 MB/s
[    0.133744] raid6: altivecx2 gen()  4253 MB/s
[    0.150794] raid6: altivecx1 gen()  3729 MB/s
[    0.167859] raid6: int64x8  gen()  2118 MB/s
[    0.184915] raid6: int64x8  xor()  1114 MB/s
[    0.201961] raid6: int64x4  gen()  2569 MB/s
[    0.219020] raid6: int64x4  xor()  1083 MB/s
[    0.236070] raid6: int64x2  gen()  2200 MB/s
[    0.253129] raid6: int64x2  xor()  1168 MB/s
[    0.270173] raid6: int64x1  gen()  1501 MB/s
[    0.287238] raid6: int64x1  xor()   459 MB/s
[    0.287246] raid6: using algorithm altivecx8 gen() 4750 MB/s
[    0.287252] raid6: using intx1 recovery algorithm
[    0.287526] SCSI subsystem initialized
[    0.287622] libata version 3.00 loaded.
[    0.287734] usbcore: registered new interface driver usbfs
[    0.287768] usbcore: registered new interface driver hub
[    0.287795] usbcore: registered new device driver usb
[    0.287907] EDAC MC: Ver: 3.0.0
[    0.288213] Advanced Linux Sound Architecture Driver Initialized.
[    0.288624] clocksource: Switched to clocksource timebase
[    0.579813] VFS: Disk quotas dquot_6.6.0
[    0.579872] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 
bytes)
[    0.583168] NET: Registered PF_INET protocol family
[    0.583501] IP idents hash table entries: 131072 (order: 8, 1048576 
bytes, linear)
[    0.585890] tcp_listen_portaddr_hash hash table entries: 4096 (order: 
4, 65536 bytes, linear)
[    0.585951] TCP established hash table entries: 65536 (order: 7, 
524288 bytes, linear)
[    0.586231] TCP bind hash table entries: 65536 (order: 8, 1048576 
bytes, linear)
[    0.586689] TCP: Hash tables configured (established 65536 bind 65536)
[    0.586773] UDP hash table entries: 4096 (order: 5, 131072 bytes, linear)
[    0.586866] UDP-Lite hash table entries: 4096 (order: 5, 131072 
bytes, linear)
[    0.587060] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.587418] RPC: Registered named UNIX socket transport module.
[    0.587430] RPC: Registered udp transport module.
[    0.587436] RPC: Registered tcp transport module.
[    0.587442] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.588064] pci 0000:01:00.1: D0 power state depends on 0000:01:00.0
[    0.588806] PCI: CLS 64 bytes, default 128
[    0.589686] OF: /localbus@f0000000/cf@1000000: could not find phandle 14
[    0.589709] OF: /localbus@f0000000/cf@1000000: could not find phandle 1
[    0.589726] OF: /localbus@f0000000/cf@1000000: could not find phandle 10
[    0.589744] OF: /localbus@f0000000/cf@1000000: could not find phandle 11
[    0.590166] libphy: pasemi gpio mdio bus: probed
[    0.978292] Initialise system trusted keyrings
[    0.978376] workingset: timestamp_bits=62 max_order=21 bucket_order=0
[    0.978735] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.979061] NFS: Registering the id_resolver key type
[    0.979080] Key type id_resolver registered
[    0.979087] Key type id_legacy registered
[    0.979107] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.979115] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver 
Registering...
[    0.979437] Key type cifs.idmap registered
[    0.979645] ntfs: driver 2.1.32 [Flags: R/W].
[    0.979677] ntfs3: Max link count 4000
[    0.979684] ntfs3: Read-only LZX/Xpress compression included
[    0.979780] fuse: init (API version 7.35)
[    1.035583] xor: measuring software checksum speed
[    1.038421]    8regs           :  3488 MB/sec
[    1.041493]    8regs_prefetch  :  3213 MB/sec
[    1.044209]    32regs          :  3631 MB/sec
[    1.047272]    32regs_prefetch :  3220 MB/sec
[    1.048919]    altivec         :  6024 MB/sec
[    1.048931] xor: using function: altivec (6024 MB/sec)
[    1.048939] Key type asymmetric registered
[    1.048945] Asymmetric key parser 'x509' registered
[    1.049016] Block layer SCSI generic (bsg) driver version 0.4 loaded 
(major 251)
[    1.049028] io scheduler mq-deadline registered
[    1.049035] io scheduler kyber registered
[    1.049060] io scheduler bfq registered
[    1.051738] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    1.052403] serial8250.0: ttyS0 at I/O 0x8003f8 (irq = 73, base_baud 
= 8333333) is a 16550A
[    1.052656] serial8250.0: ttyS1 at I/O 0x8002f8 (irq = 74, base_baud 
= 8333333) is a 16550A
[    1.053189] 0000:00:1d.0: ttyS0 at I/O 0x8003f8 (irq = 73, base_baud 
= 8333333) is a 16550A
[    1.053529] 0000:00:1d.1: ttyS1 at I/O 0x8002f8 (irq = 74, base_baud 
= 8333333) is a 16550A
[    1.054168] Registering PA Semi RNG
[    1.054268] Linux agpgart interface v0.103
[    1.054366] [drm] radeon kernel modesetting enabled.
[    1.054886] [drm] initializing kernel modesetting (CAYMAN 
0x1002:0x6718 0x1682:0x3130 0x00).
[    1.221841] ATOM BIOS: CAYMAN
[    1.221921] radeon 0000:01:00.0: VRAM: 2048M 0x0000000000000000 - 
0x000000007FFFFFFF (2048M used)
[    1.221937] radeon 0000:01:00.0: GTT: 1024M 0x0000000080000000 - 
0x00000000BFFFFFFF
[    1.221948] [drm] Detected VRAM RAM=2048M, BAR=256M
[    1.221954] [drm] RAM width 256bits DDR
[    1.221962] radeon 0000:01:00.0: dma_iommu_get_required_mask: 
returning bypass mask 0x3ffffffff
[    1.222016] [drm] radeon: 2048M of VRAM memory ready
[    1.222025] [drm] radeon: 1024M of GTT memory ready.
[    1.222046] [drm] Loading CAYMAN Microcode
[    1.222066] [drm] Internal thermal controller with fan control
[    1.228927] [drm] radeon: dpm initialized
[    1.228978] [drm] GART: num cpu pages 262144, num gpu pages 262144
[    1.262917] [drm] PCIE GART of 1024M enabled (table at 
0x0000000000162000).
[    1.263044] radeon 0000:01:00.0: WB enabled
[    1.263056] radeon 0000:01:00.0: fence driver on ring 0 use gpu addr 
0x0000000080000c00
[    1.277343] radeon 0000:01:00.0: fence driver on ring 5 use gpu addr 
0x0000000000072118
[    1.277357] radeon 0000:01:00.0: fence driver on ring 1 use gpu addr 
0x0000000080000c04
[    1.277367] radeon 0000:01:00.0: fence driver on ring 2 use gpu addr 
0x0000000080000c08
[    1.277377] radeon 0000:01:00.0: fence driver on ring 3 use gpu addr 
0x0000000080000c0c
[    1.277387] radeon 0000:01:00.0: fence driver on ring 4 use gpu addr 
0x0000000080000c10
[    1.277745] radeon 0000:01:00.0: radeon: MSI limited to 32-bit
[    1.277791] [drm] radeon: irq initialized.
[    1.296589] [drm] ring test on 0 succeeded in 2 usecs
[    1.296611] [drm] ring test on 3 succeeded in 3 usecs
[    1.296635] [drm] ring test on 4 succeeded in 4 usecs
[    1.472123] [drm] ring test on 5 succeeded in 2 usecs
[    1.472138] [drm] UVD initialized successfully.
[    1.472538] [drm] ib test on ring 0 succeeded in 0 usecs
[    1.472629] [drm] ib test on ring 3 succeeded in 0 usecs
[    1.472699] [drm] ib test on ring 4 succeeded in 0 usecs
[    2.658650] [drm:.uvd_v1_0_ib_test] *ERROR* radeon: fence wait timed out.
[    2.658673] [drm:.radeon_ib_ring_tests] *ERROR* radeon: failed 
testing IB on ring 5 (-110).
[    2.660317] [drm] Radeon Display Connectors
[    2.660329] [drm] Connector 0:
[    2.660335] [drm]   DP-1
[    2.660340] [drm]   HPD5
[    2.660344] [drm]   DDC: 0x6430 0x6430 0x6434 0x6434 0x6438 0x6438 
0x643c 0x643c
[    2.660354] [drm]   Encoders:
[    2.660359] [drm]     DFP1: INTERNAL_UNIPHY2
[    2.660365] [drm] Connector 1:
[    2.660370] [drm]   DP-2
[    2.660374] [drm]   HPD4
[    2.660378] [drm]   DDC: 0x6440 0x6440 0x6444 0x6444 0x6448 0x6448 
0x644c 0x644c
[    2.660388] [drm]   Encoders:
[    2.660392] [drm]     DFP2: INTERNAL_UNIPHY2
[    2.660398] [drm] Connector 2:
[    2.660402] [drm]   HDMI-A-1
[    2.660407] [drm]   HPD6
[    2.660412] [drm]   DDC: 0x6460 0x6460 0x6464 0x6464 0x6468 0x6468 
0x646c 0x646c
[    2.660421] [drm]   Encoders:
[    2.660425] [drm]     DFP3: INTERNAL_UNIPHY1
[    2.660431] [drm] Connector 3:
[    2.660435] [drm]   DVI-D-1
[    2.660440] [drm]   HPD1
[    2.660444] [drm]   DDC: 0x6450 0x6450 0x6454 0x6454 0x6458 0x6458 
0x645c 0x645c
[    2.660454] [drm]   Encoders:
[    2.660458] [drm]     DFP4: INTERNAL_UNIPHY1
[    2.660463] [drm] Connector 4:
[    2.660468] [drm]   DVI-I-1
[    2.660472] [drm]   HPD3
[    2.660477] [drm]   DDC: 0x6470 0x6470 0x6474 0x6474 0x6478 0x6478 
0x647c 0x647c
[    2.660487] [drm]   Encoders:
[    2.660491] [drm]     DFP5: INTERNAL_UNIPHY
[    2.660496] [drm]     CRT1: INTERNAL_KLDSCP_DAC1
[    2.833919] [drm] fb mappable at 0x90371000
[    2.833931] [drm] vram apper at 0x90000000
[    2.833937] [drm] size 7680000
[    2.833943] [drm] fb depth is 24
[    2.833948] [drm]    pitch is 6400
[    2.933738] [drm:.ni_dpm_set_power_state] *ERROR* 
ni_restrict_performance_levels_before_switch failed
[    3.060825] Console: switching to colour frame buffer device 200x75
[    3.156454] radeon 0000:01:00.0: [drm] fb0: radeon frame buffer device
[    3.156945] [drm] Initialized radeon 2.50.0 20080528 for 0000:01:00.0 
on minor 0
[    3.160478] loop: module loaded
[    3.161124] ahci 0000:05:12.0: version 3.0
[    3.161176] ahci 0000:05:12.0: controller can't do 64bit DMA, forcing 
32bit
[    3.161727] ahci 0000:05:12.0: AHCI 0001.0100 32 slots 4 ports 3 Gbps 
0xf impl SATA mode
[    3.162272] ahci 0000:05:12.0: flags: ncq sntf ilck pm led clo pmp 
pio slum part ccc
[    3.164017] scsi host0: ahci
[    3.164442] scsi host1: ahci
[    3.164938] scsi host2: ahci
[    3.165370] scsi host3: ahci
[    3.165593] ata1: SATA max UDMA/133 abar m1024@0xa0209000 port 
0xa0209100 irq 9
[    3.166077] ata2: SATA max UDMA/133 abar m1024@0xa0209000 port 
0xa0209180 irq 9
[    3.166542] ata3: SATA max UDMA/133 abar m1024@0xa0209000 port 
0xa0209200 irq 9
[    3.167020] ata4: SATA max UDMA/133 abar m1024@0xa0209000 port 
0xa0209280 irq 9
[    3.168364] scsi host4: pata_atiixp
[    3.169004] scsi host5: pata_atiixp
[    3.169255] ata5: PATA max UDMA/100 cmd 0x11030 ctl 0x11054 bmdma 
0x11000 irq 9
[    3.169743] ata6: DUMMY
[    3.170502] libphy: Fixed MDIO Bus: probed
[    3.172095] PA Semi PWRficient DMA library initialized (20 tx, 64 rx 
channels)
[    3.173148] eth0: PA Semi GMAC: intf 5, hw addr 02:00:e0:0a:30:00
[    3.173596] pasemi_mac 0000:00:15.0: no mac address in device tree, 
not configuring
[    3.174300] 8139cp: 8139cp: 10/100 PCI Ethernet driver v1.3 (Mar 22, 
2004)
[    3.174756] 8139cp 0000:06:05.0: This (id 10ec:8139 rev 10) is not an 
8139C+ compatible chip, use 8139too
[    3.175533] 8139too: 8139too Fast Ethernet driver 0.9.28
[    3.176879] 8139too 0000:06:05.0 eth1: RealTek RTL8139 at 
0x(____ptrval____), 00:e0:e8:16:5f:64, IRQ 4
[    3.177647] PPP generic driver version 2.4.2
[    3.178039] PPP BSD Compression module registered
[    3.178321] PPP Deflate Compression module registered
[    3.178637] NET: Registered PF_PPPOX protocol family
[    3.178962] orinoco 0.15 (David Gibson 
<hermes@gibson.dropbear.id.au>, Pavel Roskin <proski@gnu.org>, et al)
[    3.178968] orinoco_plx 0.15 (Pavel Roskin <proski@gnu.org>, David 
Gibson <hermes@gibson.dropbear.id.au>, Daniel Barlow <dan@telent.net>)
[    3.179023] orinoco_pci 0.15 (Pavel Roskin <proski@gnu.org>, David 
Gibson <hermes@gibson.dropbear.id.au> & Jean Tourrilhes <jt@hpl.hp.com>)
[    3.179537] electra-cf f0000000.cf: at mem 0xf0000000 io 0xf1000000 
irq 17
[    3.180218] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    3.180702] ehci-pci: EHCI PCI platform driver
[    3.181047] ehci-pci 0000:05:13.5: EHCI Host Controller
[    3.181446] ehci-pci 0000:05:13.5: new USB bus registered, assigned 
bus number 1
[    3.181968] ehci-pci 0000:05:13.5: applying AMD SB600/SB700 USB 
freeze workaround
[    3.182489] ehci-pci 0000:05:13.5: debug port 1
[    3.182836] ehci-pci 0000:05:13.5: irq 12, io mem 0xa0209800
[    3.189631] ehci-pci 0000:05:13.5: USB 2.0 started, EHCI 1.00
[    3.190088] usb usb1: New USB device found, idVendor=1d6b, 
idProduct=0002, bcdDevice= 5.16
[    3.190670] usb usb1: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    3.191161] usb usb1: Product: EHCI Host Controller
[    3.191454] usb usb1: Manufacturer: Linux 
5.16.0-a6_A-EON_X1000_Nemo-12267-gdebe436e77c7-dirty ehci_hcd
[    3.192123] usb usb1: SerialNumber: 0000:05:13.5
[    3.212136] hub 1-0:1.0: USB hub found
[    3.231948] hub 1-0:1.0: 10 ports detected
[    3.252221] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    3.272329] ohci-pci: OHCI PCI platform driver
[    3.292394] ohci-pci 0000:05:13.0: OHCI PCI host controller
[    3.312511] ohci-pci 0000:05:13.0: new USB bus registered, assigned 
bus number 2
[    3.332912] ohci-pci 0000:05:13.0: irq 9, io mem 0xa0207000
[    3.409702] usb usb2: New USB device found, idVendor=1d6b, 
idProduct=0001, bcdDevice= 5.16
[    3.430734] usb usb2: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    3.451718] usb usb2: Product: OHCI PCI host controller
[    3.472562] usb usb2: Manufacturer: Linux 
5.16.0-a6_A-EON_X1000_Nemo-12267-gdebe436e77c7-dirty ohci_hcd
[    3.478825] ata4: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    3.493020] usb usb2: SerialNumber: 0000:05:13.0
[    3.493259] hub 2-0:1.0: USB hub found
[    3.512120] ata3: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    3.532400] hub 2-0:1.0: 2 ports detected
[    3.551574] ata2: SATA link down (SStatus 0 SControl 300)
[    3.572326] ohci-pci 0000:05:13.1: OHCI PCI host controller
[    3.591355] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    3.612244] ohci-pci 0000:05:13.1: new USB bus registered, assigned 
bus number 3
[    3.631480] ata3.00: ATAPI: HL-DT-ST DVDRAM GH22NS50, TN01, max UDMA/100
[    3.652503] ohci-pci 0000:05:13.1: irq 10, io mem 0xa0208000
[    3.672504] ata3.00: SB600 AHCI: limiting to 255 sectors per cmd
[    3.735426] random: fast init done
[    3.758824] ata4.00: ATA-8: ESA3SF1240GB, 4.C.V, max UDMA/133
[    3.761756] usb usb3: New USB device found, idVendor=1d6b, 
idProduct=0001, bcdDevice= 5.16
[    3.779172] ata3.00: SB600 AHCI: limiting to 255 sectors per cmd
[    3.801009] usb usb3: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    3.821495] ata3.00: configured for UDMA/100
[    3.843419] usb usb3: Product: OHCI PCI host controller
[    3.863821] ata4.00: 468862128 sectors, multi 16: LBA48 NCQ (depth 
32), AA
[    3.885517] usb usb3: Manufacturer: Linux 
5.16.0-a6_A-EON_X1000_Nemo-12267-gdebe436e77c7-dirty ohci_hcd
[    3.885523] usb usb3: SerialNumber: 0000:05:13.1
[    3.891826] hub 3-0:1.0: USB hub found
[    3.917168] ata4.00: ATA Identify Device Log not supported
[    3.958641] hub 3-0:1.0: 2 ports detected
[    3.971380] ata4.00: SB600 AHCI: limiting to 255 sectors per cmd
[    4.029869] ohci-pci 0000:05:13.2: OHCI PCI host controller
[    4.062345] usb 2-1: new low-speed USB device number 2 using ohci-pci
[    4.085640] ata1.00: ATA-8: ST2000DM001-9YN164, CC4B, max UDMA/133
[    4.087801] ohci-pci 0000:05:13.2: new USB bus registered, assigned 
bus number 4
[    4.135980] pcmcia_socket pcmcia_socket0: pccard: PCMCIA card 
inserted into slot 0
[    4.147460] ata1.00: 3907029168 sectors, multi 16: LBA48 NCQ (depth 
32), AA
[    4.165736] pcmcia 0.0: pcmcia: registering new device pcmcia0.0 
(IRQ: 17)
[    4.183897] ohci-pci 0000:05:13.2: irq 11, io mem 0xa0206000
[    4.211231] ata4.00: ATA Identify Device Log not supported
[    4.257486] ata4.00: SB600 AHCI: limiting to 255 sectors per cmd
[    4.283009] ata4.00: configured for UDMA/133
[    4.309715] ata1.00: ATA Identify Device Log not supported
[    4.333835] ata1.00: SB600 AHCI: limiting to 255 sectors per cmd
[    4.334715] usb usb4: New USB device found, idVendor=1d6b, 
idProduct=0001, bcdDevice= 5.16
[    4.359098] ata1.00: ATA Identify Device Log not supported
[    4.379777] usb usb4: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    4.401686] ata1.00: SB600 AHCI: limiting to 255 sectors per cmd
[    4.425310] usb usb4: Product: OHCI PCI host controller
[    4.447640] ata1.00: configured for UDMA/133
[    4.471329] usb usb4: Manufacturer: Linux 
5.16.0-a6_A-EON_X1000_Nemo-12267-gdebe436e77c7-dirty ohci_hcd
[    4.471334] usb usb4: SerialNumber: 0000:05:13.2
[    4.471836] hub 4-0:1.0: USB hub found
[    4.493767] scsi host6: pata_pcmcia
[    4.517859] scsi 0:0:0:0: Direct-Access     ATA ST2000DM001-9YN1 CC4B 
PQ: 0 ANSI: 5
[    4.540306] ata7: PATA max PIO0 cmd 0x811000 ctl 0x81100e irq 17
[    4.564947] sd 0:0:0:0: [sda] 3907029168 512-byte logical blocks: 
(2.00 TB/1.82 TiB)
[    4.641724] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    4.663257] sd 0:0:0:0: [sda] 4096-byte physical blocks
[    4.663339] hub 4-0:1.0: 2 ports detected
[    4.738929] ohci-pci 0000:05:13.3: OHCI PCI host controller
[    4.740471] scsi 2:0:0:0: CD-ROM            HL-DT-ST DVDRAM GH22NS50  
TN01 PQ: 0 ANSI: 5
[    4.768267] sd 0:0:0:0: [sda] Write Protect is off
[    4.786318] ohci-pci 0000:05:13.3: new USB bus registered, assigned 
bus number 5
[    4.809852] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    4.810013] sd 0:0:0:0: [sda] Write cache: enabled, read cache: 
enabled, doesn't support DPO or FUA
[    4.832875] ata7.00: CFA: SanDisk SDCFB-256, HDX 2.33, max PIO4
[    4.864688] usb 2-1: New USB device found, idVendor=04d9, 
idProduct=1503, bcdDevice= 3.10
[    4.881221] ata7.00: 501760 sectors, multi 0: LBA
[    4.881357] ohci-pci 0000:05:13.3: irq 10, io mem 0xa0205000
[    4.906295] usb 2-1: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[    4.906301] usb 2-1: Product: USB Keyboard
[    4.906306] usb 2-1: Manufacturer:
[    4.940649] ata7.00: Read log page 0x00 failed, Emask 0x1
[    4.999828]  sda: RDSK (512) sda1 (DOS^G)(res 2 spb 2) sda2 
(SFS^B)(res 2 spb 1) sda3 (SFS^B)(res 2 spb 2) sda4 ((res 2 spb 1)
[    5.006126] ata7.00: ATA Identify Device Log not supported
[    5.030765] usb 3-1: new low-speed USB device number 2 using ohci-pci
[    5.081110] ata7.00: Read log page 0x00 failed, Emask 0x1
[    5.109981] usb usb5: New USB device found, idVendor=1d6b, 
idProduct=0001, bcdDevice= 5.16
[    5.129283] ata7.00: ATA Identify Device Log not supported
[    5.154171] usb usb5: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    5.205769] sda: p4 size 18446744071956107760 extends beyond EOD,
[    5.230608] usb usb5: Product: OHCI PCI host controller
[    5.230614] usb usb5: Manufacturer: Linux 
5.16.0-a6_A-EON_X1000_Nemo-12267-gdebe436e77c7-dirty ohci_hcd
[    5.230623] usb usb5: SerialNumber: 0000:05:13.3
[    5.254566] enabling native capacity
[    5.306505] hub 5-0:1.0: USB hub found
[    5.384924] sr 2:0:0:0: [sr0] scsi3-mmc drive: 48x/48x writer dvd-ram 
cd/rw xa/form2 cdda tray
[    5.384957] hub 5-0:1.0: 2 ports detected
[    5.409138] cdrom: Uniform CD-ROM driver Revision: 3.20
[    5.434914] ohci-pci 0000:05:13.4: OHCI PCI host controller
[    5.486163] ohci-pci 0000:05:13.4: new USB bus registered, assigned 
bus number 6
[    5.486415]  sda: RDSK (512) sda1 (DOS^G)(res 2 spb 2) sda2 
(SFS^B)(res 2 spb 1) sda3 (SFS^B)(res 2 spb 2) sda4 ((res 2 spb 1)
[    5.511615] ohci-pci 0000:05:13.4: irq 11, io mem 0xa0204000
[    5.563643] sda: p4 size 18446744071956107760 extends beyond EOD, 
truncated
[    5.590647] sd 0:0:0:0: [sda] Attached SCSI disk
[    5.620862] usb usb6: New USB device found, idVendor=1d6b, 
idProduct=0001, bcdDevice= 5.16
[    5.620954] sr 2:0:0:0: Attached scsi CD-ROM sr0
[    5.646591] usb usb6: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    5.674487] usb usb6: Product: OHCI PCI host controller
[    5.674676] sr 2:0:0:0: Attached scsi generic sg1 type 5
[    5.700210] usb usb6: Manufacturer: Linux 
5.16.0-a6_A-EON_X1000_Nemo-12267-gdebe436e77c7-dirty ohci_hcd
[    5.700216] usb usb6: SerialNumber: 0000:05:13.4
[    5.724716] scsi 3:0:0:0: Direct-Access     ATA ESA3SF1240GB     V    
PQ: 0 ANSI: 5
[    5.756738] usb 3-1: New USB device found, idVendor=046a, 
idProduct=000c, bcdDevice= 8.10
[    5.776359] sd 3:0:0:0: [sdb] 468862128 512-byte logical blocks: (240 
GB/224 GiB)
[    5.802314] usb 3-1: New USB device strings: Mfr=0, Product=0, 
SerialNumber=0
[    5.827444] sd 3:0:0:0: [sdb] Write Protect is off
[    5.854083] hub 6-0:1.0: USB hub found
[    5.878987] sd 3:0:0:0: [sdb] Mode Sense: 00 3a 00 00
[    5.905425] hub 6-0:1.0: 2 ports detected
[    5.930185] sd 3:0:0:0: [sdb] Write cache: enabled, read cache: 
enabled, doesn't support DPO or FUA
[    5.955836] sd 3:0:0:0: Attached scsi generic sg2 type 0
[    5.981355] usbcore: registered new interface driver usblp
[    6.034298] scsi 6:0:0:0: Direct-Access     ATA      SanDisk SDCFB-25 
2.33 PQ: 0 ANSI: 5
[    6.062753] sd 6:0:0:0: [sdc] 501760 512-byte logical blocks: (257 
MB/245 MiB)
[    6.090218] sd 6:0:0:0: Attached scsi generic sg3 type 0
[    6.090268] sd 6:0:0:0: [sdc] Write Protect is off
[    6.143553] sd 6:0:0:0: [sdc] Mode Sense: 00 3a 00 00
[    6.143834] usbcore: registered new interface driver usb-storage
[    6.171758] usbcore: registered new interface driver usbserial_generic
[    6.173722]  sdb: sdb1 sdb2 < sdb5 sdb6 > sdb3 sdb4
[    6.197876] usbserial: USB Serial support registered for generic
[    6.222916] sd 3:0:0:0: [sdb] Attached SCSI disk
[    6.248827] usbcore: registered new interface driver ftdi_sio
[    6.272884] sd 6:0:0:0: [sdc] Write cache: disabled, read cache: 
enabled, doesn't support DPO or FUA
[    6.298116] usbserial: USB Serial support registered for FTDI USB 
Serial Device
[    6.351325] usbcore: registered new interface driver option
[    6.353315]  sdc: sdc1
[    6.377769] usbserial: USB Serial support registered for GSM modem 
(1-port)
[    6.401974] usb 6-1: new full-speed USB device number 2 using ohci-pci
[    6.454874] mousedev: PS/2 mouse device common for all mice
[    6.455301] sd 6:0:0:0: [sdc] Attached SCSI removable disk
[    6.481450] usbcore: registered new interface driver synaptics_usb
[    6.534824] usbcore: registered new interface driver iforce
[    6.562511] usbcore: registered new interface driver xpad
[    6.590406] usbcore: registered new interface driver usb_acecad
[    6.617930] usbcore: registered new interface driver aiptek
[    6.644915] usbcore: registered new interface driver hanwang
[    6.671439] usbcore: registered new interface driver kbtab
[    6.697522] rtc_cmos rtc_cmos: not accessible
[    6.723231] i2c_dev: i2c /dev entries driver
[    6.750148] IR NEC protocol handler initialized
[    6.775548] IR RC5(x/sz) protocol handler initialized
[    6.800784] IR RC6 protocol handler initialized
[    6.826136] IR JVC protocol handler initialized
[    6.851243] IR Sony protocol handler initialized
[    6.875871] IR SANYO protocol handler initialized
[    6.877740] usb 6-1: New USB device found, idVendor=0a12, 
idProduct=0001, bcdDevice=88.91
[    6.898488] IR Sharp protocol handler initialized
[    6.919924] usb 6-1: New USB device strings: Mfr=0, Product=2, 
SerialNumber=0
[    6.942634] IR MCE Keyboard/mouse protocol handler initialized
[    6.964106] usb 6-1: Product: CSR8510 A10
[    6.986809] IR XMP protocol handler initialized
[    7.049632] i2c i2c-10: Detected TI TMP423 chip at 0x4c
[    7.123825] EDAC MC0: Giving out device to module pasemi_edac 
controller pasemi,pwrficient-mc: DEV 0000:00:04.0 (POLLED)
[    7.148039] EDAC MC1: Giving out device to module pasemi_edac 
controller pasemi,pwrficient-mc: DEV 0000:00:05.0 (POLLED)
[    7.183592] input:   USB Keyboard as 
/devices/pci0000:00/0000:00:11.0/0000:05:13.0/usb2/2-1/2-1:1.0/0003:04D9:1503.0001/input/input0
[    7.258634] usb 6-2: new full-speed USB device number 3 using ohci-pci
[    7.282690] hid-generic 0003:04D9:1503.0001: input: USB HID v1.10 
Keyboard [  USB Keyboard] on usb-0000:05:13.0-1/input0
[    7.325528] input:   USB Keyboard System Control as 
/devices/pci0000:00/0000:00:11.0/0000:05:13.0/usb2/2-1/2-1:1.1/0003:04D9:1503.0002/input/input1
[    7.402763] input:   USB Keyboard Consumer Control as 
/devices/pci0000:00/0000:00:11.0/0000:05:13.0/usb2/2-1/2-1:1.1/0003:04D9:1503.0002/input/input2
[    7.427938] hid-generic 0003:04D9:1503.0002: input: USB HID v1.10 
Device [  USB Keyboard] on usb-0000:05:13.0-1/input1
[    7.458556] input: HID 046a:000c as 
/devices/pci0000:00/0000:00:11.0/0000:05:13.1/usb3/3-1/3-1:1.0/0003:046A:000C.0003/input/input3
[    7.484913] hid-generic 0003:046A:000C.0003: input: USB HID v1.00 
Mouse [HID 046a:000c] on usb-0000:05:13.1-1/input0
[    7.511230] usbcore: registered new interface driver usbhid
[    7.536989] usbhid: USB HID core driver
[    7.562841] no UART detected at 0x1
[    7.588946] usbcore: registered new interface driver snd-usb-audio
[    7.614455] usbcore: registered new interface driver snd-ua101
[    7.639612] usbcore: registered new interface driver snd-usb-usx2y
[    7.639751] usb 6-2: New USB device found, idVendor=03ee, 
idProduct=6901, bcdDevice= 2.00
[    7.664159] usbcore: registered new interface driver snd-usb-caiaq
[    7.687139] usb 6-2: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[    7.711584] usbcore: registered new interface driver snd-usb-6fire
[    7.734355] usb 6-2: Product: MITSUMI0
[    7.758870] usbcore: registered new interface driver snd-usb-hiface
[    7.781027] usb 6-2: Manufacturer: MITSUMI0
[    7.781814] usb-storage 6-2:1.0: USB Mass Storage device detected
[    7.805267] usbcore: registered new interface driver snd-bcd2000
[    7.827419] scsi host7: usb-storage 6-2:1.0
[    7.851040] usbcore: registered new interface driver snd_usb_pod
[    7.924429] usbcore: registered new interface driver snd_usb_podhd
[    7.949755] usbcore: registered new interface driver snd_usb_toneport
[    7.974904] usbcore: registered new interface driver snd_usb_variax
[    8.001495] ipip: IPv4 and MPLS over IPv4 tunneling driver
[    8.026479] Initializing XFRM netlink socket
[    8.050936] NET: Registered PF_INET6 protocol family
[    8.076057] Segment Routing with IPv6
[    8.100278] In-situ OAM (IOAM) with IPv6
[    8.124614] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    8.149423] NET: Registered PF_PACKET protocol family
[    8.173796] NET: Registered PF_KEY protocol family
[    8.196669] Key type dns_resolver registered
[    8.219434] drmem: No dynamic reconfiguration memory found
[    8.242079] No cpufreq driver, powersavings modes disabled
[    8.264372] Using PA6T idle loop (spin)
[    8.286246] Loading compiled-in X.509 certificates
[    8.308478] Btrfs loaded, crc32c=crc32c-generic, zoned=no, fsverity=no
[    8.332960] cfg80211: Loading compiled-in X.509 certificates for 
regulatory database
[    8.356381] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    8.378632] platform regulatory.0: Direct firmware load for 
regulatory.db failed with error -2
[    8.401114] ALSA device list:
[    8.423353] cfg80211: failed to load regulatory.db
[    8.423367]   No soundcards found.
[    8.473902] EXT4-fs (sdb4): mounted filesystem with ordered data 
mode. Opts: (null). Quota mode: none.
[    8.498866] VFS: Mounted root (ext4 filesystem) readonly on device 8:20.
[    8.525149] devtmpfs: mounted
[    8.554942] Freeing unused kernel image (initmem) memory: 7428K
[    8.580600] Kernel memory protection not selected by kernel config.
[    8.606377] Run /sbin/init as init process
[    8.632072]   with arguments:
[    8.632075]     /sbin/init
[    8.632078]   with environment:
[    8.632080]     HOME=/
[    8.632082]     TERM=linux
[    8.757046] systemd[1]: System time before build time, advancing clock.
[    8.807918] systemd[1]: systemd 245.5-3 running in system mode. (+PAM 
+AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP 
+GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN 
+PCRE2 default-hierarchy=hybrid)
[    8.863795] systemd[1]: Detected architecture ppc64.
[    8.944790] scsi 7:0:0:0: Direct-Access     MITSUMI  USB UFDD 061M    
0.00 PQ: 0 ANSI: 0 CCS
[    8.945312] sd 7:0:0:0: Attached scsi generic sg4 type 0
[    9.040772] sd 7:0:0:0: [sdd] 2880 512-byte logical blocks: (1.47 
MB/1.41 MiB)
[    9.041272] systemd[1]: Set hostname to <Fienix>.
[    9.104777] sd 7:0:0:0: [sdd] Write Protect is off
[    9.130963] sd 7:0:0:0: [sdd] Mode Sense: 00 46 02 00
[    9.232814] sd 7:0:0:0: [sdd] No Caching mode page found
[    9.260401] sd 7:0:0:0: [sdd] Assuming drive cache: write through
[    9.631896] random: systemd: uninitialized urandom read (16 bytes read)
[    9.659591] systemd[1]: system-getty.slice: unit configures an IP 
firewall, but the local system does not support BPF/cgroup firewalling.
[    9.685758] systemd[1]: (This warning is only shown for the first 
unit using IP firewalling.)
[    9.712169] systemd[1]: Created slice system-getty.slice.
[    9.764653] random: systemd: uninitialized urandom read (16 bytes read)
[    9.789436] systemd[1]: Created slice system-modprobe.slice.
[    9.838997] random: systemd: uninitialized urandom read (16 bytes read)
[    9.862399] systemd[1]: Created slice User and Session Slice.
[    9.910425] systemd[1]: Started Dispatch Password Requests to Console 
Directory Watch.
[    9.959537] systemd[1]: Started Forward Password Requests to Wall 
Directory Watch.
[   10.009994] systemd[1]: Condition check resulted in Arbitrary 
Executable File Formats File System Automount Point being skipped.
[   10.034884]  sdd: sdd1
[   10.034944] systemd[1]: Reached target Local Encrypted Volumes.
[   10.108573] systemd[1]: Reached target User and Group Name Lookups.
[   10.160128] systemd[1]: Reached target Slices.
[   10.211492] systemd[1]: Reached target Swap.
[   10.224794] sd 7:0:0:0: [sdd] Attached SCSI removable disk
[   10.287818] systemd[1]: Listening on RPCbind Server Activation Socket.
[   10.340055] systemd[1]: Listening on Syslog Socket.
[   10.392885] systemd[1]: Listening on fsck to fsckd communication Socket.
[   10.446122] systemd[1]: Listening on initctl Compatibility Named Pipe.
[   10.518755] systemd[1]: Condition check resulted in Journal Audit 
Socket being skipped.
[   10.545084] systemd[1]: Listening on Journal Socket (/dev/log).
[   10.599772] systemd[1]: Listening on Journal Socket.
[   10.654584] systemd[1]: Listening on udev Control Socket.
[   10.709340] systemd[1]: Listening on udev Kernel Socket.
[   10.765834] systemd[1]: Mounting Huge Pages File System...
[   10.822232] systemd[1]: Mounting POSIX Message Queue File System...
[   10.878087] systemd[1]: Mounting Kernel Debug File System...
[   10.934031] systemd[1]: Mounting Kernel Trace File System...
[   10.992435] systemd[1]: Starting Create list of static device nodes 
for the current kernel...
[   11.046862] systemd[1]: Condition check resulted in Load Kernel 
Module drm being skipped.
[   11.075135] systemd[1]: Condition check resulted in Set Up Additional 
Binary Formats being skipped.
[   11.103037] systemd[1]: Starting File System Check on Root Device...
[   11.158532] systemd[1]: Starting Journal Service...
[   11.216555] systemd[1]: Starting Load Kernel Modules...
[   11.273883] systemd[1]: Starting udev Coldplug all Devices...
[   11.328936] systemd[1]: Mounted Huge Pages File System.
[   11.380144] systemd[1]: Mounted POSIX Message Queue File System.
[   11.442063] systemd[1]: Mounted Kernel Debug File System.
[   11.495459] systemd[1]: Mounted Kernel Trace File System.
[   11.546689] systemd[1]: Finished Create list of static device nodes 
for the current kernel.
[   11.602613] systemd[1]: Finished File System Check on Root Device.
[   11.654110] systemd[1]: Finished Load Kernel Modules.
[   11.705304] systemd[1]: Started Journal Service.
[   12.460319] random: crng init done
[   12.484063] random: 7 urandom warning(s) missed due to ratelimiting
[   16.628718] EXT4-fs (sdb4): re-mounted. Opts: errors=remount-ro. 
Quota mode: none.
[   16.704836] systemd-journald[680]: Received client request to flush 
runtime journal.
[   16.707532] systemd-journald[680]: File 
/var/log/journal/5e7ed5c6779c413ea5ee69ea7d714121/system.journal 
corrupted or uncleanly shut down, renaming and replacing.
[   17.949919] snd_hda_intel 0000:01:00.1: Force to snoop mode by module 
option
[   18.096439] snd_hda_intel 0000:05:14.2: Force to snoop mode by module 
option
[   18.310054] input: HDA ATI HDMI HDMI/DP,pcm=3 as 
/devices/pci0000:00/0000:00:10.0/0000:01:00.1/sound/card0/input4
[   18.344429] snd_bt87x 0000:06:06.1: bt87x0: Using board 1, analog, 
digital (rate 32000 Hz)
[   18.371025] 8139too 0000:06:05.0 enp6s5: renamed from eth1
[   18.405916] mc: Linux media interface: v0.10
[   18.533664] Bluetooth: Core ver 2.22
[   18.533724] NET: Registered PF_BLUETOOTH protocol family
[   18.533728] Bluetooth: HCI device and connection manager initialized
[   18.533746] Bluetooth: HCI socket layer initialized
[   18.533752] Bluetooth: L2CAP socket layer initialized
[   18.533769] Bluetooth: SCO socket layer initialized
[   18.633172] videodev: Linux video capture interface: v2.00
[   18.765542] pasemi_mac 0000:00:14.3 enp0s20f3: renamed from eth0
[   18.767270] snd_hda_codec_idt hdaudioC1D3: autoconfig for 
STAC92HD700: line_outs=4 (0xd/0xf/0x10/0x11/0x0) type:line
[   18.809554] snd_hda_codec_idt hdaudioC1D3:    speaker_outs=0 
(0x0/0x0/0x0/0x0/0x0)
[   18.831465] snd_hda_codec_idt hdaudioC1D3:    hp_outs=1 
(0xa/0x0/0x0/0x0/0x0)
[   18.853180] snd_hda_codec_idt hdaudioC1D3:    mono: mono_out=0x0
[   18.874639] snd_hda_codec_idt hdaudioC1D3:    dig-out=0x21/0x0
[   18.895764] snd_hda_codec_idt hdaudioC1D3:    inputs:
[   18.916794] snd_hda_codec_idt hdaudioC1D3:      Front Mic=0xb
[   18.937629] snd_hda_codec_idt hdaudioC1D3:      Rear Mic=0xe
[   18.958268] snd_hda_codec_idt hdaudioC1D3:      Line=0xc
[   18.978599] snd_hda_codec_idt hdaudioC1D3:      CD=0x12
[   19.017813] usbcore: registered new interface driver btusb
[   19.102053] Bluetooth: hci0: CSR: Unbranded CSR clone detected; 
adding workarounds and force-suspending once...
[   19.122586] Bluetooth: hci0: CSR: Failed to suspend the device for 
our Barrot 8041a02 receive-issue workaround
[   19.164360] input: HDA ATI SB Front Mic as 
/devices/pci0000:00/0000:00:11.0/0000:05:14.2/sound/card1/input5
[   19.371081] input: HDA ATI SB Rear Mic as 
/devices/pci0000:00/0000:00:11.0/0000:05:14.2/sound/card1/input6
[   19.534180] input: HDA ATI SB Line as 
/devices/pci0000:00/0000:00:11.0/0000:05:14.2/sound/card1/input7
[   19.686287] bttv: driver version 0.9.19 loaded
[   19.709247] bttv: using 8 buffers with 2080k (520 pages) each for capture
[   19.740670] input: HDA ATI SB Line Out Front as 
/devices/pci0000:00/0000:00:11.0/0000:05:14.2/sound/card1/input8
[   19.754750] bttv: Bt8xx card found (0)
[   19.789940] input: HDA ATI SB Line Out Surround as 
/devices/pci0000:00/0000:00:11.0/0000:05:14.2/sound/card1/input9
[   19.807143] bttv: 0: Bt878 (rev 17) at 0000:06:06.0, irq: 5, latency: 
255, mmio: 0xa0310000
[   19.839853] input: HDA ATI SB Line Out CLFE as 
/devices/pci0000:00/0000:00:11.0/0000:05:14.2/sound/card1/input10
[   19.864668] bttv: 0: detected: Hauppauge WinTV [card=10], PCI 
subsystem ID is 0070:13eb
[   19.887950] bttv: 0: using: Hauppauge (bt878) [card=10,autodetected]
[   19.897998] input: HDA ATI SB Line Out Side as 
/devices/pci0000:00/0000:00:11.0/0000:05:14.2/sound/card1/input11
[   19.917744] bttv: 0: Hauppauge/Voodoo msp34xx: reset line init [5]
[   19.978854] input: HDA ATI SB Front Headphone as 
/devices/pci0000:00/0000:00:11.0/0000:05:14.2/sound/card1/input12
[   20.036191] tveeprom: Hauppauge model 44804, rev D148, serial# 6430449
[   20.060037] tveeprom: tuner model is LG TP18PSB11D (idx 48, type 29)
[   20.083753] tveeprom: TV standards PAL(B/G) (eeprom 0x04)
[   20.107808] tveeprom: audio processor is None (idx 0)
[   20.131671] tveeprom: has no radio
[   20.155905] bttv: 0: Hauppauge eeprom indicates model#44804
[   20.178228] bttv: 0: tuner type=29
[   20.266849] bttv: 0: audio absent, no audio device found!
[   20.310887] tuner: 13-0061: Tuner -1 found with type(s) Radio TV.
[   20.345589] tuner-simple 13-0061: creating new instance
[   20.345599] tuner-simple 13-0061: type set to 29 (LG PAL_BG (TPI8PSB11D))
[   20.346821] bttv: 0: Setting PLL: 28636363 => 35468950 (needs up to 
100ms)
[   20.370626] bttv: PLL set ok
[   20.462363] bttv: 0: registered device video0
[   20.462754] bttv: 0: registered device vbi0
[   21.437740] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   21.437749] Bluetooth: BNEP filters: protocol multicast
[   21.437759] Bluetooth: BNEP socket layer initialized
[   21.802099] Bluetooth: hci0: expected 8706 bytes, got 36 bytes
[   23.902081] 8139too 0000:06:05.0 enp6s5: link down
[   26.152031] enp0s20f3: Link is up at 1000 Mbps, full duplex.
[   26.171163] IPv6: ADDRCONF(NETDEV_CHANGE): enp0s20f3: link becomes ready
[   30.290828] Bluetooth: RFCOMM TTY layer initialized
[   30.290851] Bluetooth: RFCOMM socket layer initialized
[   30.290866] Bluetooth: RFCOMM ver 1.11
[  103.076207] FAT-fs (sdc1): Volume was not properly unmounted. Some 
data may be corrupt. Please run fsck.
