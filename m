Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8842230BBC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 15:46:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGHz21S6MzDqyq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 23:46:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGHwG2tcgzDqyg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 23:44:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=DRzlt961; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BGHwG1Bbgz9sT6; Tue, 28 Jul 2020 23:44:30 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BGHwF3Dgmz9sSd;
 Tue, 28 Jul 2020 23:44:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595943869;
 bh=MrYFLzyzzNR1flrVLAvt4u4I1wO1atlhsgBLq8NOHBA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=DRzlt9613FocqjoZ94fmIMb49x38wzKg+f74LvdOwKncfOcoUNq3hjgXx/twoBPvK
 8uovlgDVsbew2Xo5Qxp0QTZZe1hc++7aqHg0Ee0OoV0tev1D8I6byVVpUimzzy7U3T
 0+hA5MnMN3rJ+a5UuwZ0RRcikR3oujYcwscFs0a8Wcq9soKETAq4SAl04z7im2UVW2
 hCbtMWqZA9CJY8SH0AD17/UqWjSe2ZeuWVhD/L86lRGHZfafSDTpjiJZvJn6Ciro/2
 wUkX0mqBGdcfCPGQen8F6XTfiyiNcXxGPRHO2rVvCLmT3lio/FDJNVaO1dOWoyVAfi
 F5dIF0Txx6x6A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RESEND PATCH v5 06/11] ppc64/kexec_file: restrict memory usage
 of kdump kernel
In-Reply-To: <159579231812.5790.16096865978767385505.stgit@hbathini>
References: <159579157320.5790.6748078824637688685.stgit@hbathini>
 <159579231812.5790.16096865978767385505.stgit@hbathini>
