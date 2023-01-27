Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D74967EE73
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 20:42:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3SdV6vyyz3fHR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 06:42:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=iNYcYX2Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=32ijuywykdketvsfochpphmf.dpnmjovyqqd-efwmjtut.pambct.psh@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=iNYcYX2Q;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Scb4BKYz3bk8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:41:17 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id n8-20020a258d08000000b007facaf67acfso6391794ybl.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jHaigHL/qYALF8TO1v9tjquwWSXhIW6ro+oG3/El/0k=;
        b=iNYcYX2QA3x1vr3JKW/CHzagf4bTyxKFq2HNLUndU1FDbxnpdvC5Bx79ipUe5icsq2
         L1QQ3JnQTu1WWzZPBDlfozjO4aULoX8mfAfmU4AIrqUzrl2iYsaiJptv9ja4xntqTscy
         sosTYMYH4iihhnMMwGJ+n1/iWr6zHPBk/vTw1u6oYZdVfCC+atdu9aplEIu2q8zAzv7c
         h9zisHKP34d06K74Vd9UfheznkjPfKBbP0aa8nDMicRotxfauD3U69iVQ/KatVAyQE+E
         UAQVTSN9bEF96M2D2gkDtf8TG4L0na2nvfHQb9o+9nkVueFxCLOEIR4tS/r4iRrbQs/P
         X8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHaigHL/qYALF8TO1v9tjquwWSXhIW6ro+oG3/El/0k=;
        b=CxTSwhNzOjT9+XoWSP+D+i/5b7W0rtqqcrk43VT7enbHyn0vwM2gonvYMC00RsBGRV
         Jhyn2fRN3vTZOI5t6o/G/X+Tx7KGmu139Ecqnimm+6jbcJ0I1ZSKhEyd40P9ww4CEdBI
         445FnlV9xFvP/tB2TgKoptrFkhn6WqpThwNUdu/ZN2yXNQcpwtibE0dH28OD0keTtU0s
         /hxqDNSCnRkNG4eOW/6IUlBIbsEp19Xk+yef/+t1pXpv3IX9XdIqmMCom6/2LtuTBvMB
         YBrkW/uJFf8tUpCBEAI6aQuNfiW1qLjCWxVRo4B+GylrlXw3OH/OV/r0C2tquYHFyZiw
         a9CA==
X-Gm-Message-State: AFqh2kq7HHq/z74uhN6IqCBBSnYY135Pny09RhZTwS7+qH/ovkFW5RtE
	/FoSeGX/Lx5aBcR9qXH40RK1g7IyzTM=
X-Google-Smtp-Source: AMrXdXtE7RP7VYbKUC4IwBV5od4kqfb02rN6DNLKparG6qkWu2Syta8g6R8a2Y7ynvSvEEKbYTAybwXxM6I=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a81:1e90:0:b0:489:e4c5:45ca with SMTP id
 e138-20020a811e90000000b00489e4c545camr5325726ywe.336.1674848474014; Fri, 27
 Jan 2023 11:41:14 -0800 (PST)
Date: Fri, 27 Jan 2023 11:40:37 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-1-surenb@google.com>
Subject: [PATCH v2 00/33] Per-VMA locks
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rp
 pt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Previous version:
v1: https://lore.kernel.org/all/20230109205336.3665937-1-surenb@google.com/
RFC: https://lore.kernel.org/all/20220901173516.702122-1-surenb@google.com/

LWN article describing the feature:
https://lwn.net/Articles/906852/

Per-vma locks idea that was discussed during SPF [1] discussion at LSF/MM
last year [2], which concluded with suggestion that =E2=80=9Ca reader/write=
r
semaphore could be put into the VMA itself; that would have the effect of
using the VMA as a sort of range lock. There would still be contention at
the VMA level, but it would be an improvement.=E2=80=9D This patchset imple=
ments
this suggested approach.

When handling page faults we lookup the VMA that contains the faulting
page under RCU protection and try to acquire its lock. If that fails we
fall back to using mmap_lock, similar to how SPF handled this situation.

One notable way the implementation deviates from the proposal is the way
VMAs are read-locked. During some of mm updates, multiple VMAs need to be
locked until the end of the update (e.g. vma_merge, split_vma, etc).
Tracking all the locked VMAs, avoiding recursive locks, figuring out when
it's safe to unlock previously locked VMAs would make the code more
complex. So, instead of the usual lock/unlock pattern, the proposed
solution marks a VMA as locked and provides an efficient way to:
1. Identify locked VMAs.
2. Unlock all locked VMAs in bulk.
We also postpone unlocking the locked VMAs until the end of the update,
when we do mmap_write_unlock. Potentially this keeps a VMA locked for
longer than is absolutely necessary but it results in a big reduction of
code complexity.
Read-locking a VMA is done using two sequence numbers - one in the
vm_area_struct and one in the mm_struct. VMA is considered read-locked
when these sequence numbers are equal. To read-lock a VMA we set the
sequence number in vm_area_struct to be equal to the sequence number in
mm_struct. To unlock all VMAs we increment mm_struct's seq number. This
allows for an efficient way to track locked VMAs and to drop the locks on
all VMAs at the end of the update.

