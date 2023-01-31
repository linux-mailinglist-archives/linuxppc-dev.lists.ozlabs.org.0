Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F93F682678
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 09:33:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5dcG2D4gz3cfL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 19:33:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gDvhUFvT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=42.hyeyoo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gDvhUFvT;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5dbJ4v32z3cFm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 19:32:42 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso18261005pjj.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 00:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eY6WhpauLgjdc2GeVm59ZJcPRy3bOJRPWYy2o9UJOTs=;
        b=gDvhUFvTLFqud44CwwqInyihTUiI65hFA8JOcKHcLn9UVqtcsQv19U+MBWki2RO8Nt
         R30z1HOkLFcxYsOMFQbXwd2hBjB2KuglBwPPycXfU/f92RNvUcFSUvLneYWpJhgVlptd
         9njIBtJQXP2icVAY3wmYUOkQ9wz87mvD6pLmxrieRF/AI0OYoEKEs1O1QDURTHPnhyq8
         lsKAxU9oHb1JDqhd40zwBUJUv32A8vGZT0y+Kphrx9F/z5gIROXjFQvJXm04C18g6T2n
         NBcRV1o/3AH+VpRCuHPjgf1QVhy75RLJqTbWXYiQ6JtG8jNvCfOaU7SrLZhzsMyn9ZYy
         9jbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eY6WhpauLgjdc2GeVm59ZJcPRy3bOJRPWYy2o9UJOTs=;
        b=ria2cMvLukMRMmmgo/K71+7EAkTmlW1qd45RdnqSAICDasUMW9ESlpULCUAudQsu6s
         oByFxo668/k+GgYJ6uZFuuTeHuwyGdT6UIQuJvKoxqAU3e0+9phO3FBAAmbjYR4ShYSV
         RPIIaT+5RsGF6pphQrg8/eMPPOwg5lPWxqvh5ScCULPN12Msk12liPNkBshqqZRj97ad
         kfrptr6uilZxK0KAxIO+jJAdd4ZSfFBPOUEuyCzmqABueW4s/ghqf9+LxvKJfcer8LGb
         uHbHHAMyxtXgVuoiVBK1v0SRspFyagp0a9d2TbcC7WbmDMuISTcvMMJwq8ex0AVzVNXX
         C7AA==
X-Gm-Message-State: AFqh2kpchQFvjJKN189jx1hY7KVh7A+4AZRFfBgQNQhfpyuS3FaHK0O1
	iO2nZkgGlu0mXzg9Sw1yXOI=
X-Google-Smtp-Source: AMrXdXta+Z0I0LRtkA5JAdf/Ab5Zq2D11VCaAAiVvOoRHiaRxBEEPXz5DuLtncQGQLEyCHpSuMVj9g==
X-Received: by 2002:a17:90a:1a5c:b0:22b:b76b:5043 with SMTP id 28-20020a17090a1a5c00b0022bb76b5043mr40692416pjl.9.1675153958109;
        Tue, 31 Jan 2023 00:32:38 -0800 (PST)
Received: from hyeyoo ([114.29.91.56])
        by smtp.gmail.com with ESMTPSA id mv12-20020a17090b198c00b0021952b5e9bcsm10482650pjb.53.2023.01.31.00.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 00:32:37 -0800 (PST)
Date: Tue, 31 Jan 2023 17:32:20 +0900
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v4 4/7] mm: replace vma->vm_flags direct modifications
 with modifier calls
Message-ID: <Y9jSFFeHYZE1/yFg@hyeyoo>
References: <20230126193752.297968-1-surenb@google.com>
 <20230126193752.297968-5-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126193752.297968-5-surenb@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, Sebastian Reichel <sebastian.reichel@collabora.com>, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundat
 ion.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 26, 2023 at 11:37:49AM -0800, Suren Baghdasaryan wrote:
