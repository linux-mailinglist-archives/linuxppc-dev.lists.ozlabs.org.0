Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 233005A9E1D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:35:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJSrD0nl1z2xfS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:35:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UJ2NJSig;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3wo0qywykdjuhjg3c05dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UJ2NJSig;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSqd3fv2z2xZV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:35:24 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-335ff2ef600so235527497b3.18
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date;
        bh=kDz45+x8leBVOf7Bdp0WiDEao4W3YXxkJImYKeLiow8=;
        b=UJ2NJSigmjvs38+mtpjC0YPaCWUde6cB0UL/bLufaGhMosguVjiiFe1oszFm36/Odc
         sUfw69wiCGaI3T90u9gbLBluz/hph0cewPRzHoAQw666Ao4RCcUg+CRGBoTlLAh+P8fw
         d6pa6e1ROBBUZrnr2K/YAABtJnqT1xqAFjYdpdHHFOI0Qj4R7XA51PC6fSlMGidZfaTe
         auU6PBRWiLtEO8ZKkl2afbBFNVW7/F0No/gyQzvcoDCPswV1JpNDwaFi4dzPo2uGVvT+
         KyAW7FzT4zbe/qv1aeGuBipeT7ieMPk/X1LylsgIncU0zCOpr2t23+stO/KnyWKxRNvu
         oj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date;
        bh=kDz45+x8leBVOf7Bdp0WiDEao4W3YXxkJImYKeLiow8=;
        b=yB3+TlxxUwgZ97ieSRM8ftR7U1YbYSg9gZ91WR06a22Vogj9KjUqDnMyM3ryaHtxZC
         Urtyi+QLaEgVNr82XoLJ3aks3SijkEZTrv/XFdabrt2yMvJ62UKenlq934AwpxlkxCd/
         u6GkHehvwM8DQowbuRL8/5GrKJHz+l01wzodk4zDM0qEZAvnqNIMhAXNpGhe4aF039DJ
         AJ9UC/WwsFXqaNbA4v8HacEk56tKi2qACai0LNrOGB+9aRXMAHxToaUTSSMHOv9v/HBC
         Qkr/gwwK+BqEEHz8gF4Q9zDksZ5r3sNkBulr61m43Rn3N8anKUz2WN5i+kys98btsI3h
         0mTQ==
X-Gm-Message-State: ACgBeo2CwnA/mD+q9yQpAr2g+aYQh7Kvma/Sgh1b4IP/VtwGgrU6GrUz
	j75gK4G2UI3IZ59dGxsT4vLFNmq0a8k=
X-Google-Smtp-Source: AA6agR7afRN1POoQY9p1igScMyaFRYqs4/PVRqG8JF8uqVSGzSSN48hhlfxus/tnBm8aq/2o/zV00jvOX/w=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a81:9e53:0:b0:340:8556:472d with SMTP id
 n19-20020a819e53000000b003408556472dmr23620124ywj.197.1662053720792; Thu, 01
 Sep 2022 10:35:20 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:34:48 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-1-surenb@google.com>
Subject: [RFC PATCH RESEND 00/28] per-VMA locks proposal
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Resending to fix the issue with the In-Reply-To tag in the original
submission at [4].

This is a proof of concept for per-vma locks idea that was discussed
during SPF [1] discussion at LSF/MM this year [2], which concluded with
suggestion that =E2=80=9Ca reader/writer semaphore could be put into the VM=
A
itself; that would have the effect of using the VMA as a sort of range
lock. There would still be contention at the VMA level, but it would be an
improvement.=E2=80=9D This patchset implements this suggested approach.

When handling page faults we lookup the VMA that contains the faulting
page under RCU protection and try to acquire its lock. If that fails we
fall back to using mmap_lock, similar to how SPF handled this situation.

One notable way the implementation deviates from the proposal is the way
VMAs are marked as locked. Because during some of mm updates multiple
VMAs need to be locked until the end of the update (e.g. vma_merge,
split_vma, etc). Tracking all the locked VMAs, avoiding recursive locks
and other complications would make the code more complex. Therefore we
provide a way to "mark" VMAs as locked and then unmark all locked VMAs
all at once. This is done using two sequence numbers - one in the
vm_area_struct and one in the mm_struct. VMA is considered locked when
these sequence numbers are equal. To mark a VMA as locked we set the
sequence number in vm_area_struct to be equal to the sequence number
in mm_struct. To unlock all VMAs we increment mm_struct's seq number.
This allows for an efficient way to track locked VMAs and to drop the
locks on all VMAs at the end of the update.