The patchset implements per-VMA locking only for anonymous pages which
are not in swap and avoids userfaultfs as their implementation is more
complex. Additional support for file-back page faults, swapped and user
pages can be added incrementally.

Performance benchmarks show similar although slightly smaller benefits as
with SPF patchset (~75% of SPF benefits). Still, with lower complexity
this approach might be more desirable.

Since RFC was posted in September 2022, two separate Google teams outside
of Android evaluated the patchset and confirmed positive results. Here are
the known usecases when per-VMA locks show benefits:

Android:
Apps with high number of threads (~100) launch times improve by up to 20%.
Each thread mmaps several areas upon startup (Stack and Thread-local
storage (TLS), thread signal stack, indirect ref table), which requires
taking mmap_lock in write mode. Page faults take mmap_lock in read mode.
During app launch, both thread creation and page faults establishing the
active workinget are happening in parallel and that causes lock contention
between mm writers and readers even if updates and page faults are
happening in different VMAs. Per-vma locks prevent this contention by
providing more granular lock.

Google Fibers:
We have several dynamically sized thread pools that spawn new threads
under increased load and reduce their number when idling. For example,
Google's in-process scheduling/threading framework, UMCG/Fibers, is backed
by such a thread pool. When idling, only a small number of idle worker
threads are available; when a spike of incoming requests arrive, each
request is handled in its own "fiber", which is a work item posted onto a
UMCG worker thread; quite often these spikes lead to a number of new
threads spawning. Each new thread needs to allocate and register an RSEQ
section on its TLS, then register itself with the kernel as a UMCG worker
thread, and only after that it can be considered by the in-process
UMCG/Fiber scheduler as available to do useful work. In short, during an
incoming workload spike new threads have to be spawned, and they perform
several syscalls (RSEQ registration, UMCG worker registration, memory
allocations) before they can actually start doing useful work. Removing
any bottlenecks on this thread startup path will greatly improve our
services' latencies when faced with request/workload spikes.
At high scale, mmap_lock contention during thread creation and stack page
faults leads to user-visible multi-second serving latencies in a similar
pattern to Android app startup. Per-VMA locking patchset has been run
successfully in limited experiments with user-facing production workloads.
In these experiments, we observed that the peak thread creation rate was
high enough that thread creation is no longer a bottleneck.

TCP zerocopy receive:
From the point of view of TCP zerocopy receive, the per-vma lock patch is
massively beneficial.
In today's implementation, a process with N threads where N - 1 are
performing zerocopy receive and 1 thread is performing madvise() with the
write lock taken (e.g. needs to change vm_flags) will result in all N -1
receive threads blocking until the madvise is done. Conversely, on a busy
process receiving a lot of data, an madvise operation that does need to
take the mmap lock in write mode will need to wait for all of the receives
to be done - a lose:lose proposition. Per-VMA locking _removes_ by
definition this source of contention entirely.
There are other benefits for receive as well, chiefly a reduction in
cacheline bouncing across receiving threads for locking/unlocking the
single mmap lock. On an RPC style synthetic workload with 4KB RPCs:
1a) The find+lock+unlock VMA path in the base case, without the per-vma
lock patchset, is about 0.7% of cycles as measured by perf.
1b) mmap_read_lock + mmap_read_unlock in the base case is about 0.5%
cycles overall - most of this is within the TCP read hotpath (a small
fraction is 'other' usage in the system).
2a) The find+lock+unlock VMA path, with the per-vma patchset and a trivial
patch written to take advantage of it in TCP, is about 0.4% of cycles
(down from 0.7% above)
2b) mmap_read_lock + mmap_read_unlock in the per-vma patchset is < 0.1%
cycles and is out of the TCP read hotpath entirely (down from 0.5% before,
the remaining usage is the 'other' usage in the system).
So, in addition to entirely removing an onerous source of contention, it
also reduces the CPU cycles of TCP receive zerocopy by about 0.5%+
(compared to overall cycles in perf) for the 'small' RPC scenario.

The patchset structure is:
0001-0007: Enable maple-tree RCU mode
0008-0032: Main per-vma locks patchset
0032-0033: Performance optimizations

