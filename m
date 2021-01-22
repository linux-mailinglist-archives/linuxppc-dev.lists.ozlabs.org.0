Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CE42FF980
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 01:34:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMKyt3w9kzDrZD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 11:34:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Zo3wKdAz; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMKx71rg2zDrTC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 11:33:11 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id cq1so2705352pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 16:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=UH7AHb3QTVAWMseNz2GAlxOshAW+V3hgnFAsn2PLuos=;
 b=Zo3wKdAzDBR7CTNmYjXza+Jk42w2z2/0/M5nIzVNJRaqW5C/J90a5UfTgWJiyqRYg8
 nDCPLekl/5kmE7QzL8zekm5szRZJY8frP/q4nGVcRwprXsF9HJRyGKVMhsZJ93px6Gox
 bJnli6brhesM7rM6KvPRvi4gmeJkgfFGZCr6Nb/FiOyp5nWks1GgF8cLn/Byq1wO5SN1
 ggw8nBjlNxcYjaYqM5TdX/bcDM6YL4+GcB58im8UVyx9IeoJvM6a1QcOs6ujI5SYc7fS
 ZdUwIAlefRtRcGAIbokV/t1kpmtidTd26oW3NGbUIoRASYOYvKCOYnnEEXzyqf1s+frZ
 ++og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=UH7AHb3QTVAWMseNz2GAlxOshAW+V3hgnFAsn2PLuos=;
 b=a97elQ/BzTDDyBtmVCBUc5GEqTk6O1QFEbx9aq+oXSXULMPmH3hNqhAx0PTS9mPipz
 8hMUs93XHWN+1DzePssYaq+L+zxm3Q4Yfa4lJZT38xgbHNGBghOqrlTELHQ67MMRT0U+
 qkCmSypASH/pG3JzzcmxHPuY2nl9BOJhymQbGm7cUhHEyjJimawlminLYsqRCuibyST9
 uCApdE4dsNW106MZkMqoBedjOMCmTUMDLkqRyvBCmUm7iINH2yGc3SoI8FCMRsQd/DIT
 O8RppioQUcMaDwyBGOOpJmUZDRbSy3Iqs+hYeRmV4BJoiE6zXZ2rFDnZ+Sd36mMroY1o
 pRww==
X-Gm-Message-State: AOAM530jb05OL4smc0Url1nzUNyGiXP5XBgOD1nak2Yq3UMxilgVq4xL
 oPOjoiK/G3umRqxZYNrE4lCozRNZknc=
X-Google-Smtp-Source: ABdhPJyVmu26idhOTtF85q6E6HitiMuipXQvE89aXPo9dWiiIkgsrfW/uy4RnpngU4IyiG0aOstPIQ==
X-Received: by 2002:a17:90a:ae13:: with SMTP id
 t19mr2352157pjq.52.1611275588891; 
 Thu, 21 Jan 2021 16:33:08 -0800 (PST)
Received: from localhost ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id j16sm7382234pjj.18.2021.01.21.16.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 16:33:08 -0800 (PST)
Date: Fri, 22 Jan 2021 10:33:01 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64: prevent replayed interrupt handlers from
 running softirqs
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210120075005.1678565-1-npiggin@gmail.com>
 <878s8mqwsl.fsf@mpe.ellerman.id.au>
In-Reply-To: <878s8mqwsl.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1611275484.azxvfqnoj5.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of January 21, 2021 10:50 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> Running softirqs enables interrupts, which can then end up recursing
>> into the irq soft-mask code we're adjusting, including replaying
>> interrupts itself, which might be theoretically unbounded.
>>
>> This abridged trace shows how this can occur:
>>
>> ! NIP replay_soft_interrupts
>>   LR  interrupt_exit_kernel_prepare
>>   Call Trace:
>>     interrupt_exit_kernel_prepare (unreliable)
>>     interrupt_return
>>   --- interrupt: ea0 at __rb_reserve_next
>>   NIP __rb_reserve_next
>>   LR __rb_reserve_next
>>   Call Trace:
>>     ring_buffer_lock_reserve
>>     trace_function
>>     function_trace_call
>>     ftrace_call
>>     __do_softirq
>>     irq_exit
>>     timer_interrupt
>> !   replay_soft_interrupts
>>     interrupt_exit_kernel_prepare
>>     interrupt_return
>>   --- interrupt: ea0 at arch_local_irq_restore
>>
>> Fix this by disabling bhs (softirqs) around the interrupt replay.
>>
>> I don't know that commit 3282a3da25bd ("powerpc/64: Implement soft
>> interrupt replay in C") actually introduced the problem. Prior to that
>> change, the interrupt replay seems like it should still be subect to
>> this recusion, however it's done after all the irq state has been fixed
>> up at the end of the replay, so it seems reasonable to fix back to this
>> commit.
>=20
> This seems very unhappy for me (on P9 bare metal):

