Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 814405F9738
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 05:42:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mm4W238KCz3dwf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 14:42:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YYIcUWyb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YYIcUWyb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mm4Tl2ntVz3ds0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 14:41:47 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29A3PJ7G023472;
	Mon, 10 Oct 2022 03:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Oe341oHzOp5iovx308hWmfUjKuenBV4d+93vQnpF6tc=;
 b=YYIcUWybqWWXy49VWE6Fmg2KcwT7svyaAuy1zo17hM/wbKjGvadQH2EO8uQdYpA+XivG
 QsMjOxf7kuYCLm1mHTaQ/DRlN6iqvCI9kevuJaGWSEd3XmJX6hzhjrdk1FFI8Bjgp1L3
 iA2X79gAjdG7RSyMphtW8w6dHQ7dUlc2d2s8oMgora8Sm9SdkY47JWftby4J6n9uo3jA
 nNYcqNvuKBQ9Jyy22PrQ5JHjTKoGKQJ9bXB7jVTxRbXEMboF3iDk6aoK74HderZJ/GH0
 L03N2yFUv0kGDIf76exSDLS2ONy971gMNnBkVixtflgf0n8CQuHPAk1gKOc7iwLo+M7j NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3jgwfv9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 03:41:40 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29A3fejT014973;
	Mon, 10 Oct 2022 03:41:40 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3jgwfv9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 03:41:40 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29A3a1Mp006262;
	Mon, 10 Oct 2022 03:41:39 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma03dal.us.ibm.com with ESMTP id 3k30uacs7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 03:41:39 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29A3faVE9241156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Oct 2022 03:41:37 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A193958058;
	Mon, 10 Oct 2022 03:41:36 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3713158054;
	Mon, 10 Oct 2022 03:41:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.36.35])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Oct 2022 03:41:34 +0000 (GMT)
Message-ID: <aaad8813b4762a6753cfcd0b605a7574a5192ec7.camel@linux.ibm.com>
Subject: [PATCH v3] powerpc/pseries/vas: Add VAS IRQ primary handler
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, fbarrat@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Date: Sun, 09 Oct 2022 20:41:25 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CTGGRSfRAuQ8k80qp7CJr_gCg-5na0XD
X-Proofpoint-ORIG-GUID: _gCy55jL_rAldeV1bjsgmYf6QB-OsdBl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210100019
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

Increment pending_faults counter in IRQ handler and the bottom
thread handler will process all faults based on this counter.
In case if the another interrupt is received while the thread is
running, it will be processed using this counter. The synchronization
of top and bottom handlers will be done with IRQTF_RUNTHREAD flag
and will re-enter to bottom half if this flag is set.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
v3: Update pending_faults usage in changelog
v2: Use the pending_faults counter for the second interrupt and
    process it with the previous interrupt handling if its thread
    handler is executing.

 arch/powerpc/platforms/pseries/vas.c | 40 +++++++++++++++++++++++-----
 arch/powerpc/platforms/pseries/vas.h |  1 +
 2 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 1a2cbc156e8f..70f26efcc35a 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -200,16 +200,41 @@ static irqreturn_t pseries_vas_fault_thread_fn(int irq, void *data)
 	struct vas_user_win_ref *tsk_ref;
 	int rc;
 
-	rc = h_get_nx_fault(txwin->vas_win.winid, (u64)virt_to_phys(&crb));
-	if (!rc) {
-		tsk_ref = &txwin->vas_win.task_ref;
-		vas_dump_crb(&crb);
-		vas_update_csb(&crb, tsk_ref);
+	while (atomic_read(&txwin->pending_faults)) {
+		rc = h_get_nx_fault(txwin->vas_win.winid, (u64)virt_to_phys(&crb));
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
+	 * The thread hanlder will process this interrupt if it is
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
@@ -240,8 +265,9 @@ static int allocate_setup_window(struct pseries_vas_window *txwin,
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