The patchset implements per-VMA locking only for anonymous pages which
are not in swap. If the initial proposal is considered acceptable, then
support for swapped and file-backed page faults will be added.

Performance benchmarks show similar although slightly smaller benefits as
with SPF patchset (~75% of SPF benefits). Still, with lower complexity
this approach might be more desirable.

The patchset applies cleanly over 6.0-rc3
The tree for testing is posted at [3]

[1] https://lore.kernel.org/all/20220128131006.67712-1-michel@lespinasse.or=
g/
[2] https://lwn.net/Articles/893906/
[3] https://github.com/surenbaghdasaryan/linux/tree/per_vma_lock_rfc
[4] https://lore.kernel.org/all/20220829212531.3184856-1-surenb@google.com/

Laurent Dufour (2):
  powerc/mm: try VMA lock-based page fault handling first
  powerpc/mm: define ARCH_SUPPORTS_PER_VMA_LOCK

Michel Lespinasse (1):
  mm: rcu safe VMA freeing

Suren Baghdasaryan (25):
  mm: introduce CONFIG_PER_VMA_LOCK
  mm: introduce __find_vma to be used without mmap_lock protection
  mm: move mmap_lock assert function definitions
  mm: add per-VMA lock and helper functions to control it
  mm: mark VMA as locked whenever vma->vm_flags are modified
  kernel/fork: mark VMAs as locked before copying pages during fork
  mm/khugepaged: mark VMA as locked while collapsing a hugepage
  mm/mempolicy: mark VMA as locked when changing protection policy
  mm/mmap: mark VMAs as locked in vma_adjust
  mm/mmap: mark VMAs as locked before merging or splitting them
  mm/mremap: mark VMA as locked while remapping it to a new address
    range
  mm: conditionally mark VMA as locked in free_pgtables and
    unmap_page_range
  mm: mark VMAs as locked before isolating them
  mm/mmap: mark adjacent VMAs as locked if they can grow into unmapped
    area
  kernel/fork: assert no VMA readers during its destruction
  mm/mmap: prevent pagefault handler from racing with mmu_notifier
    registration
  mm: add FAULT_FLAG_VMA_LOCK flag
  mm: disallow do_swap_page to handle page faults under VMA lock
  mm: introduce per-VMA lock statistics
  mm: introduce find_and_lock_anon_vma to be used from arch-specific
    code
  x86/mm: try VMA lock-based page fault handling first
  x86/mm: define ARCH_SUPPORTS_PER_VMA_LOCK
  arm64/mm: try VMA lock-based page fault handling first
  arm64/mm: define ARCH_SUPPORTS_PER_VMA_LOCK
  kernel/fork: throttle call_rcu() calls in vm_area_free

 arch/arm64/Kconfig                     |   1 +
 arch/arm64/mm/fault.c                  |  36 +++++++++
 arch/powerpc/mm/fault.c                |  41 ++++++++++
 arch/powerpc/platforms/powernv/Kconfig |   1 +
 arch/powerpc/platforms/pseries/Kconfig |   1 +
 arch/x86/Kconfig                       |   1 +
 arch/x86/mm/fault.c                    |  36 +++++++++
 drivers/gpu/drm/i915/i915_gpu_error.c  |   4 +-
 fs/proc/task_mmu.c                     |   1 +
 fs/userfaultfd.c                       |   6 ++
 include/linux/mm.h                     | 104 ++++++++++++++++++++++++-
 include/linux/mm_types.h               |  33 ++++++--
 include/linux/mmap_lock.h              |  37 ++++++---
 include/linux/vm_event_item.h          |   6 ++
 include/linux/vmstat.h                 |   6 ++
 kernel/fork.c                          |  75 +++++++++++++++++-
 mm/Kconfig                             |  13 ++++
 mm/Kconfig.debug                       |   8 ++
 mm/init-mm.c                           |   6 ++
 mm/internal.h                          |   4 +-
 mm/khugepaged.c                        |   1 +
 mm/madvise.c                           |   1 +
 mm/memory.c                            |  82 ++++++++++++++++---
 mm/mempolicy.c                         |   6 +-
 mm/mlock.c                             |   2 +
 mm/mmap.c                              |  60 ++++++++++----
 mm/mprotect.c                          |   1 +
 mm/mremap.c                            |   1 +
 mm/nommu.c                             |   2 +
 mm/oom_kill.c                          |   3 +-
 mm/vmstat.c                            |   6 ++
 31 files changed, 531 insertions(+), 54 deletions(-)

--=20
2.37.2.789.g6183377224-goog

