Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E4E231DB4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 13:55:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGsRd1wlNzDqQZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 21:55:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGs961d2vzDqsl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 21:42:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BGs9610M1z8tSY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 21:42:34 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BGs960F59z9sSd; Wed, 29 Jul 2020 21:42:34 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BGs953clPz9sRN
 for <linuxppc-dev@ozlabs.org>; Wed, 29 Jul 2020 21:42:33 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06TBV4j3158519; Wed, 29 Jul 2020 07:42:28 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jqrsuw0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 07:42:27 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06TBWeMV165622;
 Wed, 29 Jul 2020 07:42:27 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jqrsuvyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 07:42:26 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06TBfxXB018719;
 Wed, 29 Jul 2020 11:42:25 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 32gcy4n03t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 11:42:24 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06TBeuYh459326
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jul 2020 11:40:56 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCF314C05A;
 Wed, 29 Jul 2020 11:42:21 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E3B44C04E;
 Wed, 29 Jul 2020 11:42:18 +0000 (GMT)
Received: from [192.168.0.8] (unknown [9.79.217.86])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jul 2020 11:42:18 +0000 (GMT)
Subject: [PATCH v6 06/11] ppc64/kexec_file: restrict memory usage of kdump
 kernel
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 29 Jul 2020 17:12:16 +0530
Message-ID: <159602284284.575379.6962016255404325493.stgit@hbathini>
In-Reply-To: <159602259854.575379.16910915605574571585.stgit@hbathini>
References: <159602259854.575379.16910915605574571585.stgit@hbathini>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-29_04:2020-07-29,
 2020-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007290071
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
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kdump kernel, used for capturing the kernel core image, is supposed
to use only specific memory regions to avoid corrupting the image to
be captured. The regions are crashkernel range - the memory reserved
explicitly for kdump kernel, memory used for the tce-table, the OPAL
region and RTAS region as applicable. Restrict kdump kernel memory
to use only these regions by setting up usable-memory DT property.
Also, tell the kdump kernel to run at the loaded address by setting
the magic word at 0x5c.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Tested-by: Pingfan Liu <piliu@redhat.com>
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---

v5 -> v6:
* Added Reviewed-by tag from Thiago.
* Avoided pass by reference count parameter in add_usable_mem() function
  by calculating the range count added from index value before & after it.
* Instead of trying to reinvent the wheel with get_node_path() &
  get_node_path_size() functions, used %pOF format as suggested by mpe.
* Used kernel types instead of uint32_t/uint64_t.
* and Dropped 'struct crash_mem *' member & added 'struct crash_mem_range *',
  nr_ranges & max_entries fields to 'struct umem_info' to avoid bit of
  a clutter in check_realloc_usable_mem() & add_usable_mem() functions.
* Updated the comment as to why 0 till crashk_res.start was needed to be
  added to usable memory ranges. Note that kexec-tools also has been
  doing the same thing.

v4 -> v5:
* Renamed get_node_pathlen() function to get_node_path_size() and
  handled root node separately to avoid off-by-one error in
  calculating string size.
* Updated get_node_path() in line with change in get_node_path_size().

v3 -> v4:
* Updated get_node_path() to be an iterative function instead of a
  recursive one.
* Added comment explaining why low memory is added to kdump kernel's
  usable memory ranges though it doesn't fall in crashkernel region.
* For correctness, added fdt_add_mem_rsv() for the low memory being
  added to kdump kernel's usable memory ranges.
* Fixed prop pointer update in add_usable_mem_property() and changed
  duple to tuple as suggested by Thiago.

v2 -> v3:
* Unchanged. Added Tested-by tag from Pingfan.

v1 -> v2:
* Fixed off-by-one error while setting up usable-memory properties.
* Updated add_rtas_mem_range() & add_opal_mem_range() callsites based on
  the new prototype for these functions.


 arch/powerpc/kexec/file_load_64.c |  386 +++++++++++++++++++++++++++++++++++++
 1 file changed, 385 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index d09c7724efa8..f94660874765 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -17,9 +17,23 @@
 #include <linux/kexec.h>
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
+#include <linux/of_device.h>
 #include <linux/memblock.h>
+#include <linux/slab.h>
+#include <asm/drmem.h>
 #include <asm/kexec_ranges.h>
 
