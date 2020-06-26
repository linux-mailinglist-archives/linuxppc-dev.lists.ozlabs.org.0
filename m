Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D2D20B93C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 21:19:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tmrz11QLzDqcL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 05:18:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tmYr3LvJzDqvw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 05:05:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49tmYq3YWJz9CmH
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 05:05:51 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49tmYq0hSZz9sSc; Sat, 27 Jun 2020 05:05:51 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49tmYp0g7Dz9sT9
 for <linuxppc-dev@ozlabs.org>; Sat, 27 Jun 2020 05:05:49 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05QJ2CnD142114; Fri, 26 Jun 2020 15:05:41 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31vtt4mpqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 15:05:40 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05QJ2VLL143248;
 Fri, 26 Jun 2020 15:05:40 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31vtt4mppu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 15:05:40 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05QJ0gAk012769;
 Fri, 26 Jun 2020 19:05:38 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 31uusghmjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 19:05:38 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05QJ4G0i66388442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jun 2020 19:04:16 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6715D52050;
 Fri, 26 Jun 2020 19:05:35 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.0.159])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 18DC052052;
 Fri, 26 Jun 2020 19:05:31 +0000 (GMT)
Subject: [PATCH 06/11] ppc64/kexec_file: restrict memory usage of kdump kernel
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Sat, 27 Jun 2020 00:35:31 +0530
Message-ID: <159319833094.16351.3845858186331136705.stgit@hbathini.in.ibm.com>
In-Reply-To: <159319825403.16351.7253978047621755765.stgit@hbathini.in.ibm.com>
References: <159319825403.16351.7253978047621755765.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-26_10:2020-06-26,
 2020-06-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 spamscore=0 cotscore=-2147483648
 clxscore=1015 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006260130
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
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
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
---
 arch/powerpc/kexec/file_load_64.c |  400 +++++++++++++++++++++++++++++++++++++
 1 file changed, 398 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index f1d7160..d85cba4d 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -17,9 +17,21 @@
 #include <linux/kexec.h>
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+#include <asm/drmem.h>
 #include <asm/kexec_ranges.h>
 #include <asm/crashdump-ppc64.h>
 
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
@@ -75,6 +87,38 @@ static int get_exclude_memory_ranges(struct crash_mem **mem_ranges)
 }
 
 /**
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
+	/* First memory block & crashkernel region */
+	ret = add_mem_range(mem_ranges, 0, crashk_res.end + 1);
+	if (ret)
+		goto out;
+
+	ret = add_rtas_mem_range(mem_ranges, false);
+	if (ret)
+		goto out;
+
+	ret = add_opal_mem_range(mem_ranges, false);
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
+/**
  * __locate_mem_hole_ppc64 - Tests if the memory hole between buf_min & buf_max
  *                           is large enough for the buffer. If true, sets
  *                           kbuf->mem to the buffer.
@@ -267,6 +311,321 @@ static int kexec_locate_mem_hole_ppc64(struct kexec_buf *kbuf)
 }
 
 /**
+ * check_realloc_usable_mem - Reallocate buffer if it can't accommodate entries
+ * @um_info:                  Usable memory buffer and ranges info.
+ * @cnt:                      No. of entries to accommodate.
+ *
+ * Returns 0 on success, negative errno on error.
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
+			buf[um_info->idx++] = cpu_to_be64(loc_end - loc_base);
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
+		pr_err("Trying kdump load from a kdump kernel?\n");
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
+	end = base + drmem_lmb_size();
+	ret = add_usable_mem(um_info, base, end, &cnt);
+	if (!ret)
+		um_info->buf[tmp_idx] = cpu_to_be64(cnt);
+
+	return ret;
+}
+
+/**
+ * get_node_path - Get the full path of the given node.
+ * @dn:            Node.
+ * @path:          Updated with the full path of the node.
+ *
+ * Returns nothing.
+ */
+static void get_node_path(struct device_node *dn, char *path)
+{
+	if (!dn)
+		return;
+
+	get_node_path(dn->parent, path);
+	sprintf(path, "/%s", dn->full_name);
+}
+
+/**
+ * get_node_pathlen - Get the full path length of the given node.
+ * @dn:               Node.
+ *
+ * Returns the length of the full path of the node.
+ */
+static int get_node_pathlen(struct device_node *dn)
+{
+	int len = 0;
+
+	while (dn) {
+		len += strlen(dn->full_name) + 1;
+		dn = dn->parent;
+	}
+	len++;
+
+	return len;
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
+	/* Allocate memory for node path */
+	pathname = kzalloc(ALIGN(get_node_pathlen(dn), 8), GFP_KERNEL);
+	if (!pathname)
+		return -ENOMEM;
+
+	/* Get the full path of the memory node */
+	get_node_path(dn, pathname);
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
+	 * "reg" property represents sequence of (addr,size) duples
+	 * each representing a memory range.
+	 */
+	ranges = (len >> 2) / (n_mem_addr_cells + n_mem_size_cells);
+
+	for (i = 0; i < ranges; i++) {
+		base = of_read_number(prop, n_mem_addr_cells);
+		prop += n_mem_addr_cells;
+		end = base + of_read_number(prop, n_mem_size_cells);
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
+	 * Write (0,0) duple in linux,usable-memory property for
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
+		if (ret)
+			goto out;
+
+		ret = fdt_setprop(fdt, node, "linux,drconf-usable-memory",
+				  um_info.buf,
+				  (um_info.idx * sizeof(*(um_info.buf))));
+		if (ret) {
+			pr_err("Failed to set linux,drconf-usable-memory property");
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
+/**
  * setup_purgatory_ppc64 - initialize PPC64 specific purgatory's global
  *                         variables and call setup_purgatory() to initialize
  *                         common global variable.
@@ -287,6 +646,25 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 	ret = setup_purgatory(image, slave_code, fdt, kernel_load_addr,
 			      fdt_load_addr);
 	if (ret)
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
+	if (ret)
 		pr_err("Failed to setup purgatory symbols");
 	return ret;
 }
@@ -307,6 +685,7 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 			unsigned long initrd_load_addr,
 			unsigned long initrd_len, const char *cmdline)
 {
+	struct crash_mem *umem = NULL;
 	int chosen_node, ret;
 
 	/* Remove memory reservation for the current device tree. */
@@ -319,15 +698,32 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 		return ret;
 	}
 
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
+	}
+
 	ret = setup_new_fdt(image, fdt, initrd_load_addr, initrd_len,
 			    cmdline, &chosen_node);
 	if (ret)
-		return ret;
+		goto out;
 
 	ret = fdt_setprop(fdt, chosen_node, "linux,booted-from-kexec", NULL, 0);
 	if (ret)
 		pr_err("Failed to update device-tree with linux,booted-from-kexec\n");
-
+out:
+	kfree(umem);
 	return ret;
 }
 

