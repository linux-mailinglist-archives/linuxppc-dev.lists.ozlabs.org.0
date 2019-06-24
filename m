Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C19B50EF1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 16:46:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XXDm3ghNzDqSB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 00:46:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XX8C5sylzDqLn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 00:42:51 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7EB4A30C1AE8;
 Mon, 24 Jun 2019 14:42:49 +0000 (UTC)
Received: from [10.36.116.107] (ovpn-116-107.ams2.redhat.com [10.36.116.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E82F60143;
 Mon, 24 Jun 2019 14:42:47 +0000 (UTC)
Subject: Re: [next][PowerPC] RCU stalls while booting linux-next on PowerVM
 LPAR
To: Sachin Sant <sachinp@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <0F3EAC10-0EA8-4097-99F2-BC42D92291FE@linux.vnet.ibm.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <83a31209-68cb-3e60-6b50-322154e6dcea@redhat.com>
Date: Mon, 24 Jun 2019 16:42:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <0F3EAC10-0EA8-4097-99F2-BC42D92291FE@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 24 Jun 2019 14:42:49 +0000 (UTC)
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
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24.06.19 16:09, Sachin Sant wrote:
> Latest -next fails to boot on POWER9 PowerVM LPAR due to RCU stalls.
> 
> This problem was introduced with next-20190620 (dc636f5d78).
> next-20190619 was last good kernel.
> 
> Reverting following commit allows the kernel to boot.
> 2fd4aeea6b603 : mm/memory_hotplug: move and simplify walk_memory_blocks()
> 
> 
> [    0.014409] Using shared cache scheduler topology
> [    0.016302] devtmpfs: initialized
> [    0.031022] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
> [    0.031034] futex hash table entries: 16384 (order: 5, 2097152 bytes, linear)
> [    0.031575] NET: Registered protocol family 16
> [    0.031724] audit: initializing netlink subsys (disabled)
> [    0.031796] audit: type=2000 audit(1561344029.030:1): state=initialized audit_enabled=0 res=1
> [    0.032249] cpuidle: using governor menu
> [    0.032403] pstore: Registered nvram as persistent store backend
> [   60.061246] rcu: INFO: rcu_sched self-detected stall on CPU
> [   60.061254] rcu: 	0-....: (5999 ticks this GP) idle=1ea/1/0x4000000000000002 softirq=5/5 fqs=2999 
> [   60.061261] 	(t=6000 jiffies g=-1187 q=0)
> [   60.061265] NMI backtrace for cpu 0
> [   60.061269] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.2.0-rc5-next-20190621-autotest-autotest #1
> [   60.061275] Call Trace:
> [   60.061280] [c0000018ee85f380] [c000000000b624ec] dump_stack+0xb0/0xf4 (unreliable)
> [   60.061287] [c0000018ee85f3c0] [c000000000b6d464] nmi_cpu_backtrace+0x144/0x150
> [   60.061293] [c0000018ee85f450] [c000000000b6d61c] nmi_trigger_cpumask_backtrace+0x1ac/0x1f0
> [   60.061300] [c0000018ee85f4f0] [c0000000000692c8] arch_trigger_cpumask_backtrace+0x28/0x40
> [   60.061306] [c0000018ee85f510] [c0000000001c5f90] rcu_dump_cpu_stacks+0x10c/0x16c
> [   60.061313] [c0000018ee85f560] [c0000000001c4fe4] rcu_sched_clock_irq+0x744/0x990
> [   60.061318] [c0000018ee85f630] [c0000000001d5b58] update_process_times+0x48/0x90
> [   60.061325] [c0000018ee85f660] [c0000000001ea03c] tick_periodic+0x4c/0x120
> [   60.061330] [c0000018ee85f690] [c0000000001ea150] tick_handle_periodic+0x40/0xe0
> [   60.061336] [c0000018ee85f6d0] [c00000000002b5cc] timer_interrupt+0x10c/0x2e0
> [   60.061342] [c0000018ee85f730] [c000000000009204] decrementer_common+0x134/0x140
> [   60.061350] --- interrupt: 901 at replay_interrupt_return+0x0/0x4
> [   60.061350]     LR = arch_local_irq_restore+0x84/0x90
> [   60.061357] [c0000018ee85fa30] [c0000018ee85fbac] 0xc0000018ee85fbac (unreliable)
> [   60.061364] [c0000018ee85fa50] [c000000000b88300] _raw_spin_unlock_irqrestore+0x50/0x80
> [   60.061369] [c0000018ee85fa70] [c000000000b69da4] klist_next+0xb4/0x150
> [   60.061376] [c0000018ee85fac0] [c000000000766ea0] subsys_find_device_by_id+0xf0/0x1a0
> [   60.061382] [c0000018ee85fb20] [c000000000797a94] walk_memory_blocks+0x84/0x100
> [   60.061388] [c0000018ee85fb80] [c000000000795ea0] link_mem_sections+0x40/0x60
> [   60.061395] [c0000018ee85fbb0] [c000000000f28c28] topology_init+0xa0/0x268
> [   60.061400] [c0000018ee85fc10] [c000000000010448] do_one_initcall+0x68/0x2c0
> [   60.061406] [c0000018ee85fce0] [c000000000f247dc] kernel_init_freeable+0x318/0x47c
> [   60.061411] [c0000018ee85fdb0] [c0000000000107c4] kernel_init+0x24/0x150
> [   60.061417] [c0000018ee85fe20] [c00000000000ba54] ret_from_kernel_thread+0x5c/0x68
> [   88.016563] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:1]
> [   88.016569] Modules linked in:
> 

Hi, thanks! Please see

https://lkml.org/lkml/2019/6/21/600

and especially

https://lkml.org/lkml/2019/6/21/908

Does this fix your problem? The fix is on its way to next.

Cheers!

-- 

Thanks,

David / dhildenb
