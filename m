Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D13EA221826
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 00:54:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6Xl432djzDqSF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 08:54:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6Xhc3pgmzDqgq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 08:52:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B6Xhc3LS8z8tNy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 08:52:32 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B6Xhc2nHRz9sRk; Thu, 16 Jul 2020 08:52:32 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B6Xhb6wgYz9sRR
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Jul 2020 08:52:31 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06FMY7MG146329; Wed, 15 Jul 2020 18:52:23 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 329x5y8h27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 18:52:23 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06FMcuJX165608;
 Wed, 15 Jul 2020 18:52:22 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 329x5y8h1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 18:52:22 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06FMihdv013145;
 Wed, 15 Jul 2020 22:52:21 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 327ursw6wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 22:52:21 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06FMqIto29229770
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jul 2020 22:52:18 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 563F8C6057;
 Wed, 15 Jul 2020 22:52:20 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D29FFC6059;
 Wed, 15 Jul 2020 22:52:16 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.73.114])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 15 Jul 2020 22:52:16 +0000 (GMT)
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
 <159466091925.24747.6840028682768745598.stgit@hbathini.in.ibm.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v3 06/12] ppc64/kexec_file: restrict memory usage of kdump
 kernel
In-reply-to: <159466091925.24747.6840028682768745598.stgit@hbathini.in.ibm.com>
Date: Wed, 15 Jul 2020 19:52:12 -0300
Message-ID: <87365s9ysj.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_12:2020-07-15,
 2020-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007150168
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
Cc: Pingfan Liu <piliu@redhat.com>, Nayna Jain <nayna@linux.ibm.com>,
 Kexec-ml <kexec@lists.infradead.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Petr Tesarik <ptesarik@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hari Bathini <hbathini@linux.ibm.com> writes:

>  /**
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
> +	/* First memory block & crashkernel region */
> +	ret = add_mem_range(mem_ranges, 0, crashk_res.end + 1);

This is a bit surprising. I guess I don't have a complete big picture of
the patch series yet. What prevents the crashkernel from using memory at
the [0, _end] range and overwriting the crashed kernel's memory?

Shouldn't the above range start at crashk_res.start?

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
> +/**
>   * __locate_mem_hole_top_down - Looks top down for a large enough memory hole
>   *                              in the memory regions between buf_min & buf_max
>   *                              for the buffer. If found, sets kbuf->mem.
> @@ -261,6 +305,322 @@ static int locate_mem_hole_bottom_up_ppc64(struct kexec_buf *kbuf,
>  }
>
>  /**
> + * check_realloc_usable_mem - Reallocate buffer if it can't accommodate entries
> + * @um_info:                  Usable memory buffer and ranges info.
> + * @cnt:                      No. of entries to accommodate.
> + *
> + * Returns 0 on success, negative errno on error.

It actually returns the buffer on success, and NULL on error.

> + */
> +static uint64_t *check_realloc_usable_mem(struct umem_info *um_info, int cnt)
> +{
> +	void *tbuf;
> +
> +	if (um_info->size >=
> +	    ((um_info->idx + cnt) * sizeof(*(um_info->buf))))
> +		return um_info->buf;
> +
> +	um_info->size += MEM_RANGE_CHUNK_SZ;
> +	tbuf = krealloc(um_info->buf, um_info->size, GFP_KERNEL);
> +	if (!tbuf) {
> +		um_info->size -= MEM_RANGE_CHUNK_SZ;
> +		return NULL;
> +	}
> +
> +	memset(tbuf + um_info->idx, 0, MEM_RANGE_CHUNK_SZ);
> +	return tbuf;
> +}

<snip>

