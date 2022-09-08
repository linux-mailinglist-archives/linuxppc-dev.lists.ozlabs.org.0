Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2052B5B278B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 22:17:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNr5j0Qqbz3c69
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 06:17:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PQvUlIRm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PQvUlIRm;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNr5144HWz2yxF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 06:17:09 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9EECA61E17;
	Thu,  8 Sep 2022 20:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2710C433D6;
	Thu,  8 Sep 2022 20:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662668225;
	bh=UnYylULOkHR7QFL6Y7S5gK3b4PS/zmUGT3UUGNRBfRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PQvUlIRmg97i9Op09dMWk1YoAo8E+LWs1yxnta49h3wbF5FnyXJNlCF0CMda3AJbj
	 STvwqKVBhd8YYbZX85rh11uBMxgOX4IdT0Ky6rln6bTr4B1yIGGY8Qnd4lLNQiTJhR
	 cA5sddYaI17OXCq5k2tm4IYz99YHo1v9rNNkKIwybCSVzBmRVsGFNG57SQp/CEEA91
	 yNXoSeBxCMKvsSAYlvuUM4SCVh3y2KCpHg15lQ1nEf04jVbdUe+4VWF01ceH4nBL86
	 JunmobmWD5CI/OZ6p3TitEcuOqtr/7C6BFnv5M8aFXCfaM9cNx046sUXLuy3/MRAAR
	 0axTiR1x5Xa6w==
Received: by pali.im (Postfix)
	id 8CB997EF; Thu,  8 Sep 2022 22:17:01 +0200 (CEST)
Date: Thu, 8 Sep 2022 22:17:01 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Fragmented physical memory on powerpc/32
Message-ID: <20220908201701.sd3zqn5hfixmjvhh@pali>
References: <20220302044406.63401-12-ash@heyquark.com>
 <20220513224353.n56qg5fhstbaqhfz@pali>
 <d84e4d24-f350-80fc-6c31-b7e7f8d429f4@heyquark.com>
 <20220520080454.c3cqodsdbfbkmg56@pali>
 <935b426a-6c64-beb0-907f-8c3f0a089ab7@heyquark.com>
 <20220520123002.rd46p5ty6wumi7cc@pali>
 <20220609222420.ponpoodiqmaqtwht@pali>
 <20220808184034.lskqrk6z3gb5q76r@pali>
 <219cda7b-da4b-7a5a-9809-0878e0fc02ba@csgroup.eu>
 <20220908153511.57ceunyusziqfcav@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220908153511.57ceunyusziqfcav@pali>
