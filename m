Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA0B1CD029
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 05:08:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49L5V92B0czDqCb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 13:08:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49L5JN4n20zDqgf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 12:59:48 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04B2VqOk072727; Sun, 10 May 2020 22:59:40 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30ws444xve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 10 May 2020 22:59:39 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04B2Vw2u072919;
 Sun, 10 May 2020 22:59:38 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30ws444xup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 10 May 2020 22:59:38 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04B2tO3i018022;
 Mon, 11 May 2020 02:59:35 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 30wm55hd4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 02:59:35 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 04B2xWMT64160074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 May 2020 02:59:32 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CB8AAE04D;
 Mon, 11 May 2020 02:59:32 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AC45AE051;
 Mon, 11 May 2020 02:59:28 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.53.64])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 11 May 2020 02:59:28 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v5 03/16] powerpc/watchpoint: Introduce function to get nr
 watchpoints dynamically
Date: Mon, 11 May 2020 08:28:58 +0530
Message-Id: <20200511025911.212827-4-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511025911.212827-1-ravi.bangoria@linux.ibm.com>
References: <20200511025911.212827-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-10_11:2020-05-08,
 2020-05-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 mlxscore=0
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2005110014
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
Cc: apopple@linux.ibm.com, ravi.bangoria@linux.ibm.com, peterz@infradead.org,
 fweisbec@gmail.com, oleg@redhat.com, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, jolsa@kernel.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

So far we had only one watchpoint, so we have hardcoded HBP_NUM to 1.
But Power10 is introducing 2nd DAWR and thus kernel should be able to
dynamically find actual number of watchpoints supported by hw it's
running on. Introduce function for the same. Also convert HBP_NUM macro
to HBP_NUM_MAX, which will now represent maximum number of watchpoints
supported by Powerpc.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Reviewed-by: Michael Neuling <mikey@neuling.org>
---
 arch/powerpc/include/asm/cputable.h      | 6 +++++-
 arch/powerpc/include/asm/hw_breakpoint.h | 5 +++++
 arch/powerpc/include/asm/processor.h     | 2 +-
 arch/powerpc/kernel/hw_breakpoint.c      | 2 +-
 4 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 40a4d3c6fd99..c67b94f3334c 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -614,7 +614,11 @@ enum {
 };
 #endif /* __powerpc64__ */
 
-#define HBP_NUM 1
+/*
+ * Maximum number of hw breakpoint supported on powerpc. Number of
+ * breakpoints supported by actual hw might be less than this.
+ */
+#define HBP_NUM_MAX	1
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index f2f8d8aa8e3b..518b41eef924 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -43,6 +43,11 @@ struct arch_hw_breakpoint {
 #define DABR_MAX_LEN	8
 #define DAWR_MAX_LEN	512
 
+static inline int nr_wp_slots(void)
+{
+	return HBP_NUM_MAX;
+}
+
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 #include <linux/kdebug.h>
 #include <asm/reg.h>
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index bfa336fbcfeb..a71bdd6bc284 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -180,7 +180,7 @@ struct thread_struct {
 	int		fpexc_mode;	/* floating-point exception mode */
 	unsigned int	align_ctl;	/* alignment handling control */
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
-	struct perf_event *ptrace_bps[HBP_NUM];
+	struct perf_event *ptrace_bps[HBP_NUM_MAX];
 	/*
 	 * Helps identify source of single-step exception and subsequent
 	 * hw-breakpoint enablement
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 72f461bd70fb..4120349e2abe 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -38,7 +38,7 @@ static DEFINE_PER_CPU(struct perf_event *, bp_per_reg);
 int hw_breakpoint_slots(int type)
 {
 	if (type == TYPE_DATA)
-		return HBP_NUM;
+		return nr_wp_slots();
 	return 0;		/* no instruction breakpoints available */
 }
 
-- 
2.21.1

