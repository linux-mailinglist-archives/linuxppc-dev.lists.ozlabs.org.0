Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFC68156A4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 04:12:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XCTZ9Odw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsWP2421Qz3cQg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 14:12:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XCTZ9Odw;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsWND5Y0tz3bTN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 14:12:12 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SsWNB4t77z4x5q
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 14:12:10 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SsWNB4nmlz4x3D; Sat, 16 Dec 2023 14:12:10 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XCTZ9Odw;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SsWNB1NPgz4x5q
	for <linuxppc-dev@ozlabs.org>; Sat, 16 Dec 2023 14:12:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702696325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jgBjk3xZUUlp8fedyMoM3i7Fer0zgmBfT7RMsCfLFXg=;
	b=XCTZ9OdwvHca0O2v9gGOapAA9573ETtF0WuDXwGswvMV0SQBiwcdumZdjNZhsr3cmKEzfO
	0thpHwrOu3sXaO2nP5Wao3e+t8TQytBmsmlzorflsDdL+zFZbQYbyqEdxfBwA4M/tk3r9S
	ZoEcRPCufa5vFU4YMp17HPp62lmI91w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-eUTe-m-8Mme1JA-7rLOXVQ-1; Fri, 15 Dec 2023 22:12:02 -0500
X-MC-Unique: eUTe-m-8Mme1JA-7rLOXVQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF549832D1A;
	Sat, 16 Dec 2023 03:12:01 +0000 (UTC)
