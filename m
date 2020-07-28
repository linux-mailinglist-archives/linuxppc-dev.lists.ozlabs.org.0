Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED84230AD3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 15:00:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGGxt2wFfzDqwN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 23:00:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGGv02vBPzDqwF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 22:58:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=cJ4OP5mM; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BGGtz6p3fz9sT6; Tue, 28 Jul 2020 22:58:19 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BGGtz14vHz9sRX;
 Tue, 28 Jul 2020 22:58:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595941099;
 bh=bD2rycoJ0hiwGk7Z/KL447U0tALy2QIjw0hCWG8FMC4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=cJ4OP5mM0kwBMaNLh2945qpFlgdChwEGOZk4QVM6Ysbuel7WNRg2JS6u0D7xU8KFI
 NO1rCzdb9/sEn+QSCdHk53wQsJp1MsWWr3m1NgxR7uz6Mbj5fpKI7AniW13fqQ5+V7
 5dIhnUUsd22E5y1KQ+IuOiTYVaZLsfIJ87Qpaxbrjd0pdY90wGyuyFF26RLOVEXAQ7
 tYRFNXOcE0dp5UMjSRvqafE4obJmrlshkZLg4zkqX5jf2xU8vLVZh7cq00UHxCX5Py
 Ft/E5JmY83XBMkrU5vlB4XcFuqvLmvogfaJqhN9i/cglUs+shGp5kgHs5OecRFXDTk
 3Bj63msjWs4TQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RESEND PATCH v5 03/11] powerpc/kexec_file: add helper functions
 for getting memory ranges
In-Reply-To: <159579222211.5790.10294144969496171475.stgit@hbathini>
References: <159579157320.5790.6748078824637688685.stgit@hbathini>
 <159579222211.5790.10294144969496171475.stgit@hbathini>
Date: Tue, 28 Jul 2020 22:58:15 +1000
Message-ID: <87a6zj7q54.fsf@mpe.ellerman.id.au>
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
 linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Hari,

Some comments inline ...

Hari Bathini <hbathini@linux.ibm.com> writes:
> diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
> new file mode 100644
> index 000000000000..21bea1b78443
> --- /dev/null
> +++ b/arch/powerpc/kexec/ranges.c
> @@ -0,0 +1,417 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * powerpc code to implement the kexec_file_load syscall
> + *
> + * Copyright (C) 2004  Adam Litke (agl@us.ibm.com)
> + * Copyright (C) 2004  IBM Corp.
> + * Copyright (C) 2004,2005  Milton D Miller II, IBM Corporation
> + * Copyright (C) 2005  R Sharada (sharada@in.ibm.com)
> + * Copyright (C) 2006  Mohan Kumar M (mohan@in.ibm.com)
> + * Copyright (C) 2020  IBM Corporation
> + *
> + * Based on kexec-tools' kexec-ppc64.c, fs2dt.c.
> + * Heavily modified for the kernel by
> + * Hari Bathini <hbathini@linux.ibm.com>.

Please just use your name, email addresses bit rot. It's in the commit
log anyway.

> + */
> +
> +#undef DEBUG
    ^
Dont do that in new code please.

