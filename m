Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB936631F1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 21:55:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrR6R3MVGz3cfJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 07:55:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oLgh13dw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=31h68ywykdocbdanwkpxxpun.lxvurwdgyyl-mneurbcb.xiujkb.xap@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oLgh13dw;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR4T6PlJz2xml
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:53:43 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-4c1456d608cso104247277b3.15
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wwVj6Z8wF0g7IPD4ySJl0eB+CbG14o6gcX7xVxAqVVY=;
        b=oLgh13dwGIPyMIFmbkbVoRiknWihr/xSS0nM2REsAWutjkIBxiaMMWqG1kOMADijJa
         QbX+LsEhwyvCR2OhVsg3rp5mb8uwMA/UKPvuETakNQ2yqnfTnyp5c2fQlXT55KT+LRuM
         /YobsHpTzcfAC6g7afqZpBTd8kpoaZIqUqj9lNyVCBDKGB8PhhDC5c+tzRGryqOgC+XC
         wrITex0KYz2xhKaKOFOiXZHlf2dmDEpNQcFxNhMejnefCduIeIcpQBAhnqdLxEbO6fIJ
         VSLMwXUVx42S8T6EVWZ/ubQ8tgyCfk54na0l0jZ7/Iwmrn/pAY5eU6d5bSUXFx9ClGX3
         mB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwVj6Z8wF0g7IPD4ySJl0eB+CbG14o6gcX7xVxAqVVY=;
        b=FWCmwz4lS3J0bVqyqNFygjL4FZclZH/BjpYemEGh/wsiVS1P9P6zW+E+YTAx/CF/DI
         kNmOhkR9ddQ5gVmhcuffP2xp1x4XYySBmazopRC+z9aLZjwLXqqLeDPsPS7hFrhQ/ghH
         THtjCAIJZ6gYxYDzDnMqZkV/YA9Gwi8/gAYxfYnEXkn2UEZGKTSTBzf8XUr5Iq/hetwc
         tlyIfCOUhzXnbdJX4rAW7BSkcne0AmhWEnkMm1vjehtjXvEux76vNLp/sQ1Ir/RbOSC6
         1VcPr2jOQOK++vUPvxB3cNHEicMl5rLart14MMLhJadRafdImBfgZhLM5NkA/xArNpcK
         QWbQ==
X-Gm-Message-State: AFqh2koU5XoYKoupDAfTaez4HdTfQYc1HKwGeU5VaIa1TE6BSxgTldTw
	i+b5yVC5HIE820CoxMT2SuntONUh5Sc=
X-Google-Smtp-Source: AMrXdXvL6PLxQYvHu9KjVJgpWsrUD8krXmlA+GHMyKGSro+Ns7Q42d7PR3BPRJ0jdRcoqvlJXd8TQ25uQqo=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a81:72c6:0:b0:4bb:c96d:f685 with SMTP id
 n189-20020a8172c6000000b004bbc96df685mr2581240ywc.208.1673297620487; Mon, 09
 Jan 2023 12:53:40 -0800 (PST)
Date: Mon,  9 Jan 2023 12:52:55 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-1-surenb@google.com>
Subject: [PATCH 00/41] Per-VMA locks
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingu
 larity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is the v1 of per-VMA locks patchset originally posted as an RFC at
[1] and described in LWN article at [2]. Per-vma locks idea that was
discussed during SPF [3] discussion at LSF/MM this year [4], which
concluded with suggestion that =E2=80=9Ca reader/writer semaphore could be =
put
into the VMA itself; that would have the effect of using the VMA as a
sort of range lock. There would still be contention at the VMA level, but
it would be an improvement.=E2=80=9D This patchset implements this suggeste=
d
approach.

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
0008-0038: Main per-vma locks patchset
0039-0040: Performance optimizations
0041: Memory overhead optimization

Branch for testing is posted at:
https://github.com/surenbaghdasaryan/linux/tree/per_vma_lock

The patchset applies cleanly over Linus' tree at:
commit b7bfaa761d76 ("Linux 6.2-rc3")

[1] https://lore.kernel.org/all/20220901173516.702122-1-surenb@google.com/
[2] https://lwn.net/Articles/906852/
[3] https://lore.kernel.org/all/20220128131006.67712-1-michel@lespinasse.or=
g/
[4] https://lwn.net/Articles/893906/

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

