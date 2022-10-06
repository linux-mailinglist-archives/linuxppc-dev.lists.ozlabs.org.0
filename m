Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FAE5F6075
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 07:10:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjff66cTxz3cBP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:10:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fBN6T1CM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fBN6T1CM;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjfd855DFz2xJ0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 16:09:48 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2964ajmx038268;
	Thu, 6 Oct 2022 05:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=W9iaGZK7LOHe8pSKihMQmLthq/rAU72fSQmGnqDTjbg=;
 b=fBN6T1CMcqL1XrSscpK4wcj5JMqEEvrRzXr1N4TENmFz4GQ0COjlJL/rPdp8dDgjYkvu
 lKCg6zgBGAdX368hrGOjrOMq8BiGwmoj9ZITreOhTMUupBtMINHw2hm561vPspAb4iwe
 IvPnl08FzixW/8s59CBsuwkshOjEz9OeOl7K3qB/t6Dc4XghRmohorMny4juIXveaG8/
 Nns4RIIcxYKjKHmba9c0Bt+eNhNxoWOMCEHc8Yp8YnzvibcX9w7M9ifcy02fQqdvoh8K
 5JyLc71UmpYLJrm4VVg50/JqHMcQxDIBVFJv+T8LmFgULHtUJ7cPYZM9kgOQ34BMOrvW iA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k1qscs5k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 05:09:44 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 296577X0023698;
	Thu, 6 Oct 2022 05:09:43 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k1qscs5jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 05:09:43 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29655YZ0023853;
	Thu, 6 Oct 2022 05:09:42 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma05wdc.us.ibm.com with ESMTP id 3jxd69r4um-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 05:09:42 +0000
Received: from smtpav02.wdc07v.mail.ibm.com ([9.208.128.114])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29659e9S49414556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Oct 2022 05:09:40 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D57F58058;
	Thu,  6 Oct 2022 05:09:40 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A69075806C;
	Thu,  6 Oct 2022 05:09:38 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.36.35])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Oct 2022 05:09:38 +0000 (GMT)
Message-ID: <5c0451a598e64043eb89be977e7ae2e40d6a01a2.camel@linux.ibm.com>
Subject: [PATCH v2] powerpc/pseries/vas: Add VAS IRQ primary handler
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, fbarrat@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Date: Wed, 05 Oct 2022 22:09:28 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pUHVo-ry7Te3Sfp7idOXH_hcTw3tBais
X-Proofpoint-ORIG-GUID: X6lW3D5HfHl6Srokm44EYzN--Ew6n7Z8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-05_05,2022-10-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210060030
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


irq_default_primary_handler() can be used only with IRQF_ONESHOT
flag, but the flag disables IRQ before executing the thread handler
and enables it after the interrupt is handled. But this IRQ disable
sets the VAS IRQ OFF state in the hypervisor. In case if NX faults
during this window, the hypervisor will not deliver the fault
interrupt to the partition and the user space may wait continuously
for the CSB update. So use VAS specific IRQ handler instead of
calling the default primary handler.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
v2: Use the pending_faults counter for the second interrupt and
    process it with the previous interrupt handling if its thread
    handler is executing.

 arch/powerpc/platforms/pseries/vas.c | 41 +++++++++++++++++++++++-----
 arch/powerpc/platforms/pseries/vas.h |  1 +
 2 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 1a2cbc156e8f..93f87ac126df 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -200,16 +200,42 @@ static irqreturn_t pseries_vas_fault_thread_fn(int irq, void *data)
 	struct vas_user_win_ref *tsk_ref;
 	int rc;
 
-	rc = h_get_nx_fault(txwin->vas_win.winid, (u64)virt_to_phys(&crb));
-	if (!rc) {
-		tsk_ref = &txwin->vas_win.task_ref;
-		vas_dump_crb(&crb);
-		vas_update_csb(&crb, tsk_ref);
+	while (atomic_read(&txwin->pending_faults)) {
+		rc = h_get_nx_fault(txwin->vas_win.winid,
+				    (u64)virt_to_phys(&crb));
+		if (!rc) {
+			tsk_ref = &txwin->vas_win.task_ref;
+			vas_dump_crb(&crb);
+			vas_update_csb(&crb, tsk_ref);
+		}
+		atomic_dec(&txwin->pending_faults);
 	}
 
 	return IRQ_HANDLED;
 }
 
+/*
+ * irq_default_primary_handler() can be used only with IRQF_ONESHOT
+ * which disables IRQ before executing the thread handler and enables
+ * it after. But this disabling interrupt sets the VAS IRQ OFF
+ * state in the hypervisor. If the NX generates fault interrupt
+ * during this window, the hypervisor will not deliver this
+ * interrupt to the LPAR. So use VAS specific IRQ handler instead
+ * of calling the default primary handler.
+ */
+static irqreturn_t pseries_vas_irq_handler(int irq, void *data)
+{
+	struct pseries_vas_window *txwin = data;
+
+	/*
+	 * The thread hanlder can process this interrupt if it is
+	 * already running.
+	 */
+	atomic_inc(&txwin->pending_faults);
+
+	return IRQ_WAKE_THREAD;
+}
+
 /*
  * Allocate window and setup IRQ mapping.
  */
@@ -240,8 +266,9 @@ static int allocate_setup_window(struct pseries_vas_window *txwin,
 		goto out_irq;
 	}
 
-	rc = request_threaded_irq(txwin->fault_virq, NULL,
-				  pseries_vas_fault_thread_fn, IRQF_ONESHOT,
+	rc = request_threaded_irq(txwin->fault_virq,
+				  pseries_vas_irq_handler,
+				  pseries_vas_fault_thread_fn, 0,
 				  txwin->name, txwin);
 	if (rc) {
 		pr_err("VAS-Window[%d]: Request IRQ(%u) failed with %d\n",
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
index 333ffa2f9f42..a2cb12a31c17 100644
--- a/arch/powerpc/platforms/pseries/vas.h
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -132,6 +132,7 @@ struct pseries_vas_window {
 	u64 flags;
 	char *name;
 	int fault_virq;
+	atomic_t pending_faults; /* Number of pending faults */
 };
 
 int sysfs_add_vas_caps(struct vas_cop_feat_caps *caps);
-- 
2.26.3


