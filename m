Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B761A0DE9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 14:43:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xRt024jczDqGl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 22:43:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xRqk6R9TzDqBv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 22:41:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hgOqSRZv; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48xRqj3pY3z9sSG;
 Tue,  7 Apr 2020 22:41:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1586263314;
 bh=mloPuwvrvCgw/+n4Mv7vVJzhGcuNlIVm5P71FJl60aY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hgOqSRZv0dsv7fqioyb5kAUzmNVIPLMRm3EcfVjvOl2h0resbqSclb8prxr94/10n
 tva1eMgQOvU71V6RTFm6bv+zID6yDN4ckbe4RRkOPjeKPXWPzCL5WlfUOBUt0DWGxr
 ApwcOqzlyumYzXMa0D0m8kfirGfOD/IV8VMGrEh5QWKdI855aLatZuWTc0229RF25J
 SOBjKDKociiCTtfdA3WFs9+rO4Url1UzT4Ph/FIIAnnAY+oSDZp16pXOjD92XauGcW
 n8RbgY4ZgnWw5AN4kMW7DUoqjYcongZfJ5CTW0RnN2uDFOz/hqsj4ZnPOsb8gCVnq3
 8qp2YIukW19iw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Qian Cai <cai@lca.pw>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Linux-next POWER9 NULL pointer NIP since 1st Apr.
