Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0F92D1D6B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:38:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqdW11KyvzDqFv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 09:38:05 +1100 (AEDT)
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
 header.s=pp1 header.b=ElMg6rk9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqcVD40DSzDqVQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 08:52:20 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7LXjXw109562
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 16:52:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UyeUTKspmErL3bJ9T/Y1+WjJTQ0R9eZLTtQS2j6Dr4U=;
 b=ElMg6rk9wWo+YmMMgsUxIXjIzORIJWvCbyEPXWaPrLz0SXwfsR7GiLwFUXGvkcbEqrlj
 Qcp66eBlCP+lmBUq1rT2s0ZfZwQy4wHJ5DKoP7mXbPW1mMyqibD2pfB79FAPnqqoDf7D
 qSqSI5pLnsBM7YMRksR7uslkNwus/Ca6N8SrxSJX8SIfXdY3YRFHKkL6CurIk247s9MR
 c8uvIEcXMI9c7cr5hyDNtxq6FwAVPFz4m/Upr2JXFmxe1Jru6H5Dc+83vIl76FnDMiu6
 tNtU8LKWdhiCu038L0jWm8H+rq4Ciz0+4f+nujNfSyWNWuUYi5WJi5vtQYzJviG4eH0g 5Q== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 359qunrag8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:52:18 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7LmIRg024604
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 21:52:17 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 3581u8ymwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 21:52:17 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7LqGPF25100580
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 21:52:16 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAB31AC05B;
 Mon,  7 Dec 2020 21:52:16 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C799AC059;
 Mon,  7 Dec 2020 21:52:16 +0000 (GMT)
Received: from localhost (unknown [9.160.57.67])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Dec 2020 21:52:16 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 21/28] powerpc/rtas: remove rtas_suspend_cpu()
Date: Mon,  7 Dec 2020 15:51:53 -0600
Message-Id: <20201207215200.1785968-22-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207215200.1785968-1-nathanl@linux.ibm.com>
References: <20201207215200.1785968-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_16:2020-12-04,
 2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=817 adultscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=1 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070132
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
index 9a6107ffe378..97ccb40fb09f 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -256,7 +256,6 @@ extern bool rtas_indicator_present(int token, int *maxindex);
 extern int rtas_set_indicator(int indicator, int index, int new_value);
 extern int rtas_set_indicator_fast(int indicator, int index, int new_value);
 extern void rtas_progress(char *s, unsigned short hex);
-extern int rtas_suspend_cpu(struct rtas_suspend_me_data *data);
 extern int rtas_suspend_last_cpu(struct rtas_suspend_me_data *data);
 int rtas_ibm_suspend_me(int *fw_status);
 
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 7e6024f570da..aedd46967b99 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -873,58 +873,6 @@ int rtas_suspend_last_cpu(struct rtas_suspend_me_data *data)
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
 /**
  * rtas_call_reentrant() - Used for reentrant rtas calls
  * @token:	Token for desired reentrant RTAS call
-- 
2.28.0