> +#define pr_fmt(fmt) "kexec ranges: " fmt
> +
> +#include <linux/sort.h>
> +#include <linux/kexec.h>
> +#include <linux/of_device.h>
> +#include <linux/slab.h>
> +#include <asm/sections.h>
> +#include <asm/kexec_ranges.h>
> +
> +/**
> + * get_max_nr_ranges - Get the max no. of ranges crash_mem structure
> + *                     could hold, given the size allocated for it.
> + * @size:              Allocation size of crash_mem structure.
> + *
> + * Returns the maximum no. of ranges.
> + */
> +static inline unsigned int get_max_nr_ranges(size_t size)
> +{
> +	return ((size - sizeof(struct crash_mem)) /
> +		sizeof(struct crash_mem_range));
> +}
> +
> +/**
> + * get_mem_rngs_size - Get the allocated size of mrngs based on
> + *                     max_nr_ranges and chunk size.
> + * @mrngs:             Memory ranges.

mrngs is not a great name, what about memory_ranges or ranges?

Ditto everywhere else you use mrngs.

> + *
> + * Returns the maximum size of @mrngs.
> + */
> +static inline size_t get_mem_rngs_size(struct crash_mem *mrngs)
> +{
> +	size_t size;
> +
> +	if (!mrngs)
> +		return 0;
> +
> +	size = (sizeof(struct crash_mem) +
> +		(mrngs->max_nr_ranges * sizeof(struct crash_mem_range)));
> +
> +	/*
> +	 * Memory is allocated in size multiple of MEM_RANGE_CHUNK_SZ.
> +	 * So, align to get the actual length.
> +	 */
> +	return ALIGN(size, MEM_RANGE_CHUNK_SZ);
> +}
> +
> +/**
> + * __add_mem_range - add a memory range to memory ranges list.
> + * @mem_ranges:      Range list to add the memory range to.
> + * @base:            Base address of the range to add.
> + * @size:            Size of the memory range to add.
> + *
> + * (Re)allocates memory, if needed.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +static int __add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size)
> +{
> +	struct crash_mem *mrngs = *mem_ranges;
> +
> +	if ((mrngs == NULL) || (mrngs->nr_ranges == mrngs->max_nr_ranges)) {

(mrngs == NULL) should just be !mrngs.

> +		mrngs = realloc_mem_ranges(mem_ranges);
> +		if (!mrngs)
> +			return -ENOMEM;
> +	}
> +
> +	mrngs->ranges[mrngs->nr_ranges].start = base;
> +	mrngs->ranges[mrngs->nr_ranges].end = base + size - 1;
> +	pr_debug("Added memory range [%#016llx - %#016llx] at index %d\n",
> +		 base, base + size - 1, mrngs->nr_ranges);
> +	mrngs->nr_ranges++;
> +	return 0;
> +}
> +
> +/**
> + * __merge_memory_ranges - Merges the given memory ranges list.
> + * @mem_ranges:            Range list to merge.
> + *
> + * Assumes a sorted range list.
> + *
> + * Returns nothing.
> + */

A lot of this code is annoyingly similar to the memblock code, though
the internals of that are all static these days.

I guess for now we'll just have to add all this. Maybe in future it can
be consolidated.

