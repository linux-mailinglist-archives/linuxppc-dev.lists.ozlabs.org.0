Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E0C67D58F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 20:42:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2rhK21D7z3fPC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 06:42:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ir6+vk1t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3ndbsywykdloxzwjsglttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ir6+vk1t;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2rbN0lMqz3fDT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 06:38:08 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5073cf66299so31559107b3.17
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 11:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0mLvM9xlw5eEE56nVy+KD9lz9+OS3Ui8OskWZiJTLBE=;
        b=ir6+vk1tLTBovLLP/jTyQQh+z7TFdG/NnUu7rkF2zeq/LpGc7DvDKL0v7fL4PHi2gK
         mJxHSBf+9sturLCNIlc62b25kVIOGUhoQI9uE42uqGekgBBvi/Q9ybSBSg40u8o/2Eyq
         IQht31xiNnEILY2XrN1+Qs2SIqIGGxxefjQ8D7uO7Or8kXfxNO7VbT8Q8tvE7a1LiHJh
         ljC02JQYPAy+Qs1LgoHwYAvHNVXMDjLN3mgdw9tQxt5lY/y7wgs280LZKthJXj6qYmCT
         kEnnqCHIYMiWIsOBnUdoUhtyocz/nVG5LcWGyZgP23CRAnz497k+DR+l20K8tIXNSRrx
         VoOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0mLvM9xlw5eEE56nVy+KD9lz9+OS3Ui8OskWZiJTLBE=;
        b=eupL8N+jYVAQN+RUyJOCmaU+FU8bkcYERjCiK1aPlXKd9XDvt8xbEDM96lgD1Alz9o
         iOnSYIJlCVO0iGPyGCWtyAtjiYOBkFglIf1o1CKtAdUdT7wIBoztFIk8gGsJozFY6X3K
         DW4B+H6dx2g7McVoaQK1toQ4wkU3ec/DGMZHBkT9y1BkliHKixWrqA5WHtx0c3kbEGgC
         g3vg+hl9yQSN2lXWn4Y6+l7HNy619IoV18xdFz9Ao2YkiKz9T6tONynne58e/lLHs0Sl
         Ql1oMe6Ug9HcYXWXqsCtmjfJ+zDVA80Qr5HVJAb34fTUzmrF5BgLfqXXRm6YBtfhACqa
         xIyA==
X-Gm-Message-State: AFqh2kqlOnqbZnQwYg5FjBtm4tUGiMXudeEWeZJsszBCUDFr76ETRWHC
	RNDwwqTImj2QejIwEfBC8PhrngGEfHU=
X-Google-Smtp-Source: AMrXdXvwLVs9d9hJewrS5/NlfIs3tLy/0iZ8wX16Sp9nF3siqmAqENHiqcFVKIgX+G1vJfuCnEgJKnOqcGE=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:d774:88af:bab3:648d])
 (user=surenb job=sendgmr) by 2002:a81:bf41:0:b0:36c:dd56:ce59 with SMTP id
 s1-20020a81bf41000000b0036cdd56ce59mr4584736ywk.321.1674761885840; Thu, 26
 Jan 2023 11:38:05 -0800 (PST)
Date: Thu, 26 Jan 2023 11:37:49 -0800
In-Reply-To: <20230126193752.297968-1-surenb@google.com>
Mime-Version: 1.0
References: <20230126193752.297968-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230126193752.297968-5-surenb@google.com>
Subject: [PATCH v4 4/7] mm: replace vma->vm_flags direct modifications with
 modifier calls
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, Sebastian Reichel <sebastian.reichel@collabora.com>, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org,
  tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace direct modifications to vma->vm_flags with calls to modifier
functions to be able to track flag changes and to keep vma locking
correctness.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Acked-by: Michal Hocko <mhocko@suse.com>
Acked-by: Mel Gorman <mgorman@techsingularity.net>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm/kernel/process.c                          |  2 +-
 arch/ia64/mm/init.c                                |  8 ++++----
 arch/loongarch/include/asm/tlb.h                   |  2 +-
 arch/powerpc/kvm/book3s_xive_native.c              |  2 +-
 arch/powerpc/mm/book3s64/subpage_prot.c            |  2 +-
 arch/powerpc/platforms/book3s/vas-api.c            |  2 +-
 arch/powerpc/platforms/cell/spufs/file.c           | 14 +++++++-------
 arch/s390/mm/gmap.c                                |  3 +--
 arch/x86/entry/vsyscall/vsyscall_64.c              |  2 +-
 arch/x86/kernel/cpu/sgx/driver.c                   |  2 +-
 arch/x86/kernel/cpu/sgx/virt.c                     |  2 +-
 arch/x86/mm/pat/memtype.c                          |  6 +++---
 arch/x86/um/mem_32.c                               |  2 +-
 drivers/acpi/pfr_telemetry.c                       |  2 +-
 drivers/android/binder.c                           |  3 +--
 drivers/char/mspec.c                               |  2 +-
 drivers/crypto/hisilicon/qm.c                      |  2 +-
 drivers/dax/device.c                               |  2 +-
 drivers/dma/idxd/cdev.c                            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  4 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |  4 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |  4 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  4 ++--
 drivers/gpu/drm/drm_gem.c                          |  2 +-
 drivers/gpu/drm/drm_gem_dma_helper.c               |  3 +--
 drivers/gpu/drm/drm_gem_shmem_helper.c             |  2 +-
 drivers/gpu/drm/drm_vm.c                           |  8 ++++----
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c            |  4 ++--
 drivers/gpu/drm/gma500/framebuffer.c               |  2 +-
 drivers/gpu/drm/i810/i810_dma.c                    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  4 ++--
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |  2 +-
 drivers/gpu/drm/msm/msm_gem.c                      |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c                 |  3 +--
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |  3 +--
 drivers/gpu/drm/tegra/gem.c                        |  5 ++---
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |  3 +--
 drivers/gpu/drm/virtio/virtgpu_vram.c              |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c           |  2 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c            |  3 +--
 drivers/hsi/clients/cmt_speech.c                   |  2 +-
 drivers/hwtracing/intel_th/msu.c                   |  2 +-
 drivers/hwtracing/stm/core.c                       |  2 +-
 drivers/infiniband/hw/hfi1/file_ops.c              |  4 ++--
 drivers/infiniband/hw/mlx5/main.c                  |  4 ++--
 drivers/infiniband/hw/qib/qib_file_ops.c           | 13 ++++++-------
 drivers/infiniband/hw/usnic/usnic_ib_verbs.c       |  2 +-
 drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.c    |  2 +-
 .../media/common/videobuf2/videobuf2-dma-contig.c  |  2 +-
 drivers/media/common/videobuf2/videobuf2-vmalloc.c |  2 +-
 drivers/media/v4l2-core/videobuf-dma-contig.c      |  2 +-
 drivers/media/v4l2-core/videobuf-dma-sg.c          |  4 ++--
 drivers/media/v4l2-core/videobuf-vmalloc.c         |  2 +-
 drivers/misc/cxl/context.c                         |  2 +-
 drivers/misc/habanalabs/common/memory.c            |  2 +-
 drivers/misc/habanalabs/gaudi/gaudi.c              |  4 ++--
 drivers/misc/habanalabs/gaudi2/gaudi2.c            |  8 ++++----
 drivers/misc/habanalabs/goya/goya.c                |  4 ++--
 drivers/misc/ocxl/context.c                        |  4 ++--
 drivers/misc/ocxl/sysfs.c                          |  2 +-
 drivers/misc/open-dice.c                           |  4 ++--
 drivers/misc/sgi-gru/grufile.c                     |  4 ++--
 drivers/misc/uacce/uacce.c                         |  2 +-
 drivers/sbus/char/oradax.c                         |  2 +-
 drivers/scsi/cxlflash/ocxl_hw.c                    |  2 +-
 drivers/scsi/sg.c                                  |  2 +-
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     |  2 +-
 drivers/staging/media/deprecated/meye/meye.c       |  4 ++--
 .../media/deprecated/stkwebcam/stk-webcam.c        |  2 +-
 drivers/target/target_core_user.c                  |  2 +-
 drivers/uio/uio.c                                  |  2 +-
 drivers/usb/core/devio.c                           |  3 +--
 drivers/usb/mon/mon_bin.c                          |  3 +--
 drivers/vdpa/vdpa_user/iova_domain.c               |  2 +-
 drivers/vfio/pci/vfio_pci_core.c                   |  2 +-
 drivers/vhost/vdpa.c                               |  2 +-
 drivers/video/fbdev/68328fb.c                      |  2 +-
 drivers/video/fbdev/core/fb_defio.c                |  4 ++--
 drivers/xen/gntalloc.c                             |  2 +-
 drivers/xen/gntdev.c                               |  4 ++--
 drivers/xen/privcmd-buf.c                          |  2 +-
 drivers/xen/privcmd.c                              |  4 ++--
 fs/aio.c                                           |  2 +-
 fs/cramfs/inode.c                                  |  2 +-
 fs/erofs/data.c                                    |  2 +-
 fs/exec.c                                          |  4 ++--
 fs/ext4/file.c                                     |  2 +-
 fs/fuse/dax.c                                      |  2 +-
 fs/hugetlbfs/inode.c                               |  4 ++--
 fs/orangefs/file.c                                 |  3 +--
 fs/proc/task_mmu.c                                 |  2 +-
 fs/proc/vmcore.c                                   |  3 +--
 fs/userfaultfd.c                                   |  2 +-
 fs/xfs/xfs_file.c                                  |  2 +-
 include/linux/mm.h                                 |  2 +-
 kernel/bpf/ringbuf.c                               |  4 ++--
 kernel/bpf/syscall.c                               |  4 ++--
 kernel/events/core.c                               |  2 +-
 kernel/kcov.c                                      |  2 +-
 kernel/relay.c                                     |  2 +-
 mm/madvise.c                                       |  2 +-
 mm/memory.c                                        |  6 +++---
 mm/mlock.c                                         |  6 +++---
 mm/mmap.c                                          | 10 +++++-----
 mm/mprotect.c                                      |  2 +-
 mm/mremap.c                                        |  6 +++---
 mm/nommu.c                                         | 11 ++++++-----
 mm/secretmem.c                                     |  2 +-
 mm/shmem.c                                         |  2 +-
 mm/vmalloc.c                                       |  2 +-
 net/ipv4/tcp.c                                     |  4 ++--
 security/selinux/selinuxfs.c                       |  6 +++---
 sound/core/oss/pcm_oss.c                           |  2 +-
 sound/core/pcm_native.c                            |  9 +++++----
 sound/soc/pxa/mmp-sspa.c                           |  2 +-
 sound/usb/usx2y/us122l.c                           |  4 ++--
 sound/usb/usx2y/usX2Yhwdep.c                       |  2 +-
 sound/usb/usx2y/usx2yhwdeppcm.c                    |  2 +-
 120 files changed, 188 insertions(+), 199 deletions(-)

diff --git a/arch/arm/kernel/process.c b/arch/arm/kernel/process.c
index f811733a8fc5..61c30b9a24ea 100644
--- a/arch/arm/kernel/process.c
+++ b/arch/arm/kernel/process.c
@@ -316,7 +316,7 @@ static int __init gate_vma_init(void)
 	gate_vma.vm_page_prot = PAGE_READONLY_EXEC;
 	gate_vma.vm_start = 0xffff0000;
 	gate_vma.vm_end	= 0xffff0000 + PAGE_SIZE;
-	gate_vma.vm_flags = VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYEXEC;
+	vm_flags_init(&gate_vma, VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYEXEC);
 	return 0;
 }
 arch_initcall(gate_vma_init);
diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
index fc4e4217e87f..7f5353e28516 100644
--- a/arch/ia64/mm/init.c
+++ b/arch/ia64/mm/init.c
@@ -109,7 +109,7 @@ ia64_init_addr_space (void)
 		vma_set_anonymous(vma);
 		vma->vm_start = current->thread.rbs_bot & PAGE_MASK;
 		vma->vm_end = vma->vm_start + PAGE_SIZE;