Suren Baghdasaryan (32):
  mm: introduce CONFIG_PER_VMA_LOCK
  mm: move mmap_lock assert function definitions
  mm: export dump_mm()
  mm: add per-VMA lock and helper functions to control it
  mm: introduce vma->vm_flags modifier functions
  mm: replace VM_LOCKED_CLEAR_MASK with VM_LOCKED_MASK
  mm: replace vma->vm_flags direct modifications with modifier calls
  mm: replace vma->vm_flags indirect modification in ksm_madvise
  mm/mmap: move VMA locking before anon_vma_lock_write call
  mm/khugepaged: write-lock VMA while collapsing a huge page
  mm/mmap: write-lock VMAs before merging, splitting or expanding them
  mm/mmap: write-lock VMAs in vma_adjust
  mm/mmap: write-lock VMAs affected by VMA expansion
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
  mm: introduce mod_vm_flags_nolock
  mm: avoid assertion in untrack_pfn
  kernel/fork: throttle call_rcu() calls in vm_area_free
  mm: separate vma->lock from vm_area_struct
  mm: replace rw_semaphore with atomic_t in vma_lock

 arch/arm/kernel/process.c                     |   2 +-
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/mm/fault.c                         |  36 ++++
 arch/ia64/mm/init.c                           |   8 +-
 arch/loongarch/include/asm/tlb.h              |   2 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c            |   5 +-
 arch/powerpc/kvm/book3s_xive_native.c         |   2 +-
 arch/powerpc/mm/book3s64/subpage_prot.c       |   2 +-
 arch/powerpc/mm/fault.c                       |  41 +++++
 arch/powerpc/platforms/book3s/vas-api.c       |   2 +-
 arch/powerpc/platforms/cell/spufs/file.c      |  14 +-
 arch/powerpc/platforms/powernv/Kconfig        |   1 +
 arch/powerpc/platforms/pseries/Kconfig        |   1 +
 arch/s390/mm/gmap.c                           |   8 +-
 arch/x86/Kconfig                              |   1 +
 arch/x86/entry/vsyscall/vsyscall_64.c         |   2 +-
 arch/x86/kernel/cpu/sgx/driver.c              |   2 +-
 arch/x86/kernel/cpu/sgx/virt.c                |   2 +-
 arch/x86/mm/fault.c                           |  36 ++++
 arch/x86/mm/pat/memtype.c                     |  14 +-
 arch/x86/um/mem_32.c                          |   2 +-
 drivers/acpi/pfr_telemetry.c                  |   2 +-
 drivers/android/binder.c                      |   3 +-
 drivers/char/mspec.c                          |   2 +-
 drivers/crypto/hisilicon/qm.c                 |   2 +-
 drivers/dax/device.c                          |   2 +-
 drivers/dma/idxd/cdev.c                       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c     |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c       |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |   4 +-
 drivers/gpu/drm/drm_gem.c                     |   2 +-
 drivers/gpu/drm/drm_gem_dma_helper.c          |   3 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |   2 +-
 drivers/gpu/drm/drm_vm.c                      |   8 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c       |   4 +-
 drivers/gpu/drm/gma500/framebuffer.c          |   2 +-
 drivers/gpu/drm/i810/i810_dma.c               |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        |   2 +-
 drivers/gpu/drm/msm/msm_gem.c                 |   2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c            |   3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |   3 +-
 drivers/gpu/drm/tegra/gem.c                   |   5 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c               |   3 +-
 drivers/gpu/drm/virtio/virtgpu_vram.c         |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c      |   2 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c       |   3 +-
 drivers/hsi/clients/cmt_speech.c              |   2 +-
 drivers/hwtracing/intel_th/msu.c              |   2 +-
 drivers/hwtracing/stm/core.c                  |   2 +-
 drivers/infiniband/hw/hfi1/file_ops.c         |   4 +-
 drivers/infiniband/hw/mlx5/main.c             |   4 +-
 drivers/infiniband/hw/qib/qib_file_ops.c      |  13 +-
 drivers/infiniband/hw/usnic/usnic_ib_verbs.c  |   2 +-
 .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.c   |   2 +-
 .../common/videobuf2/videobuf2-dma-contig.c   |   2 +-
 .../common/videobuf2/videobuf2-vmalloc.c      |   2 +-
 drivers/media/v4l2-core/videobuf-dma-contig.c |   2 +-
 drivers/media/v4l2-core/videobuf-dma-sg.c     |   4 +-
 drivers/media/v4l2-core/videobuf-vmalloc.c    |   2 +-
 drivers/misc/cxl/context.c                    |   2 +-
 drivers/misc/habanalabs/common/memory.c       |   2 +-
 drivers/misc/habanalabs/gaudi/gaudi.c         |   4 +-
 drivers/misc/habanalabs/gaudi2/gaudi2.c       |   8 +-
 drivers/misc/habanalabs/goya/goya.c           |   4 +-
 drivers/misc/ocxl/context.c                   |   4 +-
 drivers/misc/ocxl/sysfs.c                     |   2 +-
 drivers/misc/open-dice.c                      |   6 +-
 drivers/misc/sgi-gru/grufile.c                |   4 +-
 drivers/misc/uacce/uacce.c                    |   2 +-
 drivers/sbus/char/oradax.c                    |   2 +-
 drivers/scsi/cxlflash/ocxl_hw.c               |   2 +-
 drivers/scsi/sg.c                             |   2 +-
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    |   2 +-
 drivers/staging/media/deprecated/meye/meye.c  |   4 +-
 .../media/deprecated/stkwebcam/stk-webcam.c   |   2 +-
 drivers/target/target_core_user.c             |   2 +-
 drivers/uio/uio.c                             |   2 +-
 drivers/usb/core/devio.c                      |   3 +-
 drivers/usb/mon/mon_bin.c                     |   3 +-
 drivers/vdpa/vdpa_user/iova_domain.c          |   2 +-
 drivers/vfio/pci/vfio_pci_core.c              |   2 +-
 drivers/vhost/vdpa.c                          |   2 +-
 drivers/video/fbdev/68328fb.c                 |   2 +-
 drivers/video/fbdev/core/fb_defio.c           |   4 +-
 drivers/xen/gntalloc.c                        |   2 +-
 drivers/xen/gntdev.c                          |   4 +-
 drivers/xen/privcmd-buf.c                     |   2 +-
 drivers/xen/privcmd.c                         |   4 +-
 fs/aio.c                                      |   2 +-
 fs/cramfs/inode.c                             |   2 +-
 fs/erofs/data.c                               |   2 +-
 fs/exec.c                                     |   4 +-
 fs/ext4/file.c                                |   2 +-
 fs/fuse/dax.c                                 |   2 +-
 fs/hugetlbfs/inode.c                          |   4 +-
 fs/orangefs/file.c                            |   3 +-
 fs/proc/task_mmu.c                            |   2 +-
 fs/proc/vmcore.c                              |   3 +-
 fs/userfaultfd.c                              |  12 +-
 fs/xfs/xfs_file.c                             |   2 +-
 include/linux/mm.h                            | 159 +++++++++++++++++-
 include/linux/mm_types.h                      |  62 ++++++-
 include/linux/mmap_lock.h                     |  37 ++--
 include/linux/pgtable.h                       |   5 +-
 include/linux/vm_event_item.h                 |   6 +
 include/linux/vmstat.h                        |   6 +
 kernel/bpf/ringbuf.c                          |   4 +-
 kernel/bpf/syscall.c                          |   4 +-
 kernel/events/core.c                          |   2 +-
 kernel/fork.c                                 | 148 +++++++++++++---
 kernel/kcov.c                                 |   2 +-
 kernel/relay.c                                |   2 +-
 lib/maple_tree.c                              | 146 +++++++++++++---
 mm/Kconfig                                    |  13 ++
 mm/Kconfig.debug                              |   8 +
 mm/debug.c                                    |   1 +
 mm/hugetlb.c                                  |   4 +-
 mm/init-mm.c                                  |   8 +
 mm/internal.h                                 |   2 +-
 mm/khugepaged.c                               |   7 +
 mm/ksm.c                                      |   2 +
 mm/madvise.c                                  |   2 +-
 mm/memory.c                                   |  94 +++++++++--
 mm/memremap.c                                 |   4 +-
 mm/mlock.c                                    |  12 +-
 mm/mmap.c                                     |  99 ++++++++---
 mm/mprotect.c                                 |   2 +-
 mm/mremap.c                                   |   9 +-
 mm/nommu.c                                    |  16 +-
 mm/secretmem.c                                |   2 +-
 mm/shmem.c                                    |   2 +-
 mm/vmalloc.c                                  |   2 +-
 mm/vmstat.c                                   |   6 +
 net/ipv4/tcp.c                                |   4 +-
 security/selinux/selinuxfs.c                  |   6 +-
 sound/core/oss/pcm_oss.c                      |   2 +-
 sound/core/pcm_native.c                       |   9 +-
 sound/soc/pxa/mmp-sspa.c                      |   2 +-
 sound/usb/usx2y/us122l.c                      |   4 +-
 sound/usb/usx2y/usX2Yhwdep.c                  |   2 +-
 sound/usb/usx2y/usx2yhwdeppcm.c               |   2 +-
 tools/testing/radix-tree/maple.c              |  16 ++
 146 files changed, 1047 insertions(+), 316 deletions(-)

--=20
2.39.0

