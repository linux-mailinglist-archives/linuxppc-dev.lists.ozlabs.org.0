Return-Path: <linuxppc-dev+bounces-7594-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4502DA85507
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 09:12:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYnvC5NRhz2yDr;
	Fri, 11 Apr 2025 17:12:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744355559;
	cv=none; b=kS0G/+yv/048WeZxRpPlFpFFgF1WsOdqNDFyGAk3d/lLPcP/jb/QWHlE14KOZ0NRaZsl7kIyU9dwCLP+pBiSMx5eZCWmU8ynfksaBHHUr/l7L+Syr4aSdRRSGPBtKSBZlkUYwKafYSvQyp0J2cXPUlOvM/9qoaApAl8m5WQKeIv/ySMNU9Ujp5dFAsOWHBDnS1NcLufbUbU9iS4zs8oBrSQqJIFaML77jpCR7kk3HQFkg48ZKsMkCZmdEC2GQqVH+jHpUW++rVwLD5ioSxqKeAZlhya39mRU/e2WgcxgoajrwpAkphGD8TYaPaJzLkJwvhQTgU2EMGgGlqcsryFlIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744355559; c=relaxed/relaxed;
	bh=KzShCwppEme7OMOnT5z5FD+rJw9aaKOfx1ISsPkjuh4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eq1T/hK8r+jDVcMrCCJnbBQxGNTppow4Xhnkcjqo/ZjN14LNmOyJYDhh9AU5EssGD9RGzPw+39678qSBDG+o2VjuM5mJXMHa6lZrV6wqxVVBCXFvwWxpsuW4kzQNt+lMts54YaR9Ph51mugLHpqIsmcGQVGktykUeI858aFbGZSVh5ERMiH5pDlzcRyoPlF9v0MTYcQ7MMr7s8lnaIOL/ObzOG92/auoNc9r7WvyR8VYS7fd/kV7y/ii/LIraswzxdhVSARgMbpKN+sS1MXqSocEkatnm7q0pj7T4q9fj6/v03VFA2cfy+Viw+tpvpAOMXL+6gwxP09S11W6Rq1qtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X2glGjzm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X2glGjzm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYnvB4K41z2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 17:12:37 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-aee79a0f192so1183656a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 00:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744355555; x=1744960355; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzShCwppEme7OMOnT5z5FD+rJw9aaKOfx1ISsPkjuh4=;
        b=X2glGjzmiTwYRxYs6722dwf4eof1JoZ4ePqTRgaoLi2L3UHwKMMBqt07rYnKnap+zT
         wvXibrlUOYNTvz6pGDWUZT5qHgD6LXqQEbKB1R+N+++F5LkD4N2vPLX72lLtBuy+MJAh
         eiJCM9DN2rLUmtN/BXKFhSirMEQ6f8WDlOBAK9hYRrHwX6wtzXapjUyraJCNhNIIlygd
         JIR/Waxrie7qR7i/7YcsFcxS83iZE3T/OlXBJiZ9YYJu/8DCqiVL/xODbCLk73stxeJF
         PfKKFvntmHiTUM2TkO2n4KZ/3mWQQB0wHoUpVnXfTEpUfFBkpMFIJFVNrtzuF9RMIfFs
         hIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744355555; x=1744960355;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KzShCwppEme7OMOnT5z5FD+rJw9aaKOfx1ISsPkjuh4=;
        b=HvctZfwXiTCf6pwe5M23ivyxXnJe9LeaEkZMnKayajgwVyUgAbxQ7oPHSOM80/Efcu
         A46QbjBdB26ZDwwAjoJXRwZS0lC1p+y5lecBCGJU11+dc//lA7b4IUIYRUOMkwC1z0wi
         iyBFvWul3LAHQK42bsLMMHkh643WdZv5JnCY73IuBZUXIW6r+YMH0THVxiU1ZEUcPPl8
         I+TQK04ZxP2imgt5A71u3aHwMktJCwhAVmw0LI3KVpe5VoBP10KO1oFABtTxpz6tjxTf
         e21YFpIBIy2QkIZ7srJONTkjqUf+ruNIv4fE2o2wws5JEOMv4wLBAPC0upWwf47OPUuU
         lftA==
X-Forwarded-Encrypted: i=1; AJvYcCVlsgdvRSYsdQLElK0oil9KnQNJprJa4LhbQlWGKfipn5BY3rGeOQBggvEFoP/PzG5lCTqBqbsG6tzB2dQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy+Y7+AdcQCpGXaUr60BOf0pWYElb+nqUPVLTiLq6A0SO31f3bh
	JmhyOxAlqeAH+AWoREO51cpzhW9k0uehVDxJcqodkXQqfQsvYXr4
X-Gm-Gg: ASbGncs5OM6UN2IbiLFXA1DZYuliCzB0BoNoyY7eGLjukjvSTF512mvUXZlTzYugI4X
	0XLOaE+I2qQJsHJOPQF8kinLhaw2jwXrY/PL4AXQBkjTDPH0BM7Fw0UCXak4w51OAEfMZsRYW9C
	6UUCi545ESNnJroAk/EzdwWfyF1tEN4rTI8RhrWTH1J8nnl5EtlX85W+csg9bLD/68qKY7hqrXU
	Ln1TaA1dyprhGfEZWujzEnOiiXw9P2GxkLJedCQo9tAzLBtlSz8qPw9dzMNBcjCF1TqG/DmHdlt
	Ud3iWORyTW0IRCV8HVnksDFASA7bsAX3ag==
