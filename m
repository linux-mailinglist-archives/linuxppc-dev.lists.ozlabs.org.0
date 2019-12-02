Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 832AE10E6D9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 09:21:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RJ3y5yFGzDqLh
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 19:21:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="NA9HB3/P"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RHls4qPRzDqKZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2019 19:07:37 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47RHlh4V2zz9txst;
 Mon,  2 Dec 2019 09:07:28 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=NA9HB3/P; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jENeedGZyhzE; Mon,  2 Dec 2019 09:07:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47RHlh3D7wz9txsq;
 Mon,  2 Dec 2019 09:07:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1575274048; bh=Pfkmv+6zl1ejxY4eGUsKi0YsAcRI6StbPSFCVUfcymU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NA9HB3/PUOD6nye920wQm+iK82PinDWNtTtkIOcwVa1Q+XpHLjn8keX59KuxuipNS
 YuhL54JKnZlUk7T5qR8Qwqgs0wSGG0sNjO5ZqcrZWty5f3leLyUVYXHDkyYS9c7jO2
 JfJ/yrM/TCpcNOqje5a0VIbF206q2vfNm3DUNpsw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0FD2F8B79B;
 Mon,  2 Dec 2019 09:07:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id O4E_l5RfgFtW; Mon,  2 Dec 2019 09:07:32 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C0DD68B770;
 Mon,  2 Dec 2019 09:07:32 +0100 (CET)
Subject: Re: [PATCH v11 0/4] kasan: support backing vmalloc space with real
 shadow memory
To: Daniel Axtens <dja@axtens.net>, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, x86@kernel.org, aryabinin@virtuozzo.com,
 glider@google.com, luto@kernel.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, dvyukov@google.com
References: <20191031093909.9228-1-dja@axtens.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <33b29093-5fbe-c648-a0b1-e3a8525c5631@c-s.fr>
Date: Mon, 2 Dec 2019 09:07:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191031093909.9228-1-dja@axtens.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, gor@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 31/10/2019 à 10:39, Daniel Axtens a écrit :
> Currently, vmalloc space is backed by the early shadow page. This
> means that kasan is incompatible with VMAP_STACK.
> 
> This series provides a mechanism to back vmalloc space with real,
> dynamically allocated memory. I have only wired up x86, because that's
> the only currently supported arch I can work with easily, but it's
> very easy to wire up other architectures, and it appears that there is
> some work-in-progress code to do this on arm64 and s390.

There is also work for providing VMAP_STACK on powerpc32. There is a 
series waiting to be merged at 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=145109

Christophe

