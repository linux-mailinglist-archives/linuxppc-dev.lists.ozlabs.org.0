Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3AE2669EB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 23:12:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp7jn5rJ4zDqw6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 07:11:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp7gL5P00zDqfy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 07:09:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=G+4oRrpy; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4Bp7gL3lJwz8tVZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 07:09:50 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4Bp7gL35b9z9sVB; Sat, 12 Sep 2020 07:09:50 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=chunkeey@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=G+4oRrpy; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4Bp7gL0YGkz9sTR
 for <linuxppc-dev@ozlabs.org>; Sat, 12 Sep 2020 07:09:49 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id q13so15471993ejo.9
 for <linuxppc-dev@ozlabs.org>; Fri, 11 Sep 2020 14:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PW6gwlYrQ/xJZVS5FNz7Gn291YO1xYiazPQYuv0PJIg=;
 b=G+4oRrpy7gRtKijz7nt5srMuTxBp9f+vEefiMIe1AT+TK4aZ/BIEFj8PhgznoW4z63
 r3W6Plj29EVvSQawkW883cqzNvDR3LFABovod6T/VKpPYa006uQBTzse3c71+9PVNcIC
 67qwrLfcAbA03xW6tUOrAnXrayUCk88eYCFR9SiPEBJD69TG5/Tb/IfFQn2nuoSDERch
 f4Y3dvQ0FW4+wwQfuoNPO4MtRz2i88NzKgbESJGno3rHHId48usOn6Oxrimbmh530HTv
 1p7ajRbhzwhkW2omSaCqUy9W72dYwM2XNJXBOVDidt/dMaKaulxBRb2m8K82L3A6lBy3
 oG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PW6gwlYrQ/xJZVS5FNz7Gn291YO1xYiazPQYuv0PJIg=;
 b=ENW38Xse2egwEQYqHCDvIoNUYuiXJOngyedDP3DFMEEuhmJaitkRqoXuOjevsG/9df
 2cddCLdsUt9E2Ihqk5aowypM0m0F1DPtcdxJnRUZ/4cYCh449ekAd2mHk1aCZ32WkYP/
 ++O4sooW1k3txLc4Otn94znqB0RmCvdC7LXdcySudXXi2vcDGmTtFcgjPWBTExOo/z12
 9+56djXEzb+OVJIm+8OK61uTrKMHSADq+2EMLhZl3GME9+QnUYxiGJ7tNiTAo1N72/yk
 upPAMIQIQ0MtLSpNMXTj1k1PAq5sM2+Woj42Mph9Jc3zFW6LsMSaS+q+F4jul8U6ey2W
 eTIw==
X-Gm-Message-State: AOAM532IsVMao9f57G9jYVa4/ikkCw8oNmJdm+lTOFfa2aR8SdubSxDv
 /2GIcEDclXFxNj29KbINzaQ=
X-Google-Smtp-Source: ABdhPJwCoJaePEJl9mjXG2eltyOjIDRiURjsQEPhgmsa1KXcb4qyx44kaxThS8J6+r5H6ywDhbLWeA==
X-Received: by 2002:a17:906:1c4f:: with SMTP id
 l15mr3744630ejg.419.1599858585024; 
 Fri, 11 Sep 2020 14:09:45 -0700 (PDT)
Received: from debian64.daheim (p5b0d78be.dip0.t-ipconnect.de. [91.13.120.190])
 by smtp.gmail.com with ESMTPSA id cn21sm2620204edb.14.2020.09.11.14.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 14:09:44 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1])
 by debian64.daheim with esmtp (Exim 4.94)
 (envelope-from <chunkeey@gmail.com>)
 id 1kGqIY-001y1t-K3; Fri, 11 Sep 2020 23:09:34 +0200
