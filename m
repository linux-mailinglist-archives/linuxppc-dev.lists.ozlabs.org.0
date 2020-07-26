Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B24E622E25F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 21:50:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFD6w1zNxzF0kD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 05:50:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFCtH4GFzzDrS2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 05:39:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BFCtH0tRcz8tRl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 05:39:03 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BFCtG6bCFz9sRR; Mon, 27 Jul 2020 05:39:02 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BFCtG1y0pz9sRN
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Jul 2020 05:39:02 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06QJWDg4118379; Sun, 26 Jul 2020 15:38:57 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32gevq1983-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 15:38:56 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06QJWExN118489;
 Sun, 26 Jul 2020 15:38:56 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32gevq197u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 15:38:56 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06QJb5rN016212;
 Sun, 26 Jul 2020 19:38:54 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 32gcpx1fgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 19:38:54 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06QJcp4Q19464696
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 26 Jul 2020 19:38:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8801611C050;
 Sun, 26 Jul 2020 19:38:51 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0825811C04A;
 Sun, 26 Jul 2020 19:38:48 +0000 (GMT)
Received: from [192.168.0.8] (unknown [9.85.82.224])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 26 Jul 2020 19:38:47 +0000 (GMT)
Subject: [RESEND PATCH v5 06/11] ppc64/kexec_file: restrict memory usage of
 kdump kernel
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 27 Jul 2020 01:08:45 +0530
Message-ID: <159579231812.5790.16096865978767385505.stgit@hbathini>
In-Reply-To: <159579157320.5790.6748078824637688685.stgit@hbathini>
References: <159579157320.5790.6748078824637688685.stgit@hbathini>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-26_09:2020-07-24,
 2020-07-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 mlxscore=0 suspectscore=2 adultscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007260150
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
---

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


 arch/powerpc/kexec/file_load_64.c |  478 +++++++++++++++++++++++++++++++++++++
 1 file changed, 477 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 2df6f4273ddd..8df085a22fd7 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -17,9 +17,21 @@
 #include <linux/kexec.h>
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
+#include <linux/of_device.h>
 #include <linux/memblock.h>
+#include <linux/slab.h>
+#include <asm/drmem.h>
 #include <asm/kexec_ranges.h>
 
