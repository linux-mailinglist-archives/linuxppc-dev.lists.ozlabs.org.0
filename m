Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 312B62F6DAE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 23:09:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGz3t3zRpzDsYM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 09:08:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=a5t9uQAx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGysq1ZP7zDsPr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 09:00:14 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10ELXES1182054; Thu, 14 Jan 2021 17:00:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=zD5ssX1wFRxILitYxtE8OgPmj0nMcQuLRilCtTB5Kfo=;
 b=a5t9uQAxeF48SoPbBjJVy3r/PPnbvQ6y3ydV/UfHquTU1u/a7uYe6Sc1g3HYT6yuuBiJ
 uuM/9VgurIcwCOwlCgpQG8ay1wWVqE0shaJ5mpNIKs07nN/nmeEIExiOHDW6/9xrOyY/
 5jvS5JBRhSaVEpLwr1ntbJu6MlOAEi6MJQ653nGPRFf3kU+INWEdxf8pr4AZtZvweSSj
 gzpd3P7NVZGfQ1ZBbVGOxnx1wSM+WaW5SinC7kzfuGeoZm3A7j2TDqmBRCDOkVN7+WCD
 yzclk2JTQb06Vb3OxvMRBuolSjBjFs7PIUn/1zaqssSe1Pm2s92eIiFbDpXvr2gXECFu zw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 362wv38r27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 17:00:10 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10ELw8Zm022971;
 Thu, 14 Jan 2021 22:00:09 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 35y449taet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 22:00:09 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10EM07HN22151666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 22:00:07 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B87578076;
 Thu, 14 Jan 2021 22:00:07 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CDE27805F;
 Thu, 14 Jan 2021 22:00:07 +0000 (GMT)
Received: from localhost (unknown [9.163.36.68])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 14 Jan 2021 22:00:07 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/6] powerpc/rtas: constrain user region allocation to RMA
Date: Thu, 14 Jan 2021 16:00:04 -0600
Message-Id: <20210114220004.1138993-7-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114220004.1138993-1-nathanl@linux.ibm.com>
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_08:2021-01-14,
 2021-01-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101140124
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, aik@ozlabs.ru,
 aneesh.kumar@linux.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Memory locations passed as arguments from the OS to RTAS usually need
to be addressable in 32-bit mode and must reside in the Real Mode
Area. On PAPR guests, the RMA starts at logical address 0 and is the
first logical memory block reported in the LPAR’s device tree.

On powerpc targets with RTAS, Linux makes available to user space a
region of memory suitable for arguments to be passed to RTAS via
sys_rtas(). This region (rtas_rmo_buf) is allocated via the memblock
API during boot in order to ensure that it satisfies the requirements
described above.

With radix MMU, the upper limit supplied to the memblock allocation
can exceed the bounds of the first logical memory block, since
ppc64_rma_size is ULONG_MAX and RTAS_INSTANTIATE_MAX is 1GB. (512MB is
a common size of the first memory block according to a small sample of
LPARs I have checked.) This leads to failures when user space invokes
an RTAS function that uses a work area, such as
ibm,configure-connector.

Alter the determination of the upper limit for rtas_rmo_buf's
allocation to consult the device tree directly, ensuring placement
within the RMA regardless of the MMU in use.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 80 +++++++++++++++++++++++++++++++-------
 1 file changed, 65 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index da65faadbbb2..98dfb112f4df 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1166,6 +1166,70 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	return 0;
 }
 
+/*
+ * Memory locations passed to RTAS must be in the RMA as described by
+ * the range in /memory@0.
+ */
+static phys_addr_t rtas_arg_addr_limit(void)
+{
+	unsigned int addr_cells;
+	unsigned int size_cells;
+	struct device_node *np;
+	const __be32 *prop;
+	u64 limit;
+	u64 base;
+
+	/* RTAS is instantiated in 32-bit mode. */
+	limit = 1ULL << 32;
+
+	/* Account for mem=. */
+	if (memory_limit != 0)
+		limit = min(limit, memory_limit);
+
+	np = of_find_node_by_path("/memory@0");
+	if (!np)
+		goto out;
+
+	prop = of_get_property(np, "reg", NULL);
+	if (!prop)
+		goto put;
+
+	addr_cells = of_n_addr_cells(np);
+	base = of_read_number(prop, addr_cells);
+	prop += addr_cells;
+	size_cells = of_n_size_cells(np);
+	limit = min(limit, of_read_number(prop, size_cells));
+put:
+	of_node_put(np);
+out:
+	pr_debug("%s: base = %#llx limit = %#llx", __func__, base, limit);
+
+	return limit;
+}
+
+static void __init rtas_user_region_setup(void)
+{
+	phys_addr_t limit, align, size;
+
+	limit = rtas_arg_addr_limit();
+	size = RTAS_USER_REGION_SIZE;
+
+	/*
+	 * Although work areas need only 4KB alignment, user space
+	 * accesses this region via mmap so it must be placed on a
+	 * page boundary.
+	 */
+	align = PAGE_SIZE;
+
+	rtas_rmo_buf = memblock_phys_alloc_range(size, align, 0, limit);
+	if (rtas_rmo_buf == 0) {
+		panic("Failed to allocate %llu bytes for user region below %pa\n",
+		      size, &limit);
+	}
+
+	pr_debug("RTAS user region allocated at %pa\n", &rtas_rmo_buf);
+}
+
 /*
  * Call early during boot, before mem init, to retrieve the RTAS
  * information from the device-tree and allocate the RMO buffer for userland
@@ -1173,7 +1237,6 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
  */
 void __init rtas_initialize(void)
 {
-	unsigned long rtas_region = RTAS_INSTANTIATE_MAX;
 	u32 base, size, entry;
 	int no_base, no_size, no_entry;
 
@@ -1197,23 +1260,10 @@ void __init rtas_initialize(void)
 	no_entry = of_property_read_u32(rtas.dev, "linux,rtas-entry", &entry);
 	rtas.entry = no_entry ? rtas.base : entry;
 
-	/* If RTAS was found, allocate the RMO buffer for it and look for
-	 * the stop-self token if any
-	 */
-#ifdef CONFIG_PPC64
-	if (firmware_has_feature(FW_FEATURE_LPAR))
-		rtas_region = min(ppc64_rma_size, RTAS_INSTANTIATE_MAX);
-#endif
-	rtas_rmo_buf = memblock_phys_alloc_range(RTAS_USER_REGION_SIZE, PAGE_SIZE,
-						 0, rtas_region);
-	if (!rtas_rmo_buf)
-		panic("ERROR: RTAS: Failed to allocate %lx bytes below %pa\n",
-		      PAGE_SIZE, &rtas_region);
-
 #ifdef CONFIG_RTAS_ERROR_LOGGING
 	rtas_last_error_token = rtas_token("rtas-last-error");
 #endif
-
+	rtas_user_region_setup();
 	rtas_syscall_filter_init();
 }
 
-- 
2.29.2

