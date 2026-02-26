Return-Path: <linuxppc-dev+bounces-17244-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGt8HJUvoGmLgAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17244-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:33:41 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8611A5140
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 12:33:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM8V71XTQz2yLH;
	Thu, 26 Feb 2026 22:33:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.184
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772105615;
	cv=none; b=P+vzGO/KrS9/iHCbsmpWKdcSPdq7TDpAL4QUEyxv4sOPVNbCGQXTuQh3FJwacAFI5SNGoceuh+DvG2aK8264IQyQypu5oMap07l7XvrBhnnmcasJ6ZYP9QfNIL3HS/9MOejbwhcRh65JV8BazVmSug9waTsbuy+BHBWRlww/ixXL6WH1jsdJ2strq/rH9CuyJzy5oziXX7Fr1+q2K/id+ODltue/F47BA3mxD6R0nfDko6DmkFqbACCMOwiZB8D6VzjkDp9MtMwhNJAR26PG9dtdUq3F/W5wCvaxAYIhJVgZhf+l6907SQN2VMX7eah7MwJXgrEiclw38zEX97vg8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772105615; c=relaxed/relaxed;
	bh=k2ELw/d/0Gog00pMOWAThLbOMM5tKNxDq9T0P2nOjys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oHx17sevTpbC97YN6haDdSVCMXdMa6xilnd1GTP+XoF3iNQyUkYrlPBQI3uXTJh7xD9zqJb4ZhPuOT8Mr+o0etYS39CMN3vf374L04b957JVgrbK7ZN3pz37JNJgTyKITy+M9In5jjVLLQo0cJqyZSQ+1HflwQK9UB1AuNp10YAL6g0aKDf2FD5WRN3msLKA/bSksW+wFD93woVfOIkGHma0rCsB487HTKoyj1rBYnUkiLcFge2XwwLkfGCasG4698a2nw4WufrqFIxM8N58Tu1g2npj4VzhFNyU9VMxM488qGwtwj8/2WC6WyomUD6iD0s0XI2zMsYRZyrLJ70nXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n+LWDYrt; dkim-atps=neutral; spf=pass (client-ip=91.218.175.184; helo=out-184.mta0.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n+LWDYrt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.184; helo=out-184.mta0.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org)
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM8V34pJwz2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 22:33:31 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772105581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k2ELw/d/0Gog00pMOWAThLbOMM5tKNxDq9T0P2nOjys=;
	b=n+LWDYrtObsXfcKC7/nZPQ+aQqrswSfcmVak0ruMCIQrn4JHlHeaAjZLo0fHzU/CZyaKM0
	oZGFn+vdg7IzoLhh3QnaIGrmyYrAMUoaiAVI3rguksiXePFiMnXJOV3hJbZcr3SknCNQuK
	SjmK1cJeVR4nov6+c2ABb6MO5qENT9k=
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	willy@infradead.org,
	linux-mm@kvack.org
Cc: fvdl@google.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	Liam.Howlett@oracle.com,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	linux-s390@vger.kernel.org,
	Usama Arif <usama.arif@linux.dev>
