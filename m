Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 190CC10D7C2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 16:16:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PdQ618c9zDqsb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 02:16:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=dvyukov@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hWVubv/A"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PdMG3ZZQzDrBg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 02:13:59 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id w47so28667162qtk.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 07:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=du8VH5eEvdjZtoXbmSVSw3W4D14+0jfBgg6SZaDFdAU=;
 b=hWVubv/ALhDcdTCIbe6q9oeueUVThUqE4GhIIgW1EMJJnTi3Xqr+VwomaHFRxPF7kC
 Pjo65AQB88WTkpd5rQXKOAdjmrNM9HF4gztxEGGySFm+6Z7wJTW9+hMQ2Isfzcu4eXMK
 coYfCNxYxNasdC5h19+rFKq+avehXCa4QOWnNS5XIdom7Ab5NWpLvQs2HQl7cr7iUhhw
 C5VaNSd33DxtoMalN26ExYGxbZLAj2KW6tSm9tmYCs6Ksklqf9GpKtY755w2j8+BJzcH
 qDmP/LWEu+y1vCMaf5WlUUxEd40p0vBU9PuOQTuEeGZBTlE3PPUU8OuV/2JgSPrz9Zd/
 US7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=du8VH5eEvdjZtoXbmSVSw3W4D14+0jfBgg6SZaDFdAU=;
 b=HyQVw1Nx0Zhs4aGg2/zGNHq6yg9zH22MPmnz4WI/b9oA1VYUpyjHGxzihLLB9sH/Yr
 tj7XKPqNTMoumLS/ch/MbwSs3DpM3CTFwAfyVDNpyd43RV229brRx8swLgH66OM2496Z
 2vJ/YH8lGh18ul30OTTsoFbkDftQvPLecBHvuu/+UhxoylVxdOXqhFy2Ym8Up/1TUNDa
 2lco5vm401Nq6BHliibWFuEmgoWmai2h7yV4CHFazaZVVM4hyDX0mFjo+YsMmcc9QmgZ
 C9rgSUtr/rLSBRtw7//7NkXhXdtW6LwsT+9hljxAyVAKYVuuJzeRpEnZgg3dPa2u6R/W
 wS7Q==
X-Gm-Message-State: APjAAAWf+dLiDN+OqYOB7RNpNMbhexxvyZyN6FHlZKEFyliwFCgrQ4Vf
 zilSr0C/ckSOYeuKTMpgwYKZRUfNcT3mM0G2WYPkxw==
X-Google-Smtp-Source: APXvYqxoFJ5lQnIsBQrR9+rmNvfbJESAmHDvazDh819Ellr7uL0ms+mRdVJEmrZ1pd4u/hYnXSFDl3Dq4CfCIlJteXk=
X-Received: by 2002:ac8:610a:: with SMTP id a10mr42407961qtm.50.1575040433744; 
 Fri, 29 Nov 2019 07:13:53 -0800 (PST)
MIME-Version: 1.0
References: <20191031093909.9228-1-dja@axtens.net>
 <20191031093909.9228-2-dja@axtens.net>
 <1573835765.5937.130.camel@lca.pw> <871ru5hnfh.fsf@dja-thinkpad.axtens.net>
 <952ec26a-9492-6f71-bab1-c1def887e528@virtuozzo.com>
 <CACT4Y+ZGO8b88fUyFe-WtV3Ubr11ChLY2mqk8YKWN9o0meNtXA@mail.gmail.com>
 <CACT4Y+Z+VhfVpkfg-WFq_kFMY=DE+9b_DCi-mCSPK-udaf_Arg@mail.gmail.com>
 <CACT4Y+Yog=PHF1SsLuoehr2rcbmfvLUW+dv7Vo+1RfdTOx7AUA@mail.gmail.com>
 <2297c356-0863-69ce-85b6-8608081295ed@virtuozzo.com>
 <CACT4Y+ZNAfkrE0M=eCHcmy2LhPG_kKbg4mOh54YN6Bgb4b3F5w@mail.gmail.com>
 <56cf8aab-c61b-156c-f681-d2354aed22bb@virtuozzo.com>
 <871rtqg91q.fsf@dja-thinkpad.axtens.net>
 <CACT4Y+axv26RvEUYkhnOkt+0pgdxkSiMVKYNvswSXaGsQLxg7g@mail.gmail.com>
In-Reply-To: <CACT4Y+axv26RvEUYkhnOkt+0pgdxkSiMVKYNvswSXaGsQLxg7g@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 29 Nov 2019 16:13:42 +0100
Message-ID: <CACT4Y+ZvymyY=GGN4N7WkKy2xoXtxHJVaVAchL_9EoQivXUSug@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] kasan: support backing vmalloc space with real
 shadow memory