Subject: Re: [PATCH] powerpc/boot/dts: Fix dtc "pciex" warnings
From: Christian Lamparter <chunkeey@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20200623130320.405852-1-mpe@ellerman.id.au>
 <d2652e63-b136-a805-fd6d-00584b64c772@gmail.com>
 <87mu20spxd.fsf@mpe.ellerman.id.au>
 <CAAd0S9Cc2M+JsqC+3DhLtaQEecweVX-toC2SxNAzNdogFeeTOw@mail.gmail.com>
Message-ID: <c141ab78-d28f-6682-6831-3278718aab4b@gmail.com>
Date: Fri, 11 Sep 2020 23:09:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAAd0S9Cc2M+JsqC+3DhLtaQEecweVX-toC2SxNAzNdogFeeTOw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@ozlabs.org, Chris Blake <chrisrblake93@gmail.com>,
 sfr@canb.auug.org.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On 2020-09-08 20:52, Christian Lamparter wrote:
> On Tue, Sep 8, 2020 at 9:12 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>> Christian Lamparter <chunkeey@gmail.com> writes:
>>> On 2020-06-23 15:03, Michael Ellerman wrote:
>>>> With CONFIG_OF_ALL_DTBS=y, as set by eg. allmodconfig, we see lots of
>>>> warnings about our dts files, such as:
>>>>
>>>>     arch/powerpc/boot/dts/glacier.dts:492.26-532.5:
>>>>     Warning (pci_bridge): /plb/pciex@d00000000: node name is not "pci"
>>>>     or "pcie"
>>>>
>>>
>>>
>>> Unfortunately yes. This patch will break uboot code in Meraki MX60(W) / MX60.
>>>
>>>   > https://github.com/riptidewave93/meraki-uboot/blob/mx60w-20180413/board/amcc/bluestone/bluestone.c#L1178
>>>
>>> | if (!pci_available()) {
>>> |     fdt_find_and_setprop(blob, "/plb/pciex@d00000000", "status",
>>> |                   "disabled", sizeof("disabled"), 1);
>>> | }
>>>
>>>
>>> Backstory: There are two version of the Meraki MX60. The MX60
>>> and the MX60W. The difference is that the MX60W has a populated
>>> mini-pcie slot on the PCB for a >W<ireless card.
>>>
>>> That said, this is not earth shattering.
>>
>> I'm happy to revert that hunk if you think any one is actually booting
>> mainline on those.
> 
> The MX60(W) or APM82181 in general?
> 
> The APM82181 devices run really well on the kernel 5.8. The APM82181
> had some bitrot and missing pieces. But I started at around 4.4 with
> upstreaming various bits and stuff. For proof, I can post a bootlog from
> my MyBook Live dev station running my mbl-debian on this weekend:
> <https://github.com/chunkeey/mbl-debian>.

Here is the MyBook Live's Single Bootlog for 5.9-rc4.