+struct umem_info {
+	uint64_t *buf; /* data buffer for usable-memory property */
+	uint32_t idx;  /* current index */
+	uint32_t size; /* size allocated for the data buffer */
+
+	/* usable memory ranges to look up */
+	const struct crash_mem *umrngs;
+};
+
 const struct kexec_file_ops * const kexec_file_loaders[] = {
 	&kexec_elf64_ops,
 	NULL
@@ -74,6 +86,42 @@ static int get_exclude_memory_ranges(struct crash_mem **mem_ranges)
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
+	 * prom code doesn't take kindly to missing low memory. So, add
+	 * [0, crashk_res.end] instead of [crashk_res.start, crashk_res.end]
+	 * to keep it happy.
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
@@ -273,6 +321,382 @@ static int locate_mem_hole_bottom_up_ppc64(struct kexec_buf *kbuf,
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
+static uint64_t *check_realloc_usable_mem(struct umem_info *um_info, int cnt)
+{
+	void *tbuf;
+
+	if (um_info->size >=
+	    ((um_info->idx + cnt) * sizeof(*(um_info->buf))))
+		return um_info->buf;
+
+	um_info->size += MEM_RANGE_CHUNK_SZ;
+	tbuf = krealloc(um_info->buf, um_info->size, GFP_KERNEL);
+	if (!tbuf) {
+		um_info->size -= MEM_RANGE_CHUNK_SZ;
+		return NULL;
+	}
+
+	memset(tbuf + um_info->idx, 0, MEM_RANGE_CHUNK_SZ);
+	return tbuf;
+}
+
+/**
+ * add_usable_mem - Add the usable memory ranges within the given memory range
+ *                  to the buffer
+ * @um_info:        Usable memory buffer and ranges info.
+ * @base:           Base address of memory range to look for.
+ * @end:            End address of memory range to look for.
+ * @cnt:            No. of usable memory ranges added to buffer.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int add_usable_mem(struct umem_info *um_info, uint64_t base,
+			  uint64_t end, int *cnt)
+{
+	uint64_t loc_base, loc_end, *buf;
+	const struct crash_mem *umrngs;
+	int i, add;
+
+	*cnt = 0;
+	umrngs = um_info->umrngs;
+	for (i = 0; i < umrngs->nr_ranges; i++) {
+		add = 0;
+		loc_base = umrngs->ranges[i].start;
+		loc_end = umrngs->ranges[i].end;
+		if (loc_base >= base && loc_end <= end)
+			add = 1;
+		else if (base < loc_end && end > loc_base) {
+			if (loc_base < base)
+				loc_base = base;
+			if (loc_end > end)
+				loc_end = end;
+			add = 1;
+		}
+
+		if (add) {
+			buf = check_realloc_usable_mem(um_info, 2);
+			if (!buf)
+				return -ENOMEM;
+
+			um_info->buf = buf;
+			buf[um_info->idx++] = cpu_to_be64(loc_base);
+			buf[um_info->idx++] =
+					cpu_to_be64(loc_end - loc_base + 1);
+			(*cnt)++;
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
+	uint64_t base, end, *buf;
+	int cnt, tmp_idx, ret;
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
+	buf = check_realloc_usable_mem(um_info, 1);
+	if (!buf)
+		return -ENOMEM;
+
+	um_info->idx++;
+	um_info->buf = buf;
+	base = lmb->base_addr;
+	end = base + drmem_lmb_size() - 1;
+	ret = add_usable_mem(um_info, base, end, &cnt);
+	if (!ret)
+		um_info->buf[tmp_idx] = cpu_to_be64(cnt);
+
+	return ret;
+}
+
+/**
+ * get_node_path_size - Get the full path length of the given node.
+ * @dn:                 Device Node.
+ *
+ * Also, counts '\0' at the end of the path.
+ * For example, /memory@0 will be "/memory@0\0" => 10 bytes.
+ *
+ * Returns the string size of the node's full path.
+ */
+static int get_node_path_size(struct device_node *dn)
+{
+	int len = 0;
+
+	if (!dn)
+		return 0;
+
+	/* Root node */
+	if (!(dn->parent))
+		return 2;
+
+	while (dn) {
+		len += strlen(dn->full_name) + 1;
+		dn = dn->parent;
+	}
+
+	return len;
+}
+
+/**
+ * get_node_path - Get the full path of the given node.
+ * @node:          Device node.
+ *
+ * Allocates buffer for node path. The caller must free the buffer
+ * after use.
+ *
+ * Returns buffer with path on success, NULL otherwise.
+ */
+static char *get_node_path(struct device_node *node)
+{
+	struct device_node *dn;
+	int len, idx, nlen;
+	char *path = NULL;
+	bool end_char;
+
+	if (!node)
+		goto err;
+
+	/*
+	 * Get the path size first and use it to iteratively build the path
+	 * from node to root.
+	 */
+	len = get_node_path_size(node);
+
+	/* Allocate memory for node path */
+	path = kzalloc(ALIGN(len, 8), GFP_KERNEL);
+	if (!path)
+		goto err;
+
+	/*
+	 * Iteratively update path from "node" to root by decrementing
+	 * index appropriately.
+	 *
+	 * Adds %NUL at the end of "node" & '/' at the end of all its
+	 * parent nodes.
+	 */
+	dn = node;
+	idx = len;
+	path[0] = '/';
+	end_char = true;
+	path[--idx] = '\0';
+	while (dn->parent) {
+		if (!end_char)
+			path[--idx] = '/';
+		end_char = false;
+
+		nlen = strlen(dn->full_name);
+		idx -= nlen;
+		memcpy(path + idx, dn->full_name, nlen);
+
+		dn = dn->parent;
+	}
+
+	return path;
+err:
+	kfree(path);
+	return NULL;
+}
+
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
+	int i, len, ranges, cnt, ret;
+	uint64_t base, end, *buf;
+	const __be32 *prop;
+	char *pathname;
+
+	of_node_get(dn);
+
+	/* Get the full path of the memory node */
+	pathname = get_node_path(dn);
+	if (!pathname) {
+		ret = -ENOMEM;
+		goto out;
+	}
+	pr_debug("Memory node path: %s\n", pathname);
+
+	/* Now that we know the path, find its offset in kdump kernel's fdt */
+	node = fdt_path_offset(fdt, pathname);
+	if (node < 0) {
+		pr_err("Malformed device tree: error reading %s\n",
+		       pathname);
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
+	buf = check_realloc_usable_mem(um_info, 2);
+	if (!buf) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	um_info->buf = buf;
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
+		ret = add_usable_mem(um_info, base, end, &cnt);
+		if (ret) {
+			ret = ret;
+			goto out;
+		}
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
+			  (um_info->idx * sizeof(*(um_info->buf))));
+
+out:
+	kfree(pathname);
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
+	um_info.size = 0;
+	um_info.idx  = 0;
+	um_info.buf  = NULL;
+	um_info.umrngs = usable_mem;
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
+				  um_info.buf,
+				  (um_info.idx * sizeof(*(um_info.buf))));
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
@@ -293,6 +717,25 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 
 	ret = setup_purgatory(image, slave_code, fdt, kernel_load_addr,
 			      fdt_load_addr);
+	if (ret)
+		goto out;
+
+	if (image->type == KEXEC_TYPE_CRASH) {
+		uint32_t my_run_at_load = 1;
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
@@ -314,7 +757,40 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
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


