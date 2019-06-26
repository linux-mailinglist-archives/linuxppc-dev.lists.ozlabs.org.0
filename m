Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB4655D0F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 02:46:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YPVR4SKqzDqZN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 10:46:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="B6I8/oOV"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YPSK4lf1zDqXD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 10:44:45 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id n2so267257pgp.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 17:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=odaGd/vvFg6XWZRKxNSKSVH5fubUgqzMshzX0ZrLcAI=;
 b=B6I8/oOVHcgzODNvngKYekJN0ffpD1Hk/vo2QN+QsUbks/o0bfsbfgHIiQUKr5ln/e
 vBDS3JmANPTvXIHFjKEtOw3fAgpU05QQOf4xfIYJjGmQtgL92AYUQw6RBAU3rVdtFd/z
 56k+GJhGVDNWgvGgls51J8kj9wb8LPgs5lXi4pyQ9SP6HtYzUlv0xcLsrMymIS3igw0e
 RbTS+icQocVpKV2DClYagiKGbUcDhybL57pTESZOhOHcaUSf95R/qtqj8VmHqEw/o2R1
 JtgFC8U1kljPYmBgYvkKng4NM/dgUG+W11m3wjIbwjkAlDbDe88wxjkkJvpo8WOW5ddr
 hqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=odaGd/vvFg6XWZRKxNSKSVH5fubUgqzMshzX0ZrLcAI=;
 b=m58oBPFeum9MU31A6ippG9icXlWp8/KLgTUgjd+rAjCW4wBOa7/H83OeVvvlroo+UL
 A7W+V7pa9d6gOy5ldhWNuFwci2muVWkpuweU85okZBekDQy58ntqE0nxliQ6Nxp9H9kZ
 6p7rIXq9vd+7Uej6NXes13OL45PzWUw8ZROk4xjqplIgMBrCKyQOILcSuOWK0E1AIqBy
 lU4CHsCoKS6PXrhYmBFQSOfsgfi8fkOP7IGGqlekk1AuuiKP2+Wy7IRdSF/5X5A5s3ZT
 IRs8kaxVx9iRPsXSXc3Njwx+0FFo7xSdmbnFTz7jwM/9svcB7PMjsDY7EhQPlyOBB19q
 Zv4Q==
X-Gm-Message-State: APjAAAXkgESMfG7n/8/34s+mjQ9GwW5Dv20pTALJTbi28nZIfUny1kkM
 o0oFWAVIzhzMa7VJSovKk+74YORiao0=
X-Google-Smtp-Source: APXvYqwae/oQRQjnGQDXqPvEKVDwAjaFkHL8H0qvfZLYBKqE3s4+ntnY/DDAvnIYS/3AxyeH1oZ/9w==
X-Received: by 2002:a17:90a:dd42:: with SMTP id
 u2mr858234pjv.118.1561509883567; 
 Tue, 25 Jun 2019 17:44:43 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b11sm13292625pfd.18.2019.06.25.17.44.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 17:44:42 -0700 (PDT)
Subject: Re: [PATCH 3/4] powerpc/powernv: remove unused NPU DMA code
To: Christoph Hellwig <hch@lst.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <20190625145239.2759-1-hch@lst.de>
 <20190625145239.2759-4-hch@lst.de>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Openpgp: preference=signencrypt
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <7bde96e0-7bc5-d5fe-f151-52c29660633c@ozlabs.ru>
Date: Wed, 26 Jun 2019 10:44:38 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190625145239.2759-4-hch@lst.de>
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Oliver O'Halloran <oohall@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 26/06/2019 00:52, Christoph Hellwig wrote:
> None of these routines were ever used anywhere in the kernel tree
> since they were added to the kernel.


So none of my comments has been addressed. Nice.


> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/powerpc/include/asm/book3s/64/mmu.h |   2 -
>  arch/powerpc/include/asm/powernv.h       |  22 -
>  arch/powerpc/mm/book3s64/mmu_context.c   |   1 -
>  arch/powerpc/platforms/powernv/npu-dma.c | 556 -----------------------
>  4 files changed, 581 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> index 74d24201fc4f..23b83d3593e2 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> @@ -116,8 +116,6 @@ typedef struct {
>  	/* Number of users of the external (Nest) MMU */
>  	atomic_t copros;
>  
> -	/* NPU NMMU context */
> -	struct npu_context *npu_context;
>  	struct hash_mm_context *hash_context;
>  
>  	unsigned long vdso_base;
> diff --git a/arch/powerpc/include/asm/powernv.h b/arch/powerpc/include/asm/powernv.h
> index 05b552418519..40f868c5e93c 100644
> --- a/arch/powerpc/include/asm/powernv.h
> +++ b/arch/powerpc/include/asm/powernv.h
> @@ -11,35 +11,13 @@
>  #define _ASM_POWERNV_H
>  
>  #ifdef CONFIG_PPC_POWERNV
> -#define NPU2_WRITE 1
>  extern void powernv_set_nmmu_ptcr(unsigned long ptcr);
> -extern struct npu_context *pnv_npu2_init_context(struct pci_dev *gpdev,
> -			unsigned long flags,
> -			void (*cb)(struct npu_context *, void *),
> -			void *priv);
> -extern void pnv_npu2_destroy_context(struct npu_context *context,
> -				struct pci_dev *gpdev);
> -extern int pnv_npu2_handle_fault(struct npu_context *context, uintptr_t *ea,
> -				unsigned long *flags, unsigned long *status,
> -				int count);
>  
>  void pnv_program_cpu_hotplug_lpcr(unsigned int cpu, u64 lpcr_val);
>  
>  void pnv_tm_init(void);
>  #else
>  static inline void powernv_set_nmmu_ptcr(unsigned long ptcr) { }
> -static inline struct npu_context *pnv_npu2_init_context(struct pci_dev *gpdev,
> -			unsigned long flags,
> -			struct npu_context *(*cb)(struct npu_context *, void *),
> -			void *priv) { return ERR_PTR(-ENODEV); }
> -static inline void pnv_npu2_destroy_context(struct npu_context *context,
> -					struct pci_dev *gpdev) { }
> -
> -static inline int pnv_npu2_handle_fault(struct npu_context *context,
> -					uintptr_t *ea, unsigned long *flags,
> -					unsigned long *status, int count) {
> -	return -ENODEV;
> -}
>  
>  static inline void pnv_tm_init(void) { }
>  #endif
> diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
> index cb2b08635508..0dd3e631cf3e 100644
> --- a/arch/powerpc/mm/book3s64/mmu_context.c
> +++ b/arch/powerpc/mm/book3s64/mmu_context.c
> @@ -140,7 +140,6 @@ static int radix__init_new_context(struct mm_struct *mm)
>  	 */
>  	asm volatile("ptesync;isync" : : : "memory");
>  
> -	mm->context.npu_context = NULL;
>  	mm->context.hash_context = NULL;
>  
>  	return index;
> diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
> index dc1058efc24f..72b7441029ca 100644
> --- a/arch/powerpc/platforms/powernv/npu-dma.c
> +++ b/arch/powerpc/platforms/powernv/npu-dma.c
> @@ -22,12 +22,6 @@
>  
>  #include "pci.h"
>  
> -/*
> - * spinlock to protect initialisation of an npu_context for a particular
> - * mm_struct.
> - */
> -static DEFINE_SPINLOCK(npu_context_lock);
> -
>  static struct pci_dev *get_pci_dev(struct device_node *dn)
>  {
>  	struct pci_dn *pdn = PCI_DN(dn);
> @@ -375,15 +369,6 @@ struct npu_comp {
>  /* An NPU descriptor, valid for POWER9 only */
>  struct npu {
>  	int index;
> -	__be64 *mmio_atsd_regs[NV_NMMU_ATSD_REGS];
> -	unsigned int mmio_atsd_count;
> -
> -	/* Bitmask for MMIO register usage */
> -	unsigned long mmio_atsd_usage;
> -
> -	/* Do we need to explicitly flush the nest mmu? */
> -	bool nmmu_flush;
> -
>  	struct npu_comp npucomp;
>  };
>  
> @@ -640,534 +625,8 @@ struct iommu_table_group *pnv_npu_compound_attach(struct pnv_ioda_pe *pe)
>  }
>  #endif /* CONFIG_IOMMU_API */
>  
> -/* Maximum number of nvlinks per npu */
> -#define NV_MAX_LINKS 6
> -
> -/* Maximum index of npu2 hosts in the system. Always < NV_MAX_NPUS */
> -static int max_npu2_index;
> -
> -struct npu_context {
> -	struct mm_struct *mm;
> -	struct pci_dev *npdev[NV_MAX_NPUS][NV_MAX_LINKS];
> -	struct mmu_notifier mn;
> -	struct kref kref;
> -	bool nmmu_flush;
> -
> -	/* Callback to stop translation requests on a given GPU */
> -	void (*release_cb)(struct npu_context *context, void *priv);
> -
> -	/*
> -	 * Private pointer passed to the above callback for usage by
> -	 * device drivers.
> -	 */
> -	void *priv;
> -};
> -
> -struct mmio_atsd_reg {
> -	struct npu *npu;
> -	int reg;
> -};
> -
> -/*
> - * Find a free MMIO ATSD register and mark it in use. Return -ENOSPC
> - * if none are available.
> - */
> -static int get_mmio_atsd_reg(struct npu *npu)
> -{
> -	int i;
> -
> -	for (i = 0; i < npu->mmio_atsd_count; i++) {
> -		if (!test_bit(i, &npu->mmio_atsd_usage))
> -			if (!test_and_set_bit_lock(i, &npu->mmio_atsd_usage))
> -				return i;
> -	}
> -
> -	return -ENOSPC;
> -}
> -
> -static void put_mmio_atsd_reg(struct npu *npu, int reg)
> -{
> -	clear_bit_unlock(reg, &npu->mmio_atsd_usage);
> -}
> -
> -/* MMIO ATSD register offsets */
> -#define XTS_ATSD_LAUNCH 0
> -#define XTS_ATSD_AVA    1
> -#define XTS_ATSD_STAT   2
> -
> -static unsigned long get_atsd_launch_val(unsigned long pid, unsigned long psize)
> -{
> -	unsigned long launch = 0;
> -
> -	if (psize == MMU_PAGE_COUNT) {
> -		/* IS set to invalidate entire matching PID */
> -		launch |= PPC_BIT(12);
> -	} else {
> -		/* AP set to invalidate region of psize */
> -		launch |= (u64)mmu_get_ap(psize) << PPC_BITLSHIFT(17);
> -	}
> -
> -	/* PRS set to process-scoped */
> -	launch |= PPC_BIT(13);
> -
> -	/* PID */
> -	launch |= pid << PPC_BITLSHIFT(38);
> -
> -	/* Leave "No flush" (bit 39) 0 so every ATSD performs a flush */
> -
> -	return launch;
> -}
> -
> -static void mmio_atsd_regs_write(struct mmio_atsd_reg
> -			mmio_atsd_reg[NV_MAX_NPUS], unsigned long offset,
> -			unsigned long val)
> -{
> -	struct npu *npu;
> -	int i, reg;
> -
> -	for (i = 0; i <= max_npu2_index; i++) {
> -		reg = mmio_atsd_reg[i].reg;
> -		if (reg < 0)
> -			continue;
> -
> -		npu = mmio_atsd_reg[i].npu;
> -		__raw_writeq_be(val, npu->mmio_atsd_regs[reg] + offset);
> -	}
> -}
> -
> -static void mmio_invalidate_pid(struct mmio_atsd_reg mmio_atsd_reg[NV_MAX_NPUS],
> -				unsigned long pid)
> -{
> -	unsigned long launch = get_atsd_launch_val(pid, MMU_PAGE_COUNT);
> -
> -	/* Invalidating the entire process doesn't use a va */
> -	mmio_atsd_regs_write(mmio_atsd_reg, XTS_ATSD_LAUNCH, launch);
> -}
> -
> -static void mmio_invalidate_range(struct mmio_atsd_reg
> -			mmio_atsd_reg[NV_MAX_NPUS], unsigned long pid,
> -			unsigned long start, unsigned long psize)
> -{
> -	unsigned long launch = get_atsd_launch_val(pid, psize);
> -
> -	/* Write all VAs first */
> -	mmio_atsd_regs_write(mmio_atsd_reg, XTS_ATSD_AVA, start);
> -
> -	/* Issue one barrier for all address writes */
> -	eieio();
> -
> -	/* Launch */
> -	mmio_atsd_regs_write(mmio_atsd_reg, XTS_ATSD_LAUNCH, launch);
> -}
> -
> -#define mn_to_npu_context(x) container_of(x, struct npu_context, mn)
> -
> -static void mmio_invalidate_wait(
> -	struct mmio_atsd_reg mmio_atsd_reg[NV_MAX_NPUS])
> -{
> -	struct npu *npu;
> -	int i, reg;
> -
> -	/* Wait for all invalidations to complete */
> -	for (i = 0; i <= max_npu2_index; i++) {
> -		if (mmio_atsd_reg[i].reg < 0)
> -			continue;
> -
> -		/* Wait for completion */
> -		npu = mmio_atsd_reg[i].npu;
> -		reg = mmio_atsd_reg[i].reg;
> -		while (__raw_readq(npu->mmio_atsd_regs[reg] + XTS_ATSD_STAT))
> -			cpu_relax();
> -	}
> -}
> -
> -/*
> - * Acquires all the address translation shootdown (ATSD) registers required to
> - * launch an ATSD on all links this npu_context is active on.
> - */
> -static void acquire_atsd_reg(struct npu_context *npu_context,
> -			struct mmio_atsd_reg mmio_atsd_reg[NV_MAX_NPUS])
> -{
> -	int i, j;
> -	struct npu *npu;
> -	struct pci_dev *npdev;
> -
> -	for (i = 0; i <= max_npu2_index; i++) {
> -		mmio_atsd_reg[i].reg = -1;
> -		for (j = 0; j < NV_MAX_LINKS; j++) {
> -			/*
> -			 * There are no ordering requirements with respect to
> -			 * the setup of struct npu_context, but to ensure
> -			 * consistent behaviour we need to ensure npdev[][] is
> -			 * only read once.
> -			 */
> -			npdev = READ_ONCE(npu_context->npdev[i][j]);
> -			if (!npdev)
> -				continue;
> -
> -			npu = pci_bus_to_host(npdev->bus)->npu;
> -			if (!npu)
> -				continue;
> -
> -			mmio_atsd_reg[i].npu = npu;
> -			mmio_atsd_reg[i].reg = get_mmio_atsd_reg(npu);
> -			while (mmio_atsd_reg[i].reg < 0) {
> -				mmio_atsd_reg[i].reg = get_mmio_atsd_reg(npu);
> -				cpu_relax();
> -			}
> -			break;
> -		}
> -	}
> -}
> -
> -/*
> - * Release previously acquired ATSD registers. To avoid deadlocks the registers
> - * must be released in the same order they were acquired above in
> - * acquire_atsd_reg.
> - */
> -static void release_atsd_reg(struct mmio_atsd_reg mmio_atsd_reg[NV_MAX_NPUS])
> -{
> -	int i;
> -
> -	for (i = 0; i <= max_npu2_index; i++) {
> -		/*
> -		 * We can't rely on npu_context->npdev[][] being the same here
> -		 * as when acquire_atsd_reg() was called, hence we use the
> -		 * values stored in mmio_atsd_reg during the acquire phase
> -		 * rather than re-reading npdev[][].
> -		 */
> -		if (mmio_atsd_reg[i].reg < 0)
> -			continue;
> -
> -		put_mmio_atsd_reg(mmio_atsd_reg[i].npu, mmio_atsd_reg[i].reg);
> -	}
> -}
> -
> -/*
> - * Invalidate a virtual address range
> - */
> -static void mmio_invalidate(struct npu_context *npu_context,
> -			unsigned long start, unsigned long size)
> -{
> -	struct mmio_atsd_reg mmio_atsd_reg[NV_MAX_NPUS];
> -	unsigned long pid = npu_context->mm->context.id;
> -	unsigned long atsd_start = 0;
> -	unsigned long end = start + size - 1;
> -	int atsd_psize = MMU_PAGE_COUNT;
> -
> -	/*
> -	 * Convert the input range into one of the supported sizes. If the range
> -	 * doesn't fit, use the next larger supported size. Invalidation latency
> -	 * is high, so over-invalidation is preferred to issuing multiple
> -	 * invalidates.
> -	 *
> -	 * A 4K page size isn't supported by NPU/GPU ATS, so that case is
> -	 * ignored.
> -	 */
> -	if (size == SZ_64K) {
> -		atsd_start = start;
> -		atsd_psize = MMU_PAGE_64K;
> -	} else if (ALIGN_DOWN(start, SZ_2M) == ALIGN_DOWN(end, SZ_2M)) {
> -		atsd_start = ALIGN_DOWN(start, SZ_2M);
> -		atsd_psize = MMU_PAGE_2M;
> -	} else if (ALIGN_DOWN(start, SZ_1G) == ALIGN_DOWN(end, SZ_1G)) {
> -		atsd_start = ALIGN_DOWN(start, SZ_1G);
> -		atsd_psize = MMU_PAGE_1G;
> -	}
> -
> -	if (npu_context->nmmu_flush)
> -		/*
> -		 * Unfortunately the nest mmu does not support flushing specific
> -		 * addresses so we have to flush the whole mm once before
> -		 * shooting down the GPU translation.
> -		 */
> -		flush_all_mm(npu_context->mm);
> -
> -	/*
> -	 * Loop over all the NPUs this process is active on and launch
> -	 * an invalidate.
> -	 */
> -	acquire_atsd_reg(npu_context, mmio_atsd_reg);
> -
> -	if (atsd_psize == MMU_PAGE_COUNT)
> -		mmio_invalidate_pid(mmio_atsd_reg, pid);
> -	else
> -		mmio_invalidate_range(mmio_atsd_reg, pid, atsd_start,
> -					atsd_psize);
> -
> -	mmio_invalidate_wait(mmio_atsd_reg);
> -
> -	/*
> -	 * The GPU requires two flush ATSDs to ensure all entries have been
> -	 * flushed. We use PID 0 as it will never be used for a process on the
> -	 * GPU.
> -	 */
> -	mmio_invalidate_pid(mmio_atsd_reg, 0);
> -	mmio_invalidate_wait(mmio_atsd_reg);
> -	mmio_invalidate_pid(mmio_atsd_reg, 0);
> -	mmio_invalidate_wait(mmio_atsd_reg);
> -
> -	release_atsd_reg(mmio_atsd_reg);
> -}
> -
> -static void pnv_npu2_mn_release(struct mmu_notifier *mn,
> -				struct mm_struct *mm)
> -{
> -	struct npu_context *npu_context = mn_to_npu_context(mn);
> -
> -	/* Call into device driver to stop requests to the NMMU */
> -	if (npu_context->release_cb)
> -		npu_context->release_cb(npu_context, npu_context->priv);
> -
> -	/*
> -	 * There should be no more translation requests for this PID, but we
> -	 * need to ensure any entries for it are removed from the TLB.
> -	 */
> -	mmio_invalidate(npu_context, 0, ~0UL);
> -}
> -
> -static void pnv_npu2_mn_invalidate_range(struct mmu_notifier *mn,
> -					struct mm_struct *mm,
> -					unsigned long start, unsigned long end)
> -{
> -	struct npu_context *npu_context = mn_to_npu_context(mn);
> -	mmio_invalidate(npu_context, start, end - start);
> -}
> -
> -static const struct mmu_notifier_ops nv_nmmu_notifier_ops = {
> -	.release = pnv_npu2_mn_release,
> -	.invalidate_range = pnv_npu2_mn_invalidate_range,
> -};
> -
> -/*
> - * Call into OPAL to setup the nmmu context for the current task in
> - * the NPU. This must be called to setup the context tables before the
> - * GPU issues ATRs. pdev should be a pointed to PCIe GPU device.
> - *
> - * A release callback should be registered to allow a device driver to
> - * be notified that it should not launch any new translation requests
> - * as the final TLB invalidate is about to occur.
> - *
> - * Returns an error if there no contexts are currently available or a
> - * npu_context which should be passed to pnv_npu2_handle_fault().
> - *
> - * mmap_sem must be held in write mode and must not be called from interrupt
> - * context.
> - */
> -struct npu_context *pnv_npu2_init_context(struct pci_dev *gpdev,
> -			unsigned long flags,
> -			void (*cb)(struct npu_context *, void *),
> -			void *priv)
> -{
> -	int rc;
> -	u32 nvlink_index;
> -	struct device_node *nvlink_dn;
> -	struct mm_struct *mm = current->mm;
> -	struct npu *npu;
> -	struct npu_context *npu_context;
> -	struct pci_controller *hose;
> -
> -	/*
> -	 * At present we don't support GPUs connected to multiple NPUs and I'm
> -	 * not sure the hardware does either.
> -	 */
> -	struct pci_dev *npdev = pnv_pci_get_npu_dev(gpdev, 0);
> -
> -	if (!npdev)
> -		/* No nvlink associated with this GPU device */
> -		return ERR_PTR(-ENODEV);
> -
> -	/* We only support DR/PR/HV in pnv_npu2_map_lpar_dev() */
> -	if (flags & ~(MSR_DR | MSR_PR | MSR_HV))
> -		return ERR_PTR(-EINVAL);
> -
> -	nvlink_dn = of_parse_phandle(npdev->dev.of_node, "ibm,nvlink", 0);
> -	if (WARN_ON(of_property_read_u32(nvlink_dn, "ibm,npu-link-index",
> -							&nvlink_index)))
> -		return ERR_PTR(-ENODEV);
> -
> -	if (!mm || mm->context.id == 0) {
> -		/*
> -		 * Kernel thread contexts are not supported and context id 0 is
> -		 * reserved on the GPU.
> -		 */
> -		return ERR_PTR(-EINVAL);
> -	}
> -
> -	hose = pci_bus_to_host(npdev->bus);
> -	npu = hose->npu;
> -	if (!npu)
> -		return ERR_PTR(-ENODEV);
> -
> -	/*
> -	 * We store the npu pci device so we can more easily get at the
> -	 * associated npus.
> -	 */
> -	spin_lock(&npu_context_lock);
> -	npu_context = mm->context.npu_context;
> -	if (npu_context) {
> -		if (npu_context->release_cb != cb ||
> -			npu_context->priv != priv) {
> -			spin_unlock(&npu_context_lock);
> -			return ERR_PTR(-EINVAL);
> -		}
> -
> -		WARN_ON(!kref_get_unless_zero(&npu_context->kref));
> -	}
> -	spin_unlock(&npu_context_lock);
> -
> -	if (!npu_context) {
> -		/*
> -		 * We can set up these fields without holding the
> -		 * npu_context_lock as the npu_context hasn't been returned to
> -		 * the caller meaning it can't be destroyed. Parallel allocation
> -		 * is protected against by mmap_sem.
> -		 */
> -		rc = -ENOMEM;
> -		npu_context = kzalloc(sizeof(struct npu_context), GFP_KERNEL);
> -		if (npu_context) {
> -			kref_init(&npu_context->kref);
> -			npu_context->mm = mm;
> -			npu_context->mn.ops = &nv_nmmu_notifier_ops;
> -			rc = __mmu_notifier_register(&npu_context->mn, mm);
> -		}
> -
> -		if (rc) {
> -			kfree(npu_context);
> -			return ERR_PTR(rc);
> -		}
> -
> -		mm->context.npu_context = npu_context;
> -	}
> -
> -	npu_context->release_cb = cb;
> -	npu_context->priv = priv;
> -
> -	/*
> -	 * npdev is a pci_dev pointer setup by the PCI code. We assign it to
> -	 * npdev[][] to indicate to the mmu notifiers that an invalidation
> -	 * should also be sent over this nvlink. The notifiers don't use any
> -	 * other fields in npu_context, so we just need to ensure that when they
> -	 * deference npu_context->npdev[][] it is either a valid pointer or
> -	 * NULL.
> -	 */
> -	WRITE_ONCE(npu_context->npdev[npu->index][nvlink_index], npdev);
> -
> -	if (!npu->nmmu_flush) {
> -		/*
> -		 * If we're not explicitly flushing ourselves we need to mark
> -		 * the thread for global flushes
> -		 */
> -		npu_context->nmmu_flush = false;
> -		mm_context_add_copro(mm);
> -	} else
> -		npu_context->nmmu_flush = true;
> -
> -	return npu_context;
> -}
> -EXPORT_SYMBOL(pnv_npu2_init_context);
> -
> -static void pnv_npu2_release_context(struct kref *kref)
> -{
> -	struct npu_context *npu_context =
> -		container_of(kref, struct npu_context, kref);
> -
> -	if (!npu_context->nmmu_flush)
> -		mm_context_remove_copro(npu_context->mm);
> -
> -	npu_context->mm->context.npu_context = NULL;
> -}
> -
> -/*
> - * Destroy a context on the given GPU. May free the npu_context if it is no
> - * longer active on any GPUs. Must not be called from interrupt context.
> - */
> -void pnv_npu2_destroy_context(struct npu_context *npu_context,
> -			struct pci_dev *gpdev)
> -{
> -	int removed;
> -	struct npu *npu;
> -	struct pci_dev *npdev = pnv_pci_get_npu_dev(gpdev, 0);
> -	struct device_node *nvlink_dn;
> -	u32 nvlink_index;
> -	struct pci_controller *hose;
> -
> -	if (WARN_ON(!npdev))
> -		return;
> -
> -	hose = pci_bus_to_host(npdev->bus);
> -	npu = hose->npu;
> -	if (!npu)
> -		return;
> -	nvlink_dn = of_parse_phandle(npdev->dev.of_node, "ibm,nvlink", 0);
> -	if (WARN_ON(of_property_read_u32(nvlink_dn, "ibm,npu-link-index",
> -							&nvlink_index)))
> -		return;
> -	WRITE_ONCE(npu_context->npdev[npu->index][nvlink_index], NULL);
> -	spin_lock(&npu_context_lock);
> -	removed = kref_put(&npu_context->kref, pnv_npu2_release_context);
> -	spin_unlock(&npu_context_lock);
> -
> -	/*
> -	 * We need to do this outside of pnv_npu2_release_context so that it is
> -	 * outside the spinlock as mmu_notifier_destroy uses SRCU.
> -	 */
> -	if (removed) {
> -		mmu_notifier_unregister(&npu_context->mn,
> -					npu_context->mm);
> -
> -		kfree(npu_context);
> -	}
> -
> -}
> -EXPORT_SYMBOL(pnv_npu2_destroy_context);
> -
> -/*
> - * Assumes mmap_sem is held for the contexts associated mm.
> - */
> -int pnv_npu2_handle_fault(struct npu_context *context, uintptr_t *ea,
> -			unsigned long *flags, unsigned long *status, int count)
> -{
> -	u64 rc = 0, result = 0;
> -	int i, is_write;
> -	struct page *page[1];
> -	const char __user *u;
> -	char c;
> -
> -	/* mmap_sem should be held so the struct_mm must be present */
> -	struct mm_struct *mm = context->mm;
> -
> -	WARN_ON(!rwsem_is_locked(&mm->mmap_sem));
> -
> -	for (i = 0; i < count; i++) {
> -		is_write = flags[i] & NPU2_WRITE;
> -		rc = get_user_pages_remote(NULL, mm, ea[i], 1,
> -					is_write ? FOLL_WRITE : 0,
> -					page, NULL, NULL);
> -
> -		if (rc != 1) {
> -			status[i] = rc;
> -			result = -EFAULT;
> -			continue;
> -		}
> -
> -		/* Make sure partition scoped tree gets a pte */
> -		u = page_address(page[0]);
> -		if (__get_user(c, u))
> -			result = -EFAULT;
> -
> -		status[i] = 0;
> -		put_page(page[0]);
> -	}
> -
> -	return result;
> -}
> -EXPORT_SYMBOL(pnv_npu2_handle_fault);
> -
>  int pnv_npu2_init(struct pci_controller *hose)
>  {
> -	unsigned int i;
> -	u64 mmio_atsd;
>  	static int npu_index;
>  	struct npu *npu;
>  	int ret;
> @@ -1176,33 +635,18 @@ int pnv_npu2_init(struct pci_controller *hose)
>  	if (!npu)
>  		return -ENOMEM;
>  
> -	npu->nmmu_flush = of_property_read_bool(hose->dn, "ibm,nmmu-flush");
> -
> -	for (i = 0; i < ARRAY_SIZE(npu->mmio_atsd_regs) &&
> -			!of_property_read_u64_index(hose->dn, "ibm,mmio-atsd",
> -				i, &mmio_atsd); i++)
> -		npu->mmio_atsd_regs[i] = ioremap(mmio_atsd, 32);
> -
> -	pr_info("NPU%d: Found %d MMIO ATSD registers", hose->global_number, i);
> -	npu->mmio_atsd_count = i;
> -	npu->mmio_atsd_usage = 0;
>  	npu_index++;
>  	if (WARN_ON(npu_index >= NV_MAX_NPUS)) {
>  		ret = -ENOSPC;
>  		goto fail_exit;
>  	}
> -	max_npu2_index = npu_index;
>  	npu->index = npu_index;
>  	hose->npu = npu;
>  
>  	return 0;
>  
>  fail_exit:
> -	for (i = 0; i < npu->mmio_atsd_count; ++i)
> -		iounmap(npu->mmio_atsd_regs[i]);
> -
>  	kfree(npu);
> -
>  	return ret;
>  }
>  
> 

-- 
Alexey
