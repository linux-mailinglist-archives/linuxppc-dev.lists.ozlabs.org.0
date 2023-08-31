Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCB278F5C2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 00:45:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=yh7JMTDq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcGTR5pPdz2xq6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 08:45:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=yh7JMTDq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=2001:67c:2050:0:465::202; helo=mout-p-202.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050:0:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcGSR6wh4z2xqw
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 08:44:35 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4RcGS428Hpz9t0S;
	Fri,  1 Sep 2023 00:44:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1693521860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qUw2H/dvjsNLuSO1gvdUjEjuokgX99MyTBeskHf2Zic=;
	b=yh7JMTDqvWjwpMOCR8ATCNf+P2YBSVH7WgiWtNR4+ijgteacpuIjxZhQ9w+SDULUdtalZB
	5awH7JjeqfYYp5Ny9iI1L+P6gnjGA0g0/SMbEBjASexgZnD7ngGPesLrD8CVOo7Lbeqz5s
	l8VMrJ+r1KI+M6ZLXGO3PTxvk89BfLRm9kZU7KgoUgS2dabdKoiSAJPkBY6Sqp6sYpQq6r
	U4/xNoOQxTG440kLO+6l97Mf5Ujqt8+VqrVtsbA2ByH22gQY9qoOp5e3mXzONKED6Kxo+I
	iH1zUuIKqxWDVpRIFcZgQZG4M6iWnVRwHl70Jsrmhsr+NCs32VEQcHYVe50ktQ==
Date: Fri, 1 Sep 2023 00:44:17 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Message-ID: <20230901004417.631dc019@yea>
In-Reply-To: <1085cc49-b5e8-0aa5-dc97-ec4a100463b5@csgroup.eu>
References: <20230811014845.1bf6771d@yea>
	<f8f09049-3568-621d-88ce-1b61fe8b63fe@csgroup.eu>
	<20230813213855.794b3c8f@yea>
	<57bdfad9-cbec-1a9f-aca7-5956d22a8ada@csgroup.eu>
	<20230814192748.56525c82@yea>
	<6d710a2b-5cac-9f0a-cd30-0ad18172932b@csgroup.eu>
	<20230815220156.5c234b52@yea>
	<0876e754-7bee-ec61-4e3c-c0ee08d59d87@csgroup.eu>
	<20230817203202.2b4c273c@yea>
	<87y1i9clf2.fsf@mail.lhotse>
	<20230818111641.7f680ce7@yea>
	<fcdf2bf7-0834-b27f-4d24-28e05815ee6f@csgroup.eu>
	<20230818182316.79303545@yea>
	<5ea3302e-0fb1-1670-e4b6-adba5115ab94@csgroup.eu>
	<20230824020015.78733931@yea>
	<87jztkvfid.fsf@mail.lhotse>
	<20230828011758.3b7b9daf@yea>
	<1085cc49-b5e8-0aa5-dc97-ec4a100463b5@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: j4o7k6jorqit5wbffujeysj4ac64psbh
X-MBO-RS-ID: 56dc74d21470090ae9e
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 31 Aug 2023 05:32:46 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Ok so there is some corrupted memory somewhere.
> 
> Can you try what happens when you remove the call to kasan_init() at the 
> start of setup_arch() in arch/powerpc/kernel/setup-common.c

Ok, so I left the other patches in place + btext_map() instead of btext_unmap() at the end of MMU_init() + Michaels patch and additionally commented-out kasan_init() as stated above. The outcome is rather interesting! Now I deterministically get this output at boot OF console, regardless wheter it's a cold boot or warm boot:

via-pmu: Server Mode is disabled
PMU driver v2 initialized for Core99, firmware: 0c
ioremap() called early from pmac_nvram_init+0x208/0x7c0. Use early_ioremap() instead
nvram: Checking bank 0...
nvram: gen0=3234, gen1=3235
nvram: Active bank is: 1
nvram: OF partition at 0x410
nvram: XP partition at 0x1020
nvram: NR partition at 0x1120
Top of RAM: 0x80000000, Total RAM: 0x80000000
Memory hole size: 0MB
Zone ranges:
  DMA      [mem 0x0000000000000000-0x000000002fffffff]
  Normal   empty
  HighMem  [mem 0x0000000030000000-0x000000007fffffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000000000-0x000000007fffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x000000007fffffff]
