Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1B81B8BD9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 05:57:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498vJ92Sz1zDqgj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 13:57:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=yanaijie@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498vGb6GjpzDqbg
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 13:56:22 +1000 (AEST)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 4FC617E2074FFDF95B43;
 Sun, 26 Apr 2020 11:56:15 +0800 (CST)
Received: from [127.0.0.1] (10.166.213.7) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Sun, 26 Apr 2020
 11:56:08 +0800
Subject: Re: [PATCH v5 0/6] implement KASLR for powerpc/fsl_booke/64
To: Daniel Axtens <dja@axtens.net>, <mpe@ellerman.id.au>,
 <linuxppc-dev@lists.ozlabs.org>, <diana.craciun@nxp.com>,
 <christophe.leroy@c-s.fr>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <npiggin@gmail.com>, <keescook@chromium.org>,
 <kernel-hardening@lists.openwall.com>, <oss@buserror.net>
References: <20200330022023.3691-1-yanaijie@huawei.com>
 <87368su7lb.fsf@dja-thinkpad.axtens.net>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <7362ac94-8f3a-1eed-4445-10772eebea38@huawei.com>
Date: Sun, 26 Apr 2020 11:56:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <87368su7lb.fsf@dja-thinkpad.axtens.net>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.166.213.7]
X-CFilter-Loop: Reflected
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
Cc: linux-kernel@vger.kernel.org, zhaohongjiang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Daniel,

Thanks for the test. Can you send me the full log which may contain the 
system info such as the following:

-----------------------------------------------------
phys_mem_size     = 0x200000000
dcache_bsize      = 0x20
icache_bsize      = 0x20
cpu_features      = 0x00000003008003b6
   possible        = 0x00000003009003b6
   always          = 0x00000003008003b4
cpu_user_features = 0xdc008000 0x08000000
mmu_features      = 0x000a0010
firmware_features = 0x0000000000000000
physical_start    = 0x20000000
-----------------------------------------------------
barrier-nospec: using isync; sync as speculation barrier
Zone ranges:
   DMA      [mem 0x0000000000000000-0x000000007fffffff]
   Normal   [mem 0x0000000080000000-0x00000001ffffffff]
Movable zone start for each node
Early memory node ranges
   node   0: [mem 0x0000000000000000-0x00000001ffffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x00000001ffffffff]
MMU: Allocated 2112 bytes of context maps for 255 contexts
percpu: Embedded 32 pages/cpu s91736 r0 d39336 u131072
Built 1 zonelists, mobility grouping on.  Total pages: 2064384
Kernel command line: console=ttyS0 root=/dev/ram0
printk: log_buf_len individual max cpu contribution: 16384 bytes
printk: log_buf_len total cpu_extra contributions: 376832 bytes
printk: log_buf_len min size: 131072 bytes
printk: log_buf_len: 524288 bytes
printk: early log buf free: 127460(97%)
Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
mem auto-init: stack:off, heap alloc:off, heap free:off
Memory: 8135632K/8388608K available (10572K kernel code, 2000K rwdata, 
3396K rodata, 4124K init, 358K bss, 252976K reserved, 0K cma-reserved)
rcu: Hierarchical RCU implementation.
rcu:    RCU event tracing is enabled.
rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
mpic: Setting up MPIC " OpenPIC  " version 1.2 at fe0040000, max 24 CPUs
mpic: ISU size: 256, shift: 8, mask: ff
mpic: Initializing for 256 sources
random: get_random_u64 called from .start_kernel+0x724/0x954 with 
crng_init=0
clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 
0x5c4093a7d1, max_idle_ns: 440795210635 ns
clocksource: timebase mult[2800000] shift[24] registered
Console: colour dummy device 80x25
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
e6500 family performance monitor hardware support registered
rcu: Hierarchical SRCU implementation.
smp: Bringing up secondary CPUs ...
smp: Brought up 1 node, 24 CPUs



