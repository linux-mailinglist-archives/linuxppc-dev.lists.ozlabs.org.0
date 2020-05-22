Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F781DDD2B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 04:30:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Sr7q3BgDzDqwT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 12:30:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=X9cp6Hk5; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Sr5Q1hd0zDqwN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 12:28:42 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id b190so4466477pfg.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 19:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1tP8NUmXGUzCLAWHPpVNGS2Upi5jCFTdsNnPumo3I/E=;
 b=X9cp6Hk5wC7TZe/Ex3rv/he1krV1iCa20iKzzJyQigmDZTUEf0tVgFUxrpgn398TAt
 Elin3ZY0L5E/V5Mjzxu/kXATo5SKcqJfrnBlCWlK9Wy+WaWCQ5ZzN6PjlURtr2qbRipW
 9gwVdyOaPerZ0REUzBA/3Qj9Te9komXOdBmRxZuAqH/qootuLJWW9qpIFGE7pPFUD7II
 N4feMOgcuze+gbRTeXeyzmlcwlEme+GbZgS0CY3AfTXYM7ae9zyqYySgOl2Cca4LC3ND
 hrxIIx6JXDWvQGUsd7/KWLK3iAbr+yuCBZgW1qm0KpUjqH4RoqEvXCLP2nIxGE/3lvSt
 z7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=1tP8NUmXGUzCLAWHPpVNGS2Upi5jCFTdsNnPumo3I/E=;
 b=hEsEgrAbH0Pn4hyqn0MUk+0bqAbkQRYEtfDmWERiMpdtyNTE1L1nv/5eGyBifGiG5n
 EakvYRTfGxSGA2keyjxZ80RGlIuCkHP5YG1EdC9eZrbLtNOCz49MdUzX1thdbtSoWpWG
 GWWh5OcjMitmVApaK9+EhRSiGatXEnETuEoxdx0HLsmOyzHmwIXM7B/Axwq2TcyH4frm
 G0vW7YuiJl9+aZCK5ZTgAUBPT7Eu1vm0wzNyUQMduzkllOwFK67F+FzU2Pz83LQE24aA
 LBNekikSdsEt0qYkRlZ4AzxJ7IwYZ3IxeCCpvHP2OImWzsIPU/uinX+K5mmLJaxuj9In
 DWWw==
X-Gm-Message-State: AOAM533JdibluGUg/ggGNlPPdWTepj+QMG59/ratg72V5bUFOri8zbqg
 L1KwEB3C7iaHT9nGnK8TO1I=
X-Google-Smtp-Source: ABdhPJzw+Uy4s2ySWCZTjE+EITXOcGBVXdhVgxHgjUjc0YFPJCap5ckvFv7tpWrEJ4gKRVzEvZMhtA==
X-Received: by 2002:a62:4e88:: with SMTP id c130mr1756247pfb.122.1590114518464; 
 Thu, 21 May 2020 19:28:38 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id b137sm5370162pfb.110.2020.05.21.19.28.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 21 May 2020 19:28:37 -0700 (PDT)
Date: Thu, 21 May 2020 19:28:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200522022836.GA20727@roeck-us.net>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200521172704.GF23230@ZenIV.linux.org.uk>
 <bdc8dc64-622c-3b0d-1ae1-48222cf34358@roeck-us.net>
 <20200521224612.GJ23230@ZenIV.linux.org.uk>
 <20200522004618.GA3151350@ZenIV.linux.org.uk>
 <970857bd-bb56-7b2e-833e-ca74a82fa9b5@roeck-us.net>
 <20200522012950.GN23230@ZenIV.linux.org.uk>
 <20200522013523.GO23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522013523.GO23230@ZenIV.linux.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 ira.weiny@intel.com, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 22, 2020 at 02:35:23AM +0100, Al Viro wrote:
> On Fri, May 22, 2020 at 02:29:50AM +0100, Al Viro wrote:
> > On Thu, May 21, 2020 at 06:11:08PM -0700, Guenter Roeck wrote:
> > 
> > > Mainline, with:
> > > 
> > > qemu-system-sparc -M SS-4 -kernel arch/sparc/boot/zImage -no-reboot \
> > > 	-snapshot -drive file=rootfs.ext2,format=raw,if=scsi \
> > > 	-append "panic=-1 slub_debug=FZPUA root=/dev/sda console=ttyS0"
> > > 	-nographic -monitor none
> > > 
> > > The machine doesn't really matter, though.
> > 
> > It does, unfortunately - try that with SS-10 and watch what happens ;-/
> 
> Ugh...  It's actually something in -m handling: -m 256 passes, -m 512
> leads to that panic.