percpu: Embedded 14 pages/cpu s24608 r8192 d24544 u57344
pcpu-alloc: s24608 r8192 d24544 u57344 alloc=14*4096
pcpu-alloc: [0] 0 
Kernel command line: ro root=/dev/sda5 nr_cpus=1 zswap.max_pool_percent=16 slub_debug=FZP page_poison=1 netconsole=6666@192.168.178.8/eth0,6666@192.168.178.3/70:85:C2:30:EC:01 init=/usr/lib/systemd/systemd 
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
Built 1 zonelists, mobility grouping on.  Total pages: 522560
mem auto-init: stack:all(pattern), heap alloc:off, heap free:off
stackdepot: allocating hash table via alloc_large_system_hash
stackdepot hash table entries: 1048576 (order: 10, 4194304 bytes, linear)
==================================================================
BUG: KASAN: stack-out-of-bounds in __kernel_poison_pages+0x6c/0xd0
Write of size 4896 at addr c17a7000 by task swapper/0

CPU: 0 PID: 0 Comm: swapper Tainted: G                T 6.5.0-rc7-PMacG4-dirty #7
Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
Call Trace:
[c1717ce0] [c0f4ec40] dump_stack_lvl+0x60/0xa4 (unreliable)
[c1717d00] [c0368380] print_report+0x154/0x548
[c1717d50] [c036813c] kasan_report+0xd0/0x160
[c1717db0] [c0369bb4] kasan_check_range+0x1c8/0x308
[c1717dc0] [c036ae88] memset+0x34/0x90
[c1717de0] [c035b6e0] __kernel_poison_pages+0x6c/0xd0
[c1717e00] [c03355e4] __free_pages_ok+0x418/0x500
[c1717e60] [c14372c8] memblock_free_all+0x268/0x400
[c1717f20] [c14103fc] mem_init+0x8c/0x274
[c1717f60] [c1431cd0] mm_core_init+0x240/0x4e0
[c1717fc0] [c1404694] start_kernel+0x150/0x2d8
[c1717f00] [000035d0] 0x35d0

The buggy address belongs to the physical page:
page:(ptrval) refcount:0 mapcount:0 mapping:00000000 index:0x0 pfn:0x17a7
flags: 0x0(zone=0)
page_type: 0xffffffff()
raw: 00000000 eee15380 eee15380 00000000 00000000 00000000 ffffffff 00000000
raw: 00000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 c17a7d00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 c17a7d80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>c17a7e00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f1 f1
                                                     ^
 c17a7e80: f1 f1 04 f2 04 f2 00 f3 f3 f3 00 00 00 00 00 00
 c17a7f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================
Disabling lock debugging due to kernel taint

> I'd also be curious to know what happens when CONFIG_DEBUG_SPINLOCK is 
> disabled.

Disabling CONFIG_DEBUG_SPINLOCK does not change the output above. ^^

> Another question which I'm no sure I asked already: Is it a new problem 
> you have got with recent kernels or is it just that you never tried such 
> a config with older kernels ?

I wanted to revisit https://bugzilla.kernel.org/show_bug.cgi?id=216041 and verify whether it was resolved. KASAN worked around 2019-2021 on my G4 as I reported some bugs with it around that time and you fixed some of the bugs. ;) Like kernel bugzilla #205099, #216190, #205885.

But it always seemed flaky on the G4 and had it's problems. So I can't tell whether this specific issue was there back then or if it's new. At least bug #216190 was also about KASAN and SMP issues.

> Also, when you say you need to start with another SMP kernel first and 
> then you don't have the problem anymore until the next cold reboot, do 
> you mean you have some old kernel with KASAN that works, or is it a 
> kernel without KASAN that you have to start first ?

First. I start with a non-KASAN SMP kernel and afterwards reboot into a KASAN kernel. But now with kasan_init() commented-out in start of setup_arch() in arch/powerpc/kernel/setup-common.c this does not work anymore. I get the dmesg above all the time, at cold and warm boots.

Regards,
Erhard