ÔÚ 2020/4/25 1:17, Daniel Axtens Ð´µÀ:
> Hi Jason,
> 
> Apologies for the delay in testing.
> 
> I'm seeing this problem when I try to boot on a t4240rdb:
> 
> random: get_random_u64 called from .start_kernel+0x734/0x964 with crng_init=0                               [8/973]
> clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0xa9210e89c, max_idle_ns: 440795203878 ns
> clocksource: timebase mult[15d17460] shift[24] registered
> Console: colour dummy device 80x25
> pid_max: default: 32768 minimum: 301
> Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
> Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
> e6500 family performance monitor hardware support registered
> rcu: Hierarchical SRCU implementation.
> smp: Bringing up secondary CPUs ...
> Processor 2 is stuck.
> Processor 3 is stuck.
> Processor 4 is stuck.
> Processor 5 is stuck.
> Processor 6 is stuck.
> Processor 7 is stuck.
> Processor 8 is stuck.
> Processor 9 is stuck.
> Processor 10 is stuck.
> Processor 11 is stuck.
> Processor 12 is stuck.
> Processor 13 is stuck.
> Processor 14 is stuck.
> ...
> Processor 22 is stuck.
> Processor 23 is stuck.
> smp: Brought up 1 node, 2 CPUs
> Using standard scheduler topology
> devtmpfs: initialized
> clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
> futex hash table entries: 8192 (order: 7, 524288 bytes, linear)
> NET: Registered protocol family 16
> audit: initializing netlink subsys (disabled)
> audit: type=2000 audit(108.032:1): state=initialized audit_enabled=0 res=1
> Machine: fsl,T4240RDB
> SoC family: QorIQ T4240
> SoC ID: svr:0x82480020, Revision: 2.0
> ... boot continues ...
> 
> 
> If I boot with nokaslr, all the CPUs come up with no issue.
> 
> This is on top of powerpc/merge at
> 8299da600ad05b8aa0f15ec0f5f03bd40e37d6f0. If you'd like me to test any
> debug patches I can do that.
> 
> I've attached my .config.
> 
> Regards,
> Daniel
> 
> 
> 
>> This is a try to implement KASLR for Freescale BookE64 which is based on
>> my earlier implementation for Freescale BookE32:
>> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=131718&state=*
>>
>> The implementation for Freescale BookE64 is similar as BookE32. One
>> difference is that Freescale BookE64 set up a TLB mapping of 1G during
>> booting. Another difference is that ppc64 needs the kernel to be
>> 64K-aligned. So we can randomize the kernel in this 1G mapping and make
>> it 64K-aligned. This can save some code to creat another TLB map at
>> early boot. The disadvantage is that we only have about 1G/64K = 16384
>> slots to put the kernel in.
>>
>>      KERNELBASE
>>
>>            64K                     |--> kernel <--|
>>             |                      |              |
>>          +--+--+--+    +--+--+--+--+--+--+--+--+--+    +--+--+
>>          |  |  |  |....|  |  |  |  |  |  |  |  |  |....|  |  |
>>          +--+--+--+    +--+--+--+--+--+--+--+--+--+    +--+--+
>>          |                         |                        1G
>>          |----->   offset    <-----|
>>
>>                                kernstart_virt_addr
>>
>> I'm not sure if the slot numbers is enough or the design has any
>> defects. If you have some better ideas, I would be happy to hear that.
>>
>> Thank you all.
>>
>> v4->v5:
>>    Fix "-Werror=maybe-uninitialized" compile error.
>>    Fix typo "similar as" -> "similar to".
>> v3->v4:
>>    Do not define __kaslr_offset as a fixed symbol. Reference __run_at_load and
>>      __kaslr_offset by symbol instead of magic offsets.
>>    Use IS_ENABLED(CONFIG_PPC32) instead of #ifdef CONFIG_PPC32.
>>    Change kaslr-booke32 to kaslr-booke in index.rst
>>    Switch some instructions to 64-bit.
>> v2->v3:
>>    Fix build error when KASLR is disabled.
>> v1->v2:
>>    Add __kaslr_offset for the secondary cpu boot up.
>>
>> Jason Yan (6):
>>    powerpc/fsl_booke/kaslr: refactor kaslr_legal_offset() and
>>      kaslr_early_init()
>>    powerpc/fsl_booke/64: introduce reloc_kernel_entry() helper
>>    powerpc/fsl_booke/64: implement KASLR for fsl_booke64
>>    powerpc/fsl_booke/64: do not clear the BSS for the second pass
>>    powerpc/fsl_booke/64: clear the original kernel if randomized
>>    powerpc/fsl_booke/kaslr: rename kaslr-booke32.rst to kaslr-booke.rst
>>      and add 64bit part
>>
>>   Documentation/powerpc/index.rst               |  2 +-
>>   .../{kaslr-booke32.rst => kaslr-booke.rst}    | 35 ++++++-
>>   arch/powerpc/Kconfig                          |  2 +-
>>   arch/powerpc/kernel/exceptions-64e.S          | 23 +++++
>>   arch/powerpc/kernel/head_64.S                 | 13 +++
>>   arch/powerpc/kernel/setup_64.c                |  3 +
>>   arch/powerpc/mm/mmu_decl.h                    | 23 +++--
>>   arch/powerpc/mm/nohash/kaslr_booke.c          | 91 +++++++++++++------
>>   8 files changed, 147 insertions(+), 45 deletions(-)
>>   rename Documentation/powerpc/{kaslr-booke32.rst => kaslr-booke.rst} (59%)
>>
>> -- 
>> 2.17.2

