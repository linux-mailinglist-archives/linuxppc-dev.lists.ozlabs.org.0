Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9757A5A569E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:02:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGktj0DL0z3cFW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:02:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gjUmOZLV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3zy4nywykdiawyvirfksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gjUmOZLV;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk4k5dJWz3bkQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:25:40 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id p18-20020a170902a41200b00172b0dc71e0so6786919plq.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc;
        bh=pDTzUH9ZmkMZg3cmno897HgIwaaxstGwmWtClqeSQMY=;
        b=gjUmOZLV9bcbLonNS4lb3WBoz84QjOA/D7CmogvUP5ud9+InysL8Oh9E7DKJdwkXA1
         t51SYWvWY7me7fS7UP+Cv2Nf/JhijDPumYxXmtSNDCmzKiJTL6HeIT2vpSjyKp+dKUA+
         i/6AfO9yhnI27e6m85YLYK5uydUZDc69Ws3yGDc+9jVDOLuag8kYSvlT6GKmBabHISlj
         Agpyx6xSKbJ2VmCCsK/dQfHtKexX+gaWqNmpXiQWr3NzSlhT0v1YMSw9eFOFs2Oau/MZ
         ybOwhTMeJ9rLhGpwSsJLA1PyAZvwxA2dIcGal5knPsRHjNnfif7k984xL88bpesVgDea
         AYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc;
        bh=pDTzUH9ZmkMZg3cmno897HgIwaaxstGwmWtClqeSQMY=;
        b=y8/GM5DxhaDeEeNvuAHor/GCapmo88WQ62kbctlUTH7i0DAazA1SNU8ispxxKQDDoy
         eKVi40nMALPzd/lr2ipQUFsn74YVFzs51yPLTkY4I2wwOMfU0VEJndzm+0ijJys9yZsl
         NenduV95QxMzO/S3aDuUk6o6+mqfZ9BMzQ1HiDT/ryo8gmW93jz+XSQpzMIaBRKoIJP4
         MKIG4wXki6ppdWSiyCQip9IGJ4JYoUYnEEMplZ8RiUADT8Zo7pY6A5u5Xbfrc/WXefVO
         skiF9b6SETRI2kcndw+79jDbAQ++NTEJt8MrYU6gFxFUpK2cEmiBq8bBQWDKoa+2c63K
         KuaQ==
X-Gm-Message-State: ACgBeo0HshSJP7SpO6tDzA505mS9Xkq//5u2b/AOXwAuKWV+BXj9vYAT
	aY8J81dy7QfG2ccaWdcGDNfRBDz9I6A=
X-Google-Smtp-Source: AA6agR6UQmZ/vaRok0dLo0fY9ZItUpZFj7DUiATdYYW4UNrGosZUH5TdrbUN0W11FQtWqAaY7kD6g0jugM8=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a05:6a00:1a47:b0:52e:6a8c:5430 with SMTP id
 h7-20020a056a001a4700b0052e6a8c5430mr18212460pfv.48.1661808335904; Mon, 29
 Aug 2022 14:25:35 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:03 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-1-surenb@google.com>
Subject: [RFC PATCH 00/28] per-VMA locks proposal
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 30 Aug 2022 08:01:45 +1000
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, riel@surriel.com, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
2.37.2.672.g94769d06f0-goog