Oh, damn lockdep I always forget it has a bunch of interrupt checks.

In this case it might have a point though. Thanks, I'll try to fix it.

Thanks,
Nick

>=20
> [    0.038571] Mountpoint-cache hash table entries: 131072 (order: 4, 104=
8576 bytes, linear)
> [    0.040194] ------------[ cut here ]------------
> [    0.040228] WARNING: CPU: 0 PID: 0 at kernel/softirq.c:176 __local_bh_=
enable_ip+0x150/0x210
> [    0.040263] Modules linked in:
> [    0.040280] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.11.0-rc2-00008=
-g4899f32e4f2a #1
> [    0.040321] NIP:  c000000000114bc0 LR: c0000000000172a0 CTR: c00000000=
002a020
> [    0.040360] REGS: c00000000177f670 TRAP: 0700   Not tainted  (5.11.0-r=
c2-00008-g4899f32e4f2a)
> [    0.040410] MSR:  9000000002021033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 280=
00224  XER: 20040000
> [    0.040472] CFAR: c000000000114ae8 IRQMASK: 3
>                GPR00: c0000000000172a0 c00000000177f910 c000000001783900 =
c000000000017290
>                GPR04: 0000000000000200 4000000000000000 0000000000000002 =
00000001312d0000
>                GPR08: 0000000000000000 c0000000016f3480 0000000000000202 =
0000000000000000
>                GPR12: c00000000002a020 c0000000023a0000 0000000000000000 =
0000000000000000
>                GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
>                GPR20: 0000000000000001 00000000100051c6 0000000000000000 =
0000000000000009
>                GPR24: 0000000000000e60 0000000000000900 0000000000000500 =
0000000000000a00
>                GPR28: 0000000000000f00 0000000000000002 0000000000000003 =
0000000000000200
> [    0.040824] NIP [c000000000114bc0] __local_bh_enable_ip+0x150/0x210
> [    0.040863] LR [c0000000000172a0] replay_soft_interrupts+0x2e0/0x340
> [    0.040904] Call Trace:
> [    0.040926] [c00000000177f910] [0000000000000500] 0x500 (unreliable)
> [    0.040962] [c00000000177f950] [c0000000000172a0] replay_soft_interrup=
ts+0x2e0/0x340
> [    0.041008] [c00000000177fb50] [c000000000017370] arch_local_irq_resto=
re+0x70/0xe0
> [    0.041042] [c00000000177fb80] [c000000000476514] kmem_cache_alloc+0x4=
74/0x520
> [    0.041066] [c00000000177fc00] [c0000000004e394c] __d_alloc+0x4c/0x2e0
> [    0.041109] [c00000000177fc50] [c0000000004e40ac] d_make_root+0x3c/0xa=
0
> [    0.041142] [c00000000177fc80] [c000000000679ce0] ramfs_fill_super+0x8=
0/0xb0
> [    0.041186] [c00000000177fcb0] [c0000000004c1b04] get_tree_nodev+0xb4/=
0x130
> [    0.041230] [c00000000177fcf0] [c000000000679578] ramfs_get_tree+0x28/=
0x40
> [    0.041282] [c00000000177fd10] [c0000000004bee78] vfs_get_tree+0x48/0x=
120
> [    0.041325] [c00000000177fd80] [c0000000004f7fe0] vfs_kern_mount.part.=
0+0xd0/0x130
> [    0.041368] [c00000000177fdc0] [c000000001366700] mnt_init+0x1c8/0x2fc
> [    0.041420] [c00000000177fe60] [c000000001366178] vfs_caches_init+0x11=
0/0x138
> [    0.041454] [c00000000177fee0] [c000000001331020] start_kernel+0x6d8/0=
x780
> [    0.041497] [c00000000177ff90] [c00000000000d354] start_here_common+0x=
1c/0x5c8
> [    0.041539] Instruction dump:
> [    0.041555] e9490002 394a0001 91490000 e90d0028 3d42ffcc 394a4730 7d0a=
42aa e9490002
> [    0.041608] 2c280000 394affff 91490000 4082ff30 <0fe00000> 892d0988 39=
400001 994d0988
> [    0.041660] irq event stamp: 555
> [    0.041674] hardirqs last  enabled at (553): [<c00000000047654c>] kmem=
_cache_alloc+0x4ac/0x520
> [    0.041707] hardirqs last disabled at (554): [<c000000000017368>] arch=
_local_irq_restore+0x68/0xe0
> [    0.041750] softirqs last  enabled at (0): [<0000000000000000>] 0x0
> [    0.041778] softirqs last disabled at (555): [<c000000000016fd0>] repl=
ay_soft_interrupts+0x10/0x340
> [    0.041824] ---[ end trace aa6f9769e07e43db ]---
>=20
>=20
> And lots and lots of these, or similar:
>=20
>=20
> [   14.369838] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   14.369839] WARNING: suspicious RCU usage
> [   14.369841] 5.11.0-rc2-00008-g4899f32e4f2a #1 Tainted: G        W
> [   14.369843] -----------------------------
> [   14.369844] include/linux/rcupdate.h:692 rcu_read_unlock() used illega=
lly while idle!
> [   14.369846]
>                other info that might help us debug this:
>=20
> [   14.369848]
>                rcu_scheduler_active =3D 2, debug_locks =3D 1
> [   14.369850] RCU used illegally from extended quiescent state!
> [   14.369851] 2 locks held by swapper/32/0:
> [   14.369853]  #0: c0000000015e6fc0 (rcu_callback){....}-{0:0}, at: rcu_=
core+0x2e0/0x990
> [   14.369864]  #1: c0000000015e6f30 (rcu_read_lock){....}-{1:3}, at: kme=
m_cache_free+0x7cc/0x7e0
> [   14.369874]
>                stack backtrace:
> [   14.369876] CPU: 32 PID: 0 Comm: swapper/32 Tainted: G        W       =
  5.11.0-rc2-00008-g4899f32e4f2a #1
