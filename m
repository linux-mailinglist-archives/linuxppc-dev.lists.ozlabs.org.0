Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3110212DC1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 22:18:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yTty422zzDqND
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 06:18:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yTQM4dVczDr1P
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 05:57:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49yTQM2xpwz8tZ0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 05:57:15 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49yTQM24G5z9sRf; Fri,  3 Jul 2020 05:57:15 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49yTQL4zl1z9sPF
 for <linuxppc-dev@ozlabs.org>; Fri,  3 Jul 2020 05:57:14 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 062JW93V146416; Thu, 2 Jul 2020 15:57:09 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 320sk11rf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 15:57:09 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 062JXNJh007484;
 Thu, 2 Jul 2020 15:57:08 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 320sk11rea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 15:57:08 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 062JtjY3013726;
 Thu, 2 Jul 2020 19:57:06 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 31wwr8egq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 19:57:06 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 062Jv2Rn65208610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jul 2020 19:57:03 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE6FD11C052;
 Thu,  2 Jul 2020 19:57:02 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE80611C04A;
 Thu,  2 Jul 2020 19:56:59 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.21.221])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  2 Jul 2020 19:56:59 +0000 (GMT)
Subject: [PATCH v2 11/12] ppc64/kexec_file: add appropriate regions for
 memory reserve map
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 03 Jul 2020 01:26:58 +0530
Message-ID: <159371981275.21555.6976349309559084424.stgit@hbathini.in.ibm.com>
In-Reply-To: <159371956443.21555.18251597651350106920.stgit@hbathini.in.ibm.com>
References: <159371956443.21555.18251597651350106920.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_09:2020-07-02,
 2020-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 cotscore=-2147483648
 clxscore=1015 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007020129
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

While initrd, elfcorehdr and backup regions are already added to the
reserve map, there are a few missing regions that need to be added to
the memory reserve map. Add them here. And now that all the changes
to load panic kernel are in place, claim likewise.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v2:
* Updated add_rtas_mem_range() & add_opal_mem_range() callsites based on
  the new prototype for these functions.


 arch/powerpc/kexec/file_load_64.c |   58 ++++++++++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 6f895fa..d3b29e0 100644
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
@@ -1200,8 +1228,8 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 			unsigned long initrd_load_addr,
 			unsigned long initrd_len, const char *cmdline)
 {
-	struct crash_mem *umem = NULL;
-	int chosen_node, ret;
+	struct crash_mem *umem = NULL, *rmem = NULL;
+	int i, nr_ranges, chosen_node, ret;
 
 	/* Remove memory reservation for the current device tree. */
 	ret = delete_fdt_mem_rsv(fdt, __pa(initial_boot_params),
@@ -1247,6 +1275,25 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
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
@@ -1257,6 +1304,7 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 		pr_err("Failed to update device-tree with linux,booted-from-kexec\n");
 out:
 	kfree(umem);
+	kfree(rmem);
 	return ret;
 }
 
@@ -1434,10 +1482,10 @@ int arch_kexec_kernel_image_probe(struct kimage *image, void *buf,
 
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

