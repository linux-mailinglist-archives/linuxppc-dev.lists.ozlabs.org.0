Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC89D4A5BB2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 13:02:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp3Tn5mnVz3bbH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 23:02:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CHbuvPp7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp3T85qh4z2xs7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 23:02:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=CHbuvPp7; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Jp3T76FXZz4xcT;
 Tue,  1 Feb 2022 23:02:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1643716940;
 bh=71VALrlG0fypET2mh+qfwMtZY4552VG0f/3Dazr4eKM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=CHbuvPp7WVx4vxJTxwU+ApR/Ye/FJNp8qrNgEOsbg1N7O5O+Fs2yXtXuWBfUsWTbr
 QZDwUPsKhnJe+u41DeyRIG8u4ehy2+l5Vve4wK2SSymO3YZWxlpv5RhtF6+AeE1rrV
 G3qG7su+W551f18MyNF4mb50wupAxwsPGD/ZFqTc/79DjMACGL44zm3PtwGsvepI/w
 QKiGY/+OBGne07Q/JcmXPQUQdCL28OXkUlePvf2bWfkOqvUCzk2g6JFmzTJMLnPqAY
 6DcLJT1KxcNMCX+nIRJ9UIsrmNKfIIuY9wcYsdEKUiz6gWf/YfQDYwpGPvu3VSl0DT
 bpWyfJRL6zG6Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Abdul Haleem
 <abdhalee@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [Oops][next-20220128] 5.17.0-rc1 kernel panics on my powerpc box
In-Reply-To: <YffISHu7b/qMEdUa@smile.fi.intel.com>
References: <352a3db0-3e84-ee91-2f51-f687899d9bd2@linux.vnet.ibm.com>
 <YffISHu7b/qMEdUa@smile.fi.intel.com>
Date: Tue, 01 Feb 2022 23:02:19 +1100
Message-ID: <87leyun6b8.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
 Stephen Rothwell <sfr@canb.auug.org.au>, heikki.krogerus@linux.intel.com,
 peterz@infradead.org, linux-next <linux-next@vger.kernel.org>,
 Brian King <brking@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