> [   14.369879] Call Trace:
> [   14.369880] [c000001fff557c10] [c0000000008630b8] dump_stack+0xec/0x14=
4 (unreliable)
> [   14.369886] [c000001fff557c60] [c0000000001ad2d0] lockdep_rcu_suspicio=
us+0x124/0x144
> [   14.369890] [c000001fff557cf0] [c00000000047783c] kmem_cache_free+0x2a=
c/0x7e0
> [   14.369894] [c000001fff557db0] [c0000000004bdeac] file_free_rcu+0x5c/0=
xa0
> [   14.369898] [c000001fff557de0] [c0000000001e214c] rcu_core+0x33c/0x990
> [   14.369902] [c000001fff557e90] [c000000000f496d0] __do_softirq+0x180/0=
x688
> [   14.369906] [c000001fff557f90] [c0000000000307bc] call_do_softirq+0x14=
/0x24
> [   14.369911] [c000000002e1fab0] [c000000000017418] do_softirq_own_stack=
+0x38/0x50
> [   14.369916] [c000000002e1fad0] [c000000000114a60] do_softirq+0x120/0x1=
30
> [   14.369920] [c000000002e1fb00] [c000000000114c64] __local_bh_enable_ip=
+0x1f4/0x210
> [   14.369924] [c000000002e1fb40] [c0000000000172a0] replay_soft_interrup=
ts+0x2e0/0x340
> [   14.369928] [c000000002e1fd40] [c000000000017370] arch_local_irq_resto=
re+0x70/0xe0
> [   14.369933] [c000000002e1fd70] [c000000000c87184] snooze_loop+0x64/0x2=
e4
> [   14.369937] [c000000002e1fdb0] [c000000000c84204] cpuidle_enter_state+=
0x2e4/0x550
> [   14.369941] [c000000002e1fe10] [c000000000c8450c] cpuidle_enter+0x4c/0=
x70
> [   14.369946] [c000000002e1fe50] [c00000000016892c] call_cpuidle+0x4c/0x=
90
> [   14.369949] [c000000002e1fe70] [c000000000168d74] do_idle+0x2f4/0x380
> [   14.369953] [c000000002e1ff10] [c000000000169208] cpu_startup_entry+0x=
38/0x40
> [   14.369957] [c000000002e1ff40] [c000000000053484] start_secondary+0x2a=
4/0x2b0
> [   14.369961] [c000000002e1ff90] [c00000000000d254] start_secondary_prol=
og+0x10/0x14
>=20
>=20
> cheers
>=20
