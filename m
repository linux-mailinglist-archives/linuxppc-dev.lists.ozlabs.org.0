Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE3F67D9A4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 00:35:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2xs83KcLz3fJ7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 10:35:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=V7pzD6Pv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=andreyknvl@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=V7pzD6Pv;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2xr96fk7z3fCT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 10:34:31 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id n2so2205300pfo.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 15:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmlCUBRCPwLvDMyRKhmvFFYyCxvm8e49EMH29s2svEk=;
        b=V7pzD6PvMlRTA677LV794Nzyy1S2TBgILbVqqW6ty0pWMAGXaCr9JdjcF4So27okbd
         lVit+lRnXs05quAU4kmV8NadesAnDUqUDnKSSRv8uFKBvl13EWRY/3jwA4NIc4SW7E1/
         wbN4UZGtuSLt5Tqu2/oDsQQGyxZzgoV3/g+iG6eGqjhkyCfL1dbMzl3YF0C4+06VhNQq
         5gq77m4p+7PHXo3V7i5gNUiYcoBov8NDX2ksttB2+xDdKxOj68e0hFOm4zscS7mzILyi
         /u7b+RecsNMfrR7+jZqk/9L6hBllhwQCV4deoye22sdy6UXWaMV3B65O+2zMckYRV+6v
         WVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmlCUBRCPwLvDMyRKhmvFFYyCxvm8e49EMH29s2svEk=;
        b=Yt5bWkKFSBrdh69jelRMV8lKVButOJMUdbsufxnouS920GwQ5/UZDQl+DGQ/YXGGMy
         IiwalSaG2F8glgqc4AU3QUbvbuYo5YsQ5hSl60p5i/3psk6EXR/NYcA1P7rECZ+vrc6+
         SFIZ6aD08dUzDtd3HlsWl8pZswhNtwJrC1E8B1dCjE9CAeDhZtDPv9b//m9oSe+fsADV
         zWsgGNM5KfbrOSbzBuYEmeI86oGEhHtkroTiHu8YH+edPjOjZqyqK7kAxt/u8enf+ITA
         46J9bU1nodP2F4iDtBSA4tCoc8z7O8wq94dhFtI3ojPz55PiuEevV0ufbsBsi9BiJsDk
         e6Pw==
X-Gm-Message-State: AO0yUKWacpZVk/Jer9JX73BLzxDhK5uL6PAJjeO1A/395d3WJHeNZvEY
	3qvKIki/PfhAs7wJ64peaSLLJtB7G4QXAQb8P00=
X-Google-Smtp-Source: AK7set+jurZu+DhTB98Wjvu0Zv3kgBKXskjxfUjFlfo8kCzK0PCeGHCM1YBpxMKkAjD/DohwQdb1WzQR6i+wH7KREwg=
X-Received: by 2002:a05:6a00:23c2:b0:592:5653:facb with SMTP id
 g2-20020a056a0023c200b005925653facbmr365495pfc.28.1674776067755; Thu, 26 Jan
 2023 15:34:27 -0800 (PST)