X-Google-Smtp-Source: AGHT+IHpSOk8rGIiMZXty/hbuCSKlXyveZLgB4pNTJ04Shha/BPkKtAvaM61qadHeDDYt8o+ld2JZA==
X-Received: by 2002:a17:90b:5245:b0:2ff:784b:ffe with SMTP id 98e67ed59e1d1-3082377c271mr2980340a91.11.1744355555591;
        Fri, 11 Apr 2025 00:12:35 -0700 (PDT)
Received: from localhost ([220.253.99.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171942sm4948139a91.33.2025.04.11.00.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 00:12:35 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 17:12:28 +1000
Message-Id: <D93MFO5IGN4M.2FWKFWQ9G807P@gmail.com>
Cc: "Hugh Dickins" <hughd@google.com>, "Guenter Roeck" <linux@roeck-us.net>,
 "Juergen Gross" <jgross@suse.com>, "Jeremy Fitzhardinge" <jeremy@goop.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <kasan-dev@googlegroups.com>, <sparclinux@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-s390@vger.kernel.org>
Subject: Re: [PATCH v1 0/4] mm: Fix apply_to_pte_range() vs lazy MMU mode
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Alexander Gordeev" <agordeev@linux.ibm.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>
X-Mailer: aerc 0.19.0
References: <cover.1744037648.git.agordeev@linux.ibm.com>
In-Reply-To: <cover.1744037648.git.agordeev@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue Apr 8, 2025 at 1:11 AM AEST, Alexander Gordeev wrote:
> Hi All,
>
> This series is an attempt to fix the violation of lazy MMU mode context
> requirement as described for arch_enter_lazy_mmu_mode():
>
>     This mode can only be entered and left under the protection of
>     the page table locks for all page tables which may be modified.
>
> On s390 if I make arch_enter_lazy_mmu_mode() -> preempt_enable() and
> arch_leave_lazy_mmu_mode() -> preempt_disable() I am getting this:
>
>     [  553.332108] preempt_count: 1, expected: 0
>     [  553.332117] no locks held by multipathd/2116.
>     [  553.332128] CPU: 24 PID: 2116 Comm: multipathd Kdump: loaded Taint=
ed:
>     [  553.332139] Hardware name: IBM 3931 A01 701 (LPAR)
>     [  553.332146] Call Trace:
>     [  553.332152]  [<00000000158de23a>] dump_stack_lvl+0xfa/0x150
>     [  553.332167]  [<0000000013e10d12>] __might_resched+0x57a/0x5e8
>     [  553.332178]  [<00000000144eb6c2>] __alloc_pages+0x2ba/0x7c0
>     [  553.332189]  [<00000000144d5cdc>] __get_free_pages+0x2c/0x88
>     [  553.332198]  [<00000000145663f6>] kasan_populate_vmalloc_pte+0x4e/=
0x110
>     [  553.332207]  [<000000001447625c>] apply_to_pte_range+0x164/0x3c8
>     [  553.332218]  [<000000001448125a>] apply_to_pmd_range+0xda/0x318
>     [  553.332226]  [<000000001448181c>] __apply_to_page_range+0x384/0x76=
8
>     [  553.332233]  [<0000000014481c28>] apply_to_page_range+0x28/0x38
>     [  553.332241]  [<00000000145665da>] kasan_populate_vmalloc+0x82/0x98
>     [  553.332249]  [<00000000144c88d0>] alloc_vmap_area+0x590/0x1c90
>     [  553.332257]  [<00000000144ca108>] __get_vm_area_node.constprop.0+0=
x138/0x260
>     [  553.332265]  [<00000000144d17fc>] __vmalloc_node_range+0x134/0x360
>     [  553.332274]  [<0000000013d5dbf2>] alloc_thread_stack_node+0x112/0x=
378
>     [  553.332284]  [<0000000013d62726>] dup_task_struct+0x66/0x430
>     [  553.332293]  [<0000000013d63962>] copy_process+0x432/0x4b80
>     [  553.332302]  [<0000000013d68300>] kernel_clone+0xf0/0x7d0
>     [  553.332311]  [<0000000013d68bd6>] __do_sys_clone+0xae/0xc8
>     [  553.332400]  [<0000000013d68dee>] __s390x_sys_clone+0xd6/0x118
>     [  553.332410]  [<0000000013c9d34c>] do_syscall+0x22c/0x328
>     [  553.332419]  [<00000000158e7366>] __do_syscall+0xce/0xf0
>     [  553.332428]  [<0000000015913260>] system_call+0x70/0x98
>
> This exposes a KASAN issue fixed with patch 1 and apply_to_pte_range()
> issue fixed with patches 2-3. Patch 4 is a debug improvement on top,
> that could have helped to notice the issue.
>
> Commit b9ef323ea168 ("powerpc/64s: Disable preemption in hash lazy mmu
> mode") looks like powerpc-only fix, yet not entirely conforming to the
> above provided requirement (page tables itself are still not protected).
> If I am not mistaken, xen and sparc are alike.

Huh. powerpc actually has some crazy code in __switch_to() that is
supposed to handle preemption while in lazy mmu mode. So we probably
don't even need to disable preemption, just use the raw per-cpu
accessors (or keep disabling preemption and remove the now dead code
from context switch).

IIRC all this got built up over a long time with some TLB flush
rules changing at the same time, we could probably stay in lazy mmu
mode for a longer time until it was discovered we really need to
flush before dropping the PTL.

ppc64 and sparc I think don't even need lazy mmu mode for kasan (TLBs
do not require flushing) and will function just fine if not in lazy
mode (they just flush one TLB at a time), not sure about xen. We could
actually go the other way and require that archs operate properly when
not in lazy mode (at least for kernel page tables) and avoid it for
apply_to_page_range()?

Thanks,
Nick

