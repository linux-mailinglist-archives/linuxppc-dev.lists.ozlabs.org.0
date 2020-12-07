Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B72D1DBD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:51:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cqdp71j1GzDqbh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 09:51:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tEEJYfY2; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqcWh5MZLzDqFG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 08:53:36 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7LTOqS106700
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 16:53:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=e0yz9xwSwpMfU8avf+gQ1AZl5iKCfxzSTFRCONyeng0=;
 b=tEEJYfY2f0JixQf74qlN/GF2acuioJlsKg/QqC5ZpLuFL3kXMFPPMNbw4EQWQ4Ij9rpf
 zvCj2la1NfQSgyXt9nTmkABdmgQ4X2BefCd6dPQ+nqAv+OMLnzHbcz7/fNi8L/45nLEj
 6/LGsq/l4o9BZOgAFjBSYgkoivgzGAPn7qIRpQeXL4m95cQhwT92tL6oEb6tWg7AbvRU
 svlKQt5kCE8IyiNgjKaJOE81HpPbTlz3V8ds8S9ePuIxTUK3EsVCvNZCo/fpa4OTSzb6
 E3s4NxS/fA61wkdn0VywONlT4DDuJi5kVWEspUQWmJNIRYzWj6k3O9XjFES9DjaEbKjI Pg== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359s0r6csv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:53:33 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7LlOVF029278
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 21:53:33 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 3581u8x5v9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 21:53:33 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7LqIO032375324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 21:52:18 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A005AC059;
 Mon,  7 Dec 2020 21:52:18 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE901AC05B;
 Mon,  7 Dec 2020 21:52:17 +0000 (GMT)
Received: from localhost (unknown [9.160.57.67])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Dec 2020 21:52:17 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 23/28] powerpc/rtas: remove unused rtas_suspend_last_cpu()
Date: Mon,  7 Dec 2020 15:51:55 -0600
Message-Id: <20201207215200.1785968-24-nathanl@linux.ibm.com>
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
 priorityscore=1501
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 suspectscore=1 spamscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012070132
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
 arch/powerpc/kernel/rtas.c      | 43 ---------------------------------
 2 files changed, 44 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 97ccb40fb09f..332e1000ca0f 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -256,7 +256,6 @@ extern bool rtas_indicator_present(int token, int *maxindex);
 extern int rtas_set_indicator(int indicator, int index, int new_value);
 extern int rtas_set_indicator_fast(int indicator, int index, int new_value);
 extern void rtas_progress(char *s, unsigned short hex);
-extern int rtas_suspend_last_cpu(struct rtas_suspend_me_data *data);
 int rtas_ibm_suspend_me(int *fw_status);
 
 struct rtc_time;
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index aedd46967b99..9a7d1bba3ef7 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -830,49 +830,6 @@ void rtas_activate_firmware(void)
 
 static int ibm_suspend_me_token = RTAS_UNKNOWN_SERVICE;
 #ifdef CONFIG_PPC_PSERIES
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
 /**
  * rtas_call_reentrant() - Used for reentrant rtas calls
  * @token:	Token for desired reentrant RTAS call
-- 
2.28.0