> +/**
> + * get_node_path - Get the full path of the given node.
> + * @dn:            Node.
> + * @path:          Updated with the full path of the node.
> + *
> + * Returns nothing.
> + */
> +static void get_node_path(struct device_node *dn, char *path)
> +{
> +	if (!dn)
> +		return;
> +
> +	get_node_path(dn->parent, path);

Is it ok to do recursion in the kernel? In this case I believe it's not
problematic since the maximum call depth will be the maximum depth of a
device tree node which shouldn't be too much. Also, there are no local
variables in this function. But I thought it was worth mentioning.

> +	sprintf(path, "/%s", dn->full_name);
> +}
> +
> +/**
> + * get_node_pathlen - Get the full path length of the given node.
> + * @dn:               Node.
> + *
> + * Returns the length of the full path of the node.
> + */
> +static int get_node_pathlen(struct device_node *dn)
> +{
> +	int len = 0;
> +
> +	while (dn) {
> +		len += strlen(dn->full_name) + 1;
> +		dn = dn->parent;
> +	}
> +	len++;
> +
> +	return len;
> +}
> +
> +/**
> + * add_usable_mem_property - Add usable memory property for the given
> + *                           memory node.
> + * @fdt:                     Flattened device tree for the kdump kernel.
> + * @dn:                      Memory node.
> + * @um_info:                 Usable memory buffer and ranges info.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +static int add_usable_mem_property(void *fdt, struct device_node *dn,
> +				   struct umem_info *um_info)
> +{
> +	int n_mem_addr_cells, n_mem_size_cells, node;
> +	int i, len, ranges, cnt, ret;
> +	uint64_t base, end, *buf;
> +	const __be32 *prop;
> +	char *pathname;
> +
> +	/* Allocate memory for node path */
> +	pathname = kzalloc(ALIGN(get_node_pathlen(dn), 8), GFP_KERNEL);
> +	if (!pathname)
> +		return -ENOMEM;
> +
> +	/* Get the full path of the memory node */
> +	get_node_path(dn, pathname);
> +	pr_debug("Memory node path: %s\n", pathname);
> +
> +	/* Now that we know the path, find its offset in kdump kernel's fdt */
> +	node = fdt_path_offset(fdt, pathname);
> +	if (node < 0) {
> +		pr_err("Malformed device tree: error reading %s\n",
> +		       pathname);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	/* Get the address & size cells */
> +	n_mem_addr_cells = of_n_addr_cells(dn);
> +	n_mem_size_cells = of_n_size_cells(dn);
> +	pr_debug("address cells: %d, size cells: %d\n", n_mem_addr_cells,
> +		 n_mem_size_cells);
> +
> +	um_info->idx  = 0;
> +	buf = check_realloc_usable_mem(um_info, 2);
> +	if (!buf) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	um_info->buf = buf;
> +
> +	prop = of_get_property(dn, "reg", &len);
> +	if (!prop || len <= 0) {
> +		ret = 0;
> +		goto out;
> +	}
> +
> +	/*
> +	 * "reg" property represents sequence of (addr,size) duples

s/duples/tuples/ ?

> +	 * each representing a memory range.
> +	 */
> +	ranges = (len >> 2) / (n_mem_addr_cells + n_mem_size_cells);
> +
> +	for (i = 0; i < ranges; i++) {
> +		base = of_read_number(prop, n_mem_addr_cells);
> +		prop += n_mem_addr_cells;
> +		end = base + of_read_number(prop, n_mem_size_cells) - 1;

You need to `prop += n_mem_size_cells` here.

> +
> +		ret = add_usable_mem(um_info, base, end, &cnt);
> +		if (ret) {
> +			ret = ret;
> +			goto out;
> +		}
> +	}
> +
> +	/*
> +	 * No kdump kernel usable memory found in this memory node.
> +	 * Write (0,0) duple in linux,usable-memory property for

s/duple/tuple/ ?

> +	 * this region to be ignored.
> +	 */
> +	if (um_info->idx == 0) {
> +		um_info->buf[0] = 0;
> +		um_info->buf[1] = 0;
> +		um_info->idx = 2;
> +	}
> +
> +	ret = fdt_setprop(fdt, node, "linux,usable-memory", um_info->buf,
> +			  (um_info->idx * sizeof(*(um_info->buf))));
> +
> +out:
> +	kfree(pathname);
> +	return ret;
> +}

--
Thiago Jung Bauermann
IBM Linux Technology Center
