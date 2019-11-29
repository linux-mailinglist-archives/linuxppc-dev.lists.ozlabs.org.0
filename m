Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5D010D7CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 16:19:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PdT75cT2zDqwN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 02:19:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="G2Z/aSJp"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PdP10kGSzDrCJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 02:15:31 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id y10so32788182qto.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 07:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=yJShtf3/esmyNyieK8L5Aqur+hkWJ6a+EPrMUvaw//k=;
 b=G2Z/aSJpJRJKTNVenVUhNEvCb3nhExdQshAgLJ2eWzIirKKglpxxMOeYnSCaq4BTjo
 yY4NPuafUnedj7ic2Filghg1z4PN2xo3H/jqM+AbDJKes4gV/kiAb6f/JnBekwHoiv+F
 mD8LEZWMA02oDuKSE/8U9lyxmOtgmagwtlbjUyOFa7RwqReZM+CeGdWaVOxDBlOD33gO
 98sSYVlykcS2fleGdqNGVLvcrIhmJ+XTNJhtqy5j/VKoMvM7zja8AK3Mj9X3VjO0OqLO
 An2zNZY+nzlOCJkEhUWah5UN0/wu/elHwlkLeFsa6d1qWPVGI6tAF+UzJAiNG4IpN5Yc
 ElZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=yJShtf3/esmyNyieK8L5Aqur+hkWJ6a+EPrMUvaw//k=;
 b=ZLQhAYlq0NLJ1hUBaBwN4NeeajH9yvowMVWjjyV0YRswFrKkfAOjyqSUbLm/TgsUlT
 GgTQn6z3yQGbYhktzZet2WLNmoONEXVyQ3PryAJW7SrllYaYkOIKjZzTYJQSzOT826aa
 CYFfcU1Qj8redSfIm5UOsicTYkkhkgxSzrMXtpGxBlK55Bac0UZcXwGo8IsCLyO+3kR5
 67/E7WeMGS08bobKZx75zZpQzBpHcVtUD0rFArvzi+9PDFs1uhcwT/Nwg0UVc9MOarN1
 CRapqIiakf0YJKgvRbFKzriIEso9ZN14kxw6xHE+blco5UB15vn3Rtme4CRDbj5e/J0W
 7B2w==
X-Gm-Message-State: APjAAAWeTsRQQjoTROfvLoIZj4PT+CO4tLHbC+/xlYJfMly8UovayXJG
 rnPKQBFqogIKe8JGDYGyENR5Fw==
X-Google-Smtp-Source: APXvYqzZqsXz8JSh+1J+5yygH2mHsSViide1q9d5GY78xz14tyMU5/YnFL0uiJlfRdQCGMFf2si6rQ==
X-Received: by 2002:ac8:1115:: with SMTP id c21mr38478911qtj.188.1575040527681; 
 Fri, 29 Nov 2019 07:15:27 -0800 (PST)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id r8sm11478938qti.6.2019.11.29.07.15.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Nov 2019 07:15:27 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: XFS check crash (WAS Re: [PATCH v11 1/4] kasan: support backing
 vmalloc space with real shadow memory)
From: Qian Cai <cai@lca.pw>
In-Reply-To: <871rtqg91q.fsf@dja-thinkpad.axtens.net>
Date: Fri, 29 Nov 2019 10:15:25 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <27B18BF6-757C-4CA3-A852-1EE20D4D10A9@lca.pw>
References: <20191031093909.9228-1-dja@axtens.net>
 <20191031093909.9228-2-dja@axtens.net> <1573835765.5937.130.camel@lca.pw>
 <871ru5hnfh.fsf@dja-thinkpad.axtens.net>
 <952ec26a-9492-6f71-bab1-c1def887e528@virtuozzo.com>
 <CACT4Y+ZGO8b88fUyFe-WtV3Ubr11ChLY2mqk8YKWN9o0meNtXA@mail.gmail.com>
 <CACT4Y+Z+VhfVpkfg-WFq_kFMY=DE+9b_DCi-mCSPK-udaf_Arg@mail.gmail.com>
 <CACT4Y+Yog=PHF1SsLuoehr2rcbmfvLUW+dv7Vo+1RfdTOx7AUA@mail.gmail.com>
 <2297c356-0863-69ce-85b6-8608081295ed@virtuozzo.com>
 <CACT4Y+ZNAfkrE0M=eCHcmy2LhPG_kKbg4mOh54YN6Bgb4b3F5w@mail.gmail.com>
 <56cf8aab-c61b-156c-f681-d2354aed22bb@virtuozzo.com>
 <871rtqg91q.fsf@dja-thinkpad.axtens.net>
