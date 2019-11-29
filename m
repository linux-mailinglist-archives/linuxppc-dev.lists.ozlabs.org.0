Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE67610D547
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 12:57:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PY036HMwzDqJW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 22:57:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=virtuozzo.com (client-ip=185.231.240.75; helo=relay.sw.ru;
 envelope-from=aryabinin@virtuozzo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=virtuozzo.com
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PXwn2wsFzDqDS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 22:54:15 +1100 (AEDT)
Received: from dhcp-172-16-25-5.sw.ru ([172.16.25.5])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <aryabinin@virtuozzo.com>)
 id 1iaeqZ-0002Up-5S; Fri, 29 Nov 2019 14:54:03 +0300
Subject: Re: [PATCH v11 1/4] kasan: support backing vmalloc space with real
 shadow memory
To: Dmitry Vyukov <dvyukov@google.com>
References: <20191031093909.9228-1-dja@axtens.net>
 <20191031093909.9228-2-dja@axtens.net> <1573835765.5937.130.camel@lca.pw>
 <871ru5hnfh.fsf@dja-thinkpad.axtens.net>
 <952ec26a-9492-6f71-bab1-c1def887e528@virtuozzo.com>
 <CACT4Y+ZGO8b88fUyFe-WtV3Ubr11ChLY2mqk8YKWN9o0meNtXA@mail.gmail.com>
 <CACT4Y+Z+VhfVpkfg-WFq_kFMY=DE+9b_DCi-mCSPK-udaf_Arg@mail.gmail.com>
 <CACT4Y+Yog=PHF1SsLuoehr2rcbmfvLUW+dv7Vo+1RfdTOx7AUA@mail.gmail.com>
 <2297c356-0863-69ce-85b6-8608081295ed@virtuozzo.com>
 <CACT4Y+ZNAfkrE0M=eCHcmy2LhPG_kKbg4mOh54YN6Bgb4b3F5w@mail.gmail.com>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <56cf8aab-c61b-156c-f681-d2354aed22bb@virtuozzo.com>
Date: Fri, 29 Nov 2019 14:53:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CACT4Y+ZNAfkrE0M=eCHcmy2LhPG_kKbg4mOh54YN6Bgb4b3F5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 the arch/x86 maintainers <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>, Andy Lutomirski <luto@kernel.org>,
 Qian Cai <cai@lca.pw>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/29/19 2:47 PM, Dmitry Vyukov wrote:
> On Fri, Nov 29, 2019 at 12:38 PM Andrey Ryabinin
> <aryabinin@virtuozzo.com> wrote:
>>>>>
>>>>>
>>>>> Not sure if it's the same or not. Is it addressed by something in flight?
>>>>>
>>>>> My config:
>>>>> https://gist.githubusercontent.com/dvyukov/36c7be311fdec9cd51c649f7c3cb2ddb/raw/39c6f864fdd0ffc53f0822b14c354a73c1695fa1/gistfile1.txt
>>>>
>>>>
>>>> I've tried this fix for pcpu_get_vm_areas:
>>>> https://groups.google.com/d/msg/kasan-dev/t_F2X1MWKwk/h152Z3q2AgAJ
>>>> and it helps. But this will break syzbot on linux-next soon.
>>>
>>>
>>> Can this be related as well?
>>> Crashes on accesses to shadow on the ion memory...
>>
>> Nope, it's vm_map_ram() not being handled
> 
> 
> Another suspicious one. Related to kasan/vmalloc?

Very likely the same as with ion:

