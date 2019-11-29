Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 234C910D586
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 13:12:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PYKZ23XMzDrB5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 23:12:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="RmK+wv0p"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PYGS0t0szDr6Y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 23:09:34 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id s18so5999223pfd.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 04:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Qm6oKiM2ABO+RifKesimvx+ONcOc9pjFmAlUk+XGKuc=;
 b=RmK+wv0pWAtIVk3gDw86d6xPm3fd/ePOaadw8wpI5SIfIyvdQy9QQKrfOgcBn/xSem
 RVFQC3tu4XYZsD0nZnlZ/qFiH1zA+efqOjx8WYFUbBoiVbgnOUe6B5bDVU5PVfCsTY5F
 G2kdqHW3bN5PZkR/YI3YZkudxUk1tRIT7b28I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Qm6oKiM2ABO+RifKesimvx+ONcOc9pjFmAlUk+XGKuc=;
 b=tUrwLrI3pF0Lu4CNfD0WeQwaF4zuaGRqJsHhf18yI+Cx8NjA2pauZ8u1dJkatDDp2o
 CXInbpDxt5u3fB7mzouqShE2ujIUfuAj2wHheSeWInAXq+QilhK7Hvd9GCq8sSbdekYM
 xPZGafJKBruEWK0qTO6s1vjMIvlmZG2jonh4DPLfpf39uCVqx27XOAuToxm6rcShD8/x
 2It5IEFJna3RDtzhhR0nmTXsvN1rTn/yGBREKw1A/QYWwzyEAH3r68yPkRHMlKBzbp0L
 qyCTjkG9ZJGX9qh3oImpEUZBAkLr2prFgDgG46aqHJK0Yp9nbvII++SdTj+V2wyxp+z4
 RrsQ==
X-Gm-Message-State: APjAAAXcM52WobMmEqiAmQM+tXt1lBt7xN36EOS8+ld2MORhg3+VZ83x
 it7T92icoY8fedM2ibX46LpNBg==
X-Google-Smtp-Source: APXvYqyOoxv4Fn6O7kpK30eEyZ3WTIVIVniRJX4iEN2aXzT4yNpDehQhUnYXRieB8j+TUqLopRanFA==
X-Received: by 2002:a63:4d1f:: with SMTP id a31mr16309174pgb.360.1575029371290; 
 Fri, 29 Nov 2019 04:09:31 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-4092-39f5-bb9d-b59a.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:4092:39f5:bb9d:b59a])
 by smtp.gmail.com with ESMTPSA id q9sm8641213pjb.27.2019.11.29.04.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 04:09:30 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Dmitry Vyukov <dvyukov@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>
Subject: Re: [PATCH v11 1/4] kasan: support backing vmalloc space with real
 shadow memory
In-Reply-To: <CACT4Y+Z+VhfVpkfg-WFq_kFMY=DE+9b_DCi-mCSPK-udaf_Arg@mail.gmail.com>
References: <20191031093909.9228-1-dja@axtens.net>
 <20191031093909.9228-2-dja@axtens.net> <1573835765.5937.130.camel@lca.pw>
 <871ru5hnfh.fsf@dja-thinkpad.axtens.net>
 <952ec26a-9492-6f71-bab1-c1def887e528@virtuozzo.com>
 <CACT4Y+ZGO8b88fUyFe-WtV3Ubr11ChLY2mqk8YKWN9o0meNtXA@mail.gmail.com>
 <CACT4Y+Z+VhfVpkfg-WFq_kFMY=DE+9b_DCi-mCSPK-udaf_Arg@mail.gmail.com>
Date: Fri, 29 Nov 2019 23:09:27 +1100
Message-ID: <874kymg9zc.fsf@dja-thinkpad.axtens.net>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 the arch/x86 maintainers <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>, Andy Lutomirski <luto@kernel.org>,
 Qian Cai <cai@lca.pw>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Dmitry,