> Replace direct modifications to vma->vm_flags with calls to modifier
> functions to be able to track flag changes and to keep vma locking
> correctness.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Acked-by: Mel Gorman <mgorman@techsingularity.net>
> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm/kernel/process.c                          |  2 +-
>  arch/ia64/mm/init.c                                |  8 ++++----
>  arch/loongarch/include/asm/tlb.h                   |  2 +-
>  arch/powerpc/kvm/book3s_xive_native.c              |  2 +-
>  arch/powerpc/mm/book3s64/subpage_prot.c            |  2 +-
>  arch/powerpc/platforms/book3s/vas-api.c            |  2 +-
>  arch/powerpc/platforms/cell/spufs/file.c           | 14 +++++++-------
>  arch/s390/mm/gmap.c                                |  3 +--
>  arch/x86/entry/vsyscall/vsyscall_64.c              |  2 +-
>  arch/x86/kernel/cpu/sgx/driver.c                   |  2 +-
>  arch/x86/kernel/cpu/sgx/virt.c                     |  2 +-
>  arch/x86/mm/pat/memtype.c                          |  6 +++---
>  arch/x86/um/mem_32.c                               |  2 +-
>  drivers/acpi/pfr_telemetry.c                       |  2 +-
>  drivers/android/binder.c                           |  3 +--
>  drivers/char/mspec.c                               |  2 +-
>  drivers/crypto/hisilicon/qm.c                      |  2 +-
>  drivers/dax/device.c                               |  2 +-
>  drivers/dma/idxd/cdev.c                            |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  4 ++--
>  drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |  4 ++--
>  drivers/gpu/drm/amd/amdkfd/kfd_events.c            |  4 ++--
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  4 ++--
>  drivers/gpu/drm/drm_gem.c                          |  2 +-
>  drivers/gpu/drm/drm_gem_dma_helper.c               |  3 +--
>  drivers/gpu/drm/drm_gem_shmem_helper.c             |  2 +-
>  drivers/gpu/drm/drm_vm.c                           |  8 ++++----
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c              |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_gem.c            |  4 ++--
>  drivers/gpu/drm/gma500/framebuffer.c               |  2 +-
>  drivers/gpu/drm/i810/i810_dma.c                    |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c           |  4 ++--
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c             |  2 +-
>  drivers/gpu/drm/msm/msm_gem.c                      |  2 +-
>  drivers/gpu/drm/omapdrm/omap_gem.c                 |  3 +--
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |  3 +--
>  drivers/gpu/drm/tegra/gem.c                        |  5 ++---
>  drivers/gpu/drm/ttm/ttm_bo_vm.c                    |  3 +--
>  drivers/gpu/drm/virtio/virtgpu_vram.c              |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c           |  2 +-
>  drivers/gpu/drm/xen/xen_drm_front_gem.c            |  3 +--
>  drivers/hsi/clients/cmt_speech.c                   |  2 +-
>  drivers/hwtracing/intel_th/msu.c                   |  2 +-
>  drivers/hwtracing/stm/core.c                       |  2 +-
>  drivers/infiniband/hw/hfi1/file_ops.c              |  4 ++--
>  drivers/infiniband/hw/mlx5/main.c                  |  4 ++--
>  drivers/infiniband/hw/qib/qib_file_ops.c           | 13 ++++++-------
>  drivers/infiniband/hw/usnic/usnic_ib_verbs.c       |  2 +-
>  drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.c    |  2 +-
>  .../media/common/videobuf2/videobuf2-dma-contig.c  |  2 +-
>  drivers/media/common/videobuf2/videobuf2-vmalloc.c |  2 +-
>  drivers/media/v4l2-core/videobuf-dma-contig.c      |  2 +-
>  drivers/media/v4l2-core/videobuf-dma-sg.c          |  4 ++--
>  drivers/media/v4l2-core/videobuf-vmalloc.c         |  2 +-
>  drivers/misc/cxl/context.c                         |  2 +-
>  drivers/misc/habanalabs/common/memory.c            |  2 +-
>  drivers/misc/habanalabs/gaudi/gaudi.c              |  4 ++--
>  drivers/misc/habanalabs/gaudi2/gaudi2.c            |  8 ++++----
>  drivers/misc/habanalabs/goya/goya.c                |  4 ++--
>  drivers/misc/ocxl/context.c                        |  4 ++--
>  drivers/misc/ocxl/sysfs.c                          |  2 +-
>  drivers/misc/open-dice.c                           |  4 ++--
>  drivers/misc/sgi-gru/grufile.c                     |  4 ++--
>  drivers/misc/uacce/uacce.c                         |  2 +-
>  drivers/sbus/char/oradax.c                         |  2 +-
>  drivers/scsi/cxlflash/ocxl_hw.c                    |  2 +-
>  drivers/scsi/sg.c                                  |  2 +-
>  drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     |  2 +-
>  drivers/staging/media/deprecated/meye/meye.c       |  4 ++--
>  .../media/deprecated/stkwebcam/stk-webcam.c        |  2 +-
>  drivers/target/target_core_user.c                  |  2 +-
>  drivers/uio/uio.c                                  |  2 +-
>  drivers/usb/core/devio.c                           |  3 +--
>  drivers/usb/mon/mon_bin.c                          |  3 +--
>  drivers/vdpa/vdpa_user/iova_domain.c               |  2 +-
>  drivers/vfio/pci/vfio_pci_core.c                   |  2 +-
>  drivers/vhost/vdpa.c                               |  2 +-
>  drivers/video/fbdev/68328fb.c                      |  2 +-
>  drivers/video/fbdev/core/fb_defio.c                |  4 ++--
>  drivers/xen/gntalloc.c                             |  2 +-
>  drivers/xen/gntdev.c                               |  4 ++--
>  drivers/xen/privcmd-buf.c                          |  2 +-
>  drivers/xen/privcmd.c                              |  4 ++--
>  fs/aio.c                                           |  2 +-
>  fs/cramfs/inode.c                                  |  2 +-
>  fs/erofs/data.c                                    |  2 +-
>  fs/exec.c                                          |  4 ++--
>  fs/ext4/file.c                                     |  2 +-
>  fs/fuse/dax.c                                      |  2 +-
>  fs/hugetlbfs/inode.c                               |  4 ++--
>  fs/orangefs/file.c                                 |  3 +--
>  fs/proc/task_mmu.c                                 |  2 +-
>  fs/proc/vmcore.c                                   |  3 +--
>  fs/userfaultfd.c                                   |  2 +-
>  fs/xfs/xfs_file.c                                  |  2 +-
>  include/linux/mm.h                                 |  2 +-
>  kernel/bpf/ringbuf.c                               |  4 ++--
>  kernel/bpf/syscall.c                               |  4 ++--
>  kernel/events/core.c                               |  2 +-
>  kernel/kcov.c                                      |  2 +-
>  kernel/relay.c                                     |  2 +-
>  mm/madvise.c                                       |  2 +-
>  mm/memory.c                                        |  6 +++---
>  mm/mlock.c                                         |  6 +++---
>  mm/mmap.c                                          | 10 +++++-----
>  mm/mprotect.c                                      |  2 +-
>  mm/mremap.c                                        |  6 +++---
>  mm/nommu.c                                         | 11 ++++++-----
>  mm/secretmem.c                                     |  2 +-
>  mm/shmem.c                                         |  2 +-
>  mm/vmalloc.c                                       |  2 +-
>  net/ipv4/tcp.c                                     |  4 ++--
>  security/selinux/selinuxfs.c                       |  6 +++---
>  sound/core/oss/pcm_oss.c                           |  2 +-
>  sound/core/pcm_native.c                            |  9 +++++----
>  sound/soc/pxa/mmp-sspa.c                           |  2 +-
>  sound/usb/usx2y/us122l.c                           |  4 ++--
>  sound/usb/usx2y/usX2Yhwdep.c                       |  2 +-
>  sound/usb/usx2y/usx2yhwdeppcm.c                    |  2 +-
>  120 files changed, 188 insertions(+), 199 deletions(-)
> 