Subject: [RFC v2 00/21] mm: thp: lazy PTE page table allocation at PMD split
Date: Thu, 26 Feb 2026 03:23:29 -0800
Message-ID: <20260226113233.3987674-1-usama.arif@linux.dev>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17244-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[usama.arif@linux.dev,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:willy@infradead.org,m:linux-mm@kvack.org,m:fvdl@google.com,m:hannes@cmpxchg.org,m:riel@surriel.com,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baohua@kernel.org,m:dev.jain@arm.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:vbabka@kernel.org,m:lance.yang@linux.dev,m:linux-kernel@vger.kernel.org,m:kernel-team@meta.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:usama.arif@linux.dev,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[usama.arif@linux.dev,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: 7F8611A5140
X-Rspamd-Action: no action

When the kernel creates a PMD-level THP mapping for anonymous pages, it
pre-allocates a PTE page table via pgtable_trans_huge_deposit(). This
page table sits unused in a deposit list for the lifetime of the THP
mapping, only to be withdrawn when the PMD is split or zapped. Every
anonymous THP therefore wastes 4KB of memory unconditionally. On large
servers where hundreds of gigabytes of memory are mapped as THPs, this
adds up: roughly 200MB wasted per 100GB of THP memory. This memory
could otherwise satisfy other allocations, including the very PTE page
table allocations needed when splits eventually occur.

This series removes the pre-deposit and allocates the PTE page table
lazily — only when a PMD split actually happens. Since a large number
of THPs are never split (they are zapped wholesale when processes exit or
munmap the full range), the allocation is avoided entirely in the common
case.

The pre-deposit pattern exists because split_huge_pmd was designed as an
operation that must never fail: if the kernel decides to split, it needs
a PTE page table, so one is deposited in advance. But "must never fail"
is an unnecessarily strong requirement. A PMD split is typically triggered
by a partial operation on a sub-PMD range — partial munmap, partial
mprotect, partial mremap and so on.
Most of these operations already have well-defined error handling for
allocation failures (e.g., -ENOMEM, VM_FAULT_OOM). Allowing split to
fail and propagating the error through these existing paths is the natural
thing to do. Furthermore, split failing requires an order-0 allocation for
a page table to fail, which is extremely unlikely.

Designing functions like split_huge_pmd as operations that cannot fail
has a subtle but real cost to code quality. It forces a pre-allocation
pattern - every THP creation path must deposit a page table, and every
split or zap path must withdraw one, creating a hidden coupling between
widely separated code paths.

This also serves as a code cleanup. On every architecture except powerpc
with hash MMU, the deposit/withdraw machinery becomes dead code. The
series removes the generic implementations in pgtable-generic.c and the
s390/sparc overrides, replacing them with no-op stubs guarded by
arch_needs_pgtable_deposit(), which evaluates to false at compile time
on all non-powerpc architectures.

The series is structured as follows:

Patches 1-2:    Error infrastructure — make split functions return int
                and propagate errors from vma_adjust_trans_huge()
                through __split_vma, vma_shrink, and commit_merge.

Patches 3-12:   Handle split failure at every call site — copy_huge_pmd,
                do_huge_pmd_wp_page, zap_pmd_range, wp_huge_pmd,
                change_pmd_range (mprotect), follow_pmd_mask (GUP),
                walk_pmd_range (pagewalk), move_page_tables (mremap),
                move_pages (userfaultfd), and device migration.
                The code will become affective in Patch 14 when split
                functions start returning -ENOMEM.

Patch 13:       Add __must_check to __split_huge_pmd(), split_huge_pmd()
                and split_huge_pmd_address() so the compiler warns on
                unchecked return values.

Patch 14:       The actual change — allocate PTE page tables lazily at
                split time instead of pre-depositing at THP creation.
                This is when split functions will actually start returning
                -ENOMEM.

Patch 15:       Remove the now-dead deposit/withdraw code on
                non-powerpc architectures.

Patch 16:       Add THP_SPLIT_PMD_FAILED vmstat counter for monitoring
                split failures.

Patches 17-21:  Selftests covering partial munmap, mprotect, mlock,
                mremap, and MADV_DONTNEED on THPs to exercise the
                split paths.

The error handling patches are placed before the lazy allocation patch so
that every call site is already prepared to handle split failures before
the failure mode is introduced. This makes each patch independently safe
to apply and bisect through.

The patches were tested with CONFIG_DEBUG_ATOMIC_SLEEP and CONFIG_DEBUG_VM
enabled. The test results are below:

TAP version 13
1..5
# Starting 5 tests from 1 test cases.
#  RUN           thp_pmd_split.partial_munmap ...
# thp_pmd_split_test.c:60:partial_munmap:thp_split_pmd: 0 -> 1
# thp_pmd_split_test.c:62:partial_munmap:thp_split_pmd_failed: 0 -> 0
#            OK  thp_pmd_split.partial_munmap
ok 1 thp_pmd_split.partial_munmap
#  RUN           thp_pmd_split.partial_mprotect ...
# thp_pmd_split_test.c:60:partial_mprotect:thp_split_pmd: 1 -> 2
# thp_pmd_split_test.c:62:partial_mprotect:thp_split_pmd_failed: 0 -> 0
#            OK  thp_pmd_split.partial_mprotect
ok 2 thp_pmd_split.partial_mprotect
#  RUN           thp_pmd_split.partial_mlock ...
# thp_pmd_split_test.c:60:partial_mlock:thp_split_pmd: 2 -> 3
# thp_pmd_split_test.c:62:partial_mlock:thp_split_pmd_failed: 0 -> 0
#            OK  thp_pmd_split.partial_mlock
ok 3 thp_pmd_split.partial_mlock
#  RUN           thp_pmd_split.partial_mremap ...
# thp_pmd_split_test.c:60:partial_mremap:thp_split_pmd: 3 -> 4
# thp_pmd_split_test.c:62:partial_mremap:thp_split_pmd_failed: 0 -> 0
#            OK  thp_pmd_split.partial_mremap
ok 4 thp_pmd_split.partial_mremap
#  RUN           thp_pmd_split.partial_madv_dontneed ...
# thp_pmd_split_test.c:60:partial_madv_dontneed:thp_split_pmd: 4 -> 5
# thp_pmd_split_test.c:62:partial_madv_dontneed:thp_split_pmd_failed: 0 -> 0
#            OK  thp_pmd_split.partial_madv_dontneed
ok 5 thp_pmd_split.partial_madv_dontneed
# PASSED: 5 / 5 tests passed.
# Totals: pass:5 fail:0 xfail:0 xpass:0 skip:0 error:0

The patches are based off of 957a3fab8811b455420128ea5f41c51fd23eb6c7 from
mm-unstable as of 25 Feb (7.0.0-rc1).


RFC v1 -> v2: https://lore.kernel.org/all/20260211125507.4175026-1-usama.arif@linux.dev/
- Change counter name to THP_SPLIT_PMD_FAILED (David)
- remove pgtable_trans_huge_{deposit/withdraw} when not needed and
  make them arch specific (David)
- make split functions return error code and have callers handle them
  (David and Kiryl)
- Add test cases for splitting

Usama Arif (21):
  mm: thp: make split_huge_pmd functions return int for error
    propagation
  mm: thp: propagate split failure from vma_adjust_trans_huge()
  mm: thp: handle split failure in copy_huge_pmd()
  mm: thp: handle split failure in do_huge_pmd_wp_page()
  mm: thp: handle split failure in zap_pmd_range()
  mm: thp: handle split failure in wp_huge_pmd()
  mm: thp: retry on split failure in change_pmd_range()
  mm: thp: handle split failure in follow_pmd_mask()
  mm: handle walk_page_range() failure from THP split
  mm: thp: handle split failure in mremap move_page_tables()
  mm: thp: handle split failure in userfaultfd move_pages()
  mm: thp: handle split failure in device migration
  mm: huge_mm: Make sure all split_huge_pmd calls are checked
  mm: thp: allocate PTE page tables lazily at split time
  mm: thp: remove pgtable_trans_huge_{deposit/withdraw} when not needed
  mm: thp: add THP_SPLIT_PMD_FAILED counter
  selftests/mm: add THP PMD split test infrastructure
  selftests/mm: add partial_mprotect test for change_pmd_range
  selftests/mm: add partial_mlock test
  selftests/mm: add partial_mremap test for move_page_tables
  selftests/mm: add madv_dontneed_partial test

 arch/powerpc/include/asm/book3s/64/pgtable.h  |  12 +-
 arch/s390/include/asm/pgtable.h               |   6 -
 arch/s390/mm/pgtable.c                        |  41 ---
 arch/sparc/include/asm/pgtable_64.h           |   6 -
 arch/sparc/mm/tlb.c                           |  36 ---
 include/linux/huge_mm.h                       |  51 +--
 include/linux/pgtable.h                       |  16 +-
 include/linux/vm_event_item.h                 |   1 +
 mm/debug_vm_pgtable.c                         |   4 +-
 mm/gup.c                                      |  10 +-
 mm/huge_memory.c                              | 208 +++++++++----
 mm/khugepaged.c                               |   7 +-
 mm/memory.c                                   |  26 +-
 mm/migrate_device.c                           |  33 +-
 mm/mprotect.c                                 |  11 +-
 mm/mremap.c                                   |   8 +-
 mm/pagewalk.c                                 |   8 +-
 mm/pgtable-generic.c                          |  32 --
 mm/rmap.c                                     |  42 ++-
 mm/userfaultfd.c                              |   8 +-
 mm/vma.c                                      |  37 ++-
 mm/vmstat.c                                   |   1 +
 tools/testing/selftests/mm/Makefile           |   1 +
 .../testing/selftests/mm/thp_pmd_split_test.c | 290 ++++++++++++++++++
 tools/testing/vma/include/stubs.h             |   9 +-
 25 files changed, 645 insertions(+), 259 deletions(-)
 create mode 100644 tools/testing/selftests/mm/thp_pmd_split_test.c

-- 
2.47.3