>> I am testing this support on next-20191129 and seeing the following warnings:
>>
>> BUG: sleeping function called from invalid context at mm/page_alloc.c:4681
>> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 44, name: kworker/1:1
>> 4 locks held by kworker/1:1/44:
>>  #0: ffff888067c26d28 ((wq_completion)events){+.+.}, at:
>> __write_once_size include/linux/compiler.h:247 [inline]
>>  #0: ffff888067c26d28 ((wq_completion)events){+.+.}, at:
>> arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
>>  #0: ffff888067c26d28 ((wq_completion)events){+.+.}, at: atomic64_set
>> include/asm-generic/atomic-instrumented.h:868 [inline]
>>  #0: ffff888067c26d28 ((wq_completion)events){+.+.}, at:
>> atomic_long_set include/asm-generic/atomic-long.h:40 [inline]
>>  #0: ffff888067c26d28 ((wq_completion)events){+.+.}, at: set_work_data
>> kernel/workqueue.c:615 [inline]
>>  #0: ffff888067c26d28 ((wq_completion)events){+.+.}, at:
>> set_work_pool_and_clear_pending kernel/workqueue.c:642 [inline]
>>  #0: ffff888067c26d28 ((wq_completion)events){+.+.}, at:
>> process_one_work+0x88b/0x1750 kernel/workqueue.c:2235
>>  #1: ffffc900002afdf0 (pcpu_balance_work){+.+.}, at:
>> process_one_work+0x8c0/0x1750 kernel/workqueue.c:2239
>>  #2: ffffffff8943f080 (pcpu_alloc_mutex){+.+.}, at:
>> pcpu_balance_workfn+0xcc/0x13e0 mm/percpu.c:1845
>>  #3: ffffffff89450c78 (vmap_area_lock){+.+.}, at: spin_lock
>> include/linux/spinlock.h:338 [inline]
>>  #3: ffffffff89450c78 (vmap_area_lock){+.+.}, at:
>> pcpu_get_vm_areas+0x1449/0x3df0 mm/vmalloc.c:3431
>> Preemption disabled at:
>> [<ffffffff81a84199>] spin_lock include/linux/spinlock.h:338 [inline]
>> [<ffffffff81a84199>] pcpu_get_vm_areas+0x1449/0x3df0 mm/vmalloc.c:3431
>> CPU: 1 PID: 44 Comm: kworker/1:1 Not tainted 5.4.0-next-20191129+ #5
>> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.12.0-1 04/01/2014
>> Workqueue: events pcpu_balance_workfn
>> Call Trace:
>>  __dump_stack lib/dump_stack.c:77 [inline]
>>  dump_stack+0x199/0x216 lib/dump_stack.c:118
>>  ___might_sleep.cold.97+0x1f5/0x238 kernel/sched/core.c:6800
>>  __might_sleep+0x95/0x190 kernel/sched/core.c:6753
>>  prepare_alloc_pages mm/page_alloc.c:4681 [inline]
>>  __alloc_pages_nodemask+0x3cd/0x890 mm/page_alloc.c:4730
>>  alloc_pages_current+0x10c/0x210 mm/mempolicy.c:2211
>>  alloc_pages include/linux/gfp.h:532 [inline]
>>  __get_free_pages+0xc/0x40 mm/page_alloc.c:4786
>>  kasan_populate_vmalloc_pte mm/kasan/common.c:762 [inline]
>>  kasan_populate_vmalloc_pte+0x2f/0x1b0 mm/kasan/common.c:753
>>  apply_to_pte_range mm/memory.c:2041 [inline]
>>  apply_to_pmd_range mm/memory.c:2068 [inline]
>>  apply_to_pud_range mm/memory.c:2088 [inline]
>>  apply_to_p4d_range mm/memory.c:2108 [inline]
>>  apply_to_page_range+0x5ca/0xa00 mm/memory.c:2133
>>  kasan_populate_vmalloc+0x69/0xa0 mm/kasan/common.c:791
>>  pcpu_get_vm_areas+0x1596/0x3df0 mm/vmalloc.c:3439
>>  pcpu_create_chunk+0x240/0x7f0 mm/percpu-vm.c:340
>>  pcpu_balance_workfn+0x1033/0x13e0 mm/percpu.c:1934
>>  process_one_work+0x9b5/0x1750 kernel/workqueue.c:2264
>>  worker_thread+0x8b/0xd20 kernel/workqueue.c:2410
>>  kthread+0x365/0x450 kernel/kthread.c:255
>>  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>>
>>
>> Not sure if it's the same or not. Is it addressed by something in flight?

It looks like this one is the same.

There is a patch to fix it:
https://lore.kernel.org/linux-mm/20191120052719.7201-1-dja@axtens.net/

Andrew said he had picked it up on the 22nd:
https://marc.info/?l=linux-mm-commits&m=157438241512561&w=2
It's landed in mmots but not mmotm, so hopefully that will happen and
then it will land in -next very soon!

I will look into your other bug report shortly.

Regards,
Daniel

>>
>> My config:
>> https://gist.githubusercontent.com/dvyukov/36c7be311fdec9cd51c649f7c3cb2ddb/raw/39c6f864fdd0ffc53f0822b14c354a73c1695fa1/gistfile1.txt
>
>
> I've tried this fix for pcpu_get_vm_areas:
> https://groups.google.com/d/msg/kasan-dev/t_F2X1MWKwk/h152Z3q2AgAJ
> and it helps. But this will break syzbot on linux-next soon.
