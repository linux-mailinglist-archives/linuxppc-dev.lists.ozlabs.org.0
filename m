Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1493A67D579
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 20:39:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2rdF6qhMz3fDk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 06:39:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sAI3PaCI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3lnbsywykdlejlivesxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sAI3PaCI;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2rbH2MMMz3fDT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 06:38:01 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id b201-20020a2534d2000000b0080b87d910a2so2955456yba.21
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 11:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=phHZehQlPfWiz/SCqB6D1h1zjdz8NfMq5LeGu27bEvE=;
        b=sAI3PaCI0OUTCw3+G/ENMwMXBu+0JMz5nY32BJWVy5FKAbNNJy+GgrkBpa51OASAI+
         hG7AUBHszGhWKNDJK8lN0YysXcGQBAA57BVJvypr7jHcb4003RKRPXpxPxVUP7KlCFZ9
         PJUtXMhcdfNLlX0cvXy9QqJG82pjajRp67z9ea2DIOi+nbFZ15F5lxfeksMBcCF5V19z
         24BhRFQsVIWOznHK3iTFkeDr1XuFnMQ9go4xzM3hj7VNWp32hsacGT90xuaqKolom3La
         /NVnvdQ5qEZUSofWJn1rj6AB1JhrFDJjNA4fLKYaO/zIg1BAjVjsTMj/CiNjwb0goIui
         q2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=phHZehQlPfWiz/SCqB6D1h1zjdz8NfMq5LeGu27bEvE=;
        b=vCzGqx99eGDEvyiTqB5cCy6igS3ERI8GrUC7dMmAsRYJrEwCABbvEV9qsfORHLhTDD
         8D+44nuLqSWYapuWYZ7JnEivK/4eVe/QOWYA005/6Atoxcyb/1qqyjF28mWRtLBX7Ay4
         PVQVa9hckSaaE4nWzPyizNPdCpEM+T2blTG796r+svEniNZAfdleAP8uZ0Qds/vSt8Ux
         68eaz55DFdwV8Bi85E3Yf++q/xU6GWWetxgPaYud9CEPsyRardYLcLeS4tx/QR85fhFd
         ZVXl/U1BMXYWxHbr31W+kKKD+T51VuHu3XMafxkszzKZaqWCd3KM5y7tRlbBlKVZ9O7o
         sjPQ==
X-Gm-Message-State: AO0yUKWGI0tH9NPvoogt4UBAIQCQsG5XxBlpxAuRNB/+NWawXnzpButQ
	mz63u/oY1bCmdYWejSlrj9h9klU+3J0=
X-Google-Smtp-Source: AK7set+KL/YFp3NF4pvldDE31DXRDExB/qqIxmCm21ckLcKXHvndueNAPPnb0OtRCT++59brN5tSAdYMshI=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:d774:88af:bab3:648d])
 (user=surenb job=sendgmr) by 2002:a81:16cc:0:b0:506:3cd3:7e42 with SMTP id
 195-20020a8116cc000000b005063cd37e42mr1740930yww.454.1674761876848; Thu, 26
 Jan 2023 11:37:56 -0800 (PST)
Date: Thu, 26 Jan 2023 11:37:45 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230126193752.297968-1-surenb@google.com>
Subject: [PATCH v4 0/7] introduce vm_flags modifier functions
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
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

This patchset was originally published as a part of per-VMA locking [1] and
was split after suggestion that it's viable on its own and to facilitate
the review process. It is now a preprequisite for the next version of per-VMA
lock patchset, which reuses vm_flags modifier functions to lock the VMA when
vm_flags are being updated.

VMA vm_flags modifications are usually done under exclusive mmap_lock
protection because this attrubute affects other decisions like VMA merging
or splitting and races should be prevented. Introduce vm_flags modifier
functions to enforce correct locking.

The patchset applies cleanly over mm-unstable branch of mm tree.