+struct umem_info {
+	u64 *buf;		/* data buffer for usable-memory property */
+	u32 size;		/* size allocated for the data buffer */
+	u32 max_entries;	/* maximum no. of entries */
+	u32 idx;		/* index of current entry */
+
+	/* usable memory ranges to look up */
+	unsigned int nr_ranges;
+	const struct crash_mem_range *ranges;
+};
+
 const struct kexec_file_ops * const kexec_file_loaders[] = {
 	&kexec_elf64_ops,
 	NULL
@@ -74,6 +88,44 @@ static int get_exclude_memory_ranges(struct crash_mem **mem_ranges)
 	return ret;
 }
 
+/**
+ * get_usable_memory_ranges - Get usable memory ranges. This list includes
+ *                            regions like crashkernel, opal/rtas & tce-table,
+ *                            that kdump kernel could use.
+ * @mem_ranges:               Range list to add the memory ranges to.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int get_usable_memory_ranges(struct crash_mem **mem_ranges)
+{
+	int ret;
+
+	/*
+	 * Early boot failure observed on guests when low memory (first memory
+	 * block?) is not added to usable memory. So, add [0, crashk_res.end]
+	 * instead of [crashk_res.start, crashk_res.end] to workaround it.
+	 * Also, crashed kernel's memory must be added to reserve map to
+	 * avoid kdump kernel from using it.
+	 */
+	ret = add_mem_range(mem_ranges, 0, crashk_res.end + 1);
+	if (ret)
+		goto out;
+
+	ret = add_rtas_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_opal_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_tce_mem_ranges(mem_ranges);
+out:
+	if (ret)
+		pr_err("Failed to setup usable memory ranges\n");
+	return ret;
+}
+
 /**
  * __locate_mem_hole_top_down - Looks top down for a large enough memory hole
  *                              in the memory regions between buf_min & buf_max
@@ -273,6 +325,286 @@ static int locate_mem_hole_bottom_up_ppc64(struct kexec_buf *kbuf,
 	return ret;
 }
 
+/**
+ * check_realloc_usable_mem - Reallocate buffer if it can't accommodate entries
+ * @um_info:                  Usable memory buffer and ranges info.
+ * @cnt:                      No. of entries to accommodate.
+ *
+ * Frees up the old buffer if memory reallocation fails.
+ *
+ * Returns buffer on success, NULL on error.
+ */
+static u64 *check_realloc_usable_mem(struct umem_info *um_info, int cnt)
+{
+	u32 new_size;
+	u64 *tbuf;
+
+	if ((um_info->idx + cnt) <= um_info->max_entries)
+		return um_info->buf;
+
+	new_size = um_info->size + MEM_RANGE_CHUNK_SZ;
+	tbuf = krealloc(um_info->buf, new_size, GFP_KERNEL);
+	if (tbuf) {
+		um_info->buf = tbuf;
+		um_info->size = new_size;
+		um_info->max_entries = (um_info->size / sizeof(u64));
+	}
+
+	return tbuf;
+}
+
+/**
+ * add_usable_mem - Add the usable memory ranges within the given memory range
+ *                  to the buffer
+ * @um_info:        Usable memory buffer and ranges info.
+ * @base:           Base address of memory range to look for.
+ * @end:            End address of memory range to look for.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int add_usable_mem(struct umem_info *um_info, u64 base, u64 end)
+{
+	u64 loc_base, loc_end;
+	bool add;
+	int i;
+
+	for (i = 0; i < um_info->nr_ranges; i++) {
+		add = false;
+		loc_base = um_info->ranges[i].start;
+		loc_end = um_info->ranges[i].end;
+		if (loc_base >= base && loc_end <= end)
+			add = true;
+		else if (base < loc_end && end > loc_base) {
+			if (loc_base < base)
+				loc_base = base;
+			if (loc_end > end)
+				loc_end = end;
+			add = true;
+		}
+
+		if (add) {
+			if (!check_realloc_usable_mem(um_info, 2))
+				return -ENOMEM;
+
+			um_info->buf[um_info->idx++] = cpu_to_be64(loc_base);
+			um_info->buf[um_info->idx++] =
+					cpu_to_be64(loc_end - loc_base + 1);
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * kdump_setup_usable_lmb - This is a callback function that gets called by
+ *                          walk_drmem_lmbs for every LMB to set its
+ *                          usable memory ranges.
+ * @lmb:                    LMB info.
+ * @usm:                    linux,drconf-usable-memory property value.
+ * @data:                   Pointer to usable memory buffer and ranges info.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int kdump_setup_usable_lmb(struct drmem_lmb *lmb, const __be32 **usm,
+				  void *data)
+{
+	struct umem_info *um_info;
+	int tmp_idx, ret;
+	u64 base, end;
+
+	/*
+	 * kdump load isn't supported on kernels already booted with
+	 * linux,drconf-usable-memory property.
+	 */
+	if (*usm) {
+		pr_err("linux,drconf-usable-memory property already exists!");
+		return -EINVAL;
+	}
+
+	um_info = data;
+	tmp_idx = um_info->idx;
+	if (!check_realloc_usable_mem(um_info, 1))
+		return -ENOMEM;
+
+	um_info->idx++;
+	base = lmb->base_addr;
+	end = base + drmem_lmb_size() - 1;
+	ret = add_usable_mem(um_info, base, end);
+	if (!ret) {
+		/*
+		 * Update the no. of ranges added. Two entries (base & size)
+		 * for every range added.
+		 */
+		um_info->buf[tmp_idx] =
+				cpu_to_be64((um_info->idx - tmp_idx - 1) / 2);
+	}
+
+	return ret;
+}
+
+#define NODE_PATH_LEN		256
+/**
+ * add_usable_mem_property - Add usable memory property for the given
+ *                           memory node.
+ * @fdt:                     Flattened device tree for the kdump kernel.
+ * @dn:                      Memory node.
+ * @um_info:                 Usable memory buffer and ranges info.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int add_usable_mem_property(void *fdt, struct device_node *dn,
+				   struct umem_info *um_info)
+{
+	int n_mem_addr_cells, n_mem_size_cells, node;
+	char path[NODE_PATH_LEN];
+	int i, len, ranges, ret;
+	const __be32 *prop;
+	u64 base, end;
+
+	of_node_get(dn);
+
+	if (snprintf(path, NODE_PATH_LEN, "%pOF", dn) > (NODE_PATH_LEN - 1)) {
+		pr_err("Buffer (%d) too small for memory node: %pOF\n",
+		       NODE_PATH_LEN, dn);
+		return -EOVERFLOW;
+	}
+	pr_debug("Memory node path: %s\n", path);
+
+	/* Now that we know the path, find its offset in kdump kernel's fdt */
+	node = fdt_path_offset(fdt, path);
+	if (node < 0) {
+		pr_err("Malformed device tree: error reading %s\n", path);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Get the address & size cells */
+	n_mem_addr_cells = of_n_addr_cells(dn);
+	n_mem_size_cells = of_n_size_cells(dn);
+	pr_debug("address cells: %d, size cells: %d\n", n_mem_addr_cells,
+		 n_mem_size_cells);
+
+	um_info->idx  = 0;
+	if (!check_realloc_usable_mem(um_info, 2)) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	prop = of_get_property(dn, "reg", &len);
+	if (!prop || len <= 0) {
+		ret = 0;
+		goto out;
+	}
+
+	/*
+	 * "reg" property represents sequence of (addr,size) tuples
+	 * each representing a memory range.
+	 */
+	ranges = (len >> 2) / (n_mem_addr_cells + n_mem_size_cells);
+
+	for (i = 0; i < ranges; i++) {
+		base = of_read_number(prop, n_mem_addr_cells);
+		prop += n_mem_addr_cells;
+		end = base + of_read_number(prop, n_mem_size_cells) - 1;
+		prop += n_mem_size_cells;
+
+		ret = add_usable_mem(um_info, base, end);
+		if (ret)
+			goto out;
+	}
+
+	/*
+	 * No kdump kernel usable memory found in this memory node.
+	 * Write (0,0) tuple in linux,usable-memory property for
+	 * this region to be ignored.
+	 */
+	if (um_info->idx == 0) {
+		um_info->buf[0] = 0;
+		um_info->buf[1] = 0;
+		um_info->idx = 2;
+	}
+
+	ret = fdt_setprop(fdt, node, "linux,usable-memory", um_info->buf,
+			  (um_info->idx * sizeof(u64)));
+
+out:
+	of_node_put(dn);
+	return ret;
+}
+
+
+/**
+ * update_usable_mem_fdt - Updates kdump kernel's fdt with linux,usable-memory
+ *                         and linux,drconf-usable-memory DT properties as
+ *                         appropriate to restrict its memory usage.
+ * @fdt:                   Flattened device tree for the kdump kernel.
+ * @usable_mem:            Usable memory ranges for kdump kernel.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int update_usable_mem_fdt(void *fdt, struct crash_mem *usable_mem)
+{
+	struct umem_info um_info;
+	struct device_node *dn;
+	int node, ret = 0;
+
+	if (!usable_mem) {
+		pr_err("Usable memory ranges for kdump kernel not found\n");
+		return -ENOENT;
+	}
+
+	node = fdt_path_offset(fdt, "/ibm,dynamic-reconfiguration-memory");
+	if (node == -FDT_ERR_NOTFOUND)
+		pr_debug("No dynamic reconfiguration memory found\n");
+	else if (node < 0) {
+		pr_err("Malformed device tree: error reading /ibm,dynamic-reconfiguration-memory.\n");
+		return -EINVAL;
+	}
+
+	um_info.buf  = NULL;
+	um_info.size = 0;
+	um_info.max_entries = 0;
+	um_info.idx  = 0;
+	/* Memory ranges to look up */
+	um_info.ranges = &(usable_mem->ranges[0]);
+	um_info.nr_ranges = usable_mem->nr_ranges;
+
+	dn = of_find_node_by_path("/ibm,dynamic-reconfiguration-memory");
+	if (dn) {
+		ret = walk_drmem_lmbs(dn, &um_info, kdump_setup_usable_lmb);
+		of_node_put(dn);
+
+		if (ret) {
+			pr_err("Could not setup linux,drconf-usable-memory property for kdump\n");
+			goto out;
+		}
+
+		ret = fdt_setprop(fdt, node, "linux,drconf-usable-memory",
+				  um_info.buf, (um_info.idx * sizeof(u64)));
+		if (ret) {
+			pr_err("Failed to update fdt with linux,drconf-usable-memory property");
+			goto out;
+		}
+	}
+
+	/*
+	 * Walk through each memory node and set linux,usable-memory property
+	 * for the corresponding node in kdump kernel's fdt.
+	 */
+	for_each_node_by_type(dn, "memory") {
+		ret = add_usable_mem_property(fdt, dn, &um_info);
+		if (ret) {
+			pr_err("Failed to set linux,usable-memory property for %s node",
+			       dn->full_name);
+			goto out;
+		}
+	}
+
+out:
+	kfree(um_info.buf);
+	return ret;
+}
+
 /**
  * setup_purgatory_ppc64 - initialize PPC64 specific purgatory's global
  *                         variables and call setup_purgatory() to initialize
@@ -293,6 +625,25 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 
 	ret = setup_purgatory(image, slave_code, fdt, kernel_load_addr,
 			      fdt_load_addr);
+	if (ret)
+		goto out;
+
+	if (image->type == KEXEC_TYPE_CRASH) {
+		u32 my_run_at_load = 1;
+
+		/*
+		 * Tell relocatable kernel to run at load address
+		 * via the word meant for that at 0x5c.
+		 */
+		ret = kexec_purgatory_get_set_symbol(image, "run_at_load",
+						     &my_run_at_load,
+						     sizeof(my_run_at_load),
+						     false);
+		if (ret)
+			goto out;
+	}
+
+out:
 	if (ret)
 		pr_err("Failed to setup purgatory symbols");
 	return ret;