Received: from localhost (unknown [10.72.116.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2867851D5;
	Sat, 16 Dec 2023 03:12:00 +0000 (UTC)
Date: Sat, 16 Dec 2023 11:11:57 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v14 6/6] powerpc: add crash memory hotplug support
Message-ID: <ZX0VfVwgxvLSlXFD@MiWiFi-R3L-srv>
References: <20231211083056.340404-1-sourabhjain@linux.ibm.com>
 <20231211083056.340404-7-sourabhjain@linux.ibm.com>
 <ZXuqjAsRlKP152YG@MiWiFi-R3L-srv>
 <c8f5893a-0f15-47a2-b8ee-90cbb77c24d8@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <c8f5893a-0f15-47a2-b8ee-90cbb77c24d8@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, linuxppc-dev@ozlabs.org, Eric DeVolder <eric.devolder@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Valentin Schneider <vschneid@redhat.com>, x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Naveen N Rao <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/15/23 at 11:29am, Sourabh Jain wrote:
......
> > > +static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *mn)
> > > +{
> > > +	int ret;
> > > +	struct crash_mem *cmem = NULL;
> > > +	struct kexec_segment *ksegment;
> > > +	void *ptr, *mem, *elfbuf = NULL;
> > > +	unsigned long elfsz, memsz, base_addr, size;
> > > +
> > > +	ksegment = &image->segment[image->elfcorehdr_index];
> > > +	mem = (void *) ksegment->mem;
> > > +	memsz = ksegment->memsz;
> > > +
> > > +	ret = get_crash_memory_ranges(&cmem);
> > > +	if (ret) {
> > > +		pr_err("Failed to get crash mem range\n");
> > > +		return;
> > > +	}
> > > +
> > > +	/*
> > > +	 * The hot unplugged memory is part of crash memory ranges,
> > > +	 * remove it here.
> > > +	 */
> > > +	if (image->hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY) {
> > > +		base_addr = PFN_PHYS(mn->start_pfn);
> > > +		size = mn->nr_pages * PAGE_SIZE;
> > > +		ret = remove_mem_range(&cmem, base_addr, size);
> > Althouth this is ppc specific, I don't understand. Why don't you
> > recreate the elfcorehdr, but take removing the removed region. Comparing the
> > remove_mem_range() implementation with recreating, I don't see too much
> > benefit from that, and it makes your code more complicated. Just
> > curious, surely ppc people can decide what should be taken.
> 
> I am recreating `elfcorehdr` by calling `crash_prepare_elf64_headers()`
> below.
> 
> This complexity is necessary to avoid adding hot-removed memory to the
> new `elfcorehdr`.
> 
> On powerpc, the memblock list is utilized to prepare the `elfcorehdr`. In
> the
> case of memory hot removal, the memblock list is updated after the arch
> crash hotplug handler is triggered. Thus, the hot-removed memory is
> explicitly
> removed from the crash memory ranges to ensure that the memory ranges
> added to `elfcorehdr` do not include the hot-removed memory.

Ah, I see. Thanks for the explanation. Then please ignore this one.

> 
> 
> > 
> > > +		if (ret) {
> > > +			pr_err("Failed to remove hot-unplugged from crash memory ranges.\n");
> > > +			return;
> > > +		}
> > > +	}
> > > +
> > > +	ret = crash_prepare_elf64_headers(cmem, false, &elfbuf, &elfsz);
> > > +	if (ret) {
> > > +		pr_err("Failed to prepare elf header\n");
> > > +		return;
> > > +	}
> > > +
> > > +	/*
> > > +	 * It is unlikely that kernel hit this because elfcorehdr kexec
> > > +	 * segment (memsz) is built with addition space to accommodate growing
> > > +	 * number of crash memory ranges while loading the kdump kernel. It is
> > > +	 * Just to avoid any unforeseen case.
> > > +	 */
> > > +	if (elfsz > memsz) {
> > > +		pr_err("Updated crash elfcorehdr elfsz %lu > memsz %lu", elfsz, memsz);
> > > +		goto out;
> > > +	}
> > > +
> > > +	ptr = __va(mem);
> > > +	if (ptr) {
> > > +		/* Temporarily invalidate the crash image while it is replaced */
> > > +		xchg(&kexec_crash_image, NULL);
> > > +
> > > +		/* Replace the old elfcorehdr with newly prepared elfcorehdr */
> > > +		memcpy((void *)ptr, elfbuf, elfsz);
> > > +
> > > +		/* The crash image is now valid once again */
> > > +		xchg(&kexec_crash_image, image);
> > > +	}
> > > +out:
> > > +	vfree(elfbuf);
> > > +}
> > > +
> > >   /**
> > >    * arch_crash_handle_hotplug_event - Handle crash CPU/Memory hotplug events to update the
> > >    *				     necessary kexec segments based on the hotplug event.
> > > @@ -572,7 +683,7 @@ int arch_crash_hotplug_cpu_support(struct kimage *image)
> > >    * CPU addition: Update the FDT segment to include the newly added CPU.
> > >    * CPU removal: No action is needed, with the assumption that it's okay to have offline CPUs
> > >    *		as part of the FDT.
> > > - * Memory addition/removal: No action is taken as this is not yet supported.
> > > + * Memory addition/removal: Recreate the elfcorehdr segment
> > >    */
> > >   void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
> > >   {
> > > @@ -593,7 +704,6 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
> > >   		return;
> > >   	} else if (hp_action == KEXEC_CRASH_HP_ADD_CPU) {
> > > -
> > >   		void *fdt, *ptr;
> > >   		unsigned long mem;
> > >   		int i, fdt_index = -1;
> > > @@ -628,8 +738,10 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
> > >   	} else if (hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY ||
> > >   		   hp_action == KEXEC_CRASH_HP_ADD_MEMORY) {
> > > -		pr_info_once("Crash update is not supported for memory hotplug\n");
> > > -		return;
> > > +		struct memory_notify *mn;
> > > +
> > > +		mn = (struct memory_notify *)arg;
> > > +		update_crash_elfcorehdr(image, mn);
> > >   	}
> > >   }
> > >   #endif
> > > diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> > > index e2148a009701..2457d7ec2075 100644
> > > --- a/arch/powerpc/kexec/file_load_64.c
> > > +++ b/arch/powerpc/kexec/file_load_64.c
> > > @@ -21,6 +21,8 @@
> > >   #include <linux/memblock.h>
> > >   #include <linux/slab.h>
> > >   #include <linux/vmalloc.h>
> > > +#include <linux/elf.h>
> > > +
> > >   #include <asm/setup.h>
> > >   #include <asm/cputhreads.h>
> > >   #include <asm/drmem.h>
> > > @@ -740,7 +742,35 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
> > >   	kbuf->buffer = headers;
> > >   	kbuf->mem = KEXEC_BUF_MEM_UNKNOWN;
> > > -	kbuf->bufsz = kbuf->memsz = headers_sz;
> > > +	kbuf->bufsz = headers_sz;
> > > +#if defined(CONFIG_CRASH_HOTPLUG) && defined(CONFIG_MEMORY_HOTPLUG)
> > > +	/* Adjust the elfcorehdr segment size to accommodate
> > > +	 * future crash memory ranges.
> > > +	 */
> > > +	int max_lmb;
> > > +	unsigned long pnum;
> > > +
> > > +	/* In the worst case, a Phdr is needed for every other LMB to be
> > > +	 * represented as an individual crash range.
> > > +	 */
> > > +	max_lmb = memory_hotplug_max() / (2 * drmem_lmb_size());
> > > +
> > > +	/* Do not cross the Phdr max limit of the elf header.
> > > +	 * Avoid counting Phdr for crash ranges (cmem->nr_ranges)
> > > +	 * which are already part of elfcorehdr.
> > > +	 */
> > > +	if (max_lmb > PN_XNUM)
> > > +		pnum = PN_XNUM - cmem->nr_ranges;
> > > +	else
> > > +		pnum = max_lmb - cmem->nr_ranges;
> > > +
> > > +	/* Additional buffer space for elfcorehdr to accommodate
> > > +	 * future memory ranges.
> > > +	 */
> > > +	kbuf->memsz = headers_sz + pnum * sizeof(Elf64_Phdr);
> > > +#else
> > > +	kbuf->memsz = headers_sz;
> > > +#endif
> > >   	kbuf->top_down = false;
> > >   	ret = kexec_add_buffer(kbuf);
> > > @@ -750,7 +780,7 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
> > >   	}
> > >   	image->elf_load_addr = kbuf->mem;
> > > -	image->elf_headers_sz = headers_sz;
> > > +	image->elf_headers_sz = kbuf->memsz;
> > >   	image->elf_headers = headers;
> > >   out:
> > >   	kfree(cmem);
> > > diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
> > > index fb3e12f15214..4fd0c5d5607b 100644
> > > --- a/arch/powerpc/kexec/ranges.c
> > > +++ b/arch/powerpc/kexec/ranges.c
> > > @@ -234,6 +234,91 @@ int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size)
> > >   	return __add_mem_range(mem_ranges, base, size);
> > >   }
> > > +/**
> > > + * remove_mem_range - Removes the given memory range from the range list.
> > > + * @mem_ranges:    Range list to remove the memory range to.
> > > + * @base:          Base address of the range to remove.
> > > + * @size:          Size of the memory range to remove.
> > > + *
> > > + * (Re)allocates memory, if needed.
> > > + *
> > > + * Returns 0 on success, negative errno on error.
> > > + */
> > > +int remove_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size)
> > > +{
> > > +	u64 end;
> > > +	int ret = 0;
> > > +	unsigned int i;
> > > +	u64 mstart, mend;
> > > +	struct crash_mem *mem_rngs = *mem_ranges;
> > > +
> > > +	if (!size)
> > > +		return 0;
> > > +
> > > +	/*
> > > +	 * Memory range are stored as start and end address, use
> > > +	 * the same format to do remove operation.
> > > +	 */
> > > +	end = base + size - 1;
> > > +
> > > +	for (i = 0; i < mem_rngs->nr_ranges; i++) {
> > > +		mstart = mem_rngs->ranges[i].start;
> > > +		mend = mem_rngs->ranges[i].end;
> > > +
> > > +		/*
> > > +		 * Memory range to remove is not part of this range entry
> > > +		 * in the memory range list
> > > +		 */
> > > +		if (!(base >= mstart && end <= mend))
> > > +			continue;
> > > +
> > > +		/*
> > > +		 * Memory range to remove is equivalent to this entry in the
> > > +		 * memory range list. Remove the range entry from the list.
> > > +		 */
> > > +		if (base == mstart && end == mend) {
> > > +			for (; i < mem_rngs->nr_ranges - 1; i++) {
> > > +				mem_rngs->ranges[i].start = mem_rngs->ranges[i+1].start;
> > > +				mem_rngs->ranges[i].end = mem_rngs->ranges[i+1].end;
> > > +			}
> > > +			mem_rngs->nr_ranges--;
> > > +			goto out;
> > > +		}
> > > +		/*
> > > +		 * Start address of the memory range to remove and the
> > > +		 * current memory range entry in the list is same. Just
> > > +		 * move the start address of the current memory range
> > > +		 * entry in the list to end + 1.
> > > +		 */
> > > +		else if (base == mstart) {
> > > +			mem_rngs->ranges[i].start = end + 1;
> > > +			goto out;
> > > +		}
> > > +		/*
> > > +		 * End address of the memory range to remove and the
> > > +		 * current memory range entry in the list is same.
> > > +		 * Just move the end address of the current memory
> > > +		 * range entry in the list to base - 1.
> > > +		 */
> > > +		else if (end == mend)  {
> > > +			mem_rngs->ranges[i].end = base - 1;
> > > +			goto out;
> > > +		}
> > > +		/*
> > > +		 * Memory range to remove is not at the edge of current
> > > +		 * memory range entry. Split the current memory entry into
> > > +		 * two half.
> > > +		 */
> > > +		else {
> > > +			mem_rngs->ranges[i].end = base - 1;
> > > +			size = mem_rngs->ranges[i].end - end;
> > > +			ret = add_mem_range(mem_ranges, end + 1, size);
> > > +		}
> > > +	}
> > > +out:
> > > +	return ret;
> > > +}
> > > +
> > >   /**
> > >    * add_tce_mem_ranges - Adds tce-table range to the given memory ranges list.
> > >    * @mem_ranges:         Range list to add the memory range(s) to.
> > > -- 
> > > 2.41.0
> > > 
> 

