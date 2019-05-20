Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A6922BFA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 08:21:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456pgS3qRnzDqKb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 16:21:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="DbX6sQRS"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456pdv5ND6zDqGF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 16:19:47 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id x15so6198901pln.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 May 2019 23:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PBy3eMs07XY9FrrAK/MAiuK4msEJQjNPDgdCYOHnWL4=;
 b=DbX6sQRSaGyW1FUZRUGq7IxR73E3rt0PugnXojyMfveAM3ar6hbiF205rEKhYxN/QW
 wcjfpWfY02vpsrmASGvwp2gxu5ff3jOZSQFh5yG7G8c9Ca5iLhnZrMC51temjFhqRBGT
 ZZMXN6vg/qamqFRvFPd/x9yw3XKPjqhWWRK1apIRay2WdKy5g23SwlQXsZ/C5WptZo15
 9cJaxazQFk0QtISFtr+nDDaamHHKtB6y9A49SQbhqIWd4mSdRQYp0TK+mnkVvDveUBhl
 NHNWN3+M905+CPritF7y8tQXpzyYCbada64dhcWen0jbER+/0fuwjtzjCzzV731rUyh4
 vSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=PBy3eMs07XY9FrrAK/MAiuK4msEJQjNPDgdCYOHnWL4=;
 b=RrC04iz4dU0t5uN5CzGgH23Ms/1wHgCGu6uLgFDF4D3w25Zdp8HwsbuQJaaOHF9KQi
 MYG4oPWsY4vzCZid2b8Qbvc6+jFFBJZzQrDS2JYFGPdQxFarFLsQ5UQsUlXQDgalDtrE
 uTFMTskgVQNwoQooN9nWqG8JSQs4PYauuV9co2XTEJs9kphPL9ip4aeYPowEAbusis2N
 hIvDTn5iCbeF5GXyLCpdzim5IG2/OfexloSLRuOnkfGniVlpWH59TKzwa5faI0MwdPcb
 zR062J5w2hyHDdEpB+wNwWbH+qv4BqVcCbd5mN43iWEi2MGyDG4Ofpx4q+yw3j+AOrcu
 qv7Q==
X-Gm-Message-State: APjAAAUzVcLPc0l9twr68c8kQQIybdhRmDm1KsAjHiUiGZXCYuNn7auD
 uU2NOLTnD84hSDoAqsXsxvipmg==
X-Google-Smtp-Source: APXvYqy0yeqvgHQuF+pEormkD37ZErFzQ4VskiZOhmUbr7yEeBmQhMxAaQRzpFSYrZXNHj1p27/BRg==
X-Received: by 2002:a17:902:5a47:: with SMTP id
 f7mr48867341plm.321.1558333183823; 
 Sun, 19 May 2019 23:19:43 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id c129sm21482209pfg.178.2019.05.19.23.19.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 May 2019 23:19:42 -0700 (PDT)
Subject: Re: [PATCH] mm: add account_locked_vm utility function
To: Daniel Jordan <daniel.m.jordan@oracle.com>, akpm@linux-foundation.org
References: <20190503201629.20512-1-daniel.m.jordan@oracle.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Openpgp: preference=signencrypt
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <4b42057f-b998-f87c-4e0f-a91abcb366f9@ozlabs.ru>
Date: Mon, 20 May 2019 16:19:34 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503201629.20512-1-daniel.m.jordan@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Davidlohr Bueso <dave@stgolabs.net>,
 kvm@vger.kernel.org, Alan Tull <atull@kernel.org>, linux-fpga@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Moritz Fischer <mdf@kernel.org>,
 Steve Sistare <steven.sistare@oracle.com>, Christoph Lameter <cl@linux.com>,
 linuxppc-dev@lists.ozlabs.org, Wu Hao <hao.wu@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 04/05/2019 06:16, Daniel Jordan wrote:
> locked_vm accounting is done roughly the same way in five places, so
> unify them in a helper.  Standardize the debug prints, which vary
> slightly.