Default seems to be 128M. Anyway, see below log for SS-10.

Guenter

---
Configuration device id QEMU version 1 machine id 64
Probing SBus slot 0 offset 0
Probing SBus slot 1 offset 0
Probing SBus slot 2 offset 0
Probing SBus slot 3 offset 0
Probing SBus slot 15 offset 0
Invalid FCode start byte
CPUs: 1 x TI,TMS390Z55
UUID: 00000000-0000-0000-0000-000000000000
Welcome to OpenBIOS v1.1 built on Oct 28 2019 17:08
  Type 'help' for detailed information
[sparc] Kernel already loaded
switching to new context:
PROMLIB: obio_ranges 1
PROMLIB: Sun Boot Prom Version 3 Revision 2
Linux version 5.7.0-rc6-00026-g03fb3acae4be (groeck@server.roeck-us.net) (gcc version 6.5.0 (Buildroot 2018.11-rc2-00071-g4310260), GNU ld (GNU Binutils) 2.31.1) #1 Thu May 21 19:17:48 PDT 2020
printk: bootconsole [earlyprom0] enabled
ARCH: SUN4M
TYPE: Sun4m SparcStation10/20
Ethernet address: 52:54:00:12:34:56
OF stdout device is: /obio/zs@0,100000:a
PROM: Built device tree with 30586 bytes of memory.
Booting Linux...
Power off control detected.
Built 1 zonelists, mobility grouping on.  Total pages: 25012
Kernel command line: panic=-1 slub_debug=FZPUA root=/dev/sda console=ttyS0
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes, linear)
Sorting __ex_table...
mem auto-init: stack:off, heap alloc:off, heap free:off
Memory: 103428K/100944K available (5050K kernel code, 178K rwdata, 1212K rodata, 176K init, 158K bss, 4294964812K reserved, 0K cma-reserved, 0K highmem)
NR_IRQS: 64
Console: colour dummy device 80x25
------------------------
| Locking API testsuite:
----------------------------------------------------------------------------
                                 | spin |wlock |rlock |mutex | wsem | rsem |
  --------------------------------------------------------------------------
                     A-A deadlock:failed|failed|  ok  |failed|failed|failed|failed|
                 A-B-B-A deadlock:failed|failed|  ok  |failed|failed|failed|failed|
             A-B-B-C-C-A deadlock:failed|failed|  ok  |failed|failed|failed|failed|
             A-B-C-A-B-C deadlock:failed|failed|  ok  |failed|failed|failed|failed|
         A-B-B-C-C-D-D-A deadlock:failed|failed|  ok  |failed|failed|failed|failed|
         A-B-C-D-B-D-D-A deadlock:failed|failed|  ok  |failed|failed|failed|failed|
         A-B-C-D-B-C-D-A deadlock:failed|failed|  ok  |failed|failed|failed|failed|
                    double unlock:  ok  |  ok  |failed|  ok  |failed|failed|  ok  |
                  initialize held:failed|failed|failed|failed|failed|failed|failed|
  --------------------------------------------------------------------------
              recursive read-lock:             |  ok  |             |failed|
           recursive read-lock #2:             |  ok  |             |failed|
            mixed read-write-lock:             |failed|             |failed|
            mixed write-read-lock:             |failed|             |failed|
  mixed read-lock/lock-write ABBA:             |failed|             |failed|
   mixed read-lock/lock-read ABBA:             |  ok  |             |failed|
 mixed write-lock/lock-write ABBA:             |failed|             |failed|
  --------------------------------------------------------------------------
     hard-irqs-on + irq-safe-A/12:failed|failed|  ok  |
     soft-irqs-on + irq-safe-A/12:failed|failed|  ok  |
     hard-irqs-on + irq-safe-A/21:failed|failed|  ok  |
     soft-irqs-on + irq-safe-A/21:failed|failed|  ok  |
       sirq-safe-A => hirqs-on/12:failed|failed|  ok  |
       sirq-safe-A => hirqs-on/21:failed|failed|  ok  |
         hard-safe-A + irqs-on/12:failed|failed|  ok  |
         soft-safe-A + irqs-on/12:failed|failed|  ok  |
         hard-safe-A + irqs-on/21:failed|failed|  ok  |
         soft-safe-A + irqs-on/21:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/123:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/123:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/132:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/132:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/213:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/213:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/231:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/231:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/312:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/312:failed|failed|  ok  |
    hard-safe-A + unsafe-B #1/321:failed|failed|  ok  |
    soft-safe-A + unsafe-B #1/321:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/123:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/123:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/132:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/132:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/213:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/213:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/231:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/231:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/312:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/312:failed|failed|  ok  |
    hard-safe-A + unsafe-B #2/321:failed|failed|  ok  |
    soft-safe-A + unsafe-B #2/321:failed|failed|  ok  |
      hard-irq lock-inversion/123:failed|failed|  ok  |
      soft-irq lock-inversion/123:failed|failed|  ok  |
      hard-irq lock-inversion/132:failed|failed|  ok  |
      soft-irq lock-inversion/132:failed|failed|  ok  |
      hard-irq lock-inversion/213:failed|failed|  ok  |
      soft-irq lock-inversion/213:failed|failed|  ok  |
      hard-irq lock-inversion/231:failed|failed|  ok  |
      soft-irq lock-inversion/231:failed|failed|  ok  |
      hard-irq lock-inversion/312:failed|failed|  ok  |
      soft-irq lock-inversion/312:failed|failed|  ok  |
      hard-irq lock-inversion/321:failed|failed|  ok  |
      soft-irq lock-inversion/321:failed|failed|  ok  |
      hard-irq read-recursion/123:  ok  |
      soft-irq read-recursion/123:  ok  |
      hard-irq read-recursion/132:  ok  |
      soft-irq read-recursion/132:  ok  |
      hard-irq read-recursion/213:  ok  |
      soft-irq read-recursion/213:  ok  |
      hard-irq read-recursion/231:  ok  |
      soft-irq read-recursion/231:  ok  |
      hard-irq read-recursion/312:  ok  |
      soft-irq read-recursion/312:  ok  |
      hard-irq read-recursion/321:  ok  |
      soft-irq read-recursion/321:  ok  |
  --------------------------------------------------------------------------
  | Wound/wait tests |
  ---------------------
                  ww api failures:  ok  |  ok  |  ok  |
               ww contexts mixing:failed|  ok  |
             finishing ww context:  ok  |  ok  |  ok  |  ok  |
               locking mismatches:  ok  |  ok  |  ok  |
                 EDEADLK handling:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
           spinlock nest unlocked:failed|
  -----------------------------------------------------
                                 |block | try  |context|
  -----------------------------------------------------
                          context:failed|  ok  |  ok  |
                              try:failed|  ok  |failed|
                            block:failed|  ok  |failed|
                         spinlock:failed|  ok  |failed|