To: Daniel Axtens <dja@axtens.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Qian Cai <cai@lca.pw>, Mark Rutland <mark.rutland@arm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, the arch/x86 maintainers <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Linux-MM <linux-mm@kvack.org>, Alexander Potapenko <glider@google.com>,
 Andy Lutomirski <luto@kernel.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 29, 2019 at 1:45 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Fri, Nov 29, 2019 at 1:29 PM Daniel Axtens <dja@axtens.net> wrote:
> > >>> Nope, it's vm_map_ram() not being handled
> > >> Another suspicious one. Related to kasan/vmalloc?
> > > Very likely the same as with ion:
> > >
> > > # git grep vm_map_ram|grep xfs
> > > fs/xfs/xfs_buf.c:                * vm_map_ram() will allocate auxiliary structures (e.g.
> > > fs/xfs/xfs_buf.c:                       bp->b_addr = vm_map_ram(bp->b_pages, bp->b_page_count,
> >
> > Aaargh, that's an embarassing miss.
> >
> > It's a bit intricate because kasan_vmalloc_populate function is
> > currently set up to take a vm_struct not a vmap_area, but I'll see if I
> > can get something simple out this evening - I'm away for the first part
> > of next week.
> >
> > Do you have to do anything interesting to get it to explode with xfs? Is
> > it as simple as mounting a drive and doing some I/O? Or do you need to
> > do something more involved?
>
> As simple as running syzkaller :)
> with this config
> https://github.com/google/syzkaller/blob/master/dashboard/config/upstream-kasan.config
>
> > Regards,
> > Daniel
> >
> > >
> > >>
> > >> BUG: unable to handle page fault for address: fffff52005b80000
> > >> #PF: supervisor read access in kernel mode
> > >> #PF: error_code(0x0000) - not-present page
> > >> PGD 7ffcd067 P4D 7ffcd067 PUD 2cd10067 PMD 66d76067 PTE 0
> > >> Oops: 0000 [#1] PREEMPT SMP KASAN
> > >> CPU: 2 PID: 9211 Comm: syz-executor.2 Not tainted 5.4.0-next-20191129+ #6
> > >> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
> > >> rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
> > >> RIP: 0010:xfs_sb_read_verify+0xe9/0x540 fs/xfs/libxfs/xfs_sb.c:691
> > >> Code: fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 1e 04 00 00 4d 8b ac 24
> > >> 30 01 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 ea 48 c1 ea 03 <0f> b6
> > >> 04 02 84 c0 74 08 3c 03 0f 8e ad 03 00 00 41 8b 45 00 bf 58
> > >> RSP: 0018:ffffc9000a58f8d0 EFLAGS: 00010a06
> > >> RAX: dffffc0000000000 RBX: 1ffff920014b1f1d RCX: ffffc9000af42000
> > >> RDX: 1ffff92005b80000 RSI: ffffffff82914404 RDI: ffff88805cdb1460
> > >> RBP: ffffc9000a58fab0 R08: ffff8880610cd380 R09: ffffed1005a87045
> > >> R10: ffffed1005a87044 R11: ffff88802d438223 R12: ffff88805cdb1340
> > >> R13: ffffc9002dc00000 R14: ffffc9000a58fa88 R15: ffff888061b5c000
> > >> FS:  00007fb49bda9700(0000) GS:ffff88802d400000(0000) knlGS:0000000000000000
> > >> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > >> CR2: fffff52005b80000 CR3: 0000000060769006 CR4: 0000000000760ee0
> > >> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > >> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > >> PKRU: 55555554
> > >> Call Trace:
> > >>  xfs_buf_ioend+0x228/0xdc0 fs/xfs/xfs_buf.c:1162
> > >>  __xfs_buf_submit+0x38b/0xe50 fs/xfs/xfs_buf.c:1485
> > >>  xfs_buf_submit fs/xfs/xfs_buf.h:268 [inline]
> > >>  xfs_buf_read_uncached+0x15c/0x560 fs/xfs/xfs_buf.c:897
> > >>  xfs_readsb+0x2d0/0x540 fs/xfs/xfs_mount.c:298
> > >>  xfs_fc_fill_super+0x3e6/0x11f0 fs/xfs/xfs_super.c:1415
> > >>  get_tree_bdev+0x444/0x620 fs/super.c:1340
> > >>  xfs_fc_get_tree+0x1c/0x20 fs/xfs/xfs_super.c:1550
> > >>  vfs_get_tree+0x8e/0x300 fs/super.c:1545
> > >>  do_new_mount fs/namespace.c:2822 [inline]
> > >>  do_mount+0x152d/0x1b50 fs/namespace.c:3142
> > >>  ksys_mount+0x114/0x130 fs/namespace.c:3351
> > >>  __do_sys_mount fs/namespace.c:3365 [inline]
> > >>  __se_sys_mount fs/namespace.c:3362 [inline]
> > >>  __x64_sys_mount+0xbe/0x150 fs/namespace.c:3362
> > >>  do_syscall_64+0xfa/0x780 arch/x86/entry/common.c:294
> > >>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> > >> RIP: 0033:0x46736a
> > >> Code: 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f
> > >> 84 00 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d
> > >> 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
> > >> RSP: 002b:00007fb49bda8a78 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
> > >> RAX: ffffffffffffffda RBX: 00007fb49bda8af0 RCX: 000000000046736a
> > >> RDX: 00007fb49bda8ad0 RSI: 0000000020000140 RDI: 00007fb49bda8af0
> > >> RBP: 00007fb49bda8ad0 R08: 00007fb49bda8b30 R09: 00007fb49bda8ad0
> > >> R10: 0000000000000000 R11: 0000000000000202 R12: 00007fb49bda8b30
> > >> R13: 00000000004b1c60 R14: 00000000004b006d R15: 00007fb49bda96bc
> > >> Modules linked in:
> > >> Dumping ftrace buffer:
> > >>    (ftrace buffer empty)
> > >> CR2: fffff52005b80000
> > >> ---[ end trace eddd8949d4c898df ]---
> > >> RIP: 0010:xfs_sb_read_verify+0xe9/0x540 fs/xfs/libxfs/xfs_sb.c:691
> > >> Code: fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 1e 04 00 00 4d 8b ac 24
> > >> 30 01 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 ea 48 c1 ea 03 <0f> b6
> > >> 04 02 84 c0 74 08 3c 03 0f 8e ad 03 00 00 41 8b 45 00 bf 58
> > >> RSP: 0018:ffffc9000a58f8d0 EFLAGS: 00010a06
> > >> RAX: dffffc0000000000 RBX: 1ffff920014b1f1d RCX: ffffc9000af42000
> > >> RDX: 1ffff92005b80000 RSI: ffffffff82914404 RDI: ffff88805cdb1460
> > >> RBP: ffffc9000a58fab0 R08: ffff8880610cd380 R09: ffffed1005a87045
> > >> R10: ffffed1005a87044 R11: ffff88802d438223 R12: ffff88805cdb1340
> > >> R13: ffffc9002dc00000 R14: ffffc9000a58fa88 R15: ffff888061b5c000
> > >> FS:  00007fb49bda9700(0000) GS:ffff88802d400000(0000) knlGS:0000000000000000
> > >> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > >> CR2: fffff52005b80000 CR3: 0000000060769006 CR4: 0000000000760ee0
> > >> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > >> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > >> PKRU: 55555554


Another one that looks related:

BUG: sleeping function called from invalid context at mm/page_alloc.c:4681
in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 15087, name:
syz-executor.7
3 locks held by syz-executor.7/15087:
 #0: ffff888024542110 (sk_lock-AF_PACKET){+.+.}, at: lock_sock
include/net/sock.h:1526 [inline]
 #0: ffff888024542110 (sk_lock-AF_PACKET){+.+.}, at:
packet_setsockopt+0xdf1/0x2d90 net/packet/af_packet.c:3678
 #1: ffffffff89850a80 (vmap_purge_lock){+.+.}, at:
try_purge_vmap_area_lazy mm/vmalloc.c:1331 [inline]
 #1: ffffffff89850a80 (vmap_purge_lock){+.+.}, at:
free_vmap_area_noflush+0x2a8/0x390 mm/vmalloc.c:1368
 #2: ffffffff89850c18 (free_vmap_area_lock){+.+.}, at: spin_lock
include/linux/spinlock.h:338 [inline]
 #2: ffffffff89850c18 (free_vmap_area_lock){+.+.}, at:
__purge_vmap_area_lazy+0x19c/0x1f30 mm/vmalloc.c:1298
Preemption disabled at:
[<ffffffff81a78ddc>] spin_lock include/linux/spinlock.h:338 [inline]
[<ffffffff81a78ddc>] __purge_vmap_area_lazy+0x19c/0x1f30 mm/vmalloc.c:1298
CPU: 3 PID: 15087 Comm: syz-executor.7 Not tainted 5.4.0-next-20191129+ #7
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x199/0x216 lib/dump_stack.c:118
 ___might_sleep.cold.97+0x1f5/0x238 kernel/sched/core.c:6800
 __might_sleep+0x95/0x190 kernel/sched/core.c:6753
 prepare_alloc_pages mm/page_alloc.c:4681 [inline]
 __alloc_pages_nodemask+0x3cd/0x890 mm/page_alloc.c:4730
 alloc_pages_current+0x10c/0x210 mm/mempolicy.c:2211
 alloc_pages include/linux/gfp.h:532 [inline]
 __get_free_pages+0xc/0x40 mm/page_alloc.c:4786
 __pte_alloc_one_kernel include/asm-generic/pgalloc.h:21 [inline]
 pte_alloc_one_kernel include/asm-generic/pgalloc.h:33 [inline]
 __pte_alloc_kernel+0x1d/0x200 mm/memory.c:459
 apply_to_pte_range mm/memory.c:2031 [inline]
 apply_to_pmd_range mm/memory.c:2068 [inline]
 apply_to_pud_range mm/memory.c:2088 [inline]
 apply_to_p4d_range mm/memory.c:2108 [inline]
 apply_to_page_range+0x77d/0xa00 mm/memory.c:2133
 kasan_release_vmalloc+0xa7/0xc0 mm/kasan/common.c:970
 __purge_vmap_area_lazy+0xcbb/0x1f30 mm/vmalloc.c:1313
 try_purge_vmap_area_lazy mm/vmalloc.c:1332 [inline]
 free_vmap_area_noflush+0x2ca/0x390 mm/vmalloc.c:1368
 free_unmap_vmap_area mm/vmalloc.c:1381 [inline]
 remove_vm_area+0x1cc/0x230 mm/vmalloc.c:2209
 vm_remove_mappings mm/vmalloc.c:2236 [inline]
 __vunmap+0x223/0xa20 mm/vmalloc.c:2299
 __vfree+0x3f/0xd0 mm/vmalloc.c:2356
 __vmalloc_area_node mm/vmalloc.c:2507 [inline]
 __vmalloc_node_range+0x5d5/0x810 mm/vmalloc.c:2547
 __vmalloc_node mm/vmalloc.c:2607 [inline]
 __vmalloc_node_flags mm/vmalloc.c:2621 [inline]
 vzalloc+0x6f/0x80 mm/vmalloc.c:2666
 alloc_one_pg_vec_page net/packet/af_packet.c:4233 [inline]
 alloc_pg_vec net/packet/af_packet.c:4258 [inline]
 packet_set_ring+0xbc0/0x1b50 net/packet/af_packet.c:4342
 packet_setsockopt+0xed7/0x2d90 net/packet/af_packet.c:3695
 __sys_setsockopt+0x29b/0x4d0 net/socket.c:2117
 __do_sys_setsockopt net/socket.c:2133 [inline]
 __se_sys_setsockopt net/socket.c:2130 [inline]
 __x64_sys_setsockopt+0xbe/0x150 net/socket.c:2130
 do_syscall_64+0xfa/0x780 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x465fe9
Code: Bad RIP value.
RSP: 002b:00007ff70087dc68 EFLAGS: 00000246 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 000000000052bf00 RCX: 0000000000465fe9
RDX: 0000000000000005 RSI: 0000000000000107 RDI: 0000000000000004
RBP: 00000000ffffffff R08: 000000000000001c R09: 0000000000000000
R10: 0000000020000040 R11: 0000000000000246 R12: 00000000004a643a
R13: 00000000004f2620 R14: 00000000004af7e6 R15: 00007ff70087e6bc
BUG: scheduling while atomic: syz-executor.7/15087/0x00000002
3 locks held by syz-executor.7/15087:
 #0: ffff888024542110 (sk_lock-AF_PACKET){+.+.}, at: lock_sock
include/net/sock.h:1526 [inline]
 #0: ffff888024542110 (sk_lock-AF_PACKET){+.+.}, at:
packet_setsockopt+0xdf1/0x2d90 net/packet/af_packet.c:3678
 #1: ffffffff89850a80 (vmap_purge_lock){+.+.}, at:
try_purge_vmap_area_lazy mm/vmalloc.c:1331 [inline]
 #1: ffffffff89850a80 (vmap_purge_lock){+.+.}, at:
free_vmap_area_noflush+0x2a8/0x390 mm/vmalloc.c:1368
 #2: ffffffff89850c18 (free_vmap_area_lock){+.+.}, at: spin_lock
include/linux/spinlock.h:338 [inline]
 #2: ffffffff89850c18 (free_vmap_area_lock){+.+.}, at:
__purge_vmap_area_lazy+0x19c/0x1f30 mm/vmalloc.c:1298
Modules linked in:
Preemption disabled at:
[<ffffffff81a78ddc>] spin_lock include/linux/spinlock.h:338 [inline]
[<ffffffff81a78ddc>] __purge_vmap_area_lazy+0x19c/0x1f30 mm/vmalloc.c:1298
