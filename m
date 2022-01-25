Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B20D49B727
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 16:04:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjqrH1Rsvz3bXg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 02:04:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mEpM+gFF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=abdhalee@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mEpM+gFF; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjqqS0bvmz301v
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 02:03:31 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PF1GaU008092; 
 Tue, 25 Jan 2022 15:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=pp1;
 bh=8tU9qwAzRyMJ10bMz/rxEBT+VoMBZVWrm6DenjgaReI=;
 b=mEpM+gFFybgf00eGdv1WzX/fJxDXQ7U1apekiSno3fW8VokRMAqXWXIka6vTfTrTdaRp
 /Rrmh2Panna/PB+2YSAgD2MuwTThfSHQzLbI1v3cm36K4zOBKTRBJGkNw8T0dg1boIwZ
 hfEU7hJUN/l8OAhLwaNp7jmqcX1tK0QVGKm/ZZcaWaRaXaiQLGyb5xk1DNnIjv+p/hSh
 DpidSY5i++IAvBI8/Ho7DH+SYTwmeXfA0bqoUFjzM9J9qp3iyhNiKLqpXEakKFc07/VR
 aRdBC/MJG0D2SB8T6vXTDVN1Ja27ZhzlHSmxJGstbON5NXxYQZRGINBVJZ98EcusUr31 XQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dtk6trggj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 15:03:17 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20PEvTNY030377;
 Tue, 25 Jan 2022 15:03:16 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 3dr9ja6yek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 15:03:16 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20PF3EDV33227108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 15:03:14 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEAE46A07D;
 Tue, 25 Jan 2022 15:03:14 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 759366A07E;
 Tue, 25 Jan 2022 15:03:12 +0000 (GMT)
Received: from [9.43.77.91] (unknown [9.43.77.91])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jan 2022 15:03:11 +0000 (GMT)
Message-ID: <a5be93cc-3651-3f9c-92a0-0b4c580625f6@linux.vnet.ibm.com>
Date: Tue, 25 Jan 2022 20:22:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: linux-next <linux-next@vger.kernel.org>
From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: [linux-next] 5.17.0-rc1-next-20220124 kernel fails to boot on my
 powerpc box
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DJ5MOO6dk7sHriUO1zSG1Db1AwmFlYAi
X-Proofpoint-GUID: DJ5MOO6dk7sHriUO1zSG1Db1AwmFlYAi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_02,2022-01-25_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 clxscore=1011 mlxscore=0 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201250094
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
Cc: sachinp <sachinp@linux.vnet.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greeting's

Today's next kernel 5.17.0-rc1-next-20220124(first bad) fails to boot on 
my powerpc box.

I see it booted fine last Friday for kernel 5.16.0-next-20220121

Boot logs:

Removing IBM Power 842 compression device
device-mapper: multipath: 253:0: Failing path 8:0.
scsi 0:0:0:0: alua: Detached
scsi 0:0:1:0: alua: Detached
kexec_core: Starting new kernel
kexec: waiting for cpu 16 (physical 16) to enter 1 state
kexec: waiting for cpu 17 (physical 17) to enter 1 state
kexec: waiting for cpu 1 (physical 1) to enter 2 state
kexec: waiting for cpu 3 (physical 3) to enter 2 state
kexec: waiting for cpu 8 (physical 8) to enter 2 state
kexec: waiting for cpu 9 (physical 9) to enter 2 state
kexec: waiting for cpu 10 (physical 10) to enter 2 state
kexec: waiting for cpu 11 (physical 11) to enter 2 state
kexec: waiting for cpu 13 (physical 13) to enter 2 state
kexec: waiting for cpu 16 (physical 16) to enter 2 state
kexec: waiting for cpu 17 (physical 17) to enter 2 state
kexec: Starting switchover sequence.
y
Reserving 1024MB of memory at 128MB for crashkernel (System RAM: 30720MB)
hash-mmu: Page sizes from device-tree:
hash-mmu: base_shift=12: shift=12, sllp=0x0000, avpnm=0x00000000, 
tlbiel=1, penc=0
hash-mmu: base_shift=12: shift=16, sllp=0x0000, avpnm=0x00000000, 
tlbiel=1, penc=7
hash-mmu: base_shift=12: shift=24, sllp=0x0000, avpnm=0x00000000, 
tlbiel=1, penc=56
hash-mmu: base_shift=16: shift=16, sllp=0x0110, avpnm=0x00000000, 
tlbiel=1, penc=1
hash-mmu: base_shift=16: shift=24, sllp=0x0110, avpnm=0x00000000, 
tlbiel=1, penc=8
hash-mmu: base_shift=24: shift=24, sllp=0x0100, avpnm=0x00000001, 
tlbiel=0, penc=0
hash-mmu: base_shift=34: shift=34, sllp=0x0120, avpnm=0x000007ff, 
tlbiel=0, penc=3
Enabling pkeys with max key count 31
Activating Kernel Userspace Access Prevention
Activating Kernel Userspace Execution Prevention
Using 1TB segments
hash-mmu: Initializing hash mmu with SLB
Linux version 5.17.0-rc1-next-20220124-autotest 
(root@ltc-zz3-lp1.aus.stglabs.ibm.com) (gcc (GCC) 8.3.1 20190507 (Red 
Hat 8.3.1-4), GNU ld version 2.30-58.el8) #1 SMP Tue Jan 25 04:47:57 CST 
2022
Found initrd at 0xc000000005800000:0xc000000007d2892c
Using pSeries machine description
printk: bootconsole [udbg0] enabled
Partition configured for 24 cpus.
CPU maps initialized for 8 threads per core
numa: Partition configured for 32 NUMA nodes.
-----------------------------------------------------
phys_mem_size     = 0x780000000
dcache_bsize      = 0x80
icache_bsize      = 0x80
cpu_features      = 0x0001c07b8f5f9187
   possible        = 0x000ffbfbcf5fb187
   always          = 0x0000000380008181
