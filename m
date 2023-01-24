Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C884679B18
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 15:06:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1TKw2HGFz3cBh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 01:06:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ToCS2hy9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ToCS2hy9;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1THv2Kd8z3c6C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 01:04:58 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30OCvM6A024005;
	Tue, 24 Jan 2023 14:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FTtunXduS2gfISDiiXsxfc046Gj5h6yZSYJCS/vxCck=;
 b=ToCS2hy9gBhq5gMRuNhmH5Smgku8GIsLy5xaqyfwmn2sGh8pC12glCif762mVmXfXg/4
 4tj+5OeQQihSSo3crrVpeKgXzoTvUmPlKekkDeS32kvvrxkWYvyX8MCxQ9yb55kG0Jco
 +zfLyS9p8BpTEnrdA0Z9xeXdaLtDc3q3erGIOzK+fVxr2q1Y2kdoUpAvgFJaIK4LnSyM
 juk5joUi4LY6fKSLBK+cVIKEHgLxlop3leaiCt/laPgKWho4NW9iyP0kuF6r92UZX/6W
 J7JS7kBh2KfdMHjR3tvfHg+scNeUqBOXiQMV3GNU1L/5mF690kEuxaN2KvBdldTJqSZv Xg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3na838cebd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 14:04:54 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30OBDD6m029973;
	Tue, 24 Jan 2023 14:04:53 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3na838ceb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 14:04:53 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30OBeGgk019839;
	Tue, 24 Jan 2023 14:04:52 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3n87p771yk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 14:04:52 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30OE4oEU47448470
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jan 2023 14:04:51 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D854A58059;
	Tue, 24 Jan 2023 14:04:50 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B01C158043;
	Tue, 24 Jan 2023 14:04:50 +0000 (GMT)
Received: from localhost (unknown [9.163.30.189])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Jan 2023 14:04:50 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/4] powerpc/rtas: remove lock and args fields from global rtas struct
Date: Tue, 24 Jan 2023 08:04:47 -0600
Message-Id: <20230124140448.45938-4-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124140448.45938-1-nathanl@linux.ibm.com>
References: <20230124140448.45938-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k06H1Lx8k6uyKGcg3QAxLbThFPucp3B_
X-Proofpoint-ORIG-GUID: E_poGQtLAMWG9AYLCeVkaglOsDgN6QEL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301240127
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
Cc: ldufour@linux.ibm.com, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Only code internal to the RTAS subsystem needs access to the central
lock and parameter block. Remove these from the globally visible
'rtas' struct and make them file-static in rtas.c.

Some changed lines in rtas_call() lack appropriate spacing around
operators and cause checkpatch errors; fix these as well.

Suggested-by: Laurent Dufour <ldufour@linux.ibm.com>
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas-types.h |  2 --
 arch/powerpc/kernel/rtas.c            | 50 ++++++++++++++++-----------
 2 files changed, 29 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas-types.h b/arch/powerpc/include/asm/rtas-types.h
index 8df6235d64d1..f2ad4a96cbc5 100644
--- a/arch/powerpc/include/asm/rtas-types.h
+++ b/arch/powerpc/include/asm/rtas-types.h
@@ -18,8 +18,6 @@ struct rtas_t {
 	unsigned long entry;		/* physical address pointer */
 	unsigned long base;		/* physical address pointer */
 	unsigned long size;
-	arch_spinlock_t lock;
-	struct rtas_args args;
 	struct device_node *dev;	/* virtual address pointer */
 };
 
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index e60e2f5af7b9..0059bb2a8f04 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -60,9 +60,17 @@ static inline void do_enter_rtas(unsigned long args)
 	srr_regs_clobbered(); /* rtas uses SRRs, invalidate */
 }
 
-struct rtas_t rtas = {
-	.lock = __ARCH_SPIN_LOCK_UNLOCKED
-};
+struct rtas_t rtas;
+
+/*
+ * Nearly all RTAS calls need to be serialized. All uses of the
+ * default rtas_args block must hold rtas_lock.
+ *
+ * Exceptions to the RTAS serialization requirement (e.g. stop-self)
+ * must use a separate rtas_args structure.
+ */
+static arch_spinlock_t rtas_lock = __ARCH_SPIN_LOCK_UNLOCKED;
+static struct rtas_args rtas_args;
 
 DEFINE_SPINLOCK(rtas_data_buf_lock);
 EXPORT_SYMBOL_GPL(rtas_data_buf_lock);