> On Mon, Jan 31, 2022 at 12:30:14PM +0530, Abdul Haleem wrote:
>> Greeting's
>> 
>> Today's linux-next kernel failed to boot 5.17.0-rc1-next-20220128 with kernel Oops on PowerVM LPAR
>> 
>> dmesg:
>> Started hybrid virtual network scan and config.
>> Started VDO volume services.
>> Started Dynamic System Tuning Daemon.
>> Attempted to run process '/opt/rsct/bin/trspoolmgr' with NULL argv
>> Created slice system-systemd\x2dcoredump.slice.
>> Started Process Core Dump (PID 3726/UID 0).
>> Started Process Core Dump (PID 4032/UID 0).
>> Started Process Core Dump (PID 4200/UID 0).
>> Started RMC-Resource Monitioring and Control.
>> Started Process Core Dump (PID 4319/UID 0).
>> rpaphp: RPA HOT Plug PCI Controller Driver version: 0.1
>> rpaphp: Slot [U78D2.001.WZS01DT-P1-C10] registered
>> Started Process Core Dump (PID 4687/UID 0).
>> Started Process Core Dump (PID 4806/UID 0).
>> Started Process Core Dump (PID 4973/UID 0).
>> Async-gnnft timeout - hdl=7.
>> BUG: Unable to handle kernel data access on read at 0x5deadbeef000012a
>> Faulting instruction address: 0xc000000000221f4c
>> Oops: Kernel access of bad area, sig: 11 [#1]
>> LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>> Modules linked in: rpadlpar_io rpaphp tcp_diag udp_diag inet_diag unix_diag af_packet_diag netlink_diag bonding rfkill sunrpc dm_round_robin dm_multipath dm_mod ocrdma ib_uverbs ib_core pseries_rng xts vmx_crypto uio_pdrv_genirq gf128mul uio sch_fq_codel ext4 mbcache jbd2 sd_mod sg qla2xxx ibmvscsi ibmveth scsi_transport_srp nvme_fc nvme_fabrics nvme_core be2net t10_pi scsi_transport_fc
>> CPU: 8 PID: 5782 Comm: mksquashfs Not tainted 5.17.0-rc1-next-20220128-autotest #1
>> NIP:  c000000000221f4c LR: c000000000221ee4 CTR: 0000000000000006
>> REGS: c0000001008bb920 TRAP: 0380   Not tainted  (5.17.0-rc1-next-20220128-autotest)
>> MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24004224  XER: 20040000
>> CFAR: c000000000220df8 IRQMASK: 1
>> GPR00: c000000000221ee4 c0000001008bbbc0 c0000000028d6100 00000000ffff9cc0
>> GPR04: 0000000000000000 00000000000001c0 00000000000001c0 0000000000000000
>> GPR08: 0000000000000000 5deadbeef0000122 c0000001008bbbe8 0000000000000001
>> GPR12: c000000000221d50 c000000007fe6680 00007fffbcf00000 0000000000000100
>> GPR16: 0000000000000100 00007fffbce64420 0000000000000001 0000000000000002
>> GPR20: c000000002912108 5deadbeef0000122 c00000079c008668 0000000000000000
>> GPR24: 0000000000000000 c0000001008bbbe8 00000000ffff9540 c000000002913a00
>> GPR28: 0000000000000000 c0000000a4560950 c00000079c008600 c0000000020e8600
>> NIP [c000000000221f4c] run_timer_softirq+0x1fc/0x7c0
>> LR [c000000000221ee4] run_timer_softirq+0x194/0x7c0
>> Call Trace:
>> [c0000001008bbbc0] [c000000000221ee4] run_timer_softirq+0x194/0x7c0 (unreliable)
>> [c0000001008bbc90] [c000000000ca7e5c] __do_softirq+0x15c/0x3d0
>> [c0000001008bbd80] [c00000000014f538] irq_exit+0x168/0x1b0
>> [c0000001008bbdb0] [c000000000027184] timer_interrupt+0x1a4/0x3e0
>> [c0000001008bbe10] [c000000000009a08] decrementer_common_virt+0x208/0x210
>> --- interrupt: 900 at 0x7fffbccb3850
>> NIP:  00007fffbccb3850 LR: 00007fffbccb51f8 CTR: 0000000000000000
>> REGS: c0000001008bbe80 TRAP: 0900   Not tainted  (5.17.0-rc1-next-20220128-autotest)
>> MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 42004488  XER: 20040000
>> CFAR: 0000000000000000 IRQMASK: 0
>> GPR00: 0000000000007fff 00007ffe8afde4d0 00007fffbcce7f00 00007ffe74020c50
>> GPR04: 0000000000006bfa 0000000000003cf1 00007ffe740223a0 0000000000000005
>> GPR08: 00007ffe74028fb4 00000000000009a3 0000000000000004 0000000000000039
>> GPR12: 00007ffe740323b0 00007ffe8afe68e0 00007fffbcf00000 00007ffe8a7d0000
>> GPR16: 00007fffbce64410 00007fffbce64420 0000000000000000 00007fffbce60318
>> GPR20: 00007ffe740323b0 00007ffe740423c0 0000000000003fff 0000000000000005
>> GPR24: 0000000000000004 00007fffbccc8058 0000000000000000 000000000000000c
>> GPR28: 0000000000000102 0000000000004415 00007ffe7402df8b 00007ffe7402e08d
>> NIP [00007fffbccb3850] 0x7fffbccb3850
>> LR [00007fffbccb51f8] 0x7fffbccb51f8
>> --- interrupt: 900
>> Instruction dump:
>> 60000000 e9390000 2fa90000 419effc8 ebb90000 fbbe0008 60000000 e93d0000
>> e95d0008 2fa90000 f92a0000 419e0008 <f9490008> 813d0020 fb1d0008 ea9d0018
>> ---[ end trace 0000000000000000 ]---
>> 
>> The fault instruction points to
>> 
>> # gdb -batch /boot/vmlinuz-5.17.0-rc1-next-20220128-autotest -ex 'list *(0xc000000000221f4c)'
>> 0xc000000000221f4c is in run_timer_softirq (./include/linux/list.h:850).
>> 845		struct hlist_node *next = n->next;
>> 846		struct hlist_node **pprev = n->pprev;
>> 847	
>> 848		WRITE_ONCE(*pprev, next);
>> 849		if (next)
>> 850			WRITE_ONCE(next->pprev, pprev);
>> 851	}
>> 852	
>> 853	/**
>> 854	 * hlist_del - Delete the specified hlist_node from its list
>
> It's quite likely not a culprit, but the result of some (race?) condition.
> Cc'ing to Thomas, maybe he has an idea.

The disassembly says we're storing r10 to r9 + 8. If you look at the
first register dump, r9 is 5deadbeef0000122 which is:

#define LIST_POISON2  ((void *) 0x122 + POISON_POINTER_DELTA)


So we seem to be deleting a list entry that's already been deleted?

cheers