-		vma->vm_flags = VM_DATA_DEFAULT_FLAGS|VM_GROWSUP|VM_ACCOUNT;
+		vm_flags_init(vma, VM_DATA_DEFAULT_FLAGS|VM_GROWSUP|VM_ACCOUNT);
 		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 		mmap_write_lock(current->mm);
 		if (insert_vm_struct(current->mm, vma)) {
@@ -127,8 +127,8 @@ ia64_init_addr_space (void)
 			vma_set_anonymous(vma);
 			vma->vm_end = PAGE_SIZE;
 			vma->vm_page_prot = __pgprot(pgprot_val(PAGE_READONLY) | _PAGE_MA_NAT);
-			vma->vm_flags = VM_READ | VM_MAYREAD | VM_IO |
-					VM_DONTEXPAND | VM_DONTDUMP;
+			vm_flags_init(vma, VM_READ | VM_MAYREAD | VM_IO |
+				      VM_DONTEXPAND | VM_DONTDUMP);
 			mmap_write_lock(current->mm);
 			if (insert_vm_struct(current->mm, vma)) {
 				mmap_write_unlock(current->mm);
@@ -272,7 +272,7 @@ static int __init gate_vma_init(void)
 	vma_init(&gate_vma, NULL);
 	gate_vma.vm_start = FIXADDR_USER_START;
 	gate_vma.vm_end = FIXADDR_USER_END;
-	gate_vma.vm_flags = VM_READ | VM_MAYREAD | VM_EXEC | VM_MAYEXEC;
+	vm_flags_init(&gate_vma, VM_READ | VM_MAYREAD | VM_EXEC | VM_MAYEXEC);
 	gate_vma.vm_page_prot = __pgprot(__ACCESS_BITS | _PAGE_PL_3 | _PAGE_AR_RX);
 
 	return 0;
diff --git a/arch/loongarch/include/asm/tlb.h b/arch/loongarch/include/asm/tlb.h
index dd24f5898f65..f5e4deb97402 100644
--- a/arch/loongarch/include/asm/tlb.h
+++ b/arch/loongarch/include/asm/tlb.h
@@ -149,7 +149,7 @@ static inline void tlb_flush(struct mmu_gather *tlb)
 	struct vm_area_struct vma;
 
 	vma.vm_mm = tlb->mm;
-	vma.vm_flags = 0;
+	vm_flags_init(&vma, 0);
 	if (tlb->fullmm) {
 		flush_tlb_mm(tlb->mm);
 		return;
diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index 4f566bea5e10..712ab91ced39 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -324,7 +324,7 @@ static int kvmppc_xive_native_mmap(struct kvm_device *dev,
 		return -EINVAL;
 	}
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP);
 	vma->vm_page_prot = pgprot_noncached_wc(vma->vm_page_prot);
 
 	/*
diff --git a/arch/powerpc/mm/book3s64/subpage_prot.c b/arch/powerpc/mm/book3s64/subpage_prot.c
index d73b3b4176e8..b75a9fb99599 100644
--- a/arch/powerpc/mm/book3s64/subpage_prot.c
+++ b/arch/powerpc/mm/book3s64/subpage_prot.c
@@ -156,7 +156,7 @@ static void subpage_mark_vma_nohuge(struct mm_struct *mm, unsigned long addr,
 	 * VM_NOHUGEPAGE and split them.
 	 */
 	for_each_vma_range(vmi, vma, addr + len) {
-		vma->vm_flags |= VM_NOHUGEPAGE;
+		vm_flags_set(vma, VM_NOHUGEPAGE);
 		walk_page_vma(vma, &subpage_walk_ops, NULL);
 	}
 }
diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index 9580e8e12165..36c21648d19a 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -525,7 +525,7 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 	pfn = paste_addr >> PAGE_SHIFT;
 
 	/* flags, page_prot from cxl_mmap(), except we want cachable */
-	vma->vm_flags |= VM_IO | VM_PFNMAP;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP);
 	vma->vm_page_prot = pgprot_cached(vma->vm_page_prot);
 
 	prot = __pgprot(pgprot_val(vma->vm_page_prot) | _PAGE_DIRTY);
diff --git a/arch/powerpc/platforms/cell/spufs/file.c b/arch/powerpc/platforms/cell/spufs/file.c
index 62d90a5e23d1..02a8158c469d 100644
--- a/arch/powerpc/platforms/cell/spufs/file.c
+++ b/arch/powerpc/platforms/cell/spufs/file.c
@@ -291,7 +291,7 @@ static int spufs_mem_mmap(struct file *file, struct vm_area_struct *vma)
 	if (!(vma->vm_flags & VM_SHARED))
 		return -EINVAL;
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP);
 	vma->vm_page_prot = pgprot_noncached_wc(vma->vm_page_prot);
 
 	vma->vm_ops = &spufs_mem_mmap_vmops;
@@ -381,7 +381,7 @@ static int spufs_cntl_mmap(struct file *file, struct vm_area_struct *vma)
 	if (!(vma->vm_flags & VM_SHARED))
 		return -EINVAL;
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP);
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 
 	vma->vm_ops = &spufs_cntl_mmap_vmops;
@@ -1043,7 +1043,7 @@ static int spufs_signal1_mmap(struct file *file, struct vm_area_struct *vma)
 	if (!(vma->vm_flags & VM_SHARED))
 		return -EINVAL;
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP);
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 
 	vma->vm_ops = &spufs_signal1_mmap_vmops;
@@ -1179,7 +1179,7 @@ static int spufs_signal2_mmap(struct file *file, struct vm_area_struct *vma)
 	if (!(vma->vm_flags & VM_SHARED))
 		return -EINVAL;
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP);
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 
 	vma->vm_ops = &spufs_signal2_mmap_vmops;
@@ -1302,7 +1302,7 @@ static int spufs_mss_mmap(struct file *file, struct vm_area_struct *vma)
 	if (!(vma->vm_flags & VM_SHARED))
 		return -EINVAL;
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP);
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 
 	vma->vm_ops = &spufs_mss_mmap_vmops;
@@ -1364,7 +1364,7 @@ static int spufs_psmap_mmap(struct file *file, struct vm_area_struct *vma)
 	if (!(vma->vm_flags & VM_SHARED))
 		return -EINVAL;
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP);
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 
 	vma->vm_ops = &spufs_psmap_mmap_vmops;
@@ -1424,7 +1424,7 @@ static int spufs_mfc_mmap(struct file *file, struct vm_area_struct *vma)
 	if (!(vma->vm_flags & VM_SHARED))
 		return -EINVAL;
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP);
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 
 	vma->vm_ops = &spufs_mfc_mmap_vmops;
diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
index 69af6cdf1a2a..ab836597419d 100644
--- a/arch/s390/mm/gmap.c
+++ b/arch/s390/mm/gmap.c
@@ -2522,8 +2522,7 @@ static inline void thp_split_mm(struct mm_struct *mm)
 	VMA_ITERATOR(vmi, mm, 0);
 
 	for_each_vma(vmi, vma) {
-		vma->vm_flags &= ~VM_HUGEPAGE;
-		vma->vm_flags |= VM_NOHUGEPAGE;
+		vm_flags_mod(vma, VM_NOHUGEPAGE, VM_HUGEPAGE);
 		walk_page_vma(vma, &thp_split_walk_ops, NULL);
 	}
 	mm->def_flags |= VM_NOHUGEPAGE;
diff --git a/arch/x86/entry/vsyscall/vsyscall_64.c b/arch/x86/entry/vsyscall/vsyscall_64.c
index 4af81df133ee..d234ca797e4a 100644
--- a/arch/x86/entry/vsyscall/vsyscall_64.c
+++ b/arch/x86/entry/vsyscall/vsyscall_64.c
@@ -391,7 +391,7 @@ void __init map_vsyscall(void)
 	}
 
 	if (vsyscall_mode == XONLY)
-		gate_vma.vm_flags = VM_EXEC;
+		vm_flags_init(&gate_vma, VM_EXEC);
 
 	BUILD_BUG_ON((unsigned long)__fix_to_virt(VSYSCALL_PAGE) !=
 		     (unsigned long)VSYSCALL_ADDR);
diff --git a/arch/x86/kernel/cpu/sgx/driver.c b/arch/x86/kernel/cpu/sgx/driver.c
index aa9b8b868867..262f5fb18d74 100644
--- a/arch/x86/kernel/cpu/sgx/driver.c
+++ b/arch/x86/kernel/cpu/sgx/driver.c
@@ -95,7 +95,7 @@ static int sgx_mmap(struct file *file, struct vm_area_struct *vma)
 		return ret;
 
 	vma->vm_ops = &sgx_vm_ops;
-	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO;
+	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO);
 	vma->vm_private_data = encl;
 
 	return 0;
diff --git a/arch/x86/kernel/cpu/sgx/virt.c b/arch/x86/kernel/cpu/sgx/virt.c
index 6a77a14eee38..c3e37eaec8ec 100644
--- a/arch/x86/kernel/cpu/sgx/virt.c
+++ b/arch/x86/kernel/cpu/sgx/virt.c
@@ -105,7 +105,7 @@ static int sgx_vepc_mmap(struct file *file, struct vm_area_struct *vma)
 
 	vma->vm_ops = &sgx_vepc_vm_ops;
 	/* Don't copy VMA in fork() */
-	vma->vm_flags |= VM_PFNMAP | VM_IO | VM_DONTDUMP | VM_DONTCOPY;
+	vm_flags_set(vma, VM_PFNMAP | VM_IO | VM_DONTDUMP | VM_DONTCOPY);
 	vma->vm_private_data = vepc;
 
 	return 0;
diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index fb4b1b5e0dea..6ca51b1aa5d9 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -1000,7 +1000,7 @@ int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
 
 		ret = reserve_pfn_range(paddr, size, prot, 0);
 		if (ret == 0 && vma)
-			vma->vm_flags |= VM_PAT;
+			vm_flags_set(vma, VM_PAT);
 		return ret;
 	}
 
@@ -1066,7 +1066,7 @@ void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
 	}
 	free_pfn_range(paddr, size);
 	if (vma)
-		vma->vm_flags &= ~VM_PAT;
+		vm_flags_clear(vma, VM_PAT);
 }
 
 /*
@@ -1076,7 +1076,7 @@ void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
  */
 void untrack_pfn_moved(struct vm_area_struct *vma)
 {
-	vma->vm_flags &= ~VM_PAT;
+	vm_flags_clear(vma, VM_PAT);
 }
 
 pgprot_t pgprot_writecombine(pgprot_t prot)
diff --git a/arch/x86/um/mem_32.c b/arch/x86/um/mem_32.c
index cafd01f730da..29b2203bc82c 100644
--- a/arch/x86/um/mem_32.c
+++ b/arch/x86/um/mem_32.c
@@ -16,7 +16,7 @@ static int __init gate_vma_init(void)
 	vma_init(&gate_vma, NULL);
 	gate_vma.vm_start = FIXADDR_USER_START;
 	gate_vma.vm_end = FIXADDR_USER_END;
-	gate_vma.vm_flags = VM_READ | VM_MAYREAD | VM_EXEC | VM_MAYEXEC;
+	vm_flags_init(&gate_vma, VM_READ | VM_MAYREAD | VM_EXEC | VM_MAYEXEC);
 	gate_vma.vm_page_prot = PAGE_READONLY;
 
 	return 0;
diff --git a/drivers/acpi/pfr_telemetry.c b/drivers/acpi/pfr_telemetry.c
index 27fb6cdad75f..843f678ade0c 100644
--- a/drivers/acpi/pfr_telemetry.c
+++ b/drivers/acpi/pfr_telemetry.c
@@ -310,7 +310,7 @@ pfrt_log_mmap(struct file *file, struct vm_area_struct *vma)
 		return -EROFS;
 
 	/* changing from read to write with mprotect is not allowed */
-	vma->vm_flags &= ~VM_MAYWRITE;
+	vm_flags_clear(vma, VM_MAYWRITE);
 
 	pfrt_log_dev = to_pfrt_log_dev(file);
 
diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 880224ec6abb..cb08982b9666 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -5572,8 +5572,7 @@ static int binder_mmap(struct file *filp, struct vm_area_struct *vma)
 		       proc->pid, vma->vm_start, vma->vm_end, "bad vm_flags", -EPERM);
 		return -EPERM;
 	}
-	vma->vm_flags |= VM_DONTCOPY | VM_MIXEDMAP;
-	vma->vm_flags &= ~VM_MAYWRITE;
+	vm_flags_mod(vma, VM_DONTCOPY | VM_MIXEDMAP, VM_MAYWRITE);
 
 	vma->vm_ops = &binder_vm_ops;
 	vma->vm_private_data = proc;