In-Reply-To: <15AC5B0E-A221-4B8C-9039-FA96B8EF7C88@lca.pw>
References: <15AC5B0E-A221-4B8C-9039-FA96B8EF7C88@lca.pw>
Date: Tue, 07 Apr 2020 22:42:01 +1000
Message-ID: <87eeszlb6u.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Qian Cai <cai@lca.pw> writes:
> Ever since 1st Apr, linux-next starts to trigger a NULL pointer NIP on POWER9 below using
> this config,
>
> https://raw.githubusercontent.com/cailca/linux-mm/master/powerpc.config
>
> It takes a while to reproduce, so before I bury myself into bisecting and just send a head-up
> to see if anyone spots anything obvious.
>
> [  206.744625][T13224] LTP: starting fallocate04
> [  207.601583][T27684] /dev/zero: Can't open blockdev
> [  208.674301][T27684] EXT4-fs (loop0): mounting ext3 file system using the ext4 subsystem
> [  208.680347][T27684] BUG: Unable to handle kernel instruction fetch (NULL pointer?)
> [  208.680383][T27684] Faulting instruction address: 0x00000000
> [  208.680406][T27684] Oops: Kernel access of bad area, sig: 11 [#1]
> [  208.680439][T27684] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=256 DEBUG_PAGEALLOC NUMA PowerNV
> [  208.680474][T27684] Modules linked in: ext4 crc16 mbcache jbd2 loop kvm_hv kvm ip_tables x_tables xfs sd_mod bnx2x ahci libahci mdio tg3 libata libphy firmware_class dm_mirror dm_region_hash dm_log dm_mod
> [  208.680576][T27684] CPU: 117 PID: 27684 Comm: fallocate04 Tainted: G        W         5.6.0-next-20200401+ #288
> [  208.680614][T27684] NIP:  0000000000000000 LR: c0080000102c0048 CTR: 0000000000000000
> [  208.680657][T27684] REGS: c000200361def420 TRAP: 0400   Tainted: G        W          (5.6.0-next-20200401+)
> [  208.680700][T27684] MSR:  900000004280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 42022228  XER: 20040000
> [  208.680760][T27684] CFAR: c00800001032c494 IRQMASK: 0 
> [  208.680760][T27684] GPR00: c0000000005ac3f8 c000200361def6b0 c00000000165c200 c00020107dae0bd0 
> [  208.680760][T27684] GPR04: 0000000000000000 0000000000000400 0000000000000000 0000000000000000 
> [  208.680760][T27684] GPR08: c000200361def6e8 c0080000102c0040 000000007fffffff c000000001614e80 
> [  208.680760][T27684] GPR12: 0000000000000000 c000201fff671280 0000000000000000 0000000000000002 
> [  208.680760][T27684] GPR16: 0000000000000002 0000000000040001 c00020030f5a1000 c00020030f5a1548 
> [  208.680760][T27684] GPR20: c0000000015fbad8 c00000000168c654 c000200361def818 c0000000005b4c10 
> [  208.680760][T27684] GPR24: 0000000000000000 c0080000103365b8 c00020107dae0bd0 0000000000000400 
> [  208.680760][T27684] GPR28: c00000000168c3a8 0000000000000000 0000000000000000 0000000000000000 
> [  208.681014][T27684] NIP [0000000000000000] 0x0
> [  208.681065][T27684] LR [c0080000102c0048] ext4_iomap_end+0x8/0x30 [ext4]

That LR looks like it's pointing to the return from _mcount in
ext4_iomap_end(), which means we have probably crashed in ftrace
somewhere.

Did you have tracing enabled when you ran the test? Or does it do
tracing itself?

cheers

> [  208.681091][T27684] Call Trace:
> [  208.681129][T27684] [c000200361def6b0] [c0000000005ac3bc] iomap_apply+0x20c/0x920 (unreliable) iomap_apply at fs/iomap/apply.c:80 (discriminator 4)
> [  208.681173][T27684] [c000200361def7f0] [c0000000005b4adc] iomap_bmap+0xfc/0x160 iomap_bmap at fs/iomap/fiemap.c:142
> [  208.681228][T27684] [c000200361def850] [c0080000102c2c1c] ext4_bmap+0xa4/0x180 [ext4] ext4_bmap at fs/ext4/inode.c:3213
> [  208.681260][T27684] [c000200361def890] [c0000000004f71fc] bmap+0x4c/0x80
> [  208.681281][T27684] [c000200361def8c0] [c00800000fdb0acc] jbd2_journal_init_inode+0x44/0x1a0 [jbd2] jbd2_journal_init_inode at fs/jbd2/journal.c:1255
> [  208.681326][T27684] [c000200361def960] [c00800001031c808] ext4_load_journal+0x440/0x860 [ext4]
> [  208.681371][T27684] [c000200361defa30] [c008000010322a14] ext4_fill_super+0x342c/0x3ab0 [ext4]
> [  208.681414][T27684] [c000200361defba0] [c0000000004cb0bc] mount_bdev+0x25c/0x290
> [  208.681478][T27684] [c000200361defc40] [c008000010310250] ext4_mount+0x28/0x50 [ext4]
> [  208.681520][T27684] [c000200361defc60] [c00000000053242c] legacy_get_tree+0x4c/0xb0
> [  208.681556][T27684] [c000200361defc90] [c0000000004c864c] vfs_get_tree+0x4c/0x130
> [  208.681593][T27684] [c000200361defd00] [c00000000050a1c8] do_mount+0xa18/0xc50
> [  208.681641][T27684] [c000200361defdd0] [c00000000050a9a8] sys_mount+0x158/0x180
> [  208.681679][T27684] [c000200361defe20] [c00000000000b3f8] system_call+0x5c/0x68
> [  208.681726][T27684] Instruction dump:
> [  208.681747][T27684] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX 
> [  208.681797][T27684] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX 
> [  208.681839][T27684] ---[ end trace 4e9e2bab7f1d4048 ]---
> [  208.802259][T27684] 
> [  209.802373][T27684] Kernel panic - not syncing: Fatal exception
>
> [  215.281666][T16896] LTP: starting chown04_16
> [  215.424203][T18297] BUG: Unable to handle kernel instruction fetch (NULL pointer?)
> [  215.424289][T18297] Faulting instruction address: 0x00000000
> [  215.424313][T18297] Oops: Kernel access of bad area, sig: 11 [#1]
> [  215.424341][T18297] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=256 DEBUG_PAGEALLOC NUMA PowerNV
> [  215.424383][T18297] Modules linked in: loop kvm_hv kvm ip_tables x_tables xfs sd_mod bnx2x mdio tg3 ahci libahci libphy libata firmware_class dm_mirror dm_region_hash dm_log dm_mod
> [  215.424459][T18297] CPU: 85 PID: 18297 Comm: chown04_16 Tainted: G        W         5.6.0-next-20200405+ #3
> [  215.424489][T18297] NIP:  0000000000000000 LR: c00800000fbc0408 CTR: 0000000000000000
> [  215.424530][T18297] REGS: c000200b8606f990 TRAP: 0400   Tainted: G        W          (5.6.0-next-20200405+)
> [  215.424570][T18297] MSR:  9000000040009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 84000248  XER: 20040000
> [  215.424619][T18297] CFAR: c00800000fbc64f4 IRQMASK: 0 
> [  215.424619][T18297] GPR00: c0000000006c2238 c000200b8606fc20 c00000000165ce00 0000000000000000 
> [  215.424619][T18297] GPR04: c000201a58106400 c000200b8606fcc0 000000005f037e7d ffffffff00013bfb 
> [  215.424619][T18297] GPR08: c000201a58106400 0000000000000000 0000000000000000 c000000001652ee0 
> [  215.424619][T18297] GPR12: 0000000000000000 c000201fff69a600 0000000000000000 0000000000000000 
> [  215.424619][T18297] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> [  215.424619][T18297] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000007 
> [  215.424619][T18297] GPR24: 0000000000000000 0000000000000000 c00800000fbc8688 c000200b8606fcc0 
> [  215.424619][T18297] GPR28: 0000000000000000 000000007fffffff c00800000fbc0400 c00020068b8c0e70 
> [  215.424914][T18297] NIP [0000000000000000] 0x0
> [  215.424953][T18297] LR [c00800000fbc0408] find_free_cb+0x8/0x30 [loop]
> find_free_cb at drivers/block/loop.c:2129
> [  215.424997][T18297] Call Trace:
> [  215.425036][T18297] [c000200b8606fc20] [c0000000006c2290] idr_for_each+0xf0/0x170 (unreliable)
> [  215.425073][T18297] [c000200b8606fca0] [c00800000fbc2744] loop_lookup.part.2+0x4c/0xb0 [loop]
> loop_lookup at drivers/block/loop.c:2144
> [  215.425105][T18297] [c000200b8606fce0] [c00800000fbc3558] loop_control_ioctl+0x120/0x1d0 [loop]
> [  215.425149][T18297] [c000200b8606fd40] [c0000000004eb688] ksys_ioctl+0xd8/0x130
> [  215.425190][T18297] [c000200b8606fd90] [c0000000004eb708] sys_ioctl+0x28/0x40
> [  215.425233][T18297] [c000200b8606fdb0] [c00000000003cc30] system_call_exception+0x110/0x1e0
> [  215.425274][T18297] [c000200b8606fe20] [c00000000000c9f0] system_call_common+0xf0/0x278
> [  215.425314][T18297] Instruction dump:
> [  215.425338][T18297] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX 
> [  215.425374][T18297] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX 
> [  215.425422][T18297] ---[ end trace ebed248fad431966 ]---
> [  215.642114][T18297] 
> [  216.642220][T18297] Kernel panic - not syncing: Fatal exception