To: Daniel Axtens <dja@axtens.net>
X-Mailer: Apple Mail (2.3601.0.10)
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
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 the arch/x86 maintainers <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, linux-xfs@vger.kernel.org,
 Linux-MM <linux-mm@kvack.org>, Alexander Potapenko <glider@google.com>,
 Andy Lutomirski <luto@kernel.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Nov 29, 2019, at 7:29 AM, Daniel Axtens <dja@axtens.net> wrote:
>=20
>>>>=20
>>>> Nope, it's vm_map_ram() not being handled
>>>=20
>>>=20
>>> Another suspicious one. Related to kasan/vmalloc?
>>=20
>> Very likely the same as with ion:
>>=20
>> # git grep vm_map_ram|grep xfs
>> fs/xfs/xfs_buf.c:                * vm_map_ram() will allocate =
auxiliary structures (e.g.
>> fs/xfs/xfs_buf.c:                       bp->b_addr =3D =
vm_map_ram(bp->b_pages, bp->b_page_count,
>=20
> Aaargh, that's an embarassing miss.
>=20
> It's a bit intricate because kasan_vmalloc_populate function is
> currently set up to take a vm_struct not a vmap_area, but I'll see if =
I
> can get something simple out this evening - I'm away for the first =
part
> of next week.
>=20
> Do you have to do anything interesting to get it to explode with xfs? =
Is
> it as simple as mounting a drive and doing some I/O? Or do you need to
> do something more involved?


I instead trigger something a bit different by manually triggering a =
crash first to make the XFS
partition uncleanly shutdown.

# echo c >/proc/sysrq-trigger

and then reboot the same kernel where it will crash while checking the =
XFS. This can be workaround
by rebooting to an older kernel (v4.18) first where xfs_repair will be =
successfully there, and then rebooting
to the new linux-next kernel will be fine.

[  OK  ] Started File System Check on =
/dev/mapper/rhel_hpe--sy680gen9--01-root.
         Mounting /sysroot...
[  141.177726][ T1730] SGI XFS with security attributes, no debug =
enabled
[  141.432382][ T1720] XFS (dm-0): Mounting V5 Filesystem
[**    ] A start job is running for /sysroot (39s / 1min 51s)[  =
158.738816][ T1720] XFS (dm-0): Starting recovery (logdev: internal)
[  158.792010][  T844] BUG: unable to handle page fault for address: =
fffff52001f0000c
[  158.830913][  T844] #PF: supervisor read access in kernel mode
[  158.859680][  T844] #PF: error_code(0x0000) - not-present page
[  158.886057][  T844] PGD 207ffe3067 P4D 207ffe3067 PUD 2071f2067 PMD =
f68e08067 PTE 0
[  158.922065][  T844] Oops: 0000 [#1] SMP DEBUG_PAGEALLOC KASAN PTI
[  158.949620][  T844] CPU: 112 PID: 844 Comm: kworker/112:1 Not tainted =
5.4.0-next-20191127+ #3
[  158.988759][  T844] Hardware name: HP Synergy 680 Gen9/Synergy 680 =
Gen9 Compute Module, BIOS I40 05/23/2018
[  159.033380][  T844] Workqueue: xfs-buf/dm-0 xfs_buf_ioend_work [xfs]
[  159.061935][  T844] RIP: 0010:__asan_load4+0x3a/0xa0
[  159.061941][  T844] Code: 00 00 00 00 00 00 ff 48 39 f8 77 6d 48 8d =
47 03 48 89 c2 83 e2 07 48 83 fa 02 76 30 48 be 00 00 00 00 00 fc ff df =
48 c1 e8 03 <0f> b6 04 30 84 c0 75 3e 5d c3 48 b8 00 00 00 00 00 80 ff =
ff eb c7
[  159.061944][  T844] RSP: 0018:ffffc9000a4b7cb0 EFLAGS: 00010a06
[  159.061949][  T844] RAX: 1ffff92001f0000c RBX: ffffc9000f800000 RCX: =
ffffffffc06d10ae
[  159.061952][  T844] RDX: 0000000000000003 RSI: dffffc0000000000 RDI: =
ffffc9000f800060
[  159.061955][  T844] RBP: ffffc9000a4b7cb0 R08: ffffed130bee89e5 R09: =
0000000000000001
[  159.061958][  T844] R10: ffffed130bee89e4 R11: ffff88985f744f23 R12: =
0000000000000000
[  159.061961][  T844] R13: ffff889724be0040 R14: ffff88836c8e5000 R15: =
00000000000c8000
[  159.061965][  T844] FS:  0000000000000000(0000) =
GS:ffff88985f700000(0000) knlGS:0000000000000000
[  159.061968][  T844] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  159.061971][  T844] CR2: fffff52001f0000c CR3: 0000001f615b8004 CR4: =
00000000003606e0
[  159.061974][  T844] DR0: 0000000000000000 DR1: 0000000000000000 DR2: =
0000000000000000
[  159.061976][  T844] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: =
0000000000000400
[  159.061978][  T844] Call Trace:
[  159.062118][  T844]  xfs_inode_buf_verify+0x13e/0x230 [xfs]
[  159.062264][  T844]  xfs_inode_buf_readahead_verify+0x13/0x20 [xfs]
[  159.634441][  T844]  xfs_buf_ioend+0x153/0x6b0 [xfs]
[  159.634455][  T844]  ? trace_hardirqs_on+0x3a/0x160
[  159.679087][  T844]  xfs_buf_ioend_work+0x15/0x20 [xfs]
[  159.702689][  T844]  process_one_work+0x579/0xb90
[  159.723898][  T844]  ? pwq_dec_nr_in_flight+0x170/0x170
[  159.747499][  T844]  worker_thread+0x63/0x5b0
[  159.767531][  T844]  ? process_one_work+0xb90/0xb90
[  159.789549][  T844]  kthread+0x1e6/0x210
[  159.807166][  T844]  ? kthread_create_worker_on_cpu+0xc0/0xc0
[  159.833064][  T844]  ret_from_fork+0x3a/0x50
[  159.852200][  T844] Modules linked in: xfs sd_mod bnx2x mdio =
firmware_class hpsa scsi_transport_sas dm_mirror dm_region_hash dm_log =
dm_mod
[  159.915273][  T844] CR2: fffff52001f0000c
[  159.934029][  T844] ---[ end trace 3f3b30f5fc34bbf1 ]---
[  159.957937][  T844] RIP: 0010:__asan_load4+0x3a/0xa0
[  159.980316][  T844] Code: 00 00 00 00 00 00 ff 48 39 f8 77 6d 48 8d =
47 03 48 89 c2 83 e2 07 48 83 fa 02 76 30 48 be 00 00 00 00 00 fc ff df =
48 c1 e8 03 <0f> b6 04 30 84 c0 75 3e 5d c3 48 b8 00 00 00 00 00 80 ff =
ff eb c7
[  160.068386][  T844] RSP: 0018:ffffc9000a4b7cb0 EFLAGS: 00010a06
[  160.068389][  T844] RAX: 1ffff92001f0000c RBX: ffffc9000f800000 RCX: =
ffffffffc06d10ae
[  160.068391][  T844] RDX: 0000000000000003 RSI: dffffc0000000000 RDI: =
ffffc9000f800060
[  160.068393][  T844] RBP: ffffc9000a4b7cb0 R08: ffffed130bee89e5 R09: =
0000000000000001
[  160.068395][  T844] R10: ffffed130bee89e4 R11: ffff88985f744f23 R12: =
0000000000000000
[  160.068397][  T844] R13: ffff889724be0040 R14: ffff88836c8e5000 R15: =
00000000000c8000
[  160.068399][  T844] FS:  0000000000000000(0000) =
GS:ffff88985f700000(0000) knlGS:0000000000000000
[  160.068401][  T844] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  160.068404][  T844] CR2: fffff52001f0000c CR3: 0000001f615b8004 CR4: =
00000000003606e0
[  160.068405][  T844] DR0: 0000000000000000 DR1: 0000000000000000 DR2: =
0000000000000000
[  160.068407][  T844] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: =
0000000000000400
[  160.068410][  T844] Kernel panic - not syncing: Fatal exception
[  160.095178][  T844] Kernel Offset: 0x21c00000 from 0xffffffff81000000 =
(relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[  160.541027][  T844] ---[ end Kernel panic - not syncing: Fatal =
exception ]---

>=20
> Regards,
> Daniel
>=20
>>=20
>>>=20
>>> BUG: unable to handle page fault for address: fffff52005b80000
>>> #PF: supervisor read access in kernel mode
>>> #PF: error_code(0x0000) - not-present page
>>> PGD 7ffcd067 P4D 7ffcd067 PUD 2cd10067 PMD 66d76067 PTE 0
>>> Oops: 0000 [#1] PREEMPT SMP KASAN
>>> CPU: 2 PID: 9211 Comm: syz-executor.2 Not tainted =
5.4.0-next-20191129+ #6
>>> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
>>> rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
>>> RIP: 0010:xfs_sb_read_verify+0xe9/0x540 fs/xfs/libxfs/xfs_sb.c:691
>>> Code: fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 1e 04 00 00 4d 8b ac 24
>>> 30 01 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 ea 48 c1 ea 03 <0f> =
b6
>>> 04 02 84 c0 74 08 3c 03 0f 8e ad 03 00 00 41 8b 45 00 bf 58
>>> RSP: 0018:ffffc9000a58f8d0 EFLAGS: 00010a06
>>> RAX: dffffc0000000000 RBX: 1ffff920014b1f1d RCX: ffffc9000af42000
>>> RDX: 1ffff92005b80000 RSI: ffffffff82914404 RDI: ffff88805cdb1460
>>> RBP: ffffc9000a58fab0 R08: ffff8880610cd380 R09: ffffed1005a87045
>>> R10: ffffed1005a87044 R11: ffff88802d438223 R12: ffff88805cdb1340
>>> R13: ffffc9002dc00000 R14: ffffc9000a58fa88 R15: ffff888061b5c000
>>> FS:  00007fb49bda9700(0000) GS:ffff88802d400000(0000) =
knlGS:0000000000000000
>>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> CR2: fffff52005b80000 CR3: 0000000060769006 CR4: 0000000000760ee0
>>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>>> PKRU: 55555554
>>> Call Trace:
>>> xfs_buf_ioend+0x228/0xdc0 fs/xfs/xfs_buf.c:1162
>>> __xfs_buf_submit+0x38b/0xe50 fs/xfs/xfs_buf.c:1485
>>> xfs_buf_submit fs/xfs/xfs_buf.h:268 [inline]
>>> xfs_buf_read_uncached+0x15c/0x560 fs/xfs/xfs_buf.c:897
>>> xfs_readsb+0x2d0/0x540 fs/xfs/xfs_mount.c:298
>>> xfs_fc_fill_super+0x3e6/0x11f0 fs/xfs/xfs_super.c:1415
>>> get_tree_bdev+0x444/0x620 fs/super.c:1340
>>> xfs_fc_get_tree+0x1c/0x20 fs/xfs/xfs_super.c:1550
>>> vfs_get_tree+0x8e/0x300 fs/super.c:1545
>>> do_new_mount fs/namespace.c:2822 [inline]
>>> do_mount+0x152d/0x1b50 fs/namespace.c:3142
>>> ksys_mount+0x114/0x130 fs/namespace.c:3351
>>> __do_sys_mount fs/namespace.c:3365 [inline]
>>> __se_sys_mount fs/namespace.c:3362 [inline]
>>> __x64_sys_mount+0xbe/0x150 fs/namespace.c:3362
>>> do_syscall_64+0xfa/0x780 arch/x86/entry/common.c:294
>>> entry_SYSCALL_64_after_hwframe+0x49/0xbe
>>> RIP: 0033:0x46736a
>>> Code: 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f
>>> 84 00 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> =
3d
>>> 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
>>> RSP: 002b:00007fb49bda8a78 EFLAGS: 00000202 ORIG_RAX: =
00000000000000a5
>>> RAX: ffffffffffffffda RBX: 00007fb49bda8af0 RCX: 000000000046736a
>>> RDX: 00007fb49bda8ad0 RSI: 0000000020000140 RDI: 00007fb49bda8af0
>>> RBP: 00007fb49bda8ad0 R08: 00007fb49bda8b30 R09: 00007fb49bda8ad0
>>> R10: 0000000000000000 R11: 0000000000000202 R12: 00007fb49bda8b30
>>> R13: 00000000004b1c60 R14: 00000000004b006d R15: 00007fb49bda96bc
>>> Modules linked in:
>>> Dumping ftrace buffer:
>>>   (ftrace buffer empty)
>>> CR2: fffff52005b80000
>>> ---[ end trace eddd8949d4c898df ]---
>>> RIP: 0010:xfs_sb_read_verify+0xe9/0x540 fs/xfs/libxfs/xfs_sb.c:691
>>> Code: fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 1e 04 00 00 4d 8b ac 24
>>> 30 01 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 ea 48 c1 ea 03 <0f> =
b6
>>> 04 02 84 c0 74 08 3c 03 0f 8e ad 03 00 00 41 8b 45 00 bf 58
>>> RSP: 0018:ffffc9000a58f8d0 EFLAGS: 00010a06
>>> RAX: dffffc0000000000 RBX: 1ffff920014b1f1d RCX: ffffc9000af42000
>>> RDX: 1ffff92005b80000 RSI: ffffffff82914404 RDI: ffff88805cdb1460
>>> RBP: ffffc9000a58fab0 R08: ffff8880610cd380 R09: ffffed1005a87045
>>> R10: ffffed1005a87044 R11: ffff88802d438223 R12: ffff88805cdb1340
>>> R13: ffffc9002dc00000 R14: ffffc9000a58fa88 R15: ffff888061b5c000
>>> FS:  00007fb49bda9700(0000) GS:ffff88802d400000(0000) =
knlGS:0000000000000000
>>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> CR2: fffff52005b80000 CR3: 0000000060769006 CR4: 0000000000760ee0
>>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>>> PKRU: 55555554
>>>=20
>>=20
>> --=20
>> You received this message because you are subscribed to the Google =
Groups "kasan-dev" group.
>> To unsubscribe from this group and stop receiving emails from it, =
send an email to kasan-dev+unsubscribe@googlegroups.com.
>> To view this discussion on the web visit =
https://groups.google.com/d/msgid/kasan-dev/56cf8aab-c61b-156c-f681-d2354a=
ed22bb%40virtuozzo.com.