@@ -90,13 +98,13 @@ static unsigned long lock_rtas(void)
 
 	local_irq_save(flags);
 	preempt_disable();
-	arch_spin_lock(&rtas.lock);
+	arch_spin_lock(&rtas_lock);
 	return flags;
 }
 
 static void unlock_rtas(unsigned long flags)
 {
-	arch_spin_unlock(&rtas.lock);
+	arch_spin_unlock(&rtas_lock);
 	local_irq_restore(flags);
 	preempt_enable();
 }
@@ -114,7 +122,7 @@ static void call_rtas_display_status(unsigned char c)
 		return;
 
 	s = lock_rtas();
-	rtas_call_unlocked(&rtas.args, 10, 1, 1, NULL, c);
+	rtas_call_unlocked(&rtas_args, 10, 1, 1, NULL, c);
 	unlock_rtas(s);
 }
 
@@ -386,7 +394,7 @@ static int rtas_last_error_token;
  *  most recent failed call to rtas.  Because the error text
  *  might go stale if there are any other intervening rtas calls,
  *  this routine must be called atomically with whatever produced
- *  the error (i.e. with rtas.lock still held from the previous call).
+ *  the error (i.e. with rtas_lock still held from the previous call).
  */
 static char *__fetch_rtas_last_error(char *altbuf)
 {
@@ -406,13 +414,13 @@ static char *__fetch_rtas_last_error(char *altbuf)
 	err_args.args[1] = cpu_to_be32(bufsz);
 	err_args.args[2] = 0;
 
-	save_args = rtas.args;
-	rtas.args = err_args;
+	save_args = rtas_args;
+	rtas_args = err_args;
 
-	do_enter_rtas(__pa(&rtas.args));
+	do_enter_rtas(__pa(&rtas_args));
 
-	err_args = rtas.args;
-	rtas.args = save_args;
+	err_args = rtas_args;
+	rtas_args = save_args;
 
 	/* Log the error in the unlikely case that there was one. */
 	if (unlikely(err_args.args[2] == 0)) {
@@ -534,7 +542,7 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 	va_list list;
 	int i;
 	unsigned long s;
-	struct rtas_args *rtas_args;
+	struct rtas_args *args;
 	char *buff_copy = NULL;
 	int ret;
 
@@ -559,21 +567,21 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 	s = lock_rtas();
 
 	/* We use the global rtas args buffer */
-	rtas_args = &rtas.args;
+	args = &rtas_args;
 
 	va_start(list, outputs);
-	va_rtas_call_unlocked(rtas_args, token, nargs, nret, list);
+	va_rtas_call_unlocked(args, token, nargs, nret, list);
 	va_end(list);
 
 	/* A -1 return code indicates that the last command couldn't
 	   be completed due to a hardware error. */
-	if (be32_to_cpu(rtas_args->rets[0]) == -1)
+	if (be32_to_cpu(args->rets[0]) == -1)
 		buff_copy = __fetch_rtas_last_error(NULL);
 
 	if (nret > 1 && outputs != NULL)
 		for (i = 0; i < nret-1; ++i)
-			outputs[i] = be32_to_cpu(rtas_args->rets[i+1]);
-	ret = (nret > 0)? be32_to_cpu(rtas_args->rets[0]): 0;
+			outputs[i] = be32_to_cpu(args->rets[i + 1]);
+	ret = (nret > 0) ? be32_to_cpu(args->rets[0]) : 0;
 
 	unlock_rtas(s);
 
@@ -1269,9 +1277,9 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 
 	flags = lock_rtas();
 
-	rtas.args = args;
-	do_enter_rtas(__pa(&rtas.args));
-	args = rtas.args;
+	rtas_args = args;
+	do_enter_rtas(__pa(&rtas_args));
+	args = rtas_args;
 
 	/* A -1 return code indicates that the last command couldn't
 	   be completed due to a hardware error. */
-- 
2.37.1