MIME-Version: 1.0
References: <150768c55722311699fdcf8f5379e8256749f47d.1674716617.git.christophe.leroy@csgroup.eu>
In-Reply-To: <150768c55722311699fdcf8f5379e8256749f47d.1674716617.git.christophe.leroy@csgroup.eu>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 27 Jan 2023 00:34:16 +0100
Message-ID: <CA+fCnZcnwN-FGbteoMwFeHrGoM-5Gv5bs2udvRtzk-MT6s+B9w@mail.gmail.com>
Subject: Re: [PATCH] kasan: Fix Oops due to missing calls to kasan_arch_is_ready()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrew Morton <akpm@linux-foundation.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 26, 2023 at 8:08 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> On powerpc64, you can build a kernel with KASAN as soon as you build it
> with RADIX MMU support. However if the CPU doesn't have RADIX MMU,
> KASAN isn't enabled at init and the following Oops is encountered.
>
>   [    0.000000][    T0] KASAN not enabled as it requires radix!
>
>   [    4.484295][   T26] BUG: Unable to handle kernel data access at 0xc00e000000804a04
>   [    4.485270][   T26] Faulting instruction address: 0xc00000000062ec6c
>   [    4.485748][   T26] Oops: Kernel access of bad area, sig: 11 [#1]
>   [    4.485920][   T26] BE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>   [    4.486259][   T26] Modules linked in:
>   [    4.486637][   T26] CPU: 0 PID: 26 Comm: kworker/u2:2 Not tainted 6.2.0-rc3-02590-gf8a023b0a805 #249
>   [    4.486907][   T26] Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1200 0xf000005 of:SLOF,HEAD pSeries
>   [    4.487445][   T26] Workqueue: eval_map_wq .tracer_init_tracefs_work_func
>   [    4.488744][   T26] NIP:  c00000000062ec6c LR: c00000000062bb84 CTR: c0000000002ebcd0
>   [    4.488867][   T26] REGS: c0000000049175c0 TRAP: 0380   Not tainted  (6.2.0-rc3-02590-gf8a023b0a805)
>   [    4.489028][   T26] MSR:  8000000002009032 <SF,VEC,EE,ME,IR,DR,RI>  CR: 44002808  XER: 00000000
>   [    4.489584][   T26] CFAR: c00000000062bb80 IRQMASK: 0
>   [    4.489584][   T26] GPR00: c0000000005624d4 c000000004917860 c000000001cfc000 1800000000804a04
>   [    4.489584][   T26] GPR04: c0000000003a2650 0000000000000cc0 c00000000000d3d8 c00000000000d3d8
>   [    4.489584][   T26] GPR08: c0000000049175b0 a80e000000000000 0000000000000000 0000000017d78400
>   [    4.489584][   T26] GPR12: 0000000044002204 c000000003790000 c00000000435003c c0000000043f1c40
>   [    4.489584][   T26] GPR16: c0000000043f1c68 c0000000043501a0 c000000002106138 c0000000043f1c08
>   [    4.489584][   T26] GPR20: c0000000043f1c10 c0000000043f1c20 c000000004146c40 c000000002fdb7f8
>   [    4.489584][   T26] GPR24: c000000002fdb834 c000000003685e00 c000000004025030 c000000003522e90
>   [    4.489584][   T26] GPR28: 0000000000000cc0 c0000000003a2650 c000000004025020 c000000004025020
>   [    4.491201][   T26] NIP [c00000000062ec6c] .kasan_byte_accessible+0xc/0x20
>   [    4.491430][   T26] LR [c00000000062bb84] .__kasan_check_byte+0x24/0x90
>   [    4.491767][   T26] Call Trace:
>   [    4.491941][   T26] [c000000004917860] [c00000000062ae70] .__kasan_kmalloc+0xc0/0x110 (unreliable)
>   [    4.492270][   T26] [c0000000049178f0] [c0000000005624d4] .krealloc+0x54/0x1c0
>   [    4.492453][   T26] [c000000004917990] [c0000000003a2650] .create_trace_option_files+0x280/0x530
>   [    4.492613][   T26] [c000000004917a90] [c000000002050d90] .tracer_init_tracefs_work_func+0x274/0x2c0
>   [    4.492771][   T26] [c000000004917b40] [c0000000001f9948] .process_one_work+0x578/0x9f0
>   [    4.492927][   T26] [c000000004917c30] [c0000000001f9ebc] .worker_thread+0xfc/0x950
>   [    4.493084][   T26] [c000000004917d60] [c00000000020be84] .kthread+0x1a4/0x1b0
>   [    4.493232][   T26] [c000000004917e10] [c00000000000d3d8] .ret_from_kernel_thread+0x58/0x60
>   [    4.495642][   T26] Code: 60000000 7cc802a6 38a00000 4bfffc78 60000000 7cc802a6 38a00001 4bfffc68 60000000 3d20a80e 7863e8c2 792907c6 <7c6348ae> 20630007 78630fe0 68630001
>   [    4.496704][   T26] ---[ end trace 0000000000000000 ]---
>
> The Oops is due to kasan_byte_accessible() not checking the readiness
> of KASAN. Add missing call to kasan_arch_is_ready() and bail out when
> not ready. The same problem is observed with ____kasan_kfree_large()
> so fix it the same.
>
> Also, as KASAN is not available and no shadow area is allocated for
> linear memory mapping, there is no point in allocating shadow mem for
> vmalloc memory as shown below in /sys/kernel/debug/kernel_page_tables
>
>   ---[ kasan shadow mem start ]---
>   0xc00f000000000000-0xc00f00000006ffff  0x00000000040f0000       448K         r  w       pte  valid  present        dirty  accessed
>   0xc00f000000860000-0xc00f00000086ffff  0x000000000ac10000        64K         r  w       pte  valid  present        dirty  accessed
>   0xc00f3ffffffe0000-0xc00f3fffffffffff  0x0000000004d10000       128K         r  w       pte  valid  present        dirty  accessed
>   ---[ kasan shadow mem end ]---
>
> So, also verify KASAN readiness before allocating and poisoning
> shadow mem for VMAs.

Hi Cristophe,

Would it possible to unify kasan_arch_is_ready with the already
existing kasan_enabled check?

Both functions seem to be serving a similar purpose: for example this
patch adds kasan_arch_is_ready into __kasan_poison_vmalloc, which is
called by kasan_poison_vmalloc when kasan_enabled returns true.

The kasan_enabled is only implemented for HW_TAGS right now, but it
should be easy enough to make it work other cases by
kasan_flag_enabled into common.c and adding __wrappers for
shadow-related functions into include/linux/kasan.h. This way
architectures won't need to define their own static key and duplicate
the functionality.

I don't mind having this patch applied as is, considering that it's a
fix. However, if the unification that I mentioned is possible, that
would be a nice improvement.

Thanks!
