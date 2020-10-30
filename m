Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1878929FAFB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 02:58:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMlpZ39tSzDqdp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 12:58:46 +1100 (AEDT)
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
 header.s=pp1 header.b=Uxe4z8dL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMkw950KrzDqkg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:18:33 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U12CDE010508
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=su9MjL6FPeUY4ZUXXkQlG11yBExMfKMsXTEbzomIW9o=;
 b=Uxe4z8dLF7goFQPqai5Uorhxb5LBxQuGJhf9El/j/RqYi0dTmPgrPBdJ5otNd9n1DaqX
 XvO5eMN2eixc1NEqwNDNZW0cbRs8MYlxfZ18LdqRYzmrMQOdlq+ncX2RFiYp+rt/pyGe
 kYwM2TP6MxjesC/A+MZpBCVhfZwWn2/CAo+PDrUjXRxuZSUrcJstBksPTqVEya+2fzm1
 9HM6OmA8N8DPSf1uIcfYvVBIRTCKx1BnxoGOhYxmZGAMG2/AmUEflnJSUktb24V2X2nl
 WdxaXkamo93IyqGvFDbnabS9/dpEBTAjj7YOF4vWvtnrVyCjgFnM2WGo2CnMW2+l2q4N tA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34fnh0e2fu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:31 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U1DDli009298
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:30 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 34cbw9dugs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:30 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09U1IKHR53019044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:18:20 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1A8278067;
 Fri, 30 Oct 2020 01:18:28 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B2AF7805F;
 Fri, 30 Oct 2020 01:18:28 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 01:18:27 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 24/29] powerpc/rtas: remove unused rtas_suspend_last_cpu()
Date: Thu, 29 Oct 2020 20:18:00 -0500
Message-Id: <20201030011805.1224603-25-nathanl@linux.ibm.com>
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
 bulkscore=0 spamscore=0
 mlxlogscore=972 lowpriorityscore=0 clxscore=1015 impostorscore=0
 suspectscore=1 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300001
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

rtas_suspend_last_cpu() is now unused, remove it and
__rtas_suspend_last_cpu() which also becomes unused.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h |  1 -
 arch/powerpc/kernel/rtas.c      | 45 ---------------------------------
 2 files changed, 46 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 86f5d07969e4..d405b4bd659b 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -256,7 +256,6 @@ extern bool rtas_indicator_present(int token, int *maxindex);
 extern int rtas_set_indicator(int indicator, int index, int new_value);
 extern int rtas_set_indicator_fast(int indicator, int index, int new_value);
 extern void rtas_progress(char *s, unsigned short hex);
-extern int rtas_suspend_last_cpu(struct rtas_suspend_me_data *data);
 int rtas_ibm_suspend_me(int *fw_status);
 int rtas_syscall_dispatch_ibm_suspend_me(u64 handle);
 
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 4445219e92ce..98ec9ffaa3b3 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -799,51 +799,6 @@ void rtas_os_term(char *str)
 }
 
 static int ibm_suspend_me_token = RTAS_UNKNOWN_SERVICE;
-#ifdef CONFIG_PPC_PSERIES
-static int __rtas_suspend_last_cpu(struct rtas_suspend_me_data *data, int wake_when_done)
-{
-	u16 slb_size = mmu_slb_size;
-	int rc = H_MULTI_THREADS_ACTIVE;
-	int cpu;
-
-	slb_set_size(SLB_MIN_SIZE);
-	printk(KERN_DEBUG "calling ibm,suspend-me on cpu %i\n", smp_processor_id());
-
-	while (rc == H_MULTI_THREADS_ACTIVE && !atomic_read(&data->done) &&
-	       !atomic_read(&data->error))
-		rc = rtas_call(data->token, 0, 1, NULL);
-
-	if (rc || atomic_read(&data->error)) {
-		printk(KERN_DEBUG "ibm,suspend-me returned %d\n", rc);
-		slb_set_size(slb_size);
-	}
-
-	if (atomic_read(&data->error))
-		rc = atomic_read(&data->error);
-
-	atomic_set(&data->error, rc);
-	pSeries_coalesce_init();
-
-	if (wake_when_done) {
-		atomic_set(&data->done, 1);
-
-		for_each_online_cpu(cpu)
-			plpar_hcall_norets(H_PROD, get_hard_smp_processor_id(cpu));
-	}
-
-	if (atomic_dec_return(&data->working) == 0)
-		complete(data->complete);
-
-	return rc;
-}
-
-int rtas_suspend_last_cpu(struct rtas_suspend_me_data *data)
-{
-	atomic_inc(&data->working);
-	return __rtas_suspend_last_cpu(data, 0);
-}
-
-#endif
 
 /**
  * rtas_activate_firmware() - Activate a new version of firmware.
-- 
2.25.4

