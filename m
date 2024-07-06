Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4069290A9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 06:16:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=XPTajlGc;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=vuWMRX2u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGHBd23wsz3dSj
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 14:16:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=XPTajlGc;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=vuWMRX2u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.82; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGH9r4qxkz3cVq
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2024 14:15:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1720239314; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=VtfVt2cOF+rA3+I9OBu+gCPinh+sZB3kUWgR/NCGWzofkmmH7aQdNfPWwbknDC3KJf
    SPJ1romQsuhSFpY288KTMwCDxhGqvkR0g9pagUCYt4+DshKKCVDUSHcA0TKcIOTbpEl5
    N4lGB4L/TR5DDMLhnTcdYAxy3iLUlZmPWIpPwxWpaoEhr7MsPfb7xeIBSuUCWlUVT5fZ
    dInGr9W5Z1cX1Y3tRz+a/T9+zHBrlz5oIt6rMLyzO8zlONb/9XebIULa0otqoE8NyYfp
    1u86pA6W/HvzQDnDejWepfmstTdF1Un7rQ+MeLkkTo7hdeZeLnRBR0dvRgsQD06MA6PO
    +RvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1720239314;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=ivDInmxi0LVR9fj9t7hLEhw2Clxv8+4/zyBawJOnrIc=;
    b=lHJwghh9D7oRhmAh4VS5ssAWxjYworIrCFh1jzGg6TMycnUxAOd2o89/T0l/VK4SGs
    r1NmNP8RWmnUqv83YcrVAKuJtMaCr5O+rx9CidEzKWc39eCKoXR7fxA8kXn05Z27jbEh
    zKIaTbXZ99PP3oChy0hFbSRin2xWiv3av8p5U6A53sQ/3eTERawBlzGE4hK1EZyY275G
    2EcLneZB5vREtw19eW3cgaaNBe3A8Y1dec4PCA0rn6JP4V8o9jMUi4vlPHdIR12oSyfx
    1oMx7uQ8lMj1UXQ6tar+Xlr5ycPdkKolXHgrj18JylYA2UAectNuKzLVLasULV/4BVXQ
    T7Qw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1720239314;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=ivDInmxi0LVR9fj9t7hLEhw2Clxv8+4/zyBawJOnrIc=;
    b=XPTajlGcBVZvuX2Y9SSW879fSLeDkOmRPG97iG8dtV8+GvSXy7R8eMkOC7TZFJhPnW
    +g2rfsMw47xK5xvoK8nRZQbUI3r/8xFg4vjkpGuz6btxSUSoQ84gxl4/9bvXE5jtOvNN
    o3MV3X9owq5vqa+Ymfhk/SZAnYJRJgIRljVRpKKBWygeVNOhLtirrYdC20A780fKvZge
    EH4TSArIn9j0XjY3ioUcIdWB0BsZwFmIUVF11UJwbtz9OGqpb85h/5MKEUdNLjwz6l7q
    OXVUu3gi4omJS+fl72mddmGQs3ZMneDUY2at+KVcaJzdcX5noTc+GrA8IJ/xKyS68kHv
    SkKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1720239314;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=ivDInmxi0LVR9fj9t7hLEhw2Clxv8+4/zyBawJOnrIc=;
    b=vuWMRX2uuvnavhinsbiCio62jAcZALX/XSM2VpeA3BZ8ui3J92rRMr6a7Bm0rklXJ5
    i0G+L6/47RqWSAN1u+AQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedR43JxzbX9aBXGVEW0JCZz/ysRKUXcHeKga07FTVA=="
Received: from [IPV6:2a01:599:80b:5b09:42f:765a:b8c7:96ff]
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id e083890664FDXuo
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 6 Jul 2024 06:15:13 +0200 (CEST)
Message-ID: <aeaa9b78-5853-473e-b985-b10241e88e0d@xenosoft.de>
Date: Sat, 6 Jul 2024 06:15:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives
 after the of/irq updates 2024-05-29
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, Marc Zyngier <maz@kernel.org>
References: <3ab66fab-c3f2-4bed-a04d-a10c57dcdd9b@xenosoft.de>
 <86zfqzhgys.wl-maz@kernel.org>
 <ccf14173-9818-44ef-8610-db2900c67ae8@xenosoft.de>
 <874j95jrur.fsf@mail.lhotse>
 <3baff554-e8f6-42b0-b931-207175a4d8fd@xenosoft.de>
 <dfc7ec00-5216-4590-9347-ee10cd1e8380@xenosoft.de>
 <87o77ciqj8.fsf@mail.lhotse>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <87o77ciqj8.fsf@mail.lhotse>
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
Cc: apatel@ventanamicro.com, Rob Herring <robh@kernel.org>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mad skateman <madskateman@gmail.com>, Matthew Leaman <matthew@a-eon.biz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Types corrected and html removed

On 05.07.24 03:19, Michael Ellerman wrote:
 >
 >
 > Right, I had some debug code that I removed before posting.
 >
 > This version should compile :}
 >
 > cheers
 >
 > diff --git a/arch/powerpc/kernel/prom_init.c 
b/arch/powerpc/kernel/prom_init.c
 > index fbb68fc28ed3..965d58c54fab 100644
 > --- a/arch/powerpc/kernel/prom_init.c
 > +++ b/arch/powerpc/kernel/prom_init.c
 > @@ -3123,6 +3123,7 @@ static void __init fixup_device_tree_pasemi(void)
 >      u32 interrupts[2], parent, rval, val = 0;
 >      char *name, *pci_name;
 >      phandle iob, node;
 > +    int rc;
 >
 >      /* Find the root pci node */
 >      name = "/pxp@0,e0000000";
 > @@ -3138,6 +3139,14 @@ static void __init fixup_device_tree_pasemi(void)
 >
 >      prom_setprop(iob, name, "interrupt-controller", &val, 0);
 >
 > +    prom_printf("nemo: deleting interrupt-map properties\n");
 > +    rc = call_prom("interpret", 1, 1,
 > +              " s\" /pxp@0,e0000000\" find-device"
 > +              " s\" interrupt-map\" delete-property"
 > +              " s\" interrupt-map-mask\" delete-property"
 > +              " device-end");
 > +    prom_printf("nemo: interpret returned %d\n", rc);
 > +
 >      pci_name = "/pxp@0,e0000000/pci@11";
 >      node = call_prom("finddevice", 1, 1, ADDR(pci_name));
 >      parent = ADDR(iob);
Michael,

Thank you for the patch! Unfortunately the kernel doesn't boot.

See: https://forum.hyperion-entertainment.com/viewtopic.php?p=58629#p58629

Our tester has tested the second irq patch again and the kernel boots. 
We will test it again to be sure that it really works. ;-)

Second irq patch:

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 462375b293e47..c94203ce65bb3 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -81,7 +81,8 @@ EXPORT_SYMBOL_GPL(of_irq_find_parent);
  /*
   * These interrupt controllers abuse interrupt-map for unspeakable
   * reasons and rely on the core code to *ignore* it (the drivers do
- * their own parsing of the property).
+ * their own parsing of the property). The PAsemi entry covers a
+ * non-sensical interrupt-map that is better left ignored.
   *
   * If you think of adding to the list for something *new*, think
   * again. There is a high chance that you will be sent back to the
@@ -95,6 +96,7 @@ static const char * const of_irq_imap_abusers[] = {
      "fsl,ls1043a-extirq",
      "fsl,ls1088a-extirq",
      "renesas,rza1-irqc",
+    "pasemi,rootbus",
      NULL,
  };

@@ -293,20 +295,8 @@ int of_irq_parse_raw(const __be32 *addr, struct 
of_phandle_args *out_irq)
              imaplen -= imap - oldimap;
              pr_debug(" -> imaplen=%d\n", imaplen);
          }
-        if (!match) {
-            if (intc) {
-                /*
-                 * The PASEMI Nemo is a known offender, so
-                 * let's only warn for anyone else.
-                 */
-                WARN(!IS_ENABLED(CONFIG_PPC_PASEMI),
-                     "%pOF interrupt-map failed, using 
interrupt-controller\n",
-                     ipar);
-                return 0;
-            }
-
+        if (!match)
              goto fail;