diff --git a/drivers/char/mspec.c b/drivers/char/mspec.c
index f8231e2e84be..b35f651837c8 100644
--- a/drivers/char/mspec.c
+++ b/drivers/char/mspec.c
@@ -206,7 +206,7 @@ mspec_mmap(struct file *file, struct vm_area_struct *vma,
 	refcount_set(&vdata->refcnt, 1);
 	vma->vm_private_data = vdata;
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
 	if (vdata->type == MSPEC_UNCACHED)
 		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 	vma->vm_ops = &mspec_vm_ops;
diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.c
index 007ac7a69ce7..733fe1033910 100644
--- a/drivers/crypto/hisilicon/qm.c
+++ b/drivers/crypto/hisilicon/qm.c
@@ -2363,7 +2363,7 @@ static int hisi_qm_uacce_mmap(struct uacce_queue *q,
 				return -EINVAL;
 		}
 
-		vma->vm_flags |= VM_IO;
+		vm_flags_set(vma, VM_IO);
 
 		return remap_pfn_range(vma, vma->vm_start,
 				       phys_base >> PAGE_SHIFT,
diff --git a/drivers/dax/device.c b/drivers/dax/device.c
index 5494d745ced5..223e4e233d19 100644
--- a/drivers/dax/device.c
+++ b/drivers/dax/device.c
@@ -308,7 +308,7 @@ static int dax_mmap(struct file *filp, struct vm_area_struct *vma)
 		return rc;
 
 	vma->vm_ops = &dax_vm_ops;
-	vma->vm_flags |= VM_HUGEPAGE;
+	vm_flags_set(vma, VM_HUGEPAGE);
 	return 0;
 }
 
diff --git a/drivers/dma/idxd/cdev.c b/drivers/dma/idxd/cdev.c
index e13e92609943..674bfefca088 100644
--- a/drivers/dma/idxd/cdev.c
+++ b/drivers/dma/idxd/cdev.c
@@ -201,7 +201,7 @@ static int idxd_cdev_mmap(struct file *filp, struct vm_area_struct *vma)
 	if (rc < 0)
 		return rc;
 
-	vma->vm_flags |= VM_DONTCOPY;
+	vm_flags_set(vma, VM_DONTCOPY);
 	pfn = (base + idxd_get_wq_portal_full_offset(wq->id,
 				IDXD_PORTAL_LIMITED)) >> PAGE_SHIFT;
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index bb7350ea1d75..a69fd6fdabb4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -257,7 +257,7 @@ static int amdgpu_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_str
 	 */
 	if (is_cow_mapping(vma->vm_flags) &&
 	    !(vma->vm_flags & VM_ACCESS_FLAGS))
-		vma->vm_flags &= ~VM_MAYWRITE;
+		vm_flags_clear(vma, VM_MAYWRITE);
 
 	return drm_gem_ttm_mmap(obj, vma);
 }
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 6d291aa6386b..d0933dd9af06 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2879,8 +2879,8 @@ static int kfd_mmio_mmap(struct kfd_dev *dev, struct kfd_process *process,
 
 	address = dev->adev->rmmio_remap.bus_addr;
 
-	vma->vm_flags |= VM_IO | VM_DONTCOPY | VM_DONTEXPAND | VM_NORESERVE |
-				VM_DONTDUMP | VM_PFNMAP;
+	vm_flags_set(vma, VM_IO | VM_DONTCOPY | VM_DONTEXPAND | VM_NORESERVE |
+				VM_DONTDUMP | VM_PFNMAP);
 
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c b/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
index cd4e61bf0493..cbef2e147da5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
@@ -159,8 +159,8 @@ int kfd_doorbell_mmap(struct kfd_dev *dev, struct kfd_process *process,
 	address = kfd_get_process_doorbells(pdd);
 	if (!address)
 		return -ENOMEM;
-	vma->vm_flags |= VM_IO | VM_DONTCOPY | VM_DONTEXPAND | VM_NORESERVE |
-				VM_DONTDUMP | VM_PFNMAP;
+	vm_flags_set(vma, VM_IO | VM_DONTCOPY | VM_DONTEXPAND | VM_NORESERVE |
+				VM_DONTDUMP | VM_PFNMAP);
 
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
index 729d26d648af..dd0436bf349a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
@@ -1052,8 +1052,8 @@ int kfd_event_mmap(struct kfd_process *p, struct vm_area_struct *vma)
 	pfn = __pa(page->kernel_address);
 	pfn >>= PAGE_SHIFT;
 
-	vma->vm_flags |= VM_IO | VM_DONTCOPY | VM_DONTEXPAND | VM_NORESERVE
-		       | VM_DONTDUMP | VM_PFNMAP;
+	vm_flags_set(vma, VM_IO | VM_DONTCOPY | VM_DONTEXPAND | VM_NORESERVE
+		       | VM_DONTDUMP | VM_PFNMAP);
 
 	pr_debug("Mapping signal page\n");
 	pr_debug("     start user address  == 0x%08lx\n", vma->vm_start);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 51b1683ac5c1..1fad0ecdfaeb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1978,8 +1978,8 @@ int kfd_reserved_mem_mmap(struct kfd_dev *dev, struct kfd_process *process,
 		return -ENOMEM;
 	}
 
-	vma->vm_flags |= VM_IO | VM_DONTCOPY | VM_DONTEXPAND
-		| VM_NORESERVE | VM_DONTDUMP | VM_PFNMAP;
+	vm_flags_set(vma, VM_IO | VM_DONTCOPY | VM_DONTEXPAND
+		| VM_NORESERVE | VM_DONTDUMP | VM_PFNMAP);
 	/* Mapping pages to user process */
 	return remap_pfn_range(vma, vma->vm_start,
 			       PFN_DOWN(__pa(qpd->cwsr_kaddr)),
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index b8db675e7fb5..54c76003d2cc 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1047,7 +1047,7 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
 			goto err_drm_gem_object_put;
 		}
 
-		vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
+		vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
 		vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
 		vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 	}
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 1e658c448366..fb2c764accc6 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -530,8 +530,7 @@ int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *
 	 * the whole buffer.
 	 */
 	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
-	vma->vm_flags &= ~VM_PFNMAP;
-	vma->vm_flags |= VM_DONTEXPAND;
+	vm_flags_mod(vma, VM_DONTEXPAND, VM_PFNMAP);
 
 	if (dma_obj->map_noncoherent) {
 		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index b602cd72a120..a2c28483e010 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -633,7 +633,7 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 	if (ret)
 		return ret;
 
-	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 	if (shmem->map_wc)
 		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
index f024dc93939e..87c9fe55dec7 100644
--- a/drivers/gpu/drm/drm_vm.c
+++ b/drivers/gpu/drm/drm_vm.c
@@ -476,7 +476,7 @@ static int drm_mmap_dma(struct file *filp, struct vm_area_struct *vma)
 
 	if (!capable(CAP_SYS_ADMIN) &&
 	    (dma->flags & _DRM_DMA_USE_PCI_RO)) {
-		vma->vm_flags &= ~(VM_WRITE | VM_MAYWRITE);
+		vm_flags_clear(vma, VM_WRITE | VM_MAYWRITE);
 #if defined(__i386__) || defined(__x86_64__)
 		pgprot_val(vma->vm_page_prot) &= ~_PAGE_RW;
 #else
@@ -492,7 +492,7 @@ static int drm_mmap_dma(struct file *filp, struct vm_area_struct *vma)
 
 	vma->vm_ops = &drm_vm_dma_ops;
 
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
 
 	drm_vm_open_locked(dev, vma);
 	return 0;
@@ -560,7 +560,7 @@ static int drm_mmap_locked(struct file *filp, struct vm_area_struct *vma)
 		return -EINVAL;
 
 	if (!capable(CAP_SYS_ADMIN) && (map->flags & _DRM_READ_ONLY)) {
-		vma->vm_flags &= ~(VM_WRITE | VM_MAYWRITE);
+		vm_flags_clear(vma, VM_WRITE | VM_MAYWRITE);
 #if defined(__i386__) || defined(__x86_64__)
 		pgprot_val(vma->vm_page_prot) &= ~_PAGE_RW;
 #else
@@ -628,7 +628,7 @@ static int drm_mmap_locked(struct file *filp, struct vm_area_struct *vma)
 	default:
 		return -EINVAL;	/* This should never happen. */
 	}
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
 
 	drm_vm_open_locked(dev, vma);
 	return 0;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index c5ae5492e1af..b5f73502e3dd 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -130,7 +130,7 @@ static int etnaviv_gem_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
 {
 	pgprot_t vm_page_prot;
 
-	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
 
 	vm_page_prot = vm_get_page_prot(vma->vm_flags);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 3e493f48e0d4..638ca96830e9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -274,7 +274,7 @@ static int exynos_drm_gem_mmap_buffer(struct exynos_drm_gem *exynos_gem,
 	unsigned long vm_size;
 	int ret;
 
-	vma->vm_flags &= ~VM_PFNMAP;
+	vm_flags_clear(vma, VM_PFNMAP);
 	vma->vm_pgoff = 0;
 
 	vm_size = vma->vm_end - vma->vm_start;
@@ -368,7 +368,7 @@ static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct
 	if (obj->import_attach)
 		return dma_buf_mmap(obj->dma_buf, vma, 0);
 
-	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP);
 
 	DRM_DEV_DEBUG_KMS(to_dma_dev(obj->dev), "flags = 0x%x\n",
 			  exynos_gem->flags);
diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 8d5a37b8f110..a9276c8a3e4e 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -139,7 +139,7 @@ static int psbfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	 */
 	vma->vm_ops = &psbfb_vm_ops;
 	vma->vm_private_data = (void *)fb;
-	vma->vm_flags |= VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTDUMP);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i810/i810_dma.c b/drivers/gpu/drm/i810/i810_dma.c
index 9fb4dd63342f..01967dd88762 100644
--- a/drivers/gpu/drm/i810/i810_dma.c
+++ b/drivers/gpu/drm/i810/i810_dma.c
@@ -102,7 +102,7 @@ static int i810_mmap_buffers(struct file *filp, struct vm_area_struct *vma)
 	buf = dev_priv->mmap_buffer;
 	buf_priv = buf->dev_private;
 
-	vma->vm_flags |= VM_DONTCOPY;
+	vm_flags_set(vma, VM_DONTCOPY);
 
 	buf_priv->currently_mapped = I810_BUF_MAPPED;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 0ad44f3868de..e95f4c729ca5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -979,7 +979,7 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 			i915_gem_object_put(obj);
 			return -EINVAL;
 		}
-		vma->vm_flags &= ~VM_MAYWRITE;
+		vm_flags_clear(vma, VM_MAYWRITE);
 	}
 
 	anon = mmap_singleton(to_i915(dev));
@@ -988,7 +988,7 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 		return PTR_ERR(anon);
 	}
 
-	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO;
+	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO);
 
 	/*
 	 * We keep the ref on mmo->obj, not vm_file, but we require
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 47e96b0289f9..28659514bf20 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -158,7 +158,7 @@ static int mtk_drm_gem_object_mmap(struct drm_gem_object *obj,
 	 * dma_alloc_attrs() allocated a struct page table for mtk_gem, so clear
 	 * VM_PFNMAP flag that was set by drm_gem_mmap_obj()/drm_gem_mmap().
 	 */