> +static void __merge_memory_ranges(struct crash_mem *mrngs)
> +{
> +	struct crash_mem_range *rngs;
> +	int i, idx;
> +
> +	if (!mrngs)
> +		return;
> +
> +	idx = 0;
> +	rngs = &mrngs->ranges[0];
> +	for (i = 1; i < mrngs->nr_ranges; i++) {
> +		if (rngs[i].start <= (rngs[i-1].end + 1))
> +			rngs[idx].end = rngs[i].end;
> +		else {
> +			idx++;
> +			if (i == idx)
> +				continue;
> +
> +			rngs[idx] = rngs[i];
> +		}
> +	}
> +	mrngs->nr_ranges = idx + 1;
> +}
> +
> +/**
> + * realloc_mem_ranges - reallocate mem_ranges with size incremented
> + *                      by MEM_RANGE_CHUNK_SZ. Frees up the old memory,
> + *                      if memory allocation fails.
> + * @mem_ranges:         Memory ranges to reallocate.
> + *
> + * Returns pointer to reallocated memory on success, NULL otherwise.
> + */
> +struct crash_mem *realloc_mem_ranges(struct crash_mem **mem_ranges)
> +{
> +	struct crash_mem *mrngs = *mem_ranges;
> +	unsigned int nr_ranges;
> +	size_t size;
> +
> +	size = get_mem_rngs_size(mrngs);
> +	nr_ranges = mrngs ? mrngs->nr_ranges : 0;
> +
> +	size += MEM_RANGE_CHUNK_SZ;
> +	mrngs = krealloc(*mem_ranges, size, GFP_KERNEL);
> +	if (!mrngs) {
> +		kfree(*mem_ranges);
> +		*mem_ranges = NULL;
> +		return NULL;
> +	}
> +
> +	mrngs->nr_ranges = nr_ranges;
> +	mrngs->max_nr_ranges = get_max_nr_ranges(size);
> +	*mem_ranges = mrngs;
> +
> +	return mrngs;
> +}
> +
> +/**
> + * add_mem_range - Updates existing memory range, if there is an overlap.
> + *                 Else, adds a new memory range.
> + * @mem_ranges:    Range list to add the memory range to.
> + * @base:          Base address of the range to add.
> + * @size:          Size of the memory range to add.
> + *
> + * (Re)allocates memory, if needed.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size)
> +{
> +	struct crash_mem *mrngs = *mem_ranges;
> +	u64 mstart, mend, end;
> +	unsigned int i;
> +
> +	if (!size)
> +		return 0;
> +
> +	end = base + size - 1;
> +
> +	if ((mrngs == NULL) || (mrngs->nr_ranges == 0))
> +		return __add_mem_range(mem_ranges, base, size);
> +
> +	for (i = 0; i < mrngs->nr_ranges; i++) {
> +		mstart = mrngs->ranges[i].start;
> +		mend = mrngs->ranges[i].end;
> +		if (base < mend && end > mstart) {
> +			if (base < mstart)
> +				mrngs->ranges[i].start = base;
> +			if (end > mend)
> +				mrngs->ranges[i].end = end;
> +			return 0;
> +		}
> +	}
> +
> +	return __add_mem_range(mem_ranges, base, size);
> +}
> +
> +/**
> + * add_tce_mem_ranges - Adds tce-table range to the given memory ranges list.
> + * @mem_ranges:         Range list to add the memory range(s) to.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +int add_tce_mem_ranges(struct crash_mem **mem_ranges)

Not sure this and the other add_foo_mem_ranges() really belong in this patch.

> +{
> +	struct device_node *dn;
> +	int ret = 0;
> +
> +	for_each_node_by_type(dn, "pci") {
> +		u64 base;
> +		u32 size;
> +		int rc;

Do you really need ret and rc?

> +		/*
> +		 * It is ok to have pci nodes without tce. So, ignore
> +		 * any read errors here.
> +		 */
> +		rc = of_property_read_u64(dn, "linux,tce-base", &base);
> +		rc |= of_property_read_u32(dn, "linux,tce-size", &size);
> +		if (rc)
> +			continue;
> +
> +		ret = add_mem_range(mem_ranges, base, size);
> +		if (ret)
> +			break;
                        ^
                        dn leaked.
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * add_initrd_mem_range - Adds initrd range to the given memory ranges list,
> + *                        if the initrd was retained.
> + * @mem_ranges:           Range list to add the memory range to.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +int add_initrd_mem_range(struct crash_mem **mem_ranges)
> +{
> +	u64 base, end;
> +	char *str;
> +	int ret;
> +
> +	/* This range means something only if initrd was retained */
> +	str = strstr(saved_command_line, "retain_initrd");
> +	if (!str)
> +		return 0;

Unfortunate that we have to go and scan the command line again. But I
don't see a better way ATM.

Could be more concise:

	if (!strstr(saved_command_line, "retain_initrd"))
		return 0;

> +
> +	ret = of_property_read_u64(of_chosen, "linux,initrd-start", &base);
> +	ret |= of_property_read_u64(of_chosen, "linux,initrd-end", &end);
> +	if (!ret)
> +		ret = add_mem_range(mem_ranges, base, end - base + 1);
> +	return ret;
> +}
> +
> +#ifdef CONFIG_PPC_BOOK3S_64
> +/**
> + * add_htab_mem_range - Adds htab range to the given memory ranges list,
> + *                      if it exists
> + * @mem_ranges:         Range list to add the memory range to.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +int add_htab_mem_range(struct crash_mem **mem_ranges)
> +{
> +	if (!htab_address)
> +		return 0;
> +
> +	return add_mem_range(mem_ranges, __pa(htab_address), htab_size_bytes);
> +}
> +#endif
> +
> +/**
> + * add_kernel_mem_range - Adds kernel text region to the given
> + *                        memory ranges list.
> + * @mem_ranges:           Range list to add the memory range to.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +int add_kernel_mem_range(struct crash_mem **mem_ranges)
> +{
> +	return add_mem_range(mem_ranges, 0, __pa(_end));
> +}
> +
> +/**
> + * add_rtas_mem_range - Adds RTAS region to the given memory ranges list.
> + * @mem_ranges:         Range list to add the memory range to.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +int add_rtas_mem_range(struct crash_mem **mem_ranges)
> +{
> +	struct device_node *dn;
> +	int ret = 0;
> +
> +	dn = of_find_node_by_path("/rtas");
> +	if (dn) {
> +		u32 base, size;
> +
> +		ret = of_property_read_u32(dn, "linux,rtas-base", &base);
> +		ret |= of_property_read_u32(dn, "rtas-size", &size);
> +		if (ret)
> +			goto out;
> +
> +		ret = add_mem_range(mem_ranges, base, size);
> +	}
> +
> +out:
> +	of_node_put(dn);
> +	return ret;
> +}

Or:
	struct device_node *dn;
        u32 base, size;
	int rc;

	dn = of_find_node_by_path("/rtas");
	if (!dn)
        	return 0;

	rc  = of_property_read_u32(dn, "linux,rtas-base", &base);
	rc |= of_property_read_u32(dn, "rtas-size", &size);
	if (rc == 0)
		rc = add_mem_range(mem_ranges, base, size);

	of_node_put(dn);
	return rc;
}


> +
> +/**
> + * add_opal_mem_range - Adds OPAL region to the given memory ranges list.
> + * @mem_ranges:         Range list to add the memory range to.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +int add_opal_mem_range(struct crash_mem **mem_ranges)
> +{
> +	struct device_node *dn;
> +	int ret = 0;
> +
> +	dn = of_find_node_by_path("/ibm,opal");
> +	if (dn) {
> +		u64 base, size;
> +
> +		ret = of_property_read_u64(dn, "opal-base-address", &base);
> +		ret |= of_property_read_u64(dn, "opal-runtime-size", &size);
> +		if (ret)
> +			goto out;
> +
> +		ret = add_mem_range(mem_ranges, base, size);
> +	}
> +
> +out:
> +	of_node_put(dn);
> +	return ret;
> +}
> +
> +/**
> + * add_reserved_ranges - Adds "/reserved-ranges" regions exported by f/w
> + *                       to the given memory ranges list.
> + * @mem_ranges:          Range list to add the memory ranges to.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +int add_reserved_ranges(struct crash_mem **mem_ranges)
> +{
> +	int n_mem_addr_cells, n_mem_size_cells, i, len, cells, ret = 0;
> +	const __be32 *prop;
> +
> +	prop = of_get_property(of_root, "reserved-ranges", &len);
> +	if (!prop)
> +		return 0;
> +
> +	of_node_get(of_root);

You shouldn't need to get the root node, you already used it above anyway.

> +	n_mem_addr_cells = of_n_addr_cells(of_root);
> +	n_mem_size_cells = of_n_size_cells(of_root);
> +	cells = n_mem_addr_cells + n_mem_size_cells;
> +
> +	/* Each reserved range is an (address,size) pair */
> +	for (i = 0; i < (len / (sizeof(*prop) * cells)); i++) {
                                       ^
                                       just u32 would be clearer I think.



cheers