Date: Tue, 28 Jul 2020 23:44:26 +1000
Message-ID: <875za77o05.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Pingfan Liu <piliu@redhat.com>, Kexec-ml <kexec@lists.infradead.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Eric Biederman <ebiederm@xmission.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini <hbathini@linux.ibm.com> writes:
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index 2df6f4273ddd..8df085a22fd7 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -17,9 +17,21 @@
>  #include <linux/kexec.h>
>  #include <linux/of_fdt.h>
>  #include <linux/libfdt.h>
> +#include <linux/of_device.h>
>  #include <linux/memblock.h>
> +#include <linux/slab.h>
> +#include <asm/drmem.h>
>  #include <asm/kexec_ranges.h>
>  
> +struct umem_info {
> +	uint64_t *buf; /* data buffer for usable-memory property */
> +	uint32_t idx;  /* current index */
> +	uint32_t size; /* size allocated for the data buffer */

Use kernel types please, u64, u32.

> +	/* usable memory ranges to look up */
> +	const struct crash_mem *umrngs;

"umrngs".

Given it's part of the umem_info struct could it just be "ranges"?

> +};
> +
>  const struct kexec_file_ops * const kexec_file_loaders[] = {
>  	&kexec_elf64_ops,
>  	NULL
> @@ -74,6 +86,42 @@ static int get_exclude_memory_ranges(struct crash_mem **mem_ranges)
>  	return ret;
>  }
>  
> +/**
> + * get_usable_memory_ranges - Get usable memory ranges. This list includes
> + *                            regions like crashkernel, opal/rtas & tce-table,
> + *                            that kdump kernel could use.
> + * @mem_ranges:               Range list to add the memory ranges to.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +static int get_usable_memory_ranges(struct crash_mem **mem_ranges)
> +{
> +	int ret;
> +
> +	/*
> +	 * prom code doesn't take kindly to missing low memory. So, add

I don't know what that's referring to, "prom code" is too vague.

> +	 * [0, crashk_res.end] instead of [crashk_res.start, crashk_res.end]
> +	 * to keep it happy.
> +	 */
> +	ret = add_mem_range(mem_ranges, 0, crashk_res.end + 1);
> +	if (ret)
> +		goto out;
> +
> +	ret = add_rtas_mem_range(mem_ranges);
> +	if (ret)
> +		goto out;
> +
> +	ret = add_opal_mem_range(mem_ranges);
> +	if (ret)
> +		goto out;
> +
> +	ret = add_tce_mem_ranges(mem_ranges);
> +out:
> +	if (ret)
> +		pr_err("Failed to setup usable memory ranges\n");
> +	return ret;
> +}
> +
>  /**
>   * __locate_mem_hole_top_down - Looks top down for a large enough memory hole
>   *                              in the memory regions between buf_min & buf_max
> @@ -273,6 +321,382 @@ static int locate_mem_hole_bottom_up_ppc64(struct kexec_buf *kbuf,
>  	return ret;
>  }
>  
> +/**
> + * check_realloc_usable_mem - Reallocate buffer if it can't accommodate entries
> + * @um_info:                  Usable memory buffer and ranges info.
> + * @cnt:                      No. of entries to accommodate.
> + *
> + * Frees up the old buffer if memory reallocation fails.
> + *
> + * Returns buffer on success, NULL on error.
> + */
> +static uint64_t *check_realloc_usable_mem(struct umem_info *um_info, int cnt)
> +{
> +	void *tbuf;
> +
> +	if (um_info->size >=
> +	    ((um_info->idx + cnt) * sizeof(*(um_info->buf))))
> +		return um_info->buf;

This is awkward.

AFAICS you only use um_info->size here, so instead why not store the
number of u64s you have space for, as num for example.

Then the above comparison becomes:

	if (um_info->num >= (um_info->idx + count))

Then you only have to calculate the size internally here for the
realloc.

> +
> +	um_info->size += MEM_RANGE_CHUNK_SZ;

	new_size = um_info->size + MEM_RANGE_CHUNK_SZ;
	tbuf = krealloc(um_info->buf, new_size, GFP_KERNEL);

> +	tbuf = krealloc(um_info->buf, um_info->size, GFP_KERNEL);
> +	if (!tbuf) {
> +		um_info->size -= MEM_RANGE_CHUNK_SZ;

Then you can drop this.

> +		return NULL;
> +	}

	um_info->size = new_size;

> +
> +	memset(tbuf + um_info->idx, 0, MEM_RANGE_CHUNK_SZ);

Just pass __GFP_ZERO to krealloc?

> +	return tbuf;
> +}
> +
> +/**
> + * add_usable_mem - Add the usable memory ranges within the given memory range
> + *                  to the buffer
> + * @um_info:        Usable memory buffer and ranges info.
> + * @base:           Base address of memory range to look for.
> + * @end:            End address of memory range to look for.
> + * @cnt:            No. of usable memory ranges added to buffer.

One caller never uses this AFAICS.

Couldn't the other caller just compare the um_info->idx before and after
the call, and avoid another pass by reference parameter.

> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +static int add_usable_mem(struct umem_info *um_info, uint64_t base,
> +			  uint64_t end, int *cnt)
> +{
> +	uint64_t loc_base, loc_end, *buf;
> +	const struct crash_mem *umrngs;
> +	int i, add;

add should be bool.

> +	*cnt = 0;
> +	umrngs = um_info->umrngs;
> +	for (i = 0; i < umrngs->nr_ranges; i++) {
> +		add = 0;
> +		loc_base = umrngs->ranges[i].start;
> +		loc_end = umrngs->ranges[i].end;
> +		if (loc_base >= base && loc_end <= end)
> +			add = 1;
> +		else if (base < loc_end && end > loc_base) {
> +			if (loc_base < base)
> +				loc_base = base;
> +			if (loc_end > end)
> +				loc_end = end;
> +			add = 1;
> +		}
> +
> +		if (add) {
> +			buf = check_realloc_usable_mem(um_info, 2);
> +			if (!buf)
> +				return -ENOMEM;
> +
> +			um_info->buf = buf;
> +			buf[um_info->idx++] = cpu_to_be64(loc_base);
> +			buf[um_info->idx++] =
> +					cpu_to_be64(loc_end - loc_base + 1);
> +			(*cnt)++;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * kdump_setup_usable_lmb - This is a callback function that gets called by
> + *                          walk_drmem_lmbs for every LMB to set its
> + *                          usable memory ranges.
> + * @lmb:                    LMB info.
> + * @usm:                    linux,drconf-usable-memory property value.
> + * @data:                   Pointer to usable memory buffer and ranges info.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +static int kdump_setup_usable_lmb(struct drmem_lmb *lmb, const __be32 **usm,
> +				  void *data)
> +{
> +	struct umem_info *um_info;
> +	uint64_t base, end, *buf;
> +	int cnt, tmp_idx, ret;
> +
> +	/*
> +	 * kdump load isn't supported on kernels already booted with
> +	 * linux,drconf-usable-memory property.
> +	 */
> +	if (*usm) {
> +		pr_err("linux,drconf-usable-memory property already exists!");
> +		return -EINVAL;
> +	}
> +
> +	um_info = data;
> +	tmp_idx = um_info->idx;
> +	buf = check_realloc_usable_mem(um_info, 1);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	um_info->idx++;
> +	um_info->buf = buf;
> +	base = lmb->base_addr;
> +	end = base + drmem_lmb_size() - 1;
> +	ret = add_usable_mem(um_info, base, end, &cnt);
> +	if (!ret)
> +		um_info->buf[tmp_idx] = cpu_to_be64(cnt);
> +
> +	return ret;
> +}
> +
> +/**
> + * get_node_path_size - Get the full path length of the given node.
> + * @dn:                 Device Node.
> + *
> + * Also, counts '\0' at the end of the path.
> + * For example, /memory@0 will be "/memory@0\0" => 10 bytes.
> + *
> + * Returns the string size of the node's full path.
> + */
> +static int get_node_path_size(struct device_node *dn)
> +{
> +	int len = 0;
> +
> +	if (!dn)
> +		return 0;
> +
> +	/* Root node */
> +	if (!(dn->parent))
> +		return 2;
> +
> +	while (dn) {
> +		len += strlen(dn->full_name) + 1;
> +		dn = dn->parent;
> +	}
> +
> +	return len;
> +}
> +
> +/**
> + * get_node_path - Get the full path of the given node.
> + * @node:          Device node.
> + *
> + * Allocates buffer for node path. The caller must free the buffer
> + * after use.
> + *
> + * Returns buffer with path on success, NULL otherwise.
> + */
> +static char *get_node_path(struct device_node *node)
> +{


As discussed this can probably be replaced with snprintf(buf, "%pOF") ?


cheers