-	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
 	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 1dee0d18abbb..c2fb98a94bc3 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1012,7 +1012,7 @@ static int msm_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_page_prot = msm_gem_pgprot(msm_obj, vm_get_page_prot(vma->vm_flags));
 
 	return 0;
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index cf571796fd26..19fef933904b 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -543,8 +543,7 @@ int omap_gem_mmap_obj(struct drm_gem_object *obj,
 {
 	struct omap_gem_object *omap_obj = to_omap_bo(obj);
 
-	vma->vm_flags &= ~VM_PFNMAP;
-	vma->vm_flags |= VM_MIXEDMAP;
+	vm_flags_mod(vma, VM_MIXEDMAP, VM_PFNMAP);
 
 	if (omap_obj->flags & OMAP_BO_WC) {
 		vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 6edb7c52cb3d..8ea09d915c3c 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -251,8 +251,7 @@ static int rockchip_drm_gem_object_mmap(struct drm_gem_object *obj,
 	 * We allocated a struct page table for rk_obj, so clear
 	 * VM_PFNMAP flag that was set by drm_gem_mmap_obj()/drm_gem_mmap().
 	 */
-	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
-	vma->vm_flags &= ~VM_PFNMAP;
+	vm_flags_mod(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP, VM_PFNMAP);
 
 	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
 	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 979e7bc902f6..bce991a2ccc0 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -574,7 +574,7 @@ int __tegra_gem_mmap(struct drm_gem_object *gem, struct vm_area_struct *vma)
 		 * and set the vm_pgoff (used as a fake buffer offset by DRM)
 		 * to 0 as we want to map the whole buffer.
 		 */
-		vma->vm_flags &= ~VM_PFNMAP;
+		vm_flags_clear(vma, VM_PFNMAP);
 		vma->vm_pgoff = 0;
 
 		err = dma_mmap_wc(gem->dev->dev, vma, bo->vaddr, bo->iova,
@@ -588,8 +588,7 @@ int __tegra_gem_mmap(struct drm_gem_object *gem, struct vm_area_struct *vma)
 	} else {
 		pgprot_t prot = vm_get_page_prot(vma->vm_flags);
 
-		vma->vm_flags |= VM_MIXEDMAP;
-		vma->vm_flags &= ~VM_PFNMAP;
+		vm_flags_mod(vma, VM_MIXEDMAP, VM_PFNMAP);
 
 		vma->vm_page_prot = pgprot_writecombine(prot);
 	}
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 5a3e4b891377..c00207582c74 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -468,8 +468,7 @@ int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
 
 	vma->vm_private_data = bo;
 
-	vma->vm_flags |= VM_PFNMAP;
-	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_PFNMAP | VM_IO | VM_DONTEXPAND | VM_DONTDUMP);
 	return 0;
 }
 EXPORT_SYMBOL(ttm_bo_mmap_obj);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio/virtgpu_vram.c
index 6b45b0429fef..25df81c02783 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vram.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
@@ -46,7 +46,7 @@ static int virtio_gpu_vram_mmap(struct drm_gem_object *obj,
 		return -EINVAL;
 
 	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
-	vma->vm_flags |= VM_MIXEDMAP | VM_DONTEXPAND;
+	vm_flags_set(vma, VM_MIXEDMAP | VM_DONTEXPAND);
 	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 	vma->vm_ops = &virtio_gpu_vram_vm_ops;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
index 265f7c48d856..90097d04b45f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
@@ -97,7 +97,7 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
 
 	/* Use VM_PFNMAP rather than VM_MIXEDMAP if not a COW mapping */
 	if (!is_cow_mapping(vma->vm_flags))
-		vma->vm_flags = (vma->vm_flags & ~VM_MIXEDMAP) | VM_PFNMAP;
+		vm_flags_mod(vma, VM_PFNMAP, VM_MIXEDMAP);
 
 	ttm_bo_put(bo); /* release extra ref taken by ttm_bo_mmap_obj() */
 
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index 4c95ebcdcc2d..3ad2b4cfd1f0 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -69,8 +69,7 @@ static int xen_drm_front_gem_object_mmap(struct drm_gem_object *gem_obj,
 	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to map
 	 * the whole buffer.
 	 */
-	vma->vm_flags &= ~VM_PFNMAP;
-	vma->vm_flags |= VM_MIXEDMAP | VM_DONTEXPAND;
+	vm_flags_mod(vma, VM_MIXEDMAP | VM_DONTEXPAND, VM_PFNMAP);
 	vma->vm_pgoff = 0;
 
 	/*
diff --git a/drivers/hsi/clients/cmt_speech.c b/drivers/hsi/clients/cmt_speech.c
index 8069f795c864..daa8e1bff5d9 100644
--- a/drivers/hsi/clients/cmt_speech.c
+++ b/drivers/hsi/clients/cmt_speech.c
@@ -1264,7 +1264,7 @@ static int cs_char_mmap(struct file *file, struct vm_area_struct *vma)
 	if (vma_pages(vma) != 1)
 		return -EINVAL;
 
-	vma->vm_flags |= VM_IO | VM_DONTDUMP | VM_DONTEXPAND;
+	vm_flags_set(vma, VM_IO | VM_DONTDUMP | VM_DONTEXPAND);
 	vma->vm_ops = &cs_char_vm_ops;
 	vma->vm_private_data = file->private_data;
 
diff --git a/drivers/hwtracing/intel_th/msu.c b/drivers/hwtracing/intel_th/msu.c
index 6c8215a47a60..9621efe0e95c 100644
--- a/drivers/hwtracing/intel_th/msu.c
+++ b/drivers/hwtracing/intel_th/msu.c
@@ -1659,7 +1659,7 @@ static int intel_th_msc_mmap(struct file *file, struct vm_area_struct *vma)
 		atomic_dec(&msc->user_count);
 
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTCOPY;
+	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTCOPY);
 	vma->vm_ops = &msc_mmap_ops;
 	return ret;
 }
diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index 2712e699ba08..534fbefc7f6a 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -715,7 +715,7 @@ static int stm_char_mmap(struct file *file, struct vm_area_struct *vma)
 	pm_runtime_get_sync(&stm->dev);
 
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
-	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_ops = &stm_mmap_vmops;
 	vm_iomap_memory(vma, phys, size);
 
diff --git a/drivers/infiniband/hw/hfi1/file_ops.c b/drivers/infiniband/hw/hfi1/file_ops.c
index f5f9269fdc16..c6e59bc480f9 100644
--- a/drivers/infiniband/hw/hfi1/file_ops.c
+++ b/drivers/infiniband/hw/hfi1/file_ops.c
@@ -403,7 +403,7 @@ static int hfi1_file_mmap(struct file *fp, struct vm_area_struct *vma)
 			ret = -EPERM;
 			goto done;
 		}
-		vma->vm_flags &= ~VM_MAYWRITE;
+		vm_flags_clear(vma, VM_MAYWRITE);
 		addr = vma->vm_start;
 		for (i = 0 ; i < uctxt->egrbufs.numbufs; i++) {
 			memlen = uctxt->egrbufs.buffers[i].len;
@@ -528,7 +528,7 @@ static int hfi1_file_mmap(struct file *fp, struct vm_area_struct *vma)
 		goto done;
 	}
 
-	vma->vm_flags = flags;
+	vm_flags_reset(vma, flags);
 	hfi1_cdbg(PROC,
 		  "%u:%u type:%u io/vf:%d/%d, addr:0x%llx, len:%lu(%lu), flags:0x%lx\n",
 		    ctxt, subctxt, type, mapio, vmf, memaddr, memlen,
diff --git a/drivers/infiniband/hw/mlx5/main.c b/drivers/infiniband/hw/mlx5/main.c
index c669ef6e47e7..e3c97aa2c46c 100644
--- a/drivers/infiniband/hw/mlx5/main.c
+++ b/drivers/infiniband/hw/mlx5/main.c
@@ -2087,7 +2087,7 @@ static int mlx5_ib_mmap_clock_info_page(struct mlx5_ib_dev *dev,
 
 	if (vma->vm_flags & (VM_WRITE | VM_EXEC))
 		return -EPERM;
-	vma->vm_flags &= ~VM_MAYWRITE;
+	vm_flags_clear(vma, VM_MAYWRITE);
 
 	if (!dev->mdev->clock_info)
 		return -EOPNOTSUPP;
@@ -2311,7 +2311,7 @@ static int mlx5_ib_mmap(struct ib_ucontext *ibcontext, struct vm_area_struct *vm
 
 		if (vma->vm_flags & VM_WRITE)
 			return -EPERM;
-		vma->vm_flags &= ~VM_MAYWRITE;
+		vm_flags_clear(vma, VM_MAYWRITE);
 
 		/* Don't expose to user-space information it shouldn't have */
 		if (PAGE_SIZE > 4096)
diff --git a/drivers/infiniband/hw/qib/qib_file_ops.c b/drivers/infiniband/hw/qib/qib_file_ops.c
index 3937144b2ae5..80fe92a21f96 100644
--- a/drivers/infiniband/hw/qib/qib_file_ops.c
+++ b/drivers/infiniband/hw/qib/qib_file_ops.c
@@ -733,7 +733,7 @@ static int qib_mmap_mem(struct vm_area_struct *vma, struct qib_ctxtdata *rcd,
 		}
 
 		/* don't allow them to later change with mprotect */
-		vma->vm_flags &= ~VM_MAYWRITE;
+		vm_flags_clear(vma, VM_MAYWRITE);
 	}
 
 	pfn = virt_to_phys(kvaddr) >> PAGE_SHIFT;
@@ -769,7 +769,7 @@ static int mmap_ureg(struct vm_area_struct *vma, struct qib_devdata *dd,
 		phys = dd->physaddr + ureg;
 		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 
-		vma->vm_flags |= VM_DONTCOPY | VM_DONTEXPAND;
+		vm_flags_set(vma, VM_DONTCOPY | VM_DONTEXPAND);
 		ret = io_remap_pfn_range(vma, vma->vm_start,
 					 phys >> PAGE_SHIFT,
 					 vma->vm_end - vma->vm_start,
@@ -810,8 +810,7 @@ static int mmap_piobufs(struct vm_area_struct *vma,
 	 * don't allow them to later change to readable with mprotect (for when
 	 * not initially mapped readable, as is normally the case)
 	 */
-	vma->vm_flags &= ~VM_MAYREAD;
-	vma->vm_flags |= VM_DONTCOPY | VM_DONTEXPAND;
+	vm_flags_mod(vma, VM_DONTCOPY | VM_DONTEXPAND, VM_MAYREAD);
 
 	/* We used PAT if wc_cookie == 0 */
 	if (!dd->wc_cookie)
@@ -852,7 +851,7 @@ static int mmap_rcvegrbufs(struct vm_area_struct *vma,
 		goto bail;
 	}
 	/* don't allow them to later change to writable with mprotect */
-	vma->vm_flags &= ~VM_MAYWRITE;
+	vm_flags_clear(vma, VM_MAYWRITE);
 
 	start = vma->vm_start;
 
@@ -944,7 +943,7 @@ static int mmap_kvaddr(struct vm_area_struct *vma, u64 pgaddr,
 		 * Don't allow permission to later change to writable
 		 * with mprotect.
 		 */
-		vma->vm_flags &= ~VM_MAYWRITE;
+		vm_flags_clear(vma, VM_MAYWRITE);
 	} else
 		goto bail;
 	len = vma->vm_end - vma->vm_start;
@@ -955,7 +954,7 @@ static int mmap_kvaddr(struct vm_area_struct *vma, u64 pgaddr,
 
 	vma->vm_pgoff = (unsigned long) addr >> PAGE_SHIFT;
 	vma->vm_ops = &qib_file_vm_ops;
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
 	ret = 1;
 
 bail:
diff --git a/drivers/infiniband/hw/usnic/usnic_ib_verbs.c b/drivers/infiniband/hw/usnic/usnic_ib_verbs.c
index 6e8c4fbb8083..6289238cc5af 100644
--- a/drivers/infiniband/hw/usnic/usnic_ib_verbs.c
+++ b/drivers/infiniband/hw/usnic/usnic_ib_verbs.c
@@ -672,7 +672,7 @@ int usnic_ib_mmap(struct ib_ucontext *context,
 	usnic_dbg("\n");
 
 	us_ibdev = to_usdev(context->device);
-	vma->vm_flags |= VM_IO;
+	vm_flags_set(vma, VM_IO);
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 	vfid = vma->vm_pgoff;
 	usnic_dbg("Page Offset %lu PAGE_SHIFT %u VFID %u\n",
diff --git a/drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.c b/drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.c
index 19176583dbde..9f54aa90a35a 100644
--- a/drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.c
+++ b/drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.c
@@ -408,7 +408,7 @@ int pvrdma_mmap(struct ib_ucontext *ibcontext, struct vm_area_struct *vma)
 	}
 
 	/* Map UAR to kernel space, VM_LOCKED? */
-	vma->vm_flags |= VM_DONTCOPY | VM_DONTEXPAND;
+	vm_flags_set(vma, VM_DONTCOPY | VM_DONTEXPAND);
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 	if (io_remap_pfn_range(vma, start, context->uar.pfn, size,
 			       vma->vm_page_prot))
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 5f1175f8b349..205d3cac425c 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -293,7 +293,7 @@ static int vb2_dc_mmap(void *buf_priv, struct vm_area_struct *vma)
 		return ret;
 	}
 
-	vma->vm_flags		|= VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_private_data	= &buf->handler;
 	vma->vm_ops		= &vb2_common_vm_ops;
 
diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
index 959b45beb1f3..a6c6d2fcaaa4 100644
--- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
+++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
@@ -185,7 +185,7 @@ static int vb2_vmalloc_mmap(void *buf_priv, struct vm_area_struct *vma)
 	/*
 	 * Make sure that vm_areas for 2 buffers won't be merged together
 	 */
-	vma->vm_flags		|= VM_DONTEXPAND;
+	vm_flags_set(vma, VM_DONTEXPAND);
 
 	/*
 	 * Use common vm_area operations to track buffer refcount.
diff --git a/drivers/media/v4l2-core/videobuf-dma-contig.c b/drivers/media/v4l2-core/videobuf-dma-contig.c
index f2c439359557..4c2ec7a0d804 100644
--- a/drivers/media/v4l2-core/videobuf-dma-contig.c
+++ b/drivers/media/v4l2-core/videobuf-dma-contig.c
@@ -314,7 +314,7 @@ static int __videobuf_mmap_mapper(struct videobuf_queue *q,
 	}
 
 	vma->vm_ops = &videobuf_vm_ops;
-	vma->vm_flags |= VM_DONTEXPAND;
+	vm_flags_set(vma, VM_DONTEXPAND);
 	vma->vm_private_data = map;
 
 	dev_dbg(q->dev, "mmap %p: q=%p %08lx-%08lx (%lx) pgoff %08lx buf %d\n",
diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2-core/videobuf-dma-sg.c
index 234e9f647c96..53001532e8e3 100644
--- a/drivers/media/v4l2-core/videobuf-dma-sg.c
+++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
@@ -630,8 +630,8 @@ static int __videobuf_mmap_mapper(struct videobuf_queue *q,
 	map->count    = 1;
 	map->q        = q;
 	vma->vm_ops   = &videobuf_vm_ops;
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
-	vma->vm_flags &= ~VM_IO; /* using shared anonymous pages */
+	/* using shared anonymous pages */
+	vm_flags_mod(vma, VM_DONTEXPAND | VM_DONTDUMP, VM_IO);
 	vma->vm_private_data = map;
 	dprintk(1, "mmap %p: q=%p %08lx-%08lx pgoff %08lx bufs %d-%d\n",
 		map, q, vma->vm_start, vma->vm_end, vma->vm_pgoff, first, last);
diff --git a/drivers/media/v4l2-core/videobuf-vmalloc.c b/drivers/media/v4l2-core/videobuf-vmalloc.c
index 9b2443720ab0..85c7090606d6 100644
--- a/drivers/media/v4l2-core/videobuf-vmalloc.c
+++ b/drivers/media/v4l2-core/videobuf-vmalloc.c
@@ -247,7 +247,7 @@ static int __videobuf_mmap_mapper(struct videobuf_queue *q,
 	}
 
 	vma->vm_ops          = &videobuf_vm_ops;
-	vma->vm_flags       |= VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_private_data = map;
 
 	dprintk(1, "mmap %p: q=%p %08lx-%08lx (%lx) pgoff %08lx buf %d\n",
diff --git a/drivers/misc/cxl/context.c b/drivers/misc/cxl/context.c
index acaa44809c58..76b5ea66dfa1 100644
--- a/drivers/misc/cxl/context.c
+++ b/drivers/misc/cxl/context.c
@@ -220,7 +220,7 @@ int cxl_context_iomap(struct cxl_context *ctx, struct vm_area_struct *vma)
 	pr_devel("%s: mmio physical: %llx pe: %i master:%i\n", __func__,
 		 ctx->psn_phys, ctx->pe , ctx->master);
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP);
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 	vma->vm_ops = &cxl_mmap_vmops;
 	return 0;
diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/misc/habanalabs/common/memory.c
index 5e9ae7600d75..6bb44a3ad5e6 100644
--- a/drivers/misc/habanalabs/common/memory.c
+++ b/drivers/misc/habanalabs/common/memory.c
@@ -2082,7 +2082,7 @@ static int hl_ts_mmap(struct hl_mmap_mem_buf *buf, struct vm_area_struct *vma, v
 {
 	struct hl_ts_buff *ts_buff = buf->private;
 
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY | VM_NORESERVE;
+	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY | VM_NORESERVE);
 	return remap_vmalloc_range(vma, ts_buff->user_buff_address, 0);
 }
 
diff --git a/drivers/misc/habanalabs/gaudi/gaudi.c b/drivers/misc/habanalabs/gaudi/gaudi.c
index 9f5e208701ba..3b0afdc50ff9 100644
--- a/drivers/misc/habanalabs/gaudi/gaudi.c
+++ b/drivers/misc/habanalabs/gaudi/gaudi.c
@@ -4236,8 +4236,8 @@ static int gaudi_mmap(struct hl_device *hdev, struct vm_area_struct *vma,
 {
 	int rc;
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
-			VM_DONTCOPY | VM_NORESERVE;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
+			VM_DONTCOPY | VM_NORESERVE);
 
 	rc = dma_mmap_coherent(hdev->dev, vma, cpu_addr,
 				(dma_addr - HOST_PHYS_BASE), size);
diff --git a/drivers/misc/habanalabs/gaudi2/gaudi2.c b/drivers/misc/habanalabs/gaudi2/gaudi2.c
index e793fb2bdcbe..65502ec02bc0 100644
--- a/drivers/misc/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/misc/habanalabs/gaudi2/gaudi2.c
@@ -5538,8 +5538,8 @@ static int gaudi2_mmap(struct hl_device *hdev, struct vm_area_struct *vma,
 {
 	int rc;
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
-			VM_DONTCOPY | VM_NORESERVE;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
+			VM_DONTCOPY | VM_NORESERVE);
 
 #ifdef _HAS_DMA_MMAP_COHERENT
 
@@ -10116,8 +10116,8 @@ static int gaudi2_block_mmap(struct hl_device *hdev, struct vm_area_struct *vma,
 
 	address = pci_resource_start(hdev->pdev, SRAM_CFG_BAR_ID) + offset_in_bar;
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
-			VM_DONTCOPY | VM_NORESERVE;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
+			VM_DONTCOPY | VM_NORESERVE);
 
 	rc = remap_pfn_range(vma, vma->vm_start, address >> PAGE_SHIFT,
 			block_size, vma->vm_page_prot);
diff --git a/drivers/misc/habanalabs/goya/goya.c b/drivers/misc/habanalabs/goya/goya.c
index 0f083fcf81a6..2a15a305d01b 100644
--- a/drivers/misc/habanalabs/goya/goya.c
+++ b/drivers/misc/habanalabs/goya/goya.c
@@ -2880,8 +2880,8 @@ static int goya_mmap(struct hl_device *hdev, struct vm_area_struct *vma,
 {
 	int rc;
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
-			VM_DONTCOPY | VM_NORESERVE;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
+			VM_DONTCOPY | VM_NORESERVE);
 
 	rc = dma_mmap_coherent(hdev->dev, vma, cpu_addr,
 				(dma_addr - HOST_PHYS_BASE), size);
diff --git a/drivers/misc/ocxl/context.c b/drivers/misc/ocxl/context.c
index 9eb0d93b01c6..7f83116ae11a 100644
--- a/drivers/misc/ocxl/context.c
+++ b/drivers/misc/ocxl/context.c
@@ -180,7 +180,7 @@ static int check_mmap_afu_irq(struct ocxl_context *ctx,
 	if ((vma->vm_flags & VM_READ) || (vma->vm_flags & VM_EXEC) ||
 		!(vma->vm_flags & VM_WRITE))
 		return -EINVAL;
-	vma->vm_flags &= ~(VM_MAYREAD | VM_MAYEXEC);
+	vm_flags_clear(vma, VM_MAYREAD | VM_MAYEXEC);
 	return 0;
 }
 
@@ -204,7 +204,7 @@ int ocxl_context_mmap(struct ocxl_context *ctx, struct vm_area_struct *vma)
 	if (rc)
 		return rc;
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP);
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 	vma->vm_ops = &ocxl_vmops;
 	return 0;
diff --git a/drivers/misc/ocxl/sysfs.c b/drivers/misc/ocxl/sysfs.c
index 25c78df8055d..405180d47d9b 100644
--- a/drivers/misc/ocxl/sysfs.c
+++ b/drivers/misc/ocxl/sysfs.c
@@ -134,7 +134,7 @@ static int global_mmio_mmap(struct file *filp, struct kobject *kobj,
 		(afu->config.global_mmio_size >> PAGE_SHIFT))
 		return -EINVAL;
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP);
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 	vma->vm_ops = &global_mmio_vmops;
 	vma->vm_private_data = afu;
diff --git a/drivers/misc/open-dice.c b/drivers/misc/open-dice.c
index 9dda47b3fd70..7be4e6c9f120 100644
--- a/drivers/misc/open-dice.c
+++ b/drivers/misc/open-dice.c
@@ -95,12 +95,12 @@ static int open_dice_mmap(struct file *filp, struct vm_area_struct *vma)
 		if (vma->vm_flags & VM_WRITE)
 			return -EPERM;
 		/* Ensure userspace cannot acquire VM_WRITE later. */
-		vma->vm_flags &= ~VM_MAYWRITE;
+		vm_flags_clear(vma, VM_MAYSHARE);
 	}
 
 	/* Create write-combine mapping so all clients observe a wipe. */
 	vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-	vma->vm_flags |= VM_DONTCOPY | VM_DONTDUMP;
+	vm_flags_set(vma, VM_DONTCOPY | VM_DONTDUMP);
 	return vm_iomap_memory(vma, drvdata->rmem->base, drvdata->rmem->size);
 }
 
diff --git a/drivers/misc/sgi-gru/grufile.c b/drivers/misc/sgi-gru/grufile.c
index 7ffcfc0bb587..a3d659c11cc4 100644
--- a/drivers/misc/sgi-gru/grufile.c
+++ b/drivers/misc/sgi-gru/grufile.c
@@ -101,8 +101,8 @@ static int gru_file_mmap(struct file *file, struct vm_area_struct *vma)
 				vma->vm_end & (GRU_GSEG_PAGESIZE - 1))
 		return -EINVAL;
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP | VM_LOCKED |
-			 VM_DONTCOPY | VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_LOCKED |
+			 VM_DONTCOPY | VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_page_prot = PAGE_SHARED;
 	vma->vm_ops = &gru_vm_ops;
 
diff --git a/drivers/misc/uacce/uacce.c b/drivers/misc/uacce/uacce.c
index 905eff1f840e..b65ab440a19e 100644
--- a/drivers/misc/uacce/uacce.c
+++ b/drivers/misc/uacce/uacce.c
@@ -229,7 +229,7 @@ static int uacce_fops_mmap(struct file *filep, struct vm_area_struct *vma)
 	if (!qfr)
 		return -ENOMEM;
 
-	vma->vm_flags |= VM_DONTCOPY | VM_DONTEXPAND | VM_WIPEONFORK;
+	vm_flags_set(vma, VM_DONTCOPY | VM_DONTEXPAND | VM_WIPEONFORK);
 	vma->vm_ops = &uacce_vm_ops;
 	vma->vm_private_data = q;
 	qfr->type = type;
diff --git a/drivers/sbus/char/oradax.c b/drivers/sbus/char/oradax.c
index 21b7cb6e7e70..e300cf26bc2a 100644
--- a/drivers/sbus/char/oradax.c
+++ b/drivers/sbus/char/oradax.c
@@ -389,7 +389,7 @@ static int dax_devmap(struct file *f, struct vm_area_struct *vma)
 	/* completion area is mapped read-only for user */
 	if (vma->vm_flags & VM_WRITE)
 		return -EPERM;
-	vma->vm_flags &= ~VM_MAYWRITE;
+	vm_flags_clear(vma, VM_MAYWRITE);
 
 	if (remap_pfn_range(vma, vma->vm_start, ctx->ca_buf_ra >> PAGE_SHIFT,
 			    len, vma->vm_page_prot))
diff --git a/drivers/scsi/cxlflash/ocxl_hw.c b/drivers/scsi/cxlflash/ocxl_hw.c
index 631eda2d467e..6542818e595a 100644
--- a/drivers/scsi/cxlflash/ocxl_hw.c
+++ b/drivers/scsi/cxlflash/ocxl_hw.c
@@ -1167,7 +1167,7 @@ static int afu_mmap(struct file *file, struct vm_area_struct *vma)
 	    (ctx->psn_size >> PAGE_SHIFT))
 		return -EINVAL;
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP);
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 	vma->vm_ops = &ocxlflash_vmops;
 	return 0;
diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
index ff9854f59964..a91049213203 100644
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -1288,7 +1288,7 @@ sg_mmap(struct file *filp, struct vm_area_struct *vma)
 	}
 
 	sfp->mmap_called = 1;
-	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_private_data = sfp;
 	vma->vm_ops = &sg_mmap_vm_ops;
 out:
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 5e53eed8ae95..095cd0ba8c21 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -1072,7 +1072,7 @@ int hmm_bo_mmap(struct vm_area_struct *vma, struct hmm_buffer_object *bo)
 	vma->vm_private_data = bo;
 
 	vma->vm_ops = &hmm_bo_vm_ops;
-	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP);
 
 	/*
 	 * call hmm_bo_vm_open explicitly.
diff --git a/drivers/staging/media/deprecated/meye/meye.c b/drivers/staging/media/deprecated/meye/meye.c
index 5d87efd9b95c..746c6ea1c0a7 100644
--- a/drivers/staging/media/deprecated/meye/meye.c
+++ b/drivers/staging/media/deprecated/meye/meye.c
@@ -1476,8 +1476,8 @@ static int meye_mmap(struct file *file, struct vm_area_struct *vma)
 	}
 
 	vma->vm_ops = &meye_vm_ops;
-	vma->vm_flags &= ~VM_IO;	/* not I/O memory */
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	/* not I/O memory */
+	vm_flags_mod(vma, VM_DONTEXPAND | VM_DONTDUMP, VM_IO);
 	vma->vm_private_data = (void *) (offset / gbufsize);
 	meye_vm_open(vma);
 