root@mbl-debian:~# dmesg
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] Linux version 5.9.0-rc4+ (root@debian64) (powerpc-linux-gnu-gcc (Debian 10.2.0-3) 10.2.0, GNU ld (GNU Binutils for Debian) 2.35) #1 Fri Sep 11 22:13:07 CEST 2020
[    0.000000] Using PowerPC 44x Platform machine description
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0x10000000
[    0.000000] dcache_bsize      = 0x20
[    0.000000] icache_bsize      = 0x20
[    0.000000] cpu_features      = 0x0000000000000120
[    0.000000]   possible        = 0x0000000040000120
[    0.000000]   always          = 0x0000000000000020
[    0.000000] cpu_user_features = 0x8c008000 0x00000000
[    0.000000] mmu_features      = 0x00000008
[    0.000000] -----------------------------------------------------
[    0.000000] Top of RAM: 0x10000000, Total RAM: 0x10000000
[    0.000000] Memory hole size: 0MB
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x000000000fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000000fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000000fffffff]
[    0.000000] On node 0 totalpages: 16384
[    0.000000]   Normal zone: 40 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 16384 pages, LIFO batch:3
[    0.000000] MMU: Allocated 1088 bytes of context maps for 255 contexts
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 16344
[    0.000000] Kernel command line: root=PARTUUID=25a9cfcc-6b0d-4ae4-abbf-e5e2e3889a40 rw console=ttyS0,115200
[    0.000000] Dentry cache hash table entries: 32768 (order: 3, 131072 bytes, linear)
[    0.000000] Inode-cache hash table entries: 16384 (order: 2, 65536 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 252528K/262144K available (5840K kernel code, 448K rwdata, 1824K rodata, 224K init, 312K bss, 9616K reserved, 0K cma-reserved)
[    0.000000] Kernel virtual memory layout:
[    0.000000]   * 0xffbdc000..0xffffc000  : fixmap
[    0.000000]   * 0xd1000000..0xffbdc000  : vmalloc & ioremap
[    0.000000] random: get_random_u32 called from cache_random_seq_create+0x68/0x128 with crng_init=0
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] UIC0 (32 IRQ sources) at DCR 0xc0
[    0.000000] UIC1 (32 IRQ sources) at DCR 0xd0
[    0.000000] UIC2 (32 IRQ sources) at DCR 0xe0
[    0.000000] UIC3 (32 IRQ sources) at DCR 0xf0
[    0.000000] time_init: decrementer frequency = 800.000008 MHz
[    0.000000] time_init: processor frequency   = 800.000008 MHz
[    0.000016] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0xb881274fa3, max_idle_ns: 440795210636 ns
[    0.008990] clocksource: timebase mult[1400000] shift[24] registered
[    0.014011] clockevent: decrementer mult[ccccccef] shift[32] cpu[0]
[    0.019133] Console: colour dummy device 80x25
[    0.022213] pid_max: default: 32768 minimum: 301
[    0.025920] Mount-cache hash table entries: 4096 (order: 0, 16384 bytes, linear)
[    0.031945] Mountpoint-cache hash table entries: 4096 (order: 0, 16384 bytes, linear)
[    0.040909] devtmpfs: initialized
[    0.045808] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.054182] futex hash table entries: 256 (order: -3, 3072 bytes, linear)
[    0.060719] NET: Registered protocol family 16
[    0.067099] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
[    0.072996] audit: initializing netlink subsys (disabled)
[    0.078210] thermal_sys: Registered thermal governor 'step_wise'
[    0.078219] thermal_sys: Registered thermal governor 'user_space'
[    0.082970] cpuidle: using governor ladder
[    0.090429] cpuidle: using governor menu
[    0.094588] 256k L2-cache enabled
[    0.096586] PCIE0: Port disabled via device-tree
[    0.100007] gpiochip_find_base: found new base at 480
[    0.104395] audit: type=2000 audit(0.040:1): state=initialized audit_enabled=0 res=1
[    0.113209] gpio gpiochip0: (/plb/opb/gpio@ef600b00): added GPIO chardev (254:0)
[    0.119316] gpio gpiochip0: registered GPIOs 480 to 511 on /plb/opb/gpio@ef600b00
[    0.125949] PCI: Probing PCI hardware
[    5.927343] vgaarb: loaded
[    5.929112] SCSI subsystem initialized
[    5.933393] libata version 3.00 loaded.
[    5.936123] usbcore: registered new interface driver usbfs
[    5.940272] usbcore: registered new interface driver hub
[    5.944233] usbcore: registered new device driver usb
[    5.952187] clocksource: Switched to clocksource timebase
[    5.956449] VFS: Disk quotas dquot_6.6.0
[    5.959041] VFS: Dquot-cache hash table entries: 4096 (order 0, 16384 bytes)
[    5.991157] NET: Registered protocol family 2
[    5.994695] tcp_listen_portaddr_hash hash table entries: 2048 (order: 0, 16384 bytes, linear)
[    6.001871] TCP established hash table entries: 4096 (order: 0, 16384 bytes, linear)
[    6.008246] TCP bind hash table entries: 4096 (order: 0, 16384 bytes, linear)
[    6.014029] TCP: Hash tables configured (established 4096 bind 4096)
[    6.019190] MPTCP token hash table entries: 2048 (order: 0, 24576 bytes, linear)
[    6.025300] UDP hash table entries: 1024 (order: 0, 16384 bytes, linear)
[    6.030653] UDP-Lite hash table entries: 1024 (order: 0, 16384 bytes, linear)
[    6.036615] NET: Registered protocol family 1
[    6.041688] RPC: Registered named UNIX socket transport module.
[    6.046236] RPC: Registered udp transport module.
[    6.049577] RPC: Registered tcp transport module.
[    6.052947] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    6.058052] NET: Registered protocol family 44
[    6.061166] PCI: CLS 0 bytes, default 32
[    6.085333] reg-fixed-voltage plb:opb:usb-regulator: GPIO lookup for consumer (null)
[    6.091686] reg-fixed-voltage plb:opb:usb-regulator: using device tree for GPIO lookup
[    6.098262] reg-fixed-voltage plb:opb:usb-regulator: No GPIO consumer (null) found
[    6.105841] reg-fixed-voltage plb:opb:sata1-regulator: GPIO lookup for consumer (null)
[    6.112364] reg-fixed-voltage plb:opb:sata1-regulator: using device tree for GPIO lookup
[    6.119106] reg-fixed-voltage plb:opb:sata1-regulator: No GPIO consumer (null) found
[    6.126852] reg-fixed-voltage plb:opb:sata0-regulator: GPIO lookup for consumer (null)
[    6.133376] reg-fixed-voltage plb:opb:sata0-regulator: using device tree for GPIO lookup
[    6.140118] reg-fixed-voltage plb:opb:sata0-regulator: No GPIO consumer (null) found
[    6.149872] dw_dmac 4bffd0800.dma: DesignWare DMA Controller, 2 channels
[    6.165651] Initialise system trusted keyrings
[    6.168752] Key type blacklist registered
[    6.172713] workingset: timestamp_bits=30 max_order=14 bucket_order=0
[    6.185449] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    6.350439] Key type asymmetric registered
[    6.353161] Asymmetric key parser 'x509' registered
[    6.356754] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 249)
[    6.362744] io scheduler mq-deadline registered
[    6.365932] io scheduler kyber registered
[    6.369230] gpiochip_find_base: found new base at 472
[    6.372932] gpio-473 (Enable Reset Button, disable NOR): hogged as output/low
[    6.379779] gpio gpiochip1: (4e0000000.gpio): added GPIO chardev (254:1)
[    6.385199] gpio gpiochip1: registered GPIOs 472 to 479 on 4e0000000.gpio
[    6.390720] gpiochip_find_base: found new base at 464
[    6.395145] gpio gpiochip2: (4e0100000.gpio): added GPIO chardev (254:2)
[    6.400555] gpio gpiochip2: registered GPIOs 464 to 471 on 4e0100000.gpio
[    6.408444] Serial: 8250/16550 driver, 2 ports, IRQ sharing enabled
[    6.415420] printk: console [ttyS0] disabled
[    6.418351] of_serial 4ef600300.serial: GPIO lookup for consumer rs485-term
[    6.423929] of_serial 4ef600300.serial: using device tree for GPIO lookup
[    6.429390] of_get_named_gpiod_flags: can't parse 'rs485-term-gpios' property of node '/plb/opb/serial@ef600300[0]'
[    6.438453] of_get_named_gpiod_flags: can't parse 'rs485-term-gpio' property of node '/plb/opb/serial@ef600300[0]'
[    6.447427] of_serial 4ef600300.serial: using lookup tables for GPIO lookup
[    6.453036] of_serial 4ef600300.serial: No GPIO consumer rs485-term found
[    6.458525] 4ef600300.serial: ttyS0 at MMIO 0x4ef600300 (irq = 32, base_baud = 462962) is a TI16750
[    6.466201] printk: console [ttyS0] enabled
[    6.471883] printk: bootconsole [udbg0] disabled
[    6.500228] brd: module loaded
[    6.514232] loop: module loaded
[    6.516963] sata-dwc 4bffd1000.sata: id 0, controller version 1.91
[    6.523635] scsi host0: sata-dwc
[    6.525992] ata1: SATA max UDMA/133 irq 39
[    6.529027] sata-dwc 4bffd1800.sata: id 0, controller version 1.91
[    6.536207] scsi host1: sata-dwc
[    6.538343] ata2: SATA max UDMA/133 irq 40
[    6.541630] platform physmap-flash.0: failed to claim resource 0: [mem 0x08000000-0x07ffffff]
[    6.549935] mdio_bus fixed-0: GPIO lookup for consumer reset
[    6.554301] mdio_bus fixed-0: using lookup tables for GPIO lookup
[    6.559081] mdio_bus fixed-0: No GPIO consumer reset found
[    6.563278] libphy: Fixed MDIO Bus: probed
[    6.566066] PPC 4xx OCP EMAC driver, version 3.54
[    6.570154] MAL v2 /plb/mcmal, 1 TX channels, 1 RX channels
[    6.574722] RGMII /plb/opb/emac-rgmii@ef601500 initialized with MDIO support
[    6.580630] TAH /plb/opb/emac-tah@ef601350 initialized
[    6.584789] /plb/opb/emac-rgmii@ef601500: input 0 in rgmii mode
[    6.730396] mdio_bus 4ef600c00.ethernet: GPIO lookup for consumer reset
[    6.735695] mdio_bus 4ef600c00.ethernet: using device tree for GPIO lookup
[    6.741293] of_get_named_gpiod_flags: parsed 'reset-gpios' property of node '/plb/opb/ethernet@ef600c00/mdio[0]' - status (0)
[    6.751283] libphy: emac_mdio: probed
[    6.761226] mdio_bus 4ef600c00.ethernet:01: GPIO lookup for consumer reset
[    6.766807] mdio_bus 4ef600c00.ethernet:01: using device tree for GPIO lookup
[    6.772660] of_get_named_gpiod_flags: can't parse 'reset-gpios' property of node '/plb/opb/ethernet@ef600c00/mdio/phy@1[0]'
[    6.782469] of_get_named_gpiod_flags: can't parse 'reset-gpio' property of node '/plb/opb/ethernet@ef600c00/mdio/phy@1[0]'
[    6.792186] mdio_bus 4ef600c00.ethernet:01: using lookup tables for GPIO lookup
[    6.798177] mdio_bus 4ef600c00.ethernet:01: No GPIO consumer reset found
[    6.806518] eth0: EMAC-0 /plb/opb/ethernet@ef600c00, MAC 00:90:a9:35:31:25
[    6.812091] eth0: found Broadcom BCM50610 PHY (0x01)
[    6.816240] dwc2 4bff80000.usbotg: mapped PA bff80000 to VA (ptrval)
[    6.821304] dwc2 4bff80000.usbotg: supply vusb_d not found, using dummy regulator
[    6.827610] dwc2 4bff80000.usbotg: supply vusb_a not found, using dummy regulator
[    6.833848] dwc2 4bff80000.usbotg: registering common handler for irq35
[    6.841266] usbcore: registered new interface driver usb-storage
[    6.846140] of_get_named_gpiod_flags: parsed 'gpios' property of node '/plb/opb/keys/reset-button[0]' - status (0)
[    6.855351] input: plb:opb:keys as /devices/platform/plb/plb:opb/plb:opb:keys/input/input0
[    6.862521] ata1: SATA link down (SStatus 0 SControl 300)
[    6.867654] i2c /dev entries driver
[    6.870052] IR NEC protocol handler initialized
[    6.873290] IR RC5(x/sz) protocol handler initialized
[    6.877028] IR RC6 protocol handler initialized
[    6.880242] IR JVC protocol handler initialized
[    6.883451] IR Sony protocol handler initialized
[    6.886756] IR SANYO protocol handler initialized
[    6.890143] IR Sharp protocol handler initialized
[    6.893530] IR MCE Keyboard/mouse protocol handler initialized
[    6.898040] IR XMP protocol handler initialized
[    6.903391] device-mapper: ioctl: 4.42.0-ioctl (2020-02-27) initialised: dm-devel@redhat.com
[    6.910678] of_get_named_gpiod_flags: parsed 'gpios' property of node '/plb/opb/leds/power-red[0]' - status (0)
[    6.919442] gpio-476 (?): no flags found for gpios
[    6.923065] of_get_named_gpiod_flags: parsed 'gpios' property of node '/plb/opb/leds/power-green[0]' - status (0)
[    6.932001] gpio-477 (?): no flags found for gpios
[    6.935587] of_get_named_gpiod_flags: parsed 'gpios' property of node '/plb/opb/leds/power-blue[0]' - status (0)
[    6.944433] gpio-478 (?): no flags found for gpios
[    6.948135] ledtrig-cpu: registered to indicate activity on CPUs
[    7.069005] ata2: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    7.126707] ata2.00: ATA-7: ST3808110AS, 3.AAE, max UDMA/133
[    7.131071] ata2.00: 156301488 sectors, multi 0: LBA48 NCQ (depth 1/32)
[    7.193344] ata2.00: configured for UDMA/133
[    7.196475] blk_queue_segment_boundary: set to minimum 3fff
[    7.200991] scsi 1:0:0:0: Direct-Access     ATA      ST3808110AS      E    PQ: 0 ANSI: 5
[    7.250704] sd 1:0:0:0: [sda] 156301488 512-byte logical blocks: (80.0 GB/74.5 GiB)
[    7.257636] sd 1:0:0:0: [sda] Write Protect is off
[    7.261147] sd 1:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    7.265069] sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    7.300288] GPT:Primary header thinks Alt. header is not at the end of the disk.
[    7.306386] GPT:8380415 != 156301487
[    7.308658] GPT:Alternate GPT header not at the end of the disk.
[    7.313349] GPT:8380415 != 156301487
[    7.315615] GPT: Use GNU Parted to correct GPT errors.
[    7.319511]  sda: sda1 sda2 sda3
[    7.323342] sd 1:0:0:0: [sda] Attached SCSI disk
[    8.291046] random: fast init done
[   10.926506] alg: No test for stdrng (crypto4xx_rng)
[   10.930969] usbcore: registered new interface driver usbhid
[   10.935247] usbhid: USB HID core driver
[   10.937991] Initializing XFRM netlink socket
[   10.941514] NET: Registered protocol family 10
[   10.948675] Segment Routing with IPv6
[   10.951112] NET: Registered protocol family 17
[   10.954288] NET: Registered protocol family 15
[   10.957606] 8021q: 802.1Q VLAN Support v1.8
[   10.960602] drmem: No dynamic reconfiguration memory found
[   10.965094] registered taskstats version 1
[   10.967885] Loading compiled-in X.509 certificates
[   10.971451] Key type ._fscrypt registered
[   10.974160] Key type .fscrypt registered
[   10.976768] Key type fscrypt-provisioning registered
[   10.980859] reg-fixed-voltage plb:opb:usb-regulator: GPIO lookup for consumer (null)
[   10.987298] reg-fixed-voltage plb:opb:usb-regulator: using device tree for GPIO lookup
[   10.993930] of_get_named_gpiod_flags: parsed 'gpios' property of node '/plb/opb/usb-regulator[0]' - status (0)
[   11.002906] reg-fixed-voltage plb:opb:sata1-regulator: GPIO lookup for consumer (null)
[   11.009516] reg-fixed-voltage plb:opb:sata1-regulator: using device tree for GPIO lookup
[   11.016311] of_get_named_gpiod_flags: parsed 'gpios' property of node '/plb/opb/sata1-regulator[0]' - status (0)
[   11.025450] reg-fixed-voltage plb:opb:sata0-regulator: GPIO lookup for consumer (null)
[   11.032058] reg-fixed-voltage plb:opb:sata0-regulator: using device tree for GPIO lookup
[   11.038852] of_get_named_gpiod_flags: parsed 'gpios' property of node '/plb/opb/sata0-regulator[0]' - status (0)
[   11.048060] dwc2 4bff80000.usbotg: mapped PA bff80000 to VA (ptrval)
[   11.053139] dwc2 4bff80000.usbotg: supply vusb_d not found, using dummy regulator
[   11.059428] dwc2 4bff80000.usbotg: supply vusb_a not found, using dummy regulator
[   11.065671] dwc2 4bff80000.usbotg: registering common handler for irq35
[   11.072892] dwc2 4bff80000.usbotg: Bad value for GSNPSID: 0x00000000
[   11.078824] md: Waiting for all devices to be available before autodetect
[   11.084315] md: If you don't use raid, use raid=noautodetect
[   11.088657] md: Autodetecting RAID arrays.
[   11.091432] md: autorun ...
[   11.092924] md: ... autorun DONE.
[   11.140266] EXT4-fs (sda3): mounted filesystem with ordered data mode. Opts: (null)
[   11.146665] VFS: Mounted root (ext4 filesystem) on device 8:3.
[   11.160049] devtmpfs: mounted
[   11.162700] Freeing unused kernel memory: 224K
[   11.165920] Run /sbin/init as init process
[   11.168719]   with arguments:
[   11.170377]     /sbin/init
[   11.171775]   with environment:
[   11.173613]     HOME=/
[   11.174662]     TERM=linux
[   12.215915] systemd[1]: System time before build time, advancing clock.
[   12.479770] systemd[1]: systemd 246.4-1 running in system mode. (+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +ZSTD +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=hybrid)
[   12.501058] systemd[1]: Detected architecture ppc.
[   12.557673] systemd[1]: Set hostname to <mbl-debian>.

