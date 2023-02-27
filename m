Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F816A482E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:37:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSPN2tCqz3cFY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:37:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YXDHIMQX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3jer8ywykdbqceby7v08805y.w86527eh99w-xyf52cdc.8j5uvc.8b0@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YXDHIMQX;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSNT5Fr1z2xnK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:36:40 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-536c8bcae3bso154348777b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ysbcOzgrNbrBc54CJzK+4Ejhc4D19XVWo1zi5sfKVg=;
        b=YXDHIMQXQNCWXLhfNzzoX/o2tLllbrpHPLgDcNcqH8+C6OU1Jjgpl/TZeOJAeBv2Ek
         6G2Lb+/p3HQVi/QJl2s9jAfGUcFtqpUlJm17sg8OvardcyanOWbCf+eiVnF3gWyLh6Yv
         365vlMblzvVAf/FYil7Oc8S8nTLnslm3JlEZf0E2ojvoNar1NisYIJ8QOEt3KQ5eFT14
         Z0nkoifnHNSPAqGSx3LQKr/KXHdyZw1JJ4IcCYqJl6dS7dfIY2carAAAYo52ZSwgOygW
         qXP+TDjYtnS9rOpj/BRmJybu+FqrXluZOL4BHNMBqfbnY7vUAqCmQGS2ovuG2LUgAWN9
         eslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ysbcOzgrNbrBc54CJzK+4Ejhc4D19XVWo1zi5sfKVg=;
        b=MphU3gQwaJW7RoifK+5SHxqvJkqpQVBAUmDSsotyZNEVoe4TOfBVZDe0YfZH2RsdUR
         /sJ8tt40+mDhdjd47I2HrfltETT5DpSbUdw3ChyjJoDaOh4pbrUr/2zmhGcSSedkdzyY
         T9773eVeJhmBgsv6Cz6rxAII9m0bKVXrWZrgMPPilBuZThR6+pUfS6/pMdw+d4QPnpLP
         H8ZX2TMs6LJO6KyFiZz7do0L3ZAgSm1ezOcJt88CYTz9Fv9eI6WAUA3jE/bAJvBH0tyu
         dd4ZsD9Wvc2fHhAsa/Xzqer200Tq43WJMDdNLnX+n3c8+BAaHH5+T9GF11E2wUYO/ath
         tplA==
X-Gm-Message-State: AO0yUKUgdPphJpVAbLoR1ybzPPUmJrcaDVqJ0q55QoL1mTeLMnYIG2N3
	osyn5DQU5DOcOWiCww3dPhQMfu5NjO8=
X-Google-Smtp-Source: AK7set/v3Etc1GK4E97njxZlqmAFdnWBLmS3T1Su3dyjBYy0MoMHIhvXgpoPXjG5cohT+kLBVulq1l4CHVc=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a05:6902:128c:b0:8da:3163:224 with SMTP id
 i12-20020a056902128c00b008da31630224mr8090269ybu.0.1677519397641; Mon, 27 Feb
 2023 09:36:37 -0800 (PST)
Date: Mon, 27 Feb 2023 09:35:59 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-1-surenb@google.com>
Subject: [PATCH v4 00/33] Per-VMA locks
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org,
  hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Previous versions:
v3: https://lore.kernel.org/all/20230216051750.3125598-1-surenb@google.com/
v2: https://lore.kernel.org/lkml/20230127194110.533103-1-surenb@google.com/
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
0001-0008: Enable maple-tree RCU mode
0009-0031: Main per-vma locks patchset
0032-0033: Performance optimizations

Changes since v3:
- Changed patch [3] to move vma_prepare before vma_adjust_trans_huge
- Dropped patch [4] from the set as unnecessary, per Hyeonggon Yoo
- Changed patch [5] to do VMA locking inside vma_prepare, per Liam Howlett
- Dropped patch [6] from the set as unnecessary, per Liam Howlett

[1] https://lore.kernel.org/all/20220128131006.67712-1-michel@lespinasse.or=
g/
[2] https://lwn.net/Articles/893906/
[3] https://lore.kernel.org/all/20230216051750.3125598-15-surenb@google.com=
/
[4] https://lore.kernel.org/all/20230216051750.3125598-17-surenb@google.com=
/
[5] https://lore.kernel.org/all/20230216051750.3125598-18-surenb@google.com=
/
[6] https://lore.kernel.org/all/20230216051750.3125598-22-surenb@google.com=
/

The patchset applies cleanly over mm-unstable branch.

Laurent Dufour (1):
  powerc/mm: try VMA lock-based page fault handling first

Liam Howlett (4):
  maple_tree: Be more cautious about dead nodes
  maple_tree: Detect dead nodes in mas_start()
  maple_tree: Fix freeing of nodes in rcu mode
  maple_tree: remove extra smp_wmb() from mas_dead_leaves()

Liam R. Howlett (4):
  maple_tree: Fix write memory barrier of nodes once dead for RCU mode
  maple_tree: Add smp_rmb() to dead node detection
  maple_tree: Add RCU lock checking to rcu callback functions
  mm: Enable maple tree RCU mode by default.

Michel Lespinasse (1):
  mm: rcu safe VMA freeing

Suren Baghdasaryan (23):
  mm: introduce CONFIG_PER_VMA_LOCK
  mm: move mmap_lock assert function definitions
  mm: add per-VMA lock and helper functions to control it
  mm: mark VMA as being written when changing vm_flags
  mm/mmap: move vma_prepare before vma_adjust_trans_huge
  mm/khugepaged: write-lock VMA while collapsing a huge page
  mm/mmap: write-lock VMAs in vma_prepare before modifying them
  mm/mremap: write-lock VMA while remapping it to a new address range
  mm: write-lock VMAs before removing them from VMA tree
  mm: conditionally write-lock VMA in free_pgtables
  kernel/fork: assert no VMA readers during its destruction
  mm/mmap: prevent pagefault handler from racing with mmu_notifier
    registration
  mm: introduce vma detached flag
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
 arch/arm64/mm/fault.c                  |  36 ++++
 arch/powerpc/mm/fault.c                |  41 ++++
 arch/powerpc/platforms/powernv/Kconfig |   1 +
 arch/powerpc/platforms/pseries/Kconfig |   1 +
 arch/x86/Kconfig                       |   1 +
 arch/x86/mm/fault.c                    |  36 ++++
 include/linux/mm.h                     | 108 +++++++++-
 include/linux/mm_types.h               |  32 ++-
 include/linux/mmap_lock.h              |  37 ++--
 include/linux/vm_event_item.h          |   6 +
 include/linux/vmstat.h                 |   6 +
 kernel/fork.c                          |  99 +++++++--
 lib/maple_tree.c                       | 269 +++++++++++++++++--------
 mm/Kconfig                             |  12 ++
 mm/Kconfig.debug                       |   6 +
 mm/init-mm.c                           |   3 +
 mm/internal.h                          |   2 +-
 mm/khugepaged.c                        |   5 +
 mm/memory.c                            |  72 ++++++-
 mm/mmap.c                              |  53 +++--
 mm/mremap.c                            |   1 +
 mm/nommu.c                             |   5 +
 mm/rmap.c                              |  31 +--
 mm/vmstat.c                            |   6 +
 tools/testing/radix-tree/maple.c       |  16 ++
 26 files changed, 737 insertions(+), 149 deletions(-)

--=20
2.39.2.722.g9855ee24e9-goog