User-Agent: NeoMutt/20180716
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "paulus@samba.org" <paulus@samba.org>, Ash Logan <ash@heyquark.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "j.ne@posteo.net" <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thursday 08 September 2022 17:35:11 Pali Rohár wrote:
> On Thursday 08 September 2022 15:25:14 Christophe Leroy wrote:
> > Le 08/08/2022 à 20:40, Pali Rohár a écrit :
> > > On Friday 10 June 2022 00:24:20 Pali Rohár wrote:
> > >> On Friday 20 May 2022 14:30:02 Pali Rohár wrote:
> > >>> + linux-mm
> > >>>
> > >>> Do you know what are requirements for kernel to support non-contiguous
> > >>> memory support and what is needed to enable it for 32-bit powerpc?
> > >>
> > >> Any hints?
> > > 
> > > PING?
> > > 
> > 
> > The tree following patches landed in powerpc/next branch, so they should 
> > soon be visible in linux-next too:
> > 
> > fc06755e2562 ("powerpc/32: Drop a stale comment about reservation of 
> > gigantic pages")
> > b0e0d68b1c52 ("powerpc/32: Allow fragmented physical memory")
> > 0115953dcebe ("powerpc/32: Remove wii_memory_fixups()")
> 
> Ou, nice! I will try to test it if it allows me to access more than 2GB
> of RAM from 4GB DDR3 module with 32-bit addressing mode on P2020 CPU.

Hello! Ok, I have tried it from powerpc/next branch, but seems it does
not work. I'm getting just early kernel crash.

[    0.000000] CPU maps initialized for 1 thread per core
[    0.000000]  (thread shift is 0)
[    0.000000] -----------------------------------------------------
[    0.000000] phys_mem_size     = 0xbe500000
[    0.000000] dcache_bsize      = 0x20
[    0.000000] icache_bsize      = 0x20
[    0.000000] cpu_features      = 0x0000000010010108
[    0.000000]   possible        = 0x0000000010010108
[    0.000000]   always          = 0x0000000010010108
[    0.000000] cpu_user_features = 0x84e08000 0x08000000
[    0.000000] mmu_features      = 0x00020010
[    0.000000] -----------------------------------------------------
mpc85xx_rdb_setup_arch()
[    0.000000] ioremap() called early from of_iomap+0x48/0x80. Use early_ioremap() instead
[    0.000000] MPC85xx RDB board from Freescale Semiconductor
[    0.000000] barrier-nospec: using isync; sync as speculation barrier
[    0.000000] barrier-nospec: patched 182 locations
[    0.000000] Top of RAM: 0xff700000, Total RAM: 0xbe500000
[    0.000000] Memory hole size: 1042MB
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x000000002fffffff]
[    0.000000]   HighMem  [mem 0x0000000030000000-0x00000000ff6fffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000007fffffff]
[    0.000000]   node   0: [mem 0x00000000c0200000-0x00000000eeffffff]
[    0.000000]   node   0: [mem 0x00000000f0000000-0x00000000ff6fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x00000000ff6fffff]
[    0.000000] MMU: Allocated 1088 bytes of context maps for 255 contexts
[    0.000000] percpu: Embedded 11 pages/cpu s14196 r8192 d22668 u45056
[    0.000000] pcpu-alloc: s14196 r8192 d22668 u45056 alloc=11*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 777792
[    0.000000] Kernel command line: root=ubi0:rootfs rootfstype=ubifs ubi.mtd=rootfs,2048 rootflags=chk_data_crc rw console=ttyS0,115200
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Kernel attempted to read user page (7df58) - exploit attempt? (uid: 0)
[    0.000000] BUG: Unable to handle kernel data access on read at 0x0007df58
[    0.000000] Faulting instruction address: 0xc01c8348
[    0.000000] Oops: Kernel access of bad area, sig: 11 [#1]
[    0.000000] BE PAGE_SIZE=4K SMP NR_CPUS=2 P2020RDB-PC
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.0.0-rc2-0caacb197b677410bdac81bc34f05235+ #121
[    0.000000] NIP:  c01c8348 LR: c01cb2bc CTR: 0000000a
[    0.000000] REGS: c10d7e20 TRAP: 0300   Not tainted  (6.0.0-rc2-0caacb197b677410bdac81bc34f05235+)
[    0.000000] MSR:  00021000 <CE,ME>  CR: 48044224  XER: 00000000
[    0.000000] DEAR: 0007df58 ESR: 00000000
[    0.000000] GPR00: c01cb294 c10d7f10 c1045340 00000001 00000004 c112bcc0 00000015 eedf1000
[    0.000000] GPR08: 00000003 0007df58 00000000 f0000000 28044228 00000200 00000000 00000000
[    0.000000] GPR16: 00000000 00000000 00000000 0275cb7a c0000000 00000001 0000075f 00000000
[    0.000000] GPR24: c1031004 00000000 00000000 00000001 c10f0000 eedf1000 00080000 00080000
[    0.000000] NIP [c01c8348] free_unref_page_prepare.part.93+0x48/0x60
[    0.000000] LR [c01cb2bc] free_unref_page+0x84/0x4b8
[    0.000000] Call Trace:
[    0.000000] [c10d7f10] [eedf1000] 0xeedf1000 (unreliable)
[    0.000000] [c10d7f20] [c01cb294] free_unref_page+0x5c/0x4b8
[    0.000000] [c10d7f70] [c1007644] mem_init+0xd0/0x194
[    0.000000] [c10d7fa0] [c1000e4c] start_kernel+0x4c0/0x6d0
[    0.000000] [c10d7ff0] [c00003e0] set_ivor+0x13c/0x178
[    0.000000] Instruction dump:
[    0.000000] 552817be 5509103a 7d294214 55293830 7d4a4a14 812a003c 814a0038 5529002a
[    0.000000] 7c892050 5484c23a 5489eafa 548406fe <7d2a482e> 7d242430 5484077e 90870010
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000]
[    0.000000] Kernel panic - not syncing: Fatal exception
[    0.000000] Rebooting in 1 seconds..
[    0.000000] System Halted, OK to turn off power

4GB DDR3 SODIMM module is set via Freescale LBC to the whole 4 GB
address range. And on ranges:
0x0000_0000 - 0x7fff_ffff
0xc020_0000 - 0xeeff_ffff
0xf000_0000 - 0xff6f_ffff
there is no peripheral device, they are free for DRAM. Between these
physical ranges are mapped peripheral devices (PCIe and NOR).

Any idea if I'm doing something wrong or there can be a bug in memory code?

Quite suspicious is that "Initmem setup node 0" prints one range where
are also peripherals, not just DRAM. Crash is on address 0xc01c8348
which belongs to PCIe.
