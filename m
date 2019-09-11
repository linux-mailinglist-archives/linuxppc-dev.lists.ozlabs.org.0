Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A51AEAF5CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 08:28:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SsRn3YtrzF239
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 16:28:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Vv9CIr4I"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SsQ52yXNzF1wq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 16:27:22 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46SsPv54XQz9tyFD;
 Wed, 11 Sep 2019 08:27:15 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Vv9CIr4I; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id w1BPK-Y6gRxf; Wed, 11 Sep 2019 08:27:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46SsPv3ylWz9tyFB;
 Wed, 11 Sep 2019 08:27:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568183235; bh=8DN7IMEU4e9mFBvwAi2QoWhd7U2FAikrDh/bbqIdhac=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Vv9CIr4IP2LFKoqy15lJ9ZwdjXq3x3GJe4tXa0mej7ZPo0cfF5oAB2N2IAEdyD9Vc
 pgNn3NPMUWjsK5WPsfz8PPmC2/zS14Q5INeHVDGY2qiLANAPhSyd/kkzX4ux6gKytp
 4ZozOq0N07ZTMiQEgS/zJBpeph/xXjwutI4JwPis=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F62D8B7CA;
 Wed, 11 Sep 2019 08:27:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id haPxXK31oHYl; Wed, 11 Sep 2019 08:27:16 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1FCC38B74C;
 Wed, 11 Sep 2019 08:27:16 +0200 (CEST)
Subject: Re: [PATCH v7 0/5] kasan: support backing vmalloc space with real
 shadow memory
To: Daniel Axtens <dja@axtens.net>, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, x86@kernel.org, aryabinin@virtuozzo.com,
 glider@google.com, luto@kernel.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, dvyukov@google.com
References: <20190903145536.3390-1-dja@axtens.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d43cba17-ef1f-b715-e826-5325432042dd@c-s.fr>
Date: Wed, 11 Sep 2019 06:27:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20190903145536.3390-1-dja@axtens.net>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, gor@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Daniel,

Are any other patches required prior to this series ? I have tried to 
apply it on later powerpc/merge branch without success:


[root@localhost linux-powerpc]# git am 
/root/Downloads/kasan-support-backing-vmalloc-space-with-real-shadow-memory\(1\).patch 

Applying: kasan: support backing vmalloc space with real shadow memory
.git/rebase-apply/patch:389: trailing whitespace.
  *                 (1)      (2)      (3)
error: patch failed: lib/Kconfig.kasan:142
error: lib/Kconfig.kasan: patch does not apply
Patch failed at 0001 kasan: support backing vmalloc space with real 
shadow memory
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


[root@localhost linux-powerpc]# git am -3 
/root/Downloads/kasan-support-backing-vmalloc-space-with-real-shadow-memory\(1\).patch 

Applying: kasan: support backing vmalloc space with real shadow memory
error: sha1 information is lacking or useless (include/linux/vmalloc.h).
error: could not build fake ancestor
Patch failed at 0001 kasan: support backing vmalloc space with real 
shadow memory
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


Christophe

On 09/03/2019 02:55 PM, Daniel Axtens wrote:
> Currently, vmalloc space is backed by the early shadow page. This
> means that kasan is incompatible with VMAP_STACK.
> 
> This series provides a mechanism to back vmalloc space with real,
> dynamically allocated memory. I have only wired up x86, because that's
> the only currently supported arch I can work with easily, but it's
> very easy to wire up other architectures, and it appears that there is
> some work-in-progress code to do this on arm64 and s390.
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
> v7: Add a TLB flush on freeing, thanks Mark Rutland.
>      Explain more clearly how I think freeing is concurrency-safe.
> 
> Daniel Axtens (5):
>    kasan: support backing vmalloc space with real shadow memory
>    kasan: add test for vmalloc
>    fork: support VMAP_STACK with KASAN_VMALLOC
>    x86/kasan: support KASAN_VMALLOC
>    kasan debug: track pages allocated for vmalloc shadow
> 
>   Documentation/dev-tools/kasan.rst |  63 ++++++++
>   arch/Kconfig                      |   9 +-
>   arch/x86/Kconfig                  |   1 +
>   arch/x86/mm/kasan_init_64.c       |  60 ++++++++
>   include/linux/kasan.h             |  31 ++++
>   include/linux/moduleloader.h      |   2 +-
>   include/linux/vmalloc.h           |  12 ++
>   kernel/fork.c                     |   4 +
>   lib/Kconfig.kasan                 |  16 +++
>   lib/test_kasan.c                  |  26 ++++
>   mm/kasan/common.c                 | 230 ++++++++++++++++++++++++++++++
>   mm/kasan/generic_report.c         |   3 +
>   mm/kasan/kasan.h                  |   1 +
>   mm/vmalloc.c                      |  45 +++++-
>   14 files changed, 497 insertions(+), 6 deletions(-)
> 