diff --git a/drivers/staging/media/deprecated/stkwebcam/stk-webcam.c b/drivers/staging/media/deprecated/stkwebcam/stk-webcam.c
index 787edb3d47c2..a1b7ad350a90 100644
--- a/drivers/staging/media/deprecated/stkwebcam/stk-webcam.c
+++ b/drivers/staging/media/deprecated/stkwebcam/stk-webcam.c
@@ -779,7 +779,7 @@ static int v4l_stk_mmap(struct file *fp, struct vm_area_struct *vma)
 	ret = remap_vmalloc_range(vma, sbuf->buffer, 0);
 	if (ret)
 		return ret;
-	vma->vm_flags |= VM_DONTEXPAND;
+	vm_flags_set(vma, VM_DONTEXPAND);
 	vma->vm_private_data = sbuf;
 	vma->vm_ops = &stk_v4l_vm_ops;
 	sbuf->v4lbuf.flags |= V4L2_BUF_FLAG_MAPPED;
diff --git a/drivers/target/target_core_user.c b/drivers/target/target_core_user.c
index 2940559c3086..15ffc8d2ac7b 100644
--- a/drivers/target/target_core_user.c
+++ b/drivers/target/target_core_user.c
@@ -1928,7 +1928,7 @@ static int tcmu_mmap(struct uio_info *info, struct vm_area_struct *vma)
 {
 	struct tcmu_dev *udev = container_of(info, struct tcmu_dev, uio_info);
 
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_ops = &tcmu_vm_ops;
 
 	vma->vm_private_data = udev;
diff --git a/drivers/uio/uio.c b/drivers/uio/uio.c
index 43afbb7c5ab9..62082d64ece0 100644
--- a/drivers/uio/uio.c
+++ b/drivers/uio/uio.c
@@ -713,7 +713,7 @@ static const struct vm_operations_struct uio_logical_vm_ops = {
 
 static int uio_mmap_logical(struct vm_area_struct *vma)
 {
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_ops = &uio_logical_vm_ops;
 	return 0;
 }
diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 837f3e57f580..e501a03d6c70 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -279,8 +279,7 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
 		}
 	}
 