Hello Suren,

[...]

Whoa, it's so long.
Mostly looks fine but two things I'm not sure about:

> diff --git a/drivers/misc/open-dice.c b/drivers/misc/open-dice.c
> index 9dda47b3fd70..7be4e6c9f120 100644
> --- a/drivers/misc/open-dice.c
> +++ b/drivers/misc/open-dice.c
> @@ -95,12 +95,12 @@ static int open_dice_mmap(struct file *filp, struct vm_area_struct *vma)
>  		if (vma->vm_flags & VM_WRITE)
>  			return -EPERM;
>  		/* Ensure userspace cannot acquire VM_WRITE later. */
> -		vma->vm_flags &= ~VM_MAYWRITE;
> +		vm_flags_clear(vma, VM_MAYSHARE);
>  	}

I think it should be:
	s/VM_MAYSHARE/VM_MAYWRITE/

> diff --git a/mm/mlock.c b/mm/mlock.c
> index 5c4fff93cd6b..ed49459e343e 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -380,7 +380,7 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
>  	 */
>  	if (newflags & VM_LOCKED)
>  		newflags |= VM_IO;
> -	WRITE_ONCE(vma->vm_flags, newflags);
> +	vm_flags_reset(vma, newflags);
>  
>  	lru_add_drain();
>  	walk_page_range(vma->vm_mm, start, end, &mlock_walk_ops, NULL);
> @@ -388,7 +388,7 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
>  
>  	if (newflags & VM_IO) {
>  		newflags &= ~VM_IO;
> -		WRITE_ONCE(vma->vm_flags, newflags);
> +		vm_flags_reset(vma, newflags);
>  	}
>  }

wondering the if the comment above is still true?

        /*
         * There is a slight chance that concurrent page migration,
         * or page reclaim finding a page of this now-VM_LOCKED vma,
         * will call mlock_vma_folio() and raise page's mlock_count:
         * double counting, leaving the page unevictable indefinitely.
         * Communicate this danger to mlock_vma_folio() with VM_IO,
         * which is a VM_SPECIAL flag not allowed on VM_LOCKED vmas.
         * mmap_lock is held in write mode here, so this weird
         * combination should not be visible to other mmap_lock users;
         * but WRITE_ONCE so rmap walkers must see VM_IO if VM_LOCKED.
         */

does ACCESS_PRIVATE() still guarentee that compiler cannot mysteriously
optimize writes like WRITE_ONCE()?
