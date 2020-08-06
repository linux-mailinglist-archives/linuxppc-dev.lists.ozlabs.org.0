Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF95423DBA3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 18:27:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMv6Y1bTbzDqPg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 02:27:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=P88sgw9L; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMv254jjxzDqPg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 02:23:57 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 076G28Kw092342; Thu, 6 Aug 2020 12:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=v/nKBIQ/QmF4NtKix7ro0p/HBdAKioEkxmxOybyy/s4=;
 b=P88sgw9LyR0GfGEnPjr6mbe5P7eo+CMUgb6gi+F3p5ih+oJ2Wm7udQtjN7pjbO00FILo
 qrpBtHYR+lT3Mllo6Bq9drDdDEi6tcGtICIucVFm9y4QbfefigTct1HE3fhfdr5jsgI4
 qn8vC70Y/eFae37vFesrRxb7GMV0+l04PDcLIGFgOor+ny97aItMYL2MrBHyBgcN0ivv
 HRYr83YsVNq4gJjQNu3t+BImSX5xCrVKZ1txOudhLwTcVUnXEAiV/mj2l5nDSXxYvjCI
 J0WNKlpdiLDgTyQOoxgR/Jfp7bHCHbWVcRtg/Z7LX9H7EvuNLlbyRWHR+0JRm6kpj5wh TA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32repgw2jg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Aug 2020 12:23:51 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 076GK5gM025104;
 Thu, 6 Aug 2020 16:23:51 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 32nxe51jr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Aug 2020 16:23:51 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 076GNkj22753110
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Aug 2020 16:23:46 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3C9A7805E;
 Thu,  6 Aug 2020 16:23:49 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F5F87805F;
 Thu,  6 Aug 2020 16:23:48 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.37.237])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  6 Aug 2020 16:23:47 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 2/4] powerpc/mem: Store the dt_root_size/addr cell values
 for later usage
Date: Thu,  6 Aug 2020 21:53:27 +0530
Message-Id: <20200806162329.276534-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200806162329.276534-1-aneesh.kumar@linux.ibm.com>
References: <20200806162329.276534-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-06_12:2020-08-06,
 2020-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008060111
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

dt_root_addr_cells and dt_root_size_cells are __initdata variables.
So make a copy of the same which can be used post init.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/drmem.h | 2 ++
 arch/powerpc/kernel/prom.c       | 7 +++++++
 arch/powerpc/mm/numa.c           | 1 +
 3 files changed, 10 insertions(+)

diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
index d719cbac34b2..ffb59caa88ee 100644
--- a/arch/powerpc/include/asm/drmem.h
+++ b/arch/powerpc/include/asm/drmem.h
@@ -123,4 +123,6 @@ static inline void lmb_clear_nid(struct drmem_lmb *lmb)
 }
 #endif
 
+extern int mem_addr_cells, mem_size_cells;
+
 #endif /* _ASM_POWERPC_LMB_H */
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index d8a2fb87ba0c..9a1701e85747 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -73,6 +73,7 @@ u64 ppc64_rma_size;
 #endif
 static phys_addr_t first_memblock_size;
 static int __initdata boot_cpu_count;
+int mem_addr_cells, mem_size_cells;
 
 static int __init early_parse_mem(char *p)
 {
@@ -536,6 +537,12 @@ static int __init early_init_dt_scan_memory_ppc(unsigned long node,
 						const char *uname,
 						int depth, void *data)
 {
+	/*
+	 * Make a copy from __initdata variable
+	 */
+	mem_addr_cells = dt_root_addr_cells;
+	mem_size_cells = dt_root_size_cells;
+
 #ifdef CONFIG_PPC_PSERIES
 	if (depth == 1 &&
 	    strcmp(uname, "ibm,dynamic-reconfiguration-memory") == 0) {
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 058fee9a0835..77d41d9775d2 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -368,6 +368,7 @@ static void __init get_n_mem_cells(int *n_addr_cells, int *n_size_cells)
 	of_node_put(memory);
 }
 
+/*  dt_mem_next_cell is __init  */
 static unsigned long read_n_cells(int n, const __be32 **buf)
 {
 	unsigned long result = 0;
-- 
2.26.2