> 
> This has been discussed before in the context of VMAP_STACK:
>   - https://bugzilla.kernel.org/show_bug.cgi?id=202009
>   - https://lkml.org/lkml/2018/7/22/198
>   - https://lkml.org/lkml/2019/7/19/822
> 
> In terms of implementation details:
> 
> Most mappings in vmalloc space are small, requiring less than a full
> page of shadow space. Allocating a full shadow page per mapping would
> therefore be wasteful. Furthermore, to ensure that different mappings
> use different shadow pages, mappings would have to be aligned to
> KASAN_SHADOW_SCALE_SIZE * PAGE_SIZE.
> 
> Instead, share backing space across multiple mappings. Allocate a
> backing page when a mapping in vmalloc space uses a particular page of
> the shadow region. This page can be shared by other vmalloc mappings
> later on.
> 
> We hook in to the vmap infrastructure to lazily clean up unused shadow
> memory.
> 
> Testing with test_vmalloc.sh on an x86 VM with 2 vCPUs shows that:
> 
>   - Turning on KASAN, inline instrumentation, without vmalloc, introuduces
>     a 4.1x-4.2x slowdown in vmalloc operations.
> 
>   - Turning this on introduces the following slowdowns over KASAN:
>       * ~1.76x slower single-threaded (test_vmalloc.sh performance)
>       * ~2.18x slower when both cpus are performing operations
>         simultaneously (test_vmalloc.sh sequential_test_order=1)
> 
> This is unfortunate but given that this is a debug feature only, not
> the end of the world. The benchmarks are also a stress-test for the
> vmalloc subsystem: they're not indicative of an overall 2x slowdown!
> 
> 
> v1: https://lore.kernel.org/linux-mm/20190725055503.19507-1-dja@axtens.net/
> v2: https://lore.kernel.org/linux-mm/20190729142108.23343-1-dja@axtens.net/
>   Address review comments:
>   - Patch 1: use kasan_unpoison_shadow's built-in handling of
>              ranges that do not align to a full shadow byte
>   - Patch 3: prepopulate pgds rather than faulting things in
> v3: https://lore.kernel.org/linux-mm/20190731071550.31814-1-dja@axtens.net/
>   Address comments from Mark Rutland:
>   - kasan_populate_vmalloc is a better name
>   - handle concurrency correctly
>   - various nits and cleanups
>   - relax module alignment in KASAN_VMALLOC case
> v4: https://lore.kernel.org/linux-mm/20190815001636.12235-1-dja@axtens.net/
>   Changes to patch 1 only:
>   - Integrate Mark's rework, thanks Mark!
>   - handle the case where kasan_populate_shadow might fail
>   - poision shadow on free, allowing the alloc path to just
>       unpoision memory that it uses
> v5: https://lore.kernel.org/linux-mm/20190830003821.10737-1-dja@axtens.net/
>   Address comments from Christophe Leroy:
>   - Fix some issues with my descriptions in commit messages and docs
>   - Dynamically free unused shadow pages by hooking into the vmap book-keeping
>   - Split out the test into a separate patch
>   - Optional patch to track the number of pages allocated
>   - minor checkpatch cleanups
> v6: https://lore.kernel.org/linux-mm/20190902112028.23773-1-dja@axtens.net/
>   Properly guard freeing pages in patch 1, drop debugging code.
> v7: https://lore.kernel.org/linux-mm/20190903145536.3390-1-dja@axtens.net/
>      Add a TLB flush on freeing, thanks Mark Rutland.
>      Explain more clearly how I think freeing is concurrency-safe.
> v8: https://lore.kernel.org/linux-mm/20191001065834.8880-1-dja@axtens.net/
>      rename kasan_vmalloc/shadow_pages to kasan/vmalloc_shadow_pages
> v9: https://lore.kernel.org/linux-mm/20191017012506.28503-1-dja@axtens.net/
>      (attempt to) address a number of review comments for patch 1.
> v10: https://lore.kernel.org/linux-mm/20191029042059.28541-1-dja@axtens.net/
>       - rebase on linux-next, pulling in Vlad's new work on splitting the
>         vmalloc locks.
>       - after much discussion of barriers, document where I think they
>         are needed and why. Thanks Mark and Andrey.
>       - clean up some TLB flushing and checkpatch bits
> v11: Address review comments from Andrey and Vlad, drop patch 5, add benchmarking
>       results.
> 
> Daniel Axtens (4):
>    kasan: support backing vmalloc space with real shadow memory
>    kasan: add test for vmalloc
>    fork: support VMAP_STACK with KASAN_VMALLOC
>    x86/kasan: support KASAN_VMALLOC
> 
>   Documentation/dev-tools/kasan.rst |  63 ++++++++
>   arch/Kconfig                      |   9 +-
>   arch/x86/Kconfig                  |   1 +
>   arch/x86/mm/kasan_init_64.c       |  61 ++++++++
>   include/linux/kasan.h             |  31 ++++
>   include/linux/moduleloader.h      |   2 +-
>   include/linux/vmalloc.h           |  12 ++
>   kernel/fork.c                     |   4 +
>   lib/Kconfig.kasan                 |  16 +++
>   lib/test_kasan.c                  |  26 ++++
>   mm/kasan/common.c                 | 231 ++++++++++++++++++++++++++++++
>   mm/kasan/generic_report.c         |   3 +
>   mm/kasan/kasan.h                  |   1 +
>   mm/vmalloc.c                      |  53 +++++--
>   14 files changed, 500 insertions(+), 13 deletions(-)
> 