cpu_user_features = 0xdc0065c2 0xeff00000
mmu_features      = 0x7c006e01
firmware_features = 0x0000009fc45bfc57
vmalloc start     = 0xc008000000000000
IO start          = 0xc00a000000000000
vmemmap start     = 0xc00c000000000000
hash-mmu: ppc64_pft_size    = 0x1c
hash-mmu: htab_hash_mask    = 0x1fffff
-----------------------------------------------------
numa:   NODE_DATA [mem 0x77ff1ef00-0x77ff23fff]
rfi-flush: fallback displacement flush available
rfi-flush: mttrig type flush available
count-cache-flush: flush disabled.
link-stack-flush: software flush enabled.
stf-barrier: eieio barrier available
lpar: H_BLOCK_REMOVE supports base psize:0 psize:0 block size:8
lpar: H_BLOCK_REMOVE supports base psize:0 psize:2 block size:8
lpar: H_BLOCK_REMOVE supports base psize:0 psize:10 block size:8
lpar: H_BLOCK_REMOVE supports base psize:2 psize:2 block size:8
lpar: H_BLOCK_REMOVE supports base psize:2 psize:10 block size:8
PPC64 nvram contains 15360 bytes
PV qspinlock hash table entries: 4096 (order: 0, 65536 bytes, linear)
barrier-nospec: using ORI speculation barrier
Zone ranges:
   Normal   [mem 0x0000000000000000-0x000000077fffffff]
Movable zone start for each node
Early memory node ranges
   node   0: [mem 0x0000000000000000-0x000000077fffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x000000077fffffff]
percpu: Embedded 10 pages/cpu s590744 r0 d64616 u1048576
Fallback order for Node 0: 0
Built 1 zonelists, mobility grouping on.  Total pages: 491040
Policy zone: Normal
Kernel command line: 
BOOT_IMAGE=/vmlinuz-5.16.0-rc5-next-20211220-autotest 
root=UUID=8b32580a-0de0-4694-882d-7db2567ad115 ro crashkernel=1024M 
biosdevname=0 ibmvfc.mq=0
Unknown kernel command line parameters 
"BOOT_IMAGE=/vmlinuz-5.16.0-rc5-next-20211220-autotest biosdevname=0", 
will be passed to user space.
Dentry cache hash table entries: 4194304 (order: 9, 33554432 bytes, linear)
Inode-cache hash table entries: 2097152 (order: 8, 16777216 bytes, linear)
mem auto-init: stack:off, heap alloc:off, heap free:off
Memory: 30158976K/31457280K available (12992K kernel code, 5696K rwdata, 
4160K rodata, 3904K init, 2588K bss, 1298304K reserved, 0K cma-reserved)
SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=24, Nodes=32
trace event string verifier disabled
rcu: Hierarchical RCU implementation.
rcu:     RCU event tracing is enabled.
rcu:     RCU restricting CPUs from NR_CPUS=2048 to nr_cpu_ids=24.
rcu:     RCU debug extended QS entry/exit.
     Trampoline variant of Tasks RCU enabled.
     Rude variant of Tasks RCU enabled.
     Tracing variant of Tasks RCU enabled.
rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=24
NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
random: get_random_u64 called from start_kernel+0x65c/0x8bc with crng_init=0
time_init: 56 bit decrementer (max: 7fffffffffffff)
clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 
0x761537d007, max_idle_ns: 440795202126 ns
clocksource: timebase mult[1f40000] shift[24] registered
Console: colour dummy device 80x25
printk: console [hvc0] enabled
printk: console [hvc0] enabled
printk: bootconsole [udbg0] disabled
printk: bootconsole [udbg0] disabled
pid_max: default: 32768 minimum: 301
LSM: Security Framework initializing
Yama: becoming mindful.
SELinux:  Initializing.
Mount-cache hash table entries: 65536 (order: 3, 524288 bytes, linear)
Mountpoint-cache hash table entries: 65536 (order: 3, 524288 bytes, linear)
cblist_init_generic: Setting adjustable number of callback queues.
cblist_init_generic: Setting shift to 4 and lim to 1.
cblist_init_generic: Setting shift to 4 and lim to 1.
cblist_init_generic: Setting shift to 4 and lim to 1.
POWER9 performance monitor hardware support registered
rcu: Hierarchical SRCU implementation.
smp: Bringing up secondary CPUs ...
smp: Brought up 1 node, 24 CPUs
numa: Node 0 CPUs: 0-23
Big cores detected but using small core scheduling
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, 
max_idle_ns: 19112604462750000 ns
futex hash table entries: 8192 (order: 4, 1048576 bytes, linear)
NET: Registered PF_NETLINK/PF_ROUTE protocol family
audit: initializing netlink subsys (disabled)
audit: type=2000 audit(1643112925.010:1): state=initialized 
audit_enabled=0 res=1
thermal_sys: Registered thermal governor 'fair_share'
thermal_sys: Registered thermal governor 'step_wise'
cpuidle: using governor menu
pstore: Registered nvram as persistent store backend
EEH: pSeries platform initialized
software IO TLB: tearing down default memory pool
PCI: Probing PCI hardware
EEH: No capable adapters found: recovery disabled.
pseries-rng: Registering arch random hook.
kprobes: kprobe jump-optimization is enabled. All kprobes are optimized 
if possible.
HugeTLB registered 16.0 MiB page size, pre-allocated 0 pages
HugeTLB registered 16.0 GiB page size, pre-allocated 0 pages
iommu: Default domain type: Translated
iommu: DMA domain TLB invalidation policy: strict mode
vgaarb: loaded
SCSI subsystem initialized
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
EDAC MC: Ver: 3.0.0
NetLabel: Initializing
NetLabel:  domain hash size = 128
NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
NetLabel:  unlabeled traffic allowed by default
clocksource: Switched to clocksource timebase
VFS: Disk quotas dquot_6.6.0
VFS: Dquot-cache hash table entries: 8192 (order 0, 65536 bytes)
NET: Registered PF_INET protocol family
IP idents hash table entries: 262144 (order: 5, 2097152 bytes, linear)
tcp_listen_portaddr_hash hash table entries: 16384 (order: 2, 262144 
bytes, linear)
TCP established hash table entries: 262144 (order: 5, 2097152 bytes, linear)
TCP bind hash table entries: 65536 (order: 4, 1048576 bytes, linear)
TCP: Hash tables configured (established 262144 bind 65536)
UDP hash table entries: 16384 (order: 3, 524288 bytes, linear)
UDP-Lite hash table entries: 16384 (order: 3, 524288 bytes, linear)
NET: Registered PF_UNIX/PF_LOCAL protocol family
PCI: CLS 0 bytes, default 128
Trying to unpack rootfs image as initramfs...
IOMMU table initialized, virtual merging enabled
vas: API is supported only with radix page tables
hv-24x7: read 1530 catalog entries, created 509 event attrs (0 
failures), 275 descs
Initialise system trusted keyrings
workingset: timestamp_bits=38 max_order=19 bucket_order=0
zbud: loaded
NET: Registered PF_ALG protocol family
Key type asymmetric registered
Asymmetric key parser 'x509' registered
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 249)
io scheduler mq-deadline registered
io scheduler kyber registered
atomic64_test: passed
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
Non-volatile memory driver v1.3
Linux agpgart interface v0.103
rdac: device handler registered
hp_sw: device handler registered
emc: device handler registered
alua: device handler registered
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci-pci: EHCI PCI platform driver
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
ohci-pci: OHCI PCI platform driver
uhci_hcd: USB Universal Host Controller Interface driver
usbcore: registered new interface driver usbserial_generic
usbserial: USB Serial support registered for generic
mousedev: PS/2 mouse device common for all mice
rtc-generic rtc-generic: registered as rtc0
rtc-generic rtc-generic: setting system clock to 2022-01-25T12:15:25 UTC 
(1643112925)
nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_sync_size 
new:65536 old:0
nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_sync_sg 
new:510 old:0
nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_sg_len 
new:4080 old:0
NX-GZIP is not supported. Returned=-524
hid: raw HID events driver (C) Jiri Kosina
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
drop_monitor: Initializing network drop monitor service
Initializing XFRM netlink socket
NET: Registered PF_INET6 protocol family
Segment Routing with IPv6
In-situ OAM (IOAM) with IPv6
NET: Registered PF_PACKET protocol family
registered taskstats version 1
Loading compiled-in X.509 certificates
Freeing initrd memory: 38016K
alg: No test for pkcs1pad(rsa,sha1) (pkcs1pad(rsa-generic,sha1))
Loaded X.509 cert 'Build time autogenerated kernel key: 
984d2d0a058cae59d928008a328cb345ccb6f5b1'
zswap: loaded using pool lzo/zbud
pstore: Using crash dump compression: deflate
alg: No test for 842 (842-nx)
INFO: task swapper/0:1 blocked for more than 122 seconds.
       Not tainted 5.17.0-rc1-next-20220124-autotest #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:swapper/0       state:D stack:    0 pid:    1 ppid:     0 