-	vma->vm_flags |= VM_IO;
-	vma->vm_flags |= (VM_DONTEXPAND | VM_DONTDUMP);
+	vm_flags_set(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_ops = &usbdev_vm_ops;
 	vma->vm_private_data = usbm;
 
diff --git a/drivers/usb/mon/mon_bin.c b/drivers/usb/mon/mon_bin.c
index 094e812e9e69..abb1cd35d8a6 100644
--- a/drivers/usb/mon/mon_bin.c
+++ b/drivers/usb/mon/mon_bin.c
@@ -1272,8 +1272,7 @@ static int mon_bin_mmap(struct file *filp, struct vm_area_struct *vma)
 	if (vma->vm_flags & VM_WRITE)
 		return -EPERM;
 
-	vma->vm_flags &= ~VM_MAYWRITE;
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_mod(vma, VM_DONTEXPAND | VM_DONTDUMP, VM_MAYWRITE);
 	vma->vm_private_data = filp->private_data;
 	mon_bin_vma_open(vma);
 	return 0;
diff --git a/drivers/vdpa/vdpa_user/iova_domain.c b/drivers/vdpa/vdpa_user/iova_domain.c
index e682bc7ee6c9..5e4a77b9bae6 100644
--- a/drivers/vdpa/vdpa_user/iova_domain.c
+++ b/drivers/vdpa/vdpa_user/iova_domain.c
@@ -512,7 +512,7 @@ static int vduse_domain_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct vduse_iova_domain *domain = file->private_data;
 
-	vma->vm_flags |= VM_DONTDUMP | VM_DONTEXPAND;
+	vm_flags_set(vma, VM_DONTDUMP | VM_DONTEXPAND);
 	vma->vm_private_data = domain;
 	vma->vm_ops = &vduse_domain_mmap_ops;
 
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 26a541cc64d1..c49f8f2b2865 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1799,7 +1799,7 @@ int vfio_pci_core_mmap(struct vfio_device *core_vdev, struct vm_area_struct *vma
 	 * See remap_pfn_range(), called from vfio_pci_fault() but we can't
 	 * change vm_flags within the fault handler.  Set them now.
 	 */
-	vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_ops = &vfio_pci_mmap_ops;
 
 	return 0;
diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index ec32f785dfde..9c5010ee20da 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -1315,7 +1315,7 @@ static int vhost_vdpa_mmap(struct file *file, struct vm_area_struct *vma)
 	if (vma->vm_end - vma->vm_start != notify.size)
 		return -ENOTSUPP;
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_ops = &vhost_vdpa_vm_ops;
 	return 0;
 }
diff --git a/drivers/video/fbdev/68328fb.c b/drivers/video/fbdev/68328fb.c
index 7db03ed77c76..41df61b37a18 100644
--- a/drivers/video/fbdev/68328fb.c
+++ b/drivers/video/fbdev/68328fb.c
@@ -391,7 +391,7 @@ static int mc68x328fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 #ifndef MMU
 	/* this is uClinux (no MMU) specific code */
 
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_start = videomemory;
 
 	return 0;
diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index c730253ab85c..dc310c7b5769 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -232,9 +232,9 @@ static const struct address_space_operations fb_deferred_io_aops = {
 int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	vma->vm_ops = &fb_deferred_io_vm_ops;
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
 	if (!(info->flags & FBINFO_VIRTFB))
-		vma->vm_flags |= VM_IO;
+		vm_flags_set(vma, VM_IO);
 	vma->vm_private_data = info;
 	return 0;
 }
diff --git a/drivers/xen/gntalloc.c b/drivers/xen/gntalloc.c
index a15729beb9d1..26ffb8755ffb 100644
--- a/drivers/xen/gntalloc.c
+++ b/drivers/xen/gntalloc.c
@@ -525,7 +525,7 @@ static int gntalloc_mmap(struct file *filp, struct vm_area_struct *vma)
 
 	vma->vm_private_data = vm_priv;
 
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
 
 	vma->vm_ops = &gntalloc_vmops;
 
diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 4d9a3050de6a..61faea1f0663 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -1055,10 +1055,10 @@ static int gntdev_mmap(struct file *flip, struct vm_area_struct *vma)
 
 	vma->vm_ops = &gntdev_vmops;
 
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP | VM_MIXEDMAP;
+	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP | VM_MIXEDMAP);
 
 	if (use_ptemod)
