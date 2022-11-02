Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E61E616D8E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 20:13:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2c3s1Gcvz3cLx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 06:13:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NQuhZ2d9;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=do0WOE7G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NQuhZ2d9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=do0WOE7G;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2c2w6W5dz3cBX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 06:12:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667416339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VER05fjf0NohBVPF35ToVp+oJ6fxGSpDkuoi/f3w0wA=;
	b=NQuhZ2d9egS3sZYRzYIyMhlhf0XV4oxUJiRCzJVqXsZPHm7qFCqbSmNoKn6fnWkdYPbVmC
	qEeR4PFWbNnM3FCWM3aoc2iBiMYwP8jmGMcb8cD9XJg34qnaWmY5tQDR1JA6FxT7cIm+Ao
	ilCo8SNqj7x6eTz9iwmkGx3GfDiXYJI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667416340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VER05fjf0NohBVPF35ToVp+oJ6fxGSpDkuoi/f3w0wA=;
	b=do0WOE7G+G5sT9Vs+ywu1Wwg2eOUpuUFUOR+NAk1jyL6mwI4L33LQSMOyCWyEV5cOgCZHa
	QrWCKrHMnclkgOQrKJlTDdTtW1RiJu1pC8PUpyWMiHRuIc+5o8xc0vhQ7Wc/r1VXt60Drr
	KXGawdVV6EydSo+oIetPBjnUbnqGoU0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-fHaa8UhcO6au98qUUN7h_g-1; Wed, 02 Nov 2022 15:12:15 -0400
X-MC-Unique: fHaa8UhcO6au98qUUN7h_g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2C84185A79C;
	Wed,  2 Nov 2022 19:12:14 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.192.243])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C136449BB60;
	Wed,  2 Nov 2022 19:12:10 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/6] mm/autonuma: replace savedwrite infrastructure
Date: Wed,  2 Nov 2022 20:12:03 +0100
Message-Id: <20221102191209.289237-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

I ran autonumabench on a system with 2 NUMA nodes, 96 GiB each via:
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

RFC -> v1:
* "mm/mprotect: allow clean exclusive anon pages to be writable"
 -> Move comment change to patch #2
* "mm/mprotect: minor can_change_pte_writable() cleanups"
 -> Adjust comments
* "mm/huge_memory: try avoiding write faults when changing PMD protection"
 -> Fix wrong check
* "selftests/vm: anon_cow: add mprotect() optimiation tests"
 -> Add basic tests for the mprotect() optimization


David Hildenbrand (5):
  mm/mprotect: minor can_change_pte_writable() cleanups
  mm/huge_memory: try avoiding write faults when changing PMD protection
  mm/autonuma: use can_change_(pte|pmd)_writable() to replace savedwrite
  mm: remove unused savedwrite infrastructure
  selftests/vm: anon_cow: add mprotect() optimization tests

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
 mm/mprotect.c                                | 33 ++++----
 tools/testing/selftests/vm/anon_cow.c        | 49 +++++++++++-
 10 files changed, 145 insertions(+), 171 deletions(-)

-- 
2.38.1