flags:0x00000800
Call Trace:
[c000000003483960] [c0000000034839a0] 0xc0000000034839a0 (unreliable)
[c000000003483b50] [c00000000001e328] __switch_to+0x278/0x490
[c000000003483bb0] [c000000000c9c2f8] __schedule+0x318/0xa00
[c000000003483c70] [c000000000c9ca48] schedule+0x68/0x130
[c000000003483ca0] [c000000000c9d048] schedule_preempt_disabled+0x18/0x30
[c000000003483cc0] [c000000000c9f49c] __mutex_lock.isra.11+0x36c/0x6f0
[c000000003483d50] [c000000000296228] kprobe_free_init_mem+0x48/0xe8
[c000000003483da0] [c0000000000127c4] kernel_init+0x44/0x1a0
[c000000003483e10] [c00000000000ce64] ret_from_kernel_thread+0x5c/0x64
INFO: task kworker/17:1:145 blocked for more than 122 seconds.
       Not tainted 5.17.0-rc1-next-20220124-autotest #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/17:1    state:D stack:    0 pid:  145 ppid:     2 
flags:0x00000800
Workqueue: events kprobe_optimizer
Call Trace:
[c00000004ccbb6d0] [000000077a820000] 0x77a820000 (unreliable)
[c00000004ccbb8c0] [c00000000001e328] __switch_to+0x278/0x490
[c00000004ccbb920] [c000000000c9c2f8] __schedule+0x318/0xa00
[c00000004ccbb9e0] [c000000000c9ca48] schedule+0x68/0x130
[c00000004ccbba10] [c000000000ca47c8] schedule_timeout+0x348/0x3f0
[c00000004ccbbaf0] [c000000000c9ec20] wait_for_completion+0x140/0x270
[c00000004ccbbb60] [c0000000001fb08c] __wait_rcu_gp+0x21c/0x230
[c00000004ccbbbc0] [c0000000001fb0e0] synchronize_rcu_tasks+0x40/0x70
[c00000004ccbbc20] [c0000000002927d0] kprobe_optimizer+0x1b0/0x3a0
[c00000004ccbbc90] [c0000000001724b8] process_one_work+0x288/0x560
[c00000004ccbbd30] [c000000000172808] worker_thread+0x78/0x620
[c00000004ccbbdc0] [c00000000017e7fc] kthread+0x11c/0x130
[c00000004ccbbe10] [c00000000000ce64] ret_from_kernel_thread+0x5c/0x64

call traces never ends and could not login

-- 
Regard's

Abdul Haleem
IBM Linux Technology Center

