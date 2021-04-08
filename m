Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B570C3585EE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 16:08:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGNQ7577Rz3c9P
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 00:07:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fW6QLQnh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fW6QLQnh; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGNNk3W4Zz30Dc
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 00:06:45 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 138E33Cd034732; Thu, 8 Apr 2021 10:06:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qszDMPxHPZLZ8O+HC9RTVe/NwvM04VczIKfD04dvQH4=;
 b=fW6QLQnhPuJrmnNCOYhctjYMBTjaVwyQVyiNOzxxPG71nEjwPxJOrSwutdiyZkcMnk+g
 XJ3VABFLXsgpaCLkOJ2PdsqAasITJ07CQeTsVEI8B0GWlcBOvkDp9v+6AkACmgZqd0Qx
 YO1zI5ieXl4oUQdaMKPGFKVko0lw8coywL01sR+WygbBPRycvinsvRNe8TizwF/1YF7H
 HWFDfFjUgudpGJggJ8dLv0D5JnmQBY0U+QSDe+VnrGyFDILoKVSoXXnnJkkFZqtlFCth
 e2wwzjcfCjpS7BnNkN340xlRO4VhLGGPVqjDnCQgB7HEZBR7isNfiiBvrh5y6ELPLbY+ IA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37s5xtgqgb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 10:06:37 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 138E39Tg035895;
 Thu, 8 Apr 2021 10:06:37 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37s5xtgqf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 10:06:36 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 138E3sg7026542;
 Thu, 8 Apr 2021 14:06:35 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 37rw2pgf0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 14:06:35 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 138E6YYf26280260
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Apr 2021 14:06:34 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB5FBC605D;
 Thu,  8 Apr 2021 14:06:33 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2730C6070;
 Thu,  8 Apr 2021 14:06:33 +0000 (GMT)
Received: from localhost (unknown [9.211.35.170])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  8 Apr 2021 14:06:33 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 5/5] powerpc/rtas: rename RTAS_RMOBUF_MAX to
 RTAS_USER_REGION_SIZE
Date: Thu,  8 Apr 2021 09:06:30 -0500
Message-Id: <20210408140630.205502-6-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408140630.205502-1-nathanl@linux.ibm.com>
References: <20210408140630.205502-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sQK0Guc3yvCUHT2-OwRwvrc7agW-QKfW
X-Proofpoint-ORIG-GUID: 1gAqQDYf5XhOmmjKmWb66LbfpR6I8ANu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_03:2021-04-08,
 2021-04-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104080099
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
 aneesh.kumar@linux.ibm.com, npiggin@gmail.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RTAS_RMOBUF_MAX doesn't actually describe a "maximum" value in any
sense. It represents the size of an area of memory set aside for user
space to use as work areas for certain RTAS calls.

Rename it to RTAS_USER_REGION_SIZE.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h | 6 +++---
 arch/powerpc/kernel/rtas-proc.c | 2 +-
 arch/powerpc/kernel/rtas.c      | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 658448ca5b8a..9dc97d2f9d27 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -19,8 +19,8 @@
 #define RTAS_UNKNOWN_SERVICE (-1)
 #define RTAS_INSTANTIATE_MAX (1ULL<<30) /* Don't instantiate rtas at/above this value */
 
-/* Buffer size for ppc_rtas system call. */
-#define RTAS_RMOBUF_MAX (64 * 1024)
+/* Memory set aside for sys_rtas to use with calls that need a work area. */
+#define RTAS_USER_REGION_SIZE (64 * 1024)
 
 /* RTAS return status codes */
 #define RTAS_BUSY		-2    /* RTAS Busy */
@@ -357,7 +357,7 @@ extern void rtas_take_timebase(void);
 static inline int page_is_rtas_user_buf(unsigned long pfn)
 {
 	unsigned long paddr = (pfn << PAGE_SHIFT);
-	if (paddr >= rtas_rmo_buf && paddr < (rtas_rmo_buf + RTAS_RMOBUF_MAX))
+	if (paddr >= rtas_rmo_buf && paddr < (rtas_rmo_buf + RTAS_USER_REGION_SIZE))
 		return 1;
 	return 0;
 }
diff --git a/arch/powerpc/kernel/rtas-proc.c b/arch/powerpc/kernel/rtas-proc.c
index d2b0d99824a4..6857a5b0a1c3 100644
--- a/arch/powerpc/kernel/rtas-proc.c
+++ b/arch/powerpc/kernel/rtas-proc.c
@@ -767,6 +767,6 @@ static int ppc_rtas_tone_volume_show(struct seq_file *m, void *v)
  */
 static int ppc_rtas_rmo_buf_show(struct seq_file *m, void *v)
 {
-	seq_printf(m, "%016lx %x\n", rtas_rmo_buf, RTAS_RMOBUF_MAX);
+	seq_printf(m, "%016lx %x\n", rtas_rmo_buf, RTAS_USER_REGION_SIZE);
 	return 0;
 }
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 24dc7bc463a8..6bada744402b 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -987,10 +987,10 @@ static struct rtas_filter rtas_filters[] __ro_after_init = {
 static bool in_rmo_buf(u32 base, u32 end)
 {
 	return base >= rtas_rmo_buf &&
-		base < (rtas_rmo_buf + RTAS_RMOBUF_MAX) &&
+		base < (rtas_rmo_buf + RTAS_USER_REGION_SIZE) &&
 		base <= end &&
 		end >= rtas_rmo_buf &&
-		end < (rtas_rmo_buf + RTAS_RMOBUF_MAX);
+		end < (rtas_rmo_buf + RTAS_USER_REGION_SIZE);
 }
 
 static bool block_rtas_call(int token, int nargs,
@@ -1202,7 +1202,7 @@ void __init rtas_initialize(void)
 	if (firmware_has_feature(FW_FEATURE_LPAR))
 		rtas_region = min(ppc64_rma_size, RTAS_INSTANTIATE_MAX);
 #endif
-	rtas_rmo_buf = memblock_phys_alloc_range(RTAS_RMOBUF_MAX, PAGE_SIZE,
+	rtas_rmo_buf = memblock_phys_alloc_range(RTAS_USER_REGION_SIZE, PAGE_SIZE,
 						 0, rtas_region);
 	if (!rtas_rmo_buf)
 		panic("ERROR: RTAS: Failed to allocate %lx bytes below %pa\n",
-- 
2.30.2

