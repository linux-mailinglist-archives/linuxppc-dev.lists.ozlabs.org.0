Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE655E5D79
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 10:29:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MY7k35rvPz3cCy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 18:29:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kv0HTYjn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kv0HTYjn;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MY7jK5fSXz3bYM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 18:28:53 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28M8SBmE032524;
	Thu, 22 Sep 2022 08:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gMPe8BzxwIlNHb76SL1MdAhtv0k3ZRJX7IXx4iLb/ug=;
 b=kv0HTYjnc2gdPo6aTPO2ftIVpig4n6oif0CRbXMIFLXYTG0OEwRw7dNTycS1IbBpOA5C
 5IIzA9xBobnOfDGJAi/6JvPh8a66YoZTZsuvz3cJdDxPXUN72qlw0/0Q83WEhbKuJEJ0
 9jgN/mQb+LVprUJiXYyizoY/62vMDWnm0nLp0VjrPty1DpT+PGM8P+NEtQyIdUkMGQPg
 HWVBF32TQWpbz6++z59cMgp6RY3miYiaLbLbeQmQ27/vdqIbpQnu0TXTk0z3BUmZnAl1
 HHDdMQBm55j9DhO0u/+aC5oAF86Suc9Fpce7T9fS2j8VoT5PCgUrzYkoG1AS2c18zqt9 Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jrkhw19rq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 08:28:49 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28M86qgL017084;
	Thu, 22 Sep 2022 08:28:49 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jrkhw19r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 08:28:49 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28M8KQK0012202;
	Thu, 22 Sep 2022 08:28:48 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma01dal.us.ibm.com with ESMTP id 3jn5va7872-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 08:28:48 +0000
Received: from smtpav05.dal12v.mail.ibm.com ([9.208.128.132])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28M8SipL41877884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Sep 2022 08:28:44 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6388358052;
	Thu, 22 Sep 2022 08:28:45 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 582605804C;
	Thu, 22 Sep 2022 08:28:44 +0000 (GMT)
Received: from sig-9-77-146-251.ibm.com (unknown [9.77.146.251])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Sep 2022 08:28:44 +0000 (GMT)
Message-ID: <897083190a81b35433643e4fc7b3b246a8c455f9.camel@linux.ibm.com>
Subject: [PATCH] powerpc/pseries/vas: Add VAS IRQ primary handler
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, fbarrat@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Date: Thu, 22 Sep 2022 01:28:34 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: w-0jzgKnSr-JQWv9J4YhOW1bsmgmQX4x
X-Proofpoint-ORIG-GUID: 37W-N5g8MuwiHEK5GCvT-OtmL4NrT2Tm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_04,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=978 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209220053
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
 arch/powerpc/platforms/pseries/vas.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 7e6e6dd2e33e..fe33bdb620d5 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -210,6 +210,20 @@ static irqreturn_t pseries_vas_fault_thread_fn(int irq, void *data)
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
+	return IRQ_WAKE_THREAD;
+}
+
 /*
  * Allocate window and setup IRQ mapping.
  */
@@ -240,8 +254,9 @@ static int allocate_setup_window(struct pseries_vas_window *txwin,
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
-- 
2.26.3