Changes since v1:
- Moved vm_flags modifiers into a separate patchset, per Davidlohr Bueso
- Dropped WRITE_ONCE in init_vm_flags, per Michal Hocko
- Made CONFIG_PER_VMA_LOCK non-configurable, per Davidlohr Bueso
- Moved free_anon_vma_name() into __vm_area_free(), per Michal Hocko
- Updated description of 0011 patch, per Michal Hocko [3]
- Removed WRITE_ONCE in mm_init(), per Michal Hocko
- Renamed vma locking primitives to vma_start_{read|write}, per Matthew Wil=
cox
- Added read RCU section in vma_end_read, per Jann Horn
- Updated description of 0013 patch, per Michal Hocko [4]
- Add comment about locking order in rmap.c, per Jann Horn
- Amend 0014 patch description, per Michal Hocko [5]
- Replace vma_assert_no_readers with VM_BUG_ON_VMA(rwsem_is_locked),
per Michal Hocko
- Add a separate loop for VMA locking in mm_take_all_locks, per Jann Horn
- Move userfaultfd_armed check after locking the VMA, per Jann Horn
- Replace call_rcu batching with direct freeing from exit_mmap,
per Liam R. Howlett
- Dropped the patch optimizing vma_lock size for now, per Michal Hocko

The patchset applies cleanly over mm-unstable branch.

[1] https://lore.kernel.org/all/20220128131006.67712-1-michel@lespinasse.or=
g/
[2] https://lwn.net/Articles/893906/
[3] https://lore.kernel.org/all/Y8a4+bV1dYNAiUkD@dhcp22.suse.cz/
[4] https://lore.kernel.org/all/Y8hls4MH353ZnlQu@dhcp22.suse.cz/
[5] https://lore.kernel.org/all/Y8e+efbJ4rw9goF0@dhcp22.suse.cz/

Laurent Dufour (1):
  powerc/mm: try VMA lock-based page fault handling first

Liam Howlett (4):
  maple_tree: Be more cautious about dead nodes
  maple_tree: Detect dead nodes in mas_start()
  maple_tree: Fix freeing of nodes in rcu mode
  maple_tree: remove extra smp_wmb() from mas_dead_leaves()

Liam R. Howlett (3):
  maple_tree: Fix write memory barrier of nodes once dead for RCU mode
  maple_tree: Add smp_rmb() to dead node detection
  mm: Enable maple tree RCU mode by default.

Michel Lespinasse (1):
  mm: rcu safe VMA freeing

Suren Baghdasaryan (24):
  mm: introduce CONFIG_PER_VMA_LOCK
  mm: move mmap_lock assert function definitions
  mm: add per-VMA lock and helper functions to control it
  mm: mark VMA as being written when changing vm_flags
  mm/mmap: move VMA locking before vma_adjust_trans_huge call
  mm/khugepaged: write-lock VMA while collapsing a huge page
  mm/mmap: write-lock VMAs before merging, splitting or expanding them
  mm/mmap: write-lock VMA before shrinking or expanding it
  mm/mremap: write-lock VMA while remapping it to a new address range
  mm: write-lock VMAs before removing them from VMA tree
  mm: conditionally write-lock VMA in free_pgtables
  mm/mmap: write-lock adjacent VMAs if they can grow into unmapped area
  kernel/fork: assert no VMA readers during its destruction
  mm/mmap: prevent pagefault handler from racing with mmu_notifier
    registration
  mm: introduce lock_vma_under_rcu to be used from arch-specific code
  mm: fall back to mmap_lock if vma->anon_vma is not yet set
  mm: add FAULT_FLAG_VMA_LOCK flag
  mm: prevent do_swap_page from handling page faults under VMA lock
  mm: prevent userfaults to be handled under per-vma lock
  mm: introduce per-VMA lock statistics
  x86/mm: try VMA lock-based page fault handling first
  arm64/mm: try VMA lock-based page fault handling first
  mm/mmap: free vm_area_struct without call_rcu in exit_mmap
  mm: separate vma->lock from vm_area_struct

 arch/arm64/Kconfig                     |   1 +
 arch/arm64/mm/fault.c                  |  36 ++++++
 arch/powerpc/mm/fault.c                |  41 +++++++
 arch/powerpc/platforms/powernv/Kconfig |   1 +
 arch/powerpc/platforms/pseries/Kconfig |   1 +
 arch/x86/Kconfig                       |   1 +
 arch/x86/mm/fault.c                    |  36 ++++++
 include/linux/mm.h                     |  95 +++++++++++++++-
 include/linux/mm_types.h               |  29 ++++-
 include/linux/mmap_lock.h              |  37 +++++--
 include/linux/vm_event_item.h          |   6 +
 include/linux/vmstat.h                 |   6 +
 kernel/fork.c                          |  99 ++++++++++++++---
 lib/maple_tree.c                       | 145 ++++++++++++++++++++-----
 mm/Kconfig                             |  12 ++
 mm/Kconfig.debug                       |   7 ++
 mm/init-mm.c                           |   3 +
 mm/internal.h                          |   2 +-
 mm/khugepaged.c                        |   5 +
 mm/memory.c                            |  75 ++++++++++++-
 mm/mmap.c                              |  70 +++++++++---
 mm/mremap.c                            |   1 +
 mm/nommu.c                             |   5 +
 mm/rmap.c                              |  31 +++---
 mm/vmstat.c                            |   6 +
 tools/testing/radix-tree/maple.c       |  16 +++
 26 files changed, 677 insertions(+), 90 deletions(-)

--=20
2.39.1

