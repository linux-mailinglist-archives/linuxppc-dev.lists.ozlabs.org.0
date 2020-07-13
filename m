Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EF921DEF6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 19:46:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B59zp458hzDqP3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 03:45:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B59VF1c2wzDqMr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 03:23:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B59VD6M51z8vnS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 03:23:48 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B59VD47jGz9sTS; Tue, 14 Jul 2020 03:23:48 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 4B59VC6gqrz9sTC
 for <linuxppc-dev@ozlabs.org>; Tue, 14 Jul 2020 03:23:47 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06DH1pVf138319; Mon, 13 Jul 2020 13:23:39 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3279kwk3b6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 13:23:38 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06DH21pd139454;
 Mon, 13 Jul 2020 13:23:38 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3279kwk3aj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 13:23:38 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06DHKeOD014945;
 Mon, 13 Jul 2020 17:23:36 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 327527te8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 17:23:36 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06DHNXiS62849104
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jul 2020 17:23:33 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0F5D11C04A;
 Mon, 13 Jul 2020 17:23:33 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 634C911C04C;
 Mon, 13 Jul 2020 17:23:30 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.3.11])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jul 2020 17:23:30 +0000 (GMT)
Subject: [PATCH v3 11/12] ppc64/kexec_file: add appropriate regions for
 memory reserve map
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 13 Jul 2020 22:53:29 +0530
Message-ID: <159466100206.24747.3782313430191321863.stgit@hbathini.in.ibm.com>
In-Reply-To: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-13_15:2020-07-13,
 2020-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007130120
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
 Nayna Jain <nayna@linux.ibm.com>, Petr Tesarik <ptesarik@suse.cz>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While initrd, elfcorehdr and backup regions are already added to the
reserve map, there are a few missing regions that need to be added to
the memory reserve map. Add them here. And now that all the changes
to load panic kernel are in place, claim likewise.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Tested-by: Pingfan Liu <piliu@redhat.com>
---

v2 -> v3:
* Unchanged. Added Tested-by tag from Pingfan.

v1 -> v2:
* Updated add_rtas_mem_range() & add_opal_mem_range() callsites based on
  the new prototype for these functions.


 arch/powerpc/kexec/file_load_64.c |   58 ++++++++++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 2531bb5..29e5d11 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -193,6 +193,34 @@ static int get_crash_memory_ranges(struct crash_mem **mem_ranges)
 }
 
 /**
+ * get_reserved_memory_ranges - Get reserve memory ranges. This list includes
+ *                              memory regions that should be added to the
+ *                              memory reserve map to ensure the region is
+ *                              protected from any mischeif.
+ * @mem_ranges:                 Range list to add the memory ranges to.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int get_reserved_memory_ranges(struct crash_mem **mem_ranges)
+{
+	int ret;
+
+	ret = add_rtas_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_tce_mem_ranges(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_reserved_ranges(mem_ranges);
+out:
+	if (ret)
+		pr_err("Failed to setup reserved memory ranges\n");
+	return ret;
+}
+
+/**
  * __locate_mem_hole_top_down - Looks top down for a large enough memory hole
  *                              in the memory regions between buf_min & buf_max
  *                              for the buffer. If found, sets kbuf->mem.
@@ -1202,8 +1230,8 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 			unsigned long initrd_load_addr,
 			unsigned long initrd_len, const char *cmdline)
 {
-	struct crash_mem *umem = NULL;
-	int chosen_node, ret;
+	struct crash_mem *umem = NULL, *rmem = NULL;
+	int i, nr_ranges, chosen_node, ret;
 
 	/* Remove memory reservation for the current device tree. */
 	ret = delete_fdt_mem_rsv(fdt, __pa(initial_boot_params),
@@ -1249,6 +1277,25 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 		}
 	}
 
+	/* Update memory reserve map */
+	ret = get_reserved_memory_ranges(&rmem);
+	if (ret)
+		goto out;
+
+	nr_ranges = rmem ? rmem->nr_ranges : 0;
+	for (i = 0; i < nr_ranges; i++) {
+		u64 base, size;
+
+		base = rmem->ranges[i].start;
+		size = rmem->ranges[i].end - base + 1;
+		ret = fdt_add_mem_rsv(fdt, base, size);
+		if (ret) {
+			pr_err("Error updating memory reserve map: %s\n",
+			       fdt_strerror(ret));
+			goto out;
+		}
+	}
+
 	ret = setup_new_fdt(image, fdt, initrd_load_addr, initrd_len,
 			    cmdline, &chosen_node);
 	if (ret)
@@ -1259,6 +1306,7 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 		pr_err("Failed to update device-tree with linux,booted-from-kexec\n");
 out:
 	kfree(umem);
+	kfree(rmem);
 	return ret;
 }
 
@@ -1433,10 +1481,10 @@ int arch_kexec_kernel_image_probe(struct kimage *image, void *buf,
 
 		/* Get exclude memory ranges needed for setting up kdump segments */
 		ret = get_exclude_memory_ranges(&(image->arch.exclude_ranges));
-		if (ret)
+		if (ret) {
 			pr_err("Failed to setup exclude memory ranges for buffer lookup\n");
-		/* Return this until all changes for panic kernel are in */
-		return -EOPNOTSUPP;
+			return ret;
+		}
 	}
 
 	return kexec_image_probe_default(image, buf, buf_len);