--------------------------------------------------------
164 out of 262 testcases failed, as expected. |
----------------------------------------------------
clocksource: timer_cs: mask: 0xffffffffffffffff max_cycles: 0x1d854df40, max_idle_ns: 1763180808480 ns
Calibrating delay loop... 518.14 BogoMIPS (lpj=1036288)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
devtmpfs: initialized
random: get_random_u32 called from bucket_table_alloc.isra.22+0x50/0x1e4 with crng_init=0
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
futex hash table entries: 256 (order: 0, 7168 bytes, linear)
NET: Registered protocol family 16
IOMMU: impl 0 vers 3 table 0x(ptrval)[262144 B] map [65536 b]
vgaarb: loaded
SCSI subsystem initialized
clocksource: Switched to clocksource timer_cs
NET: Registered protocol family 2
tcp_listen_portaddr_hash hash table entries: 256 (order: 0, 6144 bytes, linear)
TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
TCP bind hash table entries: 1024 (order: 2, 20480 bytes, linear)
TCP: Hash tables configured (established 1024 bind 1024)
UDP hash table entries: 256 (order: 1, 12288 bytes, linear)
UDP-Lite hash table entries: 256 (order: 1, 12288 bytes, linear)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
PCI: CLS 0 bytes, default 32
apc: power management initialized
random: fast init done
workingset: timestamp_bits=30 max_order=15 bucket_order=0
squashfs: version 4.0 (2009/01/31) Phillip Lougher
jitterentropy: Initialization failed with host not compliant with requirements: 2
io scheduler mq-deadline registered
io scheduler kyber registered
String selftests succeeded
test_firmware: interface ready
test passed
test_bitmap: loaded.
test_bitmap: parselist: 14: input is '0-2047:128/256' OK, Time: 2000
test_bitmap: parselist_user: 14: input is '0-2047:128/256' OK, Time: 3000
test_bitmap: all 1663 tests passed
test_uuid: all 18 tests passed
crc32: CRC_LE_BITS = 64, CRC_BE BITS = 64
crc32: self tests passed, processed 225944 bytes in 450500 nsec
crc32c: CRC_LE_BITS = 64
crc32c: self tests passed, processed 225944 bytes in 249000 nsec
crc32_combine: 8373 self tests passed
crc32c_combine: 8373 self tests passed
rbtree testing
 -> test 1 (latency of nnodes insert+delete): 0 cycles
 -> test 2 (latency of nnodes cached insert+delete): 0 cycles
 -> test 3 (latency of inorder traversal): 0 cycles
 -> test 4 (latency to fetch first node)
        non-cached: 0 cycles
        cached: 0 cycles
