Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9D620C55D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 04:16:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vZ4j5XbSzDrBm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 12:16:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49vZ2v0pF9zDqZG
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 12:15:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=MxH8pyMw; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49vZ2t5FSQz9Ch2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 12:15:18 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49vZ2t4cgyz9sQt; Sun, 28 Jun 2020 12:15:18 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=piliu@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=MxH8pyMw; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49vZ2s5FNfz9s6w
 for <linuxppc-dev@ozlabs.org>; Sun, 28 Jun 2020 12:15:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593310511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lHkgXPvbueXVaPuDj59YhQ91Y40VbEgtT/Lr+w0Uch8=;
 b=MxH8pyMwyJGdCXLWpSktzkLwyjXWU4xFvrksqBHhW1rbchRvV2Uk54Eq2nHCjJ6YFHgizn
 YykcN24VQIzcPkCbR5q9gQ2+5XX+AJYsg9ksCo9P2hUZCm53//ekoye5Ktr3VJVbOMYN4C
 niaiYnEL9YLcmv2QlH28BAPENOLUUlc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-PAXJtsQhO8aJIB4xBY0o4Q-1; Sat, 27 Jun 2020 22:15:00 -0400
X-MC-Unique: PAXJtsQhO8aJIB4xBY0o4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0AB98015F0;
 Sun, 28 Jun 2020 02:14:57 +0000 (UTC)
