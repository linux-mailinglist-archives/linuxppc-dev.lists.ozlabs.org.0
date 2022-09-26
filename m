Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E71B85EAAFF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 17:27:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mbmnz6GdWz3c8X
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 01:27:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fy7DqcTQ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fy7DqcTQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fy7DqcTQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fy7DqcTQ;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbmnQ1ggGz2xZ4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 01:26:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664205988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YcUAoJPx/293KJLL46ZZ2kLyCO3l5xX7bQLDqEviC+8=;
	b=Fy7DqcTQrCYJ5NBXmQ59D80r2K5EmU36Z94wvSkQaPnQLEcU2Q5bnQwYGZOo2BMyxo+RMV
	iOuvRyKvZ1BvOiAVJQd0I3HaOuXk/60TpAxZP9yT7GWUlrcfFSlBkBvW7fftImZnqRcuiG
	mpgP24AkQe3H4kby+z963u8HhtQH/ps=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664205988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YcUAoJPx/293KJLL46ZZ2kLyCO3l5xX7bQLDqEviC+8=;
	b=Fy7DqcTQrCYJ5NBXmQ59D80r2K5EmU36Z94wvSkQaPnQLEcU2Q5bnQwYGZOo2BMyxo+RMV
	iOuvRyKvZ1BvOiAVJQd0I3HaOuXk/60TpAxZP9yT7GWUlrcfFSlBkBvW7fftImZnqRcuiG
	mpgP24AkQe3H4kby+z963u8HhtQH/ps=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-vIy5ixN0PjmWNTQVGUCBmg-1; Mon, 26 Sep 2022 11:26:24 -0400
X-MC-Unique: vIy5ixN0PjmWNTQVGUCBmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8541858F13;
	Mon, 26 Sep 2022 15:26:23 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EBAFDC15BA5;
	Mon, 26 Sep 2022 15:26:19 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 0/5] mm/autonuma: replace savedwrite infrastructure
Date: Mon, 26 Sep 2022 17:26:13 +0200
Message-Id: <20220926152618.194810-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Anshuman Khandual <anshuman.khandual@arm.com>, Dave Chinner <david@fromorbit.com>, Mel Gorman <mgorman@techsingularity.net>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Hugh Dickins <hughd@google.com>, Nadav Amit <namit@vmware.com>, Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As discussed in my talk at LPC, we can reuse the same mechanism for
deciding whether to map a pte writable when upgrading permissions via
mprotect() -- e.g., PROT_READ -> PROT_READ|PROT_WRITE -- to replace the
savedwrite infrastructure used for NUMA hinting faults (e.g., PROT_NONE
-> PROT_READ|PROT_WRITE). Instead of maintaining previous write permissions
for a pte/pmd, we re-determine if the pte/pmd can be writable.

The big benefit is that we have a common logic for deciding whether we can
map a pte/pmd writable on protection changes.

For private mappings, there should be no difference -- from
what I understand, that is what autonuma benchmarks care about.

I ran autonumabench on a system with 2 NUMA nodes, 96 GiB each via:
	perf stat --null --repeat 10

The numa1 benchmark is quite noisy in my environment. I suspect that there
is no actual change in performance, even though the numbers indicate that
this series might improve performance slightly.

numa1:
	mm-stable:   156.75 +- 11.67 seconds time elapsed  ( +-  7.44% )
	mm-stable++: 147.50 +- 9.35 seconds time elapsed  ( +-  6.34% )

numa2:
	mm-stable:   15.9834 +- 0.0589 seconds time elapsed  ( +-  0.37% )
	mm-stable++: 16.1467 +- 0.0946 seconds time elapsed  ( +-  0.59% )

It is worth noting that for shared writable mappings that require
writenotify, we will only avoid write faults if the pte/pmd is dirty
(inherited from the older mprotect logic). If we ever care about optimizing
that further, we'd need a different mechanism to identify whether the FS
still needs to get notified on the next write access. In any case, such an
optimiztion will then not be autonuma-specific, but mprotect() permission
upgrades would similarly benefit from it.

Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Dave Chinner <david@fromorbit.com>
Cc: Nadav Amit <namit@vmware.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>

David Hildenbrand (4):
  mm/mprotect: minor can_change_pte_writable() cleanups
  mm/huge_memory: try avoiding write faults when changing PMD protection
  mm/autonuma: use can_change_(pte|pmd)_writable() to replace savedwrite
  mm: remove unused savedwrite infrastructure

Nadav Amit (1):
  mm/mprotect: allow clean exclusive anon pages to be writable

 arch/powerpc/include/asm/book3s/64/pgtable.h | 80 +-------------------
 arch/powerpc/kvm/book3s_hv_rm_mmu.c          |  2 +-
 include/linux/mm.h                           |  2 +
 include/linux/pgtable.h                      | 24 ------
 mm/debug_vm_pgtable.c                        | 32 --------
 mm/huge_memory.c                             | 66 ++++++++++++----
 mm/ksm.c                                     |  9 +--
 mm/memory.c                                  | 19 ++++-
 mm/mprotect.c                                | 23 +++---
 9 files changed, 93 insertions(+), 164 deletions(-)

-- 
2.37.3

