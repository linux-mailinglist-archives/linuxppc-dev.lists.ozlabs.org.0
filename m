Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DADB8EA48
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 13:30:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468PQC4npFzDr3T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 21:30:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 468PNQ0HfRzDr2K
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 21:28:51 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A2E0360;
 Thu, 15 Aug 2019 04:28:48 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD5DA3F694;
 Thu, 15 Aug 2019 04:28:46 -0700 (PDT)
Date: Thu, 15 Aug 2019 12:28:44 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH v4 0/3] kasan: support backing vmalloc space with real
 shadow memory
Message-ID: <20190815112844.GC22153@lakrids.cambridge.arm.com>
References: <20190815001636.12235-1-dja@axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815001636.12235-1-dja@axtens.net>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
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
Cc: gor@linux.ibm.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com,
 luto@kernel.org, aryabinin@virtuozzo.com, linuxppc-dev@lists.ozlabs.org,
 dvyukov@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 15, 2019 at 10:16:33AM +1000, Daniel Axtens wrote:
> Currently, vmalloc space is backed by the early shadow page. This
> means that kasan is incompatible with VMAP_STACK, and it also provides
> a hurdle for architectures that do not have a dedicated module space
> (like powerpc64).
> 
> This series provides a mechanism to back vmalloc space with real,
> dynamically allocated memory. I have only wired up x86, because that's
> the only currently supported arch I can work with easily, but it's
> very easy to wire up other architectures.

I'm happy to send patches for arm64 once we've settled some conflicting
rework going on for 52-bit VA support.

> 
> This has been discussed before in the context of VMAP_STACK:
>  - https://bugzilla.kernel.org/show_bug.cgi?id=202009
>  - https://lkml.org/lkml/2018/7/22/198
>  - https://lkml.org/lkml/2019/7/19/822
> 
> In terms of implementation details:
> 
> Most mappings in vmalloc space are small, requiring less than a full
> page of shadow space. Allocating a full shadow page per mapping would
> therefore be wasteful. Furthermore, to ensure that different mappings
> use different shadow pages, mappings would have to be aligned to
> KASAN_SHADOW_SCALE_SIZE * PAGE_SIZE.
> 
> Instead, share backing space across multiple mappings. Allocate
> a backing page the first time a mapping in vmalloc space uses a
> particular page of the shadow region. Keep this page around
> regardless of whether the mapping is later freed - in the mean time
> the page could have become shared by another vmalloc mapping.
> 
> This can in theory lead to unbounded memory growth, but the vmalloc
> allocator is pretty good at reusing addresses, so the practical memory
> usage appears to grow at first but then stay fairly stable.
> 
> If we run into practical memory exhaustion issues, I'm happy to
> consider hooking into the book-keeping that vmap does, but I am not
> convinced that it will be an issue.

FWIW, I haven't spotted such memory exhaustion after a week of Syzkaller
fuzzing with the last patchset, across 3 machines, so that sounds fine
to me.

Otherwise, this looks good to me now! For the x86 and fork patch, feel
free to add:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> 
> v1: https://lore.kernel.org/linux-mm/20190725055503.19507-1-dja@axtens.net/
> v2: https://lore.kernel.org/linux-mm/20190729142108.23343-1-dja@axtens.net/
>  Address review comments:
>  - Patch 1: use kasan_unpoison_shadow's built-in handling of
>             ranges that do not align to a full shadow byte
>  - Patch 3: prepopulate pgds rather than faulting things in
> v3: https://lore.kernel.org/linux-mm/20190731071550.31814-1-dja@axtens.net/
>  Address comments from Mark Rutland:
>  - kasan_populate_vmalloc is a better name
>  - handle concurrency correctly
>  - various nits and cleanups
>  - relax module alignment in KASAN_VMALLOC case
> v4: Changes to patch 1 only:
>  - Integrate Mark's rework, thanks Mark!
>  - handle the case where kasan_populate_shadow might fail
>  - poision shadow on free, allowing the alloc path to just
>      unpoision memory that it uses
> 
> Daniel Axtens (3):
>   kasan: support backing vmalloc space with real shadow memory
>   fork: support VMAP_STACK with KASAN_VMALLOC
>   x86/kasan: support KASAN_VMALLOC
> 
>  Documentation/dev-tools/kasan.rst | 60 +++++++++++++++++++++++++++
>  arch/Kconfig                      |  9 +++--
>  arch/x86/Kconfig                  |  1 +
>  arch/x86/mm/kasan_init_64.c       | 61 ++++++++++++++++++++++++++++
>  include/linux/kasan.h             | 24 +++++++++++
>  include/linux/moduleloader.h      |  2 +-
>  include/linux/vmalloc.h           | 12 ++++++
>  kernel/fork.c                     |  4 ++
>  lib/Kconfig.kasan                 | 16 ++++++++
>  lib/test_kasan.c                  | 26 ++++++++++++
>  mm/kasan/common.c                 | 67 +++++++++++++++++++++++++++++++
>  mm/kasan/generic_report.c         |  3 ++
>  mm/kasan/kasan.h                  |  1 +
>  mm/vmalloc.c                      | 28 ++++++++++++-
>  14 files changed, 308 insertions(+), 6 deletions(-)
> 
> -- 
> 2.20.1
> 