Received: from [10.72.8.17] (ovpn-8-17.pek2.redhat.com [10.72.8.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2030E5C662;
 Sun, 28 Jun 2020 02:14:47 +0000 (UTC)
Subject: Re: [PATCH 04/11] ppc64/kexec_file: avoid stomping memory used by
 special regions
To: Hari Bathini <hbathini@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
References: <159319825403.16351.7253978047621755765.stgit@hbathini.in.ibm.com>
 <159319831192.16351.17443438699302756548.stgit@hbathini.in.ibm.com>
From: piliu <piliu@redhat.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <9cfda789-0747-a67a-b825-5ea6f15099b8@redhat.com>
Date: Sun, 28 Jun 2020 10:14:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <159319831192.16351.17443438699302756548.stgit@hbathini.in.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Kexec-ml <kexec@lists.infradead.org>, Petr Tesarik <ptesarik@suse.cz>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Hari,

After a quick through for this series, I have a few question/comment on
this patch for the time being. Pls see comment inline.

On 06/27/2020 03:05 AM, Hari Bathini wrote:
> crashkernel region could have an overlap with special memory regions
> like  opal, rtas, tce-table & such. These regions are referred to as
> exclude memory ranges. Setup this ranges during image probe in order
> to avoid them while finding the buffer for different kdump segments.
> Implement kexec_locate_mem_hole_ppc64() that locates a memory hole
> accounting for these ranges. Also, override arch_kexec_add_buffer()
> to locate a memory hole & later call __kexec_add_buffer() function
> with kbuf->mem set to skip the generic locate memory hole lookup.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/crashdump-ppc64.h |   10 +
>  arch/powerpc/include/asm/kexec.h           |    7 -
>  arch/powerpc/kexec/elf_64.c                |    7 +
>  arch/powerpc/kexec/file_load_64.c          |  292 ++++++++++++++++++++++++++++
>  4 files changed, 312 insertions(+), 4 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/crashdump-ppc64.h
> 
> diff --git a/arch/powerpc/include/asm/crashdump-ppc64.h b/arch/powerpc/include/asm/crashdump-ppc64.h
> new file mode 100644
> index 0000000..3596c25
> --- /dev/null
> +++ b/arch/powerpc/include/asm/crashdump-ppc64.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _ARCH_POWERPC_KEXEC_CRASHDUMP_PPC64_H
> +#define _ARCH_POWERPC_KEXEC_CRASHDUMP_PPC64_H
> +
> +/* min & max addresses for kdump load segments */
> +#define KDUMP_BUF_MIN		(crashk_res.start)
> +#define KDUMP_BUF_MAX		((crashk_res.end < ppc64_rma_size) ? \
> +				 crashk_res.end : (ppc64_rma_size - 1))
> +
> +#endif /* __ARCH_POWERPC_KEXEC_CRASHDUMP_PPC64_H */
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index 7008ea1..bf47a01 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -100,14 +100,16 @@ void relocate_new_kernel(unsigned long indirection_page, unsigned long reboot_co
>  #ifdef CONFIG_KEXEC_FILE
>  extern const struct kexec_file_ops kexec_elf64_ops;
>  
> -#ifdef CONFIG_IMA_KEXEC
>  #define ARCH_HAS_KIMAGE_ARCH
>  
>  struct kimage_arch {
> +	struct crash_mem *exclude_ranges;
> +
> +#ifdef CONFIG_IMA_KEXEC
>  	phys_addr_t ima_buffer_addr;
>  	size_t ima_buffer_size;
> -};
>  #endif
> +};
>  
>  int setup_purgatory(struct kimage *image, const void *slave_code,
>  		    const void *fdt, unsigned long kernel_load_addr,
> @@ -125,6 +127,7 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
>  			unsigned long initrd_load_addr,
>  			unsigned long initrd_len, const char *cmdline);
>  #endif /* CONFIG_PPC64 */
> +
>  #endif /* CONFIG_KEXEC_FILE */
>  
>  #else /* !CONFIG_KEXEC_CORE */
> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
> index 23ad04c..c695f94 100644
> --- a/arch/powerpc/kexec/elf_64.c
> +++ b/arch/powerpc/kexec/elf_64.c
> @@ -22,6 +22,7 @@
>  #include <linux/of_fdt.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <asm/crashdump-ppc64.h>
>  
>  static void *elf64_load(struct kimage *image, char *kernel_buf,
>  			unsigned long kernel_len, char *initrd,
> @@ -46,6 +47,12 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>  	if (ret)
>  		goto out;
>  
> +	if (image->type == KEXEC_TYPE_CRASH) {
> +		/* min & max buffer values for kdump case */
> +		kbuf.buf_min = pbuf.buf_min = KDUMP_BUF_MIN;
> +		kbuf.buf_max = pbuf.buf_max = KDUMP_BUF_MAX;
> +	}
> +
>  	ret = kexec_elf_load(image, &ehdr, &elf_info, &kbuf, &kernel_load_addr);
>  	if (ret)
>  		goto out;
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index e6bff960..f1d7160 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -17,6 +17,8 @@
>  #include <linux/kexec.h>
>  #include <linux/of_fdt.h>
>  #include <linux/libfdt.h>
> +#include <asm/kexec_ranges.h>
> +#include <asm/crashdump-ppc64.h>
>  
>  const struct kexec_file_ops * const kexec_file_loaders[] = {
>  	&kexec_elf64_ops,
> @@ -24,6 +26,247 @@ const struct kexec_file_ops * const kexec_file_loaders[] = {
>  };
>  
>  /**
> + * get_exclude_memory_ranges - Get exclude memory ranges. This list includes
> + *                             regions like opal/rtas, tce-table, initrd,
> + *                             kernel, htab which should be avoided while
> + *                             setting up kexec load segments.
> + * @mem_ranges:                Range list to add the memory ranges to.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +static int get_exclude_memory_ranges(struct crash_mem **mem_ranges)
Is it needed? See the comment below.
> +{
> +	int ret;
> +
> +	ret = add_tce_mem_ranges(mem_ranges);
> +	if (ret)
> +		goto out;
> +
> +	ret = add_initrd_mem_range(mem_ranges);
> +	if (ret)
> +		goto out;
> +
> +	ret = add_htab_mem_range(mem_ranges);
> +	if (ret)
> +		goto out;
> +
> +	ret = add_kernel_mem_range(mem_ranges);
> +	if (ret)
> +		goto out;
> +
> +	ret = add_rtas_mem_range(mem_ranges, false);
> +	if (ret)
> +		goto out;
> +
> +	ret = add_opal_mem_range(mem_ranges, false);
> +	if (ret)
> +		goto out;
> +
> +	ret = add_reserved_ranges(mem_ranges);
> +	if (ret)
> +		goto out;
> +
> +	/* exclude memory ranges should be sorted for easy lookup */
> +	sort_memory_ranges(*mem_ranges);
> +out:
> +	if (ret)
> +		pr_err("Failed to setup exclude memory ranges\n");
> +	return ret;
> +}
> +
> +/**
> + * __locate_mem_hole_ppc64 - Tests if the memory hole between buf_min & buf_max
> + *                           is large enough for the buffer. If true, sets
> + *                           kbuf->mem to the buffer.
> + * @kbuf:                    Buffer contents and memory parameters.
> + * @buf_min:                 Minimum address for the buffer.
> + * @buf_max:                 Maximum address for the buffer.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +static int __locate_mem_hole_ppc64(struct kexec_buf *kbuf,
> +				   u64 buf_min, u64 buf_max)
> +{
> +	int ret = -EADDRNOTAVAIL;
> +
> +	buf_min = ALIGN(buf_min, kbuf->buf_align);
> +
> +	if (buf_min < buf_max &&
> +	    (buf_max - buf_min + 1) >= kbuf->memsz) {
> +		/*
> +		 * Suitable memory range found. Set kbuf->mem here to skip
> +		 * locate memory hole routine in __kexec_add_buffer() call.
> +		 */
> +		ret = 0;
> +		if (kbuf->top_down)
> +			kbuf->mem = ALIGN_DOWN(buf_max - kbuf->memsz + 1,
> +					       kbuf->buf_align);
> +		else
> +			kbuf->mem = buf_min;
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * locate_mem_hole_top_down_ppc64 - Skip special memory regions to find a
> + *                                  suitable buffer with top down approach.
> + * @kbuf:                           Buffer contents and memory parameters.
> + * @buf_min:                        Minimum address for the buffer.
> + * @buf_max:                        Maximum address for the buffer.
> + * @emem:                           Exclude memory ranges.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +static int locate_mem_hole_top_down_ppc64(struct kexec_buf *kbuf,
> +					  u64 buf_min, u64 buf_max,
> +					  const struct crash_mem *emem)
> +{
> +	int i, ret = 0, err = -EADDRNOTAVAIL;
> +	u64 start, end, tmin, tmax;
> +
> +	tmax = buf_max;
> +	for (i = (emem->nr_ranges - 1); i >= 0; i--) {
> +		start = emem->ranges[i].start;
> +		end = emem->ranges[i].end;
> +
> +		if (start > tmax)
> +			continue;
> +
> +		if (end < tmax) {
> +			tmin = (end < buf_min ? buf_min : end + 1);
> +			ret = __locate_mem_hole_ppc64(kbuf, tmin, tmax);
> +			if (!ret)
> +				return 0;
> +		}
> +
> +		tmax = start - 1;
> +
> +		if (tmax < buf_min) {
> +			ret = err;
> +			break;
> +		}
> +		ret = 0;
> +	}
> +
> +	if (!ret) {
> +		tmin = buf_min;
> +		ret = __locate_mem_hole_ppc64(kbuf, tmin, tmax);
> +	}
> +	return ret;
> +}
> +
> +/**
> + * locate_mem_hole_bottom_up_ppc64 - Skip special memory regions to find a
> + *                                   suitable buffer with bottom up approach.
> + * @kbuf:                            Buffer contents and memory parameters.
> + * @buf_min:                         Minimum address for the buffer.
> + * @buf_max:                         Maximum address for the buffer.
> + * @emem:                            Exclude memory ranges.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +static int locate_mem_hole_bottom_up_ppc64(struct kexec_buf *kbuf,
> +					   u64 buf_min, u64 buf_max,
> +					   const struct crash_mem *emem)
> +{
> +	int i, ret = 0, err = -EADDRNOTAVAIL;
> +	u64 start, end, tmin, tmax;
> +
> +	tmin = buf_min;
> +	for (i = 0; i < emem->nr_ranges; i++) {
> +		start = emem->ranges[i].start;
> +		end = emem->ranges[i].end;
> +
> +		if (end < tmin)
> +			continue;
> +
> +		if (start > tmin) {
> +			tmax = (start > buf_max ? buf_max : start - 1);
> +			ret = __locate_mem_hole_ppc64(kbuf, tmin, tmax);
> +			if (!ret)
> +				return 0;
> +		}
> +
> +		tmin = end + 1;
> +
> +		if (tmin > buf_max) {
> +			ret = err;
> +			break;
> +		}
> +		ret = 0;
> +	}
> +
> +	if (!ret) {
> +		tmax = buf_max;
> +		ret = __locate_mem_hole_ppc64(kbuf, tmin, tmax);
> +	}
> +	return ret;
> +}
> +
> +/**
> + * kexec_locate_mem_hole_ppc64 - Skip special memory regions like rtas,
> + *                               tce-table, opal, reserved-ranges & such
> + *                               (exclude memory ranges) as they can't be
> + *                               used for kexec segment buffer. Use buf_min
> + *                               & buf_max fields in kexec_buf structure to
> + *                               skip regions. Sets kbuf->mem when a
> + *                               suitable memory hole is found.
> + * @kbuf:                        Buffer contents and memory parameters.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +static int kexec_locate_mem_hole_ppc64(struct kexec_buf *kbuf)
> +{
> +	struct crash_mem **emem;
> +	u64 buf_min, buf_max;
> +	int ret;
> +
> +	/*
> +	 * Use the locate_mem_hole logic in kexec_add_buffer() for regular
> +	 * kexec_file_load syscall
> +	 */
> +	if (kbuf->image->type != KEXEC_TYPE_CRASH)
> +		return 0;
Can the ranges overlap [crashk_res.start, crashk_res.end]?  Otherwise
there is no requirement for @exclude_ranges.


I guess you have a design for future. If not true, then it is better to
fold the condition "if (kbuf->image->type != KEXEC_TYPE_CRASH)" into the
caller and rename this function to better distinguish use cases between
kexec and kdump

Thanks,
Pingfan
> +
> +	/* Look up the exclude ranges list while locating the memory hole */
> +	emem = &(kbuf->image->arch.exclude_ranges);
> +	if (!(*emem) || ((*emem)->nr_ranges == 0)) {
> +		pr_warn("No exclude range list. Using the default locate mem hole method\n");
> +		return 0;
> +	}
> +
> +	/* Ensure minimum alignment needed for segments. */
> +	kbuf->memsz = ALIGN(kbuf->memsz, PAGE_SIZE);
> +	kbuf->buf_align = max(kbuf->buf_align, PAGE_SIZE);
> +
> +	/* Segments for kdump kernel should be within crashkernel region */
> +	buf_min = (kbuf->buf_min < crashk_res.start ?
> +		   crashk_res.start : kbuf->buf_min);
> +	buf_max = (kbuf->buf_max > crashk_res.end ?
> +		   crashk_res.end : kbuf->buf_max);
> +
> +	if (buf_min > buf_max) {
> +		pr_err("Invalid buffer min and/or max values\n");
> +		return -EINVAL;
> +	}
> +
> +	if (kbuf->top_down)
> +		ret = locate_mem_hole_top_down_ppc64(kbuf, buf_min, buf_max,
> +						     *emem);
> +	else
> +		ret = locate_mem_hole_bottom_up_ppc64(kbuf, buf_min, buf_max,
> +						      *emem);
> +
> +	/* Add the buffer allocated to the exclude list for the next lookup */
> +	if (!ret) {
> +		add_mem_range(emem, kbuf->mem, kbuf->memsz);
> +		sort_memory_ranges(*emem);
> +	}
> +	return ret;
> +}
> +
> +/**
>   * setup_purgatory_ppc64 - initialize PPC64 specific purgatory's global
>   *                         variables and call setup_purgatory() to initialize
>   *                         common global variable.
> @@ -89,6 +332,29 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
>  }
>  
>  /**
> + * arch_kexec_add_buffer - Locate memory hole before calling kexec_add_buffer().
> + *                         All kexec_add_buffer() callers should use this
> + *                         function instead.
> + * @kbuf:                  Buffer contents and memory parameters.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +int arch_kexec_add_buffer(struct kexec_buf *kbuf)
> +{
> +	int ret;
> +
> +	ret = kexec_locate_mem_hole_ppc64(kbuf);
> +	if (ret)
> +		goto out;
> +
> +	ret = __kexec_add_buffer(kbuf);
> +out:
> +	if (ret)
> +		pr_err("Failed to add buffer of size %lu\n", kbuf->memsz);
> +	return ret;
> +}
> +
> +/**
>   * arch_kexec_kernel_image_probe - Does additional handling needed to setup
>   *                                 kexec segments.
>   * @image:                         kexec image being loaded.
> @@ -100,9 +366,31 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
>  int arch_kexec_kernel_image_probe(struct kimage *image, void *buf,
>  				  unsigned long buf_len)
>  {
> -	/* We don't support crash kernels yet. */
> -	if (image->type == KEXEC_TYPE_CRASH)
> +	if (image->type == KEXEC_TYPE_CRASH) {
> +		int ret;
> +
> +		/* Get exclude memory ranges needed for setting up kdump segments */
> +		ret = get_exclude_memory_ranges(&(image->arch.exclude_ranges));
> +		if (ret)
> +			pr_err("Failed to setup exclude memory ranges for buffer lookup\n");
> +		/* Return this until all changes for panic kernel are in */
>  		return -EOPNOTSUPP;
> +	}
>  
>  	return kexec_image_probe_default(image, buf, buf_len);
>  }
> +
> +/**
> + * arch_kimage_file_post_load_cleanup - Frees up all the allocations done
> + *                                      while loading the image.
> + * @image:                              kexec image being loaded.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +int arch_kimage_file_post_load_cleanup(struct kimage *image)
> +{
> +	kfree(image->arch.exclude_ranges);
> +	image->arch.exclude_ranges = NULL;
> +
> +	return kexec_image_post_load_cleanup_default(image);
> +}
> 
> 
> _______________________________________________
> kexec mailing list
> kexec@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kexec
> 