---

root@mbl-debian:~# cat /proc/cpuinfo
processor       : 0
cpu             : APM821XX
clock           : 800.000008MHz
revision        : 28.131 (pvr 12c4 1c83)
bogomips        : 1600.00

timebase        : 800000008
platform        : PowerPC 44x Platform
model           : MyBook Live
Memory          : 256 MB

root@mbl-debian:~# cat /proc/iomem
00000000-0fffffff : System RAM
4bffd0800-4bffd0bff : 4bffd0800.dma dma@bffd0800
4bffd1000-4bffd17ff : 4bffd1000.sata sata@bffd1000
4bffd1800-4bffd1fff : 4bffd1800.sata sata@bffd1800
4e0000000-4e0000000 : 4e0000000.gpio dat
4e0100000-4e0100000 : 4e0100000.gpio dat
4ef600300-4ef600307 : serial

root@mbl-debian:~# cat /proc/interrupts
            CPU0
  18:          0       UIC  11 Edge      L2C
  20:       2597       UIC   6 Level     MAL TX EOB
  21:      23062       UIC   7 Level     MAL RX EOB
  22:          0       UIC   3 Level     MAL SERR
  23:          0       UIC   4 Level     MAL TX DE
  24:          0       UIC   5 Level     MAL RX DE
  29:        735       UIC  29 Level     crypto4xx
  32:        538       UIC   1 Level     ttyS0
  33:          0       UIC  16 Level     EMAC
  38:       2765       UIC  25 Level     dw:dmac-1
  39:          0       UIC  26 Level     sata-dwc[4bffd1000.sata]
  40:       5680       UIC  27 Level     sata-dwc[4bffd1800.sata]
LOC:      25755   Local timer interrupts for timer event device
BCT:          0   Broadcast timer interrupts for timer event device
LOC:          4   Local timer interrupts for others
SPU:          0   Spurious interrupts
PMI:          0   Performance monitoring interrupts
MCE:          0   Machine check exceptions
NMI:          0   System Reset interrupts

root@mbl-debian:~# cat /etc/debian_version
bullseye/sid