-		vma->vm_flags |= VM_DONTCOPY;
+		vm_flags_set(vma, VM_DONTCOPY);
 
 	vma->vm_private_data = map;
 	if (map->flags) {
diff --git a/drivers/xen/privcmd-buf.c b/drivers/xen/privcmd-buf.c
index dd5bbb6e1b6b..2fa10ca5be14 100644
--- a/drivers/xen/privcmd-buf.c
+++ b/drivers/xen/privcmd-buf.c
@@ -156,7 +156,7 @@ static int privcmd_buf_mmap(struct file *file, struct vm_area_struct *vma)
 	vma_priv->file_priv = file_priv;
 	vma_priv->users = 1;
 
-	vma->vm_flags |= VM_IO | VM_DONTEXPAND;
+	vm_flags_set(vma, VM_IO | VM_DONTEXPAND);
 	vma->vm_ops = &privcmd_buf_vm_ops;
 	vma->vm_private_data = vma_priv;
 
diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 1edf45ee9890..e2f580e30a86 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -934,8 +934,8 @@ static int privcmd_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	/* DONTCOPY is essential for Xen because copy_page_range doesn't know
 	 * how to recreate these mappings */
-	vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTCOPY |
-			 VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTCOPY |
+			 VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_ops = &privcmd_vm_ops;
 	vma->vm_private_data = NULL;
 
diff --git a/fs/aio.c b/fs/aio.c
index 650cd795aa7e..31a16cc0a18d 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -392,7 +392,7 @@ static const struct vm_operations_struct aio_ring_vm_ops = {
 
 static int aio_ring_mmap(struct file *file, struct vm_area_struct *vma)
 {
-	vma->vm_flags |= VM_DONTEXPAND;
+	vm_flags_set(vma, VM_DONTEXPAND);
 	vma->vm_ops = &aio_ring_vm_ops;
 	return 0;
 }
diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
index 50e4e060db68..45a65c400bd0 100644
--- a/fs/cramfs/inode.c
+++ b/fs/cramfs/inode.c
@@ -408,7 +408,7 @@ static int cramfs_physmem_mmap(struct file *file, struct vm_area_struct *vma)
 		 * unpopulated ptes via cramfs_read_folio().
 		 */
 		int i;
-		vma->vm_flags |= VM_MIXEDMAP;
+		vm_flags_set(vma, VM_MIXEDMAP);
 		for (i = 0; i < pages && !ret; i++) {
 			vm_fault_t vmf;
 			unsigned long off = i * PAGE_SIZE;
diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index f57f921683d7..f32d65987578 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -429,7 +429,7 @@ static int erofs_file_mmap(struct file *file, struct vm_area_struct *vma)
 		return -EINVAL;
 
 	vma->vm_ops = &erofs_dax_vm_ops;
-	vma->vm_flags |= VM_HUGEPAGE;
+	vm_flags_set(vma, VM_HUGEPAGE);
 	return 0;
 }
 #else
diff --git a/fs/exec.c b/fs/exec.c
index c0df813d2b45..d2e2a15e5cfe 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -270,7 +270,7 @@ static int __bprm_mm_init(struct linux_binprm *bprm)
 	BUILD_BUG_ON(VM_STACK_FLAGS & VM_STACK_INCOMPLETE_SETUP);
 	vma->vm_end = STACK_TOP_MAX;
 	vma->vm_start = vma->vm_end - PAGE_SIZE;
-	vma->vm_flags = VM_SOFTDIRTY | VM_STACK_FLAGS | VM_STACK_INCOMPLETE_SETUP;
+	vm_flags_init(vma, VM_SOFTDIRTY | VM_STACK_FLAGS | VM_STACK_INCOMPLETE_SETUP);
 	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 
 	err = insert_vm_struct(mm, vma);
@@ -834,7 +834,7 @@ int setup_arg_pages(struct linux_binprm *bprm,
 	}
 
 	/* mprotect_fixup is overkill to remove the temporary stack flags */
-	vma->vm_flags &= ~VM_STACK_INCOMPLETE_SETUP;
+	vm_flags_clear(vma, VM_STACK_INCOMPLETE_SETUP);
 
 	stack_expand = 131072UL; /* randomly 32*4k (or 2*64k) pages */
 	stack_size = vma->vm_end - vma->vm_start;
diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index 7ac0a81bd371..6bdf61a62c79 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -801,7 +801,7 @@ static int ext4_file_mmap(struct file *file, struct vm_area_struct *vma)
 	file_accessed(file);
 	if (IS_DAX(file_inode(file))) {
 		vma->vm_ops = &ext4_dax_vm_ops;
-		vma->vm_flags |= VM_HUGEPAGE;
+		vm_flags_set(vma, VM_HUGEPAGE);
 	} else {
 		vma->vm_ops = &ext4_file_vm_ops;
 	}
diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index e23e802a8013..8e74f278a3f6 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -860,7 +860,7 @@ int fuse_dax_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	file_accessed(file);
 	vma->vm_ops = &fuse_dax_vm_ops;
-	vma->vm_flags |= VM_MIXEDMAP | VM_HUGEPAGE;
+	vm_flags_set(vma, VM_MIXEDMAP | VM_HUGEPAGE);
 	return 0;
 }
 
diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 43af1753de5f..cfd09f95551b 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -132,7 +132,7 @@ static int hugetlbfs_file_mmap(struct file *file, struct vm_area_struct *vma)
 	 * way when do_mmap unwinds (may be important on powerpc
 	 * and ia64).
 	 */
-	vma->vm_flags |= VM_HUGETLB | VM_DONTEXPAND;
+	vm_flags_set(vma, VM_HUGETLB | VM_DONTEXPAND);
 	vma->vm_ops = &hugetlb_vm_ops;
 
 	ret = seal_check_future_write(info->seals, vma);
@@ -811,7 +811,7 @@ static long hugetlbfs_fallocate(struct file *file, int mode, loff_t offset,
 	 * as input to create an allocation policy.
 	 */
 	vma_init(&pseudo_vma, mm);
-	pseudo_vma.vm_flags = (VM_HUGETLB | VM_MAYSHARE | VM_SHARED);
+	vm_flags_init(&pseudo_vma, VM_HUGETLB | VM_MAYSHARE | VM_SHARED);
 	pseudo_vma.vm_file = file;
 
 	for (index = start; index < end; index++) {
diff --git a/fs/orangefs/file.c b/fs/orangefs/file.c
index 167fa43b24f9..a5e1ea8b7119 100644
--- a/fs/orangefs/file.c
+++ b/fs/orangefs/file.c
@@ -389,8 +389,7 @@ static int orangefs_file_mmap(struct file *file, struct vm_area_struct *vma)
 		     "orangefs_file_mmap: called on %pD\n", file);
 
 	/* set the sequential readahead hint */
-	vma->vm_flags |= VM_SEQ_READ;
-	vma->vm_flags &= ~VM_RAND_READ;
+	vm_flags_mod(vma, VM_SEQ_READ, VM_RAND_READ);
 
 	file_accessed(file);
 	vma->vm_ops = &orangefs_file_vm_ops;
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index f937c4cd0214..5dc9940f33b1 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1301,7 +1301,7 @@ static ssize_t clear_refs_write(struct file *file, const char __user *buf,
 			for_each_vma(vmi, vma) {
 				if (!(vma->vm_flags & VM_SOFTDIRTY))
 					continue;
-				vma->vm_flags &= ~VM_SOFTDIRTY;
+				vm_flags_clear(vma, VM_SOFTDIRTY);
 				vma_set_page_prot(vma);
 			}
 
diff --git a/fs/proc/vmcore.c b/fs/proc/vmcore.c
index 09a81e4b1273..12af614f33ce 100644
--- a/fs/proc/vmcore.c
+++ b/fs/proc/vmcore.c
@@ -582,8 +582,7 @@ static int mmap_vmcore(struct file *file, struct vm_area_struct *vma)
 	if (vma->vm_flags & (VM_WRITE | VM_EXEC))
 		return -EPERM;
 
-	vma->vm_flags &= ~(VM_MAYWRITE | VM_MAYEXEC);
-	vma->vm_flags |= VM_MIXEDMAP;
+	vm_flags_mod(vma, VM_MIXEDMAP, VM_MAYWRITE | VM_MAYEXEC);
 	vma->vm_ops = &vmcore_mmap_ops;
 
 	len = 0;
diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index f3c75c6222de..44d1ee429eb0 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -113,7 +113,7 @@ static void userfaultfd_set_vm_flags(struct vm_area_struct *vma,
 {
 	const bool uffd_wp_changed = (vma->vm_flags ^ flags) & VM_UFFD_WP;
 
-	vma->vm_flags = flags;
+	vm_flags_reset(vma, flags);
 	/*
 	 * For shared mappings, we want to enable writenotify while
 	 * userfaultfd-wp is enabled (see vma_wants_writenotify()). We'll simply
diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 595a5bcf46b9..b0039a8fea2e 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -1429,7 +1429,7 @@ xfs_file_mmap(
 	file_accessed(file);
 	vma->vm_ops = &xfs_file_vm_ops;
 	if (IS_DAX(inode))
-		vma->vm_flags |= VM_HUGEPAGE;
+		vm_flags_set(vma, VM_HUGEPAGE);
 	return 0;
 }
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index ad4fdb9405ba..3c7fc3ecaece 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3667,7 +3667,7 @@ static inline int seal_check_future_write(int seals, struct vm_area_struct *vma)
 		 * VM_MAYWRITE as we still want them to be COW-writable.
 		 */
 		if (vma->vm_flags & VM_SHARED)
-			vma->vm_flags &= ~(VM_MAYWRITE);
+			vm_flags_clear(vma, VM_MAYWRITE);
 	}
 
 	return 0;
diff --git a/kernel/bpf/ringbuf.c b/kernel/bpf/ringbuf.c
index 80f4b4d88aaf..8732e0aadf36 100644
--- a/kernel/bpf/ringbuf.c
+++ b/kernel/bpf/ringbuf.c
@@ -269,7 +269,7 @@ static int ringbuf_map_mmap_kern(struct bpf_map *map, struct vm_area_struct *vma
 		if (vma->vm_pgoff != 0 || vma->vm_end - vma->vm_start != PAGE_SIZE)
 			return -EPERM;
 	} else {
-		vma->vm_flags &= ~VM_MAYWRITE;
+		vm_flags_clear(vma, VM_MAYWRITE);
 	}
 	/* remap_vmalloc_range() checks size and offset constraints */
 	return remap_vmalloc_range(vma, rb_map->rb,
@@ -290,7 +290,7 @@ static int ringbuf_map_mmap_user(struct bpf_map *map, struct vm_area_struct *vma
 			 */
 			return -EPERM;
 	} else {
-		vma->vm_flags &= ~VM_MAYWRITE;
+		vm_flags_clear(vma, VM_MAYWRITE);
 	}
 	/* remap_vmalloc_range() checks size and offset constraints */
 	return remap_vmalloc_range(vma, rb_map->rb, vma->vm_pgoff + RINGBUF_PGOFF);
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 64131f88c553..9f56b442daa9 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -882,10 +882,10 @@ static int bpf_map_mmap(struct file *filp, struct vm_area_struct *vma)
 	/* set default open/close callbacks */
 	vma->vm_ops = &bpf_map_default_vmops;
 	vma->vm_private_data = map;
-	vma->vm_flags &= ~VM_MAYEXEC;
+	vm_flags_clear(vma, VM_MAYEXEC);
 	if (!(vma->vm_flags & VM_WRITE))
 		/* disallow re-mapping with PROT_WRITE */
-		vma->vm_flags &= ~VM_MAYWRITE;
+		vm_flags_clear(vma, VM_MAYWRITE);
 
 	err = map->ops->map_mmap(map, vma);
 	if (err)
diff --git a/kernel/events/core.c b/kernel/events/core.c
index d56328e5080e..55a82f12a42c 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6573,7 +6573,7 @@ static int perf_mmap(struct file *file, struct vm_area_struct *vma)
 	 * Since pinned accounting is per vm we cannot allow fork() to copy our
 	 * vma.
 	 */
-	vma->vm_flags |= VM_DONTCOPY | VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_DONTCOPY | VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_ops = &perf_mmap_vmops;
 
 	if (event->pmu->event_mapped)
diff --git a/kernel/kcov.c b/kernel/kcov.c
index e5cd09fd8a05..84c717337df0 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -489,7 +489,7 @@ static int kcov_mmap(struct file *filep, struct vm_area_struct *vma)
 		goto exit;
 	}
 	spin_unlock_irqrestore(&kcov->lock, flags);
-	vma->vm_flags |= VM_DONTEXPAND;
+	vm_flags_set(vma, VM_DONTEXPAND);
 	for (off = 0; off < size; off += PAGE_SIZE) {
 		page = vmalloc_to_page(kcov->area + off);
 		res = vm_insert_page(vma, vma->vm_start + off, page);
diff --git a/kernel/relay.c b/kernel/relay.c
index ef12532168d9..9aa70ae53d24 100644
--- a/kernel/relay.c
+++ b/kernel/relay.c
@@ -91,7 +91,7 @@ static int relay_mmap_buf(struct rchan_buf *buf, struct vm_area_struct *vma)
 		return -EINVAL;
 
 	vma->vm_ops = &relay_file_mmap_ops;
-	vma->vm_flags |= VM_DONTEXPAND;
+	vm_flags_set(vma, VM_DONTEXPAND);
 	vma->vm_private_data = buf;
 
 	return 0;
diff --git a/mm/madvise.c b/mm/madvise.c
index ca672e37b38c..5a5a687d03c2 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -176,7 +176,7 @@ static int madvise_update_vma(struct vm_area_struct *vma,
 	/*
 	 * vm_flags is protected by the mmap_lock held in write mode.
 	 */
-	vma->vm_flags = new_flags;
+	vm_flags_reset(vma, new_flags);
 	if (!vma->vm_file || vma_is_anon_shmem(vma)) {
 		error = replace_anon_vma_name(vma, anon_name);
 		if (error)
diff --git a/mm/memory.c b/mm/memory.c
index ec833a2e0601..a6316cda0e87 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1928,7 +1928,7 @@ int vm_insert_pages(struct vm_area_struct *vma, unsigned long addr,
 	if (!(vma->vm_flags & VM_MIXEDMAP)) {
 		BUG_ON(mmap_read_trylock(vma->vm_mm));
 		BUG_ON(vma->vm_flags & VM_PFNMAP);
-		vma->vm_flags |= VM_MIXEDMAP;
+		vm_flags_set(vma, VM_MIXEDMAP);
 	}
 	/* Defer page refcount checking till we're about to map that page. */
 	return insert_pages(vma, addr, pages, num, vma->vm_page_prot);
@@ -1986,7 +1986,7 @@ int vm_insert_page(struct vm_area_struct *vma, unsigned long addr,
 	if (!(vma->vm_flags & VM_MIXEDMAP)) {
 		BUG_ON(mmap_read_trylock(vma->vm_mm));
 		BUG_ON(vma->vm_flags & VM_PFNMAP);
-		vma->vm_flags |= VM_MIXEDMAP;
+		vm_flags_set(vma, VM_MIXEDMAP);
 	}
 	return insert_page(vma, addr, page, vma->vm_page_prot);
 }
@@ -2452,7 +2452,7 @@ int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long addr,
 		vma->vm_pgoff = pfn;
 	}
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
 
 	BUG_ON(addr >= end);
 	pfn -= addr >> PAGE_SHIFT;
diff --git a/mm/mlock.c b/mm/mlock.c
index 5c4fff93cd6b..ed49459e343e 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -380,7 +380,7 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
 	 */
 	if (newflags & VM_LOCKED)
 		newflags |= VM_IO;
-	WRITE_ONCE(vma->vm_flags, newflags);
+	vm_flags_reset(vma, newflags);
 
 	lru_add_drain();
 	walk_page_range(vma->vm_mm, start, end, &mlock_walk_ops, NULL);
@@ -388,7 +388,7 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
 
 	if (newflags & VM_IO) {
 		newflags &= ~VM_IO;
-		WRITE_ONCE(vma->vm_flags, newflags);
+		vm_flags_reset(vma, newflags);
 	}
 }
 
@@ -457,7 +457,7 @@ static int mlock_fixup(struct vma_iterator *vmi, struct vm_area_struct *vma,
 
 	if ((newflags & VM_LOCKED) && (oldflags & VM_LOCKED)) {
 		/* No work to do, and mlocking twice would be wrong */
-		vma->vm_flags = newflags;
+		vm_flags_reset(vma, newflags);
 	} else {
 		mlock_vma_pages_range(vma, start, end, newflags);
 	}
diff --git a/mm/mmap.c b/mm/mmap.c
index fa3cbd625850..3d9b14d5f933 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2558,7 +2558,7 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 	vma_iter_set(&vmi, addr);
 	vma->vm_start = addr;
 	vma->vm_end = end;
-	vma->vm_flags = vm_flags;
+	vm_flags_init(vma, vm_flags);
 	vma->vm_page_prot = vm_get_page_prot(vm_flags);
 	vma->vm_pgoff = pgoff;
 
@@ -2686,7 +2686,7 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 	 * then new mapped in-place (which must be aimed as
 	 * a completely new data area).
 	 */
-	vma->vm_flags |= VM_SOFTDIRTY;
+	vm_flags_set(vma, VM_SOFTDIRTY);
 
 	vma_set_page_prot(vma);
 
@@ -2911,7 +2911,7 @@ static int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
 		init_vma_prep(&vp, vma);
 		vma_prepare(&vp);
 		vma->vm_end = addr + len;
-		vma->vm_flags |= VM_SOFTDIRTY;
+		vm_flags_set(vma, VM_SOFTDIRTY);
 		vma_iter_store(vmi, vma);
 
 		vma_complete(&vp, vmi, mm);
@@ -2928,7 +2928,7 @@ static int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	vma->vm_start = addr;
 	vma->vm_end = addr + len;
 	vma->vm_pgoff = addr >> PAGE_SHIFT;
-	vma->vm_flags = flags;
+	vm_flags_init(vma, flags);
 	vma->vm_page_prot = vm_get_page_prot(flags);
 	if (vma_iter_store_gfp(vmi, vma, GFP_KERNEL))
 		goto mas_store_fail;
@@ -2940,7 +2940,7 @@ static int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	mm->data_vm += len >> PAGE_SHIFT;
 	if (flags & VM_LOCKED)
 		mm->locked_vm += (len >> PAGE_SHIFT);
-	vma->vm_flags |= VM_SOFTDIRTY;
+	vm_flags_set(vma, VM_SOFTDIRTY);
 	validate_mm(mm);
 	return 0;
 
diff --git a/mm/mprotect.c b/mm/mprotect.c
index cce6a0e58fb5..1d4843c97c2a 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -670,7 +670,7 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
 	 * vm_flags and vm_page_prot are protected by the mmap_lock
 	 * held in write mode.
 	 */
-	vma->vm_flags = newflags;
+	vm_flags_reset(vma, newflags);
 	if (vma_wants_manual_pte_write_upgrade(vma))
 		mm_cp_flags |= MM_CP_TRY_CHANGE_WRITABLE;
 	vma_set_page_prot(vma);
diff --git a/mm/mremap.c b/mm/mremap.c
index 55157b990091..78be93d97a28 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -662,7 +662,7 @@ static unsigned long move_vma(struct vm_area_struct *vma,
 
 	/* Conceal VM_ACCOUNT so old reservation is not undone */
 	if (vm_flags & VM_ACCOUNT && !(flags & MREMAP_DONTUNMAP)) {
-		vma->vm_flags &= ~VM_ACCOUNT;
+		vm_flags_clear(vma, VM_ACCOUNT);
 		if (vma->vm_start < old_addr)
 			account_start = vma->vm_start;
 		if (vma->vm_end > old_addr + old_len)
@@ -718,12 +718,12 @@ static unsigned long move_vma(struct vm_area_struct *vma,
 	/* Restore VM_ACCOUNT if one or two pieces of vma left */
 	if (account_start) {
 		vma = vma_prev(&vmi);
-		vma->vm_flags |= VM_ACCOUNT;
+		vm_flags_set(vma, VM_ACCOUNT);
 	}
 
 	if (account_end) {
 		vma = vma_next(&vmi);
-		vma->vm_flags |= VM_ACCOUNT;
+		vm_flags_set(vma, VM_ACCOUNT);
 	}
 
 	return new_addr;
diff --git a/mm/nommu.c b/mm/nommu.c
index 9a166738909e..57ba243c6a37 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -173,7 +173,7 @@ static void *__vmalloc_user_flags(unsigned long size, gfp_t flags)
 		mmap_write_lock(current->mm);
 		vma = find_vma(current->mm, (unsigned long)ret);
 		if (vma)
-			vma->vm_flags |= VM_USERMAP;
+			vm_flags_set(vma, VM_USERMAP);
 		mmap_write_unlock(current->mm);
 	}
 
@@ -950,7 +950,8 @@ static int do_mmap_private(struct vm_area_struct *vma,
 
 	atomic_long_add(total, &mmap_pages_allocated);
 
-	region->vm_flags = vma->vm_flags |= VM_MAPPED_COPY;
+	vm_flags_set(vma, VM_MAPPED_COPY);
+	region->vm_flags = vma->vm_flags;
 	region->vm_start = (unsigned long) base;
 	region->vm_end   = region->vm_start + len;
 	region->vm_top   = region->vm_start + (total << PAGE_SHIFT);
@@ -1047,7 +1048,7 @@ unsigned long do_mmap(struct file *file,
 	region->vm_flags = vm_flags;
 	region->vm_pgoff = pgoff;
 
-	vma->vm_flags = vm_flags;
+	vm_flags_init(vma, vm_flags);
 	vma->vm_pgoff = pgoff;
 
 	if (file) {
@@ -1111,7 +1112,7 @@ unsigned long do_mmap(struct file *file,
 			vma->vm_end = start + len;
 
 			if (pregion->vm_flags & VM_MAPPED_COPY)
-				vma->vm_flags |= VM_MAPPED_COPY;
+				vm_flags_set(vma, VM_MAPPED_COPY);
 			else {
 				ret = do_mmap_shared_file(vma);
 				if (ret < 0) {
@@ -1601,7 +1602,7 @@ int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
 	if (addr != (pfn << PAGE_SHIFT))
 		return -EINVAL;
 
-	vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
 	return 0;
 }
 EXPORT_SYMBOL(remap_pfn_range);
diff --git a/mm/secretmem.c b/mm/secretmem.c
index be3fff86ba00..8453ada8f41d 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -128,7 +128,7 @@ static int secretmem_mmap(struct file *file, struct vm_area_struct *vma)
 	if (mlock_future_check(vma->vm_mm, vma->vm_flags | VM_LOCKED, len))
 		return -EAGAIN;
 
-	vma->vm_flags |= VM_LOCKED | VM_DONTDUMP;
+	vm_flags_set(vma, VM_LOCKED | VM_DONTDUMP);
 	vma->vm_ops = &secretmem_vm_ops;
 
 	return 0;
diff --git a/mm/shmem.c b/mm/shmem.c
index 9e1015cbad29..732969afabd1 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2304,7 +2304,7 @@ static int shmem_mmap(struct file *file, struct vm_area_struct *vma)
 		return ret;
 
 	/* arm64 - allow memory tagging on RAM-based files */
-	vma->vm_flags |= VM_MTE_ALLOWED;
+	vm_flags_set(vma, VM_MTE_ALLOWED);
 
 	file_accessed(file);
 	/* This is anonymous shared memory if it is unlinked at the time of mmap */
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 2efc519d8b62..73190fc08845 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3682,7 +3682,7 @@ int remap_vmalloc_range_partial(struct vm_area_struct *vma, unsigned long uaddr,
 		size -= PAGE_SIZE;
 	} while (size > 0);
 
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
 
 	return 0;
 }
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index f713c0422f0f..7db45cdc3e1a 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1890,10 +1890,10 @@ int tcp_mmap(struct file *file, struct socket *sock,
 {
 	if (vma->vm_flags & (VM_WRITE | VM_EXEC))
 		return -EPERM;
-	vma->vm_flags &= ~(VM_MAYWRITE | VM_MAYEXEC);
+	vm_flags_clear(vma, VM_MAYWRITE | VM_MAYEXEC);
 
 	/* Instruct vm_insert_page() to not mmap_read_lock(mm) */
-	vma->vm_flags |= VM_MIXEDMAP;
+	vm_flags_set(vma, VM_MIXEDMAP);
 
 	vma->vm_ops = &tcp_vm_ops;
 	return 0;
diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index 0a6894cdc54d..18498979a640 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -262,7 +262,7 @@ static int sel_mmap_handle_status(struct file *filp,
 	if (vma->vm_flags & VM_WRITE)
 		return -EPERM;
 	/* disallow mprotect() turns it into writable */
-	vma->vm_flags &= ~VM_MAYWRITE;
+	vm_flags_clear(vma, VM_MAYWRITE);
 
 	return remap_pfn_range(vma, vma->vm_start,
 			       page_to_pfn(status),
@@ -506,13 +506,13 @@ static int sel_mmap_policy(struct file *filp, struct vm_area_struct *vma)
 {
 	if (vma->vm_flags & VM_SHARED) {
 		/* do not allow mprotect to make mapping writable */
-		vma->vm_flags &= ~VM_MAYWRITE;
+		vm_flags_clear(vma, VM_MAYWRITE);
 
 		if (vma->vm_flags & VM_WRITE)
 			return -EACCES;
 	}
 
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_ops = &sel_mmap_policy_ops;
 
 	return 0;
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index ac2efeb63a39..728c211142d1 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2910,7 +2910,7 @@ static int snd_pcm_oss_mmap(struct file *file, struct vm_area_struct *area)
 	}
 	/* set VM_READ access as well to fix memset() routines that do
 	   reads before writes (to improve performance) */
-	area->vm_flags |= VM_READ;
+	vm_flags_set(area, VM_READ);
 	if (substream == NULL)
 		return -ENXIO;
 	runtime = substream->runtime;
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 9c122e757efe..331380c2438b 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3675,8 +3675,9 @@ static int snd_pcm_mmap_status(struct snd_pcm_substream *substream, struct file
 		return -EINVAL;
 	area->vm_ops = &snd_pcm_vm_ops_status;
 	area->vm_private_data = substream;
-	area->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
-	area->vm_flags &= ~(VM_WRITE | VM_MAYWRITE);
+	vm_flags_mod(area, VM_DONTEXPAND | VM_DONTDUMP,
+		     VM_WRITE | VM_MAYWRITE);
+
 	return 0;
 }
 
@@ -3712,7 +3713,7 @@ static int snd_pcm_mmap_control(struct snd_pcm_substream *substream, struct file
 		return -EINVAL;
 	area->vm_ops = &snd_pcm_vm_ops_control;
 	area->vm_private_data = substream;
-	area->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(area, VM_DONTEXPAND | VM_DONTDUMP);
 	return 0;
 }
 
@@ -3828,7 +3829,7 @@ static const struct vm_operations_struct snd_pcm_vm_ops_data_fault = {
 int snd_pcm_lib_default_mmap(struct snd_pcm_substream *substream,
 			     struct vm_area_struct *area)
 {
-	area->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(area, VM_DONTEXPAND | VM_DONTDUMP);
 	if (!substream->ops->page &&
 	    !snd_dma_buffer_mmap(snd_pcm_get_dma_buf(substream), area))
 		return 0;
diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index fb5a4390443f..b3c1744eff91 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -404,7 +404,7 @@ static int mmp_pcm_mmap(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream,
 			struct vm_area_struct *vma)
 {
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 	return remap_pfn_range(vma, vma->vm_start,
 		substream->dma_buffer.addr >> PAGE_SHIFT,
diff --git a/sound/usb/usx2y/us122l.c b/sound/usb/usx2y/us122l.c
index e558931cce16..709ccad972e2 100644
--- a/sound/usb/usx2y/us122l.c
+++ b/sound/usb/usx2y/us122l.c
@@ -224,9 +224,9 @@ static int usb_stream_hwdep_mmap(struct snd_hwdep *hw,
 	}
 
 	area->vm_ops = &usb_stream_hwdep_vm_ops;
-	area->vm_flags |= VM_DONTDUMP;
+	vm_flags_set(area, VM_DONTDUMP);
 	if (!read)
-		area->vm_flags |= VM_DONTEXPAND;
+		vm_flags_set(area, VM_DONTEXPAND);
 	area->vm_private_data = us122l;
 	atomic_inc(&us122l->mmap_count);
 out:
diff --git a/sound/usb/usx2y/usX2Yhwdep.c b/sound/usb/usx2y/usX2Yhwdep.c
index c29da0341bc5..4937ede0b5d7 100644
--- a/sound/usb/usx2y/usX2Yhwdep.c
+++ b/sound/usb/usx2y/usX2Yhwdep.c
@@ -61,7 +61,7 @@ static int snd_us428ctls_mmap(struct snd_hwdep *hw, struct file *filp, struct vm
 	}
 
 	area->vm_ops = &us428ctls_vm_ops;
-	area->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(area, VM_DONTEXPAND | VM_DONTDUMP);
 	area->vm_private_data = hw->private_data;
 	return 0;
 }
diff --git a/sound/usb/usx2y/usx2yhwdeppcm.c b/sound/usb/usx2y/usx2yhwdeppcm.c
index 767a227d54da..36f2e31168fb 100644
--- a/sound/usb/usx2y/usx2yhwdeppcm.c
+++ b/sound/usb/usx2y/usx2yhwdeppcm.c
@@ -706,7 +706,7 @@ static int snd_usx2y_hwdep_pcm_mmap(struct snd_hwdep *hw, struct file *filp, str
 		return -ENODEV;
 
 	area->vm_ops = &snd_usx2y_hwdep_pcm_vm_ops;
-	area->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	vm_flags_set(area, VM_DONTEXPAND | VM_DONTDUMP);
 	area->vm_private_data = hw->private_data;
 	return 0;
 }
-- 
2.39.1

