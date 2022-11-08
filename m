Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B098621B1B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 18:50:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6FxC3gkJz3f4w
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 04:50:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SeYjbLWh;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SeYjbLWh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SeYjbLWh;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SeYjbLWh;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6Fsv01P5z3dxq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 04:47:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667929629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZHIUqQjgTcrrLQjjH6jvIopGCgDdzoOnD2NdhMSGVIY=;
	b=SeYjbLWhl4Fht2IEqEVmolUsNr3QYP6yp4e4ddm/mnixqu50++uO84pSd7DU+QUcBksz6k
	pwoXK7abIjBpevXsEKG0xmRiTANB6E8QIjwIdbr5t/I2xjkvZyI/dmnjStu52X2aum5uSA
	gYWkdku0qZctP8THJd4y3UjXYMiXsNU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667929629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZHIUqQjgTcrrLQjjH6jvIopGCgDdzoOnD2NdhMSGVIY=;
	b=SeYjbLWhl4Fht2IEqEVmolUsNr3QYP6yp4e4ddm/mnixqu50++uO84pSd7DU+QUcBksz6k
	pwoXK7abIjBpevXsEKG0xmRiTANB6E8QIjwIdbr5t/I2xjkvZyI/dmnjStu52X2aum5uSA
	gYWkdku0qZctP8THJd4y3UjXYMiXsNU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-mHodWVn8NdeSar_igPbYsg-1; Tue, 08 Nov 2022 12:46:58 -0500
X-MC-Unique: mHodWVn8NdeSar_igPbYsg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F17B382F649;
	Tue,  8 Nov 2022 17:46:57 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.194.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E65DC15BB5;
	Tue,  8 Nov 2022 17:46:53 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] mm/autonuma: replace savedwrite infrastructure
Date: Tue,  8 Nov 2022 18:46:45 +0100
Message-Id: <20221108174652.198904-1-david@redhat.com>
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

This series is based on mm-unstable.

As discussed in my talk at LPC, we can reuse the same mechanism for
deciding whether to map a pte writable when upgrading permissions via
mprotect() -- e.g., PROT_READ -> PROT_READ|PROT_WRITE -- to replace the
savedwrite infrastructure used for NUMA hinting faults (e.g., PROT_NONE
-> PROT_READ|PROT_WRITE).

Instead of maintaining previous write permissions for a pte/pmd, we
re-determine if the pte/pmd can be writable. The big benefit is that we
have a common logic for deciding whether we can map a pte/pmd writable on
protection changes.

For private mappings, there should be no difference -- from
what I understand, that is what autonuma benchmarks care about.

I ran autonumabench for v1 on a system with 2 NUMA nodes, 96 GiB each via:
	perf stat --null --repeat 10
The numa01 benchmark is quite noisy in my environment and I failed to
reduce the noise so far.

numa01:
	mm-unstable:   146.88 +- 6.54 seconds time elapsed  ( +-  4.45% )
	mm-unstable++: 147.45 +- 13.39 seconds time elapsed  ( +-  9.08% )

numa02:
	mm-unstable:   16.0300 +- 0.0624 seconds time elapsed  ( +-  0.39% )
	mm-unstable++: 16.1281 +- 0.0945 seconds time elapsed  ( +-  0.59% )

It is worth noting that for shared writable mappings that require
writenotify, we will only avoid write faults if the pte/pmd is dirty
(inherited from the older mprotect logic). If we ever care about optimizing
that further, we'd need a different mechanism to identify whether the FS
still needs to get notified on the next write access.

In any case, such an optimiztion will then not be autonuma-specific,
but mprotect() permission upgrades would similarly benefit from it.

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

v1 -> v2:
* "mm/mprotect: factor out check whether manual PTE write upgrades are
   required"
 -> Added
* "mm/autonuma: use can_change_(pte|pmd)_writable() to replace savedwrite"
 -> Simplify and don't opimize for failed migration
 -> Update patch description

RFC -> v1:
* "mm/mprotect: allow clean exclusive anon pages to be writable"
 -> Move comment change to patch #2
* "mm/mprotect: minor can_change_pte_writable() cleanups"
 -> Adjust comments
* "mm/huge_memory: try avoiding write faults when changing PMD protection"
 -> Fix wrong check
* "selftests/vm: anon_cow: add mprotect() optimiation tests"
 -> Add basic tests for the mprotect() optimization

David Hildenbrand (6):
  mm/mprotect: minor can_change_pte_writable() cleanups
  mm/huge_memory: try avoiding write faults when changing PMD protection
  mm/mprotect: factor out check whether manual PTE write upgrades are
    required
  mm/autonuma: use can_change_(pte|pmd)_writable() to replace savedwrite
  mm: remove unused savedwrite infrastructure
  selftests/vm: anon_cow: add mprotect() optimization tests

Nadav Amit (1):
  mm/mprotect: allow clean exclusive anon pages to be writable

 arch/powerpc/include/asm/book3s/64/pgtable.h | 80 +-------------------
 arch/powerpc/kvm/book3s_hv_rm_mmu.c          |  2 +-
 include/linux/mm.h                           | 18 ++++-
 include/linux/pgtable.h                      | 24 ------
 mm/debug_vm_pgtable.c                        | 32 --------
 mm/huge_memory.c                             | 64 ++++++++++++----
 mm/ksm.c                                     |  9 +--
 mm/memory.c                                  | 16 +++-
 mm/mprotect.c                                | 50 ++++++------
 tools/testing/selftests/vm/anon_cow.c        | 49 +++++++++++-
 10 files changed, 158 insertions(+), 186 deletions(-)

-- 
2.38.1