@@ -314,7 +665,40 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 			unsigned long initrd_load_addr,
 			unsigned long initrd_len, const char *cmdline)
 {
-	return setup_new_fdt(image, fdt, initrd_load_addr, initrd_len, cmdline);
+	struct crash_mem *umem = NULL;
+	int ret;
+
+	ret = setup_new_fdt(image, fdt, initrd_load_addr, initrd_len, cmdline);
+	if (ret)
+		goto out;
+
+	/*
+	 * Restrict memory usage for kdump kernel by setting up
+	 * usable memory ranges.
+	 */
+	if (image->type == KEXEC_TYPE_CRASH) {
+		ret = get_usable_memory_ranges(&umem);
+		if (ret)
+			goto out;
+
+		ret = update_usable_mem_fdt(fdt, umem);
+		if (ret) {
+			pr_err("Error setting up usable-memory property for kdump kernel\n");
+			goto out;
+		}
+
+		/* Ensure we don't touch crashed kernel's memory */
+		ret = fdt_add_mem_rsv(fdt, 0, crashk_res.start);
+		if (ret) {
+			pr_err("Error reserving crash memory: %s\n",
+			       fdt_strerror(ret));
+			goto out;
+		}
+	}
+
+out:
+	kfree(umem);
+	return ret;
 }
 
 /**


