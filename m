Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD4D5B629E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 23:17:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRKDP4rmDz3brL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 07:17:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SUH8leBu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SUH8leBu;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRKCj4v9dz2yjC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 07:16:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 69278B80CC2;
	Mon, 12 Sep 2022 21:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2842C433D6;
	Mon, 12 Sep 2022 21:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663017387;
	bh=q/Mz5deuYCdL8HvlFIGNTUkQbTJq61yoH7BE2u7Q99Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SUH8leBuMmGwat5ofs46IBsjxOLxRUUkm7HpjeBVR5r9uhRtOFZ2QBS5adLqHRFmb
	 MiaH0LDi4Z27DEYhIEEPaSz+E9gKgRrDm9XvQLXgmUYpwCHRTBbwhpdEpzXXUDKKSW
	 LQSnQV79N4QufYBYXnWDbUjxIxkxQI2SGVA5KOYQDwteeIfV0Q4EepyhehaScwov0R
	 WA/FpsfTvwp1ao+HgQXwca9qBSJN217Vo0uvvJBKlB0Mg6kRF4bmqk+VCapDnf4Zek
	 kiSVQYtOp3iTMy5UUItCuFM9UzorLF6F97BVOWpUA4ppVfF02g/x9B/UpqJhFQF/zi
	 drVFApl2KX2EQ==
Received: by pali.im (Postfix)
	id D8E8A11D3; Mon, 12 Sep 2022 23:16:23 +0200 (CEST)
Date: Mon, 12 Sep 2022 23:16:23 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: Fragmented physical memory on powerpc/32
Message-ID: <20220912211623.djb7fckgknyfmof7@pali>
References: <20220520080454.c3cqodsdbfbkmg56@pali>
 <935b426a-6c64-beb0-907f-8c3f0a089ab7@heyquark.com>
 <20220520123002.rd46p5ty6wumi7cc@pali>
 <20220609222420.ponpoodiqmaqtwht@pali>
 <20220808184034.lskqrk6z3gb5q76r@pali>
 <219cda7b-da4b-7a5a-9809-0878e0fc02ba@csgroup.eu>
 <20220908153511.57ceunyusziqfcav@pali>
 <20220908201701.sd3zqn5hfixmjvhh@pali>
 <9fbc5338-5e10-032a-8f55-e080bd93f74b@csgroup.eu>
 <Yx9GpV1XT8r2a++R@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yx9GpV1XT8r2a++R@kernel.org>
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

