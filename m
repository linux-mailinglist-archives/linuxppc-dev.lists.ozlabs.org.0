Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF6B29FAF2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 02:57:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMlmc5WprzDqXq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 12:57:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jZU93C9f; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMkw848QGzDqkB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:18:32 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U11tcH157921
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zXyu783FmcB2w6crLYhGJf+XLU4795p0M4xyzhF8i8U=;
 b=jZU93C9foEiwNm8OktJ9G+Js3S1SVoM1jGvZ2XpXtyAgr8tSAw24xggqZDVbnNDlguR9
 O/JTll50harxnJcChN/fRo0UpydkOHG10TeS5wDRceYWOTnr/fCeeteWDif7r1um1dVz
 uaH8U5gC+fqrerNN2uuDZA8fO9vVWkHlg8ZIWgMzkOzYq8XpgJzzHVAVG3DypF01sg2i
 lkNsCWIYRjjIkRYfuapU2V4Urwc+U0a7C4xvjBuc36l4QCNjvONnmk61mpL0rPy2tKwr
 5xH/eD0pzj1m3LgZKNLVJRhaF26ZEsZwyQtEBHfdwsrLiTJ4iAY4SLtNjZ9aoS/385PV qw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34g3kkh5f2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:29 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U1Ggtf027844
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:29 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 34etf9fq86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:29 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09U1IK5X27656658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:18:20 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95CEC13605E;
 Fri, 30 Oct 2020 01:18:25 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 499EE136055;
 Fri, 30 Oct 2020 01:18:25 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 01:18:25 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 22/29] powerpc/rtas: remove rtas_suspend_cpu()
Date: Thu, 29 Oct 2020 20:17:58 -0500
Message-Id: <20201030011805.1224603-23-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201030011805.1224603-1-nathanl@linux.ibm.com>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_12:2020-10-29,
 2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 mlxlogscore=700
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 adultscore=0 suspectscore=1 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010300001
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

rtas_suspend_cpu() no longer has users; remove it and
__rtas_suspend_cpu() which now becomes unused as well.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h |  1 -
 arch/powerpc/kernel/rtas.c      | 52 ---------------------------------
 2 files changed, 53 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 1e695e553a36..86f5d07969e4 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -256,7 +256,6 @@ extern bool rtas_indicator_present(int token, int *maxindex);
 extern int rtas_set_indicator(int indicator, int index, int new_value);
 extern int rtas_set_indicator_fast(int indicator, int index, int new_value);
 extern void rtas_progress(char *s, unsigned short hex);
-extern int rtas_suspend_cpu(struct rtas_suspend_me_data *data);
 extern int rtas_suspend_last_cpu(struct rtas_suspend_me_data *data);
 int rtas_ibm_suspend_me(int *fw_status);
 int rtas_syscall_dispatch_ibm_suspend_me(u64 handle);
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 6fde38b488f7..4445219e92ce 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -843,58 +843,6 @@ int rtas_suspend_last_cpu(struct rtas_suspend_me_data *data)
 	return __rtas_suspend_last_cpu(data, 0);
 }
 
-static int __rtas_suspend_cpu(struct rtas_suspend_me_data *data, int wake_when_done)
-{
-	long rc = H_SUCCESS;
-	unsigned long msr_save;
-	int cpu;
-
-	atomic_inc(&data->working);
-
-	/* really need to ensure MSR.EE is off for H_JOIN */
-	msr_save = mfmsr();
-	mtmsr(msr_save & ~(MSR_EE));
-
-	while (rc == H_SUCCESS && !atomic_read(&data->done) && !atomic_read(&data->error))
-		rc = plpar_hcall_norets(H_JOIN);
-
-	mtmsr(msr_save);
-
-	if (rc == H_SUCCESS) {
-		/* This cpu was prodded and the suspend is complete. */
-		goto out;
-	} else if (rc == H_CONTINUE) {
-		/* All other cpus are in H_JOIN, this cpu does
-		 * the suspend.
-		 */
-		return __rtas_suspend_last_cpu(data, wake_when_done);
-	} else {
-		printk(KERN_ERR "H_JOIN on cpu %i failed with rc = %ld\n",
-		       smp_processor_id(), rc);
-		atomic_set(&data->error, rc);
-	}
-
-	if (wake_when_done) {
-		atomic_set(&data->done, 1);
-
-		/* This cpu did the suspend or got an error; in either case,
-		 * we need to prod all other other cpus out of join state.
-		 * Extra prods are harmless.
-		 */
-		for_each_online_cpu(cpu)
-			plpar_hcall_norets(H_PROD, get_hard_smp_processor_id(cpu));
-	}
-out:
-	if (atomic_dec_return(&data->working) == 0)
-		complete(data->complete);
-	return rc;
-}
-
-int rtas_suspend_cpu(struct rtas_suspend_me_data *data)
-{
-	return __rtas_suspend_cpu(data, 0);
-}
-
 #endif
 
 /**
-- 
2.25.4

