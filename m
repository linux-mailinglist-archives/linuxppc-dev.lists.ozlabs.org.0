Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7CE2F6DAD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 23:07:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGz1y6qCzzDsV6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 09:07:18 +1100 (AEDT)
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
 header.s=pp1 header.b=dD6or+bw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGysp0z8FzDsPw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 09:00:13 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10ELX8HT164655; Thu, 14 Jan 2021 17:00:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6193R1+9hpeZ7ZsIUovqXcGLvE1KQlNJhmFLZjR7lW0=;
 b=dD6or+bw31ttmR2BY9cV4BmNta0NqC1B8lxD4jrGqjMXBbOOJ9K4p2QFqT/HIgiEMg4D
 5L6Qcy2+mVaVsDz5ghlklzqzSg7kgkWMWiQmTg0uNzwgC+v/feTLMQl/ZM+eDJSBCrWw
 hMejAOMWduo+Z54ITgufpHpymClP+k/rMV37fI32EyuMdHs6l4U6fM/XZlDdJiELJmSB
 btfwTJ0sZSPlR/JYLdRz06S6FRN7kJfuLMlCVUzpoeEDtUjStaS2DzL/RNpDnxxngOrn
 kar3mnoquaAn0QiskaWgLhUy0+RrvJ7RmW+XKmm2s+ugKuZSVBfvmXBi6pVh/Z1tUM7a TA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 362wb7ss98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 17:00:09 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10ELwTqb015019;
 Thu, 14 Jan 2021 22:00:08 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 362cwme8gf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 22:00:08 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10EM06vt27918654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 22:00:06 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF81C78078;
 Thu, 14 Jan 2021 22:00:06 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAD4778063;
 Thu, 14 Jan 2021 22:00:06 +0000 (GMT)
Received: from localhost (unknown [9.163.36.68])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 14 Jan 2021 22:00:06 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/6] powerpc/rtas: move syscall filter setup into separate
 function
Date: Thu, 14 Jan 2021 16:00:02 -0600
Message-Id: <20210114220004.1138993-5-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114220004.1138993-1-nathanl@linux.ibm.com>
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_08:2021-01-14,
 2021-01-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101140124
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

Reduce conditionally compiled sections within rtas_initialize() by
moving the filter table initialization into its own function already
guarded by CONFIG_PPC_RTAS_FILTER. No behavior change intended.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 60fcf7f7b0b8..55f6aa170e57 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1051,6 +1051,16 @@ static bool block_rtas_call(int token, int nargs,
 	return true;
 }
 
+static void __init rtas_syscall_filter_init(void)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rtas_filters); i++) {
+		rtas_filters[i].token = rtas_token(rtas_filters[i].name);
+	}
+
+}
+
 #else
 
 static bool block_rtas_call(int token, int nargs,
@@ -1059,6 +1069,10 @@ static bool block_rtas_call(int token, int nargs,
 	return false;
 }
 
+static void __init rtas_syscall_filter_init(void)
+{
+}
+
 #endif /* CONFIG_PPC_RTAS_FILTER */
 
 /* We assume to be passed big endian arguments */
@@ -1162,9 +1176,6 @@ void __init rtas_initialize(void)
 	unsigned long rtas_region = RTAS_INSTANTIATE_MAX;
 	u32 base, size, entry;
 	int no_base, no_size, no_entry;
-#ifdef CONFIG_PPC_RTAS_FILTER
-	int i;
-#endif
 
 	/* Get RTAS dev node and fill up our "rtas" structure with infos
 	 * about it.
@@ -1203,11 +1214,7 @@ void __init rtas_initialize(void)
 	rtas_last_error_token = rtas_token("rtas-last-error");
 #endif
 
-#ifdef CONFIG_PPC_RTAS_FILTER
-	for (i = 0; i < ARRAY_SIZE(rtas_filters); i++) {
-		rtas_filters[i].token = rtas_token(rtas_filters[i].name);
-	}
-#endif
+	rtas_syscall_filter_init();
 }
 
 int __init early_init_dt_scan_rtas(unsigned long node,
-- 
2.29.2