-        }

          /*
           * Successfully parsed an interrupt-map translation; copy new

-----

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
[    0.000000] Linux version 6.10.0-rc6-powerpc64-smp (christian@lx-cce) 
(powerpc-linux-gnu-gcc (Debian 9.5.0-1) 9.5.0, GNU ld (GNU Binutils for 
Debian) 2.42) #1 SMP Thu Jul  4 18:40:38 CEST 2024
[    0.000000] IOBMAP L2 allocated at: (____ptrval____)
[    0.000000] ioremap() called early from 
.iommu_init_early_pasemi+0xec/0x260. Use early_ioremap() instead
[    0.000000] Hardware name: pasemi,nemo PA6T 0x900102 A-EON Amigaone X1000
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
[    0.000000] phys_mem_size     = 0x100000000
[    0.000000] dcache_bsize      = 0x40
[    0.000000] icache_bsize      = 0x40
[    0.000000] cpu_features      = 0x0000010000401182
[    0.000000]   possible        = 0x001ffbebffffb18f
[    0.000000]   always          = 0x0000000000000180
[    0.000000] cpu_user_features = 0xdc000802 0x00000000
[    0.000000] mmu_features      = 0x6e000001
[    0.000000] firmware_features = 0x0000000000000000
[    0.000000] vmalloc start     = 0xc0003d0000000000
[    0.000000] IO start          = 0xc0003e0000000000
[    0.000000] vmemmap start     = 0xc0003f0000000000
[    0.000000] hash-mmu: ppc64_pft_size    = 0x0
[    0.000000] hash-mmu: htab_hash_mask    = 0x7ffff
[    0.000000] -----------------------------------------------------
[    0.000000] ioremap() called early from .pas_setup_arch+0x3c/0x58. 
Use early_ioremap() instead
[    0.000000] barrier-nospec: using ORI speculation barrier
[    0.000000] barrier-nospec: patched 427 locations
[    0.000000] Top of RAM: 0x180000000, Total RAM: 0x100000000
[    0.000000] Memory hole size: 2048MB
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x000000017fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000007fffffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x000000017fffffff]
[    0.000000] Initmem setup node 0 [mem 
0x0000000000000000-0x000000017fffffff]
[    0.000000] percpu: Embedded 27 pages/cpu s70952 r0 d39640 u524288
[    0.000000] pcpu-alloc: s70952 r0 d39640 u524288 alloc=1*1048576
[    0.000000] pcpu-alloc: [0] 0 1
[    0.000000] Kernel command line: console=tty0 root=/dev/sdb3

[    0.000000] Dentry cache hash table entries: 524288 (order: 10, 
4194304 bytes, linear)
[    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152 
bytes, linear)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 
1048576
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 3986488K/4194304K available (23556K kernel code, 
3248K rwdata, 10600K rodata, 9476K init, 671K bss, 207816K reserved, 0K 
cma-reserved)
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] ftrace: allocating 57793 entries in 340 pages
[    0.000000] ftrace: allocated 339 pages with 5 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000]     Rude variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay 
is 100 jiffies.
[    0.000000] RCU Tasks Rude: Setting shift to 1 and lim to 1 
rcu_task_cb_adjust=1.
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] mpic: Setting up MPIC "PASEMI-OPIC" version 1.3 at 
fc000000, max 2 CPUs
[    0.000000] mpic: ISU size: 1024, shift: 10, mask: 3ff
[    0.000000] mpic: Initializing for 1024 sources
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on 
contention.
[    0.000000] time_init: decrementer frequency = 66.666666 MHz
[    0.000000] time_init: processor frequency   = 1800.000000 MHz
[    0.000002] clocksource: timebase: mask: 0xffffffffffffffff 
max_cycles: 0xf6018975a, max_idle_ns: 440795204712 ns
[    0.000008] clocksource: timebase mult[f000003] shift[24] registered
[    0.000019] clockevent: decrementer mult[1111110e] shift[32] cpu[0]
[    0.000124] Console: colour dummy device 80x25
[    0.000133] printk: legacy console [tty0] enabled
[    0.000433] pid_max: default: 32768 minimum: 301
[    0.000512] Mount-cache hash table entries: 8192 (order: 4, 65536 
bytes, linear)
[    0.000546] Mountpoint-cache hash table entries: 8192 (order: 4, 
65536 bytes, linear)
[    0.001050] mpic: requesting IPIs...
[    0.001701] rcu: Hierarchical SRCU implementation.
[    0.001714] rcu:     Max phase no-delay instances is 400.
[    0.002004] smp: Bringing up secondary CPUs ...
[    0.002426] smp: Brought up 1 node, 2 CPUs
[    0.003018] devtmpfs: initialized
[    0.006765] Found PA-PXP PCI host bridge.
[    0.006777] PCI host bridge /pxp@0,e0000000 (primary) ranges:
[    0.006810]   IO 0x00000000fc800000..0x00000000fcffffff -> 
0x0000000000000000
[    0.006828]  MEM 0x0000000080000000..0x00000000e00fffff -> 
0x0000000080000000
[    0.006844]  MEM 0x00000000fd800000..0x00000000fd800fff -> 
0x00000000fd800000
[    0.006858]  MEM 0x0000080000000000..0x00000bffffffffff -> 
0x0000080000000000
[    0.006879] no ISA IO ranges or unexpected isa range, mapping 64k
[    0.006890] ISA bridge (early) is /pxp@0,e0000000/io-bridge@0
[    0.007042] i8259 legacy interrupt controller initialized
[    0.007132] clocksource: jiffies: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.007155] futex hash table entries: 512 (order: 4, 65536 bytes, linear)
[    0.007510] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.008112] thermal_sys: Registered thermal governor 'step_wise'
[    0.012169] HugeTLB: registered 16.0 MiB page size, pre-allocated 0 pages
[    0.012190] HugeTLB: 0 KiB vmemmap can be freed for a 16.0 MiB page
[    0.029149] raid6: altivecx8 gen()  4693 MB/s
[    0.046201] raid6: altivecx4 gen()  4694 MB/s
[    0.063251] raid6: altivecx2 gen()  4284 MB/s
[    0.080302] raid6: altivecx1 gen()  3852 MB/s
[    0.097360] raid6: int64x8  gen()  2046 MB/s
[    0.114411] raid6: int64x4  gen()  2548 MB/s
[    0.131458] raid6: int64x2  gen()  2269 MB/s
[    0.148518] raid6: int64x1  gen()  1602 MB/s
[    0.148527] raid6: using algorithm altivecx4 gen() 4694 MB/s
[    0.148536] raid6: using intx1 recovery algorithm
[    0.148821] SCSI subsystem initialized
[    0.149676] libata version 3.00 loaded.
[    0.149792] usbcore: registered new interface driver usbfs
[    0.149822] usbcore: registered new interface driver hub
[    0.149849] usbcore: registered new device driver usb
[    0.149974] EDAC MC: Ver: 3.0.0
[    0.150205] Advanced Linux Sound Architecture Driver Initialized.
[    0.150687] PCI: Probing PCI hardware
[    0.152010] PCI host bridge to bus 0000:00
[    0.152027] pci_bus 0000:00: root bus resource [io 0x80000-0x87ffff] 
(bus address [0x0000-0x7fffff])
[    0.152044] pci_bus 0000:00: root bus resource [mem 
0x80000000-0xe00fffff]
[    0.152056] pci_bus 0000:00: root bus resource [mem 
0xfd800000-0xfd800fff]
[    0.152068] pci_bus 0000:00: root bus resource [mem 
0x80000000000-0xbffffffffff]
[    0.152081] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.152092] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
[    0.152127] NEMO SB600 IOB base e0000000
[    0.152166] pci 0000:00:00.0: [1959:a001] type 00 class 0x060000 
conventional PCI endpoint
[    0.152291] ISA bridge PCI attached: 0000:00:00.0
[    0.152340] pci 0000:00:01.0: [1959:a009] type 00 class 0x058000 
conventional PCI endpoint
[    0.152527] pci 0000:00:03.0: [1959:a00c] type 00 class 0x080080 
conventional PCI endpoint
[    0.152679] pci 0000:00:04.0: [1959:a00a] type 00 class 0x050000 
conventional PCI endpoint
[    0.152834] pci 0000:00:05.0: [1959:a00a] type 00 class 0x050000 
conventional PCI endpoint
[    0.153041] pci 0000:00:08.0: [1959:a000] type 00 class 0x0b2000 
conventional PCI endpoint
[    0.153185] pci 0000:00:09.0: [1959:a000] type 00 class 0x0b2000 
conventional PCI endpoint
[    0.153478] pci 0000:00:10.0: [1959:a002] type 01 class 0x060400 PCIe 
Root Port
[    0.153510] pci 0000:00:10.0: PCI bridge to [bus 01]
[    0.153524] pci 0000:00:10.0:   bridge window [io 0x82000-0x82fff]
[    0.153538] pci 0000:00:10.0:   bridge window [mem 0x90000000-0xa00fffff]
[    0.153559] pci 0000:00:10.0: enabling Extended Tags
[    0.153606] pci 0000:00:10.0: PME# supported from D0 D3hot D3cold
[    0.153768] pci 0000:00:10.1: [1959:a002] type 01 class 0x060400 PCIe 
Root Port
[    0.153800] pci 0000:00:10.1: PCI bridge to [bus 02]
[    0.153823] pci 0000:00:10.1: enabling Extended Tags
[    0.153868] pci 0000:00:10.1: PME# supported from D0 D3hot D3cold
[    0.154006] pci 0000:00:10.2: [1959:a002] type 01 class 0x060400 PCIe 
Root Port
[    0.154037] pci 0000:00:10.2: PCI bridge to [bus 03]
[    0.154060] pci 0000:00:10.2: enabling Extended Tags
[    0.154105] pci 0000:00:10.2: PME# supported from D0 D3hot D3cold
[    0.154242] pci 0000:00:10.3: [1959:a002] type 01 class 0x060400 PCIe 
Root Port
[    0.154274] pci 0000:00:10.3: PCI bridge to [bus 04]
[    0.154297] pci 0000:00:10.3: enabling Extended Tags
[    0.154341] pci 0000:00:10.3: PME# supported from D0 D3hot D3cold
[    0.154479] pci 0000:00:11.0: [1959:a002] type 01 class 0x060400 PCIe 
Root Port
[    0.154510] pci 0000:00:11.0: PCI bridge to [bus 05-06]
[    0.154523] pci 0000:00:11.0:   bridge window [io 0x80000-0x83fff]
[    0.154536] pci 0000:00:11.0:   bridge window [mem 0xa0100000-0xa03fffff]
[    0.154557] pci 0000:00:11.0: enabling Extended Tags
[    0.154601] pci 0000:00:11.0: PME# supported from D0 D3hot D3cold
[    0.154774] pci 0000:00:11.1: [1959:a002] type 01 class 0x060400 PCIe 
Root Port
[    0.154806] pci 0000:00:11.1: PCI bridge to [bus 07]
[    0.154830] pci 0000:00:11.1: enabling Extended Tags
[    0.154874] pci 0000:00:11.1: PME# supported from D0 D3hot D3cold
[    0.155014] pci 0000:00:11.2: [1959:a002] type 01 class 0x060400 PCIe 
Root Port
[    0.155045] pci 0000:00:11.2: PCI bridge to [bus 08]
[    0.155068] pci 0000:00:11.2: enabling Extended Tags
[    0.155112] pci 0000:00:11.2: PME# supported from D0 D3hot D3cold
[    0.155250] pci 0000:00:11.3: [1959:a002] type 01 class 0x060400 PCIe 
Root Port
[    0.155281] pci 0000:00:11.3: PCI bridge to [bus 09]
[    0.155304] pci 0000:00:11.3: enabling Extended Tags
[    0.155348] pci 0000:00:11.3: PME# supported from D0 D3hot D3cold
[    0.155549] pci 0000:00:14.0: [1959:a005] type 00 class 0x020000 
conventional PCI endpoint
[    0.155692] pci 0000:00:14.1: [1959:a005] type 00 class 0x020000 
conventional PCI endpoint
[    0.155829] pci 0000:00:14.2: [1959:a005] type 00 class 0x020000 
conventional PCI endpoint
[    0.155952] pci 0000:00:14.3: [1959:a005] type 00 class 0x020000 
conventional PCI endpoint
[    0.156104] pci 0000:00:15.0: [1959:a006] type 00 class 0x020000 
conventional PCI endpoint
[    0.156249] pci 0000:00:15.1: [1959:a006] type 00 class 0x020000 
conventional PCI endpoint
[    0.156486] pci 0000:00:1a.0: [1959:a007] type 00 class 0x0801ff 
conventional PCI endpoint
[    0.156647] pci 0000:00:1b.0: [1959:a00b] type 00 class 0x088000 
conventional PCI endpoint
[    0.156803] pci 0000:00:1c.0: [1959:a003] type 00 class 0x0c0500 
conventional PCI endpoint
[    0.156829] pci 0000:00:1c.0: BAR 0 [io  0x870200-0x87023f]
[    0.156959] pci 0000:00:1c.1: [1959:a003] type 00 class 0x0c0500 
conventional PCI endpoint
[    0.156984] pci 0000:00:1c.1: BAR 0 [io  0x870240-0x87027f]
[    0.157114] pci 0000:00:1c.2: [1959:a003] type 00 class 0x0c0500 
conventional PCI endpoint
[    0.157139] pci 0000:00:1c.2: BAR 0 [io  0x870280-0x8702bf]
[    0.157274] pci 0000:00:1d.0: [1959:a004] type 00 class 0x070003 
conventional PCI endpoint
[    0.157299] pci 0000:00:1d.0: BAR 0 [io  0x8703f8-0x8703ff]
[    0.157426] pci 0000:00:1d.1: [1959:a004] type 00 class 0x070003 
conventional PCI endpoint
[    0.157451] pci 0000:00:1d.1: BAR 0 [io  0x8702f8-0x8702ff]
[    0.157601] pci 0000:00:1e.0: [1959:a008] type 00 class 0x0601ff 
conventional PCI endpoint
[    0.157626] pci 0000:00:1e.0: BAR 0 [io  0x870400-0x8704ff]
[    0.157640] pci 0000:00:1e.0: BAR 1 [io  0x870500-0x8705ff]
[    0.196680] IOMMU table initialized, virtual merging enabled
[    0.196833] pci 0000:01:00.0: [1002:6610] type 00 class 0x030000 PCIe 
Legacy Endpoint
[    0.196866] pci 0000:01:00.0: BAR 0 [mem 0x90000000-0x9fffffff 64bit 
pref]
[    0.196888] pci 0000:01:00.0: BAR 2 [mem 0xa0000000-0xa003ffff 64bit]
[    0.196904] pci 0000:01:00.0: BAR 4 [io  0x82000-0x820ff]
[    0.196925] pci 0000:01:00.0: ROM [mem 0xa0040000-0xa005ffff pref]
[    0.196942] pci 0000:01:00.0: enabling Extended Tags
[    0.197016] pci 0000:01:00.0: supports D1 D2
[    0.197026] pci 0000:01:00.0: PME# supported from D1 D2 D3hot
[    0.197062] pci 0000:01:00.0: 16.000 Gb/s available PCIe bandwidth, 
limited by 2.5 GT/s PCIe x8 link at 0000:00:10.0 (capable of 63.008 Gb/s 
with 8.0 GT/s PCIe x8 link)
[    0.197250] pci 0000:01:00.1: [1002:aab0] type 00 class 0x040300 PCIe 
Legacy Endpoint
[    0.197280] pci 0000:01:00.1: BAR 0 [mem 0xa0060000-0xa0063fff 64bit]
[    0.197323] pci 0000:01:00.1: enabling Extended Tags
[    0.197381] pci 0000:01:00.1: supports D1 D2
[    0.200661] pci 0000:00:10.0: PCI bridge to [bus 01]
[    0.201510] pci 0000:00:10.1: PCI bridge to [bus 02]
[    0.202343] pci 0000:00:10.2: PCI bridge to [bus 03]
[    0.203172] pci 0000:00:10.3: PCI bridge to [bus 04]
[    0.203715] pci 0000:05:12.0: [1002:4380] type 00 class 0x01018f 
conventional PCI endpoint
[    0.203748] pci 0000:05:12.0: BAR 0 [io  0x81040-0x81047]
[    0.203766] pci 0000:05:12.0: BAR 1 [io  0x8105c-0x8105f]
[    0.203784] pci 0000:05:12.0: BAR 2 [io  0x81048-0x8104f]
[    0.203801] pci 0000:05:12.0: BAR 3 [io  0x81058-0x8105b]
[    0.203818] pci 0000:05:12.0: BAR 4 [io  0x81010-0x8101f]
[    0.203836] pci 0000:05:12.0: BAR 5 [mem 0xa0209000-0xa02093ff]
[    0.203867] pci 0000:05:12.0: set SATA to AHCI mode
[    0.204038] pci 0000:05:13.0: [1002:4387] type 00 class 0x0c0310 
conventional PCI endpoint
[    0.204070] pci 0000:05:13.0: BAR 0 [mem 0xa0207000-0xa0207fff]
[    0.204238] pci 0000:05:13.1: [1002:4388] type 00 class 0x0c0310 
conventional PCI endpoint
[    0.204268] pci 0000:05:13.1: BAR 0 [mem 0xa0208000-0xa0208fff]
[    0.204435] pci 0000:05:13.2: [1002:4389] type 00 class 0x0c0310 
conventional PCI endpoint
[    0.204466] pci 0000:05:13.2: BAR 0 [mem 0xa0206000-0xa0206fff]
[    0.204633] pci 0000:05:13.3: [1002:438a] type 00 class 0x0c0310 
conventional PCI endpoint
[    0.204665] pci 0000:05:13.3: BAR 0 [mem 0xa0204000-0xa0204fff]
[    0.204832] pci 0000:05:13.4: [1002:438b] type 00 class 0x0c0310 
conventional PCI endpoint
[    0.204863] pci 0000:05:13.4: BAR 0 [mem 0xa0205000-0xa0205fff]
[    0.205048] pci 0000:05:13.5: [1002:4386] type 00 class 0x0c0320 
conventional PCI endpoint
[    0.205079] pci 0000:05:13.5: BAR 0 [mem 0xa0209800-0xa02098ff]
[    0.205171] pci 0000:05:13.5: supports D1 D2
[    0.205181] pci 0000:05:13.5: PME# supported from D0 D1 D2 D3hot
[    0.205311] pci 0000:05:14.0: [1002:4385] type 00 class 0x0c0500 
conventional PCI endpoint
[    0.205341] pci 0000:05:14.0: BAR 0 [io  0x81020-0x8102f]
[    0.205358] pci 0000:05:14.0: BAR 1 [mem 0xa0209400-0xa02097ff]
[    0.205522] pci 0000:05:14.1: [1002:438c] type 00 class 0x010183 
conventional PCI endpoint
[    0.205553] pci 0000:05:14.1: BAR 0 [io  0x81030-0x81037]
[    0.205571] pci 0000:05:14.1: BAR 1 [io  0x81054-0x81057]
[    0.205589] pci 0000:05:14.1: BAR 2 [io  0x81038-0x8103f]
[    0.205606] pci 0000:05:14.1: BAR 3 [io  0x81050-0x81053]
[    0.205623] pci 0000:05:14.1: BAR 4 [io  0x81000-0x8100f]
[    0.205652] pci 0000:05:14.1: BAR 2 [io  0x80170-0x80177]: legacy IDE 
quirk
[    0.205663] pci 0000:05:14.1: BAR 3 [io  0x80376]: legacy IDE quirk
[    0.205792] pci 0000:05:14.2: [1002:4383] type 00 class 0x040300 
conventional PCI endpoint
[    0.205827] pci 0000:05:14.2: BAR 0 [mem 0xa0200000-0xa0203fff 64bit]
[    0.205906] pci 0000:05:14.2: PME# supported from D0 D3hot D3cold
[    0.206039] pci 0000:05:14.3: [1002:438d] type 00 class 0x060100 
conventional PCI endpoint
[    0.206230] pci 0000:05:14.4: [1002:4384] type 01 class 0x060400 
conventional PCI bridge
[    0.206276] pci 0000:05:14.4: PCI bridge to [bus 06]
[    0.206291] pci 0000:05:14.4:   bridge window [io 0x83000-0x83fff]
[    0.206305] pci 0000:05:14.4:   bridge window [mem 0xa0300000-0xa03fffff]
[    0.206701] pci 0000:00:11.0: PCI bridge to [bus 05-06]
[    0.206737] pci_bus 0000:06: extended config space not accessible
[    0.206961] pci 0000:06:06.0: [10ec:8139] type 00 class 0x020000 
conventional PCI endpoint
[    0.206998] pci 0000:06:06.0: BAR 0 [io  0x83000-0x830ff]
[    0.207019] pci 0000:06:06.0: BAR 1 [mem 0xa0300000-0xa03000ff]
[    0.207796] pci 0000:05:14.4: PCI bridge to [bus 06]
[    0.208643] pci 0000:00:11.1: PCI bridge to [bus 07]
[    0.209478] pci 0000:00:11.2: PCI bridge to [bus 08]
[    0.210312] pci 0000:00:11.3: PCI bridge to [bus 09]
[    0.210361] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 09
[    0.210537] PCI 0000:00 Cannot reserve Legacy IO [io 0x80000-0x80fff]
[    0.210552] pci 0000:00:10.0: bridge window [mem 
0x00100000-0x000fffff 64bit pref] to [bus 01] add_size 200000 add_align 
100000
[    0.210581] pci 0000:00:11.0: bridge window [mem 
0x00100000-0x000fffff 64bit pref] to [bus 05-06] add_size 200000 
add_align 100000
[    0.210601] pci 0000:00:11.1: bridge window [io  0x1000-0x0fff] to 
[bus 07] add_size 1000
[    0.210616] pci 0000:00:11.1: bridge window [mem 
0x00100000-0x000fffff 64bit pref] to [bus 07] add_size 200000 add_align 
100000
[    0.210634] pci 0000:00:11.1: bridge window [mem 
0x00100000-0x000fffff] to [bus 07] add_size 200000 add_align 100000
[    0.210651] pci 0000:00:11.2: bridge window [io  0x1000-0x0fff] to 
[bus 08] add_size 1000
[    0.210665] pci 0000:00:11.2: bridge window [mem 
0x00100000-0x000fffff 64bit pref] to [bus 08] add_size 200000 add_align 
100000
[    0.210683] pci 0000:00:11.2: bridge window [mem 
0x00100000-0x000fffff] to [bus 08] add_size 200000 add_align 100000
[    0.210701] pci 0000:00:11.3: bridge window [io  0x1000-0x0fff] to 
[bus 09] add_size 1000
[    0.210715] pci 0000:00:11.3: bridge window [mem 
0x00100000-0x000fffff 64bit pref] to [bus 09] add_size 200000 add_align 
100000
[    0.210733] pci 0000:00:11.3: bridge window [mem 
0x00100000-0x000fffff] to [bus 09] add_size 200000 add_align 100000
[    0.210774] pci 0000:00:10.0: bridge window [mem 
0x80000000000-0x800001fffff 64bit pref]: assigned
[    0.210794] pci 0000:00:11.0: bridge window [mem 
0x80000200000-0x800003fffff 64bit pref]: assigned
[    0.210809] pci 0000:00:11.1: bridge window [mem 
0x80000000-0x801fffff]: assigned
[    0.210823] pci 0000:00:11.1: bridge window [mem 
0x80000400000-0x800005fffff 64bit pref]: assigned
[    0.210837] pci 0000:00:11.2: bridge window [mem 
0x80200000-0x803fffff]: assigned
[    0.210851] pci 0000:00:11.2: bridge window [mem 
0x80000600000-0x800007fffff 64bit pref]: assigned
[    0.210866] pci 0000:00:11.3: bridge window [mem 
0x80400000-0x805fffff]: assigned
[    0.210879] pci 0000:00:11.3: bridge window [mem 
0x80000800000-0x800009fffff 64bit pref]: assigned
[    0.210894] pci 0000:00:11.1: bridge window [io 0x84000-0x84fff]: 
assigned
[    0.210906] pci 0000:00:11.2: bridge window [io 0x85000-0x85fff]: 
assigned
[    0.210918] pci 0000:00:11.3: bridge window [io 0x86000-0x86fff]: 
assigned
[    0.210938] pci 0000:00:10.0: PCI bridge to [bus 01]
[    0.210950] pci 0000:00:10.0:   bridge window [io 0x82000-0x82fff]
[    0.210963] pci 0000:00:10.0:   bridge window [mem 0x90000000-0xa00fffff]
[    0.210976] pci 0000:00:10.0:   bridge window [mem 
0x80000000000-0x800001fffff 64bit pref]
[    0.210991] pci 0000:00:10.1: PCI bridge to [bus 02]
[    0.211004] pci 0000:00:10.2: PCI bridge to [bus 03]
[    0.211025] pci 0000:00:10.3: PCI bridge to [bus 04]
[    0.211043] pci 0000:05:14.4: PCI bridge to [bus 06]
[    0.211055] pci 0000:05:14.4:   bridge window [io 0x83000-0x83fff]
[    0.211069] pci 0000:05:14.4:   bridge window [mem 0xa0300000-0xa03fffff]
[    0.211086] pci 0000:00:11.0: PCI bridge to [bus 05-06]
[    0.211097] pci 0000:00:11.0:   bridge window [io 0x80000-0x83fff]
[    0.211109] pci 0000:00:11.0:   bridge window [mem 0xa0100000-0xa03fffff]
[    0.211122] pci 0000:00:11.0:   bridge window [mem 
0x80000200000-0x800003fffff 64bit pref]
[    0.211136] pci 0000:00:11.1: PCI bridge to [bus 07]
[    0.211147] pci 0000:00:11.1:   bridge window [io 0x84000-0x84fff]
[    0.211159] pci 0000:00:11.1:   bridge window [mem 0x80000000-0x801fffff]
[    0.211172] pci 0000:00:11.1:   bridge window [mem 
0x80000400000-0x800005fffff 64bit pref]
[    0.211186] pci 0000:00:11.2: PCI bridge to [bus 08]
[    0.211197] pci 0000:00:11.2:   bridge window [io 0x85000-0x85fff]
[    0.211209] pci 0000:00:11.2:   bridge window [mem 0x80200000-0x803fffff]
[    0.211221] pci 0000:00:11.2:   bridge window [mem 
0x80000600000-0x800007fffff 64bit pref]
[    0.211236] pci 0000:00:11.3: PCI bridge to [bus 09]
[    0.211247] pci 0000:00:11.3:   bridge window [io 0x86000-0x86fff]
[    0.211259] pci 0000:00:11.3:   bridge window [mem 0x80400000-0x805fffff]
[    0.211271] pci 0000:00:11.3:   bridge window [mem 
0x80000800000-0x800009fffff 64bit pref]
[    0.211289] pci_bus 0000:00: resource 4 [io  0x80000-0x87ffff]
[    0.211301] pci_bus 0000:00: resource 5 [mem 0x80000000-0xe00fffff]
[    0.211312] pci_bus 0000:00: resource 6 [mem 0xfd800000-0xfd800fff]
[    0.211324] pci_bus 0000:00: resource 7 [mem 0x80000000000-0xbffffffffff]
[    0.211336] pci_bus 0000:01: resource 0 [io  0x82000-0x82fff]
[    0.211347] pci_bus 0000:01: resource 1 [mem 0x90000000-0xa00fffff]
[    0.211358] pci_bus 0000:01: resource 2 [mem 
0x80000000000-0x800001fffff 64bit pref]
[    0.211372] pci_bus 0000:05: resource 0 [io  0x80000-0x83fff]
[    0.211383] pci_bus 0000:05: resource 1 [mem 0xa0100000-0xa03fffff]
[    0.211394] pci_bus 0000:05: resource 2 [mem 
0x80000200000-0x800003fffff 64bit pref]
[    0.211407] pci_bus 0000:06: resource 0 [io  0x83000-0x83fff]
[    0.211418] pci_bus 0000:06: resource 1 [mem 0xa0300000-0xa03fffff]
[    0.211430] pci_bus 0000:07: resource 0 [io  0x84000-0x84fff]
[    0.211441] pci_bus 0000:07: resource 1 [mem 0x80000000-0x801fffff]
[    0.211452] pci_bus 0000:07: resource 2 [mem 
0x80000400000-0x800005fffff 64bit pref]
[    0.211465] pci_bus 0000:08: resource 0 [io  0x85000-0x85fff]
[    0.211476] pci_bus 0000:08: resource 1 [mem 0x80200000-0x803fffff]
[    0.211487] pci_bus 0000:08: resource 2 [mem 
0x80000600000-0x800007fffff 64bit pref]
[    0.211500] pci_bus 0000:09: resource 0 [io  0x86000-0x86fff]
[    0.211511] pci_bus 0000:09: resource 1 [mem 0x80400000-0x805fffff]
[    0.211522] pci_bus 0000:09: resource 2 [mem 
0x80000800000-0x800009fffff 64bit pref]
[    0.212326] PCI: Probing PCI hardware done
[    0.212640] clocksource: Switched to clocksource timebase
[    0.212834] VFS: Disk quotas dquot_6.6.0
[    0.212857] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 
bytes)
[    0.217709] NET: Registered PF_INET protocol family
[    0.217984] IP idents hash table entries: 65536 (order: 7, 524288 
bytes, linear)
[    0.220335] tcp_listen_portaddr_hash hash table entries: 2048 (order: 
3, 32768 bytes, linear)
[    0.220370] Table-perturb hash table entries: 65536 (order: 6, 262144 
bytes, linear)
[    0.220385] TCP established hash table entries: 32768 (order: 6, 
262144 bytes, linear)
[    0.220536] TCP bind hash table entries: 32768 (order: 8, 1048576 
bytes, linear)
[    0.220964] TCP: Hash tables configured (established 32768 bind 32768)
[    0.221043] UDP hash table entries: 2048 (order: 4, 65536 bytes, linear)
[    0.221100] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes, 
linear)
[    0.221224] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.221512] RPC: Registered named UNIX socket transport module.
[    0.221526] RPC: Registered udp transport module.
[    0.221534] RPC: Registered tcp transport module.
[    0.221541] RPC: Registered tcp-with-tls transport module.
[    0.221549] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.222901] pci 0000:01:00.1: D0 power state depends on 0000:01:00.0
[    0.222928] pci 0000:05:13.0: avoiding MSI to work around a hardware 
defect
[    0.222990] pci 0000:05:13.1: avoiding MSI to work around a hardware 
defect
[    0.223052] pci 0000:05:13.2: avoiding MSI to work around a hardware 
defect
[    0.223092] pci 0000:05:13.3: avoiding MSI to work around a hardware 
defect
[    0.223130] pci 0000:05:13.4: avoiding MSI to work around a hardware 
defect
[    0.223169] pci 0000:05:13.5: avoiding MSI to work around a hardware 
defect
[    0.223930] PCI: CLS 64 bytes, default 128
[    0.224939] OF: /localbus@f0000000/cf@1000000: could not find phandle 14
[    0.224964] OF: /localbus@f0000000/cf@1000000: could not find phandle 1
[    0.224984] OF: /localbus@f0000000/cf@1000000: could not find phandle 10
[    0.225003] OF: /localbus@f0000000/cf@1000000: could not find phandle 11
[    0.230249] Initialise system trusted keyrings
[    0.230838] workingset: timestamp_bits=62 max_order=20 bucket_order=0
[    0.231160] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.231458] NFS: Registering the id_resolver key type
[    0.231482] Key type id_resolver registered
[    0.231490] Key type id_legacy registered
[    0.231508] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.231518] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver 
Registering...
[    0.232072] Key type cifs.idmap registered
[    0.232322] ntfs3: Read-only LZX/Xpress compression included
[    0.232469] fuse: init (API version 7.40)
[    0.232806] SGI XFS with ACLs, security attributes, realtime, scrub, 
repair, quota, fatal assert, debug enabled
[    0.233363] 9p: Installing v9fs 9p2000 file system support
[    0.270938] xor: measuring software checksum speed
[    0.273665]    8regs           :  3637 MB/sec
[    0.277000]    8regs_prefetch  :  2960 MB/sec
[    0.279713]    32regs          :  3642 MB/sec
[    0.282783]    32regs_prefetch :  3215 MB/sec
[    0.284367]    altivec         :  6277 MB/sec
[    0.284377] xor: using function: altivec (6277 MB/sec)
[    0.284387] Key type asymmetric registered
[    0.284396] Asymmetric key parser 'x509' registered
[    0.284490] Block layer SCSI generic (bsg) driver version 0.4 loaded 
(major 251)
[    0.284506] io scheduler mq-deadline registered
[    0.284514] io scheduler kyber registered
[    0.284537] io scheduler bfq registered
[    0.288387] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.290646] serial8250.0: ttyS0 at I/O 0x8703f8 (irq = 73, base_baud 
= 8333333) is a 16550A
[    0.291247] serial8250.0: ttyS1 at I/O 0x8702f8 (irq = 74, base_baud 
= 8333333) is a 16550A
[    0.292684] 0000:00:1d.0: ttyS0 at I/O 0x8703f8 (irq = 73, base_baud 
= 8333333) is a 16550A
[    0.293786] 0000:00:1d.1: ttyS1 at I/O 0x8702f8 (irq = 74, base_baud 
= 8333333) is a 16550A
[    0.294218] Registering PA Semi RNG
[    0.294310] random: crng init done
[    0.294446] Linux agpgart interface v0.103
[    0.294682] [drm] radeon kernel modesetting enabled.
[    0.295191] [drm] initializing kernel modesetting (OLAND 
0x1002:0x6610 0x174B:0xE269 0x87).
[    0.623657] ATOM BIOS: C66201
[    0.623798] radeon 0000:01:00.0: VRAM: 2048M 0x0000000000000000 - 
0x000000007FFFFFFF (2048M used)
[    0.623818] radeon 0000:01:00.0: GTT: 2048M 0x0000000080000000 - 
0x00000000FFFFFFFF
[    0.623830] [drm] Detected VRAM RAM=2048M, BAR=256M
[    0.623839] [drm] RAM width 128bits DDR
[    0.623848] radeon 0000:01:00.0: dma_iommu_get_required_mask: 
returning bypass mask 0x1ffffffff
[    0.624129] [drm] radeon: 2048M of VRAM memory ready
[    0.624143] [drm] radeon: 2048M of GTT memory ready.
[    0.624168] [drm] Loading oland Microcode
[    0.624205] [drm] Internal thermal controller with fan control
[    0.637729] [drm] radeon: dpm initialized
[    0.637783] [drm] GART: num cpu pages 524288, num gpu pages 524288
[    0.684298] [drm] PCIE GART of 2048M enabled (table at 
0x0000000000165000).
[    0.684481] radeon 0000:01:00.0: WB enabled
[    0.684495] radeon 0000:01:00.0: fence driver on ring 0 use gpu addr 
0x0000000080000c00
[    0.684509] radeon 0000:01:00.0: fence driver on ring 1 use gpu addr 
0x0000000080000c04
[    0.684521] radeon 0000:01:00.0: fence driver on ring 2 use gpu addr 
0x0000000080000c08
[    0.684533] radeon 0000:01:00.0: fence driver on ring 3 use gpu addr 
0x0000000080000c0c
[    0.684545] radeon 0000:01:00.0: fence driver on ring 4 use gpu addr 
0x0000000080000c10
[    0.697872] radeon 0000:01:00.0: fence driver on ring 5 use gpu addr 
0x0000000000075a18
[    0.698037] radeon 0000:01:00.0: radeon: MSI limited to 32-bit
[    0.698096] [drm] radeon: irq initialized.
[    0.806549] [drm] ring test on 0 succeeded in 1 usecs
[    0.806577] [drm] ring test on 1 succeeded in 1 usecs
[    0.806590] [drm] ring test on 2 succeeded in 1 usecs
[    0.806607] [drm] ring test on 3 succeeded in 3 usecs
[    0.806636] [drm] ring test on 4 succeeded in 2 usecs
[    0.982143] [drm] ring test on 5 succeeded in 2 usecs
[    0.982160] [drm] UVD initialized successfully.
[    0.982671] [drm] ib test on ring 0 succeeded in 0 usecs
[    0.982721] [drm] ib test on ring 1 succeeded in 0 usecs
[    0.982762] [drm] ib test on ring 2 succeeded in 0 usecs
[    0.982804] [drm] ib test on ring 3 succeeded in 0 usecs
[    0.982842] [drm] ib test on ring 4 succeeded in 0 usecs
[    2.145654] [drm:.uvd_v1_0_ib_test] *ERROR* radeon: fence wait timed out.
[    2.145683] [drm:.radeon_ib_ring_tests] *ERROR* radeon: failed 
testing IB on ring 5 (-110).
[    2.146366] [drm] Radeon Display Connectors
[    2.146378] [drm] Connector 0:
[    2.146385] [drm]   HDMI-A-1
[    2.146391] [drm]   HPD1
[    2.146397] [drm]   DDC: 0x6540 0x6540 0x6544 0x6544 0x6548 0x6548 
0x654c 0x654c
[    2.146409] [drm]   Encoders:
[    2.146416] [drm]     DFP1: INTERNAL_UNIPHY
[    2.146423] [drm] Connector 1:
[    2.146429] [drm]   DVI-D-1
[    2.146435] [drm]   HPD2
[    2.146441] [drm]   DDC: 0x6530 0x6530 0x6534 0x6534 0x6538 0x6538 
0x653c 0x653c
[    2.146453] [drm]   Encoders:
[    2.146459] [drm]     DFP2: INTERNAL_UNIPHY
[    2.146466] [drm] Connector 2:
[    2.146472] [drm]   VGA-1
[    2.146478] [drm]   DDC: 0x65c0 0x65c0 0x65c4 0x65c4 0x65c8 0x65c8 
0x65cc 0x65cc
[    2.146490] [drm]   Encoders:
[    2.146496] [drm]     CRT1: INTERNAL_KLDSCP_DAC1
[    2.148153] [drm] Initialized radeon 2.50.0 20080528 for 0000:01:00.0 
on minor 0
[    2.297319] [drm] fb mappable at 0x90571000
[    2.297333] [drm] vram apper at 0x90000000
[    2.297341] [drm] size 8294400
[    2.297348] [drm] fb depth is 24
[    2.297354] [drm]    pitch is 7680
[    2.536227] Console: switching to colour frame buffer device 240x67
[    2.644391] radeon 0000:01:00.0: [drm] fb0: radeondrmfb frame buffer 
device
[    2.652019] loop: module loaded
[    2.652279] mpt3sas version 48.100.00.00 loaded
[    2.654293] ahci 0000:05:12.0: version 3.0
[    2.654348] ahci 0000:05:12.0: controller can't do 64bit DMA, forcing 
32bit
[    2.654856] ahci 0000:05:12.0: AHCI vers 0001.0100, 32 command slots, 
3 Gbps, SATA mode
[    2.655351] ahci 0000:05:12.0: 4/4 ports implemented (port mask 0xf)
[    2.655729] ahci 0000:05:12.0: flags: ncq sntf ilck pm led clo pmp 
pio slum part ccc
[    2.658031] scsi host0: ahci
[    2.658571] scsi host1: ahci
[    2.659111] scsi host2: ahci
[    2.659668] scsi host3: ahci
[    2.659959] ata1: SATA max UDMA/133 abar m1024@0xa0209000 port 
0xa0209100 irq 9 lpm-pol 0
[    2.660466] ata2: SATA max UDMA/133 abar m1024@0xa0209000 port 
0xa0209180 irq 9 lpm-pol 0
[    2.660976] ata3: SATA max UDMA/133 abar m1024@0xa0209000 port 
0xa0209200 irq 9 lpm-pol 0
[    2.661477] ata4: SATA max UDMA/133 abar m1024@0xa0209000 port 
0xa0209280 irq 9 lpm-pol 0
[    2.662983] scsi host4: pata_atiixp
[    2.663771] scsi host5: pata_atiixp
[    2.664126] ata5: PATA max UDMA/100 cmd 0x81030 ctl 0x81054 bmdma 
0x81000 irq 9 lpm-pol 0
[    2.664645] ata6: DUMMY
[    2.667948] PA Semi PWRficient DMA library initialized (20 tx, 64 rx 
channels)
[    2.677439] eth0: PA Semi GMAC: intf 5, hw addr 02:00:e0:0a:30:00
[    2.677897] pasemi_mac 0000:00:15.0: no mac address in device tree, 
not configuring
[    2.678604] 8139cp: 8139cp: 10/100 PCI Ethernet driver v1.3 (Mar 22, 
2004)
[    2.679181] 8139cp 0000:06:06.0: This (id 10ec:8139 rev 10) is not an 
8139C+ compatible chip, use 8139too
[    2.680449] 8139too: 8139too Fast Ethernet driver 0.9.28
[    2.681910] 8139too 0000:06:06.0 eth1: RealTek RTL8139 at 
0x000000007555485d, 00:00:21:2b:86:a8, IRQ 5
[    2.682731] PPP generic driver version 2.4.2
[    2.683128] PPP BSD Compression module registered
[    2.683397] PPP Deflate Compression module registered
[    2.683707] NET: Registered PF_PPPOX protocol family
[    2.684727] electra-cf f0000000.cf: at mem 0xf0000000 io 0xf1000000 
irq 18
[    2.685611] ehci-pci 0000:05:13.5: EHCI Host Controller
[    2.686286] ehci-pci 0000:05:13.5: new USB bus registered, assigned 
bus number 1
[    2.686771] ehci-pci 0000:05:13.5: applying AMD SB600/SB700 USB 
freeze workaround
[    2.687238] ehci-pci 0000:05:13.5: debug port 1
[    2.687520] ehci-pci 0000:05:13.5: irq 12, io mem 0xa0209800
[    2.694634] ehci-pci 0000:05:13.5: USB 2.0 started, EHCI 1.00
[    2.710045] usb usb1: New USB device found, idVendor=1d6b, 
idProduct=0002, bcdDevice= 6.10
[    2.726179] usb usb1: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    2.743349] usb usb1: Product: EHCI Host Controller
[    2.760648] usb usb1: Manufacturer: Linux 6.10.0-rc6-powerpc64-smp 
ehci_hcd
[    2.778095] usb usb1: SerialNumber: 0000:05:13.5
[    2.795661] hub 1-0:1.0: USB hub found
[    2.813002] hub 1-0:1.0: 10 ports detected
[    2.830843] ohci-pci 0000:05:13.0: OHCI PCI host controller
[    2.848491] ohci-pci 0000:05:13.0: new USB bus registered, assigned 
bus number 2
[    2.866673] ohci-pci 0000:05:13.0: irq 9, io mem 0xa0207000
[    2.939714] usb usb2: New USB device found, idVendor=1d6b, 
idProduct=0001, bcdDevice= 6.10
[    2.957769] usb usb2: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    2.968738] ata3: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    2.975421] usb usb2: Product: OHCI PCI host controller
[    2.993387] ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    3.010474] usb usb2: Manufacturer: Linux 6.10.0-rc6-powerpc64-smp 
ohci_hcd
[    3.028705] ata4: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    3.045878] usb usb2: SerialNumber: 0000:05:13.0
[    3.064346] ata3.00: ATA-8: SAMSUNG HD103SJ, 1AJ100E5, max UDMA/133
[    3.084056] hub 2-0:1.0: USB hub found
[    3.100071] ata2.00: ATAPI: HL-DT-ST BDDVDRW CH10LS20, 1.00, max UDMA/133
[    3.136397] ata2.00: SB600 AHCI: limiting to 255 sectors per cmd
[    3.141654] hub 2-0:1.0: 2 ports detected
[    3.164658] ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    3.174815] ohci-pci 0000:05:13.1: OHCI PCI host controller
[    3.213110] ata4.00: ATA-9: WDC WDS480G2G0A-00JH30, UG510000, max 
UDMA/133
[    3.213119] ata4.00: 937721856 sectors, multi 1: LBA48 NCQ (depth 32)
[    3.231457] ohci-pci 0000:05:13.1: new USB bus registered, assigned 
bus number 3
[    3.250647] ata3.00: 1953525168 sectors, multi 16: LBA48 NCQ (depth 
32), AA
[    3.270692] ohci-pci 0000:05:13.1: irq 10, io mem 0xa0208000
[    3.288574] ata3.00: SB600 AHCI: limiting to 255 sectors per cmd
[    3.327401] ata1.00: ATAPI: HL-DT-ST BD-RE  GGW-H20L, YL05, max UDMA/133
[    3.327413] ata1.00: SB600 AHCI: limiting to 255 sectors per cmd
[    3.367163] ata2.00: SB600 AHCI: limiting to 255 sectors per cmd
[    3.372723] usb usb3: New USB device found, idVendor=1d6b, 
idProduct=0001, bcdDevice= 6.10
[    3.385812] ata2.00: configured for UDMA/133
[    3.406270] usb usb3: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    3.406277] usb usb3: Product: OHCI PCI host controller
[    3.406282] usb usb3: Manufacturer: Linux 6.10.0-rc6-powerpc64-smp 
ohci_hcd
[    3.406286] usb usb3: SerialNumber: 0000:05:13.1
[    3.432856] hub 3-0:1.0: USB hub found
[    3.447282] ata4.00: Features: Dev-Sleep
[    3.473651] hub 3-0:1.0: 2 ports detected
[    3.488138] ata4.00: SB600 AHCI: limiting to 255 sectors per cmd
[    3.545922] ohci-pci 0000:05:13.2: OHCI PCI host controller
[    3.558758] ata3.00: SB600 AHCI: limiting to 255 sectors per cmd
[    3.586769] ohci-pci 0000:05:13.2: new USB bus registered, assigned 
bus number 4
[    3.590022] ata3.00: configured for UDMA/133
[    3.634677] ohci-pci 0000:05:13.2: irq 11, io mem 0xa0206000
[    3.649433] usb 2-1: new full-speed USB device number 2 using ohci-pci
[    3.673768] ata1.00: SB600 AHCI: limiting to 255 sectors per cmd
[    3.728963] ata1.00: configured for UDMA/133
[    3.752833] usb usb4: New USB device found, idVendor=1d6b, 
idProduct=0001, bcdDevice= 6.10
[    3.773607] usb usb4: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    3.773641] ata4.00: SB600 AHCI: limiting to 255 sectors per cmd
[    3.792761] usb usb4: Product: OHCI PCI host controller
[    3.812980] ata4.00: configured for UDMA/133
[    3.821472] scsi 0:0:0:0: CD-ROM            HL-DT-ST BD-RE GGW-H20L  
YL05 PQ: 0 ANSI: 5
[    3.832663] usb usb4: Manufacturer: Linux 6.10.0-rc6-powerpc64-smp 
ohci_hcd
[    3.894809] usb usb4: SerialNumber: 0000:05:13.2
[    3.916308] hub 4-0:1.0: USB hub found
[    3.938692] hub 4-0:1.0: 2 ports detected
[    3.961095] ohci-pci 0000:05:13.3: OHCI PCI host controller
[    3.983471] ohci-pci 0000:05:13.3: new USB bus registered, assigned 
bus number 5
[    4.005594] ohci-pci 0000:05:13.3: irq 10, io mem 0xa0204000
[    4.027424] sr 0:0:0:0: [sr0] scsi3-mmc drive: 94x/94x writer dvd-ram 
cd/rw xa/form2 cdda tray
[    4.027431] cdrom: Uniform CD-ROM driver Revision: 3.20
[    4.074683] usb 2-1: New USB device found, idVendor=05ac, 
idProduct=1002, bcdDevice= 1.22
[    4.096344] usb 2-1: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[    4.118027] usb 2-1: Product: Hub in Apple Extended USB Keyboard
[    4.127768] usb usb5: New USB device found, idVendor=1d6b, 
idProduct=0001, bcdDevice= 6.10
[    4.138422] usb 2-1: Manufacturer: Mitsumi Electric
[    4.159891] usb usb5: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    4.203134] usb usb5: Product: OHCI PCI host controller
[    4.205801] hub 2-1:1.0: USB hub found
[    4.224553] usb usb5: Manufacturer: Linux 6.10.0-rc6-powerpc64-smp 
ohci_hcd
[    4.244683] hub 2-1:1.0: 3 ports detected
[    4.265675] usb usb5: SerialNumber: 0000:05:13.3
[    4.308789] hub 5-0:1.0: USB hub found
[    4.330137] hub 5-0:1.0: 2 ports detected
[    4.351595] ohci-pci 0000:05:13.4: OHCI PCI host controller
[    4.373051] ohci-pci 0000:05:13.4: new USB bus registered, assigned 
bus number 6
[    4.373279] sr 0:0:0:0: Attached scsi CD-ROM sr0
[    4.392858] ohci-pci 0000:05:13.4: irq 11, io mem 0xa0205000
[    4.413917] sr 0:0:0:0: Attached scsi generic sg0 type 5
[    4.445156] scsi 1:0:0:0: CD-ROM            HL-DT-ST BDDVDRW CH10LS20 
1.00 PQ: 0 ANSI: 5
[    4.470492] usb usb6: New USB device found, idVendor=1d6b, 
idProduct=0001, bcdDevice= 6.10
[    4.491991] usb usb6: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    4.513313] usb usb6: Product: OHCI PCI host controller
[    4.534490] usb usb6: Manufacturer: Linux 6.10.0-rc6-powerpc64-smp 
ohci_hcd
[    4.555713] usb usb6: SerialNumber: 0000:05:13.4
[    4.577028] hub 6-0:1.0: USB hub found
[    4.598258] hub 6-0:1.0: 2 ports detected
[    4.620572] usbcore: registered new interface driver usblp
[    4.642537] usbcore: registered new interface driver usb-storage
[    4.664203] usbcore: registered new interface driver usbserial_generic
[    4.685962] usbserial: USB Serial support registered for generic
[    4.707380] sr 1:0:0:0: [sr1] scsi3-mmc drive: 125x/125x writer 
dvd-ram cd/rw xa/form2 cdda tray
[    4.711638] usb 5-1: new low-speed USB device number 2 using ohci-pci
[    4.727739] usbcore: registered new interface driver ftdi_sio
[    4.767941] usbserial: USB Serial support registered for FTDI USB 
Serial Device
[    4.788985] usbcore: registered new interface driver option
[    4.810596] usbserial: USB Serial support registered for GSM modem 
(1-port)
[    4.833011] mousedev: PS/2 mouse device common for all mice
[    4.855091] usbcore: registered new interface driver synaptics_usb
[    4.861635] usb 2-1.1: new full-speed USB device number 3 using ohci-pci
[    4.876930] usbcore: registered new interface driver iforce
[    4.918738] usbcore: registered new interface driver xpad
[    4.940895] usbcore: registered new interface driver usb_acecad
[    4.962708] usbcore: registered new interface driver aiptek
[    4.963754] usb 5-1: New USB device found, idVendor=06a2, 
idProduct=0033, bcdDevice= 1.00
[    4.982647] usbcore: registered new interface driver hanwang
[    5.001405] usb 5-1: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[    5.021449] usbcore: registered new interface driver kbtab
[    5.040213] usb 5-1: Product: USB Mouse
[    5.080508] usb 5-1: Manufacturer: Topro
[    5.084760] rtc_cmos rtc_cmos: registered as rtc0
[    5.120249] rtc_cmos rtc_cmos: setting system clock to 
2024-07-05T18:03:39 UTC (1720202619)
[    5.121167] sr 1:0:0:0: Attached scsi CD-ROM sr1
[    5.140188] rtc_cmos rtc_cmos: alarms up to one day, 114 bytes nvram
[    5.140399] sr 1:0:0:0: Attached scsi generic sg1 type 5
[    5.160055] i2c_dev: i2c /dev entries driver
[    5.199005] usb 2-1.1: New USB device found, idVendor=05ac, 
idProduct=0204, bcdDevice= 1.22
[    5.199247] scsi 2:0:0:0: Direct-Access     ATA      SAMSUNG HD103SJ  
00E5 PQ: 0 ANSI: 5
[    5.217551] usb 2-1.1: New USB device strings: Mfr=1, Product=3, 
SerialNumber=0
[    5.238452] sd 2:0:0:0: [sda] 1953525168 512-byte logical blocks: 
(1.00 TB/932 GiB)
[    5.256570] usb 2-1.1: Product: Apple Extended USB Keyboard
[    5.277221] sd 2:0:0:0: Attached scsi generic sg2 type 0
[    5.296223] usb 2-1.1: Manufacturer: Mitsumi Electric
[    5.318479] sd 2:0:0:0: [sda] Write Protect is off
[    5.359113] sd 2:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    5.359465] scsi 3:0:0:0: Direct-Access     ATA      WDC WDS480G2G0A- 
0000 PQ: 0 ANSI: 5
[    5.367638] usb 2-1.2: new full-speed USB device number 4 using ohci-pci
[    5.381123] sd 3:0:0:0: [sdb] 937721856 512-byte logical blocks: (480 
GB/447 GiB)
[    5.399314] sd 2:0:0:0: [sda] Write cache: enabled, read cache: 
enabled, doesn't support DPO or FUA
[    5.419493] sd 3:0:0:0: [sdb] Write Protect is off
[    5.438752] sd 2:0:0:0: [sda] Preferred minimum I/O size 512 bytes
[    5.458461] sd 3:0:0:0: [sdb] Mode Sense: 00 3a 00 00
[    5.477230] sd 3:0:0:0: Attached scsi generic sg3 type 0
[    5.479386] IR JVC protocol handler initialized
[    5.517488] IR MCE Keyboard/mouse protocol handler initialized
[    5.517533] sd 3:0:0:0: [sdb] Write cache: enabled, read cache: 
enabled, doesn't support DPO or FUA
[    5.537217] IR NEC protocol handler initialized
[    5.556218] sd 3:0:0:0: [sdb] Preferred minimum I/O size 512 bytes
[    5.576215] IR RC5(x/sz) protocol handler initialized
[    5.600642]  sda: RDSK (512) sda1 (DOS^G)(res 2 spb 4) sda2 
(SFS^@)(res 2 spb 1) sda3 (SFS^@)(res 2 spb 1) sda4 (SFS^@)(res 2 spb 1) 
sda5 (LNX^@)(res 2 spb 2) sda6 (SWP^@)(res 2 spb 1) sda7 (SFS^@)(res 2 
spb 1) sda8 (SFS^@)(res 2 spb 1) sda9 (SFS^@)(res 2 spb 1) sda10 
(SFS^@)(res 2 spb 1) sda11 (SFS^B)(res 2 spb 1) sda12 (DOS^C)(res 2 spb 
4) sda13 (LNX^@)(res 2 spb 2) sda14 (DOS^C)(res 2 spb 1) sda15 
(LNX^@)(res 2 spb 2) sda16 (SFS^@)(res 2 spb 1)
[    5.615963] IR RC6 protocol handler initialized
[    5.659441]  sdb: RDSK (512) sdb1 (LNX^@)(res 2 spb 1) sdb2 
(LNX^@)(res 2 spb 2) sdb3 (LNX^@)(res 2 spb 2) sdb4 ((res 2 spb 1) sdb5 
((res 2 spb 1) sdb6 ((res 2 spb 1) sdb7 ((res 2 spb 1) sdb8 ((res 2 spb 1)
[    5.682708] IR SANYO protocol handler initialized
[    5.707504] sd 2:0:0:0: [sda] Attached SCSI disk
[    5.731138] IR Sharp protocol handler initialized
[    5.756688] usb 2-1.2: not running at top speed; connect to a high 
speed hub
[    5.778647] IR Sony protocol handler initialized
[    5.812687] usb 2-1.2: New USB device found, idVendor=0781, 
idProduct=5575, bcdDevice= 1.27
[    5.826864] IR XMP protocol handler initialized
[    5.850151] usb 2-1.2: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[    5.875361] sd 3:0:0:0: [sdb] Attached SCSI disk
[    5.898734] usb 2-1.2: Product: Cruzer Glide
[    5.949865] usb 2-1.2: Manufacturer: SanDisk
[    5.955640] i2c i2c-8: Detected TI TMP423 chip at 0x4c
[    5.974361] usb 2-1.2: SerialNumber: 2005244462031AB35CF8
[    6.026801] usb-storage 2-1.2:1.0: USB Mass Storage device detected
[    6.052787] scsi host6: usb-storage 2-1.2:1.0
[    6.081863] EDAC MC0: Giving out device to module pasemi_edac 
controller pasemi,pwrficient-mc: DEV 0000:00:04.0 (POLLED)
[    6.109973] EDAC MC1: Giving out device to module pasemi_edac 
controller pasemi,pwrficient-mc: DEV 0000:00:05.0 (POLLED)
[    6.143641] input: Topro USB Mouse as 
/devices/pci0000:00/0000:00:11.0/0000:05:13.3/usb5/5-1/5-1:1.0/0003:06A2:0033.0001/input/input0
[    6.171860] hid-generic 0003:06A2:0033.0001: input: USB HID v1.10 
Mouse [Topro USB Mouse] on usb-0000:05:13.3-1/input0
[    6.203636] input: Mitsumi Electric Apple Extended USB Keyboard as 
/devices/pci0000:00/0000:00:11.0/0000:05:13.0/usb2/2-1/2-1.1/2-1.1:1.0/0003:05AC:0204.0002/input/input1
[    6.286300] hid-generic 0003:05AC:0204.0002: input: USB HID v1.10 
Keyboard [Mitsumi Electric Apple Extended USB Keyboard] on 
usb-0000:05:13.0-1.1/input0
[    6.320228] input: Mitsumi Electric Apple Extended USB Keyboard 
System Control as 
/devices/pci0000:00/0000:00:11.0/0000:05:13.0/usb2/2-1/2-1.1/2-1.1:1.1/0003:05AC:0204.0003/input/input2
[    6.402877] input: Mitsumi Electric Apple Extended USB Keyboard 
Consumer Control as 
/devices/pci0000:00/0000:00:11.0/0000:05:13.0/usb2/2-1/2-1.1/2-1.1:1.1/0003:05AC:0204.0003/input/input3
[    6.434757] hid-generic 0003:05AC:0204.0003: input: USB HID v1.10 
Device [Mitsumi Electric Apple Extended USB Keyboard] on 
usb-0000:05:13.0-1.1/input1
[    6.467440] usbcore: registered new interface driver usbhid
[    6.500054] usbhid: USB HID core driver
[    6.532959] no UART detected at 0x1
[    6.565595] usbcore: registered new interface driver snd-usb-audio
[    6.597973] usbcore: registered new interface driver snd-ua101
[    6.630061] usbcore: registered new interface driver snd-usb-usx2y
[    6.661908] usbcore: registered new interface driver snd-usb-caiaq
[    6.693715] usbcore: registered new interface driver snd-usb-6fire
[    6.725200] usbcore: registered new interface driver snd-usb-hiface
[    6.756439] usbcore: registered new interface driver snd-bcd2000
[    6.787315] usbcore: registered new interface driver snd_usb_pod
[    6.817783] usbcore: registered new interface driver snd_usb_podhd
[    6.848043] usbcore: registered new interface driver snd_usb_toneport
[    6.877878] usbcore: registered new interface driver snd_usb_variax
[    6.908636] ipip: IPv4 and MPLS over IPv4 tunneling driver
[    6.938262] Initializing XFRM netlink socket
[    6.967087] NET: Registered PF_INET6 protocol family
[    6.996426] Segment Routing with IPv6
[    7.024848] In-situ OAM (IOAM) with IPv6
[    7.053267] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    7.082259] NET: Registered PF_PACKET protocol family
[    7.110652] NET: Registered PF_KEY protocol family
[    7.138831] 9pnet: Installing 9P2000 support
[    7.166804] Key type dns_resolver registered
[    7.194638] drmem: No dynamic reconfiguration memory found
[    7.222342] No cpufreq driver, powersavings modes disabled
[    7.250001] Using PA6T idle loop (spin)
[    7.281753] scsi 6:0:0:0: Direct-Access     SanDisk  Cruzer Glide     
1.27 PQ: 0 ANSI: 6
[    7.311279] sd 6:0:0:0: Attached scsi generic sg4 type 0
[    7.315515] Loading compiled-in X.509 certificates
[    7.370149] Btrfs loaded, zoned=no, fsverity=no
[    7.396171] cfg80211: Loading compiled-in X.509 certificates for 
regulatory database
[    7.422245] sd 6:0:0:0: [sdc] 30529536 512-byte logical blocks: (15.6 
GB/14.6 GiB)
[    7.449312] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    7.476555] Loaded X.509 cert 'wens: 
61c038651aabdcf94bd0ac7ff06c7248db18c600'
[    7.502166] ALSA device list:
[    7.526816] platform regulatory.0: Direct firmware load for 
regulatory.db failed with error -2
[    7.527643]   No soundcards found.
[    7.549406] cfg80211: failed to load regulatory.db
[    7.593728] sd 6:0:0:0: [sdc] Write Protect is off
[    7.615835] sd 6:0:0:0: [sdc] Mode Sense: 43 00 00 00
[    7.624711] sd 6:0:0:0: [sdc] Write cache: disabled, read cache: 
enabled, doesn't support DPO or FUA
[    7.726709]  sdc: sdc1
[    7.748969] sd 6:0:0:0: [sdc] Attached SCSI removable disk
[    7.781815] EXT4-fs (sdb3): mounted filesystem 
d737fd37-e386-48b0-98eb-b291696ff3d4 ro with ordered data mode. Quota 
mode: none.
[    7.804672] VFS: Mounted root (ext4 filesystem) readonly on device 8:19.
[    7.829729] devtmpfs: mounted
[    7.858598] Freeing unused kernel image (initmem) memory: 9476K
[    7.881234] Kernel memory protection not selected by kernel config.
[    7.903992] Run /sbin/init as init process
[    7.926704]   with arguments:
[    7.926707]     /sbin/init
[    7.926711]   with environment:
[    7.926714]     HOME=/
[    7.926717]     TERM=linux
[    8.158177] systemd[1]: systemd 253-4 running in system mode (+PAM 
+AUDIT +SELINUX +APPARMOR +IMA +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL 
+ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP 
+LIBFDISK +PCRE2 -PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ 
+ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON +UTMP +SYSVINIT 
default-hierarchy=unified)
[    8.209090] systemd[1]: Detected architecture ppc64.
[    8.320698] systemd[1]: Hostname set to <fienix>.
[    9.003403] systemd[1]: Queued start job for default target 
graphical.target.
[    9.031812] systemd[1]: Created slice system-getty.slice - Slice 
/system/getty.
[    9.080795] systemd[1]: Created slice system-modprobe.slice - Slice 
/system/modprobe.
[    9.127298] systemd[1]: Created slice user.slice - User and Session 
Slice.
[    9.172105] systemd[1]: Started systemd-ask-password-wall.path - 
Forward Password Requests to Wall Directory Watch.
[    9.219062] systemd[1]: proc-sys-fs-binfmt_misc.automount - Arbitrary 
Executable File Formats File System Automount Point was skipped because 
of an unmet condition check (ConditionPathExists=/proc/sys/fs/binfmt_misc).
[    9.244685] systemd[1]: Reached target integritysetup.target - Local 
Integrity Protected Volumes.
[    9.297381] systemd[1]: Reached target nss-user-lookup.target - User 
and Group Name Lookups.
[    9.351946] systemd[1]: Reached target remote-fs.target - Remote File 
Systems.
[    9.408213] systemd[1]: Reached target slices.target - Slice Units.
[    9.465875] systemd[1]: Reached target swap.target - Swaps.
[    9.524541] systemd[1]: Reached target veritysetup.target - Local 
Verity Protected Volumes.
[    9.584689] systemd[1]: Listening on syslog.socket - Syslog Socket.
[    9.645266] systemd[1]: Listening on systemd-fsckd.socket - fsck to 
fsckd communication Socket.
[    9.706995] systemd[1]: Listening on systemd-initctl.socket - initctl 
Compatibility Named Pipe.
[    9.770144] systemd[1]: Listening on systemd-journald-dev-log.socket 
- Journal Socket (/dev/log).
[    9.834921] systemd[1]: Listening on systemd-journald.socket - 
Journal Socket.
[    9.901543] systemd[1]: Listening on systemd-udevd-control.socket - 
udev Control Socket.
[    9.967734] systemd[1]: Listening on systemd-udevd-kernel.socket - 
udev Kernel Socket.
[   10.041866] systemd[1]: Mounting dev-hugepages.mount - Huge Pages 
File System...
[   10.111017] systemd[1]: Mounting dev-mqueue.mount - POSIX Message 
Queue File System...
[   10.180491] systemd[1]: Mounting sys-kernel-debug.mount - Kernel 
Debug File System...
[   10.250204] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel 
Trace File System...
[   10.321719] systemd[1]: Starting kmod-static-nodes.service - Create 
List of Static Device Nodes...
[   10.393865] systemd[1]: Starting modprobe@configfs.service - Load 
Kernel Module configfs...
[   10.466240] systemd[1]: Starting modprobe@dm_mod.service - Load 
Kernel Module dm_mod...
[   10.511137] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) 
initialised: dm-devel@lists.linux.dev
[   10.572492] systemd[1]: Starting modprobe@drm.service - Load Kernel 
Module drm...
[   10.645262] systemd[1]: Starting modprobe@efi_pstore.service - Load 
Kernel Module efi_pstore...
[   10.717743] systemd[1]: Starting modprobe@fuse.service - Load Kernel 
Module fuse...
[   10.803988] systemd[1]: Starting modprobe@loop.service - Load Kernel 
Module loop...
[   10.873737] systemd[1]: Starting systemd-fsck-root.service - File 
System Check on Root Device...
[   10.943171] systemd[1]: systemd-journald.service: unit configures an 
IP firewall, but the local system does not support BPF/cgroup firewalling.
[   10.978189] systemd[1]: (This warning is only shown for the first 
unit using IP firewalling.)
[   11.015050] systemd[1]: Starting systemd-journald.service - Journal 
Service...
[   11.079526] systemd-journald[1287]: Collecting audit messages is 
disabled.
[   11.125642] systemd[1]: Starting systemd-modules-load.service - Load 
Kernel Modules...
[   11.220810] systemd[1]: Starting systemd-udev-trigger.service - 
Coldplug All udev Devices...
[   11.327371] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File 
System.
[   11.393593] systemd[1]: Started systemd-journald.service - Journal 
Service.
[   12.304347] sr 0:0:0:0: [sr0] tag#23 UNKNOWN(0x2003) Result: 
hostbyte=0x00 driverbyte=DRIVER_OK cmd_age=0s
[   12.334283] sr 0:0:0:0: [sr0] tag#23 Sense Key : 0x5 [current]
[   12.363862] sr 0:0:0:0: [sr0] tag#23 ASC=0x21 ASCQ=0x0
[   12.393030] sr 0:0:0:0: [sr0] tag#23 CDB: opcode=0x28 28 00 00 00 00 
00 00 00 01 00
[   12.422190] I/O error, dev sr0, sector 0 op 0x0:(READ) flags 0x80700 
phys_seg 1 prio class 0
[   15.042420] sr 1:0:0:0: [sr1] tag#24 UNKNOWN(0x2003) Result: 
hostbyte=0x00 driverbyte=DRIVER_OK cmd_age=0s
[   15.071893] sr 1:0:0:0: [sr1] tag#24 Sense Key : 0x5 [current]
[   15.100996] sr 1:0:0:0: [sr1] tag#24 ASC=0x21 ASCQ=0x0
[   15.129644] sr 1:0:0:0: [sr1] tag#24 CDB: opcode=0x28 28 00 00 00 00 
00 00 00 01 00
[   15.158276] I/O error, dev sr1, sector 0 op 0x0:(READ) flags 0x80700 
phys_seg 1 prio class 0
[   15.208472] EXT4-fs (sdb3): re-mounted 
d737fd37-e386-48b0-98eb-b291696ff3d4 r/w. Quota mode: none.
[   15.299579] systemd-journald[1287]: Received client request to flush 
runtime journal.
[   15.378926] systemd-journald[1287]: 
/var/log/journal/1a61c33c1bfd4a0682463eca1581b969/system.journal: 
Montonic clock jumped backwards relative to last journal entry, rotating.
[   15.378946] systemd-journald[1287]: Rotating system journal.
[   16.240215] pasemi_mac 0000:00:14.3 enp0s20f3: renamed from eth0
[   16.575612] 8139too 0000:06:06.0 enp6s6: renamed from eth1
[   17.566350] snd_hda_intel 0000:01:00.1: Force to snoop mode by module 
option
[   17.570788] snd_hda_intel 0000:05:14.2: Force to snoop mode by module 
option
[   17.677766] snd_hda_intel 0000:01:00.1: bound 0000:01:00.0 (ops 
0xc0000000017f38e0)
[   17.686683] snd_hda_codec_idt hdaudioC1D3: autoconfig for 
STAC92HD700: line_outs=4 (0xd/0xf/0x10/0x11/0x0) type:line
[   17.687465] snd_hda_codec_idt hdaudioC1D3:    speaker_outs=0 
(0x0/0x0/0x0/0x0/0x0)
[   17.687972] snd_hda_codec_idt hdaudioC1D3:    hp_outs=1 
(0xa/0x0/0x0/0x0/0x0)
[   17.688426] snd_hda_codec_idt hdaudioC1D3:    mono: mono_out=0x0
[   17.688797] snd_hda_codec_idt hdaudioC1D3:    dig-out=0x21/0x0
[   17.689148] snd_hda_codec_idt hdaudioC1D3:    inputs:
[   17.689438] snd_hda_codec_idt hdaudioC1D3:      Rear Mic=0xe
[   17.689786] snd_hda_codec_idt hdaudioC1D3:      Front Mic=0xb
[   17.690131] snd_hda_codec_idt hdaudioC1D3:      Line=0xc
[   17.690466] snd_hda_codec_idt hdaudioC1D3:      CD=0x12
[   17.727824] input: HDA ATI HDMI HDMI/DP,pcm=3 as 
/devices/pci0000:00/0000:00:10.0/0000:01:00.1/sound/card0/input4
[   17.841953] input: HDA ATI SB Rear Mic as 
/devices/pci0000:00/0000:00:11.0/0000:05:14.2/sound/card1/input5
[   17.845312] input: HDA ATI SB Front Mic as 
/devices/pci0000:00/0000:00:11.0/0000:05:14.2/sound/card1/input6
[   17.852970] input: HDA ATI SB Line as 
/devices/pci0000:00/0000:00:11.0/0000:05:14.2/sound/card1/input7
[   17.862797] input: HDA ATI SB Line Out Front as 
/devices/pci0000:00/0000:00:11.0/0000:05:14.2/sound/card1/input8
[   17.863926] input: HDA ATI SB Line Out Surround as 
/devices/pci0000:00/0000:00:11.0/0000:05:14.2/sound/card1/input9
[   17.871821] input: HDA ATI SB Line Out CLFE as 
/devices/pci0000:00/0000:00:11.0/0000:05:14.2/sound/card1/input10
[   17.874341] input: HDA ATI SB Line Out Side as 
/devices/pci0000:00/0000:00:11.0/0000:05:14.2/sound/card1/input11
[   17.875297] input: HDA ATI SB Front Headphone as 
/devices/pci0000:00/0000:00:11.0/0000:05:14.2/sound/card1/input12
[   21.709851] 8139too 0000:06:06.0 enp6s6: link up, 100Mbps, 
full-duplex, lpa 0xC5E1
[   40.647417] systemd-journald[1287]: 
/var/log/journal/1a61c33c1bfd4a0682463eca1581b969/user-1000.journal: 
Montonic clock jumped backwards relative to last journal entry, rotating.
[   40.647453] systemd-journald[1287]: Failed to write entry to 
/var/log/journal/1a61c33c1bfd4a0682463eca1581b969/user-1000.journal (27 
items, 1043 bytes), rotating before retrying: Not a XENIX named type file
[   70.645031] FAT-fs (sdc1): Volume was not properly unmounted. Some 
data may be corrupt. Please run fsck.

