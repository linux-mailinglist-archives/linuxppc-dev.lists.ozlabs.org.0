Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2A65EA1D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 19:09:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f6zg3kmtzDqR6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 03:09:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f6sP15gqzDqQy
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 03:04:24 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x63H2rxm067864
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 3 Jul 2019 13:04:21 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tgyg4aaw2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 13:04:20 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Wed, 3 Jul 2019 18:04:18 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 3 Jul 2019 18:04:15 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x63H4EDo47055080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jul 2019 17:04:14 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5A55AE056;
 Wed,  3 Jul 2019 17:04:13 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7088FAE053;
 Wed,  3 Jul 2019 17:04:12 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.84.138])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  3 Jul 2019 17:04:12 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 1/9] powerpc/pseries: Use macros for referring to the DTL
 enable mask
Date: Wed,  3 Jul 2019 22:33:54 +0530
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1562171646.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1562171646.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19070317-0012-0000-0000-0000032EE350
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070317-0013-0000-0000-00002168373C
Message-Id: <0bb01059d527cd90b1b639a195ce40e87f6fc468.1562171646.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-03_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=761 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907030207
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
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mingming Cao <mingming.cao@ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce macros to encode the DTL enable mask fields and use those
instead of hardcoding numbers.

Acked-by: Nathan Lynch <nathanl@linux.ibm.com>
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/lppaca.h      | 11 +++++++++++
 arch/powerpc/platforms/pseries/dtl.c   |  8 +-------
 arch/powerpc/platforms/pseries/lpar.c  |  2 +-
 arch/powerpc/platforms/pseries/setup.c |  2 +-
 4 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm/lppaca.h
index 806494283e2a..9837bb2b3e69 100644
--- a/arch/powerpc/include/asm/lppaca.h
+++ b/arch/powerpc/include/asm/lppaca.h
@@ -141,6 +141,17 @@ struct dtl_entry {
 #define DISPATCH_LOG_BYTES	4096	/* bytes per cpu */
 #define N_DISPATCH_LOG		(DISPATCH_LOG_BYTES / sizeof(struct dtl_entry))
 
+/*
+ * Dispatch trace log event enable mask:
+ *   0x1: voluntary virtual processor waits
+ *   0x2: time-slice preempts
+ *   0x4: virtual partition memory page faults
+ */
+#define DTL_LOG_CEDE		0x1
+#define DTL_LOG_PREEMPT		0x2
+#define DTL_LOG_FAULT		0x4
+#define DTL_LOG_ALL		(DTL_LOG_CEDE | DTL_LOG_PREEMPT | DTL_LOG_FAULT)
+
 extern struct kmem_cache *dtl_cache;
 
 /*
diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
index ab5de985a787..337378f3d1fd 100644
--- a/arch/powerpc/platforms/pseries/dtl.c
+++ b/arch/powerpc/platforms/pseries/dtl.c
@@ -27,13 +27,7 @@ struct dtl {
 };
 static DEFINE_PER_CPU(struct dtl, cpu_dtl);
 
-/*
- * Dispatch trace log event mask:
- * 0x7: 0x1: voluntary virtual processor waits
- *      0x2: time-slice preempts
- *      0x4: virtual partition memory page faults
- */
-static u8 dtl_event_mask = 0x7;
+static u8 dtl_event_mask = DTL_LOG_ALL;
 
 
 /*
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 73620dfb63a1..96c4677cf8ab 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -113,7 +113,7 @@ void vpa_init(int cpu)
 			pr_err("WARNING: DTL registration of cpu %d (hw %d) "
 			       "failed with %ld\n", smp_processor_id(),
 			       hwcpu, ret);
-		lppaca_of(cpu).dtl_enable_mask = 2;
+		lppaca_of(cpu).dtl_enable_mask = DTL_LOG_PREEMPT;
 	}
 }
 
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 8fa012a65a71..a643e45d0544 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -312,7 +312,7 @@ static int alloc_dispatch_logs(void)
 		pr_err("WARNING: DTL registration of cpu %d (hw %d) failed "
 		       "with %d\n", smp_processor_id(),
 		       hard_smp_processor_id(), ret);
-	get_paca()->lppaca_ptr->dtl_enable_mask = 2;
+	get_paca()->lppaca_ptr->dtl_enable_mask = DTL_LOG_PREEMPT;
 
 	return 0;
 }
-- 
2.22.0