On Monday 12 September 2022 15:48:05 Mike Rapoport wrote:
> On Sat, Sep 10, 2022 at 09:39:20AM +0000, Christophe Leroy wrote:
> > + Adding Mike who might help if the problem is around memblock.
> > 
> > Le 08/09/2022 à 22:17, Pali Rohár a écrit :
> > > On Thursday 08 September 2022 17:35:11 Pali Rohár wrote:
> > >> On Thursday 08 September 2022 15:25:14 Christophe Leroy wrote:
> > >>> Le 08/08/2022 à 20:40, Pali Rohár a écrit :
> > >>>> On Friday 10 June 2022 00:24:20 Pali Rohár wrote:
> > >>>>> On Friday 20 May 2022 14:30:02 Pali Rohár wrote:
> > >>>>>> + linux-mm
> > >>>>>>
> > >>>>>> Do you know what are requirements for kernel to support non-contiguous
> > >>>>>> memory support and what is needed to enable it for 32-bit powerpc?
> > >>>>>
> > >>>>> Any hints?
> > >>>>
> > >>>> PING?
> > >>>>
> > >>>
> > >>> The tree following patches landed in powerpc/next branch, so they should
> > >>> soon be visible in linux-next too:
> > >>>
> > >>> fc06755e2562 ("powerpc/32: Drop a stale comment about reservation of
> > >>> gigantic pages")
> > >>> b0e0d68b1c52 ("powerpc/32: Allow fragmented physical memory")
> > >>> 0115953dcebe ("powerpc/32: Remove wii_memory_fixups()")
> > >>
> > >> Ou, nice! I will try to test it if it allows me to access more than 2GB
> > >> of RAM from 4GB DDR3 module with 32-bit addressing mode on P2020 CPU.
> > > 
> > > Hello! Ok, I have tried it from powerpc/next branch, but seems it does
> > > not work. I'm getting just early kernel crash.
> > > 
> > > [    0.000000] CPU maps initialized for 1 thread per core
> > > [    0.000000]  (thread shift is 0)
> > > [    0.000000] -----------------------------------------------------
> > > [    0.000000] phys_mem_size     = 0xbe500000
> > > [    0.000000] dcache_bsize      = 0x20
> > > [    0.000000] icache_bsize      = 0x20
> > > [    0.000000] cpu_features      = 0x0000000010010108
> > > [    0.000000]   possible        = 0x0000000010010108
> > > [    0.000000]   always          = 0x0000000010010108
> > > [    0.000000] cpu_user_features = 0x84e08000 0x08000000
> > > [    0.000000] mmu_features      = 0x00020010
> > > [    0.000000] -----------------------------------------------------
> > > mpc85xx_rdb_setup_arch()
> > > [    0.000000] ioremap() called early from of_iomap+0x48/0x80. Use early_ioremap() instead
> > > [    0.000000] MPC85xx RDB board from Freescale Semiconductor
> > > [    0.000000] barrier-nospec: using isync; sync as speculation barrier
> > > [    0.000000] barrier-nospec: patched 182 locations
> > > [    0.000000] Top of RAM: 0xff700000, Total RAM: 0xbe500000
> > > [    0.000000] Memory hole size: 1042MB
> > > [    0.000000] Zone ranges:
> > > [    0.000000]   Normal   [mem 0x0000000000000000-0x000000002fffffff]
> > > [    0.000000]   HighMem  [mem 0x0000000030000000-0x00000000ff6fffff]
> > > [    0.000000] Movable zone start for each node
> > > [    0.000000] Early memory node ranges
> > > [    0.000000]   node   0: [mem 0x0000000000000000-0x000000007fffffff]
> > > [    0.000000]   node   0: [mem 0x00000000c0200000-0x00000000eeffffff]
> > > [    0.000000]   node   0: [mem 0x00000000f0000000-0x00000000ff6fffff]
> > > [    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x00000000ff6fffff]
> > > [    0.000000] MMU: Allocated 1088 bytes of context maps for 255 contexts
> > > [    0.000000] percpu: Embedded 11 pages/cpu s14196 r8192 d22668 u45056
> > > [    0.000000] pcpu-alloc: s14196 r8192 d22668 u45056 alloc=11*4096
> > > [    0.000000] pcpu-alloc: [0] 0 [0] 1
> > > [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 777792
> > > [    0.000000] Kernel command line: root=ubi0:rootfs rootfstype=ubifs ubi.mtd=rootfs,2048 rootflags=chk_data_crc rw console=ttyS0,115200
> > > [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
> > > [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
> > > [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> > > [    0.000000] Kernel attempted to read user page (7df58) - exploit attempt? (uid: 0)
> > > [    0.000000] BUG: Unable to handle kernel data access on read at 0x0007df58
> > > [    0.000000] Faulting instruction address: 0xc01c8348
> > > [    0.000000] Oops: Kernel access of bad area, sig: 11 [#1]
> > > [    0.000000] BE PAGE_SIZE=4K SMP NR_CPUS=2 P2020RDB-PC
> > > [    0.000000] Modules linked in:
> > > [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.0.0-rc2-0caacb197b677410bdac81bc34f05235+ #121
> > > [    0.000000] NIP:  c01c8348 LR: c01cb2bc CTR: 0000000a
> > > [    0.000000] REGS: c10d7e20 TRAP: 0300   Not tainted  (6.0.0-rc2-0caacb197b677410bdac81bc34f05235+)
> > > [    0.000000] MSR:  00021000 <CE,ME>  CR: 48044224  XER: 00000000
> > > [    0.000000] DEAR: 0007df58 ESR: 00000000
> > > [    0.000000] GPR00: c01cb294 c10d7f10 c1045340 00000001 00000004 c112bcc0 00000015 eedf1000
> > > [    0.000000] GPR08: 00000003 0007df58 00000000 f0000000 28044228 00000200 00000000 00000000
> > > [    0.000000] GPR16: 00000000 00000000 00000000 0275cb7a c0000000 00000001 0000075f 00000000
> > > [    0.000000] GPR24: c1031004 00000000 00000000 00000001 c10f0000 eedf1000 00080000 00080000
> > > [    0.000000] NIP [c01c8348] free_unref_page_prepare.part.93+0x48/0x60
> > > [    0.000000] LR [c01cb2bc] free_unref_page+0x84/0x4b8
> > > [    0.000000] Call Trace:
> > > [    0.000000] [c10d7f10] [eedf1000] 0xeedf1000 (unreliable)
> > > [    0.000000] [c10d7f20] [c01cb294] free_unref_page+0x5c/0x4b8
> > > [    0.000000] [c10d7f70] [c1007644] mem_init+0xd0/0x194
> > > [    0.000000] [c10d7fa0] [c1000e4c] start_kernel+0x4c0/0x6d0
> > > [    0.000000] [c10d7ff0] [c00003e0] set_ivor+0x13c/0x178
> > > [    0.000000] Instruction dump:
> > > [    0.000000] 552817be 5509103a 7d294214 55293830 7d4a4a14 812a003c 814a0038 5529002a
> > > [    0.000000] 7c892050 5484c23a 5489eafa 548406fe <7d2a482e> 7d242430 5484077e 90870010
> > > [    0.000000] ---[ end trace 0000000000000000 ]---
> > > [    0.000000]
> > > [    0.000000] Kernel panic - not syncing: Fatal exception
> > > [    0.000000] Rebooting in 1 seconds..
> > > [    0.000000] System Halted, OK to turn off power
> > > 
> > > 4GB DDR3 SODIMM module is set via Freescale LBC to the whole 4 GB
> > > address range. And on ranges:
> > > 0x0000_0000 - 0x7fff_ffff
> > > 0xc020_0000 - 0xeeff_ffff
> > > 0xf000_0000 - 0xff6f_ffff
> > > there is no peripheral device, they are free for DRAM. Between these
> > > physical ranges are mapped peripheral devices (PCIe and NOR).
> > > 
> > > Any idea if I'm doing something wrong or there can be a bug in memory code?
> > > 
> > > Quite suspicious is that "Initmem setup node 0" prints one range where
> > > are also peripherals, not just DRAM. Crash is on address 0xc01c8348
> > > which belongs to PCIe.
> > > 
> > 
> > Yes I also find that "Initmem setup node 0" suspicious.
> > 
> > However the crash address 0xc01c8348 is valid kernel address. That's a 
> > virtual address, not a physical address, so that's not PCIe. That's 
> > kernel linear mapping, so that's likely physical address 0x001c8348 
> > offseted by PAGE_OFFSET which is 0xc0000000.
> 
> If I read the dump correctly, 0xc01c8348 is the PC of the instruction that
> crashed and the access was to 0x0007df58 which seem to well inside
> 0x0000_0000 - 0x7fff_ffff range.

I have tried to read and write memory at address 0x0007df58 in U-Boot
and it works fine without any crash.

I repeated that boot and it always failed with same errors at same
address. I have also tried to use different 4GB DDR module (just in case
if it is non-functional) but it failed on the same error on the same
address.

> And the "Early memory node ranges" look consistent with the memory layout
> above.
> 
> My guess would be that something went wrong in the linear map setup, but it
> won't hurt running with "memblock=debug" added to the kernel command line
> to see if there is anything suspicious there.

Here is boot log on serial console with memblock=debug command line:

[    0.000000] memblock_alloc_try_nid: 8 bytes align=0x4 nid=-1 from=0x00000000 max_addr=0x00000000 smp_setup_cpu_maps+0x40/0x2b4
[    0.000000] memblock_reserve: [0x2fff5d74-0x2fff5d7b] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] CPU maps initialized for 1 thread per core
[    0.000000]  (thread shift is 0)
[    0.000000] memblock_phys_free: [0x2fff5d74-0x2fff5d7b] setup_arch+0x1bc/0x318
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
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2fff2000-0x2fff3fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2fff0000-0x2fff1fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffee000-0x2ffeffff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffec000-0x2ffedfff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffea000-0x2ffebfff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffe8000-0x2ffe9fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffe6000-0x2ffe7fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffe4000-0x2ffe5fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffe2000-0x2ffe3fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8192 bytes align=0x2000 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_stack+0x2c/0x60
[    0.000000] memblock_reserve: [0x2ffe0000-0x2ffe1fff] memblock_alloc_range_nid+0xe8/0x1b0
mpc85xx_rdb_setup_arch()
[    0.000000] ioremap() called early from of_iomap+0x48/0x80. Use early_ioremap() instead
[    0.000000] memblock_alloc_try_nid: 4096 bytes align=0x1000 nid=-1 from=0x00000000 max_addr=0x00000000 early_pte_alloc_kernel+0x3c/0x90
[    0.000000] memblock_reserve: [0x2fff4000-0x2fff4fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] MPC85xx RDB board from Freescale Semiconductor
[    0.000000] barrier-nospec: using isync; sync as speculation barrier
[    0.000000] barrier-nospec: patched 182 locations
[    0.000000] memblock_alloc_try_nid: 4096 bytes align=0x1000 nid=-1 from=0x00000000 max_addr=0x00000000 early_pte_alloc_kernel+0x3c/0x90
[    0.000000] memblock_reserve: [0x2ffdf000-0x2ffdffff] memblock_alloc_range_nid+0xe8/0x1b0
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
[    0.000000] memblock_alloc_try_nid_raw: 37675008 bytes align=0x20 nid=0 from=0x00000000 max_addr=0x00000000 free_area_init+0x890/0xc94
[    0.000000] memblock_reserve: [0x2dbf1000-0x2ffdefff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 96 bytes align=0x20 nid=0 from=0x00000000 max_addr=0x00000000 setup_usemap+0x60/0xa0
[    0.000000] memblock_reserve: [0x2fff5d00-0x2fff5d5f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 416 bytes align=0x20 nid=0 from=0x00000000 max_addr=0x00000000 setup_usemap+0x60/0xa0
[    0.000000] memblock_reserve: [0x2fff5b60-0x2fff5cff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 32 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 mmu_context_init+0x38/0x154
[    0.000000] memblock_reserve: [0x2fff5b40-0x2fff5b5f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 1024 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 mmu_context_init+0x7c/0x154
[    0.000000] memblock_reserve: [0x2fff5740-0x2fff5b3f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 32 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 mmu_context_init+0xc4/0x154
[    0.000000] memblock_reserve: [0x2fff5720-0x2fff573f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] MMU: Allocated 1088 bytes of context maps for 255 contexts
[    0.000000] memblock_alloc_try_nid: 116 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 start_kernel+0x194/0x6d0
[    0.000000] memblock_reserve: [0x2fff56a0-0x2fff5713] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 116 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 start_kernel+0x1c0/0x6d0
[    0.000000] memblock_reserve: [0x2fff5620-0x2fff5693] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 4096 bytes align=0x1000 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_embed_first_chunk+0x314/0x7b4
[    0.000000] memblock_reserve: [0x2dbf0000-0x2dbf0fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 4096 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_embed_first_chunk+0x4d4/0x7b4
[    0.000000] memblock_reserve: [0x2dbef000-0x2dbeffff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 90112 bytes align=0x1000 nid=-1 from=0x3fffffff max_addr=0x00000000 pcpu_embed_first_chunk+0x564/0x7b4
[    0.000000] memblock_reserve: [0x2dbd9000-0x2dbeefff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_phys_free: [0x2dbe4000-0x2dbe3fff] pcpu_embed_first_chunk+0x680/0x7b4
[    0.000000] memblock_phys_free: [0x2dbef000-0x2dbeefff] pcpu_embed_first_chunk+0x680/0x7b4
[    0.000000] percpu: Embedded 11 pages/cpu s14196 r8192 d22668 u45056
[    0.000000] memblock_alloc_try_nid: 4 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_setup_first_chunk+0x37c/0x924
[    0.000000] memblock_reserve: [0x2fff5d60-0x2fff5d63] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 4 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_setup_first_chunk+0x3a4/0x924
[    0.000000] memblock_reserve: [0x2fff5600-0x2fff5603] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_setup_first_chunk+0x3cc/0x924
[    0.000000] memblock_reserve: [0x2fff55e0-0x2fff55e7] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 8 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_setup_first_chunk+0x3f4/0x924
[    0.000000] memblock_reserve: [0x2fff55c0-0x2fff55c7] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] pcpu-alloc: s14196 r8192 d22668 u45056 alloc=11*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 
[    0.000000] memblock_alloc_try_nid: 136 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_setup_first_chunk+0x7fc/0x924
[    0.000000] memblock_reserve: [0x2fff5520-0x2fff55a7] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 96 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0x64/0x2e0
[    0.000000] memblock_reserve: [0x2fff54c0-0x2fff551f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 384 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0xc4/0x2e0
[    0.000000] memblock_reserve: [0x2fff5340-0x2fff54bf] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 388 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0xf0/0x2e0
[    0.000000] memblock_reserve: [0x2fff51a0-0x2fff5323] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 96 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0x11c/0x2e0
[    0.000000] memblock_reserve: [0x2fff5140-0x2fff519f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 96 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0x64/0x2e0
[    0.000000] memblock_reserve: [0x2fff50e0-0x2fff513f] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 768 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0xc4/0x2e0
[    0.000000] memblock_reserve: [0x2dbd8d00-0x2dbd8fff] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 772 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0xf0/0x2e0
[    0.000000] memblock_reserve: [0x2dbd89e0-0x2dbd8ce3] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_alloc_try_nid: 192 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 pcpu_alloc_first_chunk+0x11c/0x2e0
[    0.000000] memblock_reserve: [0x2fff5020-0x2fff50df] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] memblock_phys_free: [0x2dbf0000-0x2dbf0fff] pcpu_embed_first_chunk+0x744/0x7b4
[    0.000000] memblock_phys_free: [0x2dbef000-0x2dbeffff] pcpu_embed_first_chunk+0x754/0x7b4
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 777792
[    0.000000] Kernel command line: root=ubi0:rootfs rootfstype=ubifs ubi.mtd=rootfs,2048 rootflags=chk_data_crc rw console=ttyS0,115200 memblock=debug
[    0.000000] memblock_alloc_try_nid: 524288 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_large_system_hash+0x1a4/0x2ec
[    0.000000] memblock_reserve: [0x2db589e0-0x2dbd89df] memblock_alloc_range_nid+0xe8/0x1b0
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
[    0.000000] memblock_alloc_try_nid: 262144 bytes align=0x20 nid=-1 from=0x00000000 max_addr=0x00000000 alloc_large_system_hash+0x1a4/0x2ec
[    0.000000] memblock_reserve: [0x2db189e0-0x2db589df] memblock_alloc_range_nid+0xe8/0x1b0
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

Do you need something more for debug?

> > Do you have a way to reproduce this problem under QEMU ?

Well, I really do not know how to run it in QEMU. IIRC QEMU does not
have support for P2020 processor. Is there any guidance?

> > Thanks
> > Christophe
> 
> -- 
> Sincerely yours,
> Mike.