Changes since v3 [2]
- Fixed build breakage in nommu.c introduced in previous version,
per Andrew Morton
- Added back data_race() hint in vm_area_dup, per Mel Gorman
- Renamed vm_flags modifiers, per Andrew Morton, Mike Rapoport and Mel Gorman
- Changed vm_flags_mod to reset vm_flags with one assignment, per Mel Gorman
- Added comments about the need to copy vm_flags before ksm_madvise,
per Mel Gorman
- Added clarifications for __vm_flags_mod usage, per Mel Gorman

[1] https://lore.kernel.org/all/20230109205336.3665937-1-surenb@google.com/
[2] https://lore.kernel.org/lkml/20230125233554.153109-1-surenb@google.com/

Suren Baghdasaryan (7):
  kernel/fork: convert vma assignment to a memcpy
  mm: introduce vma->vm_flags wrapper functions
  mm: replace VM_LOCKED_CLEAR_MASK with VM_LOCKED_MASK
  mm: replace vma->vm_flags direct modifications with modifier calls
  mm: replace vma->vm_flags indirect modification in ksm_madvise
  mm: introduce __vm_flags_mod and use it in untrack_pfn
  mm: export dump_mm()

 arch/arm/kernel/process.c                     |  2 +-
 arch/ia64/mm/init.c                           |  8 +--
 arch/loongarch/include/asm/tlb.h              |  2 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c            |  6 +-
 arch/powerpc/kvm/book3s_xive_native.c         |  2 +-
 arch/powerpc/mm/book3s64/subpage_prot.c       |  2 +-
 arch/powerpc/platforms/book3s/vas-api.c       |  2 +-
 arch/powerpc/platforms/cell/spufs/file.c      | 14 ++---
 arch/s390/mm/gmap.c                           |  9 ++-
 arch/x86/entry/vsyscall/vsyscall_64.c         |  2 +-
 arch/x86/kernel/cpu/sgx/driver.c              |  2 +-
 arch/x86/kernel/cpu/sgx/virt.c                |  2 +-
 arch/x86/mm/pat/memtype.c                     | 14 +++--
 arch/x86/um/mem_32.c                          |  2 +-
 drivers/acpi/pfr_telemetry.c                  |  2 +-
 drivers/android/binder.c                      |  3 +-
 drivers/char/mspec.c                          |  2 +-
 drivers/crypto/hisilicon/qm.c                 |  2 +-
 drivers/dax/device.c                          |  2 +-
 drivers/dma/idxd/cdev.c                       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c     |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c       |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  4 +-
 drivers/gpu/drm/drm_gem.c                     |  2 +-
 drivers/gpu/drm/drm_gem_dma_helper.c          |  3 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |  2 +-
 drivers/gpu/drm/drm_vm.c                      |  8 +--
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c       |  4 +-
 drivers/gpu/drm/gma500/framebuffer.c          |  2 +-
 drivers/gpu/drm/i810/i810_dma.c               |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        |  2 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c            |  3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  3 +-
 drivers/gpu/drm/tegra/gem.c                   |  5 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c               |  3 +-
 drivers/gpu/drm/virtio/virtgpu_vram.c         |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c      |  2 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c       |  3 +-
 drivers/hsi/clients/cmt_speech.c              |  2 +-
 drivers/hwtracing/intel_th/msu.c              |  2 +-
 drivers/hwtracing/stm/core.c                  |  2 +-
 drivers/infiniband/hw/hfi1/file_ops.c         |  4 +-
 drivers/infiniband/hw/mlx5/main.c             |  4 +-
 drivers/infiniband/hw/qib/qib_file_ops.c      | 13 ++---
 drivers/infiniband/hw/usnic/usnic_ib_verbs.c  |  2 +-
 .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.c   |  2 +-
 .../common/videobuf2/videobuf2-dma-contig.c   |  2 +-
 .../common/videobuf2/videobuf2-vmalloc.c      |  2 +-
 drivers/media/v4l2-core/videobuf-dma-contig.c |  2 +-
 drivers/media/v4l2-core/videobuf-dma-sg.c     |  4 +-
 drivers/media/v4l2-core/videobuf-vmalloc.c    |  2 +-
 drivers/misc/cxl/context.c                    |  2 +-
 drivers/misc/habanalabs/common/memory.c       |  2 +-
 drivers/misc/habanalabs/gaudi/gaudi.c         |  4 +-
 drivers/misc/habanalabs/gaudi2/gaudi2.c       |  8 +--
 drivers/misc/habanalabs/goya/goya.c           |  4 +-
 drivers/misc/ocxl/context.c                   |  4 +-
 drivers/misc/ocxl/sysfs.c                     |  2 +-
 drivers/misc/open-dice.c                      |  4 +-
 drivers/misc/sgi-gru/grufile.c                |  4 +-
 drivers/misc/uacce/uacce.c                    |  2 +-
 drivers/sbus/char/oradax.c                    |  2 +-
 drivers/scsi/cxlflash/ocxl_hw.c               |  2 +-
 drivers/scsi/sg.c                             |  2 +-
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    |  2 +-
 drivers/staging/media/deprecated/meye/meye.c  |  4 +-
 .../media/deprecated/stkwebcam/stk-webcam.c   |  2 +-
 drivers/target/target_core_user.c             |  2 +-
 drivers/uio/uio.c                             |  2 +-
 drivers/usb/core/devio.c                      |  3 +-
 drivers/usb/mon/mon_bin.c                     |  3 +-
 drivers/vdpa/vdpa_user/iova_domain.c          |  2 +-
 drivers/vfio/pci/vfio_pci_core.c              |  2 +-
 drivers/vhost/vdpa.c                          |  2 +-
 drivers/video/fbdev/68328fb.c                 |  2 +-
 drivers/video/fbdev/core/fb_defio.c           |  4 +-
 drivers/xen/gntalloc.c                        |  2 +-
 drivers/xen/gntdev.c                          |  4 +-
 drivers/xen/privcmd-buf.c                     |  2 +-
 drivers/xen/privcmd.c                         |  4 +-
 fs/aio.c                                      |  2 +-
 fs/cramfs/inode.c                             |  2 +-
 fs/erofs/data.c                               |  2 +-
 fs/exec.c                                     |  4 +-
 fs/ext4/file.c                                |  2 +-
 fs/fuse/dax.c                                 |  2 +-
 fs/hugetlbfs/inode.c                          |  4 +-
 fs/orangefs/file.c                            |  3 +-
 fs/proc/task_mmu.c                            |  2 +-
 fs/proc/vmcore.c                              |  3 +-
 fs/userfaultfd.c                              |  2 +-
 fs/xfs/xfs_file.c                             |  2 +-
 include/linux/mm.h                            | 58 +++++++++++++++++--
 include/linux/mm_types.h                      | 10 +++-
 include/linux/pgtable.h                       |  5 +-
 kernel/bpf/ringbuf.c                          |  4 +-
 kernel/bpf/syscall.c                          |  4 +-
 kernel/events/core.c                          |  2 +-
 kernel/fork.c                                 |  4 +-
 kernel/kcov.c                                 |  2 +-
 kernel/relay.c                                |  2 +-
 mm/debug.c                                    |  1 +
 mm/hugetlb.c                                  |  4 +-
 mm/madvise.c                                  |  2 +-
 mm/memory.c                                   | 19 +++---
 mm/memremap.c                                 |  4 +-
 mm/mlock.c                                    | 12 ++--
 mm/mmap.c                                     | 32 +++++-----
 mm/mprotect.c                                 |  2 +-
 mm/mremap.c                                   |  8 +--
 mm/nommu.c                                    | 11 ++--
 mm/secretmem.c                                |  2 +-
 mm/shmem.c                                    |  2 +-
 mm/vmalloc.c                                  |  2 +-
 net/ipv4/tcp.c                                |  4 +-
 security/selinux/selinuxfs.c                  |  6 +-
 sound/core/oss/pcm_oss.c                      |  2 +-
 sound/core/pcm_native.c                       |  9 +--
 sound/soc/pxa/mmp-sspa.c                      |  2 +-
 sound/usb/usx2y/us122l.c                      |  4 +-
 sound/usb/usx2y/usX2Yhwdep.c                  |  2 +-
 sound/usb/usx2y/usx2yhwdeppcm.c               |  2 +-
 127 files changed, 300 insertions(+), 234 deletions(-)

-- 
2.39.1