# git grep vm_map_ram|grep xfs
fs/xfs/xfs_buf.c:                * vm_map_ram() will allocate auxiliary structures (e.g.
fs/xfs/xfs_buf.c:                       bp->b_addr = vm_map_ram(bp->b_pages, bp->b_page_count,
 
> 
> BUG: unable to handle page fault for address: fffff52005b80000
> #PF: supervisor read access in kernel mode
> #PF: error_code(0x0000) - not-present page
> PGD 7ffcd067 P4D 7ffcd067 PUD 2cd10067 PMD 66d76067 PTE 0
> Oops: 0000 [#1] PREEMPT SMP KASAN
> CPU: 2 PID: 9211 Comm: syz-executor.2 Not tainted 5.4.0-next-20191129+ #6
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
> rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
> RIP: 0010:xfs_sb_read_verify+0xe9/0x540 fs/xfs/libxfs/xfs_sb.c:691
> Code: fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 1e 04 00 00 4d 8b ac 24
> 30 01 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 ea 48 c1 ea 03 <0f> b6
> 04 02 84 c0 74 08 3c 03 0f 8e ad 03 00 00 41 8b 45 00 bf 58
> RSP: 0018:ffffc9000a58f8d0 EFLAGS: 00010a06
> RAX: dffffc0000000000 RBX: 1ffff920014b1f1d RCX: ffffc9000af42000
> RDX: 1ffff92005b80000 RSI: ffffffff82914404 RDI: ffff88805cdb1460
> RBP: ffffc9000a58fab0 R08: ffff8880610cd380 R09: ffffed1005a87045
> R10: ffffed1005a87044 R11: ffff88802d438223 R12: ffff88805cdb1340
> R13: ffffc9002dc00000 R14: ffffc9000a58fa88 R15: ffff888061b5c000
> FS:  00007fb49bda9700(0000) GS:ffff88802d400000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: fffff52005b80000 CR3: 0000000060769006 CR4: 0000000000760ee0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> PKRU: 55555554
> Call Trace:
>  xfs_buf_ioend+0x228/0xdc0 fs/xfs/xfs_buf.c:1162
>  __xfs_buf_submit+0x38b/0xe50 fs/xfs/xfs_buf.c:1485
>  xfs_buf_submit fs/xfs/xfs_buf.h:268 [inline]
>  xfs_buf_read_uncached+0x15c/0x560 fs/xfs/xfs_buf.c:897
>  xfs_readsb+0x2d0/0x540 fs/xfs/xfs_mount.c:298
>  xfs_fc_fill_super+0x3e6/0x11f0 fs/xfs/xfs_super.c:1415
>  get_tree_bdev+0x444/0x620 fs/super.c:1340
>  xfs_fc_get_tree+0x1c/0x20 fs/xfs/xfs_super.c:1550
>  vfs_get_tree+0x8e/0x300 fs/super.c:1545
>  do_new_mount fs/namespace.c:2822 [inline]
>  do_mount+0x152d/0x1b50 fs/namespace.c:3142
>  ksys_mount+0x114/0x130 fs/namespace.c:3351
>  __do_sys_mount fs/namespace.c:3365 [inline]
>  __se_sys_mount fs/namespace.c:3362 [inline]
>  __x64_sys_mount+0xbe/0x150 fs/namespace.c:3362
>  do_syscall_64+0xfa/0x780 arch/x86/entry/common.c:294
>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x46736a
> Code: 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f
> 84 00 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d
> 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fb49bda8a78 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
> RAX: ffffffffffffffda RBX: 00007fb49bda8af0 RCX: 000000000046736a
> RDX: 00007fb49bda8ad0 RSI: 0000000020000140 RDI: 00007fb49bda8af0
> RBP: 00007fb49bda8ad0 R08: 00007fb49bda8b30 R09: 00007fb49bda8ad0
> R10: 0000000000000000 R11: 0000000000000202 R12: 00007fb49bda8b30
> R13: 00000000004b1c60 R14: 00000000004b006d R15: 00007fb49bda96bc
> Modules linked in:
> Dumping ftrace buffer:
>    (ftrace buffer empty)
> CR2: fffff52005b80000
> ---[ end trace eddd8949d4c898df ]---
> RIP: 0010:xfs_sb_read_verify+0xe9/0x540 fs/xfs/libxfs/xfs_sb.c:691
> Code: fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 1e 04 00 00 4d 8b ac 24
> 30 01 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 ea 48 c1 ea 03 <0f> b6
> 04 02 84 c0 74 08 3c 03 0f 8e ad 03 00 00 41 8b 45 00 bf 58
> RSP: 0018:ffffc9000a58f8d0 EFLAGS: 00010a06
> RAX: dffffc0000000000 RBX: 1ffff920014b1f1d RCX: ffffc9000af42000
> RDX: 1ffff92005b80000 RSI: ffffffff82914404 RDI: ffff88805cdb1460
> RBP: ffffc9000a58fab0 R08: ffff8880610cd380 R09: ffffed1005a87045
> R10: ffffed1005a87044 R11: ffff88802d438223 R12: ffff88805cdb1340
> R13: ffffc9002dc00000 R14: ffffc9000a58fa88 R15: ffff888061b5c000
> FS:  00007fb49bda9700(0000) GS:ffff88802d400000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: fffff52005b80000 CR3: 0000000060769006 CR4: 0000000000760ee0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> PKRU: 55555554
> 