augmented rbtree testing
 -> test 1 (latency of nnodes insert+delete): 0 cycles
 -> test 2 (latency of nnodes cached insert+delete): 0 cycles
interval tree insert/remove
 -> 0 cycles
interval tree search
 -> 0 cycles (2692 results)
ffd374f8: ttyS0 at MMIO 0xf1100000 (irq = 5, base_baud = 307200) is a zs
Console: ttyS0 (SunZilog zs0)
printk: console [ttyS0] enabled
printk: console [ttyS0] enabled
printk: bootconsole [earlyprom0] disabled
printk: bootconsole [earlyprom0] disabled
ffd374f8: ttyS1 at MMIO 0xf1100004 (irq = 5, base_baud = 307200) is a zs
ffd37770: Keyboard at MMIO 0xf1000000 (irq = 5) is a zs
ffd37770: Mouse at MMIO 0xf1000004 (irq = 5) is a zs
brd: module loaded
esp ffd392ec: esp0: regs[(ptrval):(ptrval)] irq[2]
esp ffd392ec: esp0: is a FAS100A, 40 MHz (ccf=0), SCSI ID 7
scsi host0: esp
scsi 0:0:0:0: Direct-Access     QEMU     QEMU HARDDISK    2.5+ PQ: 0 ANSI: 5
scsi target0:0:0: Beginning Domain Validation
scsi target0:0:0: Domain Validation skipping write tests
scsi target0:0:0: Ending Domain Validation
scsi 0:0:2:0: CD-ROM            QEMU     QEMU CD-ROM      2.5+ PQ: 0 ANSI: 5
scsi target0:0:2: Beginning Domain Validation
scsi target0:0:2: Domain Validation skipping write tests
scsi target0:0:2: Ending Domain Validation
sr 0:0:2:0: [sr0] scsi3-mmc drive: 16x/50x cd/rw xa/form2 cdda tray
cdrom: Uniform CD-ROM driver Revision: 3.20
sd 0:0:0:0: [sda] 40960 512-byte logical blocks: (21.0 MB/20.0 MiB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
sd 0:0:0:0: [sda] Attached SCSI disk
ioremap: done with statics, switching to malloc
SunLance: using auto-carrier-detection.
eth0: LANCE 52:54:00:12:34:56
rtc-m48t59 rtc-m48t59.0: IRQ index 0 not found
rtc-m48t59 rtc-m48t59.0: registered as rtc0
rtc-m48t59 rtc-m48t59.0: setting system clock to 2020-05-22T02:19:50 UTC (1590113990)
sdhci: Secure Digital Host Controller Interface driver
sdhci: Copyright(c) Pierre Ossman
NET: Registered protocol family 10
Segment Routing with IPv6
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
NET: Registered protocol family 17
TAP version 14
    # Subtest: sysctl_test
    1..10
    ok 1 - sysctl_test_api_dointvec_null_tbl_data
    ok 2 - sysctl_test_api_dointvec_table_maxlen_unset
    ok 3 - sysctl_test_api_dointvec_table_len_is_zero
    ok 4 - sysctl_test_api_dointvec_table_read_but_position_set
    ok 5 - sysctl_test_dointvec_read_happy_single_positive
    ok 6 - sysctl_test_dointvec_read_happy_single_negative
    ok 7 - sysctl_test_dointvec_write_happy_single_positive
    ok 8 - sysctl_test_dointvec_write_happy_single_negative
    ok 9 - sysctl_test_api_dointvec_write_single_less_int_min
    ok 10 - sysctl_test_api_dointvec_write_single_greater_int_max
ok 1 - sysctl_test
    # Subtest: ext4_inode_test
    1..1
    ok 1 - inode_test_xtimestamp_decoding
ok 2 - ext4_inode_test
    # Subtest: kunit-try-catch-test
    1..2
    ok 1 - kunit_test_try_catch_successful_try_no_catch
    ok 2 - kunit_test_try_catch_unsuccessful_try_does_catch
ok 3 - kunit-try-catch-test
    # Subtest: kunit-resource-test
    1..5
    ok 1 - kunit_resource_test_init_resources
    ok 2 - kunit_resource_test_alloc_resource
    ok 3 - kunit_resource_test_destroy_resource
    ok 4 - kunit_resource_test_cleanup_resources
    ok 5 - kunit_resource_test_proper_free_ordering
ok 4 - kunit-resource-test
    # Subtest: kunit-log-test
    1..1
put this in log.
this too.
add to suite log.
along with this.
    ok 1 - kunit_log_test
ok 5 - kunit-log-test
    # Subtest: string-stream-test
    1..3
    ok 1 - string_stream_test_empty_on_creation
    ok 2 - string_stream_test_not_empty_after_add
    ok 3 - string_stream_test_get_string
ok 6 - string-stream-test
    # Subtest: list-kunit-test
    1..36
    ok 1 - list_test_list_init
    ok 2 - list_test_list_add
    ok 3 - list_test_list_add_tail
    ok 4 - list_test_list_del
    ok 5 - list_test_list_replace
    ok 6 - list_test_list_replace_init
    ok 7 - list_test_list_swap
    ok 8 - list_test_list_del_init
    ok 9 - list_test_list_move
    ok 10 - list_test_list_move_tail
    ok 11 - list_test_list_bulk_move_tail
    ok 12 - list_test_list_is_first
    ok 13 - list_test_list_is_last
    ok 14 - list_test_list_empty
    ok 15 - list_test_list_empty_careful
    ok 16 - list_test_list_rotate_left
    ok 17 - list_test_list_rotate_to_front
    ok 18 - list_test_list_is_singular
    ok 19 - list_test_list_cut_position
    ok 20 - list_test_list_cut_before
    ok 21 - list_test_list_splice
    ok 22 - list_test_list_splice_tail
    ok 23 - list_test_list_splice_init
    ok 24 - list_test_list_splice_tail_init
    ok 25 - list_test_list_entry
    ok 26 - list_test_list_first_entry
    ok 27 - list_test_list_last_entry
    ok 28 - list_test_list_first_entry_or_null
    ok 29 - list_test_list_next_entry
    ok 30 - list_test_list_prev_entry
    ok 31 - list_test_list_for_each
    ok 32 - list_test_list_for_each_prev
    ok 33 - list_test_list_for_each_safe
    ok 34 - list_test_list_for_each_prev_safe
    ok 35 - list_test_list_for_each_entry
    ok 36 - list_test_list_for_each_entry_reverse
ok 7 - list-kunit-test
    # Subtest: qos-kunit-test
    1..3
    ok 1 - freq_qos_test_min
    ok 2 - freq_qos_test_maxdef
    ok 3 - freq_qos_test_readd
ok 8 - qos-kunit-test
EXT4-fs (sda): mounted filesystem without journal. Opts: (null)
VFS: Mounted root (ext4 filesystem) readonly on device 8:0.
devtmpfs: mounted
Freeing unused kernel memory: 176K
This architecture does not have kernel memory protection.
Run /sbin/init as init process
EXT4-fs (sda): re-mounted. Opts: (null)
ext4 filesystem being remounted at / supports timestamps until 2038 (0x7fffffff)
Starting syslogd: OK
Starting klogd: OK
Initializing random number generator... random: dd: uninitialized urandom read (512 bytes read)
done.
Starting network: OK
Found console ttyS0

Linux version 5.7.0-rc6-00026-g03fb3acae4be (groeck@server.roeck-us.net) (gcc version 6.5.0 (Buildroot 2018.11-rc2-00071-g4310260), GNU ld (GNU Binutils) 2.31.1) #1 Thu May 21 19:17:48 PDT 2020
Boot successful.
Rebooting
Found console ttyS0
Stopping network: OK
Saving random seed... random: dd: uninitialized urandom read (512 bytes read)
done.
Stopping klogd: OK
Stopping syslogd: OK
umount: devtmpfs busy - remounted read-only
EXT4-fs (sda): re-mounted. Opts: (null)
The system is going down NOW!
Sent SIGTERM to all processes
Sent SIGKILL to all processes
Requesting system reboot
sd 0:0:0:0: [sda] Synchronizing SCSI cache
reboot: Restarting system