And I rather liked that prints were different and tell precisely which
one of three each printk is.

I commented below but in general this seems working.

Tested-by: Alexey Kardashevskiy <aik@ozlabs.ru>




>  Error codes stay the same, so user-visible behavior does too.
> 
> Signed-off-by: Daniel Jordan <daniel.m.jordan@oracle.com>
> Cc: Alan Tull <atull@kernel.org>
> Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Christoph Lameter <cl@linux.com>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Davidlohr Bueso <dave@stgolabs.net>
> Cc: Jason Gunthorpe <jgg@mellanox.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Moritz Fischer <mdf@kernel.org>
> Cc: Paul Mackerras <paulus@ozlabs.org>
> Cc: Steve Sistare <steven.sistare@oracle.com>
> Cc: Wu Hao <hao.wu@intel.com>
> Cc: linux-mm@kvack.org
> Cc: kvm@vger.kernel.org
> Cc: kvm-ppc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-fpga@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
> 
> Based on v5.1-rc7.  Tested with the vfio type1 driver.  Any feedback
> welcome.
> 
> Andrew, this one patch replaces these six from [1]:
> 
>     mm-change-locked_vms-type-from-unsigned-long-to-atomic64_t.patch
>     vfio-type1-drop-mmap_sem-now-that-locked_vm-is-atomic.patch
>     vfio-spapr_tce-drop-mmap_sem-now-that-locked_vm-is-atomic.patch
>     fpga-dlf-afu-drop-mmap_sem-now-that-locked_vm-is-atomic.patch
>     kvm-book3s-drop-mmap_sem-now-that-locked_vm-is-atomic.patch
>     powerpc-mmu-drop-mmap_sem-now-that-locked_vm-is-atomic.patch
> 
> That series converts locked_vm to an atomic, but on closer inspection causes at
> least one accounting race in mremap, and fixing it just for this type
> conversion came with too much ugly in the core mm to justify, especially when
> the right long-term fix is making these drivers use pinned_vm instead.
> 
> Christophe's suggestion of cmpxchg[2] does prevent the races he
> mentioned for pinned_vm, but others would still remain.  In perf_mmap
> and the hfi1 driver, pinned_vm is checked against the rlimit racily and
> then later increased when the pinned_vm originally read may have gone
> stale.  Any fixes for that, that I could think of, seem about as good as
> what's there now, so I left it.  I have a patch that uses cmpxchg with
> pinned_vm if others feel strongly that the aforementioned races should
> be fixed.
> 
> Daniel
> 
> [1] https://lore.kernel.org/linux-mm/20190402204158.27582-1-daniel.m.jordan@oracle.com/
> [2] https://lore.kernel.org/linux-mm/964bd5b0-f1e5-7bf0-5c58-18e75c550841@c-s.fr/
> 
>  arch/powerpc/kvm/book3s_64_vio.c    | 44 +++---------------------
>  arch/powerpc/mm/mmu_context_iommu.c | 41 +++-------------------
>  drivers/fpga/dfl-afu-dma-region.c   | 53 +++--------------------------
>  drivers/vfio/vfio_iommu_spapr_tce.c | 52 +++++-----------------------
>  drivers/vfio/vfio_iommu_type1.c     | 23 ++++---------
>  include/linux/mm.h                  | 19 +++++++++++
>  mm/util.c                           | 48 ++++++++++++++++++++++++++
>  7 files changed, 94 insertions(+), 186 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
> index f02b04973710..f7d37fa6003a 100644
> --- a/arch/powerpc/kvm/book3s_64_vio.c
> +++ b/arch/powerpc/kvm/book3s_64_vio.c
> @@ -30,6 +30,7 @@
>  #include <linux/anon_inodes.h>
>  #include <linux/iommu.h>
>  #include <linux/file.h>
> +#include <linux/mm.h>
>  
>  #include <asm/kvm_ppc.h>
>  #include <asm/kvm_book3s.h>
> @@ -56,43 +57,6 @@ static unsigned long kvmppc_stt_pages(unsigned long tce_pages)
>  	return tce_pages + ALIGN(stt_bytes, PAGE_SIZE) / PAGE_SIZE;
>  }
>  
> -static long kvmppc_account_memlimit(unsigned long stt_pages, bool inc)
> -{
> -	long ret = 0;
> -
> -	if (!current || !current->mm)
> -		return ret; /* process exited */
> -
> -	down_write(&current->mm->mmap_sem);
> -
> -	if (inc) {
> -		unsigned long locked, lock_limit;
> -
> -		locked = current->mm->locked_vm + stt_pages;
> -		lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
> -		if (locked > lock_limit && !capable(CAP_IPC_LOCK))
> -			ret = -ENOMEM;
> -		else
> -			current->mm->locked_vm += stt_pages;
> -	} else {
> -		if (WARN_ON_ONCE(stt_pages > current->mm->locked_vm))
> -			stt_pages = current->mm->locked_vm;
> -
> -		current->mm->locked_vm -= stt_pages;
> -	}
> -
> -	pr_debug("[%d] RLIMIT_MEMLOCK KVM %c%ld %ld/%ld%s\n", current->pid,
> -			inc ? '+' : '-',
> -			stt_pages << PAGE_SHIFT,
> -			current->mm->locked_vm << PAGE_SHIFT,
> -			rlimit(RLIMIT_MEMLOCK),
> -			ret ? " - exceeded" : "");
> -
> -	up_write(&current->mm->mmap_sem);
> -
> -	return ret;
> -}
> -
>  static void kvm_spapr_tce_iommu_table_free(struct rcu_head *head)
>  {
>  	struct kvmppc_spapr_tce_iommu_table *stit = container_of(head,
> @@ -277,7 +241,7 @@ static int kvm_spapr_tce_release(struct inode *inode, struct file *filp)
>  
>  	kvm_put_kvm(stt->kvm);
>  
> -	kvmppc_account_memlimit(
> +	account_locked_vm(current->mm,
>  		kvmppc_stt_pages(kvmppc_tce_pages(stt->size)), false);
>  	call_rcu(&stt->rcu, release_spapr_tce_table);
>  
> @@ -303,7 +267,7 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
>  		return -EINVAL;
>  
>  	npages = kvmppc_tce_pages(size);
> -	ret = kvmppc_account_memlimit(kvmppc_stt_pages(npages), true);
> +	ret = account_locked_vm(current->mm, kvmppc_stt_pages(npages), true);
>  	if (ret)
>  		return ret;
>  
> @@ -359,7 +323,7 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
>  
>  	kfree(stt);
>   fail_acct:
> -	kvmppc_account_memlimit(kvmppc_stt_pages(npages), false);
> +	account_locked_vm(current->mm, kvmppc_stt_pages(npages), false);
>  	return ret;
>  }
>  
> diff --git a/arch/powerpc/mm/mmu_context_iommu.c b/arch/powerpc/mm/mmu_context_iommu.c
> index 8330f135294f..9e7001a70570 100644
> --- a/arch/powerpc/mm/mmu_context_iommu.c
> +++ b/arch/powerpc/mm/mmu_context_iommu.c
> @@ -19,6 +19,7 @@
>  #include <linux/hugetlb.h>
>  #include <linux/swap.h>
>  #include <linux/sizes.h>
> +#include <linux/mm.h>
>  #include <asm/mmu_context.h>
>  #include <asm/pte-walk.h>
>  #include <linux/mm_inline.h>
> @@ -51,40 +52,6 @@ struct mm_iommu_table_group_mem_t {
>  	u64 dev_hpa;		/* Device memory base address */
>  };
>  
> -static long mm_iommu_adjust_locked_vm(struct mm_struct *mm,
> -		unsigned long npages, bool incr)
> -{
> -	long ret = 0, locked, lock_limit;
> -
> -	if (!npages)
> -		return 0;
> -
> -	down_write(&mm->mmap_sem);
> -
> -	if (incr) {
> -		locked = mm->locked_vm + npages;
> -		lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
> -		if (locked > lock_limit && !capable(CAP_IPC_LOCK))
> -			ret = -ENOMEM;
> -		else
> -			mm->locked_vm += npages;
> -	} else {
> -		if (WARN_ON_ONCE(npages > mm->locked_vm))
> -			npages = mm->locked_vm;
> -		mm->locked_vm -= npages;
> -	}
> -
> -	pr_debug("[%d] RLIMIT_MEMLOCK HASH64 %c%ld %ld/%ld\n",
> -			current ? current->pid : 0,
> -			incr ? '+' : '-',
> -			npages << PAGE_SHIFT,
> -			mm->locked_vm << PAGE_SHIFT,
> -			rlimit(RLIMIT_MEMLOCK));
> -	up_write(&mm->mmap_sem);
> -
> -	return ret;
> -}
> -
>  bool mm_iommu_preregistered(struct mm_struct *mm)
>  {
>  	return !list_empty(&mm->context.iommu_group_mem_list);
> @@ -101,7 +68,7 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
>  	unsigned long entry, chunk;
>  
>  	if (dev_hpa == MM_IOMMU_TABLE_INVALID_HPA) {
> -		ret = mm_iommu_adjust_locked_vm(mm, entries, true);
> +		ret = account_locked_vm(mm, entries, true);
>  		if (ret)
>  			return ret;
>  
> @@ -215,7 +182,7 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
>  	kfree(mem);
>  
>  unlock_exit:
> -	mm_iommu_adjust_locked_vm(mm, locked_entries, false);
> +	account_locked_vm(mm, locked_entries, false);
>  
>  	return ret;
>  }
> @@ -315,7 +282,7 @@ long mm_iommu_put(struct mm_struct *mm, struct mm_iommu_table_group_mem_t *mem)
>  unlock_exit:
>  	mutex_unlock(&mem_list_mutex);
>  
> -	mm_iommu_adjust_locked_vm(mm, unlock_entries, false);
> +	account_locked_vm(mm, unlock_entries, false);
>  
>  	return ret;
>  }
> diff --git a/drivers/fpga/dfl-afu-dma-region.c b/drivers/fpga/dfl-afu-dma-region.c
> index e18a786fc943..059438e17193 100644
> --- a/drivers/fpga/dfl-afu-dma-region.c
> +++ b/drivers/fpga/dfl-afu-dma-region.c
> @@ -12,6 +12,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/sched/signal.h>
>  #include <linux/uaccess.h>
> +#include <linux/mm.h>
>  
>  #include "dfl-afu.h"
>  
> @@ -31,52 +32,6 @@ void afu_dma_region_init(struct dfl_feature_platform_data *pdata)
>  	afu->dma_regions = RB_ROOT;
>  }
>  
> -/**
> - * afu_dma_adjust_locked_vm - adjust locked memory
> - * @dev: port device
> - * @npages: number of pages
> - * @incr: increase or decrease locked memory
> - *
> - * Increase or decrease the locked memory size with npages input.
> - *
> - * Return 0 on success.
> - * Return -ENOMEM if locked memory size is over the limit and no CAP_IPC_LOCK.
> - */
> -static int afu_dma_adjust_locked_vm(struct device *dev, long npages, bool incr)
> -{
> -	unsigned long locked, lock_limit;
> -	int ret = 0;
> -
> -	/* the task is exiting. */
> -	if (!current->mm)
> -		return 0;
> -
> -	down_write(&current->mm->mmap_sem);
> -
> -	if (incr) {
> -		locked = current->mm->locked_vm + npages;
> -		lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
> -
> -		if (locked > lock_limit && !capable(CAP_IPC_LOCK))
> -			ret = -ENOMEM;
> -		else
> -			current->mm->locked_vm += npages;
> -	} else {
> -		if (WARN_ON_ONCE(npages > current->mm->locked_vm))
> -			npages = current->mm->locked_vm;
> -		current->mm->locked_vm -= npages;
> -	}
> -
> -	dev_dbg(dev, "[%d] RLIMIT_MEMLOCK %c%ld %ld/%ld%s\n", current->pid,
> -		incr ? '+' : '-', npages << PAGE_SHIFT,
> -		current->mm->locked_vm << PAGE_SHIFT, rlimit(RLIMIT_MEMLOCK),
> -		ret ? "- exceeded" : "");
> -
> -	up_write(&current->mm->mmap_sem);
> -
> -	return ret;
> -}
> -
>  /**
>   * afu_dma_pin_pages - pin pages of given dma memory region
>   * @pdata: feature device platform data
> @@ -92,7 +47,7 @@ static int afu_dma_pin_pages(struct dfl_feature_platform_data *pdata,
>  	struct device *dev = &pdata->dev->dev;
>  	int ret, pinned;
>  
> -	ret = afu_dma_adjust_locked_vm(dev, npages, true);
> +	ret = account_locked_vm(current->mm, npages, true);
>  	if (ret)
>  		return ret;
>  
> @@ -121,7 +76,7 @@ static int afu_dma_pin_pages(struct dfl_feature_platform_data *pdata,
>  free_pages:
>  	kfree(region->pages);
>  unlock_vm:
> -	afu_dma_adjust_locked_vm(dev, npages, false);
> +	account_locked_vm(current->mm, npages, false);
>  	return ret;
>  }
>  
> @@ -141,7 +96,7 @@ static void afu_dma_unpin_pages(struct dfl_feature_platform_data *pdata,
>  
>  	put_all_pages(region->pages, npages);
>  	kfree(region->pages);
> -	afu_dma_adjust_locked_vm(dev, npages, false);
> +	account_locked_vm(current->mm, npages, false);
>  
>  	dev_dbg(dev, "%ld pages unpinned\n", npages);
>  }
> diff --git a/drivers/vfio/vfio_iommu_spapr_tce.c b/drivers/vfio/vfio_iommu_spapr_tce.c
> index 6b64e45a5269..d39a1b830d82 100644
> --- a/drivers/vfio/vfio_iommu_spapr_tce.c
> +++ b/drivers/vfio/vfio_iommu_spapr_tce.c
> @@ -22,6 +22,7 @@
>  #include <linux/vmalloc.h>
>  #include <linux/sched/mm.h>
>  #include <linux/sched/signal.h>
> +#include <linux/mm.h>
>  
>  #include <asm/iommu.h>
>  #include <asm/tce.h>
> @@ -34,49 +35,13 @@
>  static void tce_iommu_detach_group(void *iommu_data,
>  		struct iommu_group *iommu_group);
>  
> -static long try_increment_locked_vm(struct mm_struct *mm, long npages)
> +static int tce_account_locked_vm(struct mm_struct *mm, unsigned long npages,
> +				 bool inc)
>  {
> -	long ret = 0, locked, lock_limit;
> -
>  	if (WARN_ON_ONCE(!mm))
>  		return -EPERM;


If this WARN_ON is the only reason for having tce_account_locked_vm()
instead of calling account_locked_vm() directly, you can then ditch the
check as I have never ever seen this triggered.


>  
> -	if (!npages)
> -		return 0;
> -
> -	down_write(&mm->mmap_sem);
> -	locked = mm->locked_vm + npages;
> -	lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
> -	if (locked > lock_limit && !capable(CAP_IPC_LOCK))
> -		ret = -ENOMEM;
> -	else
> -		mm->locked_vm += npages;
> -
> -	pr_debug("[%d] RLIMIT_MEMLOCK +%ld %ld/%ld%s\n", current->pid,
> -			npages << PAGE_SHIFT,
> -			mm->locked_vm << PAGE_SHIFT,
> -			rlimit(RLIMIT_MEMLOCK),
> -			ret ? " - exceeded" : "");
> -
> -	up_write(&mm->mmap_sem);
> -
> -	return ret;
> -}
> -
> -static void decrement_locked_vm(struct mm_struct *mm, long npages)
> -{
> -	if (!mm || !npages)
> -		return;
> -
> -	down_write(&mm->mmap_sem);
> -	if (WARN_ON_ONCE(npages > mm->locked_vm))
> -		npages = mm->locked_vm;
> -	mm->locked_vm -= npages;
> -	pr_debug("[%d] RLIMIT_MEMLOCK -%ld %ld/%ld\n", current->pid,
> -			npages << PAGE_SHIFT,
> -			mm->locked_vm << PAGE_SHIFT,
> -			rlimit(RLIMIT_MEMLOCK));
> -	up_write(&mm->mmap_sem);
> +	return account_locked_vm(mm, npages, inc);
>  }
>  
>  /*
> @@ -336,7 +301,7 @@ static int tce_iommu_enable(struct tce_container *container)
>  		return ret;
>  
>  	locked = table_group->tce32_size >> PAGE_SHIFT;
> -	ret = try_increment_locked_vm(container->mm, locked);
> +	ret = tce_account_locked_vm(container->mm, locked, true);
>  	if (ret)
>  		return ret;
>  
> @@ -355,7 +320,7 @@ static void tce_iommu_disable(struct tce_container *container)
>  	container->enabled = false;
>  
>  	BUG_ON(!container->mm);
> -	decrement_locked_vm(container->mm, container->locked_pages);
> +	tce_account_locked_vm(container->mm, container->locked_pages, false);
>  }
>  
>  static void *tce_iommu_open(unsigned long arg)
> @@ -658,7 +623,8 @@ static long tce_iommu_create_table(struct tce_container *container,
>  	if (!table_size)
>  		return -EINVAL;
>  
> -	ret = try_increment_locked_vm(container->mm, table_size >> PAGE_SHIFT);
> +	ret = tce_account_locked_vm(container->mm, table_size >> PAGE_SHIFT,
> +				    true);
>  	if (ret)
>  		return ret;
>  
> @@ -677,7 +643,7 @@ static void tce_iommu_free_table(struct tce_container *container,
>  	unsigned long pages = tbl->it_allocated_size >> PAGE_SHIFT;
>  
>  	iommu_tce_table_put(tbl);
> -	decrement_locked_vm(container->mm, pages);
> +	tce_account_locked_vm(container->mm, pages, false);
>  }
>  
>  static long tce_iommu_create_window(struct tce_container *container,
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index d0f731c9920a..15ac76171ccd 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -273,25 +273,14 @@ static int vfio_lock_acct(struct vfio_dma *dma, long npage, bool async)
>  		return -ESRCH; /* process exited */
>  
>  	ret = down_write_killable(&mm->mmap_sem);
> -	if (!ret) {
> -		if (npage > 0) {
> -			if (!dma->lock_cap) {
> -				unsigned long limit;
> -
> -				limit = task_rlimit(dma->task,
> -						RLIMIT_MEMLOCK) >> PAGE_SHIFT;
> -
> -				if (mm->locked_vm + npage > limit)
> -					ret = -ENOMEM;
> -			}
> -		}
> +	if (ret)
> +		goto out;


A single "goto" to jump just 3 lines below seems unnecessary.


>  
> -		if (!ret)
> -			mm->locked_vm += npage;
> -
> -		up_write(&mm->mmap_sem);
> -	}
> +	ret = __account_locked_vm(mm, abs(npage), npage > 0, dma->task,
> +				  dma->lock_cap);
> +	up_write(&mm->mmap_sem);
>  
> +out:
>  	if (async)
>  		mmput(mm);
>  
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 6b10c21630f5..7134e55ca23f 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1521,6 +1521,25 @@ static inline long get_user_pages_longterm(unsigned long start,
>  int get_user_pages_fast(unsigned long start, int nr_pages, int write,
>  			struct page **pages);
>  
> +int __account_locked_vm(struct mm_struct *mm, unsigned long pages, bool inc,
> +			struct task_struct *task, bool bypass_rlim);
> +
> +static inline int account_locked_vm(struct mm_struct *mm, unsigned long pages,
> +				    bool inc)
> +{
> +	int ret;
> +
> +	if (pages == 0 || !mm)
> +		return 0;
> +
> +	down_write(&mm->mmap_sem);
> +	ret = __account_locked_vm(mm, pages, inc, current,
> +				  capable(CAP_IPC_LOCK));
> +	up_write(&mm->mmap_sem);
> +
> +	return ret;
> +}
> +
>  /* Container for pinned pfns / pages */
>  struct frame_vector {
>  	unsigned int nr_allocated;	/* Number of frames we have space for */
> diff --git a/mm/util.c b/mm/util.c
> index 43a2984bccaa..552302665bc2 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -6,6 +6,7 @@
>  #include <linux/err.h>
>  #include <linux/sched.h>
>  #include <linux/sched/mm.h>
> +#include <linux/sched/signal.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/security.h>
>  #include <linux/swap.h>
> @@ -346,6 +347,53 @@ int __weak get_user_pages_fast(unsigned long start,
>  }
>  EXPORT_SYMBOL_GPL(get_user_pages_fast);
>  
> +/**
> + * __account_locked_vm - account locked pages to an mm's locked_vm
> + * @mm:          mm to account against, may be NULL
> + * @pages:       number of pages to account
> + * @inc:         %true if @pages should be considered positive, %false if not
> + * @task:        task used to check RLIMIT_MEMLOCK
> + * @bypass_rlim: %true if checking RLIMIT_MEMLOCK should be skipped
> + *
> + * Assumes @task and @mm are valid (i.e. at least one reference on each), and
> + * that mmap_sem is held as writer.
> + *
> + * Return:
> + * * 0       on success
> + * * 0       if @mm is NULL (can happen for example if the task is exiting)
> + * * -ENOMEM if RLIMIT_MEMLOCK would be exceeded.
> + */
> +int __account_locked_vm(struct mm_struct *mm, unsigned long pages, bool inc,
> +			struct task_struct *task, bool bypass_rlim)
> +{
> +	unsigned long locked_vm, limit;
> +	int ret = 0;
> +
> +	locked_vm = mm->locked_vm;
> +	if (inc) {
> +		if (!bypass_rlim) {
> +			limit = task_rlimit(task, RLIMIT_MEMLOCK) >> PAGE_SHIFT;
> +			if (locked_vm + pages > limit) {
> +				ret = -ENOMEM;
> +				goto out;
> +			}
> +		}

Nit:

if (!ret)

and then you don't need "goto out".


> +		mm->locked_vm = locked_vm + pages;
> +	} else {
> +		WARN_ON_ONCE(pages > locked_vm);
> +		mm->locked_vm = locked_vm - pages;


Can go negative here. Not a huge deal but inaccurate imo.


> +	}
> +
> +out:
> +	pr_debug("%s: [%d] %c%lu %lu/%lu%s\n", __func__, task->pid,
> +		 (inc) ? '+' : '-', pages << PAGE_SHIFT,
> +		 locked_vm << PAGE_SHIFT, task_rlimit(task, RLIMIT_MEMLOCK),
> +		 ret ? " - exceeded" : "");
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(__account_locked_vm);
> +
>  unsigned long vm_mmap_pgoff(struct file *file, unsigned long addr,
>  	unsigned long len, unsigned long prot,
>  	unsigned long flag, unsigned long pgoff)
> 
> base-commit: 37624b58542fb9f2d9a70e6ea006ef8a5f66c30b
> 

-- 
Alexey
